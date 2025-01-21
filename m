Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8CFC0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 08:55:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11924.1737449736027164214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 00:55:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31163e49e6=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8TTWV009201
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 00:55:35 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 448cpq28yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 00:55:35 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 21 Jan 2025 00:55:35 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 21 Jan 2025 00:55:34 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 8/9] Add recipe nativesdk-multiconfig-multlib-toolchain-packager
Date: Tue, 21 Jan 2025 16:55:25 +0800
Message-ID: <20250121085526.1370937-8-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121085526.1370937-1-hongxu.jia@windriver.com>
References: <20250121085526.1370937-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: MR1eoblNUCYZvG0BvYgMnMs2r4v4zQXZ
X-Proofpoint-GUID: MR1eoblNUCYZvG0BvYgMnMs2r4v4zQXZ
X-Authority-Analysis: v=2.4 cv=TdtstQQh c=1 sm=1 tr=0 ts=678f6107 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=t7CeM3EgAAAA:8 a=PaQVhxr333NsTzhZ9hwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501210072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 08:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210080

Support two mutliconfig build x86 and x86_64:

1. Trigger a x86 multiconfig build to generate 32bit x86 buildtools-tarball.
During package runtime installation, script postinst extracted 32bit x86
buildtools-tarball and installed it to 64bit x86_64 nativesdk sysroot.

2. Trigger a x86_64 multiconfig build to generate 64bit x86_64 buildtools-tarball.
During package runtime installation, script postinst extracted 64bit x86_64
buildtools-tarball and installed it to 32bit x86 nativesdk sysroot.

[ YOCTO #15722 ]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ticonfig-multlib-toolchain-packager_0.1.bb | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 meta-selftest/recipes-test/multiconfig/nativesdk-multiconfig-multlib-toolchain-packager_0.1.bb

diff --git a/meta-selftest/recipes-test/multiconfig/nativesdk-multiconfig-multlib-toolchain-packager_0.1.bb b/meta-selftest/recipes-test/multiconfig/nativesdk-multiconfig-multlib-toolchain-packager_0.1.bb
new file mode 100644
index 0000000000..c742c3eddd
--- /dev/null
+++ b/meta-selftest/recipes-test/multiconfig/nativesdk-multiconfig-multlib-toolchain-packager_0.1.bb
@@ -0,0 +1,74 @@
+DESCRIPTION = "Fetch 32bit x86 buildtools-tarball from x86 multiconfig build, \
+extract and install toolchain libraries and include files into 64bit nativesdk sysroot.\
+Or fetch 64bit x86_64 buildtools-tarball from x86_64 multiconfig build, \
+extract and install toolchain libraries and include files into 32bit nativesdk sysroot.\
+"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
+
+inherit nativesdk
+
+MCSDK_ARCH:virtclass-mcextend-x86 = "i686"
+MCSDK_ARCH:virtclass-mcextend-x86_64 = "x86_64"
+
+FROM_MULTICONFIG:virtclass-mcextend-x86_64 = "x86"
+FROM_MULTICONFIG:virtclass-mcextend-x86 = "x86_64"
+
+TO_MULTICONFIG = "${MCNAME}"
+
+MC_SDK_DEPLOY = "${TOPDIR}/tmp-mc-${MCNAME}/deploy/sdk"
+MC_TOOLCHAIN_OUTPUTNAME = "${MCSDK_ARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
+
+# 64bit x86_64 platform requires 32bit x86 buildtools-tarball
+# Or
+# 32bit x86 platform requires 64bit buildtools-tarball
+do_install[mcdepends] += "mc:${FROM_MULTICONFIG}:${TO_MULTICONFIG}:buildtools-tarball:do_build"
+do_install () {
+    install -d ${D}${localstatedir}/machines/${MCNAME}
+    install ${MC_SDK_DEPLOY}/${MC_TOOLCHAIN_OUTPUTNAME}.sh ${D}${localstatedir}/machines/${MCNAME}/buildtools-tarball.sh
+}
+
+MC_BASELIB:virtclass-mcextend-x86 = "lib"
+MC_BASELIB:virtclass-mcextend-x86_64 = "lib64"
+
+INSTALL_FILES ?= " \
+    /usr/include \
+    /usr/${MC_BASELIB} \
+    /${MC_BASELIB} \
+"
+do_install[vardeps] += "INSTALL_FILES MC_SDK_DEPLOY MC_TOOLCHAIN_OUTPUTNAME"
+
+# Extract and install toolchain libraries and include files into nativesdk sysroot
+pkg_postinst:${PN} () {
+    set -x
+    $D${localstatedir}/machines/${MCNAME}/buildtools-tarball.sh -y -d $D/sdk-${MCNAME}
+    src_prefix="$D/sdk-${MCNAME}/sysroots/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}"
+    for install_file in ${INSTALL_FILES}; do
+        if [ ! -e ${src_prefix}${install_file} ]; then
+            echo "${src_prefix}${install_file} does not exist"
+            exit 1
+        elif [ -d ${src_prefix}${install_file} ]; then
+            install -d $D${SDKPATHNATIVE}${install_file}
+            cp -rf ${src_prefix}${install_file}/* $D${SDKPATHNATIVE}${install_file}/
+        else
+            install -d $D${SDKPATHNATIVE}${install_file%/*}
+            cp -f ${src_prefix}${install_file} $D${SDKPATHNATIVE}${install_file}
+        fi
+    done
+    rm $D/sdk-${MCNAME} -rf
+}
+
+
+python () {
+    mcname = d.getVar('MCNAME')
+    if not mcname:
+        raise bb.parse.SkipRecipe("Not a multiconfig target")
+
+    multiconfigs = d.getVar('BBMULTICONFIG') or ""
+    if mcname not in multiconfigs:
+        raise bb.parse.SkipRecipe("multiconfig target %s not enabled" % mcname)
+}
+
+INSANE_SKIP = "native-last"
+
+BBCLASSEXTEND = "mcextend:x86 mcextend:x86_64"
-- 
2.34.1


