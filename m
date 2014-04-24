Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9CAD565D26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 09:18:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3O9IrrP005415 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:18:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M9ejfo1vfcyh
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:18:53 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3O9ImsW005410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:18:49 +0100
Message-ID: <1398331122.16672.174.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2014 10:18:42 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libgcc: Spit out common code into libgcc-common.inc
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
X-List-Received-Date: Thu, 24 Apr 2014 09:18:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Prepare the ground for the creation of libgcc-initial by splitting common
libgcc code into a libgcc-common.inc file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
new file mode 100644
index 0000000..c4ab885
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -0,0 +1,135 @@
+BPN = "libgcc"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_configure () {
+	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	install -d ${D}${base_libdir} ${D}${libdir}
+	hardlinkdir ${STAGING_INCDIR_NATIVE}/${LIBGCCBUILDTREENAME}$target/ ${B}
+	mkdir -p ${B}/${BPN}
+	cd ${B}/${BPN}
+	chmod a+x ${S}/${BPN}/configure
+	${S}/${BPN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+}
+
+do_compile () {
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	cd ${B}/${BPN}
+	oe_runmake MULTIBUILDTOP=${B}/$target/${BPN}/
+}
+
+do_install () {
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	cd ${B}/${BPN}
+	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${BPN}/ install
+
+	# Move libgcc_s into /lib
+	mkdir -p ${D}${base_libdir}
+	if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then
+		mv ${D}${libdir}/nof/libgcc* ${D}${base_libdir}
+	else
+		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
+	fi
+
+	# install the runtime in /usr/lib/ not in /usr/lib/gcc on target
+	# so that cross-gcc can find it in the sysroot
+
+	mv ${D}${libdir}/gcc/* ${D}${libdir}
+	rm -rf ${D}${libdir}/gcc/
+	# unwind.h is installed here which is shipped in gcc-cross
+	# as well as target gcc and they are identical so we dont
+	# ship one with libgcc here
+	rm -rf ${D}${libdir}/${TARGET_SYS}/${BINV}/include
+}
+
+BBCLASSEXTEND = "nativesdk"
+
+addtask multilib_install after do_install before do_package do_populate_sysroot
+# this makes multilib gcc files findable for target gcc
+# e.g.
+#    /usr/lib/i586-pokymllib32-linux/4.7/
+# by creating this symlink to it
+#    /usr/lib64/x86_64-poky-linux/4.7/32
+
+python do_multilib_install() {
+    import re
+
+    multilibs = d.getVar('MULTILIB_VARIANTS', True)
+    if not multilibs or bb.data.inherits_class('nativesdk', d):
+        return
+
+    binv = d.getVar('BINV', True)
+
+    mlprefix = d.getVar('MLPREFIX', True)
+    if ('%slibgcc' % mlprefix) != d.getVar('PN', True):
+        return
+
+    if mlprefix:
+        orig_tune = d.getVar('DEFAULTTUNE_MULTILIB_ORIGINAL', True)
+        orig_tune_params = get_tune_parameters(orig_tune, d)
+        orig_tune_baselib = orig_tune_params['baselib']
+        orig_tune_bitness = orig_tune_baselib.replace('lib', '')
+        if not orig_tune_bitness:
+            orig_tune_bitness = '32'
+
+        src = '../../../' + orig_tune_baselib + '/' + \
+            d.getVar('TARGET_SYS_MULTILIB_ORIGINAL', True) + '/' + binv + '/'
+
+        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
+            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + orig_tune_bitness
+
+        if os.path.lexists(dest):
+            os.unlink(dest)
+        os.symlink(src, dest)
+        return
+
+
+    for ml in multilibs.split():
+        tune = d.getVar('DEFAULTTUNE_virtclass-multilib-' + ml, True)
+        if not tune:
+            bb.warn('DEFAULTTUNE_virtclass-multilib-%s is not defined. Skipping...' % ml)
+            continue
+
+        tune_parameters = get_tune_parameters(tune, d)
+        tune_baselib = tune_parameters['baselib']
+        if not tune_baselib:
+            bb.warn("Tune %s doesn't have a baselib set. Skipping..." % tune)
+            continue
+
+        tune_arch = tune_parameters['arch']
+        tune_bitness = tune_baselib.replace('lib', '')
+        if not tune_bitness:
+            tune_bitness = '32' # /lib => 32bit lib
+
+        src = '../../../' + tune_baselib + '/' + \
+            tune_arch + d.getVar('TARGET_VENDOR', True) + 'ml' + ml + \
+            '-' + d.getVar('TARGET_OS', True) + '/' + binv + '/'
+
+        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
+            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + tune_bitness
+
+        if os.path.lexists(dest):
+            os.unlink(dest)
+        os.symlink(src, dest)
+}
+
+addtask extra_symlinks after do_multilib_install before do_package do_populate_sysroot
+python do_extra_symlinks() {
+    targetsysnoext = d.getVar('TARGET_SYS_NO_EXTENSION', True)
+
+    if targetsysnoext != d.getVar('TARGET_SYS', True):
+        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + targetsysnoext
+        src = d.getVar('TARGET_SYS', True)
+        if not os.path.lexists(dest) and os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
+            os.symlink(src, dest)
+}
+
+python () {
+    targetsysnoext = d.getVar('TARGET_SYS', True)
+
+    for suffix in [d.getVar('ABIEXTENSION', True), d.getVar('LIBCEXTENSION', True)]:
+        if suffix and targetsysnoext.endswith(suffix):
+            targetsysnoext = targetsysnoext[:-len(suffix)]
+
+    d.setVar('TARGET_SYS_NO_EXTENSION', targetsysnoext)
+}
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 1a1fbcc..45dd151 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -1,4 +1,4 @@
-INHIBIT_DEFAULT_DEPS = "1"
+require libgcc-common.inc
 
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 
@@ -24,142 +24,13 @@ FILES_libgcov-dev = " \
   "
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
 
-do_configure () {
-	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	install -d ${D}${base_libdir} ${D}${libdir}
-	hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/ ${B}
-	mkdir -p ${B}/${BPN}
-	cd ${B}/${BPN}
-	chmod a+x ${S}/${BPN}/configure
-	${S}/${BPN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
-}
-
-do_compile () {
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	cd ${B}/${BPN}
-	oe_runmake MULTIBUILDTOP=${B}/$target/${BPN}/
-}
-
-do_install () {
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	cd ${B}/${BPN}
-	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${BPN}/ install
-
-	# Move libgcc_s into /lib
-	mkdir -p ${D}${base_libdir}
-	if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then
-		mv ${D}${libdir}/nof/libgcc* ${D}${base_libdir}
-	else
-		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
-	fi
-
-	# install the runtime in /usr/lib/ not in /usr/lib/gcc on target
-	# so that cross-gcc can find it in the sysroot
-
-	mv ${D}${libdir}/gcc/* ${D}${libdir}
-	rm -rf ${D}${libdir}/gcc/
-	# unwind.h is installed here which is shipped in gcc-cross
-	# as well as target gcc and they are identical so we dont
-	# ship one with libgcc here
-	rm -rf ${D}${libdir}/${TARGET_SYS}/${BINV}/include
-}
+LIBGCCBUILDTREENAME = "gcc-build-internal-"
 
 do_package[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 
-BBCLASSEXTEND = "nativesdk"
-
 INSANE_SKIP_${PN}-dev = "staticdev"
 INSANE_SKIP_${MLPREFIX}libgcov-dev = "staticdev"
 
-addtask multilib_install after do_install before do_package do_populate_sysroot
-# this makes multilib gcc files findable for target gcc
-# e.g.
-#    /usr/lib/i586-pokymllib32-linux/4.7/
-# by creating this symlink to it
-#    /usr/lib64/x86_64-poky-linux/4.7/32
-
-python do_multilib_install() {
-    import re
-
-    multilibs = d.getVar('MULTILIB_VARIANTS', True)
-    if not multilibs or bb.data.inherits_class('nativesdk', d):
-        return
-
-    binv = d.getVar('BINV', True)
-
-    mlprefix = d.getVar('MLPREFIX', True)
-    if ('%slibgcc' % mlprefix) != d.getVar('PN', True):
-        return
-
-    if mlprefix:
-        orig_tune = d.getVar('DEFAULTTUNE_MULTILIB_ORIGINAL', True)
-        orig_tune_params = get_tune_parameters(orig_tune, d)
-        orig_tune_baselib = orig_tune_params['baselib']
-        orig_tune_bitness = orig_tune_baselib.replace('lib', '')
-        if not orig_tune_bitness:
-            orig_tune_bitness = '32'
-
-        src = '../../../' + orig_tune_baselib + '/' + \
-            d.getVar('TARGET_SYS_MULTILIB_ORIGINAL', True) + '/' + binv + '/'
-
-        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
-            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + orig_tune_bitness
-
-        if os.path.lexists(dest):
-            os.unlink(dest)
-        os.symlink(src, dest)
-        return
-
-
-    for ml in multilibs.split():
-        tune = d.getVar('DEFAULTTUNE_virtclass-multilib-' + ml, True)
-        if not tune:
-            bb.warn('DEFAULTTUNE_virtclass-multilib-%s is not defined. Skipping...' % ml)
-            continue
-
-        tune_parameters = get_tune_parameters(tune, d)
-        tune_baselib = tune_parameters['baselib']
-        if not tune_baselib:
-            bb.warn("Tune %s doesn't have a baselib set. Skipping..." % tune)
-            continue
-
-        tune_arch = tune_parameters['arch']
-        tune_bitness = tune_baselib.replace('lib', '')
-        if not tune_bitness:
-            tune_bitness = '32' # /lib => 32bit lib
-
-        src = '../../../' + tune_baselib + '/' + \
-            tune_arch + d.getVar('TARGET_VENDOR', True) + 'ml' + ml + \
-            '-' + d.getVar('TARGET_OS', True) + '/' + binv + '/'
-
-        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
-            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + tune_bitness
-
-        if os.path.lexists(dest):
-            os.unlink(dest)
-        os.symlink(src, dest)
-}
-
-addtask extra_symlinks after do_multilib_install before do_package do_populate_sysroot
-python do_extra_symlinks() {
-    targetsysnoext = d.getVar('TARGET_SYS_NO_EXTENSION', True)
-
-    if targetsysnoext != d.getVar('TARGET_SYS', True):
-        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + targetsysnoext
-        src = d.getVar('TARGET_SYS', True)
-        if not os.path.lexists(dest) and os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
-            os.symlink(src, dest)
-}
-
-python () {
-    targetsysnoext = d.getVar('TARGET_SYS', True)
-
-    for suffix in [d.getVar('ABIEXTENSION', True), d.getVar('LIBCEXTENSION', True)]:
-        if suffix and targetsysnoext.endswith(suffix):
-            targetsysnoext = targetsysnoext[:-len(suffix)]
-
-    d.setVar('TARGET_SYS_NO_EXTENSION', targetsysnoext)
-}



