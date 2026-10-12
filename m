Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F102BCA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:35 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13147.1791811226690939817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=H0HHMB9H;
 spf=pass (domain: est.tech, ip: 52.101.84.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMz3VmZd7iomIKz29Ol/oDsQmJsqkQ+gGJbJY1AA2vElMdyLHyhx2CV/NSvObvI86NQy7ADI4b84zzHjiqgnTig7EUHIPAjcxOgDDk2/1Tjv4gZSKfrog/7dHvGMj2vx0VXRVIFnDNOsoIwuyplblMXfm7icqA541As6LgFJn1VOHOkvNfnwcCCfLcw/NCWusnuDtO9FpLXvl1k/YW17HLzngw5qcj2uVct6bw1SfYTOb+OnK4+o0g6t8fn1MeLLMAzG7cIqxA6G8y1TldDnNLygPp2oIduWzXEhNi+FwDDiLnQoc92j/5ewezqfxxxS4RQOxjNC4RfRo+5ImDy/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8j5PmrU1Ix5BGuDVBJgjQ1MOH5f/gve195sZW/PIqX0=;
 b=j5zGchAZy77QxMVJY6cPl3NSIsvHLAiwFdHYVkLeri5FzWBy1S4OaCS2n6HWRhHW+kfP6Ti7b46wvR6ZU8ELJ6sVvX7td8Zkds++3C9hq372i3d8ffcY4yYbFSIOvv9btBAPBo/nNTPBw9PkcTgAXnPfxAo1Nt+rGjddyrVYH8pjwyb7B4760rburd6SmZqAOCL/Mif50rJKHFMxsLziaUbxNJEh0eKyTwu5CHfx1vfLmtTrjXZkxXX1nTb6gA85CYwBsss6WFJ+76zjzzY6nWJ/E24lggSOK+9FtIlEvubeSWq5pbt6nCTBvlAc9nmY9/OtKOt5gOQi7aXdikDyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8j5PmrU1Ix5BGuDVBJgjQ1MOH5f/gve195sZW/PIqX0=;
 b=H0HHMB9H84/qT0HsVS0c930Hc8X5EL4Jln/gZXazF8/8rOdj1tugY/1F24b8r+6S/SUECnbdzLLrYCWQW1YoAGdygqkZvjTnTf0qXe9Y81LWbhf0DRXsP7WxRl40ckQ74pAPiCDF8rlqjAX6KQT/B23wTaeMMm6P2w4mXk2oGYHVqdCDIDXkM0/nJGR89Tcvv6oaG/QdiGArv2ZKID8rewB6HivkyF1cFL22sq7C7N/3lKsjNzV7rEIAtWe2/0UXjHKj+10uHB/5zMIqZMbYxh8b8c7VswZioeIHTQlXy3ar63N2Vt7HjNoLXXP3F2rixMYdDsjGYpoAB+4EhPhi6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1966.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 13:20:22 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:22 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/18] python3-pygobject: upgrade 3.58.0 -> 3.58.1
Date: Mon, 12 Oct 2026 15:19:57 +0200
Message-ID: <20261012132005.23909-11-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1966:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2a1f4c-e669-4e2b-788e-08df286391db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|18002099003|10067099003|6133799003|11063799006|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 
	zgdM2uNhhdb1AwQQXYw1Kfw6NtQwuWfqMPrYxpYbL6S6eo4eEq2k9qFjiHddnQNsyKob0ny8UhOkp0dknBnTGMTA10VGCTbZyNu4MHpr9q/LPQwoJcQGc7I9AZWkuZmbH4q720XqN/WoLJ9EHXWWGx5Rtmz6BxlgMhpXww4p1s9kCA6vRkEiqGex4ku/GfSxLHUTrV01TgFHkZ5Z5sfcjZiFd9ZQt+hFr+Y1oVYqC4YI9dtrfSOCGzbUbeT8GHnkS025jIu242AeWDCp4XSctCtKt2z+d+sO4cz6xpH1C/d9LVWr+ieQTPDUOLP1rcI/1vamjlfk31kYas5lDavO1rrWB2d8syaR2/8RNTYgu+FgNdb89PpVb6B2pvyYEC3M0W6oMhGAjGAwRghaLk5LiCvcW9+1O/nlvETZHuofS95qaqX1rJ06OfnilmD/tzYgXSXRrOsx7nCqqlvbGY2YqpCELQ4MZQt1Y9HenMdjPnOpFEfAM8PcVEcQZOkHLPFmdDeHDl7GiK1YeDBxdCcpdgPzxxn0/sjrlRvYojC5TXIas9AlJvsPdY7EtFjrWQlXlmfMxCNXBAaO4VlkvfKgR4+Vm40LxnytA5yBMOZtSk0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(6133799003)(11063799006)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f5BP8Zrq6aGt28p1E9AcXQh5s0IuiBb/HYBbQbplZTl+jfTWBvR2ek86C5c/?=
 =?us-ascii?Q?vmTPSbZjCfHVpKTwE4ubO+3OmQUuctLjzVMRmOvbIbWbleKuVxZBzZ7NY7as?=
 =?us-ascii?Q?oLkhBoLkqTcpgtgTNhPvg4KrNQNUBUYz9M8sdIFvwzfD9j5za9azi3xXXPr/?=
 =?us-ascii?Q?nR2YdLkSJQm1ORvj5cqKKITJuQYggWvmwx7345d2G7O2FPUx3wYDLG5fjHrv?=
 =?us-ascii?Q?NJECYxWH9oZy7SKfYork4FdhY3LXrrlLDd9OR5zeGjZTNdod4QRY7sBbPP/J?=
 =?us-ascii?Q?h3T+xZuPDnVYvbrcfnINbQjRM47qKH10xzSqN1h7M5hO+Ee+HL5OSCNpmmcm?=
 =?us-ascii?Q?lZ5g3rV8OT4CrHTCV8am0lUbHhw01z1QklC1olw7+fv7XpwbAfcTe+UVQd24?=
 =?us-ascii?Q?aVNbhJuvN59linsVwkOCSmTm4mDk1bNk3W4ZeV9fNmSkrg+uw30CNfsVsRtO?=
 =?us-ascii?Q?FKB0cK6ftsEql9eWG6Yl3M9g1YmaR7JXdk0PUtsT/b1Z17/Jb8UxfsCIND8U?=
 =?us-ascii?Q?DLMHSVu3L+h05EOwJKGTdexNF1hVfZKDZyS64m0cWKLJDbMCi2eAqn9yWqhb?=
 =?us-ascii?Q?Z4At5HH89Ed/PqtEQ+gbNkRAE6SzWnw9ppxSQR8CKLgEa/8bhkJqrVFAs50o?=
 =?us-ascii?Q?4ZZ5DPf7q9JftG49q2dHQ51iR+8Sar6CheqQAt1OX7dcHXPMF7VjYjX2Yhgh?=
 =?us-ascii?Q?/O8cEJyK+n0An6KNepeDWU7IT4hBGTVbiQVJoBCSxtBOe0jr/oHwvmAOMsnC?=
 =?us-ascii?Q?C5qj7dxpoKoFLZSNAULkxaTuEt9EupCH99vBf832B43/PSxrVe01iD3ib4bw?=
 =?us-ascii?Q?3B9mWOxpDKZ+fWdf0wGl8CtmRqsE0AH+Wg6gTsZVJgA/OOTsu+n7fEC9bacC?=
 =?us-ascii?Q?eJB4XEZJ+vWTiWOg9FZlPkMJN/X3x9drSbaj5pe9Fk0ffb+MFiAsgq97yTYw?=
 =?us-ascii?Q?DkXTHtiDPWSXBzvhb28Fq1NzzMlmPXzBBfOssLZ78R5LgPZnDVOK3C8TZWQE?=
 =?us-ascii?Q?JH/S2z6rqUisGskkW3GXTRsT6q8lipwUxeSiDpyKILRwFH6U+Z4RgCm7Kpx+?=
 =?us-ascii?Q?Ma9W68csxudAw7CQi4jTacNtII49JRjYP/wffMtdKelHTV1R4niovXEUkGV6?=
 =?us-ascii?Q?8f26t5ymXcXjymOKJo6W76gme6zP4p30mr6bzhgF8AkbOG92k6IDnLF+APEQ?=
 =?us-ascii?Q?+NaaWEhzcTjlx/YNuuhX+SwN3X/y8ezPWwH52gnhOmBNPC1DD61ai+rKMDAb?=
 =?us-ascii?Q?sNfZ2MkDteWm4/3iWGCEZK904/un88x+jgPhmtEDaRlKSdU9xBbN/Dhfm6Gr?=
 =?us-ascii?Q?4WtPHWUK5BKl4oKmREXRaxCiMNAG3IP+BWjWvrWaZZkHDn4MQWFueFd1HMUi?=
 =?us-ascii?Q?vJ9iomS5887aP1BTI2Y9mPJqX9W3LRMaGqtgjEBjaV3dSL4JTm3+nxvykHe4?=
 =?us-ascii?Q?xQ/ZFaZO9CFoWYz4z3Q1NXTR6ntBMmqzr8mvDs/Wl2rZd6WdJm/uJOaRRaU/?=
 =?us-ascii?Q?Q2Sz3izCJAR28ict5rLBUAgD+URrr94SVpTUxYCoba1Rfy6P53wUZ3OzOs+k?=
 =?us-ascii?Q?+Y9I9EVHmBX7xrFPunIWl9nPLJ4ZZ/jLQmto3ZqPC1VfYotQArxdIPI+D5pt?=
 =?us-ascii?Q?X3sebpTusk/jNMyyKWCiCsxEaLaCgqzvZU8uzZpx2tho5pHQBiw86EtcZgAT?=
 =?us-ascii?Q?NKwxTjHzPnxT41hL/IVt3Z61LI6pB4PoM/P9n2BCBw6M0FmHvxhxyl1l+fxv?=
 =?us-ascii?Q?mGU5NDcliw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2a1f4c-e669-4e2b-788e-08df286391db
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:22.5146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zk10obuWFrXyUk0kPAJzP30Oquyk5omDNQKEaLkw+Sb9ENNEPal93NB2i7yRksPlgBzj98qd/IErKvzhtqHwGZiOpAZI1IYGgwXXGCW06iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247654

ChangeLog: https://pygobject.gnome.org/changelog.html#id1

3.58.1 - 2026-10-09
-------------------
(backport) Fix GStreamer crash with python-debug !570

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...{python3-pygobject_3.58.0.bb =3D> python3-pygobject_3.58.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.58.0.bb =3D> pyth=
on3-pygobject_3.58.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.58.0.bb b/met=
a/recipes-devtools/python/python3-pygobject_3.58.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.58.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.58.1.bb
index 7f5bec8f70..82089c2ad7 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.58.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.58.1.bb
@@ -19,7 +19,7 @@ DEPENDS +=3D "python3 glib-2.0"
 GNOME_COMPRESS_TYPE =3D "gz"
 GNOMEBN =3D "pygobject"
=20
-SRC_URI[archive.sha256sum] =3D "45068697de3ffe46840ca369705f23118b34db4f7d=
eb63f6eff079a6734ddcca"
+SRC_URI[archive.sha256sum] =3D "4c80598ade17fbaa7798e01a25d0bf29ce10974078=
6026a074c5c62bb3e79d23"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20

