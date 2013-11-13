Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA1A6D689
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 08:27:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rAD8RctE006874
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 00:27:38 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 13 Nov 2013 00:27:39 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 16:27:33 +0800
Message-ID: <bb068bc66bcdbf96dd84e5cd18e1765b9a32f2cc.1384331128.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384331128.git.kai.kang@windriver.com>
References: <cover.1384331128.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/1] lsb: update directory of install_initd and remove_initd
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
X-List-Received-Date: Wed, 13 Nov 2013 08:27:37 -0000
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
 meta/recipes-extended/lsb/lsb_4.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index c80ff59..8105e59 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -79,8 +79,8 @@ do_install_append(){
 
        # creat links for LSB test
        install -d ${D}/${libdir}/lsb
-       ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
-       ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
+       ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/install_initd
+       ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/remove_initd
        ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
 
        if [ "${TARGET_ARCH}" = "x86_64" ];then
-- 
1.8.1.2


