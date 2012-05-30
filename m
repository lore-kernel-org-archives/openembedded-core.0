Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1SZsY9-0005kG-4J
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 01:43:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 May 2012 16:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="150540576"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 30 May 2012 16:32:08 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q4UNdlxE020878 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 16:39:47 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q4UNdlSG020877
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 16:39:47 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2012 16:39:45 -0700
Message-Id: <6dcb3827885e1e0812656d44028df568903fb400.1338420972.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1338420972.git.elizabeth.flanagan@intel.com>
References: <cover.1338420972.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] license.bbclass: Adding PV to package.manifest
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
X-List-Received-Date: Wed, 30 May 2012 23:43:33 -0000

Per request, adding the package version to the package manifest
file.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 6c4a673..a537496 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -90,11 +90,13 @@ license_create_manifest() {
 		for filename in $files; do
 			pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
 			pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
+			pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
 			# check to see if the package name exists in the manifest. if so, bail.
 			if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
 				# exclude local recipes
 				if [ ! "${pkged_pn}" = "*locale*" ]; then
 					echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+					echo "PACKAGE VERSION:" ${pkged_pv} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
 					echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
 					echo "LICENSE: " >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
 					for lic in ${pkged_lic}; do
-- 
1.7.5.4



