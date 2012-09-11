Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Vladimir_Zapolskiy@mentor.com>) id 1TBFPO-0008PF-IS
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 03:36:58 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1TBF2T-0007cm-G5 from Vladimir_Zapolskiy@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 18:13:17 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 10 Sep 2012 18:13:17 -0700
Received: from eyas.fin.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.1.289.1; Tue, 11 Sep 2012 02:13:15 +0100
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2012 04:13:45 +0300
Message-ID: <1347326028-32469-4-git-send-email-vladimir_zapolskiy@mentor.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1347326028-32469-1-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1347326028-32469-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 11 Sep 2012 01:13:17.0378 (UTC)
	FILETIME=[9FF2A220:01CD8FBA]
Subject: [PATCH 3/6] classes/license: remove redundant nested if statements
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
X-List-Received-Date: Tue, 11 Sep 2012 01:36:58 -0000
Content-Type: text/plain

Cosmetic change, which improves code perception. Also check for locale
packages firstly, this shall improve performance a little.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 meta/classes/license.bbclass |   40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 021ab2e..8fb66be 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -90,26 +90,32 @@ license_create_manifest() {
 		# not the best way to do this but licenses are not arch dependant iirc
 		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
 		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
+
+		# exclude locale recipes
+		if [ "${pkged_pn}" = "*locale*" ]; then
+			continue
+		fi
+
+		# check to see if the package name exists in the manifest. if so, bail.
+		if grep -q "^PACKAGE NAME: ${pkg}" ${LICENSE_MANIFEST}; then
+			continue
+		fi
+
 		pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
 		pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
-		# check to see if the package name exists in the manifest. if so, bail.
-		if ! grep -q "^PACKAGE NAME: ${pkg}" ${LICENSE_MANIFEST}; then
-			# exclude local recipes
-			if [ ! "${pkged_pn}" = "*locale*" ]; then
-				echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_MANIFEST}
-				echo "PACKAGE VERSION:" ${pkged_pv} >> ${LICENSE_MANIFEST}
-				echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_MANIFEST}
-				echo "LICENSE: " >> ${LICENSE_MANIFEST}
-				for lic in ${pkged_lic}; do
-					if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
-						echo ${lic}|sed s'/generic_//'g >> ${LICENSE_MANIFEST}
-					else
-						echo "WARNING: The license listed, " ${lic} " was not in the licenses collected for " ${pkged_pn} >> ${LICENSE_MANIFEST}
-					fi
-				done
-				echo "" >> ${LICENSE_MANIFEST}
+
+		echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_MANIFEST}
+		echo "PACKAGE VERSION:" ${pkged_pv} >> ${LICENSE_MANIFEST}
+		echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_MANIFEST}
+		echo "LICENSE: " >> ${LICENSE_MANIFEST}
+		for lic in ${pkged_lic}; do
+			if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
+				echo ${lic}|sed s'/generic_//'g >> ${LICENSE_MANIFEST}
+			else
+				echo "WARNING: The license listed, " ${lic} " was not in the licenses collected for " ${pkged_pn} >> ${LICENSE_MANIFEST}
 			fi
-		fi
+		done
+		echo "" >> ${LICENSE_MANIFEST}
 	done
 
 	# Two options here:
-- 
1.7.10



