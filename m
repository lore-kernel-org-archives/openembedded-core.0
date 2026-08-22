Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F74AC5DF9B
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 14:32:13 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7570.1787409121804302606
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 07:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=MT+5TH5j;
 spf=pass (domain: est.tech, ip: 40.107.130.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkA2tRMbGKTkX0iYKPpaCR/BmPPb9k7RBrOhm1AnWBdcY/lXVMT7bJzijXPROaBVJPrUFnIO5ziuN3Nr6kPa6Ak3YSiYpXx4J3RjQllXNx/4xJhJnaM0Bj3ELuhD6VVreL1/est/QOnjEECBTI+L2JTo3WhvEQWhv3MQ71IGNEtBbFsEIzMYEG9E06HOO3Gkw/UynOCIKMLvhSSPc/ZytkSpA4Igp5Y4G3Awig65Hnz9vxhJJKWPeig4F9nfy6LtP/JYu0rGSvJbx7rMxu/UBUxCpVLbc7YG1cHqYOJGAVRX2dGv6MzeM/50xcSNKigvSt2NuHNvpvT1RiGIFLLvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Onvm+2HAwGnVCooubyR2xkNHb2NYahWb0ZNHGt/iZuo=;
 b=jsD9o3gWGkV3R23ZhvknohaKyovhnmUOxkhanzw/FXy3puRhCUhXRzyRbJnvJ2nRcFYVv9eygVv0/9iV4nAbwz3Fj8ZyE4b4+HTBy14BFIlAkHIUI0JZkVmWjOP5p9mjBHsRNI8c5a8AP3fL/L2UW95gWrvq5Oax5cDjdbE5umwbZMboUs0mUet+AVf6+QC4JSRuMGHhSN6TjZ4130Js2q/Jl1VU/lJWktwOnyxY2OjzP6fDMIcgFun9uXWIJkTgPJuD+DHkJlyWQZFFpaosfax7q+EPb9dRqRnGxTx8oOmOIJuX6oy+RDSaUz47MGCh+MnKEQkcjBHeqO3iqW9UYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Onvm+2HAwGnVCooubyR2xkNHb2NYahWb0ZNHGt/iZuo=;
 b=MT+5TH5jNkCabYE3OKFkbcRnb1M+57i4kgHQ+Dkz4BrVD0iiRwmYvHtGbnog7UBbIbedNh3SZQtnQ+h8AZ4kJ3enAMkucPS1XQBQS+zzhDF+0UWobcupdMaF9Z5otrS5OW1r3+vktOgF1IJaL1Jt4SjQ17KNZoWxb7MnCmxiOQdTJj3pADUusk2cWVMkjKerz8GoZJSJegLt8hn6831V/03rE1den7+ptwtzxGHWyWe2TAoG7PPRFVxpCVl9KIKQxBzauJLLTFY0BdvLRhIS712kkpkaPw7A9UxTB3TXjIj0vDw7WN6GoR93kQkiQf7pQ3gNeIkZ1I9pTgVDFzrzgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0917.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:14b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.5; Sat, 22 Aug
 2026 14:32:00 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Sat, 22 Aug 2026
 14:32:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC v3 3/6] socat: fix build with OpenSSL 4.0
Date: Sat, 22 Aug 2026 16:31:52 +0200
Message-ID: <20260822143155.39273-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822143155.39273-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260822143155.39273-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0917:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f60ed1-9578-410e-eb84-08df005a20ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|23010399003|11063799006|10067099003|4143699003|12006099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Hxt+MMEAXrdm87rlaRAEkYH0zq4OYar8/rXdUg7/jXMDG3hvhAepWiWq4wf4jxFKcOAiiOALInMTbpeHaLOWRbyoPyw4sioLq0fmlnZnKpjzM+pkZa5hZYzelkUXhOdcDtGFsyaxgqU/rBrZFLqeEO2nY5PYtWkeo0UxXmi0josQP9kvHTURmIsCdvPjULe2aSjhhk6eE3nnTJTgZXLN0C5jjxCvWgDwbaQM7b6GcQgWMbFVKJR8IIfw4cyQpj2bQSz4ws9/0owNlYZ0ORhBJtEtFzOfEbfa1HKpEblIOjSuAgJj4uWK3e3TyL0SPAImaoxYlUK/ppiyJ+3RDfkNj506s+j0FenG3f9sgR5ORWU2dojUTF3dfFhNu7xva61a/w6KbsLnjDPXW0oHLSItt6Zlvu/zqsDJCJ2xDkWZxtBu+nQGU6mur46fwtVbvJeSy43opL+nzng1/v+cDVQ8Ko/RC0M/x6tD1EDVnwlTK9FbxRjfFPRFannO3G5G217MQcbbDu+GY3E+btZW2gLLggVcoUum+f/vrKLKofUoi7tpb211FdGGD/lsv27+sOm9z6xC/Ieru4kNjLukHctOA9YaejMrs8ct3SvHzrZIa7/uzDdKKJ6z++FwHeojxEl+NffG+ZJo73uQjSb6FTnT8B4WDHhaut+0+4LJvh5arNE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(12006099003)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XpGGHhpDATz5kIJzCZaorLPH4YVM/pLuGrKoBXVx/wMk6n2WGMx2t0QJUhUB?=
 =?us-ascii?Q?hMbTQXtIZQBY781wxqMnCwKRiXcZY3x1NcmmR2YmfVZ+kC4zuxN18i9Xzkl5?=
 =?us-ascii?Q?N4WI9UAfPixzwYhQNgEndDiZrgCpk/WL1/PjpN79yMPx+7m/TBvouAypvS6F?=
 =?us-ascii?Q?/B7GorQ+PZMft5MSt0CsFujm/VsRzb6f60jP8LCVFrknmX/PVKMJsLs5/r0I?=
 =?us-ascii?Q?PeqOJSZ2IU67BMCPWN0Ros1t+/jgRxfTg8eQzaDYaVK/5fkJwnriq/YC73uM?=
 =?us-ascii?Q?XVV+O+dkkWQJ/zlCLttjHGzE1MFwPxnK3v3uS4UyDyd4JfubmRWbscPhEZKA?=
 =?us-ascii?Q?bJaQT3VdpTz6pPC1r4kMPJihBPGUIEfsvSZRSpT5ZHWB8ZUE672hTUr81NFi?=
 =?us-ascii?Q?yvNRHgDp7vbiZT8WaE1AqoZ2aTQx5oKxyoXHYvBRO/pjbayfySJA7PIaVWKG?=
 =?us-ascii?Q?JCAKX2CLPBKhbgL8utvh4MVqx9YCBK3Pj9M0AIPzblH5UG+lRHAI8WHWgmwJ?=
 =?us-ascii?Q?vPSI8V66/quHic1dQ2QAzueY+J80GgC26d91A9IoIEMak2nXl0Qk0NSVLarb?=
 =?us-ascii?Q?A8FV2ftrzQ+WmLJS7VBaUA514Eb9GZ5v/FCU13rGa7DO+PirPXJtYN9S2JFQ?=
 =?us-ascii?Q?TWLETRlGxOXkIVaXMoPUEeR3jgDcovPzeRCLXWAe3hdCUIS+JA/p2hmCjdos?=
 =?us-ascii?Q?b9kKnr0O776lCudPvLVxq2+xu6ceDRFx+0bMDBHpRpCEn0Md99Zi9MLE76Y3?=
 =?us-ascii?Q?4QRiF1JUQy/NKWJtSFIIfNlI9z2seND8tnie0Uv+R6hMfJOXyGb2dCWkzUfv?=
 =?us-ascii?Q?HT4Trw9W2DIADeQ7X8JHix8pbqRsdEhBh6ZmSdYKUZHdxJMqjktf+kt+s5M4?=
 =?us-ascii?Q?/sQ0O8Nyyv5gyVIQhMdLoNqF7BfDmN3QjI7vmqj8KsHpfvvOUPyvGCSnR4Cu?=
 =?us-ascii?Q?fuwaHE8KaGUJ+lTibSxAORNUU5Ul1w8ZcDecpI4ynY/V5c5rJuOS94QSiaRm?=
 =?us-ascii?Q?AhaQRZiIzIjhdSYkJwqWgHibjhsBvgrscwdgFSFvWdO28iWj6ajf6b3gFfrd?=
 =?us-ascii?Q?EnNjvnIrJhki0D8cx/RKiAQ6zqe5zbv/4zKG5Kp3I7STdjJjyukGhG7GRkRm?=
 =?us-ascii?Q?rCuIF9GUtLxlBknaO9EcmAdGKHbGswOfFEdYbR2xyv5P8TFR4xapCP9a29Tr?=
 =?us-ascii?Q?xAQupQIt7fwfdRtXdP79A1DWLYwuYJPh5ku3ItPFXIyKKSTCd+nq4uyBgxnm?=
 =?us-ascii?Q?POilyKTx4rBNm4A3X7HnLoJ+iqWAhGziz7Ny5mwvbDKubUGzmcwPdS5f2B3y?=
 =?us-ascii?Q?rmG9Gzz5JOpu0/n1/qhS772PG/ui3H8shxnMwBYXvSGerjvrOmUD8Pzr2i2z?=
 =?us-ascii?Q?twAPES4u8kSuPmhh9+ikY0SqFWW9MoamEfc/RTsgjHPE3n48NcejvToXkcyM?=
 =?us-ascii?Q?Rg8Hx90zIqM9PJC6oFzneP9PZX8CT+4ayhT7/tMMMAo7qnAjsjCFo54M33g2?=
 =?us-ascii?Q?yTU5UffiLne7BbIx8LGbJLsqSyts1jNFAHXIEeFRcqBITXloPG/CoNe1q0YH?=
 =?us-ascii?Q?ENK5KuF8YsOFt7gk+A++JO6pLAM3bXGsmFLNy4Ne+IkVRNnaWrprdT68rj/D?=
 =?us-ascii?Q?QykHLxGi3c1/dary0ZLITwxVZsDBrrVuAKSAuWbT2xHbJeTh+Ks41edoJCWy?=
 =?us-ascii?Q?RL+jrXBfEuEEzZHOp75dP836OyRdOdaV2qP5SQ8MFTKzVM+mEQzuaEL9GuI9?=
 =?us-ascii?Q?ZiGSrxlY3GPltYC9Pt69yPPNU/bbnhtmxRsE8WNpxG4yLraEhYTKW5xawaUq?=
X-MS-Exchange-AntiSpam-MessageData-1: IgU59BKJ3PFKvwbqxBVSBWKcvYnn7JPt7EE=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f60ed1-9578-410e-eb84-08df005a20ca
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 14:32:00.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ub8dv7hWiohI4HsNXz4ufTJNLtnTXmHgrFeC+gTqStz66ROFhNYb9apXQO4pA0aKFNYhAiSfYG/gR6xd4WggbtobU3uUVJpJsmkZ9D5utlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0917
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 14:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243979

OpenSSL 4.0 made ASN1_STRING opaque. socat directly accesses
pName->d.iPAddress->data and pName->d.iPAddress->length which
is no longer allowed.

Use ASN1_STRING_get0_data() and ASN1_STRING_length() accessor
functions instead. These have been available since OpenSSL 1.1.0
so this is backward compatible.

Upstream-Status: Submitted [socat@dest-unreach.org]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 31 +++++++++++++++++++
 .../socat/socat_1.8.1.3.bb                    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/files/0001-Fix-build-wi=
th-OpenSSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/meta/recipes-connectivity/socat/files/0001-Fix-build-with-Open=
SSL-4.0-use-ASN1_STRING-accessors.patch b/meta/recipes-connectivity/socat/f=
iles/0001-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..5e021d66c5
--- /dev/null
+++ b/meta/recipes-connectivity/socat/files/0001-Fix-build-with-OpenSSL-4.0=
-use-ASN1_STRING-accessors.patch
@@ -0,0 +1,31 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 07:00:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream-Status: Submitted [socat@dest-unreach.org]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ xio-openssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/xio-openssl.c
++++ b/xio-openssl.c
+@@ -1898,8 +1898,8 @@
+ 		  case GEN_IPADD:
+ 		     {
+ 			/* binary address format */
+-			const unsigned char *data =3D pName->d.iPAddress->data;
+-			size_t len =3D pName->d.iPAddress->length;
++			const unsigned char *data =3D ASN1_STRING_get0_data(pName->d.iPAddress=
);
++			size_t len =3D ASN1_STRING_length(pName->d.iPAddress);
+ 			char aBuffer[INET6_ADDRSTRLEN]; 	/* canonical peername */
+ 			struct in6_addr ip6bin;
+=20
diff --git a/meta/recipes-connectivity/socat/socat_1.8.1.3.bb b/meta/recipe=
s-connectivity/socat/socat_1.8.1.3.bb
index e485c7d28d..025b478392 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
=20
 SRC_URI =3D "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz=
2 \
            file://0001-fix-compile-procan.c-failed.patch \
+           file://0001-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessor=
s.patch \
 "
=20
 SRC_URI[sha256sum] =3D "25bc6476292b2e614220989c77b0b6fca87bb2525d9747b31a=
6639b1fb602418"

