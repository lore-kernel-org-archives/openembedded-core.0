Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 692FF601B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 10:57:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 17 Feb 2016 02:57:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,459,1449561600"; d="scan'208";a="747881980"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 17 Feb 2016 02:57:49 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 287B16A4004
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 03:45:38 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 13:01:11 +0200
Message-Id: <1455706871-26812-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] busybox: drop patches that are not valid anymore
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
X-List-Received-Date: Wed, 17 Feb 2016 10:57:53 -0000

1. Removed following patches
        a) busybox-appletlib-dependency.patch
         - Kbuild rules handles that dependency
        b) get_header_tar.patch
         - tar applet uses a different code path to handle that scenario now.

2. Updated the upstream-status of fail_on_no_media.patch as Denied.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../busybox/busybox-appletlib-dependency.patch     | 37 ----------------------
 .../busybox/busybox/fail_on_no_media.patch         |  3 +-
 .../busybox/busybox/get_header_tar.patch           | 22 -------------
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  2 --
 meta/recipes-core/busybox/busybox_git.bb           |  2 --
 5 files changed, 2 insertions(+), 64 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-appletlib-dependency.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/get_header_tar.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-appletlib-dependency.patch b/meta/recipes-core/busybox/busybox/busybox-appletlib-dependency.patch
deleted file mode 100644
index de2dbcc..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-appletlib-dependency.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Pending
-
-# copy commit message from OE as the patch comment:
-#    commit 98c24291aa165f53423c27ae033831ce0b3bb676
-#    Author: Roman I Khimov <khimov@altell.ru>
-#    Date:   Thu Mar 26 23:03:58 2009 +0000
-#
-#    busybox: update appletlib dependency patch
-#    
-#    Previous version still failed from time to time on clean-start builds
-#    with 4 bitbake threads and '-j16'. Building busybox as sole target worked
-#    well.
-#    
-#    The reason is that previous version introduced a race between applets make
-#    processes spawned from top-level Makefile and from libbb Makefile.
-#    
-#    Fix it with high-level dependency that doesn't create races.
-#    
-#    Signed-off-by: Koen Kooi <koen@openembedded.org>
-#
-# above comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
-
-Index: busybox-1.13.2/Makefile
-===================================================================
---- busybox-1.13.2.orig/Makefile	2009-03-19 15:44:37.419270265 +0300
-+++ busybox-1.13.2/Makefile	2009-03-19 15:45:57.737521296 +0300
-@@ -471,6 +471,10 @@
- 		util-linux/ \
- 		util-linux/volume_id/ \
- 
-+# Lib interdeps
-+# libbb uses headers generated in applets
-+libbb: applets
-+
- endif # KBUILD_EXTMOD
- 
- ifeq ($(dot-config),1)
diff --git a/meta/recipes-core/busybox/busybox/fail_on_no_media.patch b/meta/recipes-core/busybox/busybox/fail_on_no_media.patch
index 6745f16..820acc2 100644
--- a/meta/recipes-core/busybox/busybox/fail_on_no_media.patch
+++ b/meta/recipes-core/busybox/busybox/fail_on_no_media.patch
@@ -1,4 +1,5 @@
-Upstream-Status: Pending
+Upstream-Status: Denied
+[https://www.mail-archive.com/busybox@busybox.net/msg22354.html]
 
 The current behaviour of busybox is to try all fstype when automounting
 even when no media exists.  The util-linux mount command bails when no
diff --git a/meta/recipes-core/busybox/busybox/get_header_tar.patch b/meta/recipes-core/busybox/busybox/get_header_tar.patch
deleted file mode 100644
index 0e528ff..0000000
--- a/meta/recipes-core/busybox/busybox/get_header_tar.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Pending
-
-# copy commit message from OE as the patch comment:
-#    commit 5a0e1d473ca7aca5ffefffe9a2ec44ae7a1f35bc
-#    Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
-#    Date:   Wed Feb 11 22:40:21 2009 +0100
-#
-#    busybox: fix tar problem with filenames that are exactly 100 bytes
-#
-# above comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
-
---- busybox-1.13.2/archival/libarchive/get_header_tar.c.orig	2008-11-09 18:28:02.000000000 +0100
-+++ busybox-1.13.2/archival/libarchive/get_header_tar.c	2009-02-11 22:34:52.000000000 +0100
-@@ -252,6 +252,8 @@
- 			file_header->name = concat_path_file(tar.prefix, tar.name);
- 		} else
- 			file_header->name = xstrdup(tar.name);
-+		if (strlen(file_header->name) > 100) 
-+			file_header->name[100] = 0;
- 	}
- 
- 	/* Set bits 12-15 of the files mode */
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 72c5c79..174ca47 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -1,8 +1,6 @@
 require busybox.inc
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
-           file://get_header_tar.patch \
-           file://busybox-appletlib-dependency.patch \
            file://busybox-udhcpc-no_deconfig.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index e590543..ae16b59 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -7,8 +7,6 @@ PV = "1.25.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://busybox.net/busybox.git \
-           file://get_header_tar.patch \
-           file://busybox-appletlib-dependency.patch \
            file://busybox-udhcpc-no_deconfig.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
-- 
2.4.0


