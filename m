Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ED2DB738C0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 01:28:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t251SSRU013701
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Mar 2015 17:28:28 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 4 Mar 2015 17:28:28 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Mar 2015 09:20:06 +0800
Message-ID: <fce84d7d47422ee28840264034d20359e265e164.1425518329.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1425518329.git.kai.kang@windriver.com>
References: <cover.1425518329.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/3] lsb: update init-functions and remove sendmail
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
X-List-Received-Date: Thu, 05 Mar 2015 01:28:31 -0000
Content-Type: text/plain

According to LSB specification Ref1, LSB checks file
/lib/lsb/init-functions. But for 64 bits system it is installed in
/lib64. Install init-functions to /lib/lsb to conform with LSB
specification.

Link file /usr/lib/sendmail which points to /usr/sbin/sendmail is
required by LSB according to Linux FHS[Ref 2]. But it should be done by
packages which provides command sendmail such as msmtp, postfix and
esmtp etc.

Refs:
1 http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/iniscrptfunc.html
2 http://www.pathname.com/fhs/pub/fhs-2.3.html#SPECIFICOPTIONS13

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index b4ef98e..f05c30c 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -72,19 +72,18 @@ do_install(){
 
 do_install_append(){
        install -d ${D}${sysconfdir}/core-lsb
-       install -d ${D}/${baselib}/lsb
        for i in lsb_killproc lsb_log_message lsb_pidofproc lsb_start_daemon
        do
            install -m 0755 ${WORKDIR}/${i} ${D}${sysconfdir}/core-lsb
        done
-       install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
+
+       install -d ${D}/lib/lsb
+       install -m 0755 ${WORKDIR}/init-functions ${D}/lib/lsb
 
        # creat links for LSB test
        install -d ${D}/usr/lib/lsb
        ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/install_initd
        ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/remove_initd
-       install -d ${D}/${libdir}
-       ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
 
        if [ "${TARGET_ARCH}" = "x86_64" ];then
 	       cd ${D}
@@ -119,13 +118,4 @@ do_install_append(){
 FILES_${PN} += "/lib64 \
 		/usr/lib/lsb \
                 ${base_libdir}/lsb/* \
-		${libdir}/sendmail \
                "
-
-# The sysroot/${libdir}/sendmail conflicts with esmtp's, and it's a
-# symlink to ${sbindir}/sendmail which is meaningless for sysroot, so
-# remove it.
-SYSROOT_PREPROCESS_FUNCS += "remove_sysroot_sendmail"
-remove_sysroot_sendmail() {
-    rm -r "${SYSROOT_DESTDIR}${libdir}/sendmail"
-}
-- 
1.9.1


