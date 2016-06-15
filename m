Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 35BF76FF78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 22:13:47 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u5FMDmK1030186 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 17:13:48 -0500
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016061517134872-927990 ;
	Wed, 15 Jun 2016 17:13:48 -0500 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jun 2016 17:13:42 -0500
Message-Id: <1466028822-9936-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 06/15/2016 05:13:48 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 06/15/2016 05:13:48 PM,
	Serialize complete at 06/15/2016 05:13:48 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-06-15_13:, , signatures=0
Subject: [PATCH] opkg: upgrade to v0.3.2
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
X-List-Received-Date: Wed, 15 Jun 2016 22:13:49 -0000

* Drop merged patches
* Update libsolv PACKAGECONFIG config option

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...1-configure.ac-use-pkg-config-for-libsolv.patch | 36 ----------------------
 ...ver_set_arch_policy-use-correct-logic-dur.patch | 35 ---------------------
 .../opkg/{opkg_0.3.1.bb => opkg_0.3.2.bb}          |  8 ++---
 3 files changed, 3 insertions(+), 76 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch
 rename meta/recipes-devtools/opkg/{opkg_0.3.1.bb => opkg_0.3.2.bb} (87%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch b/meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch
deleted file mode 100644
index e67ec74..0000000
--- a/meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2a43027f7ecf2bb3ce73f95bcf575c56bc495d07 Mon Sep 17 00:00:00 2001
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Date: Wed, 9 Dec 2015 17:38:05 -0600
-Subject: [PATCH] configure.ac: use pkg-config for libsolv
-
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
----
- configure.ac | 12 +-----------
- 1 file changed, 1 insertion(+), 11 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 52e1025..d17dc5c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -159,17 +159,7 @@ if test "x$want_solver" != "xno"; then
-                  AC_MSG_ERROR(Specify which solver with --enable-solver=<SOLVER>)],
-             [libsolv],
-                 [AC_MSG_RESULT(libsolv)
--
--                SOLVER_CFLAGS="-I/usr/local/include/"
--                SOLVER_LIBS="-lsolv -lsolvext"
--                AC_CHECK_LIB([solv],
--                             [solver_solve],
--                             [],
--                             [AC_MSG_ERROR(libsolv not found)])
--                dnl TODO: remove previous 6 lines and uncomment line below to use
--                dnl pkg-config once there is a release of libsolv with pkg-config:
--                dnl PKG_CHECK_MODULES(SOLVER, libsolv)
--
-+                PKG_CHECK_MODULES(SOLVER, libsolv)
-                 AC_DEFINE(HAVE_SOLVER_LIBSOLV,1,[Define if you want to use libsolv])],
-             # default
-             [AC_MSG_RESULT(no)
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/opkg/opkg/0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch b/meta/recipes-devtools/opkg/opkg/0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch
deleted file mode 100644
index 1ab1790..0000000
--- a/meta/recipes-devtools/opkg/opkg/0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3e562bed7dced25eb3e9174ca9395324b6c873c1 Mon Sep 17 00:00:00 2001
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Date: Wed, 9 Dec 2015 13:36:14 -0600
-Subject: [PATCH] libsolv_solver_set_arch_policy: use correct logic during
- archs resizing
-
-If there are more than INITIAL_ARCH_LIST_SIZE archs defined in the
-configuration, libsolv_solver_set_arch_policy crashes due to flawed
-logic when resizing the archs array.
-
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
----
- libopkg/opkg_solver_libsolv.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/libopkg/opkg_solver_libsolv.c b/libopkg/opkg_solver_libsolv.c
-index 1cdcf1f..b5af0fa 100644
---- a/libopkg/opkg_solver_libsolv.c
-+++ b/libopkg/opkg_solver_libsolv.c
-@@ -66,8 +66,10 @@ static void libsolv_solver_set_arch_policy(libsolv_solver_t *libsolv_solver)
-     nv_pair_list_elt_t *arch_info;
- 
-     list_for_each_entry(arch_info, &opkg_config->arch_list.head, node) {
--        if (arch_count > arch_list_size)
--            archs = xrealloc(archs, arch_list_size *= 2);
-+        if (arch_count >= arch_list_size) {
-+            arch_list_size *= 2;
-+            archs = xrealloc(archs, arch_list_size * sizeof(arch_data_t));
-+        }
- 
-         archs[arch_count].arch = ((nv_pair_t *)(arch_info->data))->name;
-         archs[arch_count].priority = atoi(((nv_pair_t *)
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.1.bb b/meta/recipes-devtools/opkg/opkg_0.3.2.bb
similarity index 87%
rename from meta/recipes-devtools/opkg/opkg_0.3.1.bb
rename to meta/recipes-devtools/opkg/opkg_0.3.2.bb
index 577f495..0251b7d 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.2.bb
@@ -15,12 +15,10 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg-configure.service \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
-           file://0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch \
-           file://0001-configure.ac-use-pkg-config-for-libsolv.patch \
 "
 
-SRC_URI[md5sum] = "43735e5dc1ebf46bd6ce56a7cdfdc720"
-SRC_URI[sha256sum] = "d2c6c02a8384ec21168a1f0a186cb5e9f577d1452f491d02ed3e56b2ea8b87df"
+SRC_URI[md5sum] = "b2cc1baa89d0b3d49e63ab002fd2e0a6"
+SRC_URI[sha256sum] = "c9fa948a779a4e493b9669c239de317d43c43accbccbb0cf84056f9b269ba7b0"
 
 inherit autotools pkgconfig systemd
 
@@ -37,7 +35,7 @@ PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
 PACKAGECONFIG[pathfinder] = "--enable-pathfinder,--disable-pathfinder,pathfinder"
-PACKAGECONFIG[libsolv] = "--enable-solver=libsolv,--disable-solver,libsolv"
+PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/opkg
-- 
1.9.1


