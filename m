Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8BkJ-0005uO-AK
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 15:33:39 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 07:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77933642"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.170])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Mar 2012 07:24:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 14:24:44 +0000
Message-Id: <e154b4c675bb7c0920a0dac3af23365772e20aa7.1331821447.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331821447.git.paul.eggleton@linux.intel.com>
References: <cover.1331821447.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331821447.git.paul.eggleton@linux.intel.com>
References: <cover.1331821447.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] python-imaging: bring in fixes from meta-oe
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
X-List-Received-Date: Thu, 15 Mar 2012 14:33:39 -0000

This makes the following changes:
* Replace the /usr/local/bin/python path in all scripts
* Move RDEPENDS_${PN} to the end (but use += or we lose the python-core
  depencency).
* Use PR = "r3" instead of "ml2". (Even without increasing the numeric
  part it is recognised as greater alphabetically.)
* Bring in meta-oe version of the path patch which avoids the following
  warning:

WARNING: python-imaging: The compile log indicates that host include
and/or library paths were used.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...ng-setup.py-force-paths-for-zlib-freetyp.patch} |   36 +++++++++++++++----
 .../python/python-imaging_1.1.7.bb                 |    9 +++--
 2 files changed, 34 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/python-imaging/{path.patch => 0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch} (47%)

diff --git a/meta/recipes-devtools/python/python-imaging/path.patch b/meta/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
similarity index 47%
rename from meta/recipes-devtools/python/python-imaging/path.patch
rename to meta/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
index a5bba75..2575306 100644
--- a/meta/recipes-devtools/python/python-imaging/path.patch
+++ b/meta/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
@@ -1,9 +1,19 @@
+From 07d4f095a9e22ae676a8d68073101131e65012dc Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 15 Nov 2011 13:16:54 +0100
+Subject: [PATCH] python imaging setup.py: force paths for zlib, freetype and jpeg and don't add host paths
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
 Upstream-Status: Inappropriate [embedded specific]
+---
+ setup.py |   14 +++-----------
+ 1 files changed, 3 insertions(+), 11 deletions(-)
 
-Index: Imaging-1.1.7/setup.py
-===================================================================
---- Imaging-1.1.7.orig/setup.py
-+++ Imaging-1.1.7/setup.py
+diff --git a/setup.py b/setup.py
+index 5d4d53a..b1a22ec 100644
+--- a/setup.py
++++ b/setup.py
 @@ -34,10 +34,10 @@ def libinclude(root):
  # TIFF_ROOT = libinclude("/opt/tiff")
  
@@ -14,11 +24,19 @@ Index: Imaging-1.1.7/setup.py
 +ZLIB_ROOT = os.environ['STAGING_LIBDIR']
  TIFF_ROOT = None
 -FREETYPE_ROOT = None
-+FREETYPE_ROOT = os.environ['STAGING_LIBDIR'], os.environ['STAGING_INCDIR']
++FREETYPE_ROOT =  os.environ['STAGING_LIBDIR'], os.environ['STAGING_INCDIR']
  LCMS_ROOT = None
  
  # FIXME: add mechanism to explicitly *disable* the use of a library
-@@ -207,14 +207,6 @@ class pil_build_ext(build_ext):
+@@ -147,7 +147,6 @@ class pil_build_ext(build_ext):
+             add_directory(library_dirs, "/opt/local/lib")
+             add_directory(include_dirs, "/opt/local/include")
+ 
+-        add_directory(library_dirs, "/usr/local/lib")
+         # FIXME: check /opt/stuff directories here?
+ 
+         prefix = sysconfig.get_config_var("prefix")
+@@ -207,13 +206,6 @@ class pil_build_ext(build_ext):
              if os.path.isfile(os.path.join(tcl_dir, "tk.h")):
                  add_directory(include_dirs, tcl_dir)
  
@@ -29,7 +47,9 @@ Index: Imaging-1.1.7/setup.py
 -        add_directory(library_dirs, "/usr/lib")
 -        add_directory(include_dirs, "/usr/include")
 -
--        #
+         #
          # insert new dirs *before* default libs, to avoid conflicts
          # between Python PYD stub libs and real libraries
- 
+-- 
+1.7.2.5
+
diff --git a/meta/recipes-devtools/python/python-imaging_1.1.7.bb b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
index fc568b5..6d9743e 100644
--- a/meta/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -3,12 +3,11 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=92;endline=120;md5=c4371af4579f1e489cf881c1443dd4ec"
 DEPENDS = "freetype jpeg tiff"
-RDEPENDS_${PN} = "python-lang python-stringold"
 SRCNAME = "Imaging"
-PR = "ml2"
+PR = "r3"
 
 SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
-           file://path.patch"
+           file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch"
 
 SRC_URI[md5sum] = "fc14a54e1ce02a0225be8854bfba478e"
 SRC_URI[sha256sum] = "895bc7c2498c8e1f9b99938f1a40dc86b3f149741f105cf7c7bd2e0725405211"
@@ -30,4 +29,8 @@ do_install() {
     install -m 0644 ${S}/README ${D}${datadir}/doc/${PN}/
     install -m 0644 ${S}/Docs/* ${D}${datadir}/doc/${PN}/html/
 
+    # get rid of #!/usr/local/bin/python
+    sed -i -e 's:/usr/local/bin/:${bindir}/env :g' ${D}${bindir}/*
 }
+
+RDEPENDS_${PN} += "python-lang python-stringold"
-- 
1.7.5.4



