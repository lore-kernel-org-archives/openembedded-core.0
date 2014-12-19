Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 50C5C72A83
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 23:26:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 19 Dec 2014 15:22:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,609,1413270000"; d="scan'208";a="640526441"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.60])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2014 15:26:05 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 17:26:30 -0600
Message-Id: <1419031590-27739-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] license_class: fix license.manifest shows LICENSE field differently to recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Dec 2014 23:26:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop removal of [|&()*] operators in pkged_lic because this removal is only
needed to validate if license is collected.

[YOCTO #6757]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 14d3107..cca9d0b 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -49,24 +49,25 @@ license_create_manifest() {
 
 		pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
 		pkged_name="$(basename $(readlink ${filename}))"
-		pkged_lic="$(sed -n "/^LICENSE_${pkged_name}: /{ s/^LICENSE_${pkged_name}: //; s/[|&()*]/ /g; s/  */ /g; p }" ${filename})"
+		pkged_lic="$(sed -n "/^LICENSE_${pkged_name}: /{ s/^LICENSE_${pkged_name}: //; p }" ${filename})"
 		if [ -z ${pkged_lic} ]; then
 			# fallback checking value of LICENSE
-			pkged_lic="$(sed -n "/^LICENSE: /{ s/^LICENSE: //; s/[|&()*]/ /g; s/  */ /g; p }" ${filename})"
+			pkged_lic="$(sed -n "/^LICENSE: /{ s/^LICENSE: //; p }" ${filename})"
 		fi
 
 		echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_MANIFEST}
 		echo "PACKAGE VERSION:" ${pkged_pv} >> ${LICENSE_MANIFEST}
 		echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_MANIFEST}
-		printf "LICENSE:" >> ${LICENSE_MANIFEST}
-		for lic in ${pkged_lic}; do
+		echo "LICENSE:" ${pkged_lic} >> ${LICENSE_MANIFEST}
+		echo "" >> ${LICENSE_MANIFEST}
+
+		lics="$(echo ${pkged_lic} | sed "s/[|&()*]/ /g" | sed "s/  */ /g" )"
+		for lic in ${lics}; do
 			# to reference a license file trim trailing + symbol
 			if ! [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic%+}" ]; then
 				bbwarn "The license listed ${lic} was not in the licenses collected for ${pkged_pn}"
 			fi
-                        printf " ${lic}" >> ${LICENSE_MANIFEST}
 		done
-		printf "\n\n" >> ${LICENSE_MANIFEST}
 	done
 
 	# Two options here:
-- 
1.9.1


