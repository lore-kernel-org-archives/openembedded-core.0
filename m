Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0D3D6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 02:59:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2J2xNNg005364
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 19:59:24 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 18 Mar 2015 19:59:23 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Mar 2015 10:59:15 +0800
Message-ID: <28ff71b9911e9e63d0e5f30a98378ff5f654b924.1426733823.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1426733823.git.Qi.Chen@windriver.com>
References: <cover.1426733823.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/5] license.bbclass: skip license checking if the package contains no file
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
X-List-Received-Date: Thu, 19 Mar 2015 02:59:22 -0000
Content-Type: text/plain

If the package doesn't contain any file, then the license isn't relevant
as far as the final image is concerned. So we skip the license checking
in license_create_manifest if such case.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/license.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 95e0121..73a0e97 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -50,6 +50,7 @@ license_create_manifest() {
 		pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
 		pkged_name="$(basename $(readlink ${filename}))"
 		pkged_lic="$(sed -n "/^LICENSE_${pkged_name}: /{ s/^LICENSE_${pkged_name}: //; p }" ${filename})"
+		pkged_size="$(sed -n "/^PKGSIZE_${pkged_name}: /{ s/^PKGSIZE_${pkged_name}: //; p }" ${filename})"
 		if [ -z "${pkged_lic}" ]; then
 			# fallback checking value of LICENSE
 			pkged_lic="$(sed -n "/^LICENSE: /{ s/^LICENSE: //; p }" ${filename})"
@@ -61,6 +62,13 @@ license_create_manifest() {
 		echo "LICENSE:" ${pkged_lic} >> ${LICENSE_MANIFEST}
 		echo "" >> ${LICENSE_MANIFEST}
 
+		# If the package doesn't contain any file, that is, its size is 0, the license
+		# isn't relevant as far as the final image is concerned. So doing license check
+		# doesn't make much sense, skip it.
+		if [ "$pkged_size" = "0" ]; then
+			continue
+		fi
+
 		lics="$(echo ${pkged_lic} | sed "s/[|&()*]/ /g" | sed "s/  */ /g" )"
 		for lic in ${lics}; do
 			# to reference a license file trim trailing + symbol
-- 
1.9.1


