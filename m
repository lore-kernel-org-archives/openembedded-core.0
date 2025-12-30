Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D81EE57C6
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:55 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71925.1767125571068232179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jqV8EUjW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29f102b013fso127804135ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125570; x=1767730370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1evRFCdebDLwG4dmUqcsg96Sz9dh/EfHpusU6+zFRc=;
        b=jqV8EUjWa78YeEjnhbiy82WWeSnn0lf1r8azdhPgdlf1fxahg0ewhh70J/Nz/AIZZe
         km9VqqXDwdy6q1HTKrfaHSjVpA47VScfjc6VlfZeGtYj0iL/hPUJaf0L3DVRZmMXBs+V
         TNLTq6fa7bNyw7mE0sihQRQjShrUR+k7+mSJcY49oWcqkS8OEFYURSLdt7M/GsY11HY7
         DjitVaJVr28/kf2a5W3dRZhHGN5hDus85MrxbBZ+DTVDMtOJsHROgIw2V2/iI9tEltHl
         WPBpicIhRmhGvHOu/DYHGls7jVa2ypGyZEko/borM4KzCphvScIHKhsojktQAZ5KVuMU
         CXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125570; x=1767730370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n1evRFCdebDLwG4dmUqcsg96Sz9dh/EfHpusU6+zFRc=;
        b=cz7/SXszmCNH2I36/4iV34ilxE/5QCZehK4Murn9imCmOvfA71uyUxPRw+gWlm9aH3
         3fqXK4t1B7vzc6bf6ui0yZnxTfwzLjW3Uc4tOV0F+rPuUk7aKoUlSBPOfXnIbTLyFfAD
         M9QuggHzdWSVoGofFC3giBFl9o9576CACEt6Wv5WcEV9Z77fvSC15+Tx9pOEgiQzNlfO
         uL6jOnADBM5g+hP+F0IS6Ja1AC1lZdC9CY1RmqrShdmThe1gqx5nyURUBxRfDgumnWTT
         Iqn3BBw+2CHL5IwVgMbqHljnKim7rw7EKhHVVQyU/yKhTR7/zDrUbV2m4Q1r6UmfiwHh
         2Myw==
X-Gm-Message-State: AOJu0YwB3SUYNZaJN0mDJAZGjdyMy9jn8XAKmxCa7Fzuh1ngldntkXJh
	duZWY3p9Hq+bPz/iFLlVRpqVXzwV+j4bEBYBnNEa9Tej9fzEUahHMRW4YK0/eCoHoFE8pN+G0vj
	tSWFx
X-Gm-Gg: AY/fxX7r6/Uma+3k0ywdn5dpy1kM9U9eVirii7L6fHJv/0IBDLRYVQJAxiJexnHzMq3
	1ujOOkqQg3iXaYeP+ZHR/v4yUjDdbVrf+WLjlIa3+EhnwMcjaWYX2F5KHAeFpMMt82L92kw73F4
	3IA7vemgWyFEppPZMZf47VuU0QhHQOh/F9MCB7FIz8V9kIkNtpN1NWA53y/J/MSgfOWF6ouDZRJ
	NKNPLVYsdts/eVR1D7Eie4U1Ytg2nTbYuackJNmgIOUhEeD0AJNyk2Z+I9vvUXSNtf6ozHA3LdK
	ZQ2/+tWSKfD7J1wycbGwCqjjqbyjVJCFSiT2deEZasSQFfwhY08sldHcWu7uCPb+YzE6n8V8P8W
	g1UDv9aJaCt9UnDRoJdLUrw+wK+l89v/vdIQmdZECAZgLPB1qtfR+14ixivqwdnhqUld9dBtLqq
	XVWQ==
X-Google-Smtp-Source: AGHT+IHK7FFBo5dOjxUh4RjaZ3BF6/VkilwuaiKXEGB4v09iiWpEY6Q7/sxolRgvNGWaU++2K79XHg==
X-Received: by 2002:a17:903:228b:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-2a2f2c56453mr330581865ad.61.1767125570144;
        Tue, 30 Dec 2025 12:12:50 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 26/29] e2fsprogs: misc/create_inode.c: Fix for file larger than 2GB
Date: Tue, 30 Dec 2025 12:11:56 -0800
Message-ID: <673aaba93985f781ed78f703128f1b8b93fb1ff9.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228718

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


