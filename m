Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw5A-0008KI-34
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:15:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0WoI008479
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:32 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:32 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:54 -0600
Message-ID: <0c69e555dda2fa412ba12fa90886b0b92dc60e44.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 22/22] license.bbclass: Avoid grep error message
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
X-List-Received-Date: Tue, 04 Dec 2012 17:15:12 -0000
Content-Type: text/plain

Touch a file that is later greped to make sure it exists.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/license.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c7ca4a6..66cde1c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -13,7 +13,7 @@ do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 license_create_manifest() {
 	mkdir -p ${LICENSE_DIRECTORY}/${IMAGE_NAME}
 	# Get list of installed packages
-	list_installed_packages | grep -v "locale" |sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
+	list_installed_packages | grep -v "locale" | sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
 	INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
 	LICENSE_MANIFEST="${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest"
 	# remove existing license.manifest file
@@ -21,6 +21,7 @@ license_create_manifest() {
 		rm ${LICENSE_MANIFEST}
 	fi
 	# list of installed packages is broken for deb
+	touch ${LICENSE_MANIFEST}
 	for pkg in ${INSTALLED_PKGS}; do
 		# not the best way to do this but licenses are not arch dependant iirc
 		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
-- 
1.7.3.4



