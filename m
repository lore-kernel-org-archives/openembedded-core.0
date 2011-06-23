Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZoNK-0003LD-LY
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 20:11:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5NI7wCY003979
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:07:58 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 23 Jun 2011 11:07:58 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2011 13:19:30 -0500
Message-ID: <bebc3d7946771a55ef9573cfa19ec0e91b6b50d1.1308852888.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308852888.git.mark.hatle@windriver.com>
References: <cover.1308852888.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/9] ghostscript: Fix owner/group of /etc/cups
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
X-List-Received-Date: Thu, 23 Jun 2011 18:11:35 -0000
Content-Type: text/plain

/etc/cups is owned by root:lp from the cups package, the associated
ghostscript was creating the /etc/cups directory as root:root.  /etc/cups
is the authoritative source.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../ghostscript/ghostscript_9.02.bb                |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
index 3cb5485..02038ea 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
@@ -15,7 +15,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d151214b3131251dfc9d858593acbd24"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "${PN}-native tiff jpeg fontconfig cups"
 DEPENDS_virtclass-native = ""
@@ -57,6 +57,8 @@ do_install_append () {
     mkdir -p ${D}${datadir}/ghostscript/${PV}/
     cp -r Resource ${D}${datadir}/ghostscript/${PV}/
     cp -r iccprofiles ${D}${datadir}/ghostscript/${PV}/
+
+    chown -R root:lp ${D}${sysconfdir}/cups
 }
 
 python do_patch_virtclass-native () {
-- 
1.7.3.4



