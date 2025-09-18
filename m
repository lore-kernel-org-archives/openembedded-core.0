Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BAECA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 23:43:42 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.21])
 by mx.groups.io with SMTP id smtpd.web11.3385.1758239013895920907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 16:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Ue6Jtod/;
 spf=pass (domain: axis.com, ip: 52.101.65.21, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4N7iAd4vU4piXBRssOKA2nDxmYna55vt2Z2pD8pLvgqo1oVEccH70uTQBgf+VshnzHrsFbXAX0hs1sGpRnEZfDURd3AMM49JjBsnTnAkUiknJWrTIzehdUCcEnCq6oziK1ZS98uIOKcoPpTkXbLM8IufM/l3n+1zEfc5CggNqGxlf3lX+fMWSH64PkH4ExHmdax2FAU01IIwOjaDziE6bjuS4kaOKGjVhFihn/spUBJYUW9MdAhxAFLMgtw6GZHOPtXm0Tiw74yoCp9s/GNSpLVf5Wku45GQe+MZIURjBsIpoHQ3hlSuWQdzZhuz28UpQZQplq49Nj/PJSguq+MrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZgl70xIKCJfeKh87P56Fx/PotsPFMgEhl+t7a+kXSA=;
 b=CdANBTAPbJd43TDjOXZQZRDiD1rMbjMVCkHQq4eBxDu6Czve6/0VGN7Su1Or33UgBtJe+DIInOVcECndYYHhhjOPMhCzkvbFCAbm8+nYtH0/BJs4U8rh9iFGraOpjFFVByfOVRurFFxemalaH2ojWs3KddapjeXPXhCJax48cm8GP0ZidJ/QRhYU+lC0bWg2w+7Q+YPnnhkUuY0o53OHuHm2IM7A5LI9s+zlXX5U9aeAUj7/vtfINoEAOGxdCROsULJox35+Tl55kEXMGE4N9kBSYmMankzhBtvhpzPQbjFVzfpomWRqmvFRzpYNnF8klyskaccXxk1e5edQheSkew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZgl70xIKCJfeKh87P56Fx/PotsPFMgEhl+t7a+kXSA=;
 b=Ue6Jtod/XJqAK0FVEMBYzIPd7oJZFrLVLk0OWD6zn3lQ5aeNg6I/bVmkmHNso/XEkownpjw8ivQsCvJWZGLcy5npI0wxzxNqbgnci80dYT86O0Vl59kZEJkEtT/txDmryptr7qh6xkWBsWKe6uvtKXli2meieHucc2MB0VWI/f8=
Received: from AS4P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::19)
 by AM9PR02MB7330.eurprd02.prod.outlook.com (2603:10a6:20b:3ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Thu, 18 Sep
 2025 23:43:27 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::63) by AS4P190CA0015.outlook.office365.com
 (2603:10a6:20b:5de::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 23:43:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 23:43:27 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Fri, 19 Sep
 2025 01:43:27 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 19 Sep 2025 01:43:27 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 0F350260A
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 01:43:27 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 6383212040A; Fri, 19 Sep 2025 01:43:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] cmake: Backport a patch to build with curl 8.16.0
Date: Fri, 19 Sep 2025 01:43:20 +0200
Message-ID: <20250918234321.3590122-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004A:EE_|AM9PR02MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 377e570c-d5b6-4428-2501-08ddf70d2a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0d8Tg8COgQCZHd5KLlfQ1khtS1rFrvFlRjlb6iy32sbsYM8dAtiHU54MWU6K?=
 =?us-ascii?Q?YZCR2RZBKtTZi/JQ6srxRYzdLUtnM74TUkhutEYcvHmMYOQaOgqW22uYYLJ+?=
 =?us-ascii?Q?1eGYffBALjJthKV4mKcumwJlLnvhS4LCjFiid4n3kTrY71yNE0mBVIh5zM43?=
 =?us-ascii?Q?2J1ZvSQmXZkksMvV2yo7qet7Qi9Qy/speJ0FCkPStRbLUCFCI4T+PB5J8YUj?=
 =?us-ascii?Q?vatQ+LZhKCmnkpWV4hQWkNAEeAi+oQfNhTBTxTELmm1YR4bRfFM6HAeq2V9U?=
 =?us-ascii?Q?r1LBlw7EZEcYAYzFQM3yKZn63X4cADu5FKGzFeTN+FyLjTM2JzLhP/YLH+KF?=
 =?us-ascii?Q?p1YAGQ0EnxhyXr1juAYBu8uFHuxaQCgAk2WNk0mH2HFY4WijlGvBcS9R3j3y?=
 =?us-ascii?Q?L8vZCvaS1pYA/hUWcYI1+GU2oH0KSjw/wF6IVusFti4dgZmy0aC94276byoj?=
 =?us-ascii?Q?+uNuUEbHxITu+KFJstErmAvXpLidM9M2WETDV97TXPfDWc5Lsy4RvGwcZrx6?=
 =?us-ascii?Q?BWQw3B+63w2boTHLZ5xe/38pozUy/34Ar7e8mAh76yB945CaS2lTsbnBWMLM?=
 =?us-ascii?Q?Hsg2LTnMBEjEKBRlcYNHrBy83C9GiiYu/sYhachR+KV/+TgzF1qUgmud4S2/?=
 =?us-ascii?Q?XE36UtGP7/xD/As9dhfJDQz/lm8Ztxpyrs1m4VzlPlvdNSJ4oRjUR4bWh5qG?=
 =?us-ascii?Q?VcZ3wikTHIKlekJ7wdKV/W9OpRE7yEbkahaE8R2F8YGyzguDQBm/hN1vG83p?=
 =?us-ascii?Q?6FnhmnKaNnlrXpKGBi7j0YML7bcO+onADaP/2s4p46UOvaIVSSatyxi+fh1f?=
 =?us-ascii?Q?T1J2PpJWOctwhfpNVCVFDdLDhr9Br0wDeLG40BBRknGAqx6XIw8BfJPGGDYB?=
 =?us-ascii?Q?EV0cVh50a57MgkZoEt1k1A0Dv2goUS7UZ3rvPuJanogIATpIlyj1L1BZjx7s?=
 =?us-ascii?Q?sDhWnyWTHvqdPlOUHKmd/nwXu6YHu+WmMsKTdH2/6itP11Kk+gkU6fVXrbSC?=
 =?us-ascii?Q?VU7YWM6EuZ+Qo4R6EfTqpiosjZn9EsnbV/U6123bSwiHq8EjYsZuXbBn64/U?=
 =?us-ascii?Q?9LtIMAJExCzAMfgnkOO0nL8Kt6RbDefrYa/MBpN6rUocCTy5vnfPlj2YlCRO?=
 =?us-ascii?Q?jeWrxKO96nBVekmQAQ8zyICnk2wTwUHmxk8QkteJwZvcsCkU2wMUrEiqJwUz?=
 =?us-ascii?Q?WwQAMWjtfpJMxJBBXRqoU0F0begY8G8zGU3hwCDfHTWIS6f9wCV/jKsDp10w?=
 =?us-ascii?Q?unGXn7UeOM9WfElWkVut0sue9y+X/QyhhuQ6vi6Zn+2PiaV+TEvDuS+NpP9L?=
 =?us-ascii?Q?N4DZzWYF/smH1+nQCT7+VbUm9gEss8grxm36WH4RQxQO0WwREL8QUIh5h49i?=
 =?us-ascii?Q?aurIb8F2MwnUzdNzHr1ZEsus+VQUqyCpHphz+U6Cubi9cETyYauS1e8wJD0z?=
 =?us-ascii?Q?BBfaWlcnHgqJt/0vmAhKFCPGR0zDO4iwgLsEio/zJlvXwAaUiniOMw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 23:43:27.3973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 377e570c-d5b6-4428-2501-08ddf70d2a65
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7330
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 23:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223714

Needed to build cmake and nativesdk-cmake (cmake-native is built without
curl support).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

The patch is in 4.0.4, but not in any 4.1.x release (yet). :P

 meta/recipes-devtools/cmake/cmake.inc         |  1 +
 ...d-using-undocumented-type-for-CURLOP.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoi=
d-using-undocumented-type-for-CURLOP.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/=
cmake/cmake.inc
index cbeeb31520..b2d3d60ef9 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D0cafc0f3b6=
b28f3d5ecb5d1a68c36471 \
 CMAKE_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
=20
 SRC_URI =3D "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.t=
ar.gz \
+           file://0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLO=
P.patch \
            "
=20
 SRC_URI[sha256sum] =3D "81ee8170028865581a8e10eaf055afb620fa4baa0beb638724=
1241a975033508"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using=
-undocumented-type-for-CURLOP.patch b/meta/recipes-devtools/cmake/cmake/000=
1-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
new file mode 100644
index 0000000000..d04d0be795
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocu=
mented-type-for-CURLOP.patch
@@ -0,0 +1,35 @@
+From c8143074cf3954b1e169904eb9d843cfbe14acc3 Mon Sep 17 00:00:00 2001
+From: Brad King <brad.king@kitware.com>
+Date: Tue, 2 Sep 2025 11:41:10 -0400
+Subject: [PATCH] cmCTestCurl: Avoid using undocumented type for
+ CURLOPT_PROXYTYPE values
+
+Since upstream curl commit `1a12663d06` (CURLOPT: bump `CURLPROXY_*`
+enums to `long`, drop casts, 2025-07-28), the `CURLPROXY_*` constants
+are integer literals instead of `enum curl_proxytype`.  It turns out
+that `curl_easy_setopt` has always expected a `long` anyway, and that
+`curl_proxytype` is not documented for public use.
+
+Fixes: #27178
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+Upstream-Status: Backport [https://gitlab.kitware.com/cmake/cmake/-/commit=
/c8143074cf3954b1e169904eb9d843cfbe14acc3]
+---
+ Source/CTest/cmCTestCurl.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/CTest/cmCTestCurl.h b/Source/CTest/cmCTestCurl.h
+index 7836f4b9c7..9113890b5a 100644
+--- a/Source/CTest/cmCTestCurl.h
++++ b/Source/CTest/cmCTestCurl.h
+@@ -52,7 +52,7 @@ private:
+   std::vector<std::string> HttpHeaders;
+   std::string HTTPProxyAuth;
+   std::string HTTPProxy;
+-  curl_proxytype HTTPProxyType;
++  long HTTPProxyType;
+   bool UseHttp10 =3D false;
+   bool Quiet =3D false;
+   int TimeOutSeconds =3D 0;
+--=20
+2.43.0
+

