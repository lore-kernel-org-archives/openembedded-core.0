Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDX-0001aO-SG
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753349"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:33 -0700
Message-Id: <4fb98dee67ddcdbc35f6e5c203ddb7217cd55a97.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 46/50] mesa-xlib: Dont use locales with uclibc
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:22 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mesa/mesa-xlib/uclibc_locale.patch             |   31 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb     |    3 +-
 2 files changed, 33 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib/uclibc_locale.patch

diff --git a/meta/recipes-graphics/mesa/mesa-xlib/uclibc_locale.patch b/meta/recipes-graphics/mesa/mesa-xlib/uclibc_locale.patch
new file mode 100644
index 0000000..7076f02
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-xlib/uclibc_locale.patch
@@ -0,0 +1,31 @@
+We disable locale on uclibc in OE therefore we do not use it if building for uclibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate <OE config related>
+
+Index: Mesa-7.10.2/src/glsl/strtod.c
+===================================================================
+--- Mesa-7.10.2.orig/src/glsl/strtod.c	2011-01-03 16:45:51.000000000 -0800
++++ Mesa-7.10.2/src/glsl/strtod.c	2011-07-19 14:28:42.591809160 -0700
+@@ -44,7 +44,7 @@
+ double
+ glsl_strtod(const char *s, char **end)
+ {
+-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && !defined(__UCLIBC__)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+Index: Mesa-7.10.2/src/mesa/main/imports.c
+===================================================================
+--- Mesa-7.10.2.orig/src/mesa/main/imports.c	2011-03-01 12:57:29.000000000 -0800
++++ Mesa-7.10.2/src/mesa/main/imports.c	2011-07-19 16:11:02.301807753 -0700
+@@ -757,7 +757,7 @@
+ float
+ _mesa_strtof( const char *s, char **end )
+ {
+-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && !defined(__UCLIBC__)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
index b77df2c..848c072 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
@@ -1,6 +1,7 @@
 include mesa-common.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
+           file://uclibc_locale.patch \
            "
 
 SRC_URI[md5sum] = "f5de82852f1243f42cc004039e10b771"
@@ -14,6 +15,6 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF += "--with-driver=xlib"
-- 
1.7.3.4



