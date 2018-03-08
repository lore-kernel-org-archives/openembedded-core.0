Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3E31C78989
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053862"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:06 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:38 +0200
Message-Id: <20180308181804.31261-16-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/42] wayland: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:06 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../wayland/wayland/fixpathinpcfiles.patch         |  3 +--
 .../wayland/weston/0001-make-error-portable.patch  | 22 ++++++++++++++--------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
index 9fb12522843..ad3526d9845 100644
--- a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
+++ b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
@@ -21,8 +21,7 @@ Index: wayland-1.14.0/src/wayland-scanner.pc.in
 ===================================================================
 --- wayland-1.14.0.orig/src/wayland-scanner.pc.in
 +++ wayland-1.14.0/src/wayland-scanner.pc.in
-@@ -1,8 +1,8 @@
- prefix=@prefix@
+@@ -2,7 +2,7 @@ prefix=@prefix@
  exec_prefix=@exec_prefix@
  datarootdir=@datarootdir@
  pkgdatadir=@datadir@/@PACKAGE@
diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
index e2213aca60c..0671a450442 100644
--- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
@@ -16,9 +16,11 @@ Upstream-Status: Submitted
  3 files changed, 23 insertions(+), 1 deletion(-)
  create mode 100644 src/weston-error.h
 
---- a/configure.ac
-+++ b/configure.ac
-@@ -60,6 +60,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+Index: weston-3.0.0/configure.ac
+===================================================================
+--- weston-3.0.0.orig/configure.ac
++++ weston-3.0.0/configure.ac
+@@ -103,6 +103,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
  	      [[#include <time.h>]])
  AC_CHECK_HEADERS([execinfo.h])
  
@@ -26,9 +28,11 @@ Upstream-Status: Submitted
 +
  AC_CHECK_FUNCS([mkostemp strchrnul initgroups posix_fallocate])
  
- COMPOSITOR_MODULES="wayland-server >= $WAYLAND_PREREQ_VERSION pixman-1 >= 0.25.2"
+ # check for libdrm as a build-time dependency only
+Index: weston-3.0.0/libweston/weston-error.h
+===================================================================
 --- /dev/null
-+++ b/libweston/weston-error.h
++++ weston-3.0.0/libweston/weston-error.h
 @@ -0,0 +1,20 @@
 +#ifndef _WESTON_ERROR_H
 +#define _WESTON_ERROR_H
@@ -50,8 +54,10 @@ Upstream-Status: Submitted
 +
 +#endif
 +
---- a/libweston/weston-launch.c
-+++ b/libweston/weston-launch.c
+Index: weston-3.0.0/libweston/weston-launch.c
+===================================================================
+--- weston-3.0.0.orig/libweston/weston-launch.c
++++ weston-3.0.0/libweston/weston-launch.c
 @@ -33,7 +33,6 @@
  #include <poll.h>
  #include <errno.h>
@@ -60,7 +66,7 @@ Upstream-Status: Submitted
  #include <getopt.h>
  
  #include <sys/types.h>
-@@ -59,6 +58,7 @@
+@@ -60,6 +59,7 @@
  #endif
  
  #include "weston-launch.h"
-- 
2.16.1


