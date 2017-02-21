Return-Path: <Alexandru.Moise@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD2172F26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 13:55:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1LDtGpx006408
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 05:55:16 -0800 (PST)
Received: from otp-amoise-l1.corp.ad.wrs.com (128.224.125.171) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 21 Feb 2017 05:55:15 -0800
From: Alexandru Moise <alexandru.moise@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2017 15:55:12 +0200
Message-ID: <1487685312-14595-1-git-send-email-alexandru.moise@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [yocto] [meta-selinux] [PATCH] refpolicy-mls: user native bzip2 instead of host
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
X-List-Received-Date: Tue, 21 Feb 2017 13:55:16 -0000
Content-Type: text/plain

The behavior of b{zip,unzip}2 an vary from host to host with
regards to a number of things such as return value or permissions.

We should always use the native bzip2 package to keep the behavior
deterministic. This change prevents a warning at do_package_qa
task of refpolicy-mls package.

Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
---
 recipes-security/refpolicy/refpolicy_common.inc | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/recipes-security/refpolicy/refpolicy_common.inc b/recipes-security/refpolicy/refpolicy_common.inc
index 58152a8..91dd2ba 100644
--- a/recipes-security/refpolicy/refpolicy_common.inc
+++ b/recipes-security/refpolicy/refpolicy_common.inc
@@ -27,7 +27,7 @@ FILES_${PN}-dev =+ " \
         ${sysconfdir}/selinux/sepolgen.conf \
 "
 
-DEPENDS += "checkpolicy-native policycoreutils-native m4-native"
+DEPENDS += "checkpolicy-native policycoreutils-native m4-native bzip2-native"
 
 RDEPENDS-${PN}-dev =+ " \
         python \
@@ -99,19 +99,21 @@ prepare_policy_store () {
 	# get hll type from suffix on base policy module
 	HLL_TYPE=$(echo ${POL_SRC}/base.* | awk -F . '{if (NF>1) {print $NF}}')
 	HLL_BIN=${STAGING_DIR_NATIVE}${prefix}/libexec/selinux/hll/${HLL_TYPE}
+	native_bzip2=${STAGING_BINDIR_NATIVE}/bzip2-native/bzip2
+	native_bunzip2=${STAGING_BINDIR_NATIVE}/bzip2-native/bunzip2
 
 	for i in ${POL_SRC}/*.${HLL_TYPE}; do
 		MOD_NAME=$(basename $i | sed "s/\.${HLL_TYPE}$//")
 		MOD_DIR=${POL_ACTIVE_MODS}/${MOD_NAME}
 		mkdir -p ${MOD_DIR}
 		echo -n "${HLL_TYPE}" > ${MOD_DIR}/lang_ext
-		if ! bzip2 -t $i >/dev/null 2>&1; then
-			${HLL_BIN} $i | bzip2 --stdout > ${MOD_DIR}/cil
-			bzip2 -f $i && mv -f $i.bz2 $i
+		if ! ${native_bzip2} -t $i >/dev/null 2>&1; then
+			${HLL_BIN} $i | ${native_bzip2} --stdout > ${MOD_DIR}/cil
+			${native_bzip2} -f $i && mv -f $i.bz2 $i
 		else
-			bunzip2 --stdout $i | \
+			${native_bunzip2} --stdout $i | \
 				${HLL_BIN} | \
-				bzip2 --stdout > ${MOD_DIR}/cil
+				${native_bzip2} --stdout > ${MOD_DIR}/cil
 		fi
 		cp $i ${MOD_DIR}/hll
 	done
-- 
2.10.2


