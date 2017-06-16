Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 082F378487
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:28:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279529"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:28:57 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:32 +0300
Message-Id: <cf325ab69815c7e0105f3b842daf723168e56ea5.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/32] trace-cmd: update to 2.6.1
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
X-List-Received-Date: Fri, 16 Jun 2017 12:28:57 -0000

License change is due to update in FSF address.

Library path needs to be specified in absolute form now.

Remove bash completion file from kernelshark package as it will cause
a conflict with trace-cmd package.

Add a patch to resolve musl build issues.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/trace-cmd/kernelshark_git.bb   |  3 ++-
 meta/recipes-kernel/trace-cmd/trace-cmd.inc        |  5 ++--
 ...its.h-so-that-PATH_MAX-is-defined-an-issu.patch | 27 ++++++++++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb     |  4 ++--
 4 files changed, 34 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/0001-Include-limits.h-so-that-PATH_MAX-is-defined-an-issu.patch

diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
index 563182c89fe..9a5e8006c78 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
@@ -15,7 +15,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 EXTRA_OEMAKE = "\
     'prefix=${prefix}' \
     'bindir_relative=${@oe.path.relative(prefix, bindir)}' \
-    'libdir=${@oe.path.relative(prefix, libdir)}' \
+    'libdir=${libdir}' \
     NO_PYTHON=1 \
     gui \
 "
@@ -28,5 +28,6 @@ do_install() {
     oe_runmake DESTDIR="${D}" install_gui
     rm ${D}${bindir}/trace-cmd
     rm -rf ${D}${libdir}/trace-cmd
+    rm -rf ${D}${sysconfdir}/bash_completion.d/trace-cmd.bash
     rmdir ${D}${libdir}
 }
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd.inc b/meta/recipes-kernel/trace-cmd/trace-cmd.inc
index 3ad06fad81b..002ee65fda7 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd.inc
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd.inc
@@ -1,5 +1,5 @@
-SRCREV = "9be5d74805830a291615f2f34a27c903f6a37b1e"
-PV = "2.6"
+SRCREV = "021710e1073fe203341b427cd1a4bac577ec899c"
+PV = "2.6.1"
 
 inherit pkgconfig
 
@@ -7,6 +7,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/trace-cmd:"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=trace-cmd-stable-v2.6 \
            file://blktrace-api-compatibility.patch \
+           file://0001-Include-limits.h-so-that-PATH_MAX-is-defined-an-issu.patch \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/0001-Include-limits.h-so-that-PATH_MAX-is-defined-an-issu.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/0001-Include-limits.h-so-that-PATH_MAX-is-defined-an-issu.patch
new file mode 100644
index 00000000000..57630835695
--- /dev/null
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd/0001-Include-limits.h-so-that-PATH_MAX-is-defined-an-issu.patch
@@ -0,0 +1,27 @@
+From 9488f92c1d0c7931c3e17950d1f9eea2aeb3e2bd Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 14 Jun 2017 15:56:18 +0300
+Subject: [PATCH] Include limits.h so that PATH_MAX is defined (an issue on
+ musl).
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ trace-listen.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/trace-listen.c b/trace-listen.c
+index 17ff9d8..838d6bc 100644
+--- a/trace-listen.c
++++ b/trace-listen.c
+@@ -31,6 +31,7 @@
+ #include <fcntl.h>
+ #include <signal.h>
+ #include <errno.h>
++#include <limits.h>
+ 
+ #include "trace-local.h"
+ #include "trace-msg.h"
+-- 
+2.11.0
+
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
index dd9a8a0ded6..fa9ffa3dc8f 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
@@ -5,7 +5,7 @@ require trace-cmd.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
-                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
+                    file://COPYING.LIB;md5=edb195fe538e4552c1f6ca0fd7bf4f0a \
                     file://trace-input.c;beginline=5;endline=8;md5=3ec82f43bbe0cfb5951ff414ef4d44d0 \
 "
 
@@ -17,7 +17,7 @@ EXTRA_OEMAKE = "\
     'img_install=${datadir}/kernelshark/html/images' \
     \
     'bindir_relative=${@oe.path.relative(prefix, bindir)}' \
-    'libdir=${@oe.path.relative(prefix, libdir)}' \
+    'libdir=${libdir}' \
     \
     NO_PYTHON=1 \
 "
-- 
2.11.0


