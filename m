Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CBC77722C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAPHvnhU012953 for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:57:49 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R3isKWxi4zxM
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:57:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAPHvXia012950
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:57:45 GMT
Message-ID: <1416938290.12520.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Nov 2014 17:58:10 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc: Rework shared work
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
X-List-Received-Date: Tue, 25 Nov 2014 17:58:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The current implementation of shared work for gcc is at best confusing. It relies
on the fetch/unpack/patch tasks having exactly the same stamps and if this gets
broken for some reason, its hard to figure out what the problem is. It also
leads to complex code in bitbake.

The benefits of shared work for gcc are clear but a better approach is needed. This
patch adjusts things so that a single new recipe (gcc-source) provides the
fetch/unpack/patch/preconfigure tasks, the rest of gcc simply depends on these tasks
and have no fetch/unpack/patch tasks of their own.

This means we should get the significant benefits (disk usage/performance) of the
single source tree but in a way which has less potential for problems and is
easier for people to understand. The cost is an extra recipe/some inc files
which is probably a good tradeoff.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 9d41f65..04c701a 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -79,19 +79,6 @@ ${GNU_MIRROR}/gcc	http://mirrors.rcn.net/pub/sourceware/gcc/releases/ \n \
 ${GNU_MIRROR}/gcc   http://gcc.get-software.com/releases/ \n \
 ${GNU_MIRROR}/gcc	http://gcc.get-software.com/releases/ \n \
 "
-
-python do_preconfigure () {
-    import subprocess
-    cmd = d.expand('PATH=${PATH} cd ${S} && gnu-configize')
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-    # See 0044-gengtypes.patch, we need to regenerate this file
-    bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.c"))
-    cmd = d.expand("sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure")
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-}
-addtask do_preconfigure after do_patch before do_configure
-do_preconfigure[depends] += "gnu-config-native:do_populate_sysroot autoconf-native:do_populate_sysroot"
-
 #
 # Set some default values
 #
@@ -101,48 +88,12 @@ BINV = "${PV}"
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
-# SS means Shared Stamps directory
-SS = "${TMPDIR}/stamps/work-shared/gcc-${PV}-${PR}"
-do_fetch[stamp-base] = "${SS}"
-do_unpack[stamp-base] = "${SS}"
-do_patch[stamp-base] = "${SS}"
-do_preconfigure[stamp-base] = "${SS}"
-SSCLEAN = "${TMPDIR}/stamps/work-shared/gcc-[0-9]*-*"
-do_fetch[stamp-base-clean] = "${SSCLEAN}"
-do_unpack[stamp-base-clean] = "${SSCLEAN}"
-do_unpack[umask] = "022"
-do_patch[stamp-base-clean] = "${SSCLEAN}"
-do_preconfigure[stamp-base-clean] = "${SSCLEAN}"
-
-# SW means Shared Work directory
-SW = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
-SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
-WORKDIR_task-unpack = "${SW}"
-WORKDIR_task-patch = "${SW}"
-WORKDIR_task-preconfigure = "${SW}"
-
 target_includedir ?= "${includedir}"
 target_libdir ?= "${libdir}"
 target_base_libdir ?= "${base_libdir}"
 target_prefix ?= "${prefix}"
 
-CLEANFUNCS += "workshared_clean"
-# The do_clean should be exclusive since share ${S}
-do_clean[lockfiles] = "${SW}.clean.lock"
-
-python workshared_clean () {
-	"""clear the source directory"""
-	dir = d.expand("${SW}")
-	bb.note("Removing " + dir)
-	oe.path.remove(dir)
-
-	"""clear the the stamps in work-shared"""
-	dir = "%s.*" % bb.data.expand(d.getVarFlag('do_fetch', 'stamp-base', True), d)
-	bb.note("Removing " + dir)
-	oe.path.remove(dir)
-}
-
-# We need to ensure that for the shared work directory, the do_patch singatures match
+# We need to ensure that for the shared work directory, the do_patch signatures match
 # The real WORKDIR location isn't a dependency for the shared workdir.
 src_patches[vardepsexclude] = "WORKDIR"
 should_apply[vardepsexclude] += "PN"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index f33678c..0693118 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -1,4 +1,5 @@
 require gcc-multilib-config.inc
+require gcc-shared-source.inc
 #
 # Build the list of lanaguages to build.
 #
diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
new file mode 100644
index 0000000..a2aed6b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -0,0 +1,6 @@
+deltask do_fetch
+deltask do_unpack
+deltask do_patch
+
+do_configure[depends] += "gcc-source:do_preconfigure"
+do_populate_lic[depends] += "gcc-source:do_unpack"
diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
new file mode 100644
index 0000000..fd0b91a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -0,0 +1,34 @@
+deltask do_configure 
+deltask do_compile 
+deltask do_package 
+deltask do_package_write_rpm 
+deltask do_package_write_ipk 
+deltask do_package_write_deb
+deltask do_install 
+deltask do_populate_sysroot
+deltask do_populate_lic 
+deltask do_package_qa
+deltask do_packagedata
+deltask do_rm_work
+
+WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
+SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
+
+STAMP = "${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}"
+STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-[0-9]*-*"
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS = ""
+
+python do_preconfigure () {
+    import subprocess
+    cmd = d.expand('PATH=${PATH} cd ${S} && gnu-configize')
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+    # See 0044-gengtypes.patch, we need to regenerate this file
+    bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.c"))
+    cmd = d.expand("sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure")
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+}
+addtask do_preconfigure after do_patch
+do_preconfigure[depends] += "gnu-config-native:do_populate_sysroot autoconf-native:do_populate_sysroot"
+
diff --git a/meta/recipes-devtools/gcc/gcc-source_4.8.bb b/meta/recipes-devtools/gcc/gcc-source_4.8.bb
new file mode 100644
index 0000000..234b82e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-source_4.8.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/gcc-source.inc
diff --git a/meta/recipes-devtools/gcc/gcc-source_4.9.bb b/meta/recipes-devtools/gcc/gcc-source_4.9.bb
new file mode 100644
index 0000000..234b82e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-source_4.9.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/gcc-source.inc
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index c81a80c..1e1e1c1 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -1,5 +1,7 @@
 BPN = "libgcc"
 
+require gcc-shared-source.inc
+
 INHIBIT_DEFAULT_DEPS = "1"
 
 do_configure () {



