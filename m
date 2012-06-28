Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SkBIy-0001Qo-HJ
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 11:46:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5S9ZWDw006591
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jun 2012 02:35:32 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Thu, 28 Jun 2012 02:35:32 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Thu, 28 Jun 2012 17:35:56 +0800
Message-ID: <4460a45a7ab14ef1075dd5a1ba27075e11d036b7.1340873279.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1340873279.git.kai.kang@windriver.com>
References: <cover.1340873279.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] initscripts: use update-alternative to handle file functions
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
X-List-Received-Date: Thu, 28 Jun 2012 09:46:28 -0000
Content-Type: text/plain

lsb need a more abundant /etc/init.d/functions file to handle lsb test.
Use update-alternative to install file funtions in package initscripts,
when package lsbinitscripts installed the file functions of
lsbinitscripts will be used.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 829694b..78c27a3 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r134"
+PR = "r135"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -37,6 +37,12 @@ SRC_URI_append_arm = " file://alignment.sh"
 
 KERNEL_VERSION = ""
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_${PN} = "functions"
+ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
+
 HALTARGS ?= "-d -f"
 
 do_configure() {
@@ -60,7 +66,7 @@ do_install () {
 	install -d ${D}${sysconfdir}/default
 	install -d ${D}${sysconfdir}/default/volatiles
 
-	install -m 0644    ${WORKDIR}/functions		${D}${sysconfdir}/init.d
+	install -m 0644    ${WORKDIR}/functions		${D}${sysconfdir}/init.d/functions.${BPN}
 	install -m 0755    ${WORKDIR}/bootmisc.sh	${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/checkroot.sh	${D}${sysconfdir}/init.d
 #	install -m 0755    ${WORKDIR}/finish.sh		${D}${sysconfdir}/init.d
-- 
1.7.5.4



