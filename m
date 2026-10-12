Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA3BCA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:27:32 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3966.1791836850017089277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xdBq1plC;
 spf=pass (domain: est.tech, ip: 52.101.84.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIFKgGZV3ipyHR59SZLeDatXmlpw8ac1nKy2B8N6F8oEV8g5GZuMmHJ5ccacBKjmYsepldeikxoVxQGsRM8VKyEIbJWQeiE5qlsJlxmsaA5MtuRVeiM1xZ/faaARZx1Za5WXgWHdog9ZRBlU009PIkOb99d8+xlx2I8aejDFYqIU3xMbhEvr8ggw+cdbagJGTVzAlBvP1fiZfU6MjdGpbGi2SjkKyAEC1HgIA/WdbmRnKOPcl1/xHKg63O0Na2C5q1xmnFHw50SwMtqus1FGgL/FeHBAWOk0GYW3LQclfi9pzNyjLgURTFfKpXsuQsGrisjLZb/RR6k5fgTDEMfzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsJJzMaF6QsjxupcAJBWnQowEZGBU2gLPEmnp4hxHDY=;
 b=UdWUL3fygEgwfUcQUcfAfraE2sFoNGGunCq4Pyve7CyvskdCVH/YIZb5XHyu4nDhOy2hjF3ssb3BExI0vqWzVyyFvFZ/cNV7fG9Gv/9KkWpQ7OIQRbAG9oSv3CfkEaZ04fAOyt97lf2YMgMJf5wppMPC6d988V70HVLcMaklQIWLkFjB7bu8WFGoiaz+Rujt/YHyJR3jhNm8wadhCyqywqV+kceHF/Ql2rOEd4HONdizJ8Ue1nkjG1zCsWyWy4f+mW6uGP3of+3CizLg3L1tNl1DHgFWgwqa45jGFGhzsHOu7lBxP1enrmPAHGM3fOukql0t4iPfq9xSz77lN3qyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsJJzMaF6QsjxupcAJBWnQowEZGBU2gLPEmnp4hxHDY=;
 b=xdBq1plCn5hIYRiAo5Udiu6Nq1MEGZ/5UzreWN7SvPg62tYrh0Hh5a/z3srBYbb6xiDCNn5lKYscqueZJSXqYM5rfQYu019YO1hAwajaRcWEcWegFXxsPhIjJBPHcnJoX1dPA5g8C3u4pGFHEMJwlnXQIYV088gGQcCLitWrYJfK4S/t/2mNDQ2I7kGsWfZw4DRjvHuLLm0P6gdPVU/JsKla7hqNb58KE7PIpfpCe9eE1tFl3DV1JToR6QlhJgJ6cwIx5vDlQWLfFjxRFA1nSyCx0SgXVdJggtsSEgL37eM5w6InsJoLO+N5KI6E7fnhEaYM+dGJUooUFflQkwEMjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:27:29 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:27:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 07/10] gstreamer1.0-plugins-base: upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 22:27:13 +0200
Message-ID: <20261012202716.38597-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
References: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3295:EE_
X-MS-Office365-Filtering-Correlation-Id: 601014c0-5d0a-4d02-2233-08df289f3c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|18002099003|22082099003|3023799007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	KtPpAJSroR8FzPjBYBpJTHRyghHCcJAQ694vmW5dhN1KXelQvNbwlyzXPqa2ALFnbtxOlK+8xDahe1w+BRcuEIlPBtUlO2PmohCNVupf+7VRRoG1Xkf9TK+HFbL7PxSeJTINAh7ZtL7dT0X+cNQ0OETCi2ixouDEHmzcZHBVpN0EJn/5evEtSTGshMMxl/LDZqZWtpzA63rTkPyiO6v3mjIlepQbYBEC2Hnab92HB6EljtfiozbXMnjtYlwUx5LBNwYc2gw4KtaahxxP9jWGR5AM/ryWWUjmsGSx0JU0fYPlRPAV5aijjN6dVKx9UK5zNBJU3xtkEkmHuqrpMfh//8tvNvbrA7feXuFYOcjNkSp6JsVlHeQ/dI/pqdFVOZeM0rPrzLeXjQJ9SCO7klVaU6R0Eh4JHDBDWdeYhIi248QTdMIk0eglJJ6QOvealCy5IXyyjImj+Cdr1yhH0jPNj9TEKmD6w/DnPkSx2rJtMZ1IF+HRiYCaUjCU40lI3BCIeQYkaCPnsWirXF+RrOPH+iprobTCnPyVGpOyJ6w+/qKnMLPwGWMiOjnN3huCCCvlMyeDftZ5YaODuIwPhgy21L45eFxKV2hwvC8xjuSh/0w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PMndHtkHx6xTFfO6VeqFCMphj57Ke/019+THp9Xwqxs7s3aGyK+tdY7Qr2VZ?=
 =?us-ascii?Q?trvvcRqSKggSOk21GJ2HEwiV7HV4M3/h4XtgFt3sYIXq5geu9rRpaNiwUhPO?=
 =?us-ascii?Q?llkGLQ3HAUb3D6vkLQiQspD9c2+Q+HrXFQBcwwHa1nuPT+Efmyi91ZIHR6YW?=
 =?us-ascii?Q?hsX/mf4o7qHuNHyY2Tsj1Bc1OTjPbjbSL5x58jNdwbCDQmaGVKg+13SPeI/y?=
 =?us-ascii?Q?YeM1rCXnajw63hCrPSbuGNnJmh4h132Wt3lpNfvdJudtRN1emifGstvIZtDD?=
 =?us-ascii?Q?9dJzFMEJz6m+tE6jpHq6P9R63YDNLHWOKJsV2VupH1KXmJ6XIXYF79wnjgkC?=
 =?us-ascii?Q?6XezGAoXQ6rPJfp+ob3u2dQylkiGPjQ4bCH64HTfzMKGG8FMeeOs30ix+C8E?=
 =?us-ascii?Q?GLfhnB5mQYRi5nUEr250m2m3CimjruWMAb0YJNSIpaKH5HQjsiROXrcwHUT3?=
 =?us-ascii?Q?/JWWdec/9g9CTLmqBi3N2cKs0yskkGonGKbhRsk/PaDYgaNOGh5HmHKN2cci?=
 =?us-ascii?Q?/kdxjQjv4TEEI7RtD2oADTiXB1qmKO4QaQwKz912BCsTPFP68EygIeTVV5dd?=
 =?us-ascii?Q?xVWfaw8tRK0tFzlHsrM/k+B3OMvVMqA39rm3shD8CTbm7GDJyOMh1ptNS5sC?=
 =?us-ascii?Q?aNjy91pws1xc5+W9ESuQ1PFuQHL1EVp7tl8CKt+7rjp3+//ZOnX3+dN0tRu4?=
 =?us-ascii?Q?thaMZvOtgX6h6f0IxXafNNFArZmrg/FKrg1s3r6QY4Qn2qyhsp+2op99VyG9?=
 =?us-ascii?Q?TEqle91CCpz07k54tqj2ghoFRRwq963tpCqk74dPRm9fGeNExI2joHmGpkrh?=
 =?us-ascii?Q?G+amRTpfd2EkvRK70WU59hnozoIIK5JWcSS1AiCr6QQzQkSQpJqmsY8ESsO8?=
 =?us-ascii?Q?1kzre+u5AMQvfxWeAfBQ2Wgh6gRGtUyFRpn50iUgO9Ync49o7vplnNs0zjSo?=
 =?us-ascii?Q?1AXtZGUQqm8hf7A/tgLjTFbM0ORQHPGQLHRvL7THHicGeOTKDRzBj3TOsT/5?=
 =?us-ascii?Q?PaowpzNt7apfXOXkNkIAB8OtIlzpiojAwSZ9x6okjH6b6tUVJHb7T8EXmjwf?=
 =?us-ascii?Q?JodrfhvVJb5/0FZFh2TjmD4C1XMPVKf72XqMa9OA18qQdhfRJYFt+8w1Uo9w?=
 =?us-ascii?Q?3bKvpw159RLgbwU7qx5KTlMTB4uPsr+2gRAfGM86F60U91ddzJAxhmHxQvVH?=
 =?us-ascii?Q?YWZgni5pjLzMpYuLhNyApJl/YSRXdW/xrerDBBPrtxxFwx/0H4oS4o8W0vwW?=
 =?us-ascii?Q?srSh/HJs8Wz0bphsQIf+/nn8H6Gqs1v6SB+X/xK+vlmefHsFCXs3dZV90UR8?=
 =?us-ascii?Q?qBpkdPgQcygWQRUtD/XTDK8vtlPZ3S6QCe+guf00f+KlXBZrimSJozjy22SP?=
 =?us-ascii?Q?X/kuJ412SFVaPDPnSsnDzqU8lMcFfiu678rytZdWTXy6zI1SugU98LOo83o8?=
 =?us-ascii?Q?Rc2PVaPmHJelxsP4mdrZl4EaIK2sYpmFZ1+8Lr55t6juyg5p2IKwULE4k8iF?=
 =?us-ascii?Q?dEIGHuxqi2RLP1W55jY+dnr7wIhQehLwSNtH+OiaZH3R3GwypK90i6GZMAjv?=
 =?us-ascii?Q?Bp4bRwfvx1BulgDr5RYoFw7RoYvGShmv4qEkTryW2EO9CZHiFMIpqMxzlATU?=
 =?us-ascii?Q?2LG4Q2tBON3vT0V5WUM4QY/BQIkzm5QClaHd55NqBAVW/0pHpEGPX1MFd2Kf?=
 =?us-ascii?Q?yw+xUvNntZ9TB2rAOVg7pM7lOwVbFJ2+PE46WYhY4oQZ/UeLa4BjWYO0S9Pp?=
 =?us-ascii?Q?1yDLhJRyHg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 601014c0-5d0a-4d02-2233-08df289f3c7c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:27:29.0596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PMjNlOy8fB/14MQv/eDK/i2IeoL7NdGd5vltpS/MPIHch/p4CTDEgVInrp1ysuBVtPPRDL+DdjFtY+Tw0vEmFf4BUUMSkQaa5I6J5yp3nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 20:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247682

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8
- Refresh existing patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...1-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 4 ++--
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch        | 4 ++--
 .../0003-viv-fb-Make-sure-config.h-is-included.patch          | 4 ++--
 ...ins-base_1.28.7.bb =3D> gstreamer1.0-plugins-base_1.28.8.bb} | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.7=
.bb =3D> gstreamer1.0-plugins-base_1.28.8.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
01-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-=
multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-f=
rom-src-pad-when-query-caps.patch
index 342be9e38e..b01ec37fbb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR=
00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR=
00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From d130f609b6cd7281afa8704130251119d676b972 Mon Sep 17 00:00:00 2001
+From 40eaa1cd3e6609cf92f7e3caa70dced21a90f431 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
@@ -16,7 +16,7 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux=
.c
 old mode 100644
 new mode 100755
-index 16bf0015b64a..e17a14497a8e
+index 16bf001..e17a144
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
 @@ -1797,6 +1797,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * =
parent, GstQuery * query)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
02-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-pa=
rsing.patch
index d91526c054..305e631a16 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssap=
arse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssap=
arse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 253fe1cd715e9c25978e9157edcb16b0f09b3580 Mon Sep 17 00:00:00 2001
+From 7cfd9f7e7fded0c02966564fd9d60062a618d19f Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
@@ -17,7 +17,7 @@ Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
 old mode 100644
 new mode 100755
-index c162a542f581..bd8afd93b5ea
+index c162a54..bd8afd9
 --- a/gst/subparse/gstssaparse.c
 +++ b/gst/subparse/gstssaparse.c
 @@ -304,6 +304,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * par=
se, gchar * txt)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
03-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gs=
treamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-include=
d.patch
index e2a8ea9c7a..5ebd0cfe79 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-=
fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-=
fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 603aea3d1907fff299d7ba3bfbd85d341b311947 Mon Sep 17 00:00:00 2001
+From 95ed3557e398de576d18e8f9077b1c908838a83d Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
@@ -13,7 +13,7 @@ Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
  1 file changed, 4 insertions(+)
=20
 diff --git a/gst-libs/gst/gl/gl-prelude.h b/gst-libs/gst/gl/gl-prelude.h
-index 85fca5a0f4fd..946c7291351b 100644
+index 85fca5a..946c729 100644
 --- a/gst-libs/gst/gl/gl-prelude.h
 +++ b/gst-libs/gst/gl/gl-prelude.h
 @@ -22,6 +22,10 @@
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.=
28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.=
8.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2=
8.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.=
8.bb
index cff54545e2..f7ce3d71f8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.8.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-pl=
ugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] =3D "ed6e5410f496d171818763af2265e7977154bc7f9b827e98ac=
f8c5bed21dd5a7"
+SRC_URI[sha256sum] =3D "ade70e3381fcbb024f1f20aa9ede9b5654aeed39d5bd70b1a9=
8f53015e501117"
=20
 S =3D "${UNPACKDIR}/gst-plugins-base-${PV}"
=20

