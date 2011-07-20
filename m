Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDY-0001ZJ-5o
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753351"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:34 -0700
Message-Id: <28d06c0e89a302478ed339d17802b4d184e6a9d3.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 47/50] mesa-dri: Fix build on uclibc
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
X-List-Received-Date: Wed, 20 Jul 2011 08:36:52 -0000

From: Khem Raj <raj.khem@gmail.com>

We do not enable locales with uclibc in oe
Imported from oe.dev rev f2253e23c7fbbf2bfa1a0d1b47342800755e71c6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri/uclibc.patch |   26 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb    |    6 +++-
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri/uclibc.patch

diff --git a/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch b/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch
new file mode 100644
index 0000000..c87c354
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch
@@ -0,0 +1,26 @@
+Index: Mesa-7.10.2/src/mesa/main/imports.c
+===================================================================
+--- Mesa-7.10.2.orig/src/mesa/main/imports.c	2011-03-01 12:57:29.000000000 -0800
++++ Mesa-7.10.2/src/mesa/main/imports.c	2011-07-19 10:02:32.593779110 -0700
+@@ -757,7 +757,7 @@
+ float
+ _mesa_strtof( const char *s, char **end )
+ {
+-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && !defined(__UCLIBC__)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+Index: Mesa-7.10.2/src/glsl/strtod.c
+===================================================================
+--- Mesa-7.10.2.orig/src/glsl/strtod.c	2011-01-03 16:45:51.000000000 -0800
++++ Mesa-7.10.2/src/glsl/strtod.c	2011-07-19 10:02:32.643779110 -0700
+@@ -44,7 +44,7 @@
+ double
+ glsl_strtod(const char *s, char **end)
+ {
+-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && !defined(__UCLIBC__)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
index c7bd974..aac7a1c 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
@@ -8,10 +8,12 @@ LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat
 
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native python-native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
-           file://crossfix.patch"
+           file://crossfix.patch \
+           file://uclibc.patch \
+          "
 
 SRC_URI[md5sum] = "f5de82852f1243f42cc004039e10b771"
 SRC_URI[sha256sum] = "8ced2678ce11cf30804694a92ea3ca6b82f158ae8995bdc626c7e85aac71c7c1"
-- 
1.7.3.4



