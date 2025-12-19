Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD48D7494D
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9341.1766114598964436007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UPBjEYjl;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0a33d0585so12541215ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114598; x=1766719398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxCzfxRK/WvCRyfKuM1NMkP23vDjrm/5r7syXignUjA=;
        b=UPBjEYjlP5eTps1oqexun9H9orCaVY3VLb2027bRX7NIAlzZg2J2opFVPz5KuzQiWf
         Xv1wu5pUXXw+x5iEGGnjyvYRufdPoABg+vGk+jLcDijzhod6r6XbqBL41Ayb6o/q6oBS
         L/L/rT+lkZbmHzLwC7JO3za7RvKuBahMmzOJboMMZIkeugFN2G+1nEedmPXZX6z33O5P
         gUpHsZTrD++rV1OIZBpBmr8yjPrIA1S68ljIpSjSOJWk2RoNB6MLaN8Vvx75i9r/Ovwm
         v1Azl5g3Rvf07GjxaccfjHfNYZVuAyk4wMLE94aIFw6FhedyjxG3V26DSKnGpgNUfGyn
         mg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114598; x=1766719398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bxCzfxRK/WvCRyfKuM1NMkP23vDjrm/5r7syXignUjA=;
        b=Fxbw0EdQkjhbbHHcPumjbsX7Il2eYHIeH73jxYG9k/IpqMi5o6gacFInHxCOZHW4a3
         Ds/qMYTuY3v/eVCP8DlLksnu6grNCsJZng4L3sbOjScs9W5TNZ4Tdzk4Z4M3FiyemstE
         HmOdaXqtjeZhHBKSFtIH4P/nufZcTovLdHQ+cVGe5GJm2p7XByyQE4yqM+/2WzgdfB3x
         AWwQVWOe8nGN1cJ6dL0TNUz4SQK8mEcxiofE9B/BgZiBhPQ+8Jwu92hgIbsuCZsgST5I
         e+z95KwHSGmU/JB1CTw5Ga+LJUkSgQa/vxHsgFK1fl6kxPc7W5+1HlrUq7wc/0Mf0lWo
         6EzQ==
X-Gm-Message-State: AOJu0YwRW5IiExmZgcKNTEGNUCBqFmnYyCptTHkYo2niz9wFY+UGNBg3
	BViPCYEdH0D9kh5e4e9QVW9luskz/ylMPGkMvEMjOOo/DA96HEu1QVdpJXMdfA==
X-Gm-Gg: AY/fxX4kK7eoSIVFUc75t2dr45tt17ciDf31IJt0zAyc14RP8lYSzKc3y6mp1y04ubN
	Mhv+QfAjKAixeBIB8MuUjY3lZ/o/9bUfW+dmB8mTSisHZjXT+c+xF8iRaGnCcimo3QA/uHWfE+c
	eMlc0Fi27a0/O6MkKXSTidddlLciFbSM3Vrw3uUtTTWJB2SJTIh67YL3/sZAU6/wLwkLydZzKrV
	mBvbe6KHrkg/wRwF2eHF+WZaRKC82qLXyNPZVRz47+0G1MDzljPPkUci5upL9T5pzfTzqCM0LX+
	Nm+SzN4DAisE80ugSGYxFA0SewD5nWwHwth7xthVHCS0s/Y0mpbW7vqoBzPF00TLtSmnKmYIBzX
	e6Ol+kh8WXK5pcNXqY2UaioOd+hDNOvSJGCE855wy6ZzP/dSVtsIRtSDze3ch6ICbe8iGeVx6fM
	TV/HRX7kyt39daVYJc4TA7bLaaDCeJycyYD5M=
X-Google-Smtp-Source: AGHT+IFOGgzJOYgHo8syaoxuCS8MqnWOGq/s4yNtMMxc2g291uh/xiNQA0dHjlBOh76rOFmEr1yMlw==
X-Received: by 2002:a17:903:19e8:b0:29e:93be:fe50 with SMTP id d9443c01a7336-2a2f283d881mr14074565ad.42.1766114598131;
        Thu, 18 Dec 2025 19:23:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:23:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 23/29] e2fsprogs: misc/create_inode.c: Fix for file larger than 2GB
Date: Fri, 19 Dec 2025 08:52:02 +0530
Message-ID: <20251219032209.960840-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228191

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

