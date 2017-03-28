Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7079477AC0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9864718421;
	Tue, 28 Mar 2017 14:02:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id iaOBDuLhXW01; Tue, 28 Mar 2017 14:02:43 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8C71818330;
	Tue, 28 Mar 2017 14:02:43 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67E5E1E07D;
	Tue, 28 Mar 2017 14:02:43 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37AB01E089;
	Tue, 28 Mar 2017 14:01:34 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 28 Mar 2017 14:01:34 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 2A3072115;
	Tue, 28 Mar 2017 14:01:34 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2SC1YBk019885;
	Tue, 28 Mar 2017 14:01:34 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2SC1X6i019883;
	Tue, 28 Mar 2017 14:01:33 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 14:01:17 +0200
Message-Id: <20170328120118.19826-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] lsb: Avoid using double slashes in paths
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
X-List-Received-Date: Tue, 28 Mar 2017 12:02:43 -0000

Use ${D}${var} rather than ${D}/${var} for variables where ${var}
contains an absolute path.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 49 ++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index 39cb5445e2..2eb67b8c3a 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -33,10 +33,10 @@ S = "${WORKDIR}/lsb-release-1.4"
 
 CLEANBROKEN = "1"
 
-do_install(){
-	oe_runmake install prefix=${D}/${base_prefix}  mandir=${D}/${datadir}/man/ DESTDIR=${D}
+do_install() {
+	oe_runmake install prefix=${D}${base_prefix} mandir=${D}${datadir}/man/ DESTDIR=${D}
 
-	# this 2 dirs are needed by package lsb-dist-checker
+	# these two dirs are needed by package lsb-dist-checker
 	mkdir -p ${D}${sysconfdir}/opt
 	mkdir -p ${D}${localstatedir}/opt
 
@@ -44,7 +44,7 @@ do_install(){
 	mkdir -p ${D}${sysconfdir}/lsb-release.d
 	printf "LSB_VERSION=\"core-4.1-noarch:" > ${D}${sysconfdir}/lsb-release
 
-	if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ];then
+	if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ]; then
 		printf "core-4.1-ia32" >>  ${D}${sysconfdir}/lsb-release
 	else
 		printf "core-4.1-${TARGET_ARCH}" >>  ${D}${sysconfdir}/lsb-release
@@ -57,73 +57,74 @@ do_install(){
 	fi
 	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}${sysconfdir}/lsb-release
 
-	if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ];then
+	if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ]; then
 		mkdir -p ${D}${sysconfdir}/lsb-release.d
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-noarch
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ia32
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ia32
-	elif [ "${TARGET_ARCH}" = "x86_64" ];then
+	elif [ "${TARGET_ARCH}" = "x86_64" ]; then
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-amd64
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-amd64
 	fi
-	if [ "${TARGET_ARCH}" = "powerpc" ];then
+	if [ "${TARGET_ARCH}" = "powerpc" ]; then
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ppc32
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ppc32
-	elif [ "${TARGET_ARCH}" = "powerpc64" ];then
+	elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ppc64
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ppc64
 	fi
 }
 
-do_install_append(){
+do_install_append() {
        install -d ${D}${sysconfdir}/core-lsb
        for i in lsb_killproc lsb_log_message lsb_pidofproc lsb_start_daemon
        do
-           install -m 0755 ${WORKDIR}/${i} ${D}${sysconfdir}/core-lsb
+           install -m 0755 ${WORKDIR}/$i ${D}${sysconfdir}/core-lsb
        done
 
-       install -d ${D}/${nonarch_base_libdir}/lsb
-       install -m 0755 ${WORKDIR}/init-functions ${D}/${nonarch_base_libdir}/lsb
+       install -d ${D}${nonarch_base_libdir}/lsb
+       install -m 0755 ${WORKDIR}/init-functions ${D}${nonarch_base_libdir}/lsb
 
-       # creat links for LSB test
+       # create links for LSB test
        if [ "${nonarch_base_libdir}" != "${nonarch_libdir}" ] ; then
-               install -d ${D}/${nonarch_libdir}/lsb
+               install -d ${D}${nonarch_libdir}/lsb
        fi
-       ln -sf ${sbindir}/chkconfig ${D}/${nonarch_libdir}/lsb/install_initd
-       ln -sf ${sbindir}/chkconfig ${D}/${nonarch_libdir}/lsb/remove_initd
+       ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/install_initd
+       ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/remove_initd
 
-       if [ "${TARGET_ARCH}" = "x86_64" ];then
+       if [ "${TARGET_ARCH}" = "x86_64" ]; then
                if [ "${baselib}" != "lib64" ]; then
                    lnr ${D}${base_libdir} ${D}/lib64
                fi
-	       cd ${D}/${base_libdir}
+	       cd ${D}${base_libdir}
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.2
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.3
        fi
-       if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ];then
-	       cd ${D}/${base_libdir}
+       if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ]; then
+	       cd ${D}${base_libdir}
                ln -sf ld-linux.so.2 ld-lsb.so.2
                ln -sf ld-linux.so.2 ld-lsb.so.3
        fi
 
-       if [ "${TARGET_ARCH}" = "powerpc64" ];then
+       if [ "${TARGET_ARCH}" = "powerpc64" ]; then
                if [ "${baselib}" != "lib64" ]; then
                    lnr  ${D}${base_libdir} ${D}/lib64
                fi
-               cd ${D}/${base_libdir}
+               cd ${D}${base_libdir}
                ln -sf ld64.so.1 ld-lsb-ppc64.so.2
                ln -sf ld64.so.1 ld-lsb-ppc64.so.3
        fi
-       if [ "${TARGET_ARCH}" = "powerpc" ];then
-	       cd ${D}/${base_libdir}
+       if [ "${TARGET_ARCH}" = "powerpc" ]; then
+	       cd ${D}${base_libdir}
                ln -sf ld.so.1 ld-lsb-ppc32.so.2
                ln -sf ld.so.1 ld-lsb-ppc32.so.3
        fi
 }
+
 FILES_${PN} += "${@'/lib64' if d.getVar('TARGET_ARCH')  == ('x86_64' or 'powerpc64') and '${baselib}' != 'lib64' else ''} \
                 ${base_libdir} \
                 ${nonarch_libdir}/lsb \
-- 
2.12.0


