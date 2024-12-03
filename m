Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5276E6C5F8
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 03:34:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11526.1733196880885394916
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 19:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2067c8c0a9=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B33Y49L011439;
	Mon, 2 Dec 2024 19:34:40 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7tk17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 02 Dec 2024 19:34:40 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 2 Dec 2024 19:34:39 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 2 Dec 2024 19:34:38 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <steve@sakoman.com>
Subject: [scarthgap][PATCH] rxvt-unicode.inc: disable the terminfo installation by setting TIC to :
Date: Tue, 3 Dec 2024 11:34:38 +0800
Message-ID: <20241203033438.2829241-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xu1RYsKXYGcdqyjnT5Emaej-9GYnITHz
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=674e7c50 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=6oxVCDFOKQT_d8kVvrwA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: xu1RYsKXYGcdqyjnT5Emaej-9GYnITHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=769 clxscore=1011 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412030028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 03:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208176

From: Changqing Li <changqing.li@windriver.com>

Without this change, TIC is the native tic in recipe-sysroot-native.
By default, native tic has set its default terminfo path to native path:
${datadir}/terminfo; $HOME/.terminfo

When sstate cache is used, the cached native tic's terminfo path could
be a path not exist on current host, then native tic will try to install
terminfo to HOME dir, cause host contamination.

Disable the terminfo installation by setting TIC to :

(From OE-Core rev: fe35ead2c3135a18c346e7baa31d34b15c3e2d95)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index 016614b19c7..aa6d9085384 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -28,7 +28,8 @@ EXTRA_OECONF = "--enable-xim \
 		--with-codesets=eu --enable-pointer-blank \
 		--enable-text-blink --enable-rxvt-scroll \
 		--enable-combining --disable-perl \
-		--with-x=${STAGING_DIR_HOST}${prefix}"
+		--with-x=${STAGING_DIR_HOST}${prefix} \
+		ac_cv_path_TIC=:"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[startup] = "--enable-startup-notification,--disable-startup-notification,startup-notification,"
-- 
2.25.1


