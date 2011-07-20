Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDW-0001ZN-ST
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753344"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:31 -0700
Message-Id: <6553480f1a0d19545d688460b1f6ad8cf42daa05.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 44/50] clutter-box2d: Replace use of finite macro with C99 compliant isfinite()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jul 2011 08:33:21 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../clutter/clutter-box2d-1.6_0.10.0.bb            |    6 ++++--
 .../clutter/clutter-box2d/isfinite.patch           |   19 +++++++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch

diff --git a/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb b/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
index ad94aa5..a0024d0 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
+++ b/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
@@ -1,11 +1,13 @@
 require clutter-box2d.inc
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "clutter-1.6"
 
 SRC_URI = "http://source.clutter-project.org/sources/clutter-box2d/0.10/clutter-box2d-${PV}.tar.bz2 \
-           file://fix-disable-introspection.patch"
+           file://fix-disable-introspection.patch \
+           file://isfinite.patch \
+          "
 
 S = "${WORKDIR}/clutter-box2d-${PV}"
 
diff --git a/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch b/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
new file mode 100644
index 0000000..fd2bf74
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
@@ -0,0 +1,19 @@
+_finite is obsoleted and C99 has isfinite instead so we should use it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h
+===================================================================
+--- clutter-box2d-0.10.0.orig/box2d/Source/Common/b2Math.h	2008-12-16 06:42:10.000000000 -0800
++++ clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h	2011-07-17 02:10:29.833825198 -0700
+@@ -60,7 +60,7 @@
+ #ifdef _MSC_VER
+ 	return _finite(x) != 0;
+ #else
+-	return finite(x) != 0;
++	return std::isfinite(x) != 0;
+ #endif
+ }
+ 
-- 
1.7.3.4



