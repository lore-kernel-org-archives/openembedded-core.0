Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289EDC5DF8A
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 18:10:40 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.165.1787249429774855731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 11:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NkhVWfn9;
 spf=pass (domain: est.tech, ip: 40.107.159.25, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urh1y5pu9p52ayDpx+WZHqDKvSYMMLsE0pW0e5TXInshy3xEmqfIRbRDeSl5i82iLlRCnoFkusvU80SmyHo/cn3m7OyerjGt2iHdj5WGIQ/529gIe3eRA+a5O2be+ZBEupydMmxyzcaVjTlvRazLH7fXb6m8/QMyWb2oMxixG0Z7O5AlugG8t6M1OIlISDYblbKE8m5ZET3/E6rk4h71KM+20wIZSgASKLujVFwPVS/OO+K5TGrii51is81d/vELiA227CkU7p+oXt7acTcpCcl6xzH7uCoXJ1jJ6lZ9SjzVMGqtdGueAHfk6glZRckfq5hBoCWNk/TUvk9hpxMDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Onvm+2HAwGnVCooubyR2xkNHb2NYahWb0ZNHGt/iZuo=;
 b=Ln9428jnF+NI+dGUYAhNnuoj7/B3Wd851YFbJnmzjE+dRDv0kKpgrgqxTPHo5j2mqJnctLkbiYioMDO+DbUzMc6785h1YP669xWSWC1eZ90akY1Yo63lTmmQC53DO6Fmt2RHKuY4v7PK4F5uyW4deHsewldlBeKtMtRybDu10sU8e+i9i6Bh1Bae7uBkQmv9Tvaji4O8Qu4fK4bDWk8Dz4Ac3kr6cNWn+NCGoNjEO9Dk7TMS2/xEQ+0TlaYXtkK8KZxez5aPzGpB+sS+/VhEu1yEcfXMeWmfqPgGSafzdIZNjsbNytcJaUOOpGBs9paO1nChPDemIloe7G0VjvbngA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Onvm+2HAwGnVCooubyR2xkNHb2NYahWb0ZNHGt/iZuo=;
 b=NkhVWfn9wWJ3K4rthAaT0pS7V0MjtFNk+TG/8a5BzZbZaGGW5hM9R6FuIqFxhGbl7YWl5yBXOKHk44ebcVVHbK+0DMEr4pjb1C1O7ZKgvHzaOgnUdyPqLbdmGIhAzeUWo/S68Jup+5cCMpUfIpbdC/UE8gj7VGa7PZvOi8Vn8DdtrmrnQUefvRMOqtz92q2TP+z1Zu7FCX6ooRtE+LMroZ3e2gYvRspK86Y1MMa8vZO+dxt16Zp2kR5loc7qoJmAdZlUZQWVe71RVizaMD/pZRdGk2KQa9XVDosgvhWU6sulExjdg4PHqEyqxnE2jYoW1Uv36wj9joZGHLEWWZ262A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:263::18)
 by PA1P189MB2702.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:452::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 18:10:31 +0000
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96]) by GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96%4]) with mapi id 15.21.0360.003; Thu, 20 Aug 2026
 18:10:31 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v2 3/6] socat: fix build with OpenSSL 4.0
Date: Thu, 20 Aug 2026 20:10:19 +0200
Message-ID: <20260820181022.44434-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260820181022.44434-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260820181022.44434-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::8) To GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:263::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P189MB2954:EE_|PA1P189MB2702:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2415b9-10f2-494f-0840-08defee65243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|10067099003|56012099006|6133799003|12006099003|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	s0uDpbBdcJZd8iz1pD4t9OMZMIPYAggDOYBfycmmkO/NMkvl4XiTfA7DkS/9C1imeR+Vm7Ys2rJkPVlg//NtmJhlLo49LS0DMpAYKsgqLwuHCYtemxLvnwulbfNuOWVtQKgaTXusOibLF6ebBwVLMyCuwAStXwLNE2EAx1efBIqg4cWhFt3p0sPtNpWRpPeWCZbQfg9RyCFTueLj5113JYdzzEEVZNqoPPsWjwKlcKCWngARqMIZsxOjrtPliJOIgEwNolbMCQGnSJiekjGj+WbS/zmaM5ivddvzCkFQOil+u4qz+ny60byrY1yG7Yzi4sqSeYiN/m0RVRgtG8B6EbuhcCwcymQvKG11LSZehiky8r5HcVXCJD0dN/frqxL3jyFQnUE8sLuCXQtCdeib0qpblYibCm3dhVQ6/VTWawhvWbSWmAb0jFCkbnCOyqiZpXPNvhiEnNJOVsMYdsX+m6xqbjFi0CnaxWwxZxXurG9BLIlHeNVIqPuS7oqTnYWjUO8uowYn84uvf3vnQH+LlnUD5Pb/+iSVnnvovFM21ukNOz6EKlaGh8dIPwDJiJdqWUt55RAjTwC73k/VhzRr9Pr7nqSVsDRzMvEpGQhc1s3WYCCJsAJux7eHb0chVWP+3VR61Vm+3X2arMSGPTtyJzNGBh5ib3CEicjugl6f41g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2954.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(12006099003)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qrLplwprlvYErnSuVUjFVF/OqPFV/ye6icRHqoS83ZpdVi5hI2Ndj8iab1GZ?=
 =?us-ascii?Q?mLcs5XHWs/NWmfgSLLCpj0MnMPq/nQb+ybML03sn5CTJA+V3o1n4A3y4Uakf?=
 =?us-ascii?Q?rBBw1vJIV4W21iwzrkJc6H7vXkp1R3oyF3qlO+9/b0Kbou4eCMh0haE3Apup?=
 =?us-ascii?Q?/QKOwjwifbIXJ1N3LaHhH/RWUfSOVgRk+ZJX0aUFXVxv63X1HxnLysQ742vB?=
 =?us-ascii?Q?MgUlSBYWylGwlgW5PToRTUrsbLRv8oONhF33e9LjRX6TW7WJgCXJKpFu8Tl1?=
 =?us-ascii?Q?+LdnALp+dQdf0Xbe0b+srSdmurMkt3l38uU/zB5ALN2Fo8vZ6oBexeHBNhgX?=
 =?us-ascii?Q?QY7A1pmC6aonYNRzAcmDZcrTodS6D+PmNwPsTsFpoEWc1IEjL1HVoonQwvKX?=
 =?us-ascii?Q?dR7soD/IZabavGOHWrUVeFYUDOL8faj9pNjZKZporuuYmpwWq/A3yzn7T5gm?=
 =?us-ascii?Q?PWO7GsMHo0fQk54vk4T5YFEHMrXhWIV59UNRceVYgkB5zeqlC/Gy8+S8E6bl?=
 =?us-ascii?Q?UVvC1W6sPJQeszPY+9YTg6WtHxefAjbQ+w1c6xvzKBtlXm47+D7Wqef8+LE6?=
 =?us-ascii?Q?jR/gQRH/7/sYcsIxSxRpRCibwHjD1zKGmC+ZffPY7dJqSAQC/hyFDhStJueq?=
 =?us-ascii?Q?LCv6AlpTFtoIk4Lqn3XwG5hTDPjVxsbkyhwge892Wn89GNwwEwJohgn48fbV?=
 =?us-ascii?Q?oYLP/oIfaGwKYD+Qb62dvL3tvSKXHE8O6PLjJghAFtuPRj+qZJnZSfIi/IvE?=
 =?us-ascii?Q?8p/cY4Mrup6jkWDOhyF/955XpySFW6N8/9eZ2lQK6EjGi9IJDUxvA78fFOCh?=
 =?us-ascii?Q?KmK+LGoJ46+jgUCVapLWlR5Y911Ja+mXQbJk5qocD4zVd6vixM1ejxxFQjs2?=
 =?us-ascii?Q?XA/KahAfcFc3+hjD/SMjidhGRNDaZvfKRZ3/cuda1F2mhAOx9CXicflvRMrT?=
 =?us-ascii?Q?JZc4p4b4ORQMpWRTdNcCVpHRRdvxM6Z+tlRhFlrhanOVWsPI/FBE3j4Tc27x?=
 =?us-ascii?Q?sJkbcHu5JXhjkQQFF5D0uDerlkC7Wfl4VMPTs0U1hNkh1AVwOrBv+AnX3Xif?=
 =?us-ascii?Q?srY2kJFlouA9FK4I2hGzbcpa/KeLfVa56CERaGCcdSNFIX/Z4UYTeklXC0Qs?=
 =?us-ascii?Q?in7ssDSee9AOyEeCjBLuaCumkF/CK269C8R59Rok5eoTDc6JnQIKGVBmGpUm?=
 =?us-ascii?Q?IUbjNNPFMBqEXUsb4TiaW7cCUFevart6Q8kCuvnOaOKypGmy38XuXZYZMYAe?=
 =?us-ascii?Q?2m0I0m0RG6b4+FtTlFymwpg3wG3zXhxNVcrNgGcmOOH5SmPyxw3OoxuLy3QF?=
 =?us-ascii?Q?DcY3d4tb90EK7YFXNrf1sirLqEhPyHNjPH/8Apm3SwMD7/LTWsoCi1y6O00L?=
 =?us-ascii?Q?gMvvl89PiUzvRzsRDVZZpG4Ze7NS72ssbFduJAKwUgerARv9GjQtLSjAODpa?=
 =?us-ascii?Q?w4ljH4MmoIOT7W7ntPQ9EWxf3yFYDHfngb9handPiO81ealqG9Yf8q8yVQGE?=
 =?us-ascii?Q?ceezuK/EBZjhtiDzYElfKnLHnYdn0oR1x/A2ouNuTpPQisO5nieGl5ykeuFw?=
 =?us-ascii?Q?PDqKV1AgeW+xYq5/1LcWq/k0V6mFmeoY4Wn1ANEbPoNyy42HxkN/huIRnaat?=
 =?us-ascii?Q?4mRWaCK14NI/8IXBDfNbJb9iph3fI9+Lr8mg3IcsPL52PsKBf9rFoWiQFB5f?=
 =?us-ascii?Q?k463mDFscYgEG3YyZYxim+hy/ebKkG0+UBWyn+xjQgdT/rZsjOZmsl+HOgIa?=
 =?us-ascii?Q?+eym40JwHP0AZrl6Fue9km0qf9fbQqoNndXKwmAdDelYm54nsKWhvfX+u5ak?=
X-MS-Exchange-AntiSpam-MessageData-1: 1+7Bmz1AFPpe5gXclxqtK27lz+xPD8Ig3sc=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2415b9-10f2-494f-0840-08defee65243
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 18:10:31.0473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5VWHVDgYsxPa3kiu6wXZp+XrTWkjbtpyr3FW82RImEo5kqEJziiYvrSa8egxAuBZKRwH6LFDO7r3Va9pDUczsWDcMHPs6hDl3YPsqNbbQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 18:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243877

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

