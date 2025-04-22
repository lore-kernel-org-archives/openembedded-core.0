Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0069C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 13:07:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.39388.1745327226390811125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 06:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6207e2fc58=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MC0X4H029258
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 13:07:05 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4642t8tyry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 13:07:05 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 22 Apr 2025 06:07:04 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 22 Apr 2025 06:07:03 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V3] icu: set ac_cv_path_install to install under hosttools
Date: Tue, 22 Apr 2025 21:07:02 +0800
Message-ID: <20250422130702.1337476-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: P3Z6qGp_CRhwkYDS_z6G6SYvlFbkaFeC
X-Proofpoint-GUID: P3Z6qGp_CRhwkYDS_z6G6SYvlFbkaFeC
X-Authority-Analysis: v=2.4 cv=TJ9FS0la c=1 sm=1 tr=0 ts=68079479 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=RcX5SHWiSEb9dfOIiUkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=996
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504220099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 13:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215206

From: Changqing Li <changqing.li@windriver.com>

icu will check program install path during do_configure, eg:
checking for a BSD-compatible install... /path/to/install -c

And this path will be writen into pkgdata.inc:
INSTALL_CMD=$(INSTALL-L)

Decided by if install is installed into recipe-sysroot-native during
do_configure stage, the INSTALL_CMD could be
/build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr/bin/install
or /build/tmp/hosttools/install.

set ac_cv_path_install to install under hosttools to make a determined
result of INSTALL_CMD, avoid vary caused by the execute sequence of
another task which DEPENDS on coreutils-native and independent with
do_configure

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/icu/icu_76-1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/icu/icu_76-1.bb b/meta/recipes-support/icu/icu_76-1.bb
index f0890fc890..a33f48cf8e 100644
--- a/meta/recipes-support/icu/icu_76-1.bb
+++ b/meta/recipes-support/icu/icu_76-1.bb
@@ -20,9 +20,9 @@ inherit autotools pkgconfig github-releases
 # ICU needs the native build directory as an argument to its --with-cross-build option when
 # cross-compiling. Taken the situation that different builds may share a common sstate-cache
 # into consideration, the native build directory needs to be staged.
-EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
-EXTRA_OECONF:class-native = "--disable-icu-config"
-EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
+EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='${HOSTTOOLS_DIR}/install -c'"
+EXTRA_OECONF:class-native = "--disable-icu-config ac_cv_path_install='${HOSTTOOLS_DIR}/install -c'"
+EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='${HOSTTOOLS_DIR}/install -c'"
 
 EXTRA_OECONF:append:class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
 TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${@icu_install_folder(d)}\\""', '', d)}"
-- 
2.34.1


