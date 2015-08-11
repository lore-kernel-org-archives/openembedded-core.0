Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 003F7768C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 01:18:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7B1I8ce023810
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 18:18:08 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 10 Aug 2015 18:18:07 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Aug 2015 09:14:51 +0800
Message-ID: <1439255691-21873-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] weston: backport a patches to fix the building failure
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
X-List-Received-Date: Tue, 11 Aug 2015 01:18:11 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...-target-weston.ini-directories-before-wri.patch | 42 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-build-mkdir-target-weston.ini-directories-before-wri.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-build-mkdir-target-weston.ini-directories-before-wri.patch b/meta/recipes-graphics/wayland/weston/0001-build-mkdir-target-weston.ini-directories-before-wri.patch
new file mode 100644
index 0000000..a8fd846
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-build-mkdir-target-weston.ini-directories-before-wri.patch
@@ -0,0 +1,42 @@
+From 2eff22b8e6f6e5255a1915c33dfd91cecf02cbbc Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 17 Jul 2015 12:33:45 +0100
+Subject: [PATCH] build: mkdir target weston.ini directories before writing
+
+Upstream-Status: Backport
+
+In parallel out-of-tree builds it is possible for e.g. ivi-shell/weston.ini to
+be written before ivi-shell/ exists.  Solve this by creating the target
+directory first.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Reviewed-by: Quentin Glidic <sardemff7+git@sardemff7.net>
+---
+ Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a3590c0..76ab546 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,7 +20,7 @@ weston.ini : $(srcdir)/weston.ini.in
+ 		$< > $@
+ 
+ ivi-shell/weston.ini : $(srcdir)/ivi-shell/weston.ini.in
+-	$(AM_V_GEN)$(SED) \
++	$(AM_V_GEN)$(MKDIR_P) $(dir $@) && $(SED) \
+ 		-e 's|@bindir[@]|$(bindir)|g' \
+ 		-e 's|@abs_top_builddir[@]|$(abs_top_builddir)|g' \
+ 		-e 's|@abs_top_srcdir[@]|$(abs_top_srcdir)|g' \
+@@ -29,7 +29,7 @@ ivi-shell/weston.ini : $(srcdir)/ivi-shell/weston.ini.in
+ 		$< > $@
+ 
+ tests/weston-ivi.ini : $(srcdir)/ivi-shell/weston.ini.in
+-	$(AM_V_GEN)$(SED) \
++	$(AM_V_GEN)$(MKDIR_P) $(dir $@) && $(SED) \
+ 		-e 's|@bindir[@]|$(bindir)|g' \
+ 		-e 's|@abs_top_builddir[@]|$(abs_top_builddir)|g' \
+ 		-e 's|@abs_top_srcdir[@]|$(abs_top_srcdir)|g' \
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index 342c604..515c712 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://make-libwebp-explicitly-configurable.patch \
            file://0001-make-error-portable.patch \
            file://parallelmake.patch \
+           file://0001-build-mkdir-target-weston.ini-directories-before-wri.patch \
 "
 SRC_URI[md5sum] = "24cb8a7ed0535b4fc3642643988dab36"
 SRC_URI[sha256sum] = "8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada5ad312"
-- 
1.9.1


