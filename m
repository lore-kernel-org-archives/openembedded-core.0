Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C32D12678
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 10:12:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14332.1730801536712359442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 02:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10397b6a8c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A547WgH010958
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Nov 2024 02:12:16 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nfc32n3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 02:12:16 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 02:12:15 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 02:12:15 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rxvt-unicode.inc: disable the terminfo installation by setting TIC to :
Date: Tue, 5 Nov 2024 18:12:14 +0800
Message-ID: <20241105101214.4095063-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=T7feTOKQ c=1 sm=1 tr=0 ts=6729ef80 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=6oxVCDFOKQT_d8kVvrwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: aC4TlyKeSQLILjYF_XlWgTk1E1Tn3_Ox
X-Proofpoint-ORIG-GUID: aC4TlyKeSQLILjYF_XlWgTk1E1Tn3_Ox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_03,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0
 spamscore=0 mlxlogscore=904 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411050077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206700

From: Changqing Li <changqing.li@windriver.com>

Without this change, TIC is the native tic in recipe-sysroot-native.
By default, native tic has set its default terminfo path to native path:
${datadir}/terminfo; $HOME/.terminfo

When sstate cache is used, the cached native tic's terminfo path could
be a path not exist on current host, then native tic will try to install
terminfo to HOME dir, cause host contamination.

This patch disable the terminfo installation by setting TIC to :, we
already set the terminfo to correct path in do_install

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index 5193eebb0b..ab20ee98d6 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -37,6 +37,7 @@ do_configure:prepend () {
 	if [ ! -e ${S}/acinclude.m4 ]; then
 		cp ${S}/aclocal.m4 ${S}/acinclude.m4
 	fi
+	sed -i -e 's#@TIC@#:#g' ${S}/doc/Makefile.in
 }
 
 do_compile:prepend () {
-- 
2.25.1


