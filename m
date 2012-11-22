Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TbNdI-0005Ub-Ku
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 04:39:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAM3PFrY007577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 19:25:15 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 21 Nov 2012 19:25:12 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 22 Nov 2012 11:25:47 +0800
Message-ID: <109a6ebf14ab5d312954f371eaf3bbfbcb6fb2d0.1353553774.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1353553772.git.kai.kang@windriver.com>
References: <cover.1353553772.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] lsb: move links from lsbsetup to here
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2012 03:39:21 -0000
Content-Type: text/plain

Because package lsbsetup is dropped, move the links created for LSB test
to package lsb.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index 55ea241..01368b3 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "LSB support for OpenEmbedded"
 SECTION = "console/utils"
 HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
 LICENSE = "GPLv2+"
-PR = "r0"
+PR = "r1"
 
 # lsb_release needs getopt
 RDEPENDS_${PN} += "util-linux"
@@ -73,6 +73,13 @@ do_install_append(){
            install -m 0755 ${WORKDIR}/${i} ${D}${sysconfdir}/core-lsb
        done
        install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
+
+       # creat links for LSB test
+       install -d ${D}/${libdir}/lsb
+       ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
+       ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
+       ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
+
        if [ "${TARGET_ARCH}" = "x86_64" ];then
 	       cd ${D}
                if [ "${baselib}" != "lib64" ]; then
@@ -105,4 +112,5 @@ do_install_append(){
 }
 FILES_${PN} += "/lib64 \
                 ${base_libdir}/lsb/* \
+		${libdir}/sendmail \
                "
-- 
1.7.5.4



