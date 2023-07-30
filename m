Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5898C41513
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:41 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.78407.1690740101010238962
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=BMGFruVs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-686f1240a22so3511088b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740100; x=1691344900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0aCoAG+mw8g+qm/IlWIRCezAcLhYtTrSy2YQ9xzaAOQ=;
        b=BMGFruVsWs00u6cvmravMyGve72cWJj1Bet5FKV6QSQQLVC7+6lTOfOsEdu0emVqOO
         AFuSwIAlUSybcXQ8AddQR/eHseaVV3skhmbR32KtbMejN5JYWsUQVtOS7sgw3/+sEz46
         5WBdhbjqf5F0Da+l6Jga//5uJKkZlNQm3+WzQ/Ad0ePu+13UzUQfvLlth7fYbtEQwUao
         dS+7ySLHz0SCKLV/B00i5nrwo9iWbiG36lgaRurEVMpDR6xZNjlttTCqqVxH226wvxbE
         mwxclmd3DpGmiQR739ETPGU7TQJ3E3ceyV/GNE/gWdwqJSoQty3bElgFfDTxxM4x2F85
         7qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740100; x=1691344900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aCoAG+mw8g+qm/IlWIRCezAcLhYtTrSy2YQ9xzaAOQ=;
        b=hcD81bVrxww9Uiqnx6KE+ol/JPabYzwPWRUhaE5VLtnVULa9VTokTyYf+TRU0GKpDi
         pirNQCIjtmsqKISqOMw7L7/nSVfhIZdswsgt+rDbEb4YkXDXJ37LXyu7ddog6yH27UNC
         7wer3j+WlGROUsq2wyJu9+4VqpXIkStw1icDmdO3aeukTMrxdMkOPJeXYUFAP7ebU2wm
         RYhGQt0gP5F50dmdJtz2+POojZC93gfb62ciR+wxD1geGgv0qdJcal8G2WV2C6qz2OCs
         SUdQ8tYxPgHK9pDpx9oeA75AUsFZq8DVntkP4ghyFLjtb5unUkuL7gdFxALRdfhnoJFG
         O3Pg==
X-Gm-Message-State: ABy/qLa4a8YNwjXO1pWoc3bTTIZFOQ7wdge68HVaZK4iXW0dbQ577Gs3
	U7zW4lPYoG4hTvPo5gF5OJyaModZlLXdlcvkg5+ZrA==
X-Google-Smtp-Source: APBJJlF8g1hIooZnVg66MUgziZQwTgDGuCBxeqSQeUaEQ11JLfvUQqK1Zh8RJPaOiDPZD85+tuoZqw==
X-Received: by 2002:a05:6a00:cd1:b0:67f:3dcd:bc00 with SMTP id b17-20020a056a000cd100b0067f3dcdbc00mr10184484pfv.2.1690740099826;
        Sun, 30 Jul 2023 11:01:39 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/30] mdadm: fix segfaults when running ptests
Date: Sun, 30 Jul 2023 08:00:45 -1000
Message-Id: <1164ffefe0aba475589491779f71594a50bd5be7.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185100

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Currently, some segfaults are reported when running ptest:
mdadm[12333]: segfault at 0 ip 00007fe855924060 sp 00007ffc4d6caf88 error 4 in libc.so.6[7f)
Code: d2 0f 84 b7 0f 00 00 48 83 fa 01 0f 84 b9 0f 00 00 49 89 d3 89 f1 89 f8 48 83 e1 3f 4f

Backport the following upstream commits to fix them:
679bd9508a30 ("DDF: Cleanup validate_geometry_ddf_container()")
2b93288a5650 ("DDF: Fix NULL pointer dereference in validate_geometry_ddf()")
548e9b916f86 ("mdadm/Grow: Fix use after close bug by closing after fork")
9ae62977b51d ("monitor: Avoid segfault when calling NULL get_bad_blocks")

The fixes are part of the "Bug fixes and testing improvments" patchset [1].

[1] https://www.spinics.net/lists/raid/msg70621.html

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9585009e3e505b361cd32b14e0e85e77e7822878)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...anup-validate_geometry_ddf_container.patch | 148 ++++++++++++++++++
 ...nter-dereference-in-validate_geometr.patch |  56 +++++++
 ...se-after-close-bug-by-closing-after-.patch |  91 +++++++++++
 ...gfault-when-calling-NULL-get_bad_blo.patch |  42 +++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   4 +
 5 files changed, 341 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch b/meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch
new file mode 100644
index 0000000000..cea435f83b
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch
@@ -0,0 +1,148 @@
+From ca458f4dcc4de9403298f67543466ce4bbc8f8ae Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:07 -0600
+Subject: [PATCH 1/4] DDF: Cleanup validate_geometry_ddf_container()
+
+Move the function up so that the function declaration is not necessary
+and remove the unused arguments to the function.
+
+No functional changes are intended but will help with a bug fix in the
+next patch.
+
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=679bd9508a30
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ super-ddf.c | 88 ++++++++++++++++++++++++-----------------------------
+ 1 file changed, 39 insertions(+), 49 deletions(-)
+
+diff --git a/super-ddf.c b/super-ddf.c
+index 3f304cd..65cf727 100644
+--- a/super-ddf.c
++++ b/super-ddf.c
+@@ -503,13 +503,6 @@ struct ddf_super {
+ static int load_super_ddf_all(struct supertype *st, int fd,
+ 			      void **sbp, char *devname);
+ static int get_svd_state(const struct ddf_super *, const struct vcl *);
+-static int
+-validate_geometry_ddf_container(struct supertype *st,
+-				int level, int layout, int raiddisks,
+-				int chunk, unsigned long long size,
+-				unsigned long long data_offset,
+-				char *dev, unsigned long long *freesize,
+-				int verbose);
+ 
+ static int validate_geometry_ddf_bvd(struct supertype *st,
+ 				     int level, int layout, int raiddisks,
+@@ -3322,6 +3315,42 @@ static int reserve_space(struct supertype *st, int raiddisks,
+ 	return 1;
+ }
+ 
++static int
++validate_geometry_ddf_container(struct supertype *st,
++				int level, int raiddisks,
++				unsigned long long data_offset,
++				char *dev, unsigned long long *freesize,
++				int verbose)
++{
++	int fd;
++	unsigned long long ldsize;
++
++	if (level != LEVEL_CONTAINER)
++		return 0;
++	if (!dev)
++		return 1;
++
++	fd = dev_open(dev, O_RDONLY|O_EXCL);
++	if (fd < 0) {
++		if (verbose)
++			pr_err("ddf: Cannot open %s: %s\n",
++			       dev, strerror(errno));
++		return 0;
++	}
++	if (!get_dev_size(fd, dev, &ldsize)) {
++		close(fd);
++		return 0;
++	}
++	close(fd);
++	if (freesize) {
++		*freesize = avail_size_ddf(st, ldsize >> 9, INVALID_SECTORS);
++		if (*freesize == 0)
++			return 0;
++	}
++
++	return 1;
++}
++
+ static int validate_geometry_ddf(struct supertype *st,
+ 				 int level, int layout, int raiddisks,
+ 				 int *chunk, unsigned long long size,
+@@ -3347,11 +3376,9 @@ static int validate_geometry_ddf(struct supertype *st,
+ 		level = LEVEL_CONTAINER;
+ 	if (level == LEVEL_CONTAINER) {
+ 		/* Must be a fresh device to add to a container */
+-		return validate_geometry_ddf_container(st, level, layout,
+-						       raiddisks, *chunk,
+-						       size, data_offset, dev,
+-						       freesize,
+-						       verbose);
++		return validate_geometry_ddf_container(st, level, raiddisks,
++						       data_offset, dev,
++						       freesize, verbose);
+ 	}
+ 
+ 	if (!dev) {
+@@ -3449,43 +3476,6 @@ static int validate_geometry_ddf(struct supertype *st,
+ 	return 1;
+ }
+ 
+-static int
+-validate_geometry_ddf_container(struct supertype *st,
+-				int level, int layout, int raiddisks,
+-				int chunk, unsigned long long size,
+-				unsigned long long data_offset,
+-				char *dev, unsigned long long *freesize,
+-				int verbose)
+-{
+-	int fd;
+-	unsigned long long ldsize;
+-
+-	if (level != LEVEL_CONTAINER)
+-		return 0;
+-	if (!dev)
+-		return 1;
+-
+-	fd = dev_open(dev, O_RDONLY|O_EXCL);
+-	if (fd < 0) {
+-		if (verbose)
+-			pr_err("ddf: Cannot open %s: %s\n",
+-			       dev, strerror(errno));
+-		return 0;
+-	}
+-	if (!get_dev_size(fd, dev, &ldsize)) {
+-		close(fd);
+-		return 0;
+-	}
+-	close(fd);
+-	if (freesize) {
+-		*freesize = avail_size_ddf(st, ldsize >> 9, INVALID_SECTORS);
+-		if (*freesize == 0)
+-			return 0;
+-	}
+-
+-	return 1;
+-}
+-
+ static int validate_geometry_ddf_bvd(struct supertype *st,
+ 				     int level, int layout, int raiddisks,
+ 				     int *chunk, unsigned long long size,
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch b/meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch
new file mode 100644
index 0000000000..fafe88b49c
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch
@@ -0,0 +1,56 @@
+From 14f110f0286d38e29ef5e51d7f72e049c2f18323 Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:08 -0600
+Subject: [PATCH 2/4] DDF: Fix NULL pointer dereference in
+ validate_geometry_ddf()
+
+A relatively recent patch added a call to validate_geometry() in
+Manage_add() that has level=LEVEL_CONTAINER and chunk=NULL.
+
+This causes some ddf tests to segfault which aborts the test suite.
+
+To fix this, avoid dereferencing chunk when the level is
+LEVEL_CONTAINER or LEVEL_NONE.
+
+Fixes: 1f5d54a06df0 ("Manage: Call validate_geometry when adding drive to external container")
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=2b93288a5650
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ super-ddf.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/super-ddf.c b/super-ddf.c
+index 65cf727..3ef1293 100644
+--- a/super-ddf.c
++++ b/super-ddf.c
+@@ -3369,9 +3369,6 @@ static int validate_geometry_ddf(struct supertype *st,
+ 	 * If given BVDs, we make an SVD, changing all the GUIDs in the process.
+ 	 */
+ 
+-	if (*chunk == UnSet)
+-		*chunk = DEFAULT_CHUNK;
+-
+ 	if (level == LEVEL_NONE)
+ 		level = LEVEL_CONTAINER;
+ 	if (level == LEVEL_CONTAINER) {
+@@ -3381,6 +3378,9 @@ static int validate_geometry_ddf(struct supertype *st,
+ 						       freesize, verbose);
+ 	}
+ 
++	if (*chunk == UnSet)
++		*chunk = DEFAULT_CHUNK;
++
+ 	if (!dev) {
+ 		mdu_array_info_t array = {
+ 			.level = level,
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch b/meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch
new file mode 100644
index 0000000000..a954ab027a
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch
@@ -0,0 +1,91 @@
+From bd064da1469a6a07331b076a0294a8c6c3c38526 Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:09 -0600
+Subject: [PATCH 3/4] mdadm/Grow: Fix use after close bug by closing after fork
+
+The test 07reshape-grow fails most of the time. But it succeeds around
+1 in 5 times. When it does succeed, it causes the tests to die because
+mdadm has segfaulted.
+
+The segfault was caused by mdadm attempting to repoen a file
+descriptor that was already closed. The backtrace of the segfault
+was:
+
+  #0  __strncmp_avx2 () at ../sysdeps/x86_64/multiarch/strcmp-avx2.S:101
+  #1  0x000056146e31d44b in devnm2devid (devnm=0x0) at util.c:956
+  #2  0x000056146e31dab4 in open_dev_flags (devnm=0x0, flags=0)
+                         at util.c:1072
+  #3  0x000056146e31db22 in open_dev (devnm=0x0) at util.c:1079
+  #4  0x000056146e3202e8 in reopen_mddev (mdfd=4) at util.c:2244
+  #5  0x000056146e329f36 in start_array (mdfd=4,
+              mddev=0x7ffc55342450 "/dev/md0", content=0x7ffc55342860,
+              st=0x56146fc78660, ident=0x7ffc55342f70, best=0x56146fc6f5d0,
+              bestcnt=10, chosen_drive=0, devices=0x56146fc706b0, okcnt=5,
+	      sparecnt=0,  rebuilding_cnt=0, journalcnt=0, c=0x7ffc55342e90,
+	      clean=1,  avail=0x56146fc78720 "\001\001\001\001\001",
+	      start_partial_ok=0, err_ok=0, was_forced=0)
+	                  at Assemble.c:1206
+  #6  0x000056146e32c36e in Assemble (st=0x56146fc78660,
+               mddev=0x7ffc55342450 "/dev/md0", ident=0x7ffc55342f70,
+	       devlist=0x56146fc6e2d0, c=0x7ffc55342e90)
+	                 at Assemble.c:1914
+  #7  0x000056146e312ac9 in main (argc=11, argv=0x7ffc55343238)
+                         at mdadm.c:1510
+
+The file descriptor was closed early in Grow_continue(). The noted commit
+moved the close() call to close the fd above the fork which caused the
+parent process to return with a closed fd.
+
+This meant reshape_array() and Grow_continue() would return in the parent
+with the fd forked. The fd would eventually be passed to reopen_mddev()
+which returned an unhandled NULL from fd2devnm() which would then be
+dereferenced in devnm2devid.
+
+Fix this by moving the close() call below the fork. This appears to
+fix the 07revert-grow test. While we're at it, switch to using
+close_fd() to invalidate the file descriptor.
+
+Fixes: 77b72fa82813 ("mdadm/Grow: prevent md's fd from being occupied during delayed time")
+Cc: Alex Wu <alexwu@synology.com>
+Cc: BingJing Chang <bingjingc@synology.com>
+Cc: Danny Shih <dannyshih@synology.com>
+Cc: ChangSyun Peng <allenpeng@synology.com>
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=548e9b916f86
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Grow.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Grow.c b/Grow.c
+index 9c6fc95..a8e4e83 100644
+--- a/Grow.c
++++ b/Grow.c
+@@ -3501,7 +3501,6 @@ started:
+ 			return 0;
+ 		}
+ 
+-	close(fd);
+ 	/* Now we just need to kick off the reshape and watch, while
+ 	 * handling backups of the data...
+ 	 * This is all done by a forked background process.
+@@ -3522,6 +3521,9 @@ started:
+ 		break;
+ 	}
+ 
++	/* Close unused file descriptor in the forked process */
++	close_fd(&fd);
++
+ 	/* If another array on the same devices is busy, the
+ 	 * reshape will wait for them.  This would mean that
+ 	 * the first section that we suspend will stay suspended
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch b/meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch
new file mode 100644
index 0000000000..72cb40f782
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch
@@ -0,0 +1,42 @@
+From 2296a4a441b4b8546e2eb32403930f1bb8f3ee4a Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:10 -0600
+Subject: [PATCH 4/4] monitor: Avoid segfault when calling NULL get_bad_blocks
+
+Not all struct superswitch implement a get_bad_blocks() function,
+yet mdmon seems to call it without checking for NULL and thus
+occasionally segfaults in the test 10ddf-geometry.
+
+Fix this by checking for NULL before calling it.
+
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=9ae62977b51d
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ monitor.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/monitor.c b/monitor.c
+index afc3e50..8e43c0d 100644
+--- a/monitor.c
++++ b/monitor.c
+@@ -312,6 +312,9 @@ static int check_for_cleared_bb(struct active_array *a, struct mdinfo *mdi)
+ 	struct md_bb *bb;
+ 	int i;
+ 
++	if (!ss->get_bad_blocks)
++		return -1;
++
+ 	/*
+ 	 * Get a list of bad blocks for an array, then read list of
+ 	 * acknowledged bad blocks from kernel and compare it against metadata
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index aa97eef3ce..1851e058fd 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -30,6 +30,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-tests-fix-raid0-tests-for-0.90-metadata.patch \
            file://0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch \
            file://0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch \
+           file://0001-DDF-Cleanup-validate_geometry_ddf_container.patch \
+           file://0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch \
+           file://0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch \
+           file://0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.34.1


