Return-Path: <oleg.zhurakivskyy@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D62D373398
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:01:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Feb 2015 05:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,565,1418112000"; d="scan'208";a="665383336"
Received: from ozhuraki.fi.intel.com ([10.237.67.31])
	by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2015 05:01:40 -0800
From: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Feb 2015 15:01:37 +0200
Message-Id: <1423746097-4198-3-git-send-email-oleg.zhurakivskyy@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423746097-4198-1-git-send-email-oleg.zhurakivskyy@intel.com>
References: <1423746097-4198-1-git-send-email-oleg.zhurakivskyy@intel.com>
Subject: [PATCH 2/2] neardal: Add recipe
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
X-List-Received-Date: Thu, 12 Feb 2015 13:01:41 -0000

Signed-off-by: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
---
 meta/recipes-connectivity/neardal/neardal.inc      | 22 +++++++++++++++++++
 .../recipes-connectivity/neardal/neardal/ncl.patch | 25 ++++++++++++++++++++++
 meta/recipes-connectivity/neardal/neardal_0.14.bb  |  6 ++++++
 3 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/neardal/neardal.inc
 create mode 100644 meta/recipes-connectivity/neardal/neardal/ncl.patch
 create mode 100644 meta/recipes-connectivity/neardal/neardal_0.14.bb

diff --git a/meta/recipes-connectivity/neardal/neardal.inc b/meta/recipes-connectivity/neardal/neardal.inc
new file mode 100644
index 0000000..dab392a
--- /dev/null
+++ b/meta/recipes-connectivity/neardal/neardal.inc
@@ -0,0 +1,22 @@
+SUMMARY = "Neard Abstraction Library (NeardAL)"
+
+DESCRIPTION = "NeardAL is a library that provides a simple C API \
+to exchange data with NFC daemon (Neard)."
+
+HOMEPAGE = "https://github.com/connectivity/neardal"
+SECTION = "libs"
+LICENSE = "LGPLv2"
+
+DEPENDS = "glib-2.0 libedit"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
+	file://lib/neardal.h;endline=20;md5=a53e93aea9357387078ed217565c0a99"
+
+inherit autotools pkgconfig
+
+PACKAGES =+ "${PN}-tools ${PN}-tools-dbg"
+
+FILES_${PN}-tools = "${libexecdir}/ncl"
+FILES_${PN}-tools-dbg += "${libexecdir}/.debug"
+
+RDEPENDS_${PN}-tools = "bash"
diff --git a/meta/recipes-connectivity/neardal/neardal/ncl.patch b/meta/recipes-connectivity/neardal/neardal/ncl.patch
new file mode 100644
index 0000000..baef6cc
--- /dev/null
+++ b/meta/recipes-connectivity/neardal/neardal/ncl.patch
@@ -0,0 +1,25 @@
+From eab402bae42c3ea5caa8d540b6702d39e56c84c1 Mon Sep 17 00:00:00 2001
+From: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
+Date: Tue, 10 Feb 2015 12:58:39 +0200
+Subject: [PATCH] build: Install ncl
+
+Signed-off-by: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
+---
+ ncl/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ncl/Makefile.am b/ncl/Makefile.am
+index beda75b..c06742f 100644
+--- a/ncl/Makefile.am
++++ b/ncl/Makefile.am
+@@ -1,6 +1,6 @@
+ AM_CPPFLAGS = @gio_CFLAGS@ -I$(top_builddir)/lib -I$(top_srcdir)/lib
+ 
+-noinst_PROGRAMS=ncl
++libexec_PROGRAMS = ncl
+ 
+ ncl_SOURCES = \
+ 	$(srcdir)/ncl.c $(srcdir)/ncl.h \
+-- 
+2.1.0
+
diff --git a/meta/recipes-connectivity/neardal/neardal_0.14.bb b/meta/recipes-connectivity/neardal/neardal_0.14.bb
new file mode 100644
index 0000000..5306e49
--- /dev/null
+++ b/meta/recipes-connectivity/neardal/neardal_0.14.bb
@@ -0,0 +1,6 @@
+require neardal.inc
+
+SRC_URI = "https://github.com/connectivity/neardal/archive/${PV}.tar.gz \
+	file://ncl.patch"
+SRC_URI[md5sum] = "3dbda58253ca30ee6a7a7573eaa68f40"
+SRC_URI[sha256sum] = "157d320bd831d91a82203d9697d2d2a2cebdb515d6e1c4ce04fe8ef27d1da615"
-- 
2.1.0


