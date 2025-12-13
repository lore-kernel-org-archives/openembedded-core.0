Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B029AD5B152
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:59 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2928.1765620169882973935
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eg6YVL4w;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0834769f0so8808345ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620169; x=1766224969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxCzfxRK/WvCRyfKuM1NMkP23vDjrm/5r7syXignUjA=;
        b=Eg6YVL4w/CaWsk7sdvi5lLBZZo/oVPZ770h5+1k/EJVXBUb4xnJ/adhFwhS2Ut/L+a
         JKElYcrggHf1AAPwwS9pdGk0S1UIACvHegruWMiwhinqul83DL4u/j8RZmzyfoYpLbWE
         WPAzkr1gyaJBrbv3WxQ8AGHlVGojzeUov73dKJ82spbBKvoG4VnJy+GjpeCloXcF8qV8
         9KEaBj1n04m2f8dARKCQ4nYWt+zXFxRdBwYpm65vHhTRXgzotps4XZiQLhYeYsPyNToI
         f2qd6H3zFnhi+UK2nEz6W9a37W+0s0kVb6VHQjAOwwhAwnarvwXAHsKjEVgTOwtQdLHr
         HdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620169; x=1766224969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bxCzfxRK/WvCRyfKuM1NMkP23vDjrm/5r7syXignUjA=;
        b=eeaTSp8hR5luBoyl3iSKxlw/6qMysk/ErOURrig2sixjkJYcqA7rQBmd2KZMMzTA4S
         nsfI/1qp6ahbtoPBPWvd8nGkMTssEYJWtxvLJQSuC7HSPt2CYbwIzer4UkW/Fwig58kt
         bxn8CU6v9l/+FjS3ZOdAHmhEbbGUTLNzpsrxv3GbAY/RFvoMJ8qi/gqbAt2XHsOpuHQR
         Km0jbCNswjAbO3rwtlu47dV/zMCjDApZlHFVzIL0rf+U4hic0SZEwNMAasMqMjsRbuIR
         q0g5JVdCegwCXfpriNoWxvBBo7fzrAgL12suI8LyO+WUBndWwSLqsXBMlnUL0kr6Cr6Q
         hfFg==
X-Gm-Message-State: AOJu0YzLgdiNGcl/TX7LRg2jbN79Z+ZKVz41oEpK4eZ+0SzlW9V5vOFk
	3w2gi/DQTKc8QlYCCSXgEcTUCbVEDPkA60OfhCwTl63Iz5AjNgNLEAIVOtjFt4vR
X-Gm-Gg: AY/fxX5dDYGYzfGN7BVvRTwCM5W3WUD4b3ORSZ90695VL3JrBB6Wi3HbAmWxpAYZySc
	qirVa7dckM56BnmCODxdmfI/gVtVzoKM7ucr4kU6fW15omtdBzuJ53f97OzJ0+KkGkC1pRUwaVF
	3WZnJYitWGuAROtGjUwqZ8pZl+CbLw1IWdGO0k3ByAdVgHcs66bmrmcK9NdMsodCIUPh02nfzv1
	fYMh6OtxIX+NW9ejQspqLZLBqimh7XF7D0AR9WT5w0AAh89ARxwQ5dzhpn4w3Mewmn8392SuBMf
	67pl0tyN2gLZmICC2X6qZusLnu9Fe/4V8N0HtCFhICC0Wjmgx0snvo6PYhvqzsoObXclKXI1u1F
	KDbeC/aLP4m0TbdYZktamIgn4mm2RVCoJD1gHNC2TUJLErcQ08pTALUdSUbQVgDgd1wWN5qNsGB
	SGgTiTl5YTPZO0yjrICqi2cCeAj/X5OMQBf/Y=
X-Google-Smtp-Source: AGHT+IED9OVrCpfC7hDxCheAOWr0+Fm9ZPqInlbTZWAlqyCQL98Giw72xl1ucDhuWrswmoAvFOdkIQ==
X-Received: by 2002:a17:903:388d:b0:29d:9f5a:e0d1 with SMTP id d9443c01a7336-29f23e70d05mr51648475ad.27.1765620169029;
        Sat, 13 Dec 2025 02:02:49 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:48 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 67/67] e2fsprogs: misc/create_inode.c: Fix for file larger than 2GB
Date: Sat, 13 Dec 2025 15:29:31 +0530
Message-ID: <20251213095931.2571498-67-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227685

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
$ dd if=/dev/zero of=../image.ext4 bs=1M count=4k
$ dd if=/dev/random of=../rootfs/largefile bs=1M count=3k
$ ./misc/mke2fs -t ext4 -d ../rootfs/ ../image.ext4
__populate_fs: Ext2 file too big while writing file "largefile"
mke2fs: Ext2 file too big while populating file system

This was because the offset is overflow, use __u64 to fix the problem.

Another code which uses ext2_off_t is copy_fs_verity_data(), but it only copies
the metadata, so it should be enough large for it, just leave it there.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 683a1e773899f3042458604b3f136861318c1028)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...inode.c-Fix-for-file-larger-than-2GB.patch | 40 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.47.3.bb             |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
new file mode 100644
index 0000000000..1c578022fb
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
@@ -0,0 +1,40 @@
+From 6359e0ec8ef249d202dbb8583a6e430f20c5b1a0 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 30 Nov 2025 21:47:50 +0800
+Subject: [PATCH] misc/create_inode.c: Fix for file larger than 2GB
+
+Fixed:
+$ dd if=/dev/zero of=../image.ext4 bs=1M count=4k
+$ dd if=/dev/random of=../rootfs/largefile bs=1M count=3k
+$ ./misc/mke2fs -t ext4 -d ../rootfs/ ../image.ext4
+__populate_fs: Ext2 file too big while writing file "largefile"
+mke2fs: Ext2 file too big while populating file system
+
+This was because the offset is overflow, use __u64 to fix the problem.
+
+Another code which uses ext2_off_t is copy_fs_verity_data(), but it only copies
+the metadata, so it should be enough large for it, just leave it there.
+
+Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/258]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/create_inode.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index 624efc03..14273534 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -414,7 +414,7 @@ static ssize_t my_pread(int fd, void *buf, size_t count, off_t offset)
+ }
+ #endif /* !defined HAVE_PREAD64 && !defined HAVE_PREAD */
+ 
+-static errcode_t write_all(ext2_file_t e2_file, ext2_off_t off, const char *buf, unsigned int n_bytes) {
++static errcode_t write_all(ext2_file_t e2_file, __u64 off, const char *buf, unsigned int n_bytes) {
+ 	errcode_t err = ext2fs_file_llseek(e2_file, off, EXT2_SEEK_SET, NULL);
+ 	if (err)
+ 		return err;
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
index 9b5c4dfde5..40658399d9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
+           file://0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \

