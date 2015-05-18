Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0F155600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 19:17:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 18 May 2015 12:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,454,1427785200"; d="scan'208";a="696738730"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2015 12:17:52 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 19:17:32 +0000
Message-Id: <1431976652-15590-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Subject: [FIDO][PATCH] license_class: Add explicity avoid of CLOSED license in validations
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
X-List-Received-Date: Mon, 18 May 2015 19:17:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CLOSED license isn't a generic license it is a set and can
be any closed source license.

[YOCTO #7752]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 73a0e97..fdc1170 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -71,6 +71,11 @@ license_create_manifest() {
 
 		lics="$(echo ${pkged_lic} | sed "s/[|&()*]/ /g" | sed "s/  */ /g" )"
 		for lic in ${lics}; do
+			# add explicity avoid of CLOSED license because isn't generic
+			if [ "$lic" = "CLOSED" ]; then
+				continue
+			fi
+
 			# to reference a license file trim trailing + symbol
 			if ! [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic%+}" ]; then
 				bbwarn "The license listed ${lic} was not in the licenses collected for ${pkged_pn}"
@@ -242,8 +247,10 @@ def find_license_files(d):
 
             lic_files_paths.append(("generic_" + license_type, os.path.join(license_source, spdx_generic)))
         else:
-            # And here is where we warn people that their licenses are lousy
-            bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
+            # Add explicity avoid of CLOSED license because this isn't generic
+            if license_type != 'CLOSED':
+                # And here is where we warn people that their licenses are lousy
+                bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
             pass
 
     if not generic_directory:
-- 
1.8.4.5


