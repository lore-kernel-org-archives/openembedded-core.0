Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2C3CC6B0A
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:27:34 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3966.1791836850017089277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=RyV2JgmK;
 spf=pass (domain: est.tech, ip: 52.101.84.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuV8Lt0lWA/qSzIFpQhCOinZNdMrmMb712mzkTdpd9FUWUnwr6ST3FPjVmap/DcadKwG7cQAnSJRAMjoY/SFTr53g3tmemDAD3vI0QUGoLk/aTAtm2xtxYwo+5i1cmZ8X1CZecXTdo2pX6Fkpv+HtqFRoJMwNEbN+jf8ow359QfvsM4kjz92FDQ/B6ItD0sVUAd4Eqpp1JHsGSe6UxNMtmHtWJr4UmpY+Ecqlb2uAE+TZXF+bWfN62Fw6b6tUGB/b64kpwGgeehLMrqUOx4G9spmRhT/C/yCZXxz08hpEFcMS8sMLIpHXAZ0vX8nI3UaPnJ/dMnPltwSSpfRJ2ybsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZq+Wxmm5fp1123WBbL9f7cVHJnFsEdP4ltK0GFxcbo=;
 b=CtptR5Mzz4HEQKseEkyzDWll5zkm0KNDnOkf5n+AKdBt+7ML28DlmD85fpCzR3lmRiy6osYdHzP5GuRyd7mqwQljgCN9P5mRtc2PRHrnrLZz9YS7qLogcfigGi/aD5GvTnDVg/S3dTL6wM/0wYjNvT6rhdNtcDVxnDzloTUPtd2yw6QDUYW5VUu0NeFdmOpw0Ndco8TnHUQfQjhWRBCb1zDpwXTLSBvJH+3BGafkH8OUYFTYvbvKfc5206e/7hoJvcFLWxXwBtTZDdvt/5dWIrqX1c3GIyQy+mAqzZu9I5TKdIG0YjMXubP2Gp1NO8tgLTwGxRjANE7iNSD5/ieg3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZq+Wxmm5fp1123WBbL9f7cVHJnFsEdP4ltK0GFxcbo=;
 b=RyV2JgmKXBdYsDFxue4T+egu7SSuE29E0WpKpwbZUnZmfrQQA7UjuWRIqZdntbJX1NNI/UFfAicRcVTebVwOcYTZv0nbzGvq2wU+orIr/u9f0WCf+o1WC+AAHjDbX1oj4K5CptngBE2zFBZWPxSZhjAv8L0hL3Km7CXi9sSUFsVb7LQg/VRExv3E1r/0DKozGkvcozugfDG/dbG1jHL5SsvQRGu9OT6wqhSKTsK0K0kf8YIObuQPDAOsvaywK4+7cOabloVajvjzDMt7xvoMiZPsyS7KWnRleXrhz6m8neer/enbT8iBM4dCmXhwdzrXe7uQsu3xsRXPtLwtnsN7zQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:27:30 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:27:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 08/10] gstreamer1.0-plugins-good: Upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 22:27:14 +0200
Message-ID: <20261012202716.38597-9-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
References: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0013.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3295:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1d92a8-c16e-4854-ebc6-08df289f3d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|12006099003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	gxwXQVBzgZ97CgazsjH+nwoxEeJmxNRAJ8nizR0eC94c7CbFPtXm9+rpDk/Ipty4KPJIAa1iOHjy/0wd3WFQZ0Mvy9lY0JLxe6h7GXH+sJnKG2m0rC3wH1a5SEP5za5xq8L9Os2viiylNbVBVvY+tT2UthrYeB27SSa/ueQdTAKbaO/HDauDS+pAZR22fmFCycmGPzvgdWH2gFIzKz8OPLIh0VcfjC8L+7Rvne8sTRgJ++0lg9noPJ/05wQJuY4s2jUvbqmabjibD8q7WqsEHZJExNHPchbaVe4c+CKaf/VlZaO3N147Lol0MSxysJqW/nnMU4+oONetYVI2cvGDfWcpNOyg26aZRSYg8VxmVX1eLke+XuKn+u9Bw2lqvY6JgsEwewEl+YlOLP3fNLdLcgMcYQm8rnUjATuH8DdH/snHBWIRC5oy5/MOmhacQ1bz6NLD1zrECXZhBIiwZCNdqf/2DYEQZthPzAqpJAw6s3t7+mfvquBcbVvyW/9bKglbRZnnuZii4K4xYnh7E17GIDTMVVxfOvw3RkW0mewszB6zZL8dIfgaBMkPEcyoWBX+YBK+Ulby6IIwrvRjXekQEAcpTLh+qufbCrlqDb0Qb+c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(12006099003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jbouc/6KPT4yYxZKCjxWilw3yIA/nE5IoNJcn3KZAJmDmCRqqrSjq/U+JxDh?=
 =?us-ascii?Q?Q9yNg8cln4BvWc1b8bExFGdtjdR+rANAttm2OqQC2LDFbsPEK9rInC+qDRyL?=
 =?us-ascii?Q?Hqc85xuBNP/vje/bJaxFOgspYiJILeBZGlBZuwN/5Ep6vQSJTyTDtgkuz3pZ?=
 =?us-ascii?Q?kIxd7D8fyOdC7AiSe+EBFqcvNLGOD7j0QvM9okgSMcAWIlQFKgK1oM5jMnbN?=
 =?us-ascii?Q?yziI24BPi0q4TxUN/D+K24qZEdOEEfUbw6bAiWqJWphWkrVZSSTn1BtocSvJ?=
 =?us-ascii?Q?jjpL+x20jHeVOOfLX0B0jrpJ4YHTRO3SO2HQ2mhl6n/oUbz9aBEG7bkfjT8G?=
 =?us-ascii?Q?QXoHGEPICeIrQ8VCRlVasMwC/9CpMBLmIuP8ZPg+731aBGRrbA/+x70IjIPO?=
 =?us-ascii?Q?tY8RztU6hCgtzW2v4V7LN6I5D2CxK3Mj5irYFEGcSg5P2hs4NMDHTeETipDT?=
 =?us-ascii?Q?Tgy6op9BjzaLkPpKhAHMpW6LzTM1lrMzB9BqKhR4mHNz/MsawDdNzV/KNzvu?=
 =?us-ascii?Q?SDX38Xdl9qLurxgsHHv1mIe52tU0FpGJ9b+s1r/GE2uBoUroJAEJMlHg8LV5?=
 =?us-ascii?Q?5c5/zg3NQAvmOnszLotV39rK3S+2aBsioKjtqhJuEuuBkHHSUcWLVHPY3SE1?=
 =?us-ascii?Q?1aBwMhuMwYZ8xx9aKlX3lhiF3Y97Oq/QwlAv55gqNNC0SQ+NbXP9+67hxfVT?=
 =?us-ascii?Q?m2dwQ/EVWa3i9daDr6U1Pn87h+AIZZ8axFiSOY1MFvH7eIbJc14TbsLRwNIQ?=
 =?us-ascii?Q?tHWsGbSWZw0w2SJIhF7OAQ9H15LEky2TXcBQxSqhm5lImHYbchqEVbG5ZSgq?=
 =?us-ascii?Q?w3InvGeDPNPoE7Ybz0EJIaKXrd8qVhRFKONldFftxp2PVC4IAd7PoVkW4S85?=
 =?us-ascii?Q?OAgYRIws75hTfsCNpGaHhNbMkGvqIQXM88ks5nBmYKbljFyYru/RcJcyvxH1?=
 =?us-ascii?Q?Vbsj627niv81bCtPRDMm/39y4WjHL2WbMsUrccC/evY1lvVATvpA+23EFZal?=
 =?us-ascii?Q?0VaCYkVI0V8nysN14L2SfY6aaPfh4GtVlj1zdnOrWLp55LYdUYBp1fqj4Hx1?=
 =?us-ascii?Q?XsHtnVYNoikK9Mdt2pnvkK6QvMxNEua/uJSunIBbAhuxBiyPFvtpV2I6MCPN?=
 =?us-ascii?Q?T8LpBIZUuBOfJRgtuifntlBTHux5lbCoJ7Lw2TCEsTFPwp2Fr8Dq9M9lGJV3?=
 =?us-ascii?Q?uzAwqau5ydPwYjfEbKOZf94ifij3EOKgmc5jVBPoTdA5aFnO/GZ48+WjBu5H?=
 =?us-ascii?Q?HxZP9vWtyh+ZvFcyc/3gL9FLQ5XDKFDEqSO0o0jLoE2UGxfhXBGcgpJs0nBQ?=
 =?us-ascii?Q?AyfZ+USAmfWonBmfqSmWcw8y44ApX9N0LFynxZf1P+Unw736B00vKQZehw4t?=
 =?us-ascii?Q?mwgdC5zA2NajUi6IFaRI/D1kiozdJ6i/tcGe7c7WNHkvVR+ERYeKPFbmJZJO?=
 =?us-ascii?Q?wWbirk0Yltr85gWxlLTpS256PiPS1giieOF2QasrJFRC6rMLAmmEGJM0k8PY?=
 =?us-ascii?Q?6L0OabcJ/dBUCGt1/VqxDr2ePa9Vr3l+RQZst4hq489sYFKQkWT8eqo7ESzd?=
 =?us-ascii?Q?tAbZgEllOJhIjS/mpkk1EWTGLEphTE50QEnIN+IEpbWi1msbr5cGKMU4MzUC?=
 =?us-ascii?Q?HlAV9wvV04j+XcM5KUVamUo6jiI52V6penY6Lr0k0++bC3LmQqB+x1CWGDc2?=
 =?us-ascii?Q?7UxTOvm/A4vjhZLHwp6qxy0dxBCXyh08WYUDR4wCRLkDAsIgPqooNi3EIv0G?=
 =?us-ascii?Q?z0/mH32S+Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1d92a8-c16e-4854-ebc6-08df289f3d67
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:27:30.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mm9shUess0IU2i8YShzqfcfEIx8dlnO2C/NfrSGfctHce1jtAwIkDfuAo2bcYuc4x5tuwtPwEQNQ9xxp5Rh1RkZRQd0eX5jHICNVK2Cv2cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 20:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247683

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ugins-good_1.28.7.bb =3D> gstreamer1.0-plugins-good_1.28.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.7=
.bb =3D> gstreamer1.0-plugins-good_1.28.8.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.=
28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.=
8.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2=
8.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.=
8.bb
index 027e7b34c9..7cc675faf5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.8.bb
@@ -6,7 +6,7 @@ BUGTRACKER =3D "https://gitlab.freedesktop.org/gstreamer/gs=
t-plugins-good/-/issues
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-pl=
ugins-good-${PV}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "87256969c82cf3bc8574301f3e7044a90de0ac500a5a27d8ba=
38c4dde894dd8b"
+SRC_URI[sha256sum] =3D "a7670ed900d3d03be744d25c1873b239896e9a82ce6d17f8fe=
bc6fffbaee9521"
=20
 S =3D "${UNPACKDIR}/gst-plugins-good-${PV}"
=20

