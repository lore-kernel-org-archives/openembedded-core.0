Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE70CC982C1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:50:09 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34373.1789631408118648815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mI5y8/+M;
 spf=pass (domain: est.tech, ip: 52.101.83.65, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pyi23GSmeQW7c/jxGdBWRX7IzN1P8gNaw7vI8SX9Fb2hXdq1vIlWI5t9rUOfUyv48mYePdaEqWR7QhP4SbYLuuHM2oOyOpQCin5l/J8n26M+kob1YMk4BKCt+UQud1H6LYMSs4iQErTSwGPAlrFn6lttsenyS7muRo7gWfD9zF9O54GN6ZOMhTtpKpBJCncB0CLjkA80yHW8hzSglPS2WWsxlQt2Otqg3TK8PAvvyHF44ttOpHFAMiykWu0FbLTWdhWtNS5OvqIpYkCDT6Y0Fgpu+CffxROih8E1SL6z6ibLChIH/TGtJ5GwDb3XGSm4cPs4/2rzh8lsGG1jiNFwVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvzelJGXGkYd3wAqw0pwwlxWGHmjTDPWz3kBCPbpEc0=;
 b=R8fKOsO7YNI1Oe6ehp07fLZHwhnhswnf5+AiE5PyXctHtZqxHtX645EP1iopGMSLwbvCG3cioEpBCC5Tj+3RP7IKX1DTEpbL431Q9NE1fU20XmdvxfwKv4ma/pwkD6m2A+AHb8p1H/6Ncd6HlLB3pmdm8qvlimtKPNbsUF4unkCkTPqF66nlKDXI6EVuY3X6QY/Bh35sZWetiLDyqBi0CJNdH6bg6b7m7rMiZKacj5dRHirM0J47AZ2b1NeSIzt5c99b0pysIADdtYlRWTHRGDtP1y5Y5CXIMaBckSxVE15+5pgATFQCtI3etPNDkXuWnwNUKvtES3jzbp+LjB6lKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvzelJGXGkYd3wAqw0pwwlxWGHmjTDPWz3kBCPbpEc0=;
 b=mI5y8/+MNtLjZJK0DCoPhJNEEUNPerDkNZXCb6ejYUNnRNvVf9ymVOgPLVgxP6yPmpFw0iUomHAiUaVUZTFbLEwHzwyfWgBsvnvmNBCd2aooCVUbJYm44nS3aTdl0RBc2v5K52EZU4Ujd7VsFGxe+8a/dS+U2oYtHlb6bziHAEazg+x+NI9JXIjCbc1Mx0ZMUq33JxlyPAq23UUD8MrO59olJQ9RrXRRhWx0d4S78o1CaOrp4MdzCWJq1cwKby3acYATSiae//CRchFUX/rfb8CPEFsU1Q8mTKG7tSS/QE3oeR15jpkR2NCtO5Zi3wYt9tkM8aCvI1wN4L+w3eo06Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI1P189MB2599.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:1cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 07:50:00 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 07:49:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gnomebase: fix gnome_verdir for four-component versions
Date: Thu, 17 Sep 2026 09:49:55 +0200
Message-ID: <20260917074956.22252-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
References: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0405.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI1P189MB2599:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7fed3e-d42b-420a-a26a-08df14904648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	TLVgT4YAFos9Wy1kLTBsC9x33lYY+tT4UrFigTF46761mk+ls9eHapcpnJIIeSBDMFJkCMi1xTtKKYVP5rp8AS/V43D2SfrcgZbCXMja6M2mQ4lnByOo6whA51aeBkqn75/FDOq0DykntRMEjqu+hP94EsNTLcbK9FCqN9DM64GN/jyEMuO/qW+2DGV6SLfFRumv/g8KOfgVU9r9zb0nx1KskfBCelIsndJrQV/lZHaKbtiXYobQizNTlsrgFIuy/FECRimsDsw9gnu3JNDHs2/S4XkUvjwr/jg5Ec10rXq+5IkejsSqkv35ZrExTk8JV2+zfksz3gU76fqFtiXNt7SuG2W8IwDN/1JOyr7vjX9zqSbuVu6S5AZKaDey8whKjrNaYLZKJLm1JstouJuSMDRxlnxwNga0v91PNildN3o8ATIG5M4rkJdqbz/tlyGemkfwuJVLXwq1Ac/uoQtjNJoqyNJrpGlgVKhY2oKfjjXgGX+63aDSbziCQZ9SIaKHL84rhWmu3l57nI6FOXKIQtbZBpi54EdS750qPo5FwgDAGIfQmSHvnP2jJAmk8/P0wG652gLR2etP+s9fJ4X2d6nqCM4lHNkhXzWjCL+OdzjNOmXHQubBnIkWXmEvScxnInO7v4kLmyr8ce33EVXZTz9udUVoVamrI+IsX4McH2A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AcFtYHkofmbL3OExb1bgrrv7lYe/6yZk9X+G/JxhOROcluTnfxA5F2BkKxTA?=
 =?us-ascii?Q?z66BR3RzndFsbviix2SmGRonrA3CM6HzL5IHgQl5C8rruyk8aq/f2rlMadtV?=
 =?us-ascii?Q?2w0w9NpiO3SLHWDfqRm3XL50/HnA4m0Qa3jhtxnGi4HQmo9GVlQTZvF3EGLQ?=
 =?us-ascii?Q?bayn7WgzsXRN25MPUUww3yOjA3djUlWCHA+7Vy6gzvySAt1okwpAmYVFzisd?=
 =?us-ascii?Q?7hb/7nOhBLoK4VT89+HPFtep9rshY2UvRsHpfUurzRDd+K4ogRmJ3UT5OnKl?=
 =?us-ascii?Q?cW4FLeFMpMtmfoTegGJFANCZ4EYlElxekYZV8L4F9R4BGLZe7QUjqLp6pnJY?=
 =?us-ascii?Q?HOLgSmYsqA7By63AXMDK3bep5VoKvKtr9/aL5bb9t8SBY7moMUHtdKP6rPLs?=
 =?us-ascii?Q?YDpC48c+/wnDbiIUeH2S1FU8he3XHYHqyqbm0RsbFA1/y7trTbv3+fNGqS1T?=
 =?us-ascii?Q?/wN+JICmDd2n+8WNxC+1lLceehsnu8h15Hr7Ssq9rUNRK1m03+zg2KLWF/Z2?=
 =?us-ascii?Q?S1xhrNIzmo2nWNnGQ8J9Tnq/x1ji+SOIDfXkwNNjz3NVS1WchvW2Ep9dpAyb?=
 =?us-ascii?Q?JqGdL59gJMk2j8mNZSWh+dZ4HvKDwvzGjnEUTsEP/FI7YJqOQodE8VS5Db+0?=
 =?us-ascii?Q?u6G6AtwPF4fi39EJ8tnB52nveAII4G6hGmJLBFovCGF4Mo+ShAgwlYT9xSF/?=
 =?us-ascii?Q?EsxNKMN/VyNjUuR9uaNIlFELx+LRF3fpfHyAa0kht7cXaSElqv1XFrcfnhJm?=
 =?us-ascii?Q?MT+6hD8EE8nmxx6Tmc7isfsfKE5xmypn7PVxSfwX4GSdhcmOoioSCyvVlCqh?=
 =?us-ascii?Q?JQYZXcR8cStfosL6T/XtHPf7Nh+WXOLXIiHV71Jw73E5XbKCdxENYzF3se2b?=
 =?us-ascii?Q?lLCOKufQE5GAF4QJTTcJ/7IklgxlL/hO+IOerGpanXhtsqtz6E6SiWtEe4Cv?=
 =?us-ascii?Q?cIaBi9/u9ZrvgQvR0GoC+9kjMCjQ5bMnJxWimgW4dh23KvnejuKn/iJYF7vJ?=
 =?us-ascii?Q?X6OUyVkLVbvnSu9Oz4Yd1wprl3Fj10PJ9gUVoDlcYypEX9dW+syCb8SYjhga?=
 =?us-ascii?Q?OM2msadcg6vz7LM9kYLd0WyhBIp8ZeiNqbcVL/9wx1T3Y99qKA81Vu3xM8CM?=
 =?us-ascii?Q?TCyvadlbkxHLsexJK3P++x/HsVZ6moVYHBmNBFLiIsiwR27SG8Sk+QGtfKis?=
 =?us-ascii?Q?nfvCu8pkgvPSC4GCYLyFZM5CONgxT3KUcl4HWXe58NBcpAETiIpwi8nz5DN+?=
 =?us-ascii?Q?UaDHmRS0XHwGmgBEgLNi0gvYJIyWNXoo5RYSWDWxt+pscReD/VD2JJhwtYHM?=
 =?us-ascii?Q?od+c8tcl0SCKiOHDHW/Y1jcOgcHvNQ8b1uVXEKe+5YQ9xCM6T1046j/4/IXN?=
 =?us-ascii?Q?XJsiP2Qjhe5C76MuxTs4qCg+fPOapYKIFogpXj7X5AbIy2VZ6LulcyPBFDFj?=
 =?us-ascii?Q?Uehb7TU12eJM6zSnGFaVz3pE5uQ62K5tQvz8UuJ+NrvmyCsaV8EfOmnJO22o?=
 =?us-ascii?Q?U4wVT58+Rwrh2rps+fIavRauI7fld5sr44CQZvkWVqMRqkrRJCVusIk/vm4e?=
 =?us-ascii?Q?MBaPIhdOjhE7ib+ZQSAjhpNh4YIsOjM4SBgBCQ62Hxdf6BDNHTIOCHn/lXic?=
 =?us-ascii?Q?V78vPrqHVdbMclCZdS8nxrHsg32uz+Tzh8B6vtsF7YbeWUZqjPBQmWG75fW/?=
 =?us-ascii?Q?EUGNo0v8FKk+H3itu2pnRxb0gDZylHi9dx2vxexg4tApPrd6tJHBLJfazG4o?=
 =?us-ascii?Q?+1WM6WeL9w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7fed3e-d42b-420a-a26a-08df14904648
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 07:49:59.8568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUrkiuauQGW6Fyp+ZCXiHIUy6qUa+bpTA7yMjqIv2SwfwJFUiiHcxRezq+//atJCgp22cXKCv1+47+rQvFWiCUMmMvU3BfeSeYuYcACPHvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P189MB2599
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246044

gnome_verdir() stripped the last version component to build the download
directory, which broke four-component versions: libsecret 0.21.8.2 was
fetched from 0.21.8/ instead of GNOME's 0.21/, causing a 404.

Use the first two components instead. This is unchanged for all existing
gnomebase recipes and fixes four-component versions.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/classes-recipe/gnomebase.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/gnomebase.bbclass b/meta/classes-recipe/gn=
omebase.bbclass
index 57933dda71..e5aac95a16 100644
--- a/meta/classes-recipe/gnomebase.bbclass
+++ b/meta/classes-recipe/gnomebase.bbclass
@@ -5,7 +5,12 @@
 #
=20
 def gnome_verdir(v):
-    return ".".join(v.split(".")[:-1]) or v
+    # GNOME hosts tarballs under the major.minor directory (major only for
+    # two-component versions). Take the first two components rather than
+    # stripping the last, so four-component versions (e.g. 0.21.8.2 -> 0.2=
1)
+    # resolve correctly.
+    parts =3D v.split(".")
+    return ".".join(parts[:2] if len(parts) >=3D 3 else parts[:-1]) or v
=20
=20
 GNOME_COMPRESS_TYPE ?=3D "xz"

