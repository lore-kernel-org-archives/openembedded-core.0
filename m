Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Vladimir_Zapolskiy@mentor.com>) id 1TBFIn-0008CJ-Q6
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 03:30:10 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1TBF6h-0000sJ-8U from Vladimir_Zapolskiy@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 18:17:39 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 10 Sep 2012 18:17:39 -0700
Received: from eyas.fin.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.1.289.1; Tue, 11 Sep 2012 02:17:37 +0100
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2012 04:18:15 +0300
Message-ID: <1347326296-32657-2-git-send-email-vladimir_zapolskiy@mentor.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1347326028-32469-1-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1347326028-32469-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 11 Sep 2012 01:17:39.0142 (UTC)
	FILETIME=[3BF8A660:01CD8FBB]
Subject: [PATCH 5/6] classes/license: correct license info in lisense.manifest
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
X-List-Received-Date: Tue, 11 Sep 2012 01:30:10 -0000
Content-Type: text/plain

Trivial change, do not cut off plus symbol from license name, otherwise
information about package license is corrupted.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 meta/classes/license.bbclass |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 74a8306..4b5954d 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -103,10 +103,10 @@ license_create_manifest() {
 
 		pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
 		pkged_name="$(basename $(readlink ${filename}))"
-		pkged_lic="$(sed -n "/^LICENSE_${pkged_name}: /{ s/^LICENSE_${pkged_name}: //; s/[+|&()*]/ /g; s/  */ /g; p }" ${filename})"
+		pkged_lic="$(sed -n "/^LICENSE_${pkged_name}: /{ s/^LICENSE_${pkged_name}: //; s/[|&()*]/ /g; s/  */ /g; p }" ${filename})"
 		if [ -z ${pkged_lic} ]; then
 			# fallback checking value of LICENSE
-			pkged_lic="$(sed -n "/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }" ${filename})"
+			pkged_lic="$(sed -n "/^LICENSE: /{ s/^LICENSE: //; s/[|&()*]/ /g; s/  */ /g; p }" ${filename})"
 		fi
 
 		echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_MANIFEST}
@@ -114,8 +114,9 @@ license_create_manifest() {
 		echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_MANIFEST}
 		echo "LICENSE: " >> ${LICENSE_MANIFEST}
 		for lic in ${pkged_lic}; do
-			if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
-				echo ${lic}|sed s'/generic_//'g >> ${LICENSE_MANIFEST}
+			# to reference a license file trim trailing + symbol
+			if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic%+}" ]; then
+				echo ${lic} >> ${LICENSE_MANIFEST}
 			else
 				echo "WARNING: The license listed, " ${lic} " was not in the licenses collected for " ${pkged_pn} >> ${LICENSE_MANIFEST}
 			fi
-- 
1.7.10



