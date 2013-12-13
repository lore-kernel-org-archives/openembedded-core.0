Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 490FF6E36F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 07:55:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBD7tkwf010443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Dec 2013 23:55:46 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 12 Dec 2013 23:55:45 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Fri, 13 Dec 2013 15:54:43 +0800
Message-ID: <ed65823461209449e8938c713430593abdb144c8.1386920771.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386920771.git.kai.kang@windriver.com>
References: <cover.1386920771.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] lsb: update directory of install_initd and remove_initd
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
X-List-Received-Date: Fri, 13 Dec 2013 07:55:46 -0000
Content-Type: text/plain

According to LSB specification:

http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/installinitd.html
http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/removeinitd.html

commands install_initd and remove_initd should under directory /usr/lib/lsb/.

lsb recipe creates these commands under directory ${libdir} which may
expand to /usr/lib64 when multilib is enabled on qemux86-64. That will
cause LSB command check for install_initd and remove_initd fail. So
correct it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index c80ff59..b798ae1 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -78,9 +78,10 @@ do_install_append(){
        install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
 
        # creat links for LSB test
-       install -d ${D}/${libdir}/lsb
-       ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
-       ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
+       install -d ${D}/usr/lib/lsb
+       ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/install_initd
+       ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/remove_initd
+       install -d ${D}/${libdir}
        ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
 
        if [ "${TARGET_ARCH}" = "x86_64" ];then
-- 
1.8.1.2


