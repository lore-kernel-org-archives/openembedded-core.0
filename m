Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1U5esm-0007wf-Do
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 17:08:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1DFqPPr018076
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 07:52:26 -0800 (PST)
Received: from otp-fsarbu-l1.corp.ad.wrs.com (128.224.168.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 13 Feb 2013 07:52:25 -0800
From: Florin Sarbu <florin.sarbu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Feb 2013 17:52:18 +0200
Message-ID: <1360770738-26127-1-git-send-email-florin.sarbu@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Originating-IP: [128.224.168.151]
Subject: [PATCH] connman: Have connman package systemd service.
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
X-List-Received-Date: Wed, 13 Feb 2013 16:08:35 -0000
X-List-Received-Date: Wed, 13 Feb 2013 16:08:35 -0000
Content-Type: text/plain

connman.inc was missing the SYSTEMD_PACKAGES variable. Declared
${PN}-systemd as the package containing the systemd service
file and also added this package to PACKAGES variable.

Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
---
 meta/recipes-connectivity/connman/connman.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index b61e2af..8c4ee89 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r17"
+INC_PR = "r18"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -46,6 +46,7 @@ EXTRA_OECONF += "\
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
+SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "connman.service"
 
 # IMPORTANT: because xuser is shared with rootless X, please make sure the
@@ -116,7 +117,7 @@ python populate_packages_prepend() {
             d.setVar("RDEPENDS_%s" % package, " ".join(rdepends))
 }
 
-PACKAGES =+ "${PN}-tools ${PN}-tests"
+PACKAGES =+ "${PN}-tools ${PN}-tests ${PN}-systemd"
 
 FILES_${PN}-tools = "${bindir}/wispr"
 
-- 
1.7.10.4



