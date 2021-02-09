Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.12227.1612886002393736054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eZDorDahMsRGoTP44sTIuxhEfrI2iqJWmmVcal858d9GOt0xtQqK+FX8tTncyMvC2VIb6W2QyS
 UjvJi0pXBB5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182045270"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="182045270"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:26 -0800
IronPort-SDR: eo55UTtf0ISWX3GlHg4zse62+tUR5gJjiGfQsW9nU5/IKoKfydYFGvK4A7umW4lLVBYV2VM7yK
 j1twETc++k8g==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215656"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:24 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 33/35] meta: drop _PYTHON_SYSCONFIGDATA_NAME hacks
Date: Tue,  9 Feb 2021 23:52:18 +0800
Message-Id: <ef71f8fa1454775b1140673b211d773636b15212.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7901859e38de06c56b8535a8425e76cb114c57dc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/scons.bbclass          | 3 ---
 meta/lib/oe/prservice.py            | 4 ----
 meta/recipes-core/glib-2.0/glib.inc | 4 ----
 meta/recipes-graphics/mesa/mesa.inc | 5 -----
 4 files changed, 16 deletions(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 6b171ca8df..4f3ae502ef 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -5,7 +5,6 @@ DEPENDS += "python3-scons-native"
 EXTRA_OESCONS ?= ""
 
 do_configure() {
-	unset _PYTHON_SYSCONFIGDATA_NAME
 	if [ -n "${CONFIGURESTAMPFILE}" ]; then
 		if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${CLEANBROKEN}" != "1" ]; then
 			${STAGING_BINDIR_NATIVE}/scons --clean PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS}
@@ -17,13 +16,11 @@ do_configure() {
 }
 
 scons_do_compile() {
-	unset _PYTHON_SYSCONFIGDATA_NAME
 	${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
 	die "scons build execution failed."
 }
 
 scons_do_install() {
-	unset _PYTHON_SYSCONFIGDATA_NAME
 	${STAGING_BINDIR_NATIVE}/scons install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} install || \
 	die "scons install execution failed."
 }
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 2d3c9c7e50..fcdbe66c19 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -3,10 +3,6 @@
 #
 
 def prserv_make_conn(d, check = False):
-    # Otherwise this fails when called from recipes which e.g. inherit python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with:
-    # No module named '_sysconfigdata'
-    if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
-        del os.environ['_PYTHON_SYSCONFIGDATA_NAME']
     import prserv.serv
     host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
     try:
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index e48b5cb67b..71777bc459 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -34,10 +34,6 @@ DEPENDS_append_class-target = "${@' gtk-doc' if d.getVar('GTKDOC_ENABLED') == 'T
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-# This avoids the need to depend on target python3, which in case of mingw is not even possible.
-# meson's python configuration pokes into python3 configuration, so this provides the native config to it.
-unset _PYTHON_SYSCONFIGDATA_NAME
-
 S = "${WORKDIR}/glib-${PV}"
 
 PACKAGECONFIG ??= "system-pcre libmount \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9fc62e95e1..a4c7007157 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -48,11 +48,6 @@ PROVIDES = " \
 
 inherit meson pkgconfig python3native gettext features_check
 
-# Unset these to stop python trying to report the target Python setup
-_PYTHON_SYSCONFIGDATA_NAME[unexport] = "1"
-STAGING_INCDIR[unexport] = "1"
-STAGING_LIBDIR[unexport] = "1"
-
 BBCLASSEXTEND = "native nativesdk"
 
 ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"
-- 
2.29.2

