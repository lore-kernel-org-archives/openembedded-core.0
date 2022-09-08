Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AB4ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 02:28:58 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.719.1662604136514465913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ru5mTs0E;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id y127so16496257pfy.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=/pQqXLnhPItLBlohaQ35ipbCBve6/lZ1Kq9qMH8kyM4=;
        b=ru5mTs0EgfzlIh5rNgGmfb6CBv8eHjPKzLVnbXJlJ/ZdeNei2v0Po/QF8Cr2O0hq39
         /HNo/l5PoIMz5scC9xo8kDLFU9DZ1Rs7Ybm4Qt3qSHHEmv6nBB794NN9TvR3SQQDdkcA
         RO9BZwt/gYToN0Q7gZIhBnmHkxJ0IF4jUwywKHgSL3L58pwtltg8sJjyVAgjvN7qAB4x
         GYiX7TNsfjCRRi3d4YTPcNs+WFPOSTtk27/UFalHUT+abatBdXSBmEkHlLt7SO8ZWeOQ
         b4tPdCj+kVV/9XoKnrz182YzZCKSFChdEYD+xgULMkH9DGoCQUai2j6qeer8VybWlNWS
         wl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/pQqXLnhPItLBlohaQ35ipbCBve6/lZ1Kq9qMH8kyM4=;
        b=PJQAHpPdl7HCqld+CwZFVhCq2nG4do/WMtI+ozSW4d7w++SrnafrsktanK9XB+j+KF
         VLdMw4nLZaTsWeGTSKLHYeITMkNG3gld8pfZlDfDeFGtfnFEBqCuW7jbFsQ6GNCQrRrO
         VuUfUwINdDYkvehmXNpZvyoVdYyu5Gxe1JuN5ZpIzjOhfPBIOfsVVg36ApCOaLWieUKO
         THXDGmqzBLY7Wrtqj3tD7rsI4Ry687fG1VOUApr6Q6UruWrLwx50i+GAwX2NpYcW/GEB
         ItK/0767V1uMVj9mULws6Eqpvipqdbn+4LCaUMx6X1s0S4WyNL1RDDl/KN3diq1FATbt
         2MVw==
X-Gm-Message-State: ACgBeo393k9qmPgQrEW0VAeTPq963dg2wUqATTBFaoD/Fs+SXnaIGcsR
	yUQg8UlHmUW6Q2OsTGm/8HvF8icXvt13f7zl
X-Google-Smtp-Source: 
 AA6agR7Qu2c+fwm16leYarJWV0rVyjnPer1YMaLOw3hV+HaWN3tetmchdpxkTeevyYeJ7QBnyXS6pA==
X-Received: by 2002:a05:6a00:d4b:b0:53f:4690:d31 with SMTP id
 n11-20020a056a000d4b00b0053f46900d31mr1951780pfv.73.1662604135443;
        Wed, 07 Sep 2022 19:28:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 b11-20020a170902d50b00b0016c0c82e85csm1901398plg.75.2022.09.07.19.28.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 19:28:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/7] libarchive: Fix CVE-2021-31566 issue
Date: Wed,  7 Sep 2022 16:28:29 -1000
Message-Id: 
 <7028803d7d10c0b041a7bda16f9d9261f220459f.1662603861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662603861.git.steve@sakoman.com>
References: <cover.1662603861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 02:28:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170443

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix CVE-2021-31566 issue for libarchive
Link: http://deb.debian.org/debian/pool/main/liba/libarchive/libarchive_3.4.3-2+deb11u1.debian.tar.xz

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2021-31566-01.patch        |  23 +++
 .../libarchive/CVE-2021-31566-02.patch        | 172 ++++++++++++++++++
 .../libarchive/libarchive_3.4.2.bb            |   2 +
 3 files changed, 197 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-01.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-02.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-01.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-01.patch
new file mode 100644
index 0000000000..c4a2fb612c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-01.patch
@@ -0,0 +1,23 @@
+Description: Never follow symlinks when setting file flags on Linux
+ Published as CVE-2021-31566
+Origin: upstream, https://github.com/libarchive/libarchive/commit/e2ad1a2c3064fa9eba6274b3641c4c1beed25c0b
+Bug-Debian: https://bugs.debian.org/1001990
+Author: Martin Matuska <martin@matuska.org>
+Last-Update: 2021-12-20
+
+CVE: CVE-2021-31566
+Upstream-Status: Backport [http://deb.debian.org/debian/pool/main/liba/libarchive/libarchive_3.4.3-2+deb11u1.debian.tar.xz]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+--- a/libarchive/archive_write_disk_posix.c
++++ b/libarchive/archive_write_disk_posix.c
+@@ -3927,7 +3927,8 @@
+ 
+ 	/* If we weren't given an fd, open it ourselves. */
+ 	if (myfd < 0) {
+-		myfd = open(name, O_RDONLY | O_NONBLOCK | O_BINARY | O_CLOEXEC);
++		myfd = open(name, O_RDONLY | O_NONBLOCK | O_BINARY |
++		    O_CLOEXEC | O_NOFOLLOW);
+ 		__archive_ensure_cloexec_flag(myfd);
+ 	}
+ 	if (myfd < 0)
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-02.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-02.patch
new file mode 100644
index 0000000000..0dfcd1ac5c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-02.patch
@@ -0,0 +1,172 @@
+Description: Do not follow symlinks when processing the fixup list
+ Published as CVE-2021-31566
+Origin: upstream, https://github.com/libarchive/libarchive/commit/b41daecb5ccb4c8e3b2c53fd6147109fc12c3043
+Bug-Debian: https://bugs.debian.org/1001990
+Author: Martin Matuska <martin@matuska.org>
+Last-Update: 2021-12-20
+
+CVE: CVE-2021-31566
+Upstream-Status: Backport [http://deb.debian.org/debian/pool/main/liba/libarchive/libarchive_3.4.3-2+deb11u1.debian.tar.xz]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -556,6 +556,7 @@
+ 	libarchive/test/test_write_disk.c \
+ 	libarchive/test/test_write_disk_appledouble.c \
+ 	libarchive/test/test_write_disk_failures.c \
++	libarchive/test/test_write_disk_fixup.c \
+ 	libarchive/test/test_write_disk_hardlink.c \
+ 	libarchive/test/test_write_disk_hfs_compression.c \
+ 	libarchive/test/test_write_disk_lookup.c \
+--- a/libarchive/archive_write_disk_posix.c
++++ b/libarchive/archive_write_disk_posix.c
+@@ -2461,6 +2461,7 @@
+ {
+ 	struct archive_write_disk *a = (struct archive_write_disk *)_a;
+ 	struct fixup_entry *next, *p;
++	struct stat st;
+ 	int fd, ret;
+ 
+ 	archive_check_magic(&a->archive, ARCHIVE_WRITE_DISK_MAGIC,
+@@ -2478,6 +2479,20 @@
+ 		    (TODO_TIMES | TODO_MODE_BASE | TODO_ACLS | TODO_FFLAGS)) {
+ 			fd = open(p->name,
+ 			    O_WRONLY | O_BINARY | O_NOFOLLOW | O_CLOEXEC);
++			if (fd == -1) {
++				/* If we cannot lstat, skip entry */
++				if (lstat(p->name, &st) != 0)
++					goto skip_fixup_entry;
++				/*
++				 * If we deal with a symbolic link, mark
++				 * it in the fixup mode to ensure no
++				 * modifications are made to its target.
++				 */
++				if (S_ISLNK(st.st_mode)) {
++					p->mode &= ~S_IFMT;
++					p->mode |= S_IFLNK;
++				}
++			}
+ 		}
+ 		if (p->fixup & TODO_TIMES) {
+ 			set_times(a, fd, p->mode, p->name,
+@@ -2492,7 +2507,12 @@
+ 				fchmod(fd, p->mode);
+ 			else
+ #endif
+-			chmod(p->name, p->mode);
++#ifdef HAVE_LCHMOD
++			lchmod(p->name, p->mode);
++#else
++			if (!S_ISLNK(p->mode))
++				chmod(p->name, p->mode);
++#endif
+ 		}
+ 		if (p->fixup & TODO_ACLS)
+ 			archive_write_disk_set_acls(&a->archive, fd,
+@@ -2503,6 +2523,7 @@
+ 		if (p->fixup & TODO_MAC_METADATA)
+ 			set_mac_metadata(a, p->name, p->mac_metadata,
+ 					 p->mac_metadata_size);
++skip_fixup_entry:
+ 		next = p->next;
+ 		archive_acl_clear(&p->acl);
+ 		free(p->mac_metadata);
+@@ -2643,6 +2664,7 @@
+ 	fe->next = a->fixup_list;
+ 	a->fixup_list = fe;
+ 	fe->fixup = 0;
++	fe->mode = 0;
+ 	fe->name = strdup(pathname);
+ 	return (fe);
+ }
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -208,6 +208,7 @@
+     test_write_disk.c
+     test_write_disk_appledouble.c
+     test_write_disk_failures.c
++    test_write_disk_fixup.c
+     test_write_disk_hardlink.c
+     test_write_disk_hfs_compression.c
+     test_write_disk_lookup.c
+--- /dev/null
++++ b/libarchive/test/test_write_disk_fixup.c
+@@ -0,0 +1,77 @@
++/*-
++ * Copyright (c) 2021 Martin Matuska
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++#include "test.h"
++
++/*
++ * Test fixup entries don't follow symlinks
++ */
++DEFINE_TEST(test_write_disk_fixup)
++{
++	struct archive *ad;
++	struct archive_entry *ae;
++	int r;
++
++	if (!canSymlink()) {
++		skipping("Symlinks not supported");
++		return;
++	}
++
++	/* Write entries to disk. */
++	assert((ad = archive_write_disk_new()) != NULL);
++
++	/*
++	 * Create a file
++	 */
++	assertMakeFile("victim", 0600, "a");
++
++	/*
++	 * Create a directory and a symlink with the same name
++	 */
++
++	/* Directory: dir */
++        assert((ae = archive_entry_new()) != NULL);
++        archive_entry_copy_pathname(ae, "dir");
++        archive_entry_set_mode(ae, AE_IFDIR | 0606);
++	assertEqualIntA(ad, 0, archive_write_header(ad, ae));
++	assertEqualIntA(ad, 0, archive_write_finish_entry(ad));
++        archive_entry_free(ae);
++
++	/* Symbolic Link: dir -> foo */
++	assert((ae = archive_entry_new()) != NULL);
++	archive_entry_copy_pathname(ae, "dir");
++	archive_entry_set_mode(ae, AE_IFLNK | 0777);
++	archive_entry_set_size(ae, 0);
++	archive_entry_copy_symlink(ae, "victim");
++	assertEqualIntA(ad, 0, r = archive_write_header(ad, ae));
++	if (r >= ARCHIVE_WARN)
++		assertEqualIntA(ad, 0, archive_write_finish_entry(ad));
++	archive_entry_free(ae);
++
++	assertEqualInt(ARCHIVE_OK, archive_write_free(ad));
++
++	/* Test the entries on disk. */
++	assertIsSymlink("dir", "victim", 0);
++	assertFileMode("victim", 0600);
++}
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
index d8ed80686b..7d2e7b711b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -37,6 +37,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2021-36976-2.patch \
            file://CVE-2021-36976-3.patch \
            file://CVE-2021-23177.patch \
+           file://CVE-2021-31566-01.patch \
+           file://CVE-2021-31566-02.patch \
 "
 
 SRC_URI[md5sum] = "d953ed6b47694dadf0e6042f8f9ff451"
-- 
2.25.1


