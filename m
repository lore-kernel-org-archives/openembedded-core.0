Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D6B3F6AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 17:12:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Aug 2015 10:12:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,739,1432623600"; d="scan'208";a="789926549"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.5.148])
	by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2015 10:12:17 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 12:12:17 -0500
Message-Id: <1440436338-28264-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2][dizzy] license_class: fix license.manifest shows LICENSE field differently to recipe
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
X-List-Received-Date: Mon, 24 Aug 2015 17:12:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop removal of [|&()*] operators in pkged_lic because this removal is only
needed to validate if license is collected.

[YOCTO #6757]

(From OE-Core rev: 57e5f74382d51f2a8df00e18b6008e3d2b44ad1a)

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 91d8bab..dfb162d 100644
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


