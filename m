Return-Path: <prvs=325539a752=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id F27327FEC9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 00:16:10 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xBI0AeoW007478 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 18:16:11 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2wvx501gem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 18:16:11 -0600
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	xBI0GATw025274
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 18:16:10 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 17 Dec 2019 18:16:10 -0600
Received: from delcastillo3.natinst.com (172.18.68.32) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Tue, 17 Dec 2019 18:16:10 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Dec 2019 18:16:08 -0600
Message-ID: <20191218001609.3750899-2-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218001609.3750899-1-alejandro.delcastillo@ni.com>
References: <20191218001609.3750899-1-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-12-17_05:2019-12-17,2019-12-17 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
Subject: [PATCH 1/2] opkg-utils: upgrade to version 0.4.2
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
X-List-Received-Date: Wed, 18 Dec 2019 00:16:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Drop 00001-Switch-all-scripts-to-use-Python-3.x.patch
- Drop 00001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch
- Drop pipefail.patch

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...0001-Switch-all-scripts-to-use-Python-3.x.patch | 113 ---------------------
 ...g-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch |  44 --------
 .../opkg-utils/opkg-utils/pipefail.patch           |  31 ------
 .../{opkg-utils_0.4.1.bb => opkg-utils_0.4.2.bb}   |  12 +--
 4 files changed, 4 insertions(+), 196 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.4.1.bb => opkg-utils_0.4.2.bb} (83%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch
deleted file mode 100644
index 691ed50c2b..0000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From d42b23f4fb5d6bd58e92e995fe5befc76efbae0c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 27 Apr 2017 15:47:58 +0300
-Subject: [PATCH] Switch all scripts to use Python 3.x
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- makePackage          | 2 +-
- opkg-compare-indexes | 2 +-
- opkg-graph-deps      | 2 +-
- opkg-list-fields     | 2 +-
- opkg-make-index      | 2 +-
- opkg-show-deps       | 2 +-
- opkg-unbuild         | 2 +-
- opkg-update-index    | 2 +-
- opkg.py              | 2 +-
- 9 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/makePackage b/makePackage
-index 4bdfc56..02124dd 100755
---- a/makePackage
-+++ b/makePackage
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python3
- 
- # The general algorithm this program follows goes like this:
- #   Run tar to extract control from control.tar.gz from the package.
-diff --git a/opkg-compare-indexes b/opkg-compare-indexes
-index b60d20a..80c1263 100755
---- a/opkg-compare-indexes
-+++ b/opkg-compare-indexes
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- from __future__ import absolute_import
- from __future__ import print_function
- 
-diff --git a/opkg-graph-deps b/opkg-graph-deps
-index 6653fd5..f1e376a 100755
---- a/opkg-graph-deps
-+++ b/opkg-graph-deps
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- from __future__ import absolute_import
- from __future__ import print_function
- 
-diff --git a/opkg-list-fields b/opkg-list-fields
-index c14a90f..24f7955 100755
---- a/opkg-list-fields
-+++ b/opkg-list-fields
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- from __future__ import absolute_import
- from __future__ import print_function
- 
-diff --git a/opkg-make-index b/opkg-make-index
-index 3f757f6..2988f9f 100755
---- a/opkg-make-index
-+++ b/opkg-make-index
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """
-    Utility to create opkg compatible indexes
- """
- 
-diff --git a/opkg-show-deps b/opkg-show-deps
-index 153f21e..4e18b4f 100755
---- a/opkg-show-deps
-+++ b/opkg-show-deps
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- from __future__ import absolute_import
- from __future__ import print_function
- 
-diff --git a/opkg-unbuild b/opkg-unbuild
-index 4f36bec..57642c9 100755
---- a/opkg-unbuild
-+++ b/opkg-unbuild
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- from __future__ import absolute_import
- from __future__ import print_function
- 
-diff --git a/opkg-update-index b/opkg-update-index
-index 341c1c2..7bff8a1 100755
---- a/opkg-update-index
-+++ b/opkg-update-index
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- from __future__ import absolute_import
- 
- import sys, os
-diff --git a/opkg.py b/opkg.py
-index 2ecac8a..7e64de4 100644
---- a/opkg.py
-+++ b/opkg.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #   Copyright (C) 2001 Alexander S. Guy <a7r@andern.org>
- #                      Andern Research Labs
- #
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch
deleted file mode 100644
index a181169d47..0000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 59da5577bf8df441c6ca958e50fcb83228702764 Mon Sep 17 00:00:00 2001
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Date: Thu, 12 Sep 2019 10:24:58 -0500
-Subject: [PATCH] opkg-build: clamp mtimes to SOURCE_DATE_EPOCH
-
-For reproducible builds, clamp mtimes bigger than SOURCE_DATE_EPOCH to
-SOURCE_DATE_EPOCH (build generated files, usually).
-
-Fixes bugzilla 13450
-
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- opkg-build | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/opkg-build b/opkg-build
-index dcd2d68..2517a2b 100755
---- a/opkg-build
-+++ b/opkg-build
-@@ -297,9 +297,16 @@ mkdir $tmp_dir
- 
- build_date="${SOURCE_DATE_EPOCH:-$(date +%s)}"
- 
-+mtime_args=""
-+# --clamp-mtime requires tar > 1.28. Only use it if SOURCE_DATE_EPOCH is set, to avoid having a generic case dependency on tar > 1.28.
-+# this setting will make sure files generated at build time have consistent mtimes, for reproducible builds.
-+if [ ! -z "$SOURCE_DATE_EPOCH"  ]; then
-+    mtime_args="--mtime=@$build_date --clamp-mtime"
-+fi
-+
- ( cd $pkg_dir/$CONTROL && find . -type f > $tmp_dir/control_list )
- ( cd $pkg_dir && find . -path ./$CONTROL -prune -o -print > $tmp_dir/file_list )
--( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
-+( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion $mtime_args -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
- ( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion --mtime=@$build_date -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $tmp_dir/control.tar.gz )
- rm $tmp_dir/file_list
- rm $tmp_dir/control_list
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch
deleted file mode 100644
index 55ddcc1fd2..0000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-We need opkg-build to fail if for example the tar command is passed invalid 
-options. Without this, we see silently created empty packaged where data.tar
-is zero bytes in size. This creates hard to debug problems.
-
-An example is when reproducible builds are enabled and run on old hosts like
-centos7 which has tar < 1.28:
-
-Subprocess output:tar: unrecognized option '--clamp-mtime'
-Try `tar --help' or `tar --usage' for more information.
-
-Upstream-Status: Pending
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: opkg-utils-0.4.1/opkg-build
-===================================================================
---- opkg-utils-0.4.1.orig/opkg-build
-+++ opkg-utils-0.4.1/opkg-build
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- 
- : <<=cut
- =head1 NAME
-@@ -12,6 +12,7 @@ opkg-build - construct an .opk from a di
- #   Updated to work on Familiar Pre0.7rc1, with busybox tar.
- #   Note it Requires: binutils-ar (since the busybox ar can't create)
- set -e
-+set -o pipefail
- 
- version=1.0
- 
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
similarity index 83%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
index eb6c7a3a6a..6495726500 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
@@ -4,19 +4,15 @@ SECTION = "base"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://opkg.py;beginline=2;endline=18;md5=63ce9e6bcc445181cd9e4baf4b4ccc35"
+                    file://opkg.py;beginline=2;endline=18;md5=ffa11ff3c15eb31c6a7ceaa00cc9f986"
 PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
-SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
-           file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
-           file://0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch \
-           file://pipefail.patch \
+SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \ 
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
-
-SRC_URI[md5sum] = "8c140f835b694a0c27cfb23d2426a02b"
-SRC_URI[sha256sum] = "9ea9efdd9fe13661ad251e3a2860c1c93045adcfaa6659c3e86d9748ecda3b6e"
+SRC_URI[md5sum] = "cc210650644fcb9bba06ad5ec95a63ec"
+SRC_URI[sha256sum] = "5929ad87d541789e0b82d626db01a1201ac48df6f49f2262fcfb86cf815e5d6c"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.11.0


