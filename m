Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF21CC6B04
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:37 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13152.1791811232994244268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dAgDoE/v;
 spf=pass (domain: est.tech, ip: 52.101.84.61, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkCwubbFMOzwPbMHiuaBt9sS7xHfmnvArUnagbWrCtYadal8hPQ7nu+RAOYft+zH/4b1vLK3yRV/XPE/K7USrlTZaWfnUdjsCkGXp1TP3XnplKIVXlDf9sxzIou+RM9QDVrHhg5X5bfMQn5dt3Z05c7ddrXtTUlEWNwvvoWFhdrtm3B1aXHiuKvmt3yulLdpxqhEKriS2BZ0LagRfCjd6GIzRZ1o0p7NDj1yE22Llx8Glihmo8wzoRPDNvml8famZK17NmySf7cIibU8E5x+l3PJoc2X27navpBknJjdR3Z6KMrVB3W2eleT3ID2OghVIlyZUXYoG+XYtV18WTfNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bllwrKzWZJIUU7Ofv7xsBmakwJ5JXIpi3kIQldt4Y78=;
 b=qY28c0s+MMWaxXBc2m5nEex41p1/ZJQW8mqM8SninSC1zrwAIcCwDFarPWllyW/s9zQIqRJ+jsQvGnWvXi/yDotfH9ZK61DAQpaH79CvTtN2l2jEN3yWcBiw/FI9iHxVOTjvXu8duGWulxk8wkjvCxmwSwjq5pqfYsh8WZyidk4ZzH02Ilz4VGGHf1oJC44m4/LiUycrFT63/qmsDma02xON2k10rKzkkWxvXuW2bW/NX/ezMyxGJmXttYvuXYTkeAVR8WpFIgwRQk0CTQEhp2xv/MPBkmoXJTx+MjNDMHlB8+FEJNHf3YaAzRjF84L7xPRHWz7TN11XpFfsE2nACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bllwrKzWZJIUU7Ofv7xsBmakwJ5JXIpi3kIQldt4Y78=;
 b=dAgDoE/vTGXn3e2NGx51NkSEllYdcg7eCRZVGEDq56ZdxZEzbTvcE4FXfKfIclp1HHCpQ4B6MBHn2Mz+pBYRd7zZSG9eCFhT5wNa5aad4f+nF/uc9nwr6Hz2HSqAgHhr4SUl6BzAr2SvjRNj1Y8CaWJCy6bcyWtodFyi7Msl7XXpgjO6ic75pWfCq9WTTquqWpphnDYYF1YRJ/61hOGRyZ+iysgjVYWjcOB3OpMIfaKp/3aPld0hmdKhTTZL5C55LlY5yf2iLXc96Xuh3U2fllE3hqgOhh/8hdXG4hFJjpK6yyIlSjzJ4CCnrT6I4G9Upv9Wo975LHqgeivorx8xCQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1966.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 13:20:33 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/18] python3-hypothesis: upgrade 6.168.5 -> 6.169.0
Date: Mon, 12 Oct 2026 15:20:04 +0200
Message-ID: <20261012132005.23909-18-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0041.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1966:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d851d6-983b-47d7-9ebe-08df28639816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|18002099003|10067099003|6133799003|11063799006|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 
	TldWh0fsTRLPem6Ds7EeYaRuG+hyaXUrSR+wU1A2n388LhP0INidrT9KKOSR5xDD5c+SwlZGtnJvCkwyzPSGfIuk1VDVHmr7p7GsXtsPOpdpdqYkCe5qiD6NEHvBl0byz65E4cUgZLRjMHnUjeDt/vknaZnUvGTxLGxBYjUGjS6RLq96eYMeI8ul4HrLZ4h+KGBJ6yTtXOHgkTa6bni4adDVDA3Hv3+4mgsNdrszYJ/5xrMulEGUaaE/GsRgNdbWaNyORgZg6rcwvreTLBCANQxdelImu3f1iSJWnMVAoiID/DXrBfqQuXwd9yfZfcVfEV8vzWToA7TQZ/J572cpevcuZQu1UdMK7BXTkgF1vWNA8SbCzlU/sKOD77g5lVV5eps1w4hWXf6NDmxRrlLRhwh6As5+YdeuLMDMIn95d6V8Lq1sjWh6YqHfO2PH4lzXyVkkNfnsMkNNKzFygy3Xb9BeGV0jzv8ObLPSaq7w2y+tTN+r+Q6ZYr4hkgj3aMrYedoCXyAppT8m76j1YnGUzFaeh50bG2jDR2jyMHmonjnF6fiTYK2hDTpSI9nXPXczD9k+1AMJOuI8+NsjSdOv9gDRmebVnag+GE8Z4lSR+PE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(6133799003)(11063799006)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D8ZEsTKG3XAIqjuZJMwi4xsx9f828fohbJohW/5h89UXsMj6NPtRtiFWxOGZ?=
 =?us-ascii?Q?OA/OPqKTV9PVcVF/nFxjkdMlP0WCQ/mIfkyFH2BDuYro2vNB/WI07Aa6UVql?=
 =?us-ascii?Q?3AvNEotg7wiJtjW/VFpzwMO04XslUVHXcayue8BcUs25vr4LWbOnDX7M71Uo?=
 =?us-ascii?Q?Jeek2iYsA1381aEPIaZ0WXZyX7RiO3uXmnB7l1GxgtyZKeVWzczwrERscUf8?=
 =?us-ascii?Q?CbhutxbAx0fC5cqUiK1l/hVyV2aj0wywaKf7WIdCw9WQevYwCbJ5BGch7C8k?=
 =?us-ascii?Q?16dgskZZiTQW5ZrXjzUkl5Mz6G0ofvEoYVQuwmdwP42FhwjoHiSIIjP0Lkf2?=
 =?us-ascii?Q?uyF6fSlGQcqDu4+FCxpwB9mUhf1zKdRZrEXC+9mJetZaxDG4LaSTwPmIz9bs?=
 =?us-ascii?Q?cBT7myKrBXQTNS2A+yWPWmccbkmFd+59UwUuuiKX/dgtkJn4QuO3g3sQlApA?=
 =?us-ascii?Q?NunL/2VTPhLGVGQwOTu6AdBlwe7dPQkaceZKtkIrPoFrWfhSzhbqf3zwbHKN?=
 =?us-ascii?Q?Xkl6KL9xMx67iB+ZZtWvj0w3SQ0ULZyeYysvgUmdMeA1fVH/CSKwBcWt6tG/?=
 =?us-ascii?Q?8xS3jKUfZcxoj47wpccqlTegsOFNZ14ks60UfSAf+P/Yoz41zdZeC8w/BZdj?=
 =?us-ascii?Q?R0fpsWrsvA4WjXZ02l+jK15bWSx7xuxfb3nkOGlv5hYS9zekTzwT1+yE75hl?=
 =?us-ascii?Q?yHgaxuvZrv3bnPh4bV/zyxzdSk3ntB5LqgRwLmUqvmzHFl0JlpKRzc/Qvhbk?=
 =?us-ascii?Q?0/ScnH8M5hvn+Od0PMnp7295SABRqyVAzLEm3cOHi0FLq72130L9wzMIbyeJ?=
 =?us-ascii?Q?oPA+DOgsqvSTNnB9e2WOoG2Ln6ra9eT3GuhEPmyGi+0CLU5pVcpq2yknHdyL?=
 =?us-ascii?Q?MIz7TgCdsMfowHos5UIKcy8aQYMHYxm1fb1VQRdWihe3E8AOj3YvFaOAPIJH?=
 =?us-ascii?Q?qhXviMP8Sn5MX76tKPE+ouq+7s2ZvAv+X5t66W7/r5RjN6Jb/1wtWgOuaz8F?=
 =?us-ascii?Q?CjH9EQF38GBemZsXg20Z8FVFuuAGeTqqwcstEEuuhoj+6iukxLOY45dG9T7C?=
 =?us-ascii?Q?IUiZ2dtfH18+J7puw1ZaaCPBbvCqgeKyr6hX+bZrzz8D34QUFi1AZL0l2swj?=
 =?us-ascii?Q?Hr3aQa/IkziVYTdYGD6x9g48BSK+wCFlQU5JzKKiRrInTKJbnah3Izusrk3j?=
 =?us-ascii?Q?JGq+rO9qvVitdh5gCQAhgwInSUjg/v1cigv7o2tZZPdwmiA5fGvbwYRYFql0?=
 =?us-ascii?Q?LG3bIvUbMPuYZgcYMLLmpSeMr/uzq4aj5SDDqZIhKfDW+1MSCBjHdu+Oa/QK?=
 =?us-ascii?Q?5lQW855wUkLvkOmp78SwmaxER95bZwwcFbV59YJD24vW0+kmnApItDCwb5bJ?=
 =?us-ascii?Q?sRgXIVq6gZ9wzpSfRr3YZAd9ZQjUi4tWwV6RUwsGemWEAEk40lS4K1L9WsXY?=
 =?us-ascii?Q?S/EvxiHcNnFPenogY6EMHU1lZ023cfuvb43RorX1VjRazhbtNLL6upGg1h7Y?=
 =?us-ascii?Q?aDOHlzWBN0MVYp3c1ZNfwvQ2+b2qv42Lzw7mpHbZRulTnS4kmZ5xeoOtR1x1?=
 =?us-ascii?Q?39ZNLcUiWqlmgac3tLU+iGDso6CGnjjLHcPqMyUlkCWkceh7xd0sOujZzmyS?=
 =?us-ascii?Q?qABnbyum3t6wxlHTgXwb27tVs8RslbFD92qDqicIsuQq5iUE6BkkME6G7bsj?=
 =?us-ascii?Q?3RlYnj/jfCzP1GI4uhch9hVv6TPqJTiJJKzoDHslNHO+ONO8++Yv2qLpopUu?=
 =?us-ascii?Q?5UOo77L3tg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d851d6-983b-47d7-9ebe-08df28639816
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:33.0142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bp4UE1fY/NIb5CusIaoPCpDneV4w5MVX0t2C2I5+qH1/43zj1dh9GzEQzJAr6KDZvAKlmLEGM3h6bVYOVAZ/BfT0pza3I9/tX5AdY98GOL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247661

ReleaseNotes: https://hypothesis.readthedocs.io/en/latest/changelog.html#v6=
-169-0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...hon3-hypothesis_6.168.5.bb =3D> python3-hypothesis_6.169.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.5.bb =3D> py=
thon3-hypothesis_6.169.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb b/m=
eta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
index 93580094f0..0e7d97705c 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
@@ -16,7 +16,7 @@ SRC_URI +=3D " \
     file://test_rle.py \
     "
=20
-SRC_URI[sha256sum] =3D "76b9226962fe11d40858253a967eda95bb65811365286317e0=
118f4ec8f808c7"
+SRC_URI[sha256sum] =3D "b65749d7f7a2fddfb106bb57c9902db4ab25ce8724c821f4af=
50cc58891a6b7b"
=20
 RDEPENDS:${PN} +=3D " \
     python3-attrs \

