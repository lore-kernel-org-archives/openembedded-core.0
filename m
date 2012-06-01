Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SaO32-0004Dz-3S
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 11:21:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q519BAFE015965
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jun 2012 02:11:10 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 1 Jun 2012 02:11:09 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jun 2012 17:13:47 +0800
Message-ID: <3b6d1051beff117d6d98bdcaabb7a06b98c33e51.1338541462.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1338541462.git.xiaofeng.yan@windriver.com>
References: <cover.1338541462.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/3 V2] lsbinitscripts: Add initscripts to enhance init functions in an lsb image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2012 09:21:32 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The version of initscripts has more functions than the simple.
There could be some errors for current initscripts when running
some programe because of absent some functions provided by initscripts.

[YOCTO #2133]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |   26 ++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
new file mode 100644
index 0000000..8ee8636
--- /dev/null
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "SysV init scripts which only is used in an LSB image"
+SECTION = "base"
+LICENSE = "GPLv2"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
+
+S="${WORKDIR}/initscripts-${PV}"
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/668fa2762b57ef75436303857847bba3/initscripts-${PV}.tar.bz2 \
+           file://functions.patch \
+          " 
+
+SRC_URI[md5sum] = "668fa2762b57ef75436303857847bba3"
+SRC_URI[sha256sum] = "d56547a68ce223a7413b2676650b042125f047c8d6d139c5b970e118b3dc958a"
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "10"
+ALTERNATIVE_${PN} = "functions"
+ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
+
+do_configure[noexec] = "1" 
+
+do_install(){
+	install -d ${D}/etc/init.d/
+	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions
+}
-- 
1.7.0.4



