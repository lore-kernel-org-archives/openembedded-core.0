Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F36777E4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 01:57:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I1vXd9022611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jul 2017 18:57:34 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 18:57:33 -0700
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <ross.burton@intel.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jul 2017 09:56:53 +0800
Message-ID: <1500343013-131653-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCHv2] lsb: add checking for chkconfig existence when creating the symbolic
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
X-List-Received-Date: Tue, 18 Jul 2017 01:57:34 -0000
Content-Type: text/plain

install_initd and remove_initd will be created as the symbolic file
of chkconfig, which will be not existed when systemd is configured,
so adding the check for the existence of chkconfig before creating
the symbolic.

Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index cedf39e..c8db1a8 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -90,11 +90,13 @@ do_install_append() {
        install -m 0755 ${WORKDIR}/init-functions ${D}${nonarch_base_libdir}/lsb
 
        # create links for LSB test
-       if [ "${nonarch_base_libdir}" != "${nonarch_libdir}" ] ; then
-               install -d ${D}${nonarch_libdir}/lsb
+       if [ -e ${sbindir}/chkconfig ]; then
+               if [ "${nonarch_base_libdir}" != "${nonarch_libdir}" ] ; then
+                       install -d ${D}${nonarch_libdir}/lsb
+               fi
+               ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/install_initd
+               ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/remove_initd
        fi
-       ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/install_initd
-       ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/remove_initd
 
        if [ "${TARGET_ARCH}" = "x86_64" ]; then
                if [ "${base_libdir}" != "${base_prefix}/lib64" ]; then
-- 
1.9.1


