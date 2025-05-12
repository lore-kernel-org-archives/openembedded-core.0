Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EE1C3ABBC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 05:09:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43178.1747026567909820637
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 May 2025 22:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72272af644=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C4IQr5002512
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 05:09:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46hws89b11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 05:09:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 11 May 2025 22:09:25 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 11 May 2025 22:09:24 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH] icu: set ac_cv_path_install to ensure install tool reproducibility
Date: Mon, 12 May 2025 13:09:23 +0800
Message-ID: <20250512050923.2781932-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: FQnzEPc6MU2WsFCRbedx7f7E9vZBGMTb
X-Proofpoint-GUID: FQnzEPc6MU2WsFCRbedx7f7E9vZBGMTb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA1MiBTYWx0ZWRfX4cRqN5wqFDys IVtXAvw7zj5ZFZc7CS+IDnzpJluM/iwuDhFzqjtvViP4AbowgeYmHjZIx4t+vLf+Shy06cGTBQA oAckgUnAWz5oAEUNFlhqL3INkj6UcvNlQSTFzKanB71+aaMq1Ia6KM9bAO4poftTzji4d4hoUq+
 iJk4rmndanw30YbSF/Zz4O7+SO2UoUsQEIdy/Cu+juMxpjXVjmBZwiNYagrJ1NyUvpl7MI8D4/n OBhDfUatZG3Ol44ajinqG5OIyjWG89LT+AIBPWiUrM3yILwONdL73C6+Zm8mJeuo9aOx4hbay1Q 2NhKnVDfgFEna+2VcuMX/3XNqBG0M5Kp66J664jc7V3xLTufbh5QlHowXIb35DXapjNshump84g
 QI1U2vuzdkCAAhQDlVoWv33zaqbh0JdEz83M/pdC7BZlQSZgRUcG4Y6mT08AUh4uC1Lw5BNA
X-Authority-Analysis: v=2.4 cv=Q+HS452a c=1 sm=1 tr=0 ts=68218286 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=RcX5SHWiSEb9dfOIiUkA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=845 bulkscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505120052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 05:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216296

From: Changqing Li <changqing.li@windriver.com>

icu will check program install path during do_configure, eg:
checking for a BSD-compatible install... /path/to/install -c

And this path will be writen into pkgdata.inc:
INSTALL_CMD=$(INSTALL-L)

Decided by if install is installed into recipe-sysroot-native during
do_configure stage, the INSTALL_CMD could be
/build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr/bin/install
or /build/tmp/hosttools/install if the build is rerun after the sysroot was
extended.

set ac_cv_path_install to install under hosttools to make a deterministic
result of INSTALL_CMD, avoid vary caused by the execute sequence of
another task which DEPENDS on coreutils-native and independent with
do_configure

[RP: Removed paths from ac_cv_path_install to simplify and avoid QA error too]
(From OE-Core rev: 208143e060cda6e22ae1e8c618e033fa9144b323)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/icu/icu_76-1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/icu/icu_76-1.bb b/meta/recipes-support/icu/icu_76-1.bb
index f0890fc890..f11e72d356 100644
--- a/meta/recipes-support/icu/icu_76-1.bb
+++ b/meta/recipes-support/icu/icu_76-1.bb
@@ -20,9 +20,9 @@ inherit autotools pkgconfig github-releases
 # ICU needs the native build directory as an argument to its --with-cross-build option when
 # cross-compiling. Taken the situation that different builds may share a common sstate-cache
 # into consideration, the native build directory needs to be staged.
-EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
-EXTRA_OECONF:class-native = "--disable-icu-config"
-EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
+EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='install -c'"
+EXTRA_OECONF:class-native = "--disable-icu-config ac_cv_path_install='install -c'"
+EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='install -c'"
 
 EXTRA_OECONF:append:class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
 TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${@icu_install_folder(d)}\\""', '', d)}"
-- 
2.34.1


