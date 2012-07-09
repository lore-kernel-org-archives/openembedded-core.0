Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1So3rj-0004fZ-Nv
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 04:38:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q692REVu025306
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Jul 2012 19:27:14 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Sun, 8 Jul 2012 19:27:13 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Mon, 9 Jul 2012 10:26:58 +0800
Message-ID: <a93c04e2032547f3813547b5e08e0ea1eba7ec18.1341800388.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1341800388.git.kai.kang@windriver.com>
References: <cover.1341800388.git.kai.kang@windriver.com>
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
X-List-Received-Date: Mon, 09 Jul 2012 02:38:24 -0000
Content-Type: text/plain

lsb need a more abundant /etc/init.d/functions file to handle lsb test.
Use update-alternative to install file funtions in package initscripts,
when package lsbinitscripts installed the file functions of
lsbinitscripts will be used.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 829694b..1d80c55 100644
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
-- 
1.7.5.4



