Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F05496D1B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 08:12:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Oct 2013 01:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="427521173"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2013 01:12:15 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 10:17:08 +0200
Message-Id: <dc4d2b797505afc5570010facded7c8b2da8d0be.1383207214.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383207214.git.cristiana.voicu@intel.com>
References: <cover.1383207214.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1383207214.git.cristiana.voicu@intel.com>
References: <cover.1383207214.git.cristiana.voicu@intel.com>
Subject: [PATCH_V2 2/2] liburcu: upgrade to 0.8.0
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
X-List-Received-Date: Thu, 31 Oct 2013 08:12:14 -0000

Fix case where ${B} != ${S}; add patch to allow out
of tree doc exemples build to work
Add patch to remove CC=gcc when CC is defined, in order to
use the cross compiler.

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/recipes-support/liburcu/files/fixCCflag.patch |   20 ++++++++++++++++++++
 .../liburcu/files/fixsepbuild.patch                |   19 +++++++++++++++++++
 .../liburcu/{liburcu_0.7.7.bb => liburcu_0.8.0.bb} |    8 +++++---
 3 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/liburcu/files/fixCCflag.patch
 create mode 100644 meta/recipes-support/liburcu/files/fixsepbuild.patch
 rename meta/recipes-support/liburcu/{liburcu_0.7.7.bb => liburcu_0.8.0.bb} (74%)

diff --git a/meta/recipes-support/liburcu/files/fixCCflag.patch b/meta/recipes-support/liburcu/files/fixCCflag.patch
new file mode 100644
index 0000000..2e526d4
--- /dev/null
+++ b/meta/recipes-support/liburcu/files/fixCCflag.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Pending
+
+Use cross compiler for doc exemples too
+
+Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
+
+Index: userspace-rcu-0.8.0/doc/examples/Makefile.examples.template
+===================================================================
+--- userspace-rcu-0.8.0.orig/doc/examples/Makefile.examples.template	2013-08-30 21:25:20.000000000 +0300
++++ userspace-rcu-0.8.0/doc/examples/Makefile.examples.template	2013-10-23 13:34:30.405550556 +0300
+@@ -11,7 +11,9 @@
+ #
+ # This makefile is purposefully kept simple to support GNU and BSD make.
+ 
++ifndef CC
+ CC = gcc
++endif
+ CFLAGS = -g -O2 -Wall
+ 
+ all: $(BINARY)
diff --git a/meta/recipes-support/liburcu/files/fixsepbuild.patch b/meta/recipes-support/liburcu/files/fixsepbuild.patch
new file mode 100644
index 0000000..9cd0ab9
--- /dev/null
+++ b/meta/recipes-support/liburcu/files/fixsepbuild.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Pending
+
+Fix out of tree build for doc examples
+
+Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
+
+Index: userspace-rcu-0.8.0/doc/examples/Makefile.am
+===================================================================
+--- userspace-rcu-0.8.0.orig/doc/examples/Makefile.am	2013-08-30 21:25:20.000000000 +0300
++++ userspace-rcu-0.8.0/doc/examples/Makefile.am	2013-10-21 17:52:34.774597179 +0300
+@@ -128,7 +128,7 @@
+ 			cp -fR $(srcdir)/$$subdir $(builddir); \
+ 		done; \
+ 	fi
+-	$(MAKE) -f dist-files/Makefile AM_CPPFLAGS="$(CPPFLAGS) -I../../../urcu/ -I../../../" AM_CFLAGS='$(CFLAGS)' AM_LDFLAGS='$(LDFLAGS) -L../../../.libs/ -Wl,-rpath="$(PWD)/../../.libs/"' $(AM_MAKEFLAGS) all
++	$(MAKE) -f dist-files/Makefile AM_CPPFLAGS="$(CPPFLAGS) -I$(top_srcdir) -I../../../urcu/ -I../../../" AM_CFLAGS='$(CFLAGS)' AM_LDFLAGS='$(LDFLAGS) -L../../../.libs/ -Wl,-rpath="$(PWD)/../../.libs/"' $(AM_MAKEFLAGS) all
+ 
+ clean-local:
+ 	$(MAKE) -f dist-files/Makefile $(AM_MAKEFLAGS) clean
diff --git a/meta/recipes-support/liburcu/liburcu_0.7.7.bb b/meta/recipes-support/liburcu/liburcu_0.8.0.bb
similarity index 74%
rename from meta/recipes-support/liburcu/liburcu_0.7.7.bb
rename to meta/recipes-support/liburcu/liburcu_0.8.0.bb
index a75e92e..0bb4545 100644
--- a/meta/recipes-support/liburcu/liburcu_0.7.7.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.8.0.bb
@@ -7,10 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
                     file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
 
-SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
+SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
+           file://fixsepbuild.patch \
+           file://fixCCflag.patch"
 
-SRC_URI[md5sum] = "d14de3ff32eb1ab9424b258599c8a6f3"
-SRC_URI[sha256sum] = "8ab8a7d8fea47c09ceac24c9277f00da626bbd9426c973eb325b1baf33b4bdfb"
+SRC_URI[md5sum] = "ddf193131b9f172c8f540b60d9d339f4"
+SRC_URI[sha256sum] = "49fbe70af47945037f437931c9539bfb9cb03ba28b813649ea7394dbdca70658"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.7.9.5


