Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2DBD8756C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 16:47:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2015 09:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,673,1427785200"; d="scan'208";a="594028632"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.55])
	by orsmga003.jf.intel.com with ESMTP; 24 Jun 2015 09:47:49 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jun 2015 11:49:42 -0500
Message-Id: <1435164582-31218-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][fido] classes/license.bbclass: Improve generic license copy validation.
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
X-List-Received-Date: Wed, 24 Jun 2015 16:47:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove + char in any position for cover cases when license has
the form like GPL-2.0+-with-OpenSSL-exception.

[YOCTO #7584]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 73a0e97..e00a695 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -71,8 +71,12 @@ license_create_manifest() {
 
 		lics="$(echo ${pkged_lic} | sed "s/[|&()*]/ /g" | sed "s/  */ /g" )"
 		for lic in ${lics}; do
+			# remove + chars in any position this cover cases like
+			# GPL-2.0+-with-OpenSSL-exception -> GPL-2.0-with-OpenSSL-exception
+			lic="$(echo ${lic} | sed "s/\+//g")"
+
 			# to reference a license file trim trailing + symbol
-			if ! [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic%+}" ]; then
+			if ! [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
 				bbwarn "The license listed ${lic} was not in the licenses collected for ${pkged_pn}"
 			fi
 		done
-- 
1.9.1


