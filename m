Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79955C369D5
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:12:58 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [52.102.179.63])
 by mx.groups.io with SMTP id smtpd.web11.9448.1744898022627447438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 06:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=TgUfxPO/;
 spf=pass (domain: nxp.com, ip: 52.102.179.63, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFGMXKPx2iq1JmsezPMs3tG3vbdYVhecnaoWCZEhgJVwMcDp3aniFxGl6rlOf2SABZMMPR2S6YRfZ/g3wU59c5E3N3lGSViweK6GcxKKjwcjR40T1zMj9q+4ljT209WX79aC4cMw8fgsvW9DS1E0+1tn4LgKcNS58LRHWIspTa3B+SBIhC/9daiaGvzT24K6FvGsZHz+L8d+KrY3Z2hJ46bQCsugOVVOhBYTAdequQPaqyJoDfn5l/JLwYurQHZBv03Auj2hfVtUBPJinacPid6zjLW29eYWrkLe7kvW5XYQM8ykNs06xOTsDJ5GtnoMrjALSk3ndbQPbnfCoMD15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLY9dZyH31tbQowQJErO2zbBXg4JV1zccpMpPwhN8NE=;
 b=Lh69DrgVxtro8o4j4MSjjUjGK7lzmNQaR5I3g1KPn+Jj5yXt4Slh+NacCeChtB7vEevoszSTDPTKi5Z3K2zNm9yTqbAIawo42QdCWegFElCJ9tcsCeem0XTs3HicVbYwXFjr9DS4BiXl4BKoFDSDzwgU8E5+rtzzTGvKhgNtj6hv9wSGyirB9qfyMhkeYUzN1BhuDvlAKlMqIn9VdHs79DmCf1TTbXiVT/lvH5NiNLlUGBRkoE0k9nAsrmrkQ3NIrql5Hxcz9sBizHSeYZOahkM1HTfHhV8b140nIUM/kowsdD7jUihwy4piCQckskJZ8+EHtnbKz0MqFUyQPHoC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=none; dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLY9dZyH31tbQowQJErO2zbBXg4JV1zccpMpPwhN8NE=;
 b=TgUfxPO/FBrV+/NBlpLmcBcUy1rkRPxYd1FwgmHSLplpmNg2BvXKpLwbAl0icktWpynFshOi23GX57g5BYFA9SlNnwcpj4kI6gCpIhMItmizktytbtOBIWAdUVmGzwLZXme+hJTdfi5/awR0S/Os47mT2WP41s0vg9jhExoC6VZbzM3aDOvOsxdZtRq6Z8r1EJyHLJZ8YupmJthRBV2+ku1ifVqvFQzJc+57HKs2yFAqI+LqIfQcnKg+D00Y+6+RJ1JPEquxPGfjjCRBadivQSOVzRI3wVOqAL6exTvtW7GUi9irknPsxt0C6MIYHKHHbkfGzmQm+IDBlb31yTYq2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI0PR04MB10319.eurprd04.prod.outlook.com (2603:10a6:800:231::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.37; Thu, 17 Apr
 2025 13:53:41 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 13:53:41 +0000
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v7 3/7] toolchain-scripts: Export meson settings for SDK builds
Date: Thu, 17 Apr 2025 08:52:45 -0500
Message-Id: <20250417135249.1720715-3-user@yb20>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417135249.1720715-1-user@yb20>
References: <20250417135249.1720715-1-user@yb20>
From: 
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI0PR04MB10319:EE_
X-MS-Office365-Filtering-Correlation-Id: fea11133-1f7a-40b4-6bb8-08dd7db74308
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|52116014|366016|38350700014|1557600111;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?o5QoFSBO4lDo2KQT4b7oWt3YvPxek116NIU55FUv/V9Bfy17gnWXSsfBuWsw?=
 =?us-ascii?Q?YoGHW4hJ5fyxzhaGcJSksYaMFfAOuan62LuNpM7lc1yhVSTrtEmZmLAVSPdt?=
 =?us-ascii?Q?tFJsB4dX98YXrmEUB3pZTTS6ccntJ14lB94QJnnvTXSXaDFERLmfPx/cw4ot?=
 =?us-ascii?Q?DX9+6R2mHJ8MmeaXS6kj1aUdpy4xJSX3orYChRfij2nl2LQibAffUJdo7pQP?=
 =?us-ascii?Q?NuugItmubd1T+bCNjwodVq0hLobpXBabtVgrc7sO2tBXCyTnP3NzJv6aG0cf?=
 =?us-ascii?Q?hkSQ6yKG68CMxLdWx3l93MjR6CcS5HB/2OiYmx6i4nYtr+3FiNlTUYLrAFEg?=
 =?us-ascii?Q?KCNuf177t3wBnwV0HcKblcG85mVFCwSbl8vScdtt7HjaZr12RgvIyboMTVFR?=
 =?us-ascii?Q?a4MAW3VlAHHVl1zj8AJAM9hX9L18dQjJvUdWhFTVw2HuWXgU6/SOOdi45CNs?=
 =?us-ascii?Q?jss/ndVJIznE9gXzIhX6u7mfUsc4tHAJ742qLJm5JjA2qumh6qt+SLMwHTfr?=
 =?us-ascii?Q?RGcURc4W98+h3JcZpWm7Kmk6ct7diJhsqd6Mlbh0qj/Wvur+nxhf9yn4mNzn?=
 =?us-ascii?Q?KhxzUN0jeFM1tzZZK74qKJEb0UG2n3ssF5NOYJUmUHUKltquJh48kk4gdhTe?=
 =?us-ascii?Q?wEEA+uhFqWrly3PmpqZhnScI9wi9p/acATXoNLXyhirxXzEb4/5NU55aSzxK?=
 =?us-ascii?Q?8ymDkKHQTUFnWROUW3EYPf/2XNlUPXxg5AUyxj9GXQ2G0zF+QavkxWYii1fz?=
 =?us-ascii?Q?QTByFlzoPAuliSqnLCbTa/pCUnqOCOzky8Y5lkwpRIz0LbePdbD+27pEQaKL?=
 =?us-ascii?Q?FzAJ+su6TCwCPa6HDiYiway54QX52qOwXnSl9KIgIRfOtpWgK1Rh8KZypXd7?=
 =?us-ascii?Q?mAU9muIScFZ0ZJG2dKpi1CCqGJZJbS6w6e3cwKwnTDswcv2JGb4iY+/ECK/m?=
 =?us-ascii?Q?mytKkxHktqvZ2dT+uaUrNLYKzQ8sElz7YINKoK8fvoRnDT9Xuo+CUiDt2Gg/?=
 =?us-ascii?Q?t04Mq8CNavHDt3VuczWBDkvwVAHojUbaNEREoILykvh8eaqp751Nty85H3xV?=
 =?us-ascii?Q?5/ZbkNBbg3nf95xMisRyB4rDm2L1xgM7Nei/FyKguI/W1J4okEH9fyDzSKmh?=
 =?us-ascii?Q?tPJIXj63qydE1QNsvOtiQHBTMgLkyfLD0hOU5AleEn7KD3BZAF5NglzkXkMu?=
 =?us-ascii?Q?y/wKpGkIqgLc5b284iYqR5gmo9HlDPpourNmIPpBotwL0krciAzsboOJ6a3M?=
 =?us-ascii?Q?vkKHrfnjWLASNRgqIMjtPnd6QsUFGFQiN/5EGH2etZGIFnB3frsvktVDgu77?=
 =?us-ascii?Q?q3x75iG7La7SdOXpWYAKOKx5YTonggxaVoUw/FHoRpiLbFwucLrNCShtix0M?=
 =?us-ascii?Q?U1aNHym6EG++gt+9if++YsskBYemcIx2ztYyLN2XYUE0FajnNJZIdEvL/JpN?=
 =?us-ascii?Q?Rqz98gthC5nZrRBsC2x3f6+ryMUtJ4gYdcSnvYdqdCrtmbnFhpyKxJbyO8V7?=
 =?us-ascii?Q?8jAfz7j0J3TN28WfdqD4LuM0HlKGdztYaUOR4Y5uIXtC14KGWzNXIVJoouHI?=
 =?us-ascii?Q?f5e9yk70pW2rVmjT5YCI991r6rfgmn7nNeuqhdDP4nLrancKZGkcIVDqhNRG?=
 =?us-ascii?Q?Mi8W00/3LDQ18/rUwUgAefjbzls3Tnom6e9RSh1MADULIv+S4w/msvhh8lEJ?=
 =?us-ascii?Q?GeAcVowHtBUcPw6KkPi94kchYktcRmHfwkEHEnitfnJQjCFiPLZmCeaZ9Lnc?=
 =?us-ascii?Q?4i9S8pvtwXKoQcRphvp8zd/QSEylm3QZXN6u/sk6dqehv+G4qtdEyJHHVhAX?=
 =?us-ascii?Q?x55YG8bLCe0OHjCPs6U9tK9C5a814zlXsKEO/ZGUKWq4NcSPbQtYYalP020c?=
 =?us-ascii?Q?yzb7zUg0ntMu3MdQ3C7RHhCW5xcrBQmrC6AmRjf7uz4IWHWuypJqORB2dk3K?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:6;SRV:;IPV:NLI;SFV:SPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(376014)(61400799027)(52116014)(366016)(38350700014)(1557600111);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C63RKSRO4aCmqq5NQ5ikfHuCv8d7zzsaC0sJyar9I7xJtI7CGwsa6E4vQwKe?=
 =?us-ascii?Q?k4yHE/mHLat46KWHjAi5VTRRilLMdBPKQj7642h+DhYJ48N9vpV4ChuBkrEz?=
 =?us-ascii?Q?yLvLsDE6HxeWaHPH2A1K3MbK/ZjBaSkrPzZNbCnOruQPf8AJ79wHiHGNO6gD?=
 =?us-ascii?Q?s7NdrNinCxPMI7KPfmE5tvaVvHStppJDqRlYvfLKfjP7Ne8YEw4YyZAhomEl?=
 =?us-ascii?Q?5qVn5gxvfn/1m/o3EShOlofH5Jufo/0lRc+J5yY56/1VktC5r7FF+Snmbj3x?=
 =?us-ascii?Q?Oj5GIm+meeKle45hvW8kue+04eTiKob14bSa4TlbMuD5B77fgZAZgtWguHRc?=
 =?us-ascii?Q?V+cEwklE04cmJSTX8NjeIF7OZ17Ho7ELdkiGh08JFSYJYy57+9fRgoNhdxXP?=
 =?us-ascii?Q?j6KjbIOFY3xAx7M0ZF/hVyRHZoAzWv2hICE97VslRbq8d+EvCnUlctuYm6O5?=
 =?us-ascii?Q?CzbNlVPO9SUSLLU78yezHOK7uW5ZXOaTHh5CkjCoItnZZ1kaCl8G6klrf05x?=
 =?us-ascii?Q?e70X8CPq8e9OTGKkpquXRJ8A0QoNkImmiDvcvO9CaPpm6j65eUroSe2cxhbM?=
 =?us-ascii?Q?wlGsBFpTe7i5qonDs4f69cIRYtUheV9at5KyAnOc14GRaUvyCM8Gl5r7s3Sn?=
 =?us-ascii?Q?geWVI9FXBI0FAqr8hZPU5QS7bl3tJXeqQ2GUFr1hx5zxccDAWUgFkMt6l11L?=
 =?us-ascii?Q?Y+zklVn2mkKxy7pzAVvQgzS6Yis10tVlQJ/Rm5CbP20g/ikMG43dISH9uv6f?=
 =?us-ascii?Q?AVtyUarGh1Y11Iqn9M7Fcy+adCSXIu+QZuSVSWXa2uDR9h3HDy4Z6GRxbrTQ?=
 =?us-ascii?Q?ytqGSuKB5XBF8GCgHstjHUFZNWFBs/+6HQ+DDN3/Q7bYOGGdURwaeYDqN2R7?=
 =?us-ascii?Q?+9Bw0SszAZJBq7c8uT0HlUJNGBedkCR9h/lhtiOkVa3bqplVU3MsSQfVhy4C?=
 =?us-ascii?Q?/UWwr8zCDEYoLKFZlAxpSlwvgS3xUR52NukpiFFVcTF4QrJn1P+Gye22NWYG?=
 =?us-ascii?Q?FL575xQHnsH5VMBlhWhjVCWkP/tvrFJ8v1A7eSJ6L2Swuu0+h5FVNGbjyGUT?=
 =?us-ascii?Q?0lq86Hx2saz6Chg0g7kalXfC9IseZ/rC4T4s3FZrKG/A1C9JSFmAKucLaZgR?=
 =?us-ascii?Q?TzDx9wkQY33LT+YNLaB1Jzim5G7K1VjKF6ujbxHFQphPOOGvHR5mG+xvhVo7?=
 =?us-ascii?Q?hzZEBVBz20zyrZebkGbppi50dObllG0DWMauY0c9+Y5AhnaCZkcDIHrGqPdI?=
 =?us-ascii?Q?/tPOEiuO5JVtcXxbUyyR71NC8mLzT0zswwDZLFA873K400TV+sm7RRIh95iX?=
 =?us-ascii?Q?RyhNGRznQJmM9y18eEF+39jbEIx0wlRAYyITXtZ4bjvZsBg/elX39OyRe5lt?=
 =?us-ascii?Q?QJBESZqd2zlCcb8WcFxHj1I/IcczCnjKJeiWNqAeoHRqcW6NCRker5gsDyUq?=
 =?us-ascii?Q?ZwyxGhqAlZvtF8D2vKRuVGAcFcEjUH+ZCxJvLg4Ba6bxycphzGxRXIKMTzqs?=
 =?us-ascii?Q?trwgGslpZn8hRWoynYUlOWwDn9nOUePUAPOjA3OgTFCE4O8hz+GU8i/8OdnL?=
 =?us-ascii?Q?SpFUKJICbHNkrj7rF5VSc4lytuca2G2F8Dg2Lgub?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea11133-1f7a-40b4-6bb8-08dd7db74308
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:53:41.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfMp2xRKDMhJCyr8m7pvViHWH9Ifz2gxKWBcvzuxN+/Waxevfeeo6LIkrWXfWLGO5dGPZOsINfouf0ep/dPjiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10319
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 14:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215086

Caution: This is an external email. Please take care when clicking links or=
 opening attachments. When in doubt, report the message using the 'Report t=
his email' button


From: Tom Hochstein <tom.hochstein@oss.nxp.com>

Create a new set of exports for the Meson `host_machine` cross settings.
This allows the target cross file to be created correctly from
meson.cross.template and aligns with meson.bbclass.

Note, one might think that HOST_OS and HOST_ARCH would be appropriate as
inputs here, aligning nicely with the Meson naming. That turns out to be
incorrect since the script is generated in a native/nativesdk build with
HOST_OS and HOST_ARCH set for the "build machine", not the "host
machine", using the Meson terminology. See
https://mesonbuild.com/Cross-compilation.html.

Fixes: [YOCTO #15485]
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index 9e4320f876..3053cd0f1f 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #

-inherit toolchain-scripts-base siteinfo kernel-arch
+inherit toolchain-scripts-base siteinfo kernel-arch meson-routines

 # We want to be able to change the value of MULTIMACH_TARGET_SYS, because =
it
 # doesn't always match our expectations... but we default to the stock val=
ue
@@ -72,6 +72,10 @@ toolchain_create_sdk_env_script () {
        echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
        echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-=
')}"' >>$script
        echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'en=
dian-')}"' >>$script
+       echo 'export OECORE_MESON_HOST_SYSTEM=3D"${@meson_operating_system(=
'TARGET_OS', d)}"' >>$script
+       echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('T=
ARGET_ARCH', d)}"' >>$script
+       echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
+       echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET', =
d)}"' >>$script

        echo 'unset command_not_found_handle' >> $script

@@ -101,6 +105,10 @@ toolchain_create_tree_env_script () {
        echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
        echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-=
')}"' >>$script
        echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'en=
dian-')}"' >>$script
+       echo 'export OECORE_MESON_HOST_SYSTEM=3D"${@meson_operating_system(=
'TARGET_OS', d)}"' >>$script
+       echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('T=
ARGET_ARCH', d)}"' >>$script
+       echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
+       echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET', =
d)}"' >>$script

        toolchain_shared_env_script

--
2.34.1


