Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E5BE46FF78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBAMoAM9022651 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:51:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IRGMrFF9UQ8g
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:51:10 +0000 (GMT)
Received: from [192.168.3.30] ([192.168.3.30]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBAMoutt022717
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:51:08 GMT
Message-ID: <1449787856.29412.49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Dec 2015 22:50:56 +0000
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] nopackages: Add class for recipes which don't generate packages
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
X-List-Received-Date: Thu, 10 Dec 2015 22:51:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It turns out writing the same list of packaging tasks multiple
times in multiple places is error prone. Move this to a new class
'nopackages", migrate existing users and add glibc-initial and
libgcc-initial since we don't want packages for those recipes.

This means the sstate for those recipes won't be installed, saving
small amounts of build time and bandwidth.

A reference to the old package_write task is also dropped.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 3eab5b9..81d1c9d 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -68,10 +68,4 @@ do_install () {
 
 USE_NLS = "no"
 
-deltask package
-deltask packagedata
-deltask package_qa
-deltask package_write_ipk
-deltask package_write_deb
-deltask package_write_rpm
-deltask package_write
+inherit nopackages
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index bcbcd61..aac2c1e 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -169,13 +169,7 @@ python native_virtclass_handler () {
 addhandler native_virtclass_handler
 native_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 
-deltask package
-deltask packagedata
-deltask package_qa
-deltask package_write_ipk
-deltask package_write_deb
-deltask package_write_rpm
-deltask package_write
+inherit nopackages
 
 do_packagedata[stamp-extra-info] = ""
 do_populate_sysroot[stamp-extra-info] = ""
diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbclass
new file mode 100644
index 0000000..0c2761b
--- /dev/null
+++ b/meta/classes/nopackages.bbclass
@@ -0,0 +1,6 @@
+deltask do_package
+deltask do_package_write_rpm
+deltask do_package_write_ipk
+deltask do_package_write_deb
+deltask do_package_qa
+deltask do_packagedata
diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
index 3500848..8e81f09 100644
--- a/meta/recipes-core/glibc/glibc-initial.inc
+++ b/meta/recipes-core/glibc/glibc-initial.inc
@@ -74,3 +74,5 @@ do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}/"
 do_evacuate_scripts () {
 	:
 }
+
+inherit nopackages
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index c0fa139..c2e5ddd 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -95,3 +95,4 @@ sysroot_stage_all() {
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST}/ ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}/"
 do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST}/ ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}/"
 
+inherit nopackages
diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 794fd4d..49bde92 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -1,16 +1,12 @@
 deltask do_configure 
 deltask do_compile 
-deltask do_package 
-deltask do_package_write_rpm 
-deltask do_package_write_ipk 
-deltask do_package_write_deb
 deltask do_install 
 deltask do_populate_sysroot
 deltask do_populate_lic 
-deltask do_package_qa
-deltask do_packagedata
 deltask do_rm_work
 
+inherit nopackages
+
 PN = "gcc-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
 SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index 4e92f00..f295fe0 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -16,3 +16,4 @@ LIBGCCBUILDTREENAME = "gcc-build-internal-initial-"
 
 do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}/"
 
+inherit nopackages




