Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Tw2Mv-0002Kn-JF
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 04:11:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0I2uOoS023528
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 18:56:24 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 17 Jan 2013 18:56:24 -0800
From: <rongqing.li@windriver.com>
To: <randy.macleod@windriver.com>, <joe.macdonald@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 Jan 2013 10:56:22 +0800
Message-ID: <101e3bb96160957183aaa5770f989757916edaa9.1358477598.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358477598.git.rongqing.li@windriver.com>
References: <cover.1358477598.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] xinetd: enable tcp-wrappers support by DISTRO_FEATURE
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
X-List-Received-Date: Fri, 18 Jan 2013 03:11:58 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 3bde512..9278cc2 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 
 DEPENDS = ""
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://xinetd.init \
@@ -28,6 +28,9 @@ INITSCRIPT_PARAMS = "defaults"
 
 EXTRA_OECONF="--disable-nls"
 
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'tcp-wrappers', 'tcp-wrappers', '', d)}"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'tcp-wrappers', '--with-libwrap', '', d)}"
+
 do_configure() {
 	# Looks like configure.in is broken, so we are skipping
 	# rebuilding configure and are just using the shipped one
-- 
1.7.10.4



