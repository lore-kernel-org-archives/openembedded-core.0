Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E3DC5DF9D
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 17:52:19 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1192.1787421126431531265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 10:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=s6uYyR6u;
 spf=pass (domain: est.tech, ip: 52.101.84.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBNYjpqHHmcV3jqylVRNPmDMaGsWYUZNyEiS6wJD/AES/sNgJMTPjzzsZ8QMxjTa5IDbG7p/BeLjbwR7VK2pRBGLfjfSmWSqZcSoJooK93w/lzsHOtjZOQb5rEq2Q/KFkX4A48Uzj6WbXV4LlCgXl5VPa1W2QDopHx9vdeHh0K104b3lM1aLvByyqeafXX5IsaRaU3J295pQ7hbOGlSPK0oDBz/qrZL9EneYoqrzlTHwEVnaiuno2iHFpl1NcAUmaiq8ueL1e6opEe2wM3+5WySyPyOL54flWxQXRTojlHbROv5S3q+W8sKCsbzdGXz+iPW4ek4jMCy3dYjXUyf4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Onvm+2HAwGnVCooubyR2xkNHb2NYahWb0ZNHGt/iZuo=;
 b=IhJIxIV+c3+r4OiXFvbX9llpI4inLJwGI7ZhcJcF5tRrYc/aA/OHQa31qcfl4cHAEoFbNuSancDHosswCJpWfF4+pjrbqI83EsuL8KRr94+zp0SKs8GdQv5wzSdL4knmxoNRPwfL6aCZL9rv/nwjMxK/slhKnyii6d5DyF2GhEheyaJ9WmAau+RK7I50oK6GrKfAA0GYsBjsZoncRtg1rSfeX4oQu4C5L/ebqj4xLytca/OCETYO95jPE4SEuq43Ip6t4hagN9w8UWSyWdRetlXxbNl6X6703AIjPf9e7rYU6buYlknhcDK4ECmbngXJRPGsHhyga+CZX6Unre1uDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Onvm+2HAwGnVCooubyR2xkNHb2NYahWb0ZNHGt/iZuo=;
 b=s6uYyR6uHdFhSKl49cSE//5hiWvxK6yVjzYfOHYN+KKFNcOZG1q3HdcK9HkIOBtsz8eh4V3NCK4xLwBvCGcYyb/Da8D86ldBi3VF0QIXD692sFx6kgQpc43ZA4C6qLPgp3wQm8FruiyHvVK4PX0zhcr+hdDEZRS1ZCrIdqAO1nKhtqoP3aV99iWRJadgn8JJxYzKjPAkLqjqmBgv4ZGyhI/vZkeWyatBgGoHyeGh8xtCXyHLftdY/fEHr7knaaqKQhWH/itYK1yNRPoOGRUyerrLHY0pWepAB5e+ZrdsIAvOzzuQcoYL/oPyCleJYFdZ32acHGA1xOoKZgpYKD1m2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM0P189MB0641.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.5; Sat, 22 Aug
 2026 17:52:05 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Sat, 22 Aug 2026
 17:52:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v4 3/6] socat: fix build with OpenSSL 4.0
Date: Sat, 22 Aug 2026 19:51:57 +0200
Message-ID: <20260822175200.57534-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822175200.57534-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260822175200.57534-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::7) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM0P189MB0641:EE_
X-MS-Office365-Filtering-Correlation-Id: 84456ad7-4864-49ba-63e1-08df007613fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|376014|366016|6133799003|56012099006|10067099003|11063799006|4143699003|12006099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	wu0Gox4+jEGqBLETkinPd0ljIEY0Y9MtBj4h+SiK2hr0Sy5b4DQUNGrBBtsG44QffA5AMCoSnavenDQ1pHtL1nrYbe0LZdBCfcuhcJl8nJS+hrZgmJBXpY1xmjGiBtocipg1p1c6OmLcCXSvzVa9a26rM7QwA0lx/Z66cARP5j+rdSoVEATOIAlFOkWbLMdY69Y69cB5A6Rs3UJ+8m+8Sq1LzEjPWPliyT5sG+wRvyyon/rIX2X0Bwikhl9pK0vV54qb28T63AB6IeVG7fAgykIgGrl4gM7w0iMCRDrzzZy37GA2fzmxqp0O3UwFQvtvtE/gH/fXtILGtf8yKK2zttepm1dvS9cOsljRztvWcPEMH/xmliIMWFcNQ9Az0kWQ+nsYQJDqTo0TDjY/Lj0gd/CcGI/tebeztPf/VuFM5lQDpoQaxMsn9P2OmGy6tb8UAnwx57RkahQriLXvgpaRu4nqqrESpwF//LSN+UbkPSNBGsuCmZHe81k79cNvElCagm4xT6AGbrhhtImzeg3cSsYCjYcF8zMZzuqqbYrVL78ZTDGzwxbiYBm3wEQ6JARi6jxrzrYGpP0xkppR8hx6DLtqrqQfA4jDaZxbvNfmyxKJY+f7kwm6BF+i06aZ1OJifunF6WMEYAJp1GckwfJNz6yzS1meiO6+yWZ8mEoLe5M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(12006099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1B/1Z68p4ZJoEChjO/3dzAYZvPTGRpj+syx1c8n9MyEVgZbQ88B38tWhjEUW?=
 =?us-ascii?Q?CxEHsxy5tr9ZP6JyBd/VX7+QMS9y31eJAF7qzMSNTXtZVo70OdMXG2avWQuj?=
 =?us-ascii?Q?hj/28raaSmHe7KNccqVvUGpkPFj3YOyCcWNHGLNM40eTkYyNGE3SRw0/KjyW?=
 =?us-ascii?Q?Mchyum8PYoA0K5yPFRhiOZpMSEt2dOP4X4vqBa4n7BLTNk/98sYZI1RYXC85?=
 =?us-ascii?Q?RKLyItOU8bCSyCwlo6tnimYZYlnFxDp6KGYsYMS72YyaTARjBpxFb3fssFv/?=
 =?us-ascii?Q?Ir3nGIMbtkkI1KdBTKhIWP8X5y1aouuUanqo+ViSbUX6ZeenH9rVkBtNyRFh?=
 =?us-ascii?Q?+woVMlcWvK3F+m/joB8fvS/Sab/WcDpAxMEkHrCUZAGvXwTm2SICgZvfChQo?=
 =?us-ascii?Q?ciWT3ZkEyHvz5PcqrxR5vUr+vamIqv7SHyRUp36Wm5yLwd8z25a7ShdjYgNi?=
 =?us-ascii?Q?iZmN2jBcjnBZ8zmRwIYAmDVgacgQZXZVowIFTpdIDFvAEGovUC1EFxYDE+Po?=
 =?us-ascii?Q?kWcCwZXfAbqjSmyyQF0S5ZjfAXuL8OT+37CZMX5OzpV1Blipt3ksFtQFhM0w?=
 =?us-ascii?Q?7KDBZkraMUHfYXbNC7bgRw4jo+w9J7j5oRhITvlNbvQzgU6edKMI5Akoj6MN?=
 =?us-ascii?Q?YC180ZIy6qTLlfC2/2RAiKKIDSIMwNUUynwE41wpF29JgbvN1z0oELH3IJyk?=
 =?us-ascii?Q?04tc2zgUT/kjMQBIoTCRlCcksf7dQwX7AKarFY+N/WjVuojiDCgBTYAQt2xF?=
 =?us-ascii?Q?JaXdpLcDLHMujChToLOfE326RLGzFlYiDwbN28Qunwr6Lg4rjLW2OfEsIcz9?=
 =?us-ascii?Q?2NMo1LBySy7bpZ5Jj3tGWxYztvqrvwEYcbWegXI4pAunuzztqg0b4U65S6C7?=
 =?us-ascii?Q?VwGB1rpTAQ0mI1JZZkdwZTY9X/bUIwXW/VXcpMYhwsfMXFGu8ZnU3Vj/J9y9?=
 =?us-ascii?Q?QdkW0PtPPXEiT7/qfdPxTX2Y6tZrumggpULPkXmhZUtbjmRnFzncBp/+L28d?=
 =?us-ascii?Q?UmAmlE5GLbP8WlpqLg6sBh25/517T6CILJVge9uOS+rpKGTGkNO7WO9+3ozJ?=
 =?us-ascii?Q?ZPxKTrugjRQyumPCn0mddPiUlKq9ueBpwSfB3NjdUlIl8wkWpGf0LLUNniT3?=
 =?us-ascii?Q?OWgp1X7litfldsrIE4Ei8qcDicX1u638q2P2c1Cuul13r0G8uqQ85CvHFPPg?=
 =?us-ascii?Q?FlJK8c/IpjQTr95d5wGagVf7fo8nQ/tShpqiyQmZiivgvqTWWQ0YZaP2rqdv?=
 =?us-ascii?Q?0dWWVR82MxQqIZf43DN3VwxIpeuL1bni17pZCV33UHGH6J5aa9ydeoJtOObR?=
 =?us-ascii?Q?H0sg1CvLGxVHtQxayxyMD9XKIreE24VpjfKNvSgrfMqy6/FxrehsZ8TYSFsS?=
 =?us-ascii?Q?KjzbRfsd94HPgUpZVGyCoBwqSTSu8ynQEicshfT2SR3DPs3E5JtQddqJ6TDj?=
 =?us-ascii?Q?pBH5MlEAipFFA+rbEwg39qXPZrhEZiVkHTrQ4SD47aNgzxshYXUg1F6fgNqj?=
 =?us-ascii?Q?j6gd+powKJdPFMe99wrCVbNrDAd12dcaegOVRcuU8FTSyHNFaQ0z0v9z6jlh?=
 =?us-ascii?Q?X5u22z23CyVRR5+uYlydz8sd30UpnWfli35FQVxBIE5tptPsfGB0YJ0m1huM?=
 =?us-ascii?Q?tGEmE+AH4rCso2vKcmWX6KLWUk2cMWaVkEVF2GMa+6GvlE+AsG9MpOCm589E?=
 =?us-ascii?Q?xdkeddXmntqfo7Q5JutSsqEmjOp1ve6vPbfwGllLjO+WnFIu7qEtMVsClSlK?=
 =?us-ascii?Q?IJz1j/Y6G0ceVAzNw7OXGlU0Og+h+GX2zj8IUlTdvRVRylDfgWd8rC5Akvkp?=
X-MS-Exchange-AntiSpam-MessageData-1: iH++bCY9O9pmLffRN7x+du3qSsZTlNe9nzA=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 84456ad7-4864-49ba-63e1-08df007613fd
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 17:52:05.2544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCEeJM2BCFaOYgEaz/CJDfiefUsFx51f+G74ajsgkpFtyF1pVzlZyZdTnzP0DY0Rb2nPTjCsb52wLeX3XthlLrBmnN/pJfmdoCcPnnp8zzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 17:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243995

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

