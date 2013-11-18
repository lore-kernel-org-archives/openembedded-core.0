Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 754EB6D2F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 07:20:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAI7KUwv010474
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 23:20:30 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 17 Nov 2013 23:20:29 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Nov 2013 15:20:44 +0800
Message-ID: <514cc82b549f3ee3a62b43616ef4813635bec4b7.1384759192.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384759192.git.Qi.Chen@windriver.com>
References: <cover.1384759192.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] license.bbclass: fix missing of license files on ubuntu build host
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
X-List-Received-Date: Mon, 18 Nov 2013 07:20:29 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The license_create_manifest function contains bashism, this will lead
to unexpected results on ubuntu build host, as sh is linked to dash on
ubuntu. Even if COPY_LIC_MANIFEST and COPY_LIC_DIRS are enabled, the
license files will still be missing on target.

This patch fixes the above problem.

[YOCTO #5549]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/license.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 1c1b679..34ae704 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -72,9 +72,9 @@ license_create_manifest() {
 					# Really don't need to copy the generics as they're 
 					# represented in the manifest and in the actual pkg licenses
 					# Doing so would make your image quite a bit larger
-					if [[ "${lic}" != "generic_"* ]]; then
+					if [ "${lic#generic_}" = "${lic}" ]; then
 						cp ${LICENSE_DIRECTORY}/${pkg}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
-					elif [[ "${lic}" == "generic_"* ]]; then
+					else
 						if [ ! -f ${IMAGE_ROOTFS}/usr/share/common-licenses/${lic} ]; then
 							cp ${LICENSE_DIRECTORY}/${pkg}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/
 						fi
-- 
1.7.9.5


