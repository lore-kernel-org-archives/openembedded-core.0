Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qbjql-00082i-Bc
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 03:45:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5T1gDDX024919
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 18:42:13 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 28 Jun 2011 18:42:12 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2011 20:42:35 -0500
Message-ID: <c2e9613af3f240b6310bc596d06a199dd9e2bcef.1309311666.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309311666.git.mark.hatle@windriver.com>
References: <cover.1309311666.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] prelink_git.bb: Only block the postinst script when no image-prelink
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
X-List-Received-Date: Wed, 29 Jun 2011 01:45:55 -0000
Content-Type: text/plain

If image-prelink is being used, the system will automatically prelink
the target image.  This avoids the need to run the postinst prelink
script at first boot.  However, if the user has not enabled image
prelinking -- then we do enable the script to run on first boot.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/prelink/prelink_git.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index b57c145..1b34e59 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -10,7 +10,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 SRCREV = "ac461e73b17253a4da25c5aafeac7193b553156c"
 PV = "1.0+git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 #
 # The cron script attempts to re-prelink the system daily -- on
@@ -58,11 +58,13 @@ do_install_append () {
 	install -m 0644 ${WORKDIR}/macros.prelink ${D}${sysconfdir}/rpm/macros.prelink
 }
 
+# If we're using mklibs-prelink, we want to skip this on the host side
+# but still do it if the package is installed on the target...
 pkg_postinst_prelink() {
 #!/bin/sh
 
 if [ "x$D" != "x" ]; then
-  exit 1
+  ${@base_contains('USER_CLASSES', 'image-prelink', 'exit 0', 'exit 1', d)}
 fi
 
 prelink -a
-- 
1.7.3.4



