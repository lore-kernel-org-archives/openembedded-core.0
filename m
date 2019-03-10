Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7DC60053
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:11:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a188so2323280wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 13:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DFIRKgd5l9VaEPoUC8mXef0Fuu8G38gLtd8AvdY74Pk=;
	b=czeRm65Q/ext/9BSTNPsGZj4TkEl1PHdQkf1MYDbsbxrwK+kwqXycVoz45AF+yjHWH
	1u3rYsNbXT8w5lGo+csXQQCXkmfRehUdZdoaHPf1lfOQMq4EzqUrinECKWkLmvjpzYqQ
	bW3lgNiBfCDytKQrK9IczjFsiYHsowUkeu6i2cDOCui4f1Z031HhBD8rj/yJQFczx7h5
	0aoIcf31QwyuM1GavYPQFivaWcEMNUk/v6pedw+AvhIqrgiBKZ1TS8aSRFIMNlxuPndm
	KbovENhBH/XT4uidlBSaOTbOba1ee547JLYVzDJ/DHHiU+8eJVjIeVYtEZ67yrzOfrK8
	7ByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DFIRKgd5l9VaEPoUC8mXef0Fuu8G38gLtd8AvdY74Pk=;
	b=N8u/pszuAhbg2OvqdJ9ko2Jlc3zgXq3xzcz51MNHi1i2kghT7fYFQNMOnfeiPaw2LK
	uW6YwlKL6zVnCt8jeMo1e9+dhnCwp9MtElmmUKbiyrsMHReEl6vzS77CK0qIZvigyKDT
	PXyYSImAgLMhJD2lVeSO05/OqCliOB3hbuZaxjF2bX3/glwLB3PuUD4UbYa+6d1oHt6R
	/vrs7I95fbtB/WLmS4fNNTDt50rQLBLMGR/94NvwGYDwCojrzT3gBc9aJrCf02lGMVIx
	f/G1z+KyQLfxeeLcRvArv7MZsqNEaFLHixmzU81tHl+P9clZapXOgT9doE3M9Kz420EM
	AhdQ==
X-Gm-Message-State: APjAAAUhwou37Wsea3sq/RUaY/McN+x27lvfEwEF7YNCa0aBNnsOUisS
	5Uhk74xOu5r4S4kNrWOX8s+5mG4j
X-Google-Smtp-Source: APXvYqy0KO4aT0XNiMox+LDf/lXuZzNdn/ilDEBnrMvj1kh2N2PHXHP68OzcQhPsTzR/c0NRmP6bTA==
X-Received: by 2002:a1c:1a43:: with SMTP id a64mr15509368wma.73.1552248677674; 
	Sun, 10 Mar 2019 13:11:17 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	q135sm21825063wme.43.2019.03.10.13.11.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Mar 2019 13:11:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 20:11:19 +0000
Message-Id: <20190310201119.3269-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] grub: fix build with squashfs support enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Mar 2019 20:11:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../grub/files/fix.build.with.squashfs.patch  | 24 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/fix.build.with.squashfs.patch

diff --git a/meta/recipes-bsp/grub/files/fix.build.with.squashfs.patch b/meta/recipes-bsp/grub/files/fix.build.with.squashfs.patch
new file mode 100644
index 0000000000..2c2d2ea0b1
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/fix.build.with.squashfs.patch
@@ -0,0 +1,24 @@
+When squashfs support is enabled, the build fails with:
+
+../grub-2.02/grub-core/fs/squash4.c: In function 'direct_read':
+../grub-2.02/grub-core/fs/squash4.c:868:10: error: 'err' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+       if (err)
+          ^
+cc1: all warnings being treated as errors
+Makefile:7272: recipe for target 'grub-core/fs/libgrubmods_a-squash4.o' failed
+
+Upstream-Status: Pending (should be fixed in gnulib which is then rarely updated in grub)
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- grub-2.02/grub-core/fs/squash4.c	2019-03-10 20:00:14.070468728 +0000
++++ grub-2.02.fixed/grub-core/fs/squash4.c	2019-03-10 19:58:31.382477818 +0000
+@@ -746,7 +746,7 @@
+ 	     struct grub_squash_cache_inode *ino,
+ 	     grub_off_t off, char *buf, grub_size_t len)
+ {
+-  grub_err_t err;
++  grub_err_t err = 0;
+   grub_off_t cumulated_uncompressed_size = 0;
+   grub_uint64_t a = 0;
+   grub_size_t i;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 3f3165c264..c6994723f9 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -22,6 +22,7 @@ SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch \
            file://0001-grub-setup-Debug-message-cleanup.patch \
            file://disable-address-of-packed-member.patch \
+           file://fix.build.with.squashfs.patch \
 "
 SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
 SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
-- 
2.17.1


