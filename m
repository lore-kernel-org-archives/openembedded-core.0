Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Vladimir_Zapolskiy@mentor.com>) id 1TBFSY-00005B-59
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 03:40:14 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1TBF2R-0007cS-Dg from Vladimir_Zapolskiy@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 18:13:15 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 10 Sep 2012 18:13:15 -0700
Received: from eyas.fin.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.1.289.1; Tue, 11 Sep 2012 02:13:13 +0100
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2012 04:13:44 +0300
Message-ID: <1347326028-32469-3-git-send-email-vladimir_zapolskiy@mentor.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1347326028-32469-1-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1347326028-32469-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 11 Sep 2012 01:13:15.0455 (UTC)
	FILETIME=[9ECD34F0:01CD8FBA]
Subject: [PATCH 2/6] classes/license: check license manifest for double records
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
X-List-Received-Date: Tue, 11 Sep 2012 01:40:14 -0000
Content-Type: text/plain

Trivial typo bugfix, avoid multiple records in license.manifest.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 meta/classes/license.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 0335f41..021ab2e 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -93,7 +93,7 @@ license_create_manifest() {
 		pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
 		pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
 		# check to see if the package name exists in the manifest. if so, bail.
-		if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
+		if ! grep -q "^PACKAGE NAME: ${pkg}" ${LICENSE_MANIFEST}; then
 			# exclude local recipes
 			if [ ! "${pkged_pn}" = "*locale*" ]; then
 				echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_MANIFEST}
-- 
1.7.10



