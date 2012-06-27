Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SjlWb-00038S-2E
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 08:14:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5R63tpN026162
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 23:03:55 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Tue, 26 Jun 2012 23:03:55 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jun 2012 14:04:19 +0800
Message-ID: <70f42c05e9e15f403cccc16c92fb14d0675c0c7d.1340776826.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1340776826.git.kai.kang@windriver.com>
References: <cover.1340776826.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] lsbinitscripts: Add a linking for functions.lsbinitscripts
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
X-List-Received-Date: Wed, 27 Jun 2012 06:14:49 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The linking will fail when an original file "functions" exists.
So using the new linking replace the previous "functions".

[YOCTO #2133]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
index dd92a92..990da2e 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SysV init scripts which only is used in an LSB image"
 SECTION = "base"
 LICENSE = "GPLv2"
 DEPENDS = "popt"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
@@ -13,15 +13,12 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}
 
 SRC_URI[md5sum] = "668fa2762b57ef75436303857847bba3"
 SRC_URI[sha256sum] = "d56547a68ce223a7413b2676650b042125f047c8d6d139c5b970e118b3dc958a"
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "10"
-ALTERNATIVE_${PN} = "functions"
-ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
 
 do_configure[noexec] = "1" 
 
 do_install(){
 	install -d ${D}/etc/init.d/
-	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions
+	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions.lsbinitscripts
+        cd ${D}/etc/init.d/
+        ln -sf functions.lsbinitscripts functions
 }
-- 
1.7.5.4



