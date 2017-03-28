Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6B877A54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 49C7E18421;
	Tue, 28 Mar 2017 14:01:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id WNGg2XE3TAxI; Tue, 28 Mar 2017 14:01:34 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8F78918337;
	Tue, 28 Mar 2017 14:01:34 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55CC51A075;
	Tue, 28 Mar 2017 14:01:34 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A94A1A072;
	Tue, 28 Mar 2017 14:01:34 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 28 Mar 2017 14:01:34 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 3D1212115;
	Tue, 28 Mar 2017 14:01:34 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2SC1Y6a019889;
	Tue, 28 Mar 2017 14:01:34 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2SC1YaY019888;
	Tue, 28 Mar 2017 14:01:34 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 14:01:18 +0200
Message-Id: <20170328120118.19826-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170328120118.19826-1-pkj@axis.com>
References: <20170328120118.19826-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] lsb: Create ${base_prefix}/lib64 correctly when needed
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
X-List-Received-Date: Tue, 28 Mar 2017 12:01:38 -0000

There were two remaining cases that could end up creating /lib64
rather than ${base_prefix}/lib64. The difference matters when building
with usrmerge.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index 2eb67b8c3a..cedf39eb65 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -97,8 +97,8 @@ do_install_append() {
        ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/remove_initd
 
        if [ "${TARGET_ARCH}" = "x86_64" ]; then
-               if [ "${baselib}" != "lib64" ]; then
-                   lnr ${D}${base_libdir} ${D}/lib64
+               if [ "${base_libdir}" != "${base_prefix}/lib64" ]; then
+                   lnr ${D}${base_libdir} ${D}${base_prefix}/lib64
                fi
 	       cd ${D}${base_libdir}
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.2
@@ -111,8 +111,8 @@ do_install_append() {
        fi
 
        if [ "${TARGET_ARCH}" = "powerpc64" ]; then
-               if [ "${baselib}" != "lib64" ]; then
-                   lnr  ${D}${base_libdir} ${D}/lib64
+               if [ "${base_libdir}" != "${base_prefix}/lib64" ]; then
+                   lnr ${D}${base_libdir} ${D}${base_prefix}/lib64
                fi
                cd ${D}${base_libdir}
                ln -sf ld64.so.1 ld-lsb-ppc64.so.2
@@ -125,7 +125,7 @@ do_install_append() {
        fi
 }
 
-FILES_${PN} += "${@'/lib64' if d.getVar('TARGET_ARCH')  == ('x86_64' or 'powerpc64') and '${baselib}' != 'lib64' else ''} \
+FILES_${PN} += "${@'${base_prefix}/lib64' if d.getVar('TARGET_ARCH') == ('x86_64' or 'powerpc64') and '${base_libdir}' != '${base_prefix}/lib64' else ''} \
                 ${base_libdir} \
                 ${nonarch_libdir}/lsb \
                 ${nonarch_base_libdir}/lsb/* \
-- 
2.12.0


