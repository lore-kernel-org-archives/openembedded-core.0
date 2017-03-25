Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id A3BE477BDA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Mar 2017 18:04:03 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170325180403251_0486
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Mar 2017 18:04:03 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=39796 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1crq2f-0004zV-8S for openembedded-core@lists.openembedded.org;
	Sat, 25 Mar 2017 14:03:57 -0400
Date: Sat, 25 Mar 2017 14:03:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703251400150.8339@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] classes: Replace "if test" file tests with POSIX file tests
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
X-List-Received-Date: Sat, 25 Mar 2017 18:04:04 -0000
Content-Type: text/plain; charset=US-ASCII


In entire meta/classes/ directory, replace shell tests of the form
"if test -? ..." with POSIX tests of the form "if [ -? ...

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  as i cannot abide those silly "if test" constructs, i zipped through
and changed them to POSIX form. is there any objection to this kind of
cleanup? next up ... all those "x${VAR} = x" tests ...


diff --git a/meta/classes/distutils-tools.bbclass b/meta/classes/distutils-tools.bbclass
index 3ef9cc5..4243681 100644
--- a/meta/classes/distutils-tools.bbclass
+++ b/meta/classes/distutils-tools.bbclass
@@ -44,14 +44,14 @@ distutils_do_install() {
         done

         echo "Step 4 of ${PN} Install ..."
-        if test -e ${D}${bindir} ; then
+        if [ -e ${D}${bindir} ]; then
             for i in ${D}${bindir}/* ; do \
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi

         echo "Step 4 of ${PN} Install ..."
-        if test -e ${D}${sbindir}; then
+        if [ -e ${D}${sbindir} ]; then
             for i in ${D}${sbindir}/* ; do \
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
@@ -63,7 +63,7 @@ distutils_do_install() {
         #
         # FIXME: Bandaid against wrong datadir computation
         #
-        if test -e ${D}${datadir}/share; then
+        if [ -e ${D}${datadir}/share ]; then
             mv -f ${D}${datadir}/share/* ${D}${datadir}/
         fi
 }
diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 857572d..3340d1e 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -41,7 +41,7 @@ distutils_do_install() {
         # only modify file if it contains path  and recompile it
         find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \; -exec ${STAGING_BINDIR_NATIVE}/python-native/python -mcompileall {} \;

-        if test -e ${D}${bindir} ; then
+        if [ -e ${D}${bindir} ]; then
             for i in ${D}${bindir}/* ; do \
                 if [ ${PN} != "${BPN}-native" ]; then
                 	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
@@ -50,7 +50,7 @@ distutils_do_install() {
             done
         fi

-        if test -e ${D}${sbindir}; then
+        if [ -e ${D}${sbindir} ]; then
             for i in ${D}${sbindir}/* ; do \
                 if [ ${PN} != "${BPN}-native" ]; then
                 	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
@@ -65,13 +65,13 @@ distutils_do_install() {
         #
         # FIXME: Bandaid against wrong datadir computation
         #
-        if test -e ${D}${datadir}/share; then
+        if [ -e ${D}${datadir}/share ]; then
             mv -f ${D}${datadir}/share/* ${D}${datadir}/
             rmdir ${D}${datadir}/share
         fi

 	# Fix backport modules
-	if test -e ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/backports/__init__.py && test -e ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py; then
+	if [ -e ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/backports/__init__.py ] && [ -e ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py ]; then
 	   rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py;
 	   rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.pyc;
 	fi
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index a6720c5..d306b88 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -45,14 +45,14 @@ distutils3_do_install() {
         # support filenames with *spaces*
         find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \;

-        if test -e ${D}${bindir} ; then
+        if [ -e ${D}${bindir} ]; then
             for i in ${D}${bindir}/* ; do \
                 sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${bindir}/env\ ${PYTHON_PN}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi

-        if test -e ${D}${sbindir}; then
+        if [ -e ${D}${sbindir} ]; then
             for i in ${D}${sbindir}/* ; do \
                 sed -i -e s:${STAGING_BINDIR_NATIVE}/python-${PYTHON_PN}/${PYTHON_PN}:${bindir}/env\ ${PYTHON_PN}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
@@ -64,7 +64,7 @@ distutils3_do_install() {
         #
         # FIXME: Bandaid against wrong datadir computation
         #
-        if test -e ${D}${datadir}/share; then
+        if [ -e ${D}${datadir}/share ]; then
             mv -f ${D}${datadir}/share/* ${D}${datadir}/
             rmdir ${D}${datadir}/share
         fi
diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 42bbd73..85f71a2 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -36,7 +36,7 @@ GO_INSTALL ?= "${GO_IMPORT}/..."

 do_go_compile() {
 	GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
-	if test -n "${GO_INSTALL}" ; then
+	if [ -n "${GO_INSTALL}" ]; then
 		GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install -v ${GO_INSTALL}
 	fi
 }
@@ -61,7 +61,7 @@ do_go_install() {

 	chown -R root:root "${D}${GOROOT_FINAL}"

-	if test -e "${D}${GOBIN_FINAL}" ; then
+	if [ -e "${D}${GOBIN_FINAL}" ]; then
 		install -d -m 0755 "${D}${bindir}"
 		find "${D}${GOBIN_FINAL}" ! -type d -print0 | xargs -r0 mv --target-directory="${D}${bindir}"
 		rmdir -p "${D}${GOBIN_FINAL}" || true
diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 297eac6..0ae2729 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -50,7 +50,7 @@ export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy

 GIR_EXTRA_LIBS_PATH=\`find ${B} -name .libs| tr '\n' ':'\`\$GIR_EXTRA_LIBS_PATH

-if test -d ".libs"; then
+if [ -d ".libs" ]; then
     $qemu_binary ".libs/\$@"
 else
     $qemu_binary "\$@"
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2d344b5..8ae2eb6 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -96,7 +96,7 @@ fitimage_emit_section_kernel() {
 	kernel_csum="sha1"

 	ENTRYPOINT=${UBOOT_ENTRYPOINT}
-	if test -n "${UBOOT_ENTRYSYMBOL}"; then
+	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
 		ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
 			awk '$4=="${UBOOT_ENTRYSYMBOL}" {print $2}'`
 	fi
@@ -339,7 +339,7 @@ fitimage_assemble() {
 	#
 	# Step 2: Prepare a DTB image section
 	#
-	if test -n "${KERNEL_DEVICETREE}"; then
+	if [ -n "${KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
 		for DTB in ${KERNEL_DEVICETREE}; do
 			if echo ${DTB} | grep -q '/dts/'; then
@@ -359,7 +359,7 @@ fitimage_assemble() {
 	#
 	# Step 3: Prepare a setup section. (For x86)
 	#
-	if test -e arch/${ARCH}/boot/setup.bin ; then
+	if [ -e arch/${ARCH}/boot/setup.bin ]; then
 		setupcount=1
 		fitimage_emit_section_setup ${1} "${setupcount}" arch/${ARCH}/boot/setup.bin
 	fi
@@ -383,7 +383,7 @@ fitimage_assemble() {

 	# Force the first Kernel and DTB in the default config
 	kernelcount=1
-	if test -n "${dtbcount}"; then
+	if [ -n "${dtbcount}" ]; then
 		dtbcount=1
 	fi

@@ -392,7 +392,7 @@ fitimage_assemble() {
 	#
 	fitimage_emit_section_maint ${1} confstart

-	if test -n "${DTBS}"; then
+	if [ -n "${DTBS}" ]; then
 		i=1
 		for DTB in ${DTBS}; do
 			fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 345e7f5..868e97d 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -1,5 +1,5 @@
 uboot_prep_kimage() {
-	if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+	if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
 		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
 		linux_suffix=""
 		linux_comp="none"
diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 7e7185f..e2e9b63 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -23,7 +23,7 @@ do_uboot_mkimage() {
 			uboot_prep_kimage

 			ENTRYPOINT=${UBOOT_ENTRYPOINT}
-			if test -n "${UBOOT_ENTRYSYMBOL}"; then
+			if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
 				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
 					awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
 			fi
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index dd3cac5..563582e 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -246,8 +246,7 @@ populate_sdk_log_check() {

 		echo "log_check: Using $lf_path as logfile"

-		if test -e "$lf_path"
-		then
+		if [ -e "$lf_path" ]; then
 			${IMAGE_PKGTYPE}_log_check $target $lf_path
 		else
 			echo "Cannot find logfile [$lf_path]"

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


