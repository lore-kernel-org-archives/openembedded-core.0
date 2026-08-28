Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E80BC61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 11:44:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4468.1787917485006109470
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 04:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=RjeKgokq;
 spf=pass (domain: est.tech, ip: 40.107.130.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctyeASMiyZcqSFVGYobMYUlWKruq72g0w6/or88k4E2g4X8oWlJ3hpJSS8iaOgSQEHA+4naevxAAYQ5EVJg5zv6+2E0LEkYcnAzkFMi1PBMJxRQIcyf01y8jSZu7+ugruP8Fp31jdQki3CuXBfnz5UPHFafckOKRSUhUFVGGc+w9uMXOxGbNsrhXB6qnuT33+KySepaxksSXxDc+gQvv2ZEaSCMDfKm+F3/4Nzs/tiMLvJdxZ3kJlob4SpD20Rnqx7dGi8J/al4hKRI8RJOA90eJ7v9igUFhgVfisNW390RMXPb1H3xjxrBiHE77l59PNRK6muEUK3kbSSkef+3F0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kFrOyGyMnYAjRfQeGExPgurzkjDBujOMQLfuprqsds=;
 b=SUxquxBwXoheewcoQlXfbMjNW+py+fmLxbFg3gWAyPu6eOZeZsnZN2Gx50CLp4s3eXg+wyXJ8blYFqdyKeec/CNXRHoydQI/EchtC32BrgsLR4ATq+iGV51h4kh4Z9YVxDAJVp5NlsGn3U2zUrxaKGeOOLpnZmovRAn430zt5W0ykvDJCQdDiw/qynmrIcu22Cj4d4f1LQPf6t2U/RfQQerXur/I0pwwb8iJttlUvjWX8DbKGQgOUVyLLy61Ohh+EWT7FlXzHZSv61oZ4+HwSUJAvwWe3R/ewd6v863o48ppFmmSeyyHlaZMDfCr07RQAc8ka+sybvYacdx4g+Fqzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kFrOyGyMnYAjRfQeGExPgurzkjDBujOMQLfuprqsds=;
 b=RjeKgokq2s/r5AxHzIbF1a8r0Zxw4do/jOYRQuu8b4NmGEpgqtHpLIIDQiGf0zIM2N6qxqVRLh9NjlhP8obtl135q9t+uAdOC+S1ZUP1K4i1OCwM3FeFSEnd91kff8dcZxQU6xrg3d5bFXRzzttA1z5twNgOVEWLrKSETZZ09yLm0rqkCLKuRqPHEc3FmgKA6aDn4j4nHUiFDlDuCHZ0OUaBXXwEGlPVZyxOkYa+Mkq5I6k5iJFIbAw87nXrmNJwlR88LQ6Fzi/WTmJWent0fNP/bf5lXBS7Zhk7+o3ATdISBRIYdclnXqYJXO3AAaHg4VD9979PlsFrVgm2/8Gcow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB1000.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 11:44:40 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 11:44:39 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: upgrade 11.1.0 -> 11.1.1
Date: Fri, 28 Aug 2026 13:44:38 +0200
Message-ID: <20260828114438.36734-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0270.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::35) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB1000:EE_
X-MS-Office365-Filtering-Correlation-Id: ce20ec7e-3410-4992-4b06-08df04f9be5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|6133799003|10067099003|11063799006|56012099006|18002099003|12006099003|29003799003|25016099003;
X-Microsoft-Antispam-Message-Info: 
	dT6UsWQ3zbojCr+oWt1DGJ2gP2eOKKNWI0qTlfV4H4KoushO8AAvpId5ffssCo0brKOOyNwNgPwM86dWq2QB23lLwxSvLOUstmzfJVv+bcBVYnc6HMP8+JMCI84bOxObngUWauIey0Og7AitEv0dq+c7MdFqowEwK+G7dXo2Ermb1zLaT0wx2eMog7GqTcbGVKdBpwAKsntIbP2OaycGVyuUuGsILjj6H42GnbKS92sDxm75SBMgr00Ouxj7pPmlhpcn+MIVzRCiDsl7evmTTBBf97GLo+Bxwm3ChE79BJJmd0G/b4hHuXt63kgvXMY40LxxGQ2oC+mCEsx1usiOPtTGl30pKvxBuSJklSKD9ZrwoJLrp1A6kJGWkKzKbyfY66/JshnxDa2JZF7Z0O3iN7G9u1vYnd+5yTYzazsGLJ/7SmxpDjmeyyw81d43KIVxb1aYWZeXysz037a/ugInTtorP/x1sWkT1I+X5lIoQcOfqBYIaXbvzlCWbto+/m2RyvOztJAYnHMNjcRrhbN8GkUaRRF1jOznZemb2llKT9ifBrFry7BwhsQ8pIuMMwmgm/BHs6TAeX/6H2+vqZIFKnDMNh9GAJy4bkDERVeJALQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(12006099003)(29003799003)(25016099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qlDyIP/gdKvGaGC/KH7ZMo4FajxzF+Qauo+631/C70cgoyvEA/t7baFZBQUP?=
 =?us-ascii?Q?YWqR6JzImHJhi7CtsE7yFu8yO6wdQkDiCyb5iuyUVWRUopIen+Lizg3Eog/c?=
 =?us-ascii?Q?CgaR5PSruBqEMz29RSR3V9IGTR1usWfOKgOPY6dU96WCcSOpQWrKNdpQYYTY?=
 =?us-ascii?Q?YHHnnbYW/G4ywNMlNXrJErYbIqH/aBck44eeqJJwx7QwrKMYnxg4tATPxedr?=
 =?us-ascii?Q?xgtWqKbEp7UjHW3JY5JbHpHMKL/3+1k28WPwERS9SPwBHc28GRiOKdgk6Xp4?=
 =?us-ascii?Q?3PLDqx2e7AKUj6Ul2ftHh88KfK10vJZ2OoAZLf+f5wi4BMhdDGH41v+2M89Y?=
 =?us-ascii?Q?CHCEyR6dwzy4INDFk5zXqwmBJsrXCTF5+MslWqddMlq012BZNFtml71mSMWB?=
 =?us-ascii?Q?ST+ukrAUi6ayE6WLOSHcHIh6t+VCkO1M9cRs140k4CT2xLUg2rqH/OGdyPw8?=
 =?us-ascii?Q?RaLlDuMfUhKclMW+/iJL2L4FeXnyiN6NeqZEzpdUcD6JOOUKDiJCi5hLHXAt?=
 =?us-ascii?Q?97nUQtWCWGBSa8CjfJ5HvJ764lcGzrcDpLwOwPc6Q5LnHSvhM2D/lbPIiZsu?=
 =?us-ascii?Q?f4gStbPcnrZ6r3EduRB4spXdLgAFmwUevh7QsbRlrvcw86j/9hwIFw8PsCrI?=
 =?us-ascii?Q?Q+pY8CsSl0IxTtvvyE5AXJGTOR2KC5gaZS7kEUwvj9pezjB8t+J8Z/H5bQ5y?=
 =?us-ascii?Q?liV/ZvIiJMkBWB6VXznQXfyQGSng/X4UYjl5WQxpsHXS5A6WKKt3cOT4Bc4K?=
 =?us-ascii?Q?ZfEYuWb/f/nlcjk9J2xKbgahmH4Vx/FYkB0PFpMcmW262V/0GkS7pG98bA4M?=
 =?us-ascii?Q?JagaFlcDid9HyTSOwvguuYb6XuVMIM21GDY5HN3K/lMvWoK3cgHf9YngLXpi?=
 =?us-ascii?Q?n9CM0tsXT9TH/3KpXbO6IHZUoYA0zmlVGeD03E2oSLNofFatPe3lTwjDkyf3?=
 =?us-ascii?Q?Q3jU85Jmx3oVOz9d6Q0Qp7tWLh6dXqTokC6Cv3PRLq13ojB3HHyoWULyXyzM?=
 =?us-ascii?Q?uFVagbDLnSL0qkvJFv0nqXJ2YppUBWdfM+NHKNFu1i6fRtDj0jZnqmL0Tyux?=
 =?us-ascii?Q?meUmbipIVPn8kqTm6dY77C9vIHodgWyQ5Gh12JfgFJkr7llVu1BHsHGGjOSQ?=
 =?us-ascii?Q?L3KPHE9A6a0x/Mn7skLXIIQGYMX/8KVEZXNgTMd8vDxRw3KOVm9+C9bdRnmh?=
 =?us-ascii?Q?D9MyV9LesqYEScBDZs0eIBmGixzwEB5htM57XGzhar6rG4+JVkOxdoQXvU5S?=
 =?us-ascii?Q?5YhM0Oju4VeDy7sk6o2Ka9+KHR+c+I3hR9TPOky8DRGa6TncUSQJnmeMsLpR?=
 =?us-ascii?Q?xxxOnIphdSWMBx/trj63IeAjWyuukMtUofO+wpyelaM90YfB7Go38Lga8MVx?=
 =?us-ascii?Q?Dtmisc/WEoq2lktQ4GfsHZmHp9p6R6jQGKiXAobZJs6eL/JXLOYErEM3bZi6?=
 =?us-ascii?Q?2sVUEWfrifO9+pK8N7n/Magkxtnb5d86/YCoUr2hulPFGEChKjxD+VcPoxoR?=
 =?us-ascii?Q?mQwd3+iZgw8trNF12ZI9v18n4c/aK6+pSGRlg0SVGy+x+LxiI6rxRbld2mTd?=
 =?us-ascii?Q?nbIcCygt7H7GPZ7AtIJcjVIlGOzXyYT5cdW3ZYY4lWW0Ffx6QYl/GgJgz4Fc?=
 =?us-ascii?Q?OuLAtkTILkKFfb/NYN2oVd0znasFAnIp9r4FfzkJnBw6hAptk2jvgeQF2yzU?=
 =?us-ascii?Q?pDqkTt2QZsHBwLATxNGfuDNS7mGT7kfJ580Zi6DUCcDry6f+19JTUKqbyi3I?=
 =?us-ascii?Q?4M8u6gIE5YFbVB2VoNXDTMz64krWBII=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ce20ec7e-3410-4992-4b06-08df04f9be5d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 11:44:39.8723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DU0t6ZNYJeIo5uatHvRWY5iip6USJnzypvpMzqLJe5QEv+Nq5hs0IcDDHmAcf2sv020qB6ABj6ycEmnASQgy2nDvBUG229JQHxwGwScQXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 11:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244534

 - CompareLog: https://gitlab.com/qemu-project/qemu/-/compare/v11.1.0...v11=
.1.1
 - Refresh patches to apply on the new version

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../qemu/{qemu-native_11.1.0.bb =3D> qemu-native_11.1.1.bb}  | 0
 ...ystem-native_11.1.0.bb =3D> qemu-system-native_11.1.1.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                        | 2 +-
 ...u-Add-addition-environment-space-to-boot-loader-q.patch | 6 +++---
 ...sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch | 6 +++---
 .../qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch     | 6 +++---
 .../qemu/0004-qemu-Do-not-include-file-if-not-exists.patch | 4 ++--
 ...u-Add-some-user-space-mmap-tweaks-to-address-musl.patch | 6 +++---
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch            | 2 +-
 ...ts-meson.build-use-relative-path-to-refer-to-file.patch | 7 ++-----
 ...ine-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch | 2 +-
 .../0010-configure-lookup-meson-exutable-from-PATH.patch   | 6 +++---
 ...u-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch | 6 +++---
 .../qemu/{qemu_11.1.0.bb =3D> qemu_11.1.1.bb}                | 0
 14 files changed, 25 insertions(+), 28 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_11.1.0.bb =3D> qemu-native_=
11.1.1.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_11.1.0.bb =3D> qemu-=
system-native_11.1.1.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_11.1.0.bb =3D> qemu_11.1.1.bb} (10=
0%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_11.1.0.bb b/meta/recipe=
s-devtools/qemu/qemu-native_11.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_11.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.1.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_11.1.0.bb b/meta=
/recipes-devtools/qemu/qemu-system-native_11.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_11.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.1.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index a60050125b..f19cf70dd6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,7 +40,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
 UPSTREAM_CHECK_URI =3D "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-SRC_URI[sha256sum] =3D "6ee1d1a61f68212476b27108c26da5f449dc09b626d42f8279=
ba0dc2e08fa858"
+SRC_URI[sha256sum] =3D "079ffbff8a7111bbc89022107cbabf3bbfd614d5fc9d7cc675=
991196aca12482"
=20
 CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC server can e=
xpose host files uder some circumstances. We don't enable it by default."
=20
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environ=
ment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qe=
mu-Add-addition-environment-space-to-boot-loader-q.patch
index 94f23558bc..fe37551b2f 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-sp=
ace-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-sp=
ace-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 4c030fef6b75bfc9aed21099b12648f13f7626a6 Mon Sep 17 00:00:00 2001
+From ca9e6e8ae50494507e03b0823011f8db694d3936 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
@@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index 812ff64d8..daf929943 100644
+index 38c71f66f..59ab5eb3a 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
-@@ -66,7 +66,7 @@
+@@ -65,7 +65,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
diff --git a/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-S=
DL_HINT_VIDEO_X11_FORCE_EGL.patch b/meta/recipes-devtools/qemu/qemu/0001-ui=
-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
index a49710c86d..cf745a76a6 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT=
_VIDEO_X11_FORCE_EGL.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT=
_VIDEO_X11_FORCE_EGL.patch
@@ -1,4 +1,4 @@
-From 0a029de8c4c31507cae542b5413491283569467c Mon Sep 17 00:00:00 2001
+From 51d9d8afd2c84bb1c9aac7eaa966070465650afa Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 10 Jun 2026 15:00:26 +0200
 Subject: [PATCH] ui/sdl2.c: force-disable SDL_HINT_VIDEO_X11_FORCE_EGL,
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/ui/sdl2.c b/ui/sdl2.c
-index eccc5b0e9..ab91eaf25 100644
+index 1c97d23a4..abb19e37f 100644
 --- a/ui/sdl2.c
 +++ b/ui/sdl2.c
-@@ -874,7 +874,7 @@ static void sdl2_set_hint_x11_force_egl(void)
+@@ -890,7 +890,7 @@ static void sdl2_set_hint_x11_force_egl(void)
           * It's always safe to set the hint even if X11 is not used by SD=
L.
           * SDL will work regardless of the hint.
           */
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to=
-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to=
-PIC.patch
index fe9ca05614..54175cdaf2 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.pa=
tch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.pa=
tch
@@ -1,4 +1,4 @@
-From eb7f727c64b09337b39b231be65360134e2065e8 Mon Sep 17 00:00:00 2001
+From a3d17aefb316aa5075b7d18173a0c8b7a5253f7d Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -33,10 +33,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index ced7df49b..87f1137c9 100644
+index 74e25c60a..66e5427e9 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -740,7 +740,7 @@ int apic_accept_pic_intr(APICCommonState *s)
+@@ -741,7 +741,7 @@ int apic_accept_pic_intr(APICCommonState *s)
  {
      uint32_t lvt0;
 =20
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-=
if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-incl=
ude-file-if-not-exists.patch
index a4150620d6..06fe1fffde 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-=
exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-=
exists.patch
@@ -1,4 +1,4 @@
-From 33940327a10cd5dda9d417cceef47fc34e9e269d Mon Sep 17 00:00:00 2001
+From f2cb51b141e139e19eea5d876c84fe269172c83d Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,7 +16,7 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
=20
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 11d3b41df..2c36df57f 100644
+index cfa68dfbd..ab2cecbfb 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
 @@ -117,7 +117,9 @@
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-=
mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qe=
mu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 28988146a8..92be820eec 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tw=
eaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tw=
eaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From 072e2a2a97e0376e56d975c984db3f8584022849 Mon Sep 17 00:00:00 2001
+From ffae8a8f936fdf7091406e5dcbbaea35a72a931d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 =
bit
@@ -22,10 +22,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoun=
dation.org>
  1 file changed, 5 insertions(+)
=20
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index b635b6a21..a5a617516 100644
+index cc0c2ee6c..5afd41319 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1113,6 +1113,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulon=
g old_size,
+@@ -1114,6 +1114,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulon=
g old_size,
      int prot;
      void *host_addr;
 =20
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.pa=
tch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 7a81278537..399ae065c4 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 2267fcad1416f1ceef88ab052f9d69efe26f7d58 Mon Sep 17 00:00:00 2001
+From 1089a784b43080391368d0691399a0fe53cb704c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-rel=
ative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-te=
sts-meson.build-use-relative-path-to-refer-to-file.patch
index 7af7876920..155322f470 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-p=
ath-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-p=
ath-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 8342d13939436afab61bf231574e116686484d1c Mon Sep 17 00:00:00 2001
+From c7472b944d0b86157eb464bcfe931a51a3cbbdd6 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
@@ -21,7 +21,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index dc3fb954c0..914845b221 100644
+index dc3fb954c..914845b22 100644
 --- a/tests/unit/meson.build
 +++ b/tests/unit/meson.build
 @@ -127,17 +127,17 @@ endif
@@ -45,6 +45,3 @@ index dc3fb954c0..914845b221 100644
      'test-vmstate': [migration, io],
      'test-yank': ['socket-helpers.c', qom, io, chardev],
      'test-ram-discard-manager': [
---=20
-2.55.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_S=
HARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-De=
fine-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 480e1c6a07..f60440746e 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_V=
ALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_V=
ALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 02ad3d36cfd395d05609540e23048e171da779ba Mon Sep 17 00:00:00 2001
+From 771d39b8871eb120cc0ff14fd413f22f29166d9e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-ex=
utable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-loo=
kup-meson-exutable-from-PATH.patch
index 7043c942b2..c0c65f5b78 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-=
from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-=
from-PATH.patch
@@ -1,4 +1,4 @@
-From ef9ea8e83468ce974079964a5104df170beba85b Mon Sep 17 00:00:00 2001
+From 44085938163d0c2472fac9af1aa53bba55572aac Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
@@ -13,10 +13,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
=20
 diff --git a/configure b/configure
-index eea903067..217af781f 100755
+index 6ddfe4b53..13cb19ee5 100755
 --- a/configure
 +++ b/configure
-@@ -981,10 +981,7 @@ get_pwd() {
+@@ -967,10 +967,7 @@ get_pwd() {
      fi
  }
 =20
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-p=
ython-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qe=
mu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index bb4398f474..e20d5aa8c9 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-v=
env-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-v=
env-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From d62f78fea47f4b32fd0f48c46253f161cf305547 Mon Sep 17 00:00:00 2001
+From 5c1e4efe14f9e73388aa97b6265b9f13fcc63182 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meso=
n
@@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoun=
dation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/configure b/configure
-index 217af781f..cf8666337 100755
+index 13cb19ee5..b354aa9b1 100755
 --- a/configure
 +++ b/configure
-@@ -951,14 +951,14 @@ python=3D"$(command -v "$python")"
+@@ -937,14 +937,14 @@ python=3D"$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
 =20
diff --git a/meta/recipes-devtools/qemu/qemu_11.1.0.bb b/meta/recipes-devto=
ols/qemu/qemu_11.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_11.1.0.bb
rename to meta/recipes-devtools/qemu/qemu_11.1.1.bb

