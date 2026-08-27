Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77A5C5DF9D
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 06:13:25 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30407.1787811202855266820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 23:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=oJOnaGlO;
 spf=pass (domain: est.tech, ip: 52.101.72.53, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/Z44dszncbM6WwhL8kqxNK+7hIqMX/2H3GgyMsXY+FSP2/5KTGP0tdqLUz3cf2kNBbS8QoD5+p5LSpmc543Fq4+qHeJP3VIDYRYhxVoCkTMfNKmM0iPjiCNY8a/A5aSCjgJ2Kx+PvzWiW7wZd79G772WrtI64udM4S8LUMu/YUriMUHsnmuUJyqdKGNAIES9YbOfbtXs/A0Nt8DQufm4X9Lkp45w6iJr1xiEeBGvFYUJUB4vwqU24uD1XWbX+JJOFAzFZuNwxUXCtAkB3zHT8Dptt3FySWDuB68fE8WxPF2wkarUK+kxUeeFAM+uYERmg1Wu+AS3ncOrjr3YOKX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBWcOa2BjbdtrTJfBs7ZP+TDL9YW6wfr/CfcWRF5RT8=;
 b=heIR0xQl0f8K07yKEmqadsOx+Lf7X+D4yQSSuITaA0qz2qSiIhi/SY/HgiHPaVa9TGjtvVjagJelWFa1wipqLETnrYRaeUAMgHiRRt9qaQ4JDaAxnD63WnZdUI/7gcP0hloD3kGlJ5b165DT9x/1CQIWIMSbJhhXHQ6CnJWD7IZ32tsOqq1xzqARK/LCVI8uPV/A0Y9PHwqhlpefgkpHjnoyOkXf3aUcXsxQ6mwB5uEchszkTmfpcyglh8Xr4XsmTxzaiJy2NW5a+riWLkH5fwbER0V1tq7HXRhuX+a/IkmqyH8wL8enwEJo2rz5Wq2pJBVsBr74xLXrfZKOLN8ktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBWcOa2BjbdtrTJfBs7ZP+TDL9YW6wfr/CfcWRF5RT8=;
 b=oJOnaGlOLC11sOYuIgIpGiqBTYCmXqea7NjINIUKbUEHJdqGPLwpAYIBJXrIwWUTXnSfo6JUZhm4ZTvll4RxPqRN78kxdVaAxHcHqcv2g3r8Ytox8dE7IW7LqnqCLzs+bWy3BGYw6fy1hLcjSilkzeuB2WlKaksUFkzWrgcRefbElsKgV2D1MH70Jd5Rmg9sH34/9LWxdIdZL1WHXBhMbo9phJYIJSfpKAGl6CVavhguyM+ChbnbXcDhXkOszFxfNsGJOPEqNr33RoIRc2TZfd16WyvXP3UcOxRzrALPVXBvLNznZ3xkVdFBpxYOK2tv1S/rXQY6NuWfUgM/f8nK6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB3615.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 06:13:17 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 06:13:17 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] harfbuzz: upgrade 14.3.1 -> 14.4.0
Date: Thu, 27 Aug 2026 08:13:15 +0200
Message-ID: <20260827061315.71217-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0174.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::17) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB3615:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e1d852-aabc-4168-e5c1-08df040248f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10070799003|10067099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cxyqJ4M7+WNaYURjDOdajqy2I9LAX70NTVFUgWytS4Yk0al7UlZHLHa5FxbgO+YJ8WWwnDGuDvfoCtwx8vyMLWJXeI83CXmP0SJ5n9VoE1xubZ4xVsivRcBDrbO0rPHV+Kf9WvhpkYRjtmbCyucPuJXPDIeJA4pvEuKIKE9Aadc20XP5aN2jL9Kd3xstkHuF/fGJEvaA4hhgpNS9SNkTK5fQ2mEYeIXWRCDm7FyKhR1xeUvLqIIoAVuP4l+H0QqEaGneQ598gSWiKQTpsm/hznjkclaTIiOj9ub3dorPMiUvAbJRA4ydIeQUkhC0b/eBZeEL2W/9M1ErlINsq/JWtyih29AAlJdF3WE2sfMOqMN6BymQMqF+YXAvlAeoOoNsM+7wvAxM/Li9SPClORZ7kf/Pwk6eq24M1FOQBqoKoewqKhFcbBtG+PAePuotoHqKHfaNKhcXtVEx6uJu4luQew5CWyJiduXYnKw+gFBJfygUNISXd/LUHzOOoiE0gEsjubMbUkK8LbCyNZIQsJ+C0Gqwr9B89ST1PnsLVuIDD0x2hyB4B7guqcRja4Qe3B7gbYXLYdfsf5BoQcqV7V8thQ49ubTPOGVH4cyYEIGFzfeXv3MXCtBzY7qnkhaytSkxXTkColCeEHbUQiuEoUEMXjOH1dwczUOAaRoszoZh9tg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10070799003)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HkcQMfglCws9LcBbZmz3O6jOCGOoB75DlzOeafjVic7+QnGW2lUmyv5iVCan?=
 =?us-ascii?Q?eyBrE4956pNZA9FE/ubI8Pp+b0/S17yyprkdckZjH8crVI2nMCAxcCq3ws4n?=
 =?us-ascii?Q?3j7lHRCLEuTUOLHrpHZ6KAkpWRuFjv2R7tcUzBNsAdkooauQ7uXaKF7+P/xM?=
 =?us-ascii?Q?bm//IYya6KE9qcmXEyxdGor49QQoHT8xo1hzXtcXFFthqLrfNPfOPB+/bWPT?=
 =?us-ascii?Q?CaAOTIBeicZ0lqNQpxYPllCxtX4M1c814UY9Iu8fiMwGBMQQFgfdhIFnW2bV?=
 =?us-ascii?Q?FZ99M0qi9l4Mx76i2NXPnkKm73C3TssqlOMHJmCzB5wlui0nivPmAYVDwYzC?=
 =?us-ascii?Q?z0dRVokM6XrECAYaf5PKGpyuRdUw+/QQwcWGxdQIdTaOVRG53gaeXuPQaw5f?=
 =?us-ascii?Q?YM2LfHJb+4ViB+s6TqdIWesu/GDQo4gTPc+My+QcSeLGubS91t/zOz9GfB9D?=
 =?us-ascii?Q?Lb7K67l6WH/E0oMKNDvo5/6ujl5a+oXL3WAiYTr4c/7iAIRsC17m7G3qvdMq?=
 =?us-ascii?Q?9Ymrh6YwR+z8w+bnWZAKXh6Jco4JcfivrwUbGv+3oqYQ27xVzoMt4xqIgDIK?=
 =?us-ascii?Q?QoiSo+1funqG9GXXKGUTTahJhGXymBm3TTGAGqDjSMY9rTV57F4r1K6zZGjt?=
 =?us-ascii?Q?2q+xgsAJ0Uhxwmz57T7DMssi8cFfyuxa8IsGa2fctImXe5ozUyM4IuCoQjGt?=
 =?us-ascii?Q?C87+nJ2J6SQiSyJbpiIo4+gM4cVh3AefDCNOsKzYRh1XM/Wgb6RX2sI1mUc3?=
 =?us-ascii?Q?Y0h3LOdv8ktdtRyzdAqDhA9zqAn/0cnZp6qTA2kYjwKAwBesfkpwA2ClmuTW?=
 =?us-ascii?Q?nnlzc6he3ocEwG26oPWtDHPJyfvQuw5d/wkk1qNSOPCkBAIBMAN8BshrdslP?=
 =?us-ascii?Q?+GRyZ/cHs9qsPnpFJIDUb6qk3tuFpEucBxzx4DBk3ldICloSYo1yvhJT3MYE?=
 =?us-ascii?Q?OBixk0twasAFxgxRzqpuqJ2n8okxF1rRzVDzjdDwikbfO/KVKE30MS+fY7qv?=
 =?us-ascii?Q?MRE4y7AZf9T7//KSjxmV+fA0hEM/AszdFXutPo6+bXYr/gdK0WszO+GVVZaF?=
 =?us-ascii?Q?BMjT4bgQPMiCy6u2B6TkWEX1tumskq86XKczi+0sDYnDUnque/J2oPuO4cFP?=
 =?us-ascii?Q?G4otcP0WoB3iXmU3s1glpsApqN1QMNYhLbdLRff9lISrTYyPI9ExKYFtOpHD?=
 =?us-ascii?Q?VcBxZDxuo3edx9vtwgKoHM39iXi1oiU3HnrIX5tzvrZqmBYjtYVtA8gaZY/Q?=
 =?us-ascii?Q?/0B2QqldxSozhao30XowYnGaR3BnsoPanEbSJf2JCAiz3KhvVPQ8dQ5DXJ4R?=
 =?us-ascii?Q?bVZ5gWW8ibdOyYxWw2d8ZJytk9kgRFIbvtQDdp+WRv+0p2QYmMsN4hsqtgiW?=
 =?us-ascii?Q?vwityfNwg127m11VUIDw3Cw23fGgDhJDbp3tl5SQWVpZCRItp01H5L3ichrA?=
 =?us-ascii?Q?xsuDA/DKiJ/eemEO5FXrpy1gHnsG6QdTGFJvc3Zqjmf9N0mEpg2HFr20fAjC?=
 =?us-ascii?Q?FTWhWueAR79jhInvUUCLth1CdM2etCTO7R5sXvrAJgwWFdTO0amkEwnU0/zV?=
 =?us-ascii?Q?D2zrt7Gj+V4m9yVCREI60O5okoopmlfXfy3qauPB0e9QADOI+c+9egH9wBK9?=
 =?us-ascii?Q?3nEYyOp1uZU8tRJfBbA0GXGg/Pgiznb/+IED6yjzSgOFtFYzqz06GNoZCin1?=
 =?us-ascii?Q?1gYIR7i2Q6KNqP6sjb/FNFq8A8VuXz0U8Y26WEti2may5SLOLSQDvZO4uT4k?=
 =?us-ascii?Q?CfCyGHZ01e3zXPcVxry5ZeBpvYww0a+UymPRDfBVldTPpFUFD8aDhH7x1k8e?=
X-MS-Exchange-AntiSpam-MessageData-1: dWISFjrqANcANIdHDoUvthhYiklXLazkXhY=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e1d852-aabc-4168-e5c1-08df040248f5
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 06:13:17.1578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLxiomAsshbFuKhlKmyCUzJc00pBq5tT39M2LgXKFChpUYQaRKeV7MPtN0ydxNuidt5VuyGAPr91w8eOHsrDMztqzMOYl/XIdLlDVBagJpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3615
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244451

Source: NEWS [1]

Overview of changes leading to 14.4.0
Wednesday, August 26, 2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Glyph positions and extents now saturate instead of overflowing.
- Arabic Windows-1256 fallback shaping is now enabled on all platforms.
- Fix cluster values and a dropped glyph advance in the Graphite shaper.
- Fix `avar` axis value mapping in fonts that repeat the boundary entries.
- Fix `avar` version 2 partial instancing.
- Fix `COLR` sweep gradient truncation and unbounded memory use.
- Faster subsetting, especially for large `GSUB`/`GPOS` and `CFF` tables.
- Faster extraction of the experimental glyph dependency graph.
- Various shaping speedups.
- Various fixes for crashes and hangs with malformed fonts.
- Various fixes to the experimental raster, vector, and GPU libraries.
- Various improvements to the HarfRust integration shaper.
- The DirectWrite backend no longer uses the C++ runtime.
- Various build, portability, and fuzzing fixes.

- New API:
  +hb_set_intersects()

[1] https://github.com/harfbuzz/harfbuzz/releases/tag/14.4.0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../harfbuzz/{harfbuzz_14.3.1.bb =3D> harfbuzz_14.4.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.3.1.bb =3D> harfbuzz_14=
.4.0.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.1.bb b/meta/recip=
es-graphics/harfbuzz/harfbuzz_14.4.0.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.3.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb
index 4f0d5d3ec2..a5c601b1de 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3c2a6=
7cfef01e99e4893d \
                     "
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "9dae9538aae2ffdf70cec31f2c27bf68e2aaeeae3112688467=
697d5faf6194f7"
+SRC_URI[sha256sum] =3D "2357ed966c6ced7bfa720b0640c0231065af01158fbea21509=
3ffa15aed44371"
=20
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-r=
eleases
=20

