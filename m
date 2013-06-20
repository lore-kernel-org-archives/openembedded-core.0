Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 499FE6AD40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 13:38:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5KDctdA025884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jun 2013 06:38:56 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 20 Jun 2013 06:38:55 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 20 Jun 2013 21:38:24 +0800
Message-ID: <758386d655239d5687661703adc5a3a06565b9aa.1371735435.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1371735435.git.kai.kang@windriver.com>
References: <cover.1371735435.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] tcl: remove hardcoded library install path
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
X-List-Received-Date: Thu, 20 Jun 2013 13:38:55 -0000
Content-Type: text/plain

Remove hardcoded library install path and then install library to
${libdir}.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../tcl/tcl-remove-hardcoded-install-path.patch    |   37 ++++++++++++++++++++
 meta/recipes-devtools/tcltk/tcl_8.6.0.bb           |    5 ++-
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch

diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
new file mode 100644
index 0000000..9afca5e
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
@@ -0,0 +1,37 @@
+From 6efc98774681795712073c2b91e5e9d1763239b8 Mon Sep 17 00:00:00 2001
+From: "Song.Li" <Song.Li@windriver.com>
+Date: Wed, 1 Aug 2012 19:05:51 +0800
+Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
+
+Remove hardcoded library install path. Change $(prefix)/lib/ to ${libdir}.
+
+[YOCTO #2876]
+
+This is not a bug, but libraries should be installed into directory .../lib/.
+On 64bit target that should be lib64/.
+
+Upsteam Status: Inappropriate [configuration]
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ configure |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 478a4d5..79c2979 100755
+--- a/configure
++++ b/configure
+@@ -18772,7 +18772,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+ 
+ eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
+ 
+-TCL_LIBRARY='$(prefix)/lib/tcl$(VERSION)'
++TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
+ PRIVATE_INCLUDE_DIR='$(includedir)'
+ HTML_DIR='$(DISTDIR)/html'
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.0.bb b/meta/recipes-devtools/tcltk/tcl_8.6.0.bb
index 7648a81..95556e2 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.0.bb
@@ -17,7 +17,8 @@ BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
 SRC_URI = "${BASE_SRC_URI} \
 	   file://fix_non_native_build_issue.patch \
 	   file://fix_issue_with_old_distro_glibc.patch \
-     file://no_packages.patch"
+	   file://no_packages.patch \
+	   file://tcl-remove-hardcoded-install-path.patch"
 
 SRC_URI[md5sum] = "573aa5fe678e9185ef2b3c56b24658d3"
 SRC_URI[sha256sum] = "354422b9c4791685499123b2dfe01faa98b555c08906c010cb4449ddc75dcade"
@@ -65,7 +66,7 @@ tcl_sysroot_preprocess () {
 
 PACKAGES =+ "tcl-lib"
 FILES_tcl-lib = "${libdir}/libtcl8.6.so*"
-FILES_${PN} += "${prefix}/lib/tcl8.6 ${prefix}/lib/tcl8"
+FILES_${PN} += "${libdir}/tcl8.6 ${libdir}/tcl8"
 FILES_${PN}-dev += "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
 
 # isn't getting picked up by shlibs code
-- 
1.7.5.4


