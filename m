Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A864EC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 09:26:22 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.99])
 by mx.groups.io with SMTP id smtpd.web11.6501.1699349171867699788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 01:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=aFRY0NsZ;
 spf=pass (domain: prevas.dk, ip: 40.107.22.99, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvKFn/e9C/V+5Ma5tBdTU8gedUONiFViIymw4EkRleKUz0p9YSZyusd4HZsbBgEU4hK4KNJWViKtnCaDui5RAgeeTVHdGIiHzM4r4ia0SBeuX/AD/yqjlfH7l7CJq4T5n5Cy0D8AQXuu8N9gsVcoKLBQYn3UvbkCTx3ZODGWdd71DNHVIVvuFtgQGq3o3FCzRLEm3Cn3/cs53eXU3Gu1UOkCcSCRggHJjHt6jAI0OlW21pszXFAnGld+gULPH0vO+e1M1ApwDtEMtLZLdqk+tzKJuwwblmvUaKY5Rcz92lXLrKjDpWaKMas7Ivmcb4knlZ0MTFRIKxK96Dqbu/glzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeD2TUf7dz4alT4NUpSFqX0r4omYgaiDETTaKNgOtsA=;
 b=Ll8Kt1eZxAB8rungZsTtY1AB1d1nzHrgzTLnwhTFrJ3j/1gO7eRv4nqful+KM10g9yqWuyoEN8giMWBurBDFvhqXRKKcVnVLiDNjV5MvtNVLF2S45MXkN6P7uoS0FUK/GQKBidNOlmTvqHvVPNOgxU18X16ydV/t2tvcnUeKcQjv7IVF3bFlkjqiNJWW3dZz2/dcCgF328dmLv2yc+fp96EI1vdxIoIKN43sbDM1jitNfHKAHbeHzrdtvU81KSQpXI61e5b0Ui5w03bYnppp5wQbz/z0Gk8vYG975HGI7O9LPxY2bw91BpT5epMVo/LgsXNfuATphKIqrQWDWXIUTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeD2TUf7dz4alT4NUpSFqX0r4omYgaiDETTaKNgOtsA=;
 b=aFRY0NsZCBqnthg17Z8LhVqZ9kLH8u2klDVpPh0qKmfoKRx7YI3CLimQGgcC0+i7Fc/tMEzAExjIoeqUcdqpXdLBnRFWi0PKmnl+ixflzhKD3nupmpQLhubs5QE0zVQqGWEi/y1cyOvYWX7O54+5ZKIjy3OeWbrbRvTWBAVyx94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS1PR10MB5314.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 09:26:07 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d76:c11a:5c3f:3245]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d76:c11a:5c3f:3245%5]) with mapi id 15.20.6954.027; Tue, 7 Nov 2023
 09:26:06 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v2] perf: add jevents PACKAGECONFIG item
Date: Tue,  7 Nov 2023 10:25:57 +0100
Message-ID: <20231107092557.3843789-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.40.1.1.g1c60b9335d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0070.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::29) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS1PR10MB5314:EE_
X-MS-Office365-Filtering-Correlation-Id: 29594e09-eb5d-4c22-4d41-08dbdf73917b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mN9prMpzNCJ2VP4MrMW+vE/L8nl0QFVCQ1jeQyVpOUci2JwVvXRYDMXmU+x78nOe0cV8zPJn9hul6fJUerJwhmUKR8+lxcbeqnQrQtAP19wl6qmTtUMknVOGMERy2vsQMLjSAW94dVgyLHYVjH4tsu/Amzam86E8hg9bLkKVzjTydyyPg9NpBMZUzn1yBQZONYlm18Ff1xbyWwPJzg4Rr3lZZ5+bSo/RsWd7hAP+2by9FFHDGUzPN4Sboc8HI0TOmCEzR8rS+BZQ1b+R2NH1S4qzppW/S82yypcaJkbGKxoAxlhcz3b0Aa6/foAnTkX8cc6D8CT0h/lXJDhln4cvqgTtNSD7luBf38kPC8QM9Ui38dVdulnqcDBsSenupAKaBx1DK82R8JzS+DyatsleZqB6JnOyTKeCfVFsWJEbZT7qh/tIKbKyNjkK22hjRpSfoKegCGRGjt34j+FmgkOIl+vWIyv6Owz/2sQOgNQuGlAD4HuyZnpTicNM0Ie80Ck9ygI8iljo1gsuzrOLNHOfu0fVlEI78q3iMRiR4HOEEawvf9Rc13IhQFu+txuKgqIi6/d9fPAFxtjnRMoqBcEf0D4D0YA/VIaCGXHwau8pEn81zAeG04xcczXOVaca0WCb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(366004)(396003)(136003)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(38350700005)(52116002)(6506007)(6666004)(478600001)(6512007)(6486002)(66476007)(66946007)(66556008)(86362001)(36756003)(2616005)(26005)(107886003)(1076003)(38100700002)(2906002)(6916009)(316002)(5660300002)(41300700001)(54906003)(8676002)(44832011)(4326008)(8976002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?scXg/QGKmLxsmHDTSC79LdlJyoR9LcN9f2M1JGmcDSfkjT8X+s7OoiFosR1w?=
 =?us-ascii?Q?v8OJUCKyxSLpyl9MwETTUXblLeTVsL7AbZPDq9nzsw2++zIuwYQqpkwvHOGG?=
 =?us-ascii?Q?j22g12I+M2gkrMnp6UuECW5bWrwUV31OtBcDU+LEfVksSZ2HV++IolZ/JO0k?=
 =?us-ascii?Q?E1BFnlQo32RE0pHelDmlumwDIFTc02ZMtO/qusknkrClg+q95zdATAtflkwY?=
 =?us-ascii?Q?idBz4DeNQd/AHD1k/13kvcF8P99JynzbUcD8RXIDimqupUGufj/PWCZpPWyr?=
 =?us-ascii?Q?tXfLApQNqFNYSTt/vpunb3ehSYJbfCt5i6i2w9ZxlBSDrL8n5RWUax6eKDIO?=
 =?us-ascii?Q?jDgMT2UWJEUEIdKHHempz3/i7wfU4Qg/5/eS11Y6rgxNqCdcSnwJHt20F1ig?=
 =?us-ascii?Q?UgTAtror7RzGvZSdAkPw/ONmsSqibHNTyi3lXr5P1swx9sYcYeekkVv1zf+x?=
 =?us-ascii?Q?90osd5q5bAr9qvPOwb/uxbrMDJrmeenIeh4KiaJLbBDqkXoN3j8v8VfWQRQ2?=
 =?us-ascii?Q?HxB3WUAn3UWfgSHAnEY6FIEuwG/aqb/kDjtvKV4vBqq15+jbgZO/8x7/GJoO?=
 =?us-ascii?Q?b9GJoHRrH7lLs7zp9FDeVvDJJgzMdZLJomxKme1Jz3rIqU+ML/xmyT9yH+i5?=
 =?us-ascii?Q?N4YOMC9LFKUfUgfQ4CD4YxcsZzuPa3y5Hrcvuo9fG/aRdH6kUY46yIccl5mC?=
 =?us-ascii?Q?7QuDvWaZbl8dFcYXdq4qFqa0uZbvOqHMCucYmu6NuMb89fmgIDTFF8BV1X7J?=
 =?us-ascii?Q?fftjrcWP+UDxgAcGbQkPun8thc1HAoVBG4Aj5WP+4Wngdx+KyaeTCfA0Cz8H?=
 =?us-ascii?Q?aalt7kuP6kwb1vVSDaa2KiyEad038mKLbcblMpaZAyGWoqB02CwRenDFdK3u?=
 =?us-ascii?Q?seij0aI61vylZsTjheBTc+TKCJDjoVwkUAiO+x5b1z3r6qqHuRhdvz9FJUjH?=
 =?us-ascii?Q?ftdbuGvGASQmfEqr9cIFroYZtpoAd0hl8tBwws8vYZjbMKGxjw/dDzYRCafW?=
 =?us-ascii?Q?eCUJXMwZZN6ROoFJVEJaAoSYIsVvBSnCHWKtIMSdX8lstXgtgm1Xz69NCTvF?=
 =?us-ascii?Q?utKLApnfBsxUzO+INzQXMcfZXKohwotMstWTXI8Ig5qeZaXTyAJMqxMn8/q1?=
 =?us-ascii?Q?T9NpC7GLVi696pr+/fGkhkuVfnH8xyUBdSja757QMoCacQghvbUIndGq+XWK?=
 =?us-ascii?Q?Z63PR3fBykD/TQwSVHfX1kHuarX3pbGqrp/gyRAk76W3U/FAj4arFPYPpa76?=
 =?us-ascii?Q?jcvIDfN80ZzRMoPA03cDHwYMiSThAjLRmpxaYcmk11xkoFHf/6SOHYoFRcyz?=
 =?us-ascii?Q?SubEmNoc7oLA1oM1d5zqgZqeA2pu/az4dRo2IITj18yUlKNiX/3xQQB+wEtD?=
 =?us-ascii?Q?vAVB9N8A/Eyjw8kUudE4QpKUD14Hvo0LHqZB0ZhdJA515VPUPGrfMwMIw/EI?=
 =?us-ascii?Q?DvtFUUngktiDVbp3QTMwFUBkTRm4ic9chtcPHED7ovCMQ7PL1+riRCyjorxZ?=
 =?us-ascii?Q?pfEbEIDkUn0/bgQQi0sAW8JEn5750KikGxEmffVedJYQVO5t397Jyi1L1oZM?=
 =?us-ascii?Q?NCpM/iBUyZfkI8v5Q7xp880niWduLMZlfmjpzgQSucJPm+Y71RRle7w4H/y+?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 29594e09-eb5d-4c22-4d41-08dbdf73917b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 09:26:05.9837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UW8cHM90HLfAZKcg18y02sR3YiSO847OE148W1LMTzRTA1zJdjNZLmasxyg0gB/3VhjrG4Kpzy74mNzrDbdFnR6JyjDLVMKqVDVvhrWv3SE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 09:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190260

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Building for an arm64 target, e.g. qemuarm64 or a raspberrypi3,
without "python" in PACKAGECONFIG, results in

| Makefile.config:892: *** ERROR: No python interpreter needed for jevents =
generation. Install python or build with NO_JEVENTS=3D1..  Stop.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
v2: add comment on (non-)relationship to 'python' PC item.

 meta/recipes-kernel/perf/perf.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index a392166e73..5672f7d338 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -28,6 +28,9 @@ PACKAGECONFIG[audit] =3D ",NO_LIBAUDIT=3D1,audit"
 PACKAGECONFIG[manpages] =3D ",,xmlto-native asciidoc-native"
 PACKAGECONFIG[cap] =3D ",,libcap"
 PACKAGECONFIG[libtraceevent] =3D ",NO_LIBTRACEEVENT=3D1,libtraceevent"
+# jevents requires host python for generating a .c file, but is
+# unrelated to the python item.
+PACKAGECONFIG[jevents] =3D ",NO_JEVENTS=3D1,python3-native"
 # Arm CoreSight
 PACKAGECONFIG[coresight] =3D "CORESIGHT=3D1,,opencsd"
 PACKAGECONFIG[pfm4] =3D ",NO_LIBPFM4=3D1,libpfm4"
--=20
2.40.1.1.g1c60b9335d


