Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5892D71979
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:42:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 05:42:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="42543681"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2017 05:42:55 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 15:42:31 +0200
Message-Id: <1486734151-28331-24-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 23/23] lsb: Make use of appropriate bitbake variables.
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
X-List-Received-Date: Fri, 10 Feb 2017 13:42:55 -0000

Using of bitbake environment variables in-place of hardcoded strings makes this
recipe portable to all environments.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 40 +++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index ece0eab..77ea365 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -33,14 +33,14 @@ S = "${WORKDIR}/lsb-release-1.4"
 CLEANBROKEN = "1"
 
 do_install(){
-	oe_runmake install prefix=${D}  mandir=${D}/${datadir}/man/ DESTDIR=${D}
+	oe_runmake install prefix=${D}/${prefix}  mandir=${D}/${datadir}/man/ DESTDIR=${D}
 
 	# this 2 dirs are needed by package lsb-dist-checker
 	mkdir -p ${D}${sysconfdir}/opt
 	mkdir -p ${D}${localstatedir}/opt
 
 	mkdir -p ${D}${base_bindir}
-	mkdir -p ${D}/${baselib}
+	mkdir -p ${D}${base_libdir}
 	mkdir -p ${D}${sysconfdir}/lsb-release.d
 	printf "LSB_VERSION=\"core-4.1-noarch:" > ${D}${sysconfdir}/lsb-release
 
@@ -86,47 +86,45 @@ do_install_append(){
            install -m 0755 ${WORKDIR}/${i} ${D}${sysconfdir}/core-lsb
        done
 
-       install -d ${D}/lib/lsb
-       install -m 0755 ${WORKDIR}/init-functions ${D}/lib/lsb
+       install -d ${D}/${nonarch_base_libdir}/lsb
+       install -m 0755 ${WORKDIR}/init-functions ${D}/${nonarch_base_libdir}/lsb
 
        # creat links for LSB test
-       install -d ${D}/usr/lib/lsb
-       ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/install_initd
-       ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/remove_initd
+       if [ "${nonarch_base_libdir}" != "${nonarch_libdir}" ; then
+               install -d ${D}/${nonarch_libdir}/lsb
+       fi
+       ln -sf ${sbindir}/chkconfig ${D}/${nonarch_libdir}/lsb/install_initd
+       ln -sf ${sbindir}/chkconfig ${D}/${nonarch_libdir}/lsb/remove_initd
 
        if [ "${TARGET_ARCH}" = "x86_64" ];then
-	       cd ${D}
                if [ "${baselib}" != "lib64" ]; then
-                   ln -sf ${baselib} lib64
+                   lnr ${D}${base_libdir} ${D}/lib64
                fi
-	       cd ${D}/${baselib}
+	       cd ${D}/${base_libdir}
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.2
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.3
        fi
        if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ];then
-	       cd ${D}/${baselib}
+	       cd ${D}/${base_libdir}
                ln -sf ld-linux.so.2 ld-lsb.so.2
                ln -sf ld-linux.so.2 ld-lsb.so.3
        fi
 
        if [ "${TARGET_ARCH}" = "powerpc64" ];then
-               cd ${D}
                if [ "${baselib}" != "lib64" ]; then
-                   ln -sf ${baselib} lib64
+                   lnr  ${D}${base_libdir} ${D}/lib64
                fi
-               cd ${D}/${baselib}
+               cd ${D}/${base_libdir}
                ln -sf ld64.so.1 ld-lsb-ppc64.so.2
                ln -sf ld64.so.1 ld-lsb-ppc64.so.3
        fi
        if [ "${TARGET_ARCH}" = "powerpc" ];then
-	       cd ${D}/${baselib}
+	       cd ${D}/${base_libdir}
                ln -sf ld.so.1 ld-lsb-ppc32.so.2
                ln -sf ld.so.1 ld-lsb-ppc32.so.3
        fi
 }
-FILES_${PN} += "/lib64 \
-                ${base_libdir} \
-                /usr/lib/lsb \
-                ${base_libdir}/lsb/* \
-                /lib/lsb/* \
-               "
+FILES_${PN} += "${base_libdir} \
+                ${nonarch_base_libdir}/lsb \
+                ${nonarch_libdir}/lsb/* \
+                ${@'/lib64' if d.getVar('TARGET_ARCH')  == ('x86_64' or 'powerpc64') and '${baselib}' != 'lib64' else ''}"
-- 
2.7.4


