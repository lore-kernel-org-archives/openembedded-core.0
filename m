Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9513060DD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Oct 2014 17:42:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Oct 2014 10:42:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,740,1406617200"; d="scan'208";a="591058088"
Received: from unknown (HELO localhost.jf.intel.com) ([10.7.201.167])
	by orsmga001.jf.intel.com with ESMTP; 17 Oct 2014 10:41:39 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Oct 2014 10:41:36 -0700
Message-Id: <1413567696-20950-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] libtool: Extend fix-final-rpath.patch
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
X-List-Received-Date: Fri, 17 Oct 2014 17:42:43 -0000

When building upower from meta-oe, the following QA error occurred:
ERROR: QA Issue: package upower contains bad RPATH

It appears to have been caused by one of the cases fix-final-rpath.patch
is meant to address but missed. So this change fixes the additional case
that was causing upower to have the QA error.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 .../libtool/libtool/fix-final-rpath.patch                | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch b/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
index 5c275ff..6f9d321 100644
--- a/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
@@ -6,12 +6,13 @@ This works around the issue until it gets sorted out upstream.
 
 Fix suggested by Richard Purdie <richard.purdie@intel.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
 
 Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
 ===================================================================
 --- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
 +++ libtool-2.4.2/libltdl/config/ltmain.m4sh
-@@ -7268,9 +7268,11 @@ EOF
+@@ -7268,9 +7268,11 @@
  	  test "$opt_mode" != relink && rpath="$compile_rpath$rpath"
  	  for libdir in $rpath; do
  	    if test -n "$hardcode_libdir_flag_spec"; then
@@ -25,7 +26,7 @@ Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
  		if test -z "$hardcode_libdirs"; then
  		  hardcode_libdirs="$libdir"
  		else
-@@ -7999,6 +8001,10 @@ EOF
+@@ -7999,6 +8001,10 @@
        hardcode_libdirs=
        for libdir in $compile_rpath $finalize_rpath; do
  	if test -n "$hardcode_libdir_flag_spec"; then
@@ -36,3 +37,14 @@ Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
  	  if test -n "$hardcode_libdir_separator"; then
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs="$libdir"
+@@ -8050,6 +8056,10 @@
+       hardcode_libdirs=
+       for libdir in $finalize_rpath; do
+ 	if test -n "$hardcode_libdir_flag_spec"; then
++	  func_replace_sysroot "$libdir"
++	  libdir=$func_replace_sysroot_result
++	  func_stripname '=' '' "$libdir"
++	  libdir=$func_stripname_result
+ 	  if test -n "$hardcode_libdir_separator"; then
+ 	    if test -z "$hardcode_libdirs"; then
+ 	      hardcode_libdirs="$libdir"
-- 
1.9.3


