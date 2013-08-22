Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 75D856B289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg900001260; Thu, 22 Aug 2013 12:42:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id C0IHI4sigMwC; Thu, 22 Aug 2013 12:42:15 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg8YC001232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:09 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5b-0001iv-NA; Thu, 22 Aug 2013 12:30:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:51 +0100
Message-Id: <1377171000-6469-19-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 19/28] libgcc: Move common code to libgcc.inc
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:27 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/libgcc.inc    | 143 +++++++++++++++++++++++++++++++
 meta/recipes-devtools/gcc/libgcc_4.7.bb | 144 +------------------------------
 meta/recipes-devtools/gcc/libgcc_4.8.bb | 145 +-------------------------------
 3 files changed, 145 insertions(+), 287 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/libgcc.inc

diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
new file mode 100644
index 0000000..fe98238
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -0,0 +1,143 @@
+INHIBIT_DEFAULT_DEPS = "1"
+
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
+
+PACKAGES = "\
+  ${PN} \
+  ${PN}-dev \
+  ${PN}-dbg \
+  libgcov-dev \
+  "
+
+FILES_${PN} = "${base_libdir}/libgcc*.so.*"
+FILES_${PN}-dev = " \
+  ${base_libdir}/libgcc*.so \
+  ${libdir}/${TARGET_SYS}/${BINV}/*crt* \
+  ${libdir}/${TARGET_SYS}/${BINV}/64 \
+  ${libdir}/${TARGET_SYS}/${BINV}/32 \
+  ${libdir}/${TARGET_SYS}/${BINV}/x32 \
+  ${libdir}/${TARGET_SYS}/${BINV}/n32 \
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
+FILES_libgcov-dev = " \
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
+  "
+FILES_${PN}-dbg += "${base_libdir}/.debug/"
+
+do_configure () {
+	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	install -d ${D}${base_libdir} ${D}${libdir}
+	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
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
+do_package[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+
+BBCLASSEXTEND = "nativesdk"
+
+INSANE_SKIP_${PN}-dev = "staticdev"
+INSANE_SKIP_${MLPREFIX}libgcov-dev = "staticdev"
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
diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
index 3b5bb43..9716e2e 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
@@ -1,145 +1,3 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
+require libgcc.inc
 
-INHIBIT_DEFAULT_DEPS = "1"
-
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
-
-PACKAGES = "\
-  ${PN} \
-  ${PN}-dev \
-  ${PN}-dbg \
-  libgcov-dev \
-  "
-
-FILES_${PN} = "${base_libdir}/libgcc*.so.*"
-FILES_${PN}-dev = " \
-  ${base_libdir}/libgcc*.so \
-  ${libdir}/${TARGET_SYS}/${BINV}/*crt* \
-  ${libdir}/${TARGET_SYS}/${BINV}/64 \
-  ${libdir}/${TARGET_SYS}/${BINV}/32 \
-  ${libdir}/${TARGET_SYS}/${BINV}/x32 \
-  ${libdir}/${TARGET_SYS}/${BINV}/n32 \
-  ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
-FILES_libgcov-dev = " \
-  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
-  "
-FILES_${PN}-dbg += "${base_libdir}/.debug/"
-
-do_configure () {
-	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	install -d ${D}${base_libdir} ${D}${libdir}
-	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
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
-
-do_package[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-
-BBCLASSEXTEND = "nativesdk"
-
-INSANE_SKIP_${PN}-dev = "staticdev"
-INSANE_SKIP_${MLPREFIX}libgcov-dev = "staticdev"
-
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
diff --git a/meta/recipes-devtools/gcc/libgcc_4.8.bb b/meta/recipes-devtools/gcc/libgcc_4.8.bb
index 3b5bb43..a5152f2 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.8.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.8.bb
@@ -1,145 +1,2 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
-
-INHIBIT_DEFAULT_DEPS = "1"
-
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
-
-PACKAGES = "\
-  ${PN} \
-  ${PN}-dev \
-  ${PN}-dbg \
-  libgcov-dev \
-  "
-
-FILES_${PN} = "${base_libdir}/libgcc*.so.*"
-FILES_${PN}-dev = " \
-  ${base_libdir}/libgcc*.so \
-  ${libdir}/${TARGET_SYS}/${BINV}/*crt* \
-  ${libdir}/${TARGET_SYS}/${BINV}/64 \
-  ${libdir}/${TARGET_SYS}/${BINV}/32 \
-  ${libdir}/${TARGET_SYS}/${BINV}/x32 \
-  ${libdir}/${TARGET_SYS}/${BINV}/n32 \
-  ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
-FILES_libgcov-dev = " \
-  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
-  "
-FILES_${PN}-dbg += "${base_libdir}/.debug/"
-
-do_configure () {
-	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	install -d ${D}${base_libdir} ${D}${libdir}
-	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
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
-
-do_package[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-
-BBCLASSEXTEND = "nativesdk"
-
-INSANE_SKIP_${PN}-dev = "staticdev"
-INSANE_SKIP_${MLPREFIX}libgcov-dev = "staticdev"
-
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
+require libgcc.inc
-- 
1.8.1.2


