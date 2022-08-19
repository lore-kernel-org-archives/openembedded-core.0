Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C97C00140
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:25 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.51215.1660877003090693380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HhWd5ePD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so3635840pjl.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=6mnlaCvz5OUk8Q0nft4PENQcW7yr78w357nP21sZkcc=;
        b=HhWd5ePDtppGZyP3bPOmgf+BBL6MLvBPYT5IyPjkAPkWAv8NGnQeXydGgUiA7hrN7O
         zNG8AswTPifL03nfy9lnnHrBs7rmJrbB85Dq3alGNCnqC2Oou/6jk1R40lFSjHk8pEfJ
         nVeSozevVcgiXkJsbgk3HGBE/mpFFK04HtFxmU+CfzBzdjDlP2ULniX1MMfnNjpiyUgP
         k7upoIIBs1TBp0Ch4as8XfmCUKhTtnaNayeaG3YAEElICeWd06WLLIEeeJqr3v/75E1S
         JV0Vy9iVr+EvoSxceLw+eQy7JcEoBfWGk8uJL0W1gUDDsZgR2qXq2SIvyCyJe0cYJ2Os
         WxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=6mnlaCvz5OUk8Q0nft4PENQcW7yr78w357nP21sZkcc=;
        b=HaPvWeTZ2tGEVVzsjmRH9JT43UIPifIY/TDE3VAfhLcYXQ55mps+FxUDPoVoSRK6lt
         ZQP2CwdXu44hwEH93dCpE4dM4Ei/p6Ci/unMlMQw/a4B8rXzaO04cyTQybavReZccN3X
         W2md9S5BPLbwnnvPPvZauPQ/FNJyMcR2tUoSl0ljpGTwsEWJmfcgXwF/ZsN4jlv71sHj
         XnhDBWyt5ffrO4VaFEgr0uk79/bE6ZMFA6GkKaoGbSg5UsipBt1Mq5YFLIC9GebEDSRD
         O1FJov7vZ6W8JM+tASlVEY8vOBy0BnqkQvuyGgu1RO/RhEqHqiFjtbBCbgiA/pdO3/5r
         Ys0A==
X-Gm-Message-State: ACgBeo3lV1+K2EEMV8+r8n8f22flojqMHE9pIh4BTKmNbptpkgmrM8mU
	kfA1gA07xhQ1SlhdmrS9flInjgGwOjntILJm
X-Google-Smtp-Source: 
 AA6agR6qp5zziVrhoH53xLaAb50iu/DphvkEoPMpiFYYotzlKzdEoR/n+3mJIV6I/SQqYBqylA1nZA==
X-Received: by 2002:a17:90a:982:b0:1ef:f525:9801 with SMTP id
 2-20020a17090a098200b001eff5259801mr6103168pjo.191.1660877002036;
        Thu, 18 Aug 2022 19:43:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/26] u-boot: fix CVE-2022-33103
Date: Thu, 18 Aug 2022 16:42:29 -1000
Message-Id: 
 <af701fde05f6c225a65223fddc6008c4d6444af1.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169550

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport patch to resolve CVE-2022-33103.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ..._read-Prevent-arbitrary-code-executi.patch | 80 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
new file mode 100644
index 0000000000..b1650f6baa
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
@@ -0,0 +1,80 @@
+From 65f1066f5abe291c7b10b6075fd60776074a38a9 Mon Sep 17 00:00:00 2001
+From: Miquel Raynal <miquel.raynal@bootlin.com>
+Date: Thu, 9 Jun 2022 16:02:06 +0200
+Subject: [PATCH] fs/squashfs: sqfs_read: Prevent arbitrary code execution
+
+Following Jincheng's report, an out-of-band write leading to arbitrary
+code execution is possible because on one side the squashfs logic
+accepts directory names up to 65535 bytes (u16), while U-Boot fs logic
+accepts directory names up to 255 bytes long.
+
+Prevent such an exploit from happening by capping directory name sizes
+to 255. Use a define for this purpose so that developers can link the
+limitation to its source and eventually kill it some day by dynamically
+allocating this array (if ever desired).
+
+Link: https://lore.kernel.org/all/CALO=DHFB+yBoXxVr5KcsK0iFdg+e7ywko4-e+72kjbcS8JBfPw@mail.gmail.com
+Reported-by: Jincheng Wang <jc.w4ng@gmail.com>
+Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
+Tested-by: Jincheng Wang <jc.w4ng@gmail.com>
+
+CVE: CVE-2022-33103
+Upstream-Status: Backport [2ac0baab4aff1a0b45067d0b62f00c15f4e86856]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ fs/squashfs/sqfs.c | 8 +++++---
+ include/fs.h       | 4 +++-
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
+index e2d91c654c..a145d754cc 100644
+--- a/fs/squashfs/sqfs.c
++++ b/fs/squashfs/sqfs.c
+@@ -973,6 +973,7 @@ int sqfs_readdir(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp)
+ 	int i_number, offset = 0, ret;
+ 	struct fs_dirent *dent;
+ 	unsigned char *ipos;
++	u16 name_size;
+ 
+ 	dirs = (struct squashfs_dir_stream *)fs_dirs;
+ 	if (!dirs->size) {
+@@ -1055,9 +1056,10 @@ int sqfs_readdir(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp)
+ 		return -SQFS_STOP_READDIR;
+ 	}
+ 
+-	/* Set entry name */
+-	strncpy(dent->name, dirs->entry->name, dirs->entry->name_size + 1);
+-	dent->name[dirs->entry->name_size + 1] = '\0';
++	/* Set entry name (capped at FS_DIRENT_NAME_LEN which is a U-Boot limitation) */
++	name_size = min_t(u16, dirs->entry->name_size + 1, FS_DIRENT_NAME_LEN - 1);
++	strncpy(dent->name, dirs->entry->name, name_size);
++	dent->name[name_size] = '\0';
+ 
+ 	offset = dirs->entry->name_size + 1 + SQFS_ENTRY_BASE_LENGTH;
+ 	dirs->entry_count--;
+diff --git a/include/fs.h b/include/fs.h
+index 1c79e299fd..6cb7ec89f4 100644
+--- a/include/fs.h
++++ b/include/fs.h
+@@ -161,6 +161,8 @@ int fs_write(const char *filename, ulong addr, loff_t offset, loff_t len,
+ #define FS_DT_REG  8         /* regular file */
+ #define FS_DT_LNK  10        /* symbolic link */
+ 
++#define FS_DIRENT_NAME_LEN 256
++
+ /**
+  * struct fs_dirent - directory entry
+  *
+@@ -181,7 +183,7 @@ struct fs_dirent {
+ 	/** change_time:	time of last modification */
+ 	struct rtc_time change_time;
+ 	/** name:		file name */
+-	char name[256];
++	char name[FS_DIRENT_NAME_LEN];
+ };
+ 
+ /* Note: fs_dir_stream should be treated as opaque to the user of fs layer */
+-- 
+2.33.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index f2443723e2..a6a15d698f 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -4,6 +4,7 @@ require u-boot.inc
 SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-riscv-fix-build-with-binutils-2.38.patch \
                    file://0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch \
+                   file://0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.25.1


