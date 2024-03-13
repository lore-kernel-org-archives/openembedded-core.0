Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43F5C54E78
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.2041.1710351228622243566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cQQa/3RJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-413ee589ed0so634515e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351227; x=1710956027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOjVmDprYwTe8IDMxAMGFeChuvf8boz4PqCtcCDL/+4=;
        b=cQQa/3RJ7Jmjz2CqzRigR2fF8pHAFqCKzhMX26gv0ejhvtKpYyzcXDzdSH9ySBevUO
         CSzGFfoRogoJLqXuZF1hqjlCLcF3+lvLup5KDHCywxmiMPKzgUApQPfzlDYE1MlIEGKN
         /jVlpDGad7nK95Vg3rt3u3vd/6KNrqunZLU2x7DiPcn4w2kwX8gRoSsL1lfhCnOHkgP5
         n5PcfzRK9SSESZA5bsD3nSJS63F3W/3iF7yrWjV0bbRNJ7+R5jD16VWY08yVHgqOPCj1
         35mCC/fNzWE3E159KMVQWjOpRtTBKA76RmfgSosmH9rnIaotlNFsSeRjl2a/kRL29kUN
         SJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351227; x=1710956027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOjVmDprYwTe8IDMxAMGFeChuvf8boz4PqCtcCDL/+4=;
        b=hyaokyAGGQe7jgmCTaiEA2LlI/8uevrDQLks1MdKC7B1Yv4EPbCy1OdiKmXT+wDws5
         e6jUJJN2JPqa7Dd+1ZJ2Mn0TeOTxGqprFNdfLpVp8yKVRX9eBLUsPbkL0sv7uqTprxUo
         itUhv+/i4//DJVwABRe7oJKzQaG6iSq95eZGR9qRUlzXA8jALUjszziwNFxNWj6STuqF
         pm6d0eFPgVd2bkT3r9gshA5kcYCl8nP7oEvelL6ljbDaFCjjfMysjsSRAKXg+T2bkEmn
         PgLnWwpgwfybMqYrwYKU7h5RolIZdossLNbzFH44tcqua06f5jnSVKiIGwotEkfkL0a5
         P9rQ==
X-Gm-Message-State: AOJu0Yy4G5pPpVnVorzON3tAcu9dv9fEhvUKPGA+pAhoSmJByhnbgxSY
	VKOD9tSHPEqj9IrwLONK5jiYhAk1Gd+iVkYkgGd8tMQDnJcCRNUzIS30aTpB
X-Google-Smtp-Source: AGHT+IHLvGhVfJefNubWSZB3QL5DyX+OZ4Zs5VqdLcACUbC0z/qMK2ghH10h8NeEjIVYpqLmvigNJw==
X-Received: by 2002:a05:600c:1d8e:b0:413:ef69:df65 with SMTP id p14-20020a05600c1d8e00b00413ef69df65mr197136wms.20.1710351226489;
        Wed, 13 Mar 2024 10:33:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/21] mdadm: update 4.2 -> 4.3
Date: Wed, 13 Mar 2024 18:33:26 +0100
Message-Id: <20240313173336.3900178-11-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197063

Drop a gigantic set of patches: either backports or
test fixups (which are no longer testable after exclusion of
mdadm from ptests).

Add musl fixes:
0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch
0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...anup-validate_geometry_ddf_container.patch | 148 ------
 ...sing-_Alignof-when-using-C11-or-newe.patch |  52 --
 ...parsing-of-r-in-monitor-manager-mode.patch |  74 ---
 ...-corosync-and-dlm-header-files-check.patch |   7 +-
 .../files/0001-Makefile-install-mdcheck.patch |   9 +-
 ...t-for-complete-rebuild-in-integrity-.patch |  53 --
 ...for-implicit-fallthrough-warning-sup.patch |  36 +-
 ...-fix-gcc-8-format-truncation-warning.patch |   7 +-
 ...-Fix-optional-write-behind-parameter.patch |  45 --
 ...-y-for-use-syslog-to-recive-event-re.patch |   9 +-
 ...01-mdadm-skip-test-11spare-migration.patch |  43 --
 ...h-Undefine-dprintf-before-redefining.patch |   6 +-
 ...FILE_OFFSET_BITS-to-enable-largefile.patch | 106 ++--
 ...d-a-test-that-validates-raid0-with-l.patch |  41 --
 ...-Run-udevadm-settle-before-setting-r.patch |  39 --
 ...ow-clear-the-superblock-at-every-ite.patch |  33 --
 ...metadata-avoid-passing-chunk-size-to.patch |  41 --
 ...n-files-for-04update-uuid-and-07reve.patch |  39 --
 ...ts-fix-raid0-tests-for-0.90-metadata.patch | 102 ----
 ...ts.h-include-for-NAME_MAX-definition.patch |  24 +
 ...-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch |  27 ++
 ...nter-dereference-in-validate_geometr.patch |  56 ---
 ...se-after-close-bug-by-closing-after-.patch |  91 ----
 ...gfault-when-calling-NULL-get_bad_blo.patch |  42 --
 ...Mark-and-ignore-broken-test-failures.patch | 128 -----
 ...dd-broken-files-for-all-broken-tests.patch | 454 ------------------
 .../mdadm/files/debian-no-Werror.patch        |  11 +-
 .../mdadm/files/include_sysmacros.patch       |  14 -
 .../files/mdadm-3.3.2_x32_abi_time_t.patch    |   7 +-
 .../mdadm/{mdadm_4.2.bb => mdadm_4.3.bb}      |  25 +-
 30 files changed, 160 insertions(+), 1609 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-parsing-of-r-in-monitor-manager-mode.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/include_sysmacros.patch
 rename meta/recipes-extended/mdadm/{mdadm_4.2.bb => mdadm_4.3.bb} (74%)

diff --git a/meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch b/meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch
deleted file mode 100644
index cea435f83b8..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From ca458f4dcc4de9403298f67543466ce4bbc8f8ae Mon Sep 17 00:00:00 2001
-From: Logan Gunthorpe <logang@deltatee.com>
-Date: Wed, 22 Jun 2022 14:25:07 -0600
-Subject: [PATCH 1/4] DDF: Cleanup validate_geometry_ddf_container()
-
-Move the function up so that the function declaration is not necessary
-and remove the unused arguments to the function.
-
-No functional changes are intended but will help with a bug fix in the
-next patch.
-
-Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
-Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
-
-Upstream-Status: Backport
-
-Reference to upstream patch:
-https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=679bd9508a30
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- super-ddf.c | 88 ++++++++++++++++++++++++-----------------------------
- 1 file changed, 39 insertions(+), 49 deletions(-)
-
-diff --git a/super-ddf.c b/super-ddf.c
-index 3f304cd..65cf727 100644
---- a/super-ddf.c
-+++ b/super-ddf.c
-@@ -503,13 +503,6 @@ struct ddf_super {
- static int load_super_ddf_all(struct supertype *st, int fd,
- 			      void **sbp, char *devname);
- static int get_svd_state(const struct ddf_super *, const struct vcl *);
--static int
--validate_geometry_ddf_container(struct supertype *st,
--				int level, int layout, int raiddisks,
--				int chunk, unsigned long long size,
--				unsigned long long data_offset,
--				char *dev, unsigned long long *freesize,
--				int verbose);
- 
- static int validate_geometry_ddf_bvd(struct supertype *st,
- 				     int level, int layout, int raiddisks,
-@@ -3322,6 +3315,42 @@ static int reserve_space(struct supertype *st, int raiddisks,
- 	return 1;
- }
- 
-+static int
-+validate_geometry_ddf_container(struct supertype *st,
-+				int level, int raiddisks,
-+				unsigned long long data_offset,
-+				char *dev, unsigned long long *freesize,
-+				int verbose)
-+{
-+	int fd;
-+	unsigned long long ldsize;
-+
-+	if (level != LEVEL_CONTAINER)
-+		return 0;
-+	if (!dev)
-+		return 1;
-+
-+	fd = dev_open(dev, O_RDONLY|O_EXCL);
-+	if (fd < 0) {
-+		if (verbose)
-+			pr_err("ddf: Cannot open %s: %s\n",
-+			       dev, strerror(errno));
-+		return 0;
-+	}
-+	if (!get_dev_size(fd, dev, &ldsize)) {
-+		close(fd);
-+		return 0;
-+	}
-+	close(fd);
-+	if (freesize) {
-+		*freesize = avail_size_ddf(st, ldsize >> 9, INVALID_SECTORS);
-+		if (*freesize == 0)
-+			return 0;
-+	}
-+
-+	return 1;
-+}
-+
- static int validate_geometry_ddf(struct supertype *st,
- 				 int level, int layout, int raiddisks,
- 				 int *chunk, unsigned long long size,
-@@ -3347,11 +3376,9 @@ static int validate_geometry_ddf(struct supertype *st,
- 		level = LEVEL_CONTAINER;
- 	if (level == LEVEL_CONTAINER) {
- 		/* Must be a fresh device to add to a container */
--		return validate_geometry_ddf_container(st, level, layout,
--						       raiddisks, *chunk,
--						       size, data_offset, dev,
--						       freesize,
--						       verbose);
-+		return validate_geometry_ddf_container(st, level, raiddisks,
-+						       data_offset, dev,
-+						       freesize, verbose);
- 	}
- 
- 	if (!dev) {
-@@ -3449,43 +3476,6 @@ static int validate_geometry_ddf(struct supertype *st,
- 	return 1;
- }
- 
--static int
--validate_geometry_ddf_container(struct supertype *st,
--				int level, int layout, int raiddisks,
--				int chunk, unsigned long long size,
--				unsigned long long data_offset,
--				char *dev, unsigned long long *freesize,
--				int verbose)
--{
--	int fd;
--	unsigned long long ldsize;
--
--	if (level != LEVEL_CONTAINER)
--		return 0;
--	if (!dev)
--		return 1;
--
--	fd = dev_open(dev, O_RDONLY|O_EXCL);
--	if (fd < 0) {
--		if (verbose)
--			pr_err("ddf: Cannot open %s: %s\n",
--			       dev, strerror(errno));
--		return 0;
--	}
--	if (!get_dev_size(fd, dev, &ldsize)) {
--		close(fd);
--		return 0;
--	}
--	close(fd);
--	if (freesize) {
--		*freesize = avail_size_ddf(st, ldsize >> 9, INVALID_SECTORS);
--		if (*freesize == 0)
--			return 0;
--	}
--
--	return 1;
--}
--
- static int validate_geometry_ddf_bvd(struct supertype *st,
- 				     int level, int layout, int raiddisks,
- 				     int *chunk, unsigned long long size,
--- 
-2.39.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-extended/mdadm/files/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
deleted file mode 100644
index 9e3a30be23f..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 82c893bb9e01f914a6bdef1bef943af746cfc3e1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Jan 2023 12:42:18 -0800
-Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
-
-WG14 N2350 made very clear that it is an UB having type definitions
-within "offsetof" [1]. This patch enhances the implementation of macro
-alignof_slot to use builtin "_Alignof" to avoid undefined behavior on
-when using std=c11 or newer
-
-clang 16+ has started to flag this [2]
-
-Fixes build when using -std >= gnu11 and using clang16+
-
-Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
-may support C11, exclude those compilers too
-
-[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
-[2] https://reviews.llvm.org/D133574
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-raid/20230118083236.24418-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sha1.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/sha1.c b/sha1.c
-index 89b32f4..1e4ad5d 100644
---- a/sha1.c
-+++ b/sha1.c
-@@ -229,7 +229,17 @@ sha1_process_bytes (const void *buffer, size_t len, struct sha1_ctx *ctx)
-   if (len >= 64)
-     {
- #if !_STRING_ARCH_unaligned
--# define alignof(type) offsetof (struct { char c; type x; }, x)
-+/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
-+   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
-+   clang versions < 8.0.0 have the same bug.  */
-+# if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
-+      || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
-+   && !defined __clang__) \
-+      || (defined __clang__ && __clang_major__ < 8))
-+#  define alignof(type) offsetof (struct { char c; type x; }, x)
-+# else
-+#  define alignof(type) _Alignof(type)
-+# endif
- # define UNALIGNED_P(p) (((size_t) p) % alignof (sha1_uint32) != 0)
-       if (UNALIGNED_P (buffer))
- 	while (len > 64)
--- 
-2.39.0
-
diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-parsing-of-r-in-monitor-manager-mode.patch b/meta/recipes-extended/mdadm/files/0001-Fix-parsing-of-r-in-monitor-manager-mode.patch
deleted file mode 100644
index 3fb46cc60a2..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-Fix-parsing-of-r-in-monitor-manager-mode.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 969fbb35e40100f599d4a9781911251f21792698 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 27 Jan 2022 17:53:01 +0800
-Subject: [PATCH] Fix parsing of "-r" in monitor/manager mode
-
-This revert commit 546047688e1 [mdadm: fix coredump of mdadm --monitor
--r], and fix the coredump issue of 'mdadm --monitor -r'.
-
-commit 546047688e1 make -r not work in manager mode, and testcase
-00multipath failed.
-
-Upstream-Status: Submitted [send to maintainer jsorensen@fb.com]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- ReadMe.c | 8 +++++---
- mdadm.c  | 2 ++
- mdadm.h  | 1 +
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/ReadMe.c b/ReadMe.c
-index 8139976..070eea5 100644
---- a/ReadMe.c
-+++ b/ReadMe.c
-@@ -81,11 +81,13 @@ char Version[] = "mdadm - v" VERSION " - " VERS_DATE EXTRAVERSION "\n";
-  *     found, it is started.
-  */
- 
--char short_options[]="-ABCDEFGIQhVXYWZ:vqbc:i:l:p:m:r:n:x:u:c:d:z:U:N:safRSow1tye:k";
-+char short_options[]="-ABCDEFGIQhVXYWZ:vqbc:i:l:p:m:n:x:u:c:d:z:U:N:sarfRSow1tye:k:";
- char short_bitmap_options[]=
--		"-ABCDEFGIQhVXYWZ:vqb:c:i:l:p:m:r:n:x:u:c:d:z:U:N:sarfRSow1tye:k:";
-+			"-ABCDEFGIQhVXYWZ:vqb:c:i:l:p:m:n:x:u:c:d:z:U:N:sarfRSow1tye:k:";
- char short_bitmap_auto_options[]=
--		"-ABCDEFGIQhVXYWZ:vqb:c:i:l:p:m:r:n:x:u:c:d:z:U:N:sa:rfRSow1tye:k:";
-+			"-ABCDEFGIQhVXYWZ:vqb:c:i:l:p:m:n:x:u:c:d:z:U:N:sa:rfRSow1tye:k:";
-+char short_increment_options[]=
-+			"-ABCDEFGIQhVXYWZ:vqbc:i:l:r:p:m:n:x:u:c:d:z:U:N:safRSow1tye:k:";
- 
- struct option long_options[] = {
-     {"manage",    0, 0, ManageOpt},
-diff --git a/mdadm.c b/mdadm.c
-index 26299b2..2a3b2ee 100644
---- a/mdadm.c
-+++ b/mdadm.c
-@@ -227,6 +227,7 @@ int main(int argc, char *argv[])
- 			shortopt = short_bitmap_auto_options;
- 			break;
- 		case 'F': newmode = MONITOR;
-+			shortopt = short_increment_options;
- 			break;
- 		case 'G': newmode = GROW;
- 			shortopt = short_bitmap_options;
-@@ -268,6 +269,7 @@ int main(int argc, char *argv[])
- 
- 		case NoSharing:
- 			newmode = MONITOR;
-+			shortopt = short_increment_options;
- 			break;
- 		}
- 		if (mode && newmode == mode) {
-diff --git a/mdadm.h b/mdadm.h
-index ecfc137..42148dd 100644
---- a/mdadm.h
-+++ b/mdadm.h
-@@ -421,6 +421,7 @@ enum mode {
- extern char short_options[];
- extern char short_bitmap_options[];
- extern char short_bitmap_auto_options[];
-+extern char short_increment_options[];
- extern struct option long_options[];
- extern char Version[], Usage[], Help[], OptionHelp[],
- 	*mode_help[],
diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
index 298f276cd67..fa1f0aa5204 100644
--- a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
@@ -1,4 +1,4 @@
-From a9166bf422da1001bac9cc819386bf39b7cd1b73 Mon Sep 17 00:00:00 2001
+From 76856a34a4e339e4a53b09d028f89fcc520e3127 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Tue, 9 Feb 2016 11:44:01 +0200
 Subject: [PATCH] Fix the path of corosync and dlm header files check
@@ -9,16 +9,15 @@ Fix it.
 Upstream-Status: Inappropriate [Yocto specific]
 
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
-
 ---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 2767ac6..46bf57b 100644
+index cbdba49..7bfd336 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -91,8 +91,8 @@ FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
+@@ -109,8 +109,8 @@ FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
  SYSTEMD_DIR=/lib/systemd/system
  LIB_DIR=/usr/libexec/mdadm
  
diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
index 3f76ef54d81..a4be1aa8a1c 100644
--- a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
@@ -1,4 +1,4 @@
-From 97e776724ab9763c5bca9816370bb1635b7a8232 Mon Sep 17 00:00:00 2001
+From 0be066d57a7dd1aead5488d0a095863608f2e559 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 25 Jan 2022 16:25:01 +0800
 Subject: [PATCH] Makefile: install mdcheck
@@ -14,10 +14,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile b/Makefile
-index 2a51d813..db40c7fd 100644
+index 1141971..f4059e2 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -303,6 +303,7 @@ install-systemd: systemd/mdmon@.service
+@@ -325,6 +325,7 @@ install-systemd: systemd/mdmon@.service
  install-bin: mdadm mdmon
  	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
  	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
@@ -25,6 +25,3 @@ index 2a51d813..db40c7fd 100644
  
  uninstall:
  	rm -f $(DESTDIR)$(MAN8DIR)/mdadm.8 $(DESTDIR)$(MAN8DIR)/mdmon.8 $(DESTDIR)$(MAN4DIR)/md.4 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5 $(DESTDIR)$(BINDIR)/mdadm
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch b/meta/recipes-extended/mdadm/files/0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch
deleted file mode 100644
index fb4bc165fbd..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 02a41c3fd560fb5250186dd6b3cff6b21daa2e2b Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Mon, 15 Jul 2019 14:12:24 +0800
-Subject: [PATCH] Revert "tests: wait for complete rebuild in integrity checks"
-
-This reverts commit e2a8e9dcf67a28bc722fa5ab2c49b0bc452d4d74
-as the logic "check state 'U*'" will make the test enters
-infinite loop especially in qemu env, so revert it to
-use the previous logic "check wait" which also used
-commonly by other tests such as tests/02r5grow, tests/07revert-grow
-and etc.
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-raid&m=156317157314030&w=2]
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- tests/01r5integ    | 2 +-
- tests/01raid6integ | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tests/01r5integ b/tests/01r5integ
-index 48676a2..ffb30ce 100644
---- a/tests/01r5integ
-+++ b/tests/01r5integ
-@@ -27,7 +27,7 @@ do
-      exit 1
-     fi
-     mdadm $md0 -a $i
--    while ! (check state 'U*'); do check wait; sleep 0.2; done
-+   check wait
-   done
-   mdadm -S $md0
- done
-diff --git a/tests/01raid6integ b/tests/01raid6integ
-index 12f4d81..c6fcdae 100644
---- a/tests/01raid6integ
-+++ b/tests/01raid6integ
-@@ -47,10 +47,10 @@ do
-          exit 1
-        fi
-        mdadm $md0 -a $first
--       while ! (check state 'U*_U*'); do check wait; sleep 0.2; done
-+       check wait
-     done
-     mdadm $md0 -a $second
--    while ! (check state 'U*'); do check wait; sleep 0.2; done
-+    check wait
-     totest="$totest $second"
-   done
-   mdadm -S $md0
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch b/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
index 12bf6a59207..16fdefbbd1c 100644
--- a/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
@@ -1,4 +1,4 @@
-From 37c35f94d9d95dbd2b5f8a919f5478be51453590 Mon Sep 17 00:00:00 2001
+From c29d086714b49a6d76ccca83b4a6fa2f139bad6e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 13 Oct 2017 10:27:34 -0700
 Subject: [PATCH] Use CC to check for implicit-fallthrough warning support
@@ -10,19 +10,35 @@ cross compile used for compiling mdadm is < version 7
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 ---
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 46bf57b..a075912 100644
+index 7bfd336..9ab6a65 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -53,7 +53,7 @@ ifdef WARN_UNUSED
- CWFLAGS += -Wp,-D_FORTIFY_SOURCE=2 -O3
+@@ -56,21 +56,21 @@ CWFLAGS += -Wp -O3
  endif
  
--FALLTHROUGH := $(shell gcc -v --help 2>&1 | grep "implicit-fallthrough" | wc -l)
-+FALLTHROUGH := $(shell ${CC} -v --help 2>&1 | grep "implicit-fallthrough" | wc -l)
- ifneq "$(FALLTHROUGH)"  "0"
- CWFLAGS += -Wimplicit-fallthrough=0
+ ifeq ($(origin FALLTHROUGH), undefined)
+-	FALLTHROUGH := $(shell gcc -Q --help=warnings 2>&1 | grep "implicit-fallthrough" | wc -l)
++	FALLTHROUGH := $(shell ${CC} -Q --help=warnings 2>&1 | grep "implicit-fallthrough" | wc -l)
+ 	ifneq "$(FALLTHROUGH)"  "0"
+ 	CWFLAGS += -Wimplicit-fallthrough=0
+ 	endif
  endif
+ 
+ ifeq ($(origin FORMATOVERFLOW), undefined)
+-	FORMATOVERFLOW := $(shell gcc -Q --help=warnings 2>&1 | grep "format-overflow" | wc -l)
++	FORMATOVERFLOW := $(shell ${CC} -Q --help=warnings 2>&1 | grep "format-overflow" | wc -l)
+ 	ifneq "$(FORMATOVERFLOW)"  "0"
+ 	CWFLAGS += -Wformat-overflow
+ 	endif
+ endif
+ 
+ ifeq ($(origin STRINGOPOVERFLOW), undefined)
+-	STRINGOPOVERFLOW := $(shell gcc -Q --help=warnings 2>&1 | grep "stringop-overflow" | wc -l)
++	STRINGOPOVERFLOW := $(shell ${CC} -Q --help=warnings 2>&1 | grep "stringop-overflow" | wc -l)
+ 	ifneq "$(STRINGOPOVERFLOW)"  "0"
+ 	CWFLAGS += -Wstringop-overflow
+ 	endif
diff --git a/meta/recipes-extended/mdadm/files/0001-fix-gcc-8-format-truncation-warning.patch b/meta/recipes-extended/mdadm/files/0001-fix-gcc-8-format-truncation-warning.patch
index fa9c8cc835a..3cf295106fb 100644
--- a/meta/recipes-extended/mdadm/files/0001-fix-gcc-8-format-truncation-warning.patch
+++ b/meta/recipes-extended/mdadm/files/0001-fix-gcc-8-format-truncation-warning.patch
@@ -1,4 +1,4 @@
-From 3158d3788c2e0fb75ace2c89840bd8a977fb4cb0 Mon Sep 17 00:00:00 2001
+From 78e5bb08971a5644a56af60d51ef35e13522e811 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 14 Dec 2018 15:12:31 +0800
 Subject: [PATCH] fix gcc-8 format-truncation warning
@@ -22,7 +22,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/super0.c b/super0.c
-index 756cab5..12c28da 100644
+index a7c5f81..a79b6bd 100644
 --- a/super0.c
 +++ b/super0.c
 @@ -229,7 +229,7 @@ static void examine_super0(struct supertype *st, char *homehost)
@@ -34,6 +34,3 @@ index 756cab5..12c28da 100644
  		int wonly, failfast;
  		if (d>=0) dp = &sb->disks[d];
  		else dp = &sb->this_disk;
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
deleted file mode 100644
index 186d1e76f27..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 41edf6f45895193f4a523cb0a08d639c9ff9ccc9 Mon Sep 17 00:00:00 2001
-From: Logan Gunthorpe <logang@deltatee.com>
-Date: Wed, 22 Jun 2022 14:25:12 -0600
-Subject: [PATCH] mdadm: Fix optional --write-behind parameter
-
-The commit noted below changed the behaviour of --write-behind to
-require an argument. This broke the 06wrmostly test with the error:
-
-  mdadm: Invalid value for maximum outstanding write-behind writes: (null).
-         Must be between 0 and 16383.
-
-To fix this, check if optarg is NULL before parising it, as the origial
-code did.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=41edf6f45895193f4a523cb0a08d639c9ff9ccc9]
-
-Fixes: 60815698c0ac ("Refactor parse_num and use it to parse optarg.")
-Cc: Mateusz Grzonka <mateusz.grzonka@intel.com>
-Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
-Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- mdadm.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/mdadm.c b/mdadm.c
-index d0c5e6de..56722ed9 100644
---- a/mdadm.c
-+++ b/mdadm.c
-@@ -1201,8 +1201,9 @@ int main(int argc, char *argv[])
- 		case O(BUILD, WriteBehind):
- 		case O(CREATE, WriteBehind):
- 			s.write_behind = DEFAULT_MAX_WRITE_BEHIND;
--			if (parse_num(&s.write_behind, optarg) != 0 ||
--			s.write_behind < 0 || s.write_behind > 16383) {
-+			if (optarg &&
-+			    (parse_num(&s.write_behind, optarg) != 0 ||
-+			     s.write_behind < 0 || s.write_behind > 16383)) {
- 				pr_err("Invalid value for maximum outstanding write-behind writes: %s.\n\tMust be between 0 and 16383.\n",
- 						optarg);
- 				exit(2);
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch
index e00287cab15..f224d0008d4 100644
--- a/meta/recipes-extended/mdadm/files/0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch
@@ -1,4 +1,4 @@
-From 5fdc0173cb4fcf8656f0889ad364d2549795607f Mon Sep 17 00:00:00 2001
+From c27e128fdc062ec3fcdf7b48a8c5078615c538df Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 1 Jul 2019 11:34:49 +0800
 Subject: [PATCH] mdadm: add option -y for use syslog to recive event report
@@ -14,15 +14,12 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/systemd/mdmonitor.service b/systemd/mdmonitor.service
-index 46f7b88..3fc4687 100644
+index 9c36478..d289846 100644
 --- a/systemd/mdmonitor.service
 +++ b/systemd/mdmonitor.service
-@@ -13,4 +13,4 @@ DefaultDependencies=no
+@@ -14,4 +14,4 @@ Documentation=man:mdadm(8)
  Environment=  MDADM_MONITOR_ARGS=--scan
  EnvironmentFile=-/run/sysconfig/mdadm
  ExecStartPre=-/usr/lib/mdadm/mdadm_env.sh
 -ExecStart=BINDIR/mdadm --monitor $MDADM_MONITOR_ARGS
 +ExecStart=BINDIR/mdadm --monitor -y $MDADM_MONITOR_ARGS
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch
deleted file mode 100644
index 84517caade0..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1b83afa7c3121f819e72ea74883f8b6d61d6548e Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 6 Sep 2019 10:59:02 +0800
-Subject: [PATCH] mdadm: skip test 11spare-migration
-
-11spare-migration is a test series to check mdadm Monitor migrates spares
-according to rules in /etc/mdadm.conf defined by POLICY lines.
-
-[snip]
-for scan in no yes; do
-       for platform in 1.2 imsm; do
-               try
-       done
-done
-[snip]
-
-"try" includes near 20 sub testcase, so there are nearly 80 subcases need to run,
-so it will take long time than ptest-runner timeout limit, skip it as workaround.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- test | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/test b/test
-index 711a3c7..880dd1d 100755
---- a/test
-+++ b/test
-@@ -272,6 +272,9 @@ main() {
- 	else
- 		for script in $testdir/$prefix $testdir/$prefix*[^~]
- 		do
-+			if [ $script == "$testdir/11spare-migration" ];then
-+				continue
-+			fi
- 			do_test $script
- 		done
- 	fi
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch b/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
index a1e7e59323b..52daea2a495 100644
--- a/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
@@ -1,4 +1,4 @@
-From b431cb4e1ed060122fa300dc0008f74080d38f73 Mon Sep 17 00:00:00 2001
+From 4dd5c2659722b44409cee28b4cea68cdeaa1f987 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 9 May 2016 22:03:57 +0000
 Subject: [PATCH] mdadm.h: Undefine dprintf before redefining
@@ -20,10 +20,10 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+)
 
 diff --git a/mdadm.h b/mdadm.h
-index 387e681..bb943bf 100644
+index 1f28b3e..04996e2 100644
 --- a/mdadm.h
 +++ b/mdadm.h
-@@ -1649,11 +1649,13 @@ static inline char *to_subarray(struct mdstat_ent *ent, char *container)
+@@ -1869,11 +1869,13 @@ static inline sighandler_t signal_s(int sig, sighandler_t handler)
  }
  
  #ifdef DEBUG
diff --git a/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch b/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
index 142ed355ef8..13435ee418f 100644
--- a/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
+++ b/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
@@ -1,4 +1,4 @@
-From 6b861a267a6ef6f60f6cc21e4c8e6d7cdd2451dc Mon Sep 17 00:00:00 2001
+From aa86de05cd6a75222b38e0789ac96fe00f705430 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 10 Nov 2022 12:31:22 -0800
 Subject: [PATCH] restripe.c: Use _FILE_OFFSET_BITS to enable largefile support
@@ -10,9 +10,57 @@ the width of types
 Upstream-Status: Submitted [https://lore.kernel.org/linux-raid/20221110225546.337164-1-raj.khem@gmail.com/]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- restripe.c | 13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
+ raid6check.c | 11 +++++++----
+ restripe.c   | 13 ++++++++-----
+ swap_super.c | 13 +++++++------
+ 3 files changed, 22 insertions(+), 15 deletions(-)
 
+diff --git a/raid6check.c b/raid6check.c
+index 9947776..8e7f142 100644
+--- a/raid6check.c
++++ b/raid6check.c
+@@ -22,6 +22,9 @@
+  *    Based on "restripe.c" from "mdadm" codebase
+  */
+ 
++/* Enable largefile support */
++#define _FILE_OFFSET_BITS 64
++
+ #include "mdadm.h"
+ #include <stdint.h>
+ #include <sys/mman.h>
+@@ -284,9 +287,9 @@ int manual_repair(int chunk_size, int syndrome_disks,
+ 	}
+ 
+ 	int write_res1, write_res2;
+-	off64_t seek_res;
++	off_t seek_res;
+ 
+-	seek_res = lseek64(source[fd1],
++	seek_res = lseek(source[fd1],
+ 			   offsets[fd1] + start * chunk_size, SEEK_SET);
+ 	if (seek_res < 0) {
+ 		fprintf(stderr, "lseek failed for failed_disk1\n");
+@@ -294,7 +297,7 @@ int manual_repair(int chunk_size, int syndrome_disks,
+ 	}
+ 	write_res1 = write(source[fd1], blocks[failed_slot1], chunk_size);
+ 
+-	seek_res = lseek64(source[fd2],
++	seek_res = lseek(source[fd2],
+ 			   offsets[fd2] + start * chunk_size, SEEK_SET);
+ 	if (seek_res < 0) {
+ 		fprintf(stderr, "lseek failed for failed_disk2\n");
+@@ -379,7 +382,7 @@ int check_stripes(struct mdinfo *info, int *source, unsigned long long *offsets,
+ 			goto exitCheck;
+ 		}
+ 		for (i = 0 ; i < raid_disks ; i++) {
+-			off64_t seek_res = lseek64(source[i], offsets[i] + start * chunk_size,
++			off_t seek_res = lseek(source[i], offsets[i] + start * chunk_size,
+ 						   SEEK_SET);
+ 			if (seek_res < 0) {
+ 				fprintf(stderr, "lseek to source %d failed\n", i);
+diff --git a/restripe.c b/restripe.c
+index a7a7229..1c03577 100644
 --- a/restripe.c
 +++ b/restripe.c
 @@ -22,6 +22,9 @@
@@ -25,7 +73,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "mdadm.h"
  #include <stdint.h>
  
-@@ -581,7 +584,7 @@ int save_stripes(int *source, unsigned l
+@@ -581,7 +584,7 @@ int save_stripes(int *source, unsigned long long *offsets,
  				       raid_disks, level, layout);
  			if (dnum < 0) abort();
  			if (source[dnum] < 0 ||
@@ -34,7 +82,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  				    offsets[dnum] + offset, 0) < 0 ||
  			    read(source[dnum], buf+disk * chunk_size,
  				 chunk_size) != chunk_size) {
-@@ -754,8 +757,8 @@ int restore_stripes(int *dest, unsigned
+@@ -754,8 +757,8 @@ int restore_stripes(int *dest, unsigned long long *offsets,
  					   raid_disks, level, layout);
  			if (src_buf == NULL) {
  				/* read from file */
@@ -45,7 +93,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  					rv = -1;
  					goto abort;
  				}
-@@ -816,7 +819,7 @@ int restore_stripes(int *dest, unsigned
+@@ -816,7 +819,7 @@ int restore_stripes(int *dest, unsigned long long *offsets,
  		}
  		for (i=0; i < raid_disks ; i++)
  			if (dest[i] >= 0) {
@@ -54,7 +102,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  					 offsets[i]+offset, 0) < 0) {
  					rv = -1;
  					goto abort;
-@@ -866,7 +869,7 @@ int test_stripes(int *source, unsigned l
+@@ -866,7 +869,7 @@ int test_stripes(int *source, unsigned long long *offsets,
  		int disk;
  
  		for (i = 0 ; i < raid_disks ; i++) {
@@ -63,48 +111,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  			    (read(source[i], stripes[i], chunk_size) !=
  			     chunk_size)) {
  				free(q);
---- a/raid6check.c
-+++ b/raid6check.c
-@@ -22,6 +22,9 @@
-  *    Based on "restripe.c" from "mdadm" codebase
-  */
- 
-+/* Enable largefile support */
-+#define _FILE_OFFSET_BITS 64
-+
- #include "mdadm.h"
- #include <stdint.h>
- #include <signal.h>
-@@ -279,9 +282,9 @@ int manual_repair(int chunk_size, int sy
- 	}
- 
- 	int write_res1, write_res2;
--	off64_t seek_res;
-+	off_t seek_res;
- 
--	seek_res = lseek64(source[fd1],
-+	seek_res = lseek(source[fd1],
- 			   offsets[fd1] + start * chunk_size, SEEK_SET);
- 	if (seek_res < 0) {
- 		fprintf(stderr, "lseek failed for failed_disk1\n");
-@@ -289,7 +292,7 @@ int manual_repair(int chunk_size, int sy
- 	}
- 	write_res1 = write(source[fd1], blocks[failed_slot1], chunk_size);
- 
--	seek_res = lseek64(source[fd2],
-+	seek_res = lseek(source[fd2],
- 			   offsets[fd2] + start * chunk_size, SEEK_SET);
- 	if (seek_res < 0) {
- 		fprintf(stderr, "lseek failed for failed_disk2\n");
-@@ -374,7 +377,7 @@ int check_stripes(struct mdinfo *info, i
- 			goto exitCheck;
- 		}
- 		for (i = 0 ; i < raid_disks ; i++) {
--			off64_t seek_res = lseek64(source[i], offsets[i] + start * chunk_size,
-+			off_t seek_res = lseek(source[i], offsets[i] + start * chunk_size,
- 						   SEEK_SET);
- 			if (seek_res < 0) {
- 				fprintf(stderr, "lseek to source %d failed\n", i);
+diff --git a/swap_super.c b/swap_super.c
+index b6db574..18c89e2 100644
 --- a/swap_super.c
 +++ b/swap_super.c
 @@ -1,3 +1,6 @@
diff --git a/meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch b/meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch
deleted file mode 100644
index 1c95834a7e4..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7539254342bc591717b0051734cc6c09c1b88640 Mon Sep 17 00:00:00 2001
-From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
-Date: Wed, 22 Jun 2022 14:25:13 -0600
-Subject: [PATCH] tests/00raid0: add a test that validates raid0 with layout
- fails for 0.9
-
-329dfc28debb disallows the creation of raid0 with layouts for 0.9
-metadata. This test confirms the new behavior.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=7539254342bc591717b0051734cc6c09c1b88640]
-
-Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
-Signed-off-by: Himanshu Madhani <himanshu.madhani@oracle.com>
-Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
-Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tests/00raid0 | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/tests/00raid0 b/tests/00raid0
-index 8bc18985..e6b21cc4 100644
---- a/tests/00raid0
-+++ b/tests/00raid0
-@@ -6,11 +6,9 @@ check raid0
- testdev $md0 3 $mdsize2_l 512
- mdadm -S $md0
- 
--# now with version-0.90 superblock
-+# verify raid0 with layouts fail for 0.90
- mdadm -CR $md0 -e0.90 -l0 -n4 $dev0 $dev1 $dev2 $dev3
--check raid0
--testdev $md0 4 $mdsize0 512
--mdadm -S $md0
-+check opposite_result
- 
- # now with no superblock
- mdadm -B $md0 -l0 -n5 $dev0 $dev1 $dev2 $dev3 $dev4
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch b/meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
deleted file mode 100644
index c621c082e80..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 39b381252c32275079344d30de18b76fda4bba26 Mon Sep 17 00:00:00 2001
-From: Logan Gunthorpe <logang@deltatee.com>
-Date: Wed, 27 Jul 2022 15:52:45 -0600
-Subject: [PATCH] tests/00readonly: Run udevadm settle before setting ro
-
-In some recent kernel versions, 00readonly fails with:
-
-  mdadm: failed to set readonly for /dev/md0: Device or resource busy
-  ERROR: array is not read-only!
-
-This was traced down to a race condition with udev holding a reference
-to the block device at the same time as trying to set it read only.
-
-To fix this, call udevadm settle before setting the array read only.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=39b381252c32275079344d30de18b76fda4bba26]
-
-Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
-Signed-off-by: Jes Sorensen <jsorensen@fb.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tests/00readonly | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/00readonly b/tests/00readonly
-index 39202487..afe243b3 100644
---- a/tests/00readonly
-+++ b/tests/00readonly
-@@ -12,6 +12,7 @@ do
- 			$dev1 $dev2 $dev3 $dev4 --assume-clean
- 		check nosync
- 		check $level
-+		udevadm settle
- 		mdadm -ro $md0
- 		check readonly
- 		state=$(cat /sys/block/md0/md/array_state)
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch b/meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch
deleted file mode 100644
index 1a7104b76dd..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a2c832465fc75202e244327b2081231dfa974617 Mon Sep 17 00:00:00 2001
-From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
-Date: Wed, 22 Jun 2022 14:25:16 -0600
-Subject: [PATCH] tests/02lineargrow: clear the superblock at every iteration
-
-This fixes 02lineargrow test as prior metadata causes --add operation
-to misbehave.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=a2c832465fc75202e244327b2081231dfa974617]
-
-Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
-Signed-off-by: Himanshu Madhani <himanshu.madhani@oracle.com>
-Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
-Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tests/02lineargrow | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tests/02lineargrow b/tests/02lineargrow
-index e05c219d..595bf9f2 100644
---- a/tests/02lineargrow
-+++ b/tests/02lineargrow
-@@ -20,4 +20,6 @@ do
-   testdev $md0 3 $sz 1
- 
-   mdadm -S $md0
-+  mdadm --zero /dev/loop2
-+  mdadm --zero /dev/loop3
- done
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch b/meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
deleted file mode 100644
index 9098fb25401..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From de045db607b1ac4b70fc2a8878463e029c2ab1dc Mon Sep 17 00:00:00 2001
-From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
-Date: Wed, 22 Jun 2022 14:25:15 -0600
-Subject: [PATCH] tests/04update-metadata: avoid passing chunk size to raid1
-
-'04update-metadata' test fails with error, "specifying chunk size is
-forbidden for this level" added by commit, 5b30a34aa4b5e. Hence,
-correcting the test to ignore passing chunk size to raid1.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=de045db607b1ac4b70fc2a8878463e029c2ab1dc]
-
-Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
-Signed-off-by: Himanshu Madhani <himanshu.madhani@oracle.com>
-[logang@deltatee.com: fix if/then style and dropped unrelated hunk]
-Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
-Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tests/04update-metadata | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/tests/04update-metadata b/tests/04update-metadata
-index 08c14af7..2b72a303 100644
---- a/tests/04update-metadata
-+++ b/tests/04update-metadata
-@@ -11,7 +11,11 @@ dlist="$dev0 $dev1 $dev2 $dev3"
- for ls in linear/4 raid1/1 raid5/3 raid6/2
- do
-   s=${ls#*/} l=${ls%/*}
--  mdadm -CR --assume-clean -e 0.90 $md0 --level $l -n 4 -c 64 $dlist
-+  if [[ $l == 'raid1' ]]; then
-+	mdadm -CR --assume-clean -e 0.90 $md0 --level $l -n 4 $dlist
-+  else
-+	mdadm -CR --assume-clean -e 0.90 $md0 --level $l -n 4 -c 64 $dlist
-+  fi
-   testdev $md0 $s 19904 64
-   mdadm -S $md0
-   mdadm -A $md0 --update=metadata $dlist
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch b/meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch
deleted file mode 100644
index 5a6bf9e4bdb..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ee594b1a12833c06102de888248a361bc49cea09 Mon Sep 17 00:00:00 2001
-From: Ovidiu Panait <ovidiu.panait@windriver.com>
-Date: Fri, 18 Aug 2023 12:20:40 +0300
-Subject: [PATCH] tests: add .broken files for 04update-uuid and
- 07revert-inplace
-
-04update-uuid and 07revert-inplace tests are unreliable and fail intermittently
-on the autobuilder. Unfortunately, the failures cannot be reproduced locally
-and the logs cannot be retrieved from the AB.
-
-Mark the testcases as BROKEN to skip them when running ptest.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- tests/04update-uuid.broken    | 1 +
- tests/07revert-inplace.broken | 1 +
- 2 files changed, 2 insertions(+)
- create mode 100644 tests/04update-uuid.broken
- create mode 100644 tests/07revert-inplace.broken
-
-diff --git a/tests/04update-uuid.broken b/tests/04update-uuid.broken
-new file mode 100644
-index 0000000..197b35b
---- /dev/null
-+++ b/tests/04update-uuid.broken
-@@ -0,0 +1 @@
-+fails infrequently
-diff --git a/tests/07revert-inplace.broken b/tests/07revert-inplace.broken
-new file mode 100644
-index 0000000..197b35b
---- /dev/null
-+++ b/tests/07revert-inplace.broken
-@@ -0,0 +1 @@
-+fails infrequently
--- 
-2.39.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch b/meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch
deleted file mode 100644
index d2e7d8ee502..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 14c2161edb77d7294199e8aa7daa9f9d1d0ad5d7 Mon Sep 17 00:00:00 2001
-From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
-Date: Wed, 22 Jun 2022 14:25:14 -0600
-Subject: [PATCH] tests: fix raid0 tests for 0.90 metadata
-
-Some of the test cases fail because raid0 creation fails with the error,
-"0.90 metadata does not support layouts for RAID0" added by commit,
-329dfc28debb. Fix some of the test cases by switching from raid0 to
-linear level for 0.9 metadata where possible.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=14c2161edb77d7294199e8aa7daa9f9d1d0ad5d7]
-
-Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
-Signed-off-by: Himanshu Madhani <himanshu.madhani@oracle.com>
-Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
-Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tests/00raid0           | 4 ++--
- tests/00readonly        | 4 ++++
- tests/03r0assem         | 6 +++---
- tests/04r0update        | 4 ++--
- tests/04update-metadata | 2 +-
- 5 files changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/tests/00raid0 b/tests/00raid0
-index e6b21cc4..9b8896cb 100644
---- a/tests/00raid0
-+++ b/tests/00raid0
-@@ -20,8 +20,8 @@ mdadm -S $md0
- # now same again with different chunk size
- for chunk in 4 32 256
- do
--  mdadm -CR $md0 -e0.90 -l raid0 --chunk $chunk -n3 $dev0 $dev1 $dev2
--  check raid0
-+  mdadm -CR $md0 -e0.90 -l linear --chunk $chunk -n3 $dev0 $dev1 $dev2
-+  check linear
-   testdev $md0 3 $mdsize0 $chunk
-   mdadm -S $md0
- 
-diff --git a/tests/00readonly b/tests/00readonly
-index 28b0fa13..39202487 100644
---- a/tests/00readonly
-+++ b/tests/00readonly
-@@ -4,6 +4,10 @@ for metadata in 0.9 1.0 1.1 1.2
- do
- 	for level in linear raid0 raid1 raid4 raid5 raid6 raid10
- 	do
-+		if [[ $metadata == "0.9" && $level == "raid0" ]];
-+		then
-+			continue
-+		fi
- 		mdadm -CR $md0 -l $level -n 4 --metadata=$metadata \
- 			$dev1 $dev2 $dev3 $dev4 --assume-clean
- 		check nosync
-diff --git a/tests/03r0assem b/tests/03r0assem
-index 6744e322..44df0645 100644
---- a/tests/03r0assem
-+++ b/tests/03r0assem
-@@ -68,9 +68,9 @@ mdadm -S $md2
- ### Now for version 0...
- 
- mdadm --zero-superblock $dev0 $dev1 $dev2
--mdadm -CR $md2 -l0 --metadata=0.90 -n3 $dev0 $dev1 $dev2
--check raid0
--tst="testdev $md2 3 $mdsize0 512"
-+mdadm -CR $md2 -llinear --metadata=0.90 -n3 $dev0 $dev1 $dev2
-+check linear
-+tst="testdev $md2 3 $mdsize0 1"
- $tst
- 
- uuid=`mdadm -Db $md2 | sed 's/.*UUID=//'`
-diff --git a/tests/04r0update b/tests/04r0update
-index 73ee3b9f..b95efb06 100644
---- a/tests/04r0update
-+++ b/tests/04r0update
-@@ -1,7 +1,7 @@
- 
- # create a raid0, re-assemble with a different super-minor
--mdadm -CR -e 0.90 $md0 -l0 -n3 $dev0 $dev1 $dev2
--testdev $md0 3 $mdsize0 512
-+mdadm -CR -e 0.90 $md0 -llinear -n3 $dev0 $dev1 $dev2
-+testdev $md0 3 $mdsize0 1
- minor1=`mdadm -E $dev0 | sed -n -e 's/.*Preferred Minor : //p'`
- mdadm -S /dev/md0
- 
-diff --git a/tests/04update-metadata b/tests/04update-metadata
-index 232fc1ff..08c14af7 100644
---- a/tests/04update-metadata
-+++ b/tests/04update-metadata
-@@ -8,7 +8,7 @@ set -xe
- 
- dlist="$dev0 $dev1 $dev2 $dev3"
- 
--for ls in raid0/4 linear/4 raid1/1 raid5/3 raid6/2
-+for ls in linear/4 raid1/1 raid5/3 raid6/2
- do
-   s=${ls#*/} l=${ls%/*}
-   mdadm -CR --assume-clean -e 0.90 $md0 --level $l -n 4 -c 64 $dlist
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch b/meta/recipes-extended/mdadm/files/0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch
new file mode 100644
index 00000000000..0916efafdf5
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch
@@ -0,0 +1,24 @@
+From 8fa7d3cb96e8833743b635fb198675ad6c020b6e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 12 Mar 2024 10:51:51 +0100
+Subject: [PATCH] util.c: add limits.h include for NAME_MAX definition
+
+Upstream-Status: Submitted [mariusz.tkaczyk@linux.intel.com,linux-raid@vger.kernel.org]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util.c b/util.c
+index b145447..a9cb6c4 100644
+--- a/util.c
++++ b/util.c
+@@ -36,7 +36,7 @@
+ #include	<ctype.h>
+ #include	<dirent.h>
+ #include	<dlfcn.h>
+-
++#include	<limits.h>
+ 
+ /*
+  * following taken from linux/blkpg.h because they aren't
diff --git a/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch b/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
new file mode 100644
index 00000000000..145c65477ab
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
@@ -0,0 +1,27 @@
+From a22b2345b9773d362acd85dd4c4a6a3cda9100d4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 12 Mar 2024 10:54:08 +0100
+Subject: [PATCH] Create.c: include linux/falloc.h for FALLOC_FL_ZERO_RANGE
+ definition
+
+glibc provides this through fcntl.h but musl does not - should
+be reported and fixed there.
+
+Upstream-Status: Inappropriate [musl-specific issue]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Create.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Create.c b/Create.c
+index 8082f54..7071f0a 100644
+--- a/Create.c
++++ b/Create.c
+@@ -31,6 +31,7 @@
+ #include	<signal.h>
+ #include	<sys/signalfd.h>
+ #include	<sys/wait.h>
++#include	<linux/falloc.h>
+ 
+ static int round_size_and_verify(unsigned long long *size, int chunk)
+ {
diff --git a/meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch b/meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch
deleted file mode 100644
index fafe88b49c7..00000000000
--- a/meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 14f110f0286d38e29ef5e51d7f72e049c2f18323 Mon Sep 17 00:00:00 2001
-From: Logan Gunthorpe <logang@deltatee.com>
-Date: Wed, 22 Jun 2022 14:25:08 -0600
-Subject: [PATCH 2/4] DDF: Fix NULL pointer dereference in
- validate_geometry_ddf()
-
-A relatively recent patch added a call to validate_geometry() in
-Manage_add() that has level=LEVEL_CONTAINER and chunk=NULL.
-
-This causes some ddf tests to segfault which aborts the test suite.
-
-To fix this, avoid dereferencing chunk when the level is
-LEVEL_CONTAINER or LEVEL_NONE.
-
-Fixes: 1f5d54a06df0 ("Manage: Call validate_geometry when adding drive to external container")
-Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
-Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
-
-Upstream-Status: Backport
-
-Reference to upstream patch:
-https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=2b93288a5650
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- super-ddf.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/super-ddf.c b/super-ddf.c
-index 65cf727..3ef1293 100644
---- a/super-ddf.c
-+++ b/super-ddf.c
-@@ -3369,9 +3369,6 @@ static int validate_geometry_ddf(struct supertype *st,
- 	 * If given BVDs, we make an SVD, changing all the GUIDs in the process.
- 	 */
- 
--	if (*chunk == UnSet)
--		*chunk = DEFAULT_CHUNK;
--
- 	if (level == LEVEL_NONE)
- 		level = LEVEL_CONTAINER;
- 	if (level == LEVEL_CONTAINER) {
-@@ -3381,6 +3378,9 @@ static int validate_geometry_ddf(struct supertype *st,
- 						       freesize, verbose);
- 	}
- 
-+	if (*chunk == UnSet)
-+		*chunk = DEFAULT_CHUNK;
-+
- 	if (!dev) {
- 		mdu_array_info_t array = {
- 			.level = level,
--- 
-2.39.1
-
diff --git a/meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch b/meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch
deleted file mode 100644
index a954ab027a0..00000000000
--- a/meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From bd064da1469a6a07331b076a0294a8c6c3c38526 Mon Sep 17 00:00:00 2001
-From: Logan Gunthorpe <logang@deltatee.com>
-Date: Wed, 22 Jun 2022 14:25:09 -0600
-Subject: [PATCH 3/4] mdadm/Grow: Fix use after close bug by closing after fork
-
-The test 07reshape-grow fails most of the time. But it succeeds around
-1 in 5 times. When it does succeed, it causes the tests to die because
-mdadm has segfaulted.
-
-The segfault was caused by mdadm attempting to repoen a file
-descriptor that was already closed. The backtrace of the segfault
-was:
-
-  #0  __strncmp_avx2 () at ../sysdeps/x86_64/multiarch/strcmp-avx2.S:101
-  #1  0x000056146e31d44b in devnm2devid (devnm=0x0) at util.c:956
-  #2  0x000056146e31dab4 in open_dev_flags (devnm=0x0, flags=0)
-                         at util.c:1072
-  #3  0x000056146e31db22 in open_dev (devnm=0x0) at util.c:1079
-  #4  0x000056146e3202e8 in reopen_mddev (mdfd=4) at util.c:2244
-  #5  0x000056146e329f36 in start_array (mdfd=4,
-              mddev=0x7ffc55342450 "/dev/md0", content=0x7ffc55342860,
-              st=0x56146fc78660, ident=0x7ffc55342f70, best=0x56146fc6f5d0,
-              bestcnt=10, chosen_drive=0, devices=0x56146fc706b0, okcnt=5,
-	      sparecnt=0,  rebuilding_cnt=0, journalcnt=0, c=0x7ffc55342e90,
-	      clean=1,  avail=0x56146fc78720 "\001\001\001\001\001",
-	      start_partial_ok=0, err_ok=0, was_forced=0)
-	                  at Assemble.c:1206
-  #6  0x000056146e32c36e in Assemble (st=0x56146fc78660,
-               mddev=0x7ffc55342450 "/dev/md0", ident=0x7ffc55342f70,
-	       devlist=0x56146fc6e2d0, c=0x7ffc55342e90)
-	                 at Assemble.c:1914
-  #7  0x000056146e312ac9 in main (argc=11, argv=0x7ffc55343238)
-                         at mdadm.c:1510
-
-The file descriptor was closed early in Grow_continue(). The noted commit
-moved the close() call to close the fd above the fork which caused the
-parent process to return with a closed fd.
-
-This meant reshape_array() and Grow_continue() would return in the parent
-with the fd forked. The fd would eventually be passed to reopen_mddev()
-which returned an unhandled NULL from fd2devnm() which would then be
-dereferenced in devnm2devid.
-
-Fix this by moving the close() call below the fork. This appears to
-fix the 07revert-grow test. While we're at it, switch to using
-close_fd() to invalidate the file descriptor.
-
-Fixes: 77b72fa82813 ("mdadm/Grow: prevent md's fd from being occupied during delayed time")
-Cc: Alex Wu <alexwu@synology.com>
-Cc: BingJing Chang <bingjingc@synology.com>
-Cc: Danny Shih <dannyshih@synology.com>
-Cc: ChangSyun Peng <allenpeng@synology.com>
-Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
-Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
-
-Upstream-Status: Backport
-
-Reference to upstream patch:
-https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=548e9b916f86
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- Grow.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/Grow.c b/Grow.c
-index 9c6fc95..a8e4e83 100644
---- a/Grow.c
-+++ b/Grow.c
-@@ -3501,7 +3501,6 @@ started:
- 			return 0;
- 		}
- 
--	close(fd);
- 	/* Now we just need to kick off the reshape and watch, while
- 	 * handling backups of the data...
- 	 * This is all done by a forked background process.
-@@ -3522,6 +3521,9 @@ started:
- 		break;
- 	}
- 
-+	/* Close unused file descriptor in the forked process */
-+	close_fd(&fd);
-+
- 	/* If another array on the same devices is busy, the
- 	 * reshape will wait for them.  This would mean that
- 	 * the first section that we suspend will stay suspended
--- 
-2.39.1
-
diff --git a/meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch b/meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch
deleted file mode 100644
index 72cb40f7820..00000000000
--- a/meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 2296a4a441b4b8546e2eb32403930f1bb8f3ee4a Mon Sep 17 00:00:00 2001
-From: Logan Gunthorpe <logang@deltatee.com>
-Date: Wed, 22 Jun 2022 14:25:10 -0600
-Subject: [PATCH 4/4] monitor: Avoid segfault when calling NULL get_bad_blocks
-
-Not all struct superswitch implement a get_bad_blocks() function,
-yet mdmon seems to call it without checking for NULL and thus
-occasionally segfaults in the test 10ddf-geometry.
-
-Fix this by checking for NULL before calling it.
-
-Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
-Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
-
-Upstream-Status: Backport
-
-Reference to upstream patch:
-https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=9ae62977b51d
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- monitor.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/monitor.c b/monitor.c
-index afc3e50..8e43c0d 100644
---- a/monitor.c
-+++ b/monitor.c
-@@ -312,6 +312,9 @@ static int check_for_cleared_bb(struct active_array *a, struct mdinfo *mdi)
- 	struct md_bb *bb;
- 	int i;
- 
-+	if (!ss->get_bad_blocks)
-+		return -1;
-+
- 	/*
- 	 * Get a list of bad blocks for an array, then read list of
- 	 * acknowledged bad blocks from kernel and compare it against metadata
--- 
-2.39.1
-
diff --git a/meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch b/meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
deleted file mode 100644
index c55bfb125b2..00000000000
--- a/meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From feab1f72fcf032a4d21d0a69eb61b23a5ddb3352 Mon Sep 17 00:00:00 2001
-From: Logan Gunthorpe <logang@deltatee.com>
-Date: Wed, 22 Jun 2022 14:25:18 -0600
-Subject: [PATCH 5/6] mdadm/test: Mark and ignore broken test failures
-
-Add functionality to continue if a test marked as broken fails.
-
-To mark a test as broken, a file with the same name but with the suffix
-'.broken' should exist. The first line in the file will be printed with
-a KNOWN BROKEN message; the rest of the file can describe the how the
-test is broken.
-
-Also adds --skip-broken and --skip-always-broken to skip all the tests
-that have a .broken file or to skip all tests whose .broken file's first
-line contains the keyword always.
-
-Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
-Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
-
-Upstream-Status: Backport
-
-Reference to upstream patch:
-https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=28520bf114b3
-
-[OP: adjusted context for mdadm-4.2]
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- test | 37 +++++++++++++++++++++++++++++++++++--
- 1 file changed, 35 insertions(+), 2 deletions(-)
-
-diff --git a/test b/test
-index 8f189d9..ee8fba1 100755
---- a/test
-+++ b/test
-@@ -10,6 +10,8 @@ devlist=
- 
- savelogs=0
- exitonerror=1
-+ctrl_c_error=0
-+skipbroken=0
- prefix='[0-9][0-9]'
- 
- # use loop devices by default if doesn't specify --dev
-@@ -35,6 +37,7 @@ die() {
- 
- ctrl_c() {
- 	exitonerror=1
-+	ctrl_c_error=1
- }
- 
- # mdadm always adds --quiet, and we want to see any unexpected messages
-@@ -79,8 +82,21 @@ mdadm() {
- do_test() {
- 	_script=$1
- 	_basename=`basename $_script`
-+	_broken=0
-+
- 	if [ -f "$_script" ]
- 	then
-+		if [ -f "${_script}.broken" ]; then
-+			_broken=1
-+			_broken_msg=$(head -n1 "${_script}.broken" | tr -d '\n')
-+			if [ "$skipbroken" == "all" ]; then
-+				return
-+			elif [ "$skipbroken" == "always" ] &&
-+			     [[ "$_broken_msg" == *always* ]]; then
-+				return
-+			fi
-+		fi
-+
- 		rm -f $targetdir/stderr
- 		# this might have been reset: restore the default.
- 		echo 2000 > /proc/sys/dev/raid/speed_limit_max
-@@ -97,10 +113,15 @@ do_test() {
- 		else
- 			save_log fail
- 			_fail=1
-+			if [ "$_broken" == "1" ]; then
-+				echo "  (KNOWN BROKEN TEST: $_broken_msg)"
-+			fi
- 		fi
- 		[ "$savelogs" == "1" ] &&
- 			mv -f $targetdir/log $logdir/$_basename.log
--		[ "$_fail" == "1" -a "$exitonerror" == "1" ] && exit 1
-+		[ "$ctrl_c_error" == "1" ] && exit 1
-+		[ "$_fail" == "1" -a "$exitonerror" == "1" \
-+		  -a "$_broken" == "0" ] && exit 1
- 	fi
- }
- 
-@@ -117,6 +138,8 @@ do_help() {
- 		--logdir=directory          Directory to save all logfiles in
- 		--save-logs                 Usually use with --logdir together
- 		--keep-going | --no-error   Don't stop on error, ie. run all tests
-+		--skip-broken               Skip tests that are known to be broken
-+		--skip-always-broken        Skip tests that are known to always fail
- 		--dev=loop|lvm|ram|disk     Use loop devices (default), LVM, RAM or disk
- 		--disks=                    Provide a bunch of physical devices for test
- 		--volgroup=name             LVM volume group for LVM test
-@@ -211,6 +234,12 @@ parse_args() {
- 		--keep-going | --no-error )
- 			exitonerror=0
- 			;;
-+		--skip-broken )
-+			skipbroken=all
-+			;;
-+		--skip-always-broken )
-+			skipbroken=always
-+			;;
- 		--disable-multipath )
- 			unset MULTIPATH
- 			;;
-@@ -275,7 +304,11 @@ main() {
- 			if [ $script == "$testdir/11spare-migration" ];then
- 				continue
- 			fi
--			do_test $script
-+			case $script in
-+			 *.broken) ;;
-+			 *)
-+			     do_test $script
-+			 esac
- 		done
- 	fi
- 
--- 
-2.39.1
-
diff --git a/meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch b/meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch
deleted file mode 100644
index 115b23bac51..00000000000
--- a/meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch
+++ /dev/null
@@ -1,454 +0,0 @@
-From fd1c26ba129b069d9f73afaefdbe53683de3814a Mon Sep 17 00:00:00 2001
-From: Logan Gunthorpe <logang@deltatee.com>
-Date: Wed, 22 Jun 2022 14:25:19 -0600
-Subject: [PATCH 6/6] tests: Add broken files for all broken tests
-
-Each broken file contains the rough frequency of brokeness as well
-as a brief explanation of what happens when it breaks. Estimates
-of failure rates are not statistically significant and can vary
-run to run.
-
-This is really just a view from my window. Tests were done on a
-small VM with the default loop devices, not real hardware. We've
-seen different kernel configurations can cause bugs to appear as well
-(ie. different block schedulers). It may also be that different race
-conditions will be seen on machines with different performance
-characteristics.
-
-These annotations were done with the kernel currently in md/md-next:
-
- facef3b96c5b ("md: Notify sysfs sync_completed in md_reap_sync_thread()")
-
-Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
-Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
-
-Upstream-Status: Backport
-
-Reference to upstream patch:
-https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=daa86d663476
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- tests/01r5integ.broken                     |  7 ++++
- tests/01raid6integ.broken                  |  7 ++++
- tests/04r5swap.broken                      |  7 ++++
- tests/07autoassemble.broken                |  8 ++++
- tests/07autodetect.broken                  |  5 +++
- tests/07changelevelintr.broken             |  9 +++++
- tests/07changelevels.broken                |  9 +++++
- tests/07reshape5intr.broken                | 45 ++++++++++++++++++++++
- tests/07revert-grow.broken                 | 31 +++++++++++++++
- tests/07revert-shrink.broken               |  9 +++++
- tests/07testreshape5.broken                | 12 ++++++
- tests/09imsm-assemble.broken               |  6 +++
- tests/09imsm-create-fail-rebuild.broken    |  5 +++
- tests/09imsm-overlap.broken                |  7 ++++
- tests/10ddf-assemble-missing.broken        |  6 +++
- tests/10ddf-fail-create-race.broken        |  7 ++++
- tests/10ddf-fail-two-spares.broken         |  5 +++
- tests/10ddf-incremental-wrong-order.broken |  9 +++++
- tests/14imsm-r1_2d-grow-r1_3d.broken       |  5 +++
- tests/14imsm-r1_2d-takeover-r0_2d.broken   |  6 +++
- tests/18imsm-r10_4d-takeover-r0_2d.broken  |  5 +++
- tests/18imsm-r1_2d-takeover-r0_1d.broken   |  6 +++
- tests/19raid6auto-repair.broken            |  5 +++
- tests/19raid6repair.broken                 |  5 +++
- 24 files changed, 226 insertions(+)
- create mode 100644 tests/01r5integ.broken
- create mode 100644 tests/01raid6integ.broken
- create mode 100644 tests/04r5swap.broken
- create mode 100644 tests/07autoassemble.broken
- create mode 100644 tests/07autodetect.broken
- create mode 100644 tests/07changelevelintr.broken
- create mode 100644 tests/07changelevels.broken
- create mode 100644 tests/07reshape5intr.broken
- create mode 100644 tests/07revert-grow.broken
- create mode 100644 tests/07revert-shrink.broken
- create mode 100644 tests/07testreshape5.broken
- create mode 100644 tests/09imsm-assemble.broken
- create mode 100644 tests/09imsm-create-fail-rebuild.broken
- create mode 100644 tests/09imsm-overlap.broken
- create mode 100644 tests/10ddf-assemble-missing.broken
- create mode 100644 tests/10ddf-fail-create-race.broken
- create mode 100644 tests/10ddf-fail-two-spares.broken
- create mode 100644 tests/10ddf-incremental-wrong-order.broken
- create mode 100644 tests/14imsm-r1_2d-grow-r1_3d.broken
- create mode 100644 tests/14imsm-r1_2d-takeover-r0_2d.broken
- create mode 100644 tests/18imsm-r10_4d-takeover-r0_2d.broken
- create mode 100644 tests/18imsm-r1_2d-takeover-r0_1d.broken
- create mode 100644 tests/19raid6auto-repair.broken
- create mode 100644 tests/19raid6repair.broken
-
-diff --git a/tests/01r5integ.broken b/tests/01r5integ.broken
-new file mode 100644
-index 0000000..2073763
---- /dev/null
-+++ b/tests/01r5integ.broken
-@@ -0,0 +1,7 @@
-+fails rarely
-+
-+Fails about 1 in every 30 runs with a sha mismatch error:
-+
-+    c49ab26e1b01def7874af9b8a6d6d0c29fdfafe6 /dev/md0 does not match
-+    15dc2f73262f811ada53c65e505ceec9cf025cb9 /dev/md0 with /dev/loop3
-+    missing
-diff --git a/tests/01raid6integ.broken b/tests/01raid6integ.broken
-new file mode 100644
-index 0000000..1df735f
---- /dev/null
-+++ b/tests/01raid6integ.broken
-@@ -0,0 +1,7 @@
-+fails infrequently
-+
-+Fails about 1 in 5 with a sha mismatch:
-+
-+    8286c2bc045ae2cfe9f8b7ae3a898fa25db6926f /dev/md0 does not match
-+    a083a0738b58caab37fd568b91b177035ded37df /dev/md0 with /dev/loop2 and
-+    /dev/loop3 missing
-diff --git a/tests/04r5swap.broken b/tests/04r5swap.broken
-new file mode 100644
-index 0000000..e38987d
---- /dev/null
-+++ b/tests/04r5swap.broken
-@@ -0,0 +1,7 @@
-+always fails
-+
-+Fails with errors:
-+
-+  mdadm: /dev/loop0 has no superblock - assembly aborted
-+
-+   ERROR: no recovery happening
-diff --git a/tests/07autoassemble.broken b/tests/07autoassemble.broken
-new file mode 100644
-index 0000000..8be0940
---- /dev/null
-+++ b/tests/07autoassemble.broken
-@@ -0,0 +1,8 @@
-+always fails
-+
-+Prints lots of messages, but the array doesn't assemble. Error
-+possibly related to:
-+
-+  mdadm: /dev/md/1 is busy - skipping
-+  mdadm: no recogniseable superblock on /dev/md/testing:0
-+  mdadm: /dev/md/2 is busy - skipping
-diff --git a/tests/07autodetect.broken b/tests/07autodetect.broken
-new file mode 100644
-index 0000000..294954a
---- /dev/null
-+++ b/tests/07autodetect.broken
-@@ -0,0 +1,5 @@
-+always fails
-+
-+Fails with error:
-+
-+    ERROR: no resync happening
-diff --git a/tests/07changelevelintr.broken b/tests/07changelevelintr.broken
-new file mode 100644
-index 0000000..284b490
---- /dev/null
-+++ b/tests/07changelevelintr.broken
-@@ -0,0 +1,9 @@
-+always fails
-+
-+Fails with errors:
-+
-+  mdadm: this change will reduce the size of the array.
-+         use --grow --array-size first to truncate array.
-+         e.g. mdadm --grow /dev/md0 --array-size 56832
-+
-+  ERROR: no reshape happening
-diff --git a/tests/07changelevels.broken b/tests/07changelevels.broken
-new file mode 100644
-index 0000000..9b930d9
---- /dev/null
-+++ b/tests/07changelevels.broken
-@@ -0,0 +1,9 @@
-+always fails
-+
-+Fails with errors:
-+
-+    mdadm: /dev/loop0 is smaller than given size. 18976K < 19968K + metadata
-+    mdadm: /dev/loop1 is smaller than given size. 18976K < 19968K + metadata
-+    mdadm: /dev/loop2 is smaller than given size. 18976K < 19968K + metadata
-+
-+    ERROR: /dev/md0 isn't a block device.
-diff --git a/tests/07reshape5intr.broken b/tests/07reshape5intr.broken
-new file mode 100644
-index 0000000..efe52a6
---- /dev/null
-+++ b/tests/07reshape5intr.broken
-@@ -0,0 +1,45 @@
-+always fails
-+
-+This patch, recently added to md-next causes the test to always fail:
-+
-+7e6ba434cc60 ("md: don't unregister sync_thread with reconfig_mutex
-+held")
-+
-+The new error is simply:
-+
-+   ERROR: no reshape happening
-+
-+Before the patch, the error seen is below.
-+
-+--
-+
-+fails infrequently
-+
-+Fails roughly 1 in 4 runs with errors:
-+
-+    mdadm: Merging with already-assembled /dev/md/0
-+    mdadm: cannot re-read metadata from /dev/loop6 - aborting
-+
-+    ERROR: no reshape happening
-+
-+Also have seen a random deadlock:
-+
-+     INFO: task mdadm:109702 blocked for more than 30 seconds.
-+           Not tainted 5.18.0-rc3-eid-vmlocalyes-dbg-00095-g3c2b5427979d #2040
-+     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
-+     task:mdadm           state:D stack:    0 pid:109702 ppid:     1 flags:0x00004000
-+     Call Trace:
-+      <TASK>
-+      __schedule+0x67e/0x13b0
-+      schedule+0x82/0x110
-+      mddev_suspend+0x2e1/0x330
-+      suspend_lo_store+0xbd/0x140
-+      md_attr_store+0xcb/0x130
-+      sysfs_kf_write+0x89/0xb0
-+      kernfs_fop_write_iter+0x202/0x2c0
-+      new_sync_write+0x222/0x330
-+      vfs_write+0x3bc/0x4d0
-+      ksys_write+0xd9/0x180
-+      __x64_sys_write+0x43/0x50
-+      do_syscall_64+0x3b/0x90
-+      entry_SYSCALL_64_after_hwframe+0x44/0xae
-diff --git a/tests/07revert-grow.broken b/tests/07revert-grow.broken
-new file mode 100644
-index 0000000..9b6db86
---- /dev/null
-+++ b/tests/07revert-grow.broken
-@@ -0,0 +1,31 @@
-+always fails
-+
-+This patch, recently added to md-next causes the test to always fail:
-+
-+7e6ba434cc60 ("md: don't unregister sync_thread with reconfig_mutex held")
-+
-+The errors are:
-+
-+    mdadm: No active reshape to revert on /dev/loop0
-+    ERROR: active raid5 not found
-+
-+Before the patch, the error seen is below.
-+
-+--
-+
-+fails rarely
-+
-+Fails about 1 in every 30 runs with errors:
-+
-+    mdadm: Merging with already-assembled /dev/md/0
-+    mdadm: backup file /tmp/md-backup inaccessible: No such file or directory
-+    mdadm: failed to add /dev/loop1 to /dev/md/0: Invalid argument
-+    mdadm: failed to add /dev/loop2 to /dev/md/0: Invalid argument
-+    mdadm: failed to add /dev/loop3 to /dev/md/0: Invalid argument
-+    mdadm: failed to add /dev/loop0 to /dev/md/0: Invalid argument
-+    mdadm: /dev/md/0 assembled from 1 drive - need all 5 to start it
-+            (use --run to insist).
-+
-+    grep: /sys/block/md*/md/sync_action: No such file or directory
-+
-+    ERROR: active raid5 not found
-diff --git a/tests/07revert-shrink.broken b/tests/07revert-shrink.broken
-new file mode 100644
-index 0000000..c33c39e
---- /dev/null
-+++ b/tests/07revert-shrink.broken
-@@ -0,0 +1,9 @@
-+always fails
-+
-+Fails with errors:
-+
-+    mdadm: this change will reduce the size of the array.
-+           use --grow --array-size first to truncate array.
-+           e.g. mdadm --grow /dev/md0 --array-size 53760
-+
-+    ERROR: active raid5 not found
-diff --git a/tests/07testreshape5.broken b/tests/07testreshape5.broken
-new file mode 100644
-index 0000000..a8ce03e
---- /dev/null
-+++ b/tests/07testreshape5.broken
-@@ -0,0 +1,12 @@
-+always fails
-+
-+Test seems to run 'test_stripe' at $dir directory, but $dir is never
-+set. If $dir is adjusted to $PWD, the test still fails with:
-+
-+    mdadm: /dev/loop2 is not suitable for this array.
-+    mdadm: create aborted
-+    ++ return 1
-+    ++ cmp -s -n 8192 /dev/md0 /tmp/RandFile
-+    ++ echo cmp failed
-+    cmp failed
-+    ++ exit 2
-diff --git a/tests/09imsm-assemble.broken b/tests/09imsm-assemble.broken
-new file mode 100644
-index 0000000..a6d4d5c
---- /dev/null
-+++ b/tests/09imsm-assemble.broken
-@@ -0,0 +1,6 @@
-+fails infrequently
-+
-+Fails roughly 1 in 10 runs with errors:
-+
-+    mdadm: /dev/loop2 is still in use, cannot remove.
-+    /dev/loop2 removal from /dev/md/container should have succeeded
-diff --git a/tests/09imsm-create-fail-rebuild.broken b/tests/09imsm-create-fail-rebuild.broken
-new file mode 100644
-index 0000000..40c4b29
---- /dev/null
-+++ b/tests/09imsm-create-fail-rebuild.broken
-@@ -0,0 +1,5 @@
-+always fails
-+
-+Fails with error:
-+
-+    **Error**: Array size mismatch - expected 3072, actual 16384
-diff --git a/tests/09imsm-overlap.broken b/tests/09imsm-overlap.broken
-new file mode 100644
-index 0000000..e7ccab7
---- /dev/null
-+++ b/tests/09imsm-overlap.broken
-@@ -0,0 +1,7 @@
-+always fails
-+
-+Fails with errors:
-+
-+    **Error**: Offset mismatch - expected 15360, actual 0
-+    **Error**: Offset mismatch - expected 15360, actual 0
-+    /dev/md/vol3 failed check
-diff --git a/tests/10ddf-assemble-missing.broken b/tests/10ddf-assemble-missing.broken
-new file mode 100644
-index 0000000..bfd8d10
---- /dev/null
-+++ b/tests/10ddf-assemble-missing.broken
-@@ -0,0 +1,6 @@
-+always fails
-+
-+Fails with errors:
-+
-+    ERROR: /dev/md/vol0 has unexpected state on /dev/loop10
-+    ERROR: unexpected number of online disks on /dev/loop10
-diff --git a/tests/10ddf-fail-create-race.broken b/tests/10ddf-fail-create-race.broken
-new file mode 100644
-index 0000000..6c0df02
---- /dev/null
-+++ b/tests/10ddf-fail-create-race.broken
-@@ -0,0 +1,7 @@
-+usually fails
-+
-+Fails about 9 out of 10 times with many errors:
-+
-+    mdadm: cannot open MISSING: No such file or directory
-+    ERROR: non-degraded array found
-+    ERROR: disk 0 not marked as failed in meta data
-diff --git a/tests/10ddf-fail-two-spares.broken b/tests/10ddf-fail-two-spares.broken
-new file mode 100644
-index 0000000..eeea56d
---- /dev/null
-+++ b/tests/10ddf-fail-two-spares.broken
-@@ -0,0 +1,5 @@
-+fails infrequently
-+
-+Fails roughly 1 in 3 with error:
-+
-+   ERROR: /dev/md/vol1 should be optimal in meta data
-diff --git a/tests/10ddf-incremental-wrong-order.broken b/tests/10ddf-incremental-wrong-order.broken
-new file mode 100644
-index 0000000..a5af3ba
---- /dev/null
-+++ b/tests/10ddf-incremental-wrong-order.broken
-@@ -0,0 +1,9 @@
-+always fails
-+
-+Fails with errors:
-+    ERROR: sha1sum of /dev/md/vol0 has changed
-+    ERROR: /dev/md/vol0 has unexpected state on /dev/loop10
-+    ERROR: unexpected number of online disks on /dev/loop10
-+    ERROR: /dev/md/vol0 has unexpected state on /dev/loop8
-+    ERROR: unexpected number of online disks on /dev/loop8
-+    ERROR: sha1sum of /dev/md/vol0 has changed
-diff --git a/tests/14imsm-r1_2d-grow-r1_3d.broken b/tests/14imsm-r1_2d-grow-r1_3d.broken
-new file mode 100644
-index 0000000..4ef1d40
---- /dev/null
-+++ b/tests/14imsm-r1_2d-grow-r1_3d.broken
-@@ -0,0 +1,5 @@
-+always fails
-+
-+Fails with error:
-+
-+    mdadm/tests/func.sh: line 325: dvsize/chunk: division by 0 (error token is "chunk")
-diff --git a/tests/14imsm-r1_2d-takeover-r0_2d.broken b/tests/14imsm-r1_2d-takeover-r0_2d.broken
-new file mode 100644
-index 0000000..89cd4e5
---- /dev/null
-+++ b/tests/14imsm-r1_2d-takeover-r0_2d.broken
-@@ -0,0 +1,6 @@
-+always fails
-+
-+Fails with error:
-+
-+    tests/func.sh: line 325: dvsize/chunk: division by 0 (error token
-+		is "chunk")
-diff --git a/tests/18imsm-r10_4d-takeover-r0_2d.broken b/tests/18imsm-r10_4d-takeover-r0_2d.broken
-new file mode 100644
-index 0000000..a27399f
---- /dev/null
-+++ b/tests/18imsm-r10_4d-takeover-r0_2d.broken
-@@ -0,0 +1,5 @@
-+fails rarely
-+
-+Fails about 1 run in 100 with message:
-+
-+   ERROR:  size is wrong for /dev/md/vol0: 2 * 5120 (chunk=128) = 20480, not 0
-diff --git a/tests/18imsm-r1_2d-takeover-r0_1d.broken b/tests/18imsm-r1_2d-takeover-r0_1d.broken
-new file mode 100644
-index 0000000..aa1982e
---- /dev/null
-+++ b/tests/18imsm-r1_2d-takeover-r0_1d.broken
-@@ -0,0 +1,6 @@
-+always fails
-+
-+Fails with error:
-+
-+    tests/func.sh: line 325: dvsize/chunk: division by 0 (error token
-+			is "chunk")
-diff --git a/tests/19raid6auto-repair.broken b/tests/19raid6auto-repair.broken
-new file mode 100644
-index 0000000..e91a142
---- /dev/null
-+++ b/tests/19raid6auto-repair.broken
-@@ -0,0 +1,5 @@
-+always fails
-+
-+Fails with:
-+
-+    "should detect errors"
-diff --git a/tests/19raid6repair.broken b/tests/19raid6repair.broken
-new file mode 100644
-index 0000000..e91a142
---- /dev/null
-+++ b/tests/19raid6repair.broken
-@@ -0,0 +1,5 @@
-+always fails
-+
-+Fails with:
-+
-+    "should detect errors"
--- 
-2.39.1
-
diff --git a/meta/recipes-extended/mdadm/files/debian-no-Werror.patch b/meta/recipes-extended/mdadm/files/debian-no-Werror.patch
index fa90647489a..b758fcd0ab2 100644
--- a/meta/recipes-extended/mdadm/files/debian-no-Werror.patch
+++ b/meta/recipes-extended/mdadm/files/debian-no-Werror.patch
@@ -1,4 +1,4 @@
-From adb75f0bdec97dbe4aa15cc988d349775f7995ff Mon Sep 17 00:00:00 2001
+From 319b3191f088cea7b0fb6038ab7625d5e049dcf7 Mon Sep 17 00:00:00 2001
 From: "martin f. krafft" <madduck@debian.org>
 Date: Mon, 3 Jan 2022 19:14:12 +0000
 Subject: [PATCH] Remove -Werror from compiler flags
@@ -10,21 +10,20 @@ use it to beautify the code, but remove it for out builds.
 Signed-off-by: martin f. krafft <madduck@debian.org>
 
 Upstream-Status: Pending
-
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 716c97c..40354ea 100644
+index 9ab6a65..1141971 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -50,7 +50,7 @@ ifeq ($(origin CC),default)
  CC := $(CROSS_COMPILE)gcc
  endif
  CXFLAGS ?= -ggdb
--CWFLAGS = -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter
-+CWFLAGS = -Wall -Wstrict-prototypes -Wextra -Wno-unused-parameter
+-CWFLAGS ?= -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter -Wformat -Wformat-security -Werror=format-security -fstack-protector-strong -fPIE -Warray-bounds
++CWFLAGS ?= -Wall -Wstrict-prototypes -Wextra -Wno-unused-parameter -Wformat -Wformat-security -Werror=format-security -fstack-protector-strong -fPIE -Warray-bounds
  ifdef WARN_UNUSED
- CWFLAGS += -Wp,-D_FORTIFY_SOURCE=2 -O3
+ CWFLAGS += -Wp -O3
  endif
diff --git a/meta/recipes-extended/mdadm/files/include_sysmacros.patch b/meta/recipes-extended/mdadm/files/include_sysmacros.patch
deleted file mode 100644
index 8a1d8342d89..00000000000
--- a/meta/recipes-extended/mdadm/files/include_sysmacros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-include sys/sysmacros.h for major/minor macro definitions
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/mdadm.h
-+++ b/mdadm.h
-@@ -35,6 +35,7 @@ extern __off64_t lseek64 __P ((int __fd,
- 
- #include	<sys/types.h>
- #include	<sys/stat.h>
-+#include	<sys/sysmacros.h>
- #include	<stdint.h>
- #include	<stdlib.h>
- #include	<time.h>
diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
index 7a2c888701e..ecd1f037d01 100644
--- a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
+++ b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
@@ -1,4 +1,4 @@
-From e37f7f6a0f1ef1b594574d11a8b90b8c861d047b Mon Sep 17 00:00:00 2001
+From ca91d9fc07943f209988411f2596e4b69828f208 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
 Date: Sun, 15 Mar 2015 09:02:14 +0000
 Subject: [PATCH] mdadm: Fix build in x32 ABI
@@ -12,16 +12,15 @@ data type in x32 ABI is long long int.
 Upstream-Status: Pending
 
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-
 ---
  monitor.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/monitor.c b/monitor.c
-index 81537ed..7c33382 100644
+index 4acec67..8dcdfd6 100644
 --- a/monitor.c
 +++ b/monitor.c
-@@ -445,9 +445,12 @@ static int read_and_act(struct active_array *a, fd_set *fds)
+@@ -447,9 +447,12 @@ static int read_and_act(struct active_array *a, fd_set *fds)
  		if (FD_ISSET(mdi->bb_fd, fds))
  			check_for_cleared_bb(a, mdi);
  	}
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.3.bb
similarity index 74%
rename from meta/recipes-extended/mdadm/mdadm_4.2.bb
rename to meta/recipes-extended/mdadm/mdadm_4.3.bb
index 6f872493983..fc58fcb86c6 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.3.bb
@@ -17,31 +17,15 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
            file://0001-fix-gcc-8-format-truncation-warning.patch \
            file://debian-no-Werror.patch \
-           file://0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch \
            file://mdadm.init \
            file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
-           file://include_sysmacros.patch \
-           file://0001-mdadm-skip-test-11spare-migration.patch \
-           file://0001-Fix-parsing-of-r-in-monitor-manager-mode.patch \
            file://0001-Makefile-install-mdcheck.patch \
            file://0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch \
-           file://0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
-           file://0001-mdadm-Fix-optional-write-behind-parameter.patch \
-           file://0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch \
-           file://0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch \
-           file://0001-tests-fix-raid0-tests-for-0.90-metadata.patch \
-           file://0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch \
-           file://0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch \
-           file://0001-DDF-Cleanup-validate_geometry_ddf_container.patch \
-           file://0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch \
-           file://0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch \
-           file://0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch \
-           file://0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch \
-           file://0006-tests-Add-broken-files-for-all-broken-tests.patch \
-           file://0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch \
+           file://0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch \
+           file://0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch \
            "
 
-SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
+SRC_URI[sha256sum] = "416727ae1f1080ea6e3090cea36dd076826fc369151e36ab736557ba92196f9f"
 
 inherit autotools-brokensep ptest systemd
 
@@ -59,7 +43,7 @@ CFLAGS:append:mipsarchn64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS:append:mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
 
 EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${systemd_system_unitdir} \
-                BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev"'
+                BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev" LDFLAGS="${LDFLAGS}"'
 
 DEBUG_OPTIMIZATION:append = " -Wno-error"
 
@@ -91,7 +75,6 @@ do_install_ptest() {
 	cp -R --no-dereference --preserve=mode,links -v ${S}/tests ${D}${PTEST_PATH}/tests
 	cp ${S}/test ${D}${PTEST_PATH}
 	sed -e 's!sleep 0.*!sleep 1!g; s!/var/tmp!/mdadm-testing-dir!g' -i ${D}${PTEST_PATH}/test
-	sed -e 's!/var/tmp!/mdadm-testing-dir!g' -i ${D}${PTEST_PATH}/tests/*
         sed -i -e '/echo -ne "$_script... "/d' \
                -e 's/echo "succeeded"/echo -e "PASS: $_script"/g' \
                -e '/save_log fail/N; /_fail=1/i\\t\t\techo -ne "FAIL: $_script"' \
-- 
2.39.2


