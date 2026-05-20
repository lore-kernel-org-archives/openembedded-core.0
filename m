Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54023CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 11:00:50 +0000 (UTC)
Received: from mx-relay158-hz1-if1.hornetsecurity.com (mx-relay158-hz1-if1.hornetsecurity.com [94.100.128.168])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9617.1779274842132954977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 04:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=AzeC3r5t;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.168, mailfrom: hsimeliere@witekio.com)
Received: from mail-northeuropeazon11021075.outbound.protection.outlook.com ([52.101.65.75]) by mx-gate158-hz1;
 Wed, 20 May 2026 13:00:35 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekGyQAVW56iLzz9BiG73su6I18ebj8VhDX5aHlPuUp8aRboMXGu12uzU7qfDK4p2kcJtV7mSmg415gzpBev1VIKzTiToqZmZQiAEW7f/aFGvF8zrveRwwXG72sAroHNxbVyzobn9wV195bave19IF8Zza1y7NDujOinsl26mJ7Os1mUR+/uyA/TtTek7i41J2kyVuScLhPBGZfvXeuCaAzNWpmobwbLlG8ghSo0OwPT6Bsg/QTNxRnkiS6DnOQX0LERtVX61IR45o/nyWHgj/baCEa2Bc2cbbEjoKttGEdPtMlVNDCXwUvnV8/8r/5HGIQY36s0YH5tsdcHVOSdf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUWVfYj6yxL9vKF+GhW5henuuuDbgAMVJNrRgnZhJXg=;
 b=FkRG+PL2BhlXzm0pwNpT+7xJCQlBFKvV6R1mi4sYnMtFhHTWc1i7VHyAyDAm/3u3ZxqkkI0YP4hf2canKmtPdqycXF6L3VwXLZBTNZVA98oRqbilg+73YkD4TgbsMSF71elHZBdsjZQPIn4Y1uwo7wufZ3OjeHRrqQz2SS5MMzB/qkg4N8Ncdj9+Zwcws9udH1lrm+vUB5Xsyv+50n1oNZ8ehsjUbTzgcVGZVCcEyUuGlXqDfAh6PhMmqBBK87rE2Ehj1zkrsWFEHWytrOVkQOACTutvYcOPQfh1UzPPiH5jXGfUJWxfxAugnGnm9dNseFN4B60ufbyIVb87nudiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUWVfYj6yxL9vKF+GhW5henuuuDbgAMVJNrRgnZhJXg=;
 b=AzeC3r5tgw5HS47+XC8Lf5m37SUxbndQ/NR84/eswujcQtZD4zWXXvo+ynJyvCjrEji07a7no9vhXSZEvC/xVfPo3wNsdCSI0nmnWgJ6zuXFRKGgYaoxFoo0o4iwoH4nj+07+0TLfTDfJUqyiUMGsC3acyAj/F1S/8zwRQYU3x24jAv15BV7F/Y6hT+MFx3DrE+xnr3GI6rtRONG6UbnriQD7Zat0hSSMxZrIO00kuvufnRpNx6m4vRfGAD+ORubNv6s9llvO84F4NFaxSyorwXEHW4MoW/Xi/UEW8XdrAScuB3O6e4F+3CYqkQP6YFr+kjT5AqS88DjODPRFa1F/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 VE1P192MB0736.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:14a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 11:00:09 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 11:00:09 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH 1/2] util-linux: Fix CVE-2026-27456
Date: Wed, 20 May 2026 12:59:58 +0200
Message-ID: <20260520105959.3115597-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::13) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|VE1P192MB0736:EE_
X-MS-Office365-Filtering-Correlation-Id: 1718253d-e20b-428c-581f-08deb65ef564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|1800799024|366016|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	8VBcSUyeIrI5ydrFrlE2V6tu/HiJNeEZLgs2olBuUuRFDFrHen+A28vE+VfFYHKWA1ROpPVfaD2MfjMe+zFZenwXuPrciCLY3B9Xo5DeBsfXESMBnUPq7nZVYH7tQqAxX1iMiTdVo8cVcdBAKJJ3+9YAa7+XVYyJ/p/ivPMIhAkzv2jaau99KtxeaK7TzFn8wTUHpngNSMcP5eF9X9MB1An0eJUmpPKLxXR7AoUjmhmSwgVYjh5+iUaa5hJhs0X36354jNlratkP3RebxRtXEAFWEf3PdfV2MuyEYzNk2AMTPuMdVgmWh7TvdNVHMGKHtDBbAfWsL90j+SlwH6kMYgtwyi+DE4Ls9VoXZvq/lathBvqviIhmSH3uhIe9CdM32rg2nrtoBw2t7gS7nbNlRx2y7z2zmLRE2FP0mbiA6ezeWnd6boh3EkyMabfk8RlvZhyp6fXpxDxZarTfNBKgzEdg3KrEACrAUnF2tG/CtH9Lvyrn0YWVfwivYCVMk/2kWP13w5B7uiPAQ1qIyVa+Z6LgdHAuuF+394lQRmy8K2y9p/Fg06gD+AM+X3qH6PHTq8PpeZHQzQ5AuYgwv3LZIZup8ks4EhS0nm7tDrwMVZakJ9Rkdk6lbWIJyZ8mAWLQ5nvhYaWCmJHNaVa/fHjuTdaisbS+Biim0kI+YXcHAh/x2Jxh25I6/4DRxTWvyuDZGnPqsWrcZYkkVFrmq2yOKA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(1800799024)(366016)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7vr/WchAEvaYzQs85nN9SBEMGJ2GR72umOgydgdkRDTsyvCMss2OIIxiYKy+?=
 =?us-ascii?Q?HXIFu7Kzde7zu5b+8ciTxOp8qjBaDpHr0WHdcv1ecw4w30lNBmi0rsReRPLC?=
 =?us-ascii?Q?ZZTSCbmJPuprfwzYBC5HC9DBMBpfm65PTcIERORykIxASsC1rdVG9ZcjR7MR?=
 =?us-ascii?Q?7rpAxFigAl7RUMGsrkECsks/0kI+7bXRbBICdekkt7s7zfJ5DyxIdatqea67?=
 =?us-ascii?Q?W2mW4YPzUio5T7gXOLYhqsbKyscwujAii4mSnRSKloKdbI/T3BBEjaq4TrlI?=
 =?us-ascii?Q?YrlyvY5DfW3ATLfQcSCZkoxGgXr7+q/XVHQFZihUG94Yz/HHecd7ykRmBB9z?=
 =?us-ascii?Q?GP8P56z6taBtJPpSs9UuFYB9fXq2ub+O+tHQxbZhvrV7/It/HzCVF2ppnyCi?=
 =?us-ascii?Q?pTCxHa0XxYWS+WLDD26rJ0XIHzT5mar/fCBBceFfPtbIrPiGTOn0gl8Uq0lk?=
 =?us-ascii?Q?QQaaQ3hmwDd+l4Ub2BdOMwtvYfyr+1bXzShsVGgssuE5UuZe8ApSdfuUCPcQ?=
 =?us-ascii?Q?hltTlwbfmFg3bIilEp93KWa1K5pd795HUa7N7tAoRz0f+trqm9FwujAkyu4b?=
 =?us-ascii?Q?YwZZe938nFEYYsv6QWL24OxVWMjoetr1r9t2rj9T7+yQjceP9QNOjEZqCKZn?=
 =?us-ascii?Q?JxtXjFESlvd9cM+8P7YwCDMrfe29Wk+mu63FVLA2nZQrh0Zr28Nsg2KmIsmr?=
 =?us-ascii?Q?cKsYA1yJZCU2rABjJM4B5PA8J3OeWesxBcnUAOfsKqFtSU3uwfPzicHt3EMV?=
 =?us-ascii?Q?0q4CT2YkIPBfVURANIwuK0n/KLlZtoCfvDWeYKBCAq4MNwk/nL+0ySz3fB69?=
 =?us-ascii?Q?KmVRYdQDfh1A1vnk6WDFnVloT2KRZ+s3z9WczYVE7JuHhHvCV2ANFMKjwmo1?=
 =?us-ascii?Q?rsiNGuBUCMqkYVYQVLU+a7c4NWHGlfV4YMJM2ci3XUSFYCOEVdSLKptrIxOg?=
 =?us-ascii?Q?G55qnvS1cTPlo/eMQNavWrVOrJMJnPf/o+onV00gUDFFULL4MjE77raS3CpA?=
 =?us-ascii?Q?7grTSVZVVHpx87Bnbxi6Jesvr6+xeYRAczv+erL7xrBwcVrJoEjphUXSKqm9?=
 =?us-ascii?Q?qjHimdJoI9DPLxpQduU9w3pV4sGc4UD5ywkE3NyhNgMg0fCUGCZ1TsOGNawX?=
 =?us-ascii?Q?0hgHInCN9iKddUXL0YPwe5RGreh3+HZdICKGbqgcsbjzb/puaEy2OzT3k+IJ?=
 =?us-ascii?Q?jFc5UHnoehgE6PeUGO01drC2rX8fkvQBLVY2YbsMHCsRJTMaBuxPYXBBW3Hy?=
 =?us-ascii?Q?FE3/B9d77vBeZcUZ/YNxdVxC3KOB4EPRHWpouLmaLPwx9V4SG7fUDvs3gjT6?=
 =?us-ascii?Q?A/k2IT2yRoz6Ogi1XwHUrn3IVS75PMuQfScWMxrNa1iXHxzbC3EHUZvHifit?=
 =?us-ascii?Q?XIMNFwH3PcTMuK//YTgBbCGmuJuFbMaRpXjXHUBGlP8QEoM1HX3Hy9Fus3zm?=
 =?us-ascii?Q?UMhz03wxT4ildHjmO9u7PsZXUXtXZeLHXpRUlykmT0vUoV2Dd5vxZbNtXbIG?=
 =?us-ascii?Q?P4o5La2YCqt4RpzzuHBXShKZiJje3Kh4SrR/9NbWs1WniM/ezvQcDCE/oQuq?=
 =?us-ascii?Q?4ywqmtcTP1HU32uOtBA1Gq6q7xfB+c5WJmtMKnPTz1yxKSDvfIS2fY1wgjvV?=
 =?us-ascii?Q?abOpG6PSJDsNZj1g7fgkTGM7efhNIaKA6WHlDqk3LOUAP2h6OXMkN72SAS/o?=
 =?us-ascii?Q?IaiVlUxtfc1cYdtz3q28s19epvNne96w1IVHR1yGzf+2R+xLGT4CTJ0nw7VM?=
 =?us-ascii?Q?oL5lAHUTkihd4QpAgLv2fnGq8yxnZTTPutxQooJqCtAtsfPz0HLamj3lBZ9f?=
X-MS-Exchange-AntiSpam-MessageData-1: R1efK1DfeTjTUg==
X-Exchange-RoutingPolicyChecked: 
	a6HtkRZMgW8alFFEVVJYoVaXiEaaRcPuEqwmNh4UAxVgauxDIC8PWmNGtuKsdLR3dGfEtd0hJXz1MlKm4N58yucw7bGQ8LOWOkkmNDadk1GLgBZr/5+MHV3AozJezkra84TKpclVlfteTNztrzMqoPAPaWfUd4v6FAR4JLnV4p3bPZLPciSwyZRaanUHaQrviw7gG96vB4t2vF1xOVnGo/ZQSUnOLC2ShIxz3T4U+ETI6aI4xK/xSmL8pV1ucL2YbigBHjpOgL09CaiPpTjY9qeBNEQPrA54u9Tj4t/Ct7vCm6Tv1noJ6Vg0PgP3EfteDzULfDXy2RWysTQqbV4W+g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	9YyLs1ja3tefH2sfPMrpzOqL+3xCv8R2kzecQyhJE0QXoyqMO0mzI6/QcKPqRUJ/r1jBWTEEz0LqSiq7SzPstSkTFHHVDD7eJn8RRmQu3qS3b17C2yY6JWh1zm5g1WzaSEs8sPIozKpfJIyX7JCQxrE4V6902+lVjCnEx2rwI7n8recRi6Ntg0VJ2rscaUJyRh0pIttVWs1o4L4lK/uGCflnTHYlMdHxnz096TZqFE3sUiLsNbeRJLiV/O6JCpMXlH3NXAidKW87Oii/DURaExojW8IqSCVQ5AqS8Udecda3F7V9kYcXz+A9/EZxB3pPw1HSIumXC1nEDNA2OdiCA1k9/3OVpr3qNsCJ+i1cMEBxHkgAdBuAhcqclnciez6F7FLyvG7LOJ5hqbldkvN7b2sIkT8Y4KWWZDdDP2GWMdv3/quThUSL6oFTQaY4tYozv1haAGnTDaTBIbO3l9rqCAJgp+iloU4SsDwEFl6XhjIu+Bn/wkj96kq7msOvyaIugNd/sxNbA4byXS27YLiVV467VGxYL8kUDDOdwXkeF9IxghiRqXbh+eFbTXR+8Kc7IaRlSbF2QRElv/aRC+eXFOmorlJQzJOTxSXY326nhOXbOXDCd4bWu3BX/ob+F5LM
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1718253d-e20b-428c-581f-08deb65ef564
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:00:09.4333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XudGPtmMVCUTf/x5QR+zfuSRteM8YNDHalN3GJuOxWeVIEFkSvj1fBJvVEp6hePZJGXM4KGtyhHBNYav6DvFWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P192MB0736
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate158-hz1 with 4gL7qJ3zfKz1X3mL
X-cloud-security-connect: mail-northeuropeazon11021075.outbound.protection.outlook.com[52.101.65.75], TLS=1, IP=52.101.65.75
X-cloud-security-Digest: 0ab3ef9b6d89e5a1aa3dbfea924cdf7b
X-cloud-security: scantime:6.771
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 11:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237446

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as 2.39.x upstream backport of [2] mentioned in Debian report in [3].

[1] https://github.com/util-linux/util-linux/commit/79164668a412b71fcb1495c7d299cc5e9741fa30
[2] https://github.com/util-linux/util-linux/commit/0ba0f14caa812349424df0da00ac2d97fee9d972
[3] https://security-tracker.debian.org/tracker/CVE-2026-27456

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-27456.patch           | 115 ++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-27456.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4797682c5d..8380419634 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -46,6 +46,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://sys-utils-hwclock-rtc-fix-pointer-usage.patch \
            file://CVE-2025-14104-01.patch \
            file://CVE-2025-14104-02.patch \
+           file://CVE-2026-27456.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-27456.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-27456.patch
new file mode 100644
index 0000000000..4a5fef26d3
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-27456.patch
@@ -0,0 +1,115 @@
+From af0b619f8eb15f738c69e33e0bb3a794e9cccf17 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 19 Feb 2026 13:59:46 +0100
+Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink attacks
+
+Add a new LOOPDEV_FL_NOFOLLOW flag for loop device context that
+prevents symlink following in both path canonicalization and file open.
+
+When set:
+- loopcxt_set_backing_file() uses strdup() instead of
+  ul_canonicalize_path() (which calls realpath() and follows symlinks)
+- loopcxt_setup_device() adds O_NOFOLLOW to open() flags
+
+The flag is set for non-root (restricted) mount operations in
+libmount's loop device hook. This prevents a TOCTOU race condition
+where an attacker could replace the backing file (specified in
+/etc/fstab) with a symlink to an arbitrary root-owned file between
+path resolution and open().
+
+Vulnerable Code Flow:
+
+  mount /mnt/point (non-root, SUID)
+    mount.c: sanitize_paths() on user args (mountpoint only)
+    mnt_context_mount()
+      mnt_context_prepare_mount()
+        mnt_context_apply_fstab()           <-- source path from fstab
+        hooks run at MNT_STAGE_PREP_SOURCE
+          hook_loopdev.c: setup_loopdev()
+            backing_file = fstab source path ("/home/user/disk.img")
+            loopcxt_set_backing_file()       <-- calls realpath() as ROOT
+              ul_canonicalize_path()         <-- follows symlinks!
+            loopcxt_setup_device()
+              open(lc->filename, O_RDWR|O_CLOEXEC)  <-- no O_NOFOLLOW
+
+Two vulnerabilities in the path:
+
+1) loopcxt_set_backing_file() calls ul_canonicalize_path() which uses
+   realpath() -- this follows symlinks as euid=0. If the attacker swaps
+   the file to a symlink before this call, lc->filename becomes the
+   resolved target path (e.g., /root/secret.img).
+
+2) loopcxt_setup_device() opens lc->filename without O_NOFOLLOW. Even
+   if canonicalization happened correctly, the file can be swapped to a
+   symlink between canonicalize and open.
+
+CVE: CVE-2026-27456
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/79164668a412b71fcb1495c7d299cc5e9741fa30]
+
+Addresses: https://github.com/util-linux/util-linux/security/advisories/GHSA-qq4x-vfq4-9h9g
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 5e390467b26a3cf3fecc04e1a0d482dff3162fc4)
+(cherry picked from commit 79164668a412b71fcb1495c7d299cc5e9741fa30)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ include/loopdev.h           | 3 ++-
+ lib/loopdev.c               | 7 ++++++-
+ libmount/src/hook_loopdev.c | 3 ++-
+ 3 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/include/loopdev.h b/include/loopdev.h
+index 903adc491..d03e9b65e 100644
+--- a/include/loopdev.h
++++ b/include/loopdev.h
+@@ -139,7 +139,8 @@ enum {
+ 	LOOPDEV_FL_NOIOCTL	= (1 << 6),
+ 	LOOPDEV_FL_DEVSUBDIR	= (1 << 7),
+ 	LOOPDEV_FL_CONTROL	= (1 << 8),	/* system with /dev/loop-control */
+-	LOOPDEV_FL_SIZELIMIT	= (1 << 9)
++	LOOPDEV_FL_SIZELIMIT	= (1 << 9),
++	LOOPDEV_FL_NOFOLLOW	= (1 << 10)	/* O_NOFOLLOW, don't follow symlinks */
+ };
+ 
+ /*
+diff --git a/lib/loopdev.c b/lib/loopdev.c
+index dd9ead3ee..4da251812 100644
+--- a/lib/loopdev.c
++++ b/lib/loopdev.c
+@@ -1193,7 +1193,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt *lc, const char *filename)
+ 	if (!lc)
+ 		return -EINVAL;
+ 
+-	lc->filename = canonicalize_path(filename);
++	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
++		lc->filename = strdup(filename);
++	else
++		lc->filename = canonicalize_path(filename);
+ 	if (!lc->filename)
+ 		return -errno;
+ 
+@@ -1332,6 +1335,8 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
+ 
+ 	if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
+ 		flags |= O_DIRECT;
++	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
++		flags |= O_NOFOLLOW;
+ 
+ 	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
+ 		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
+diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
+index 8c8f7f218..ce39a7a70 100644
+--- a/libmount/src/hook_loopdev.c
++++ b/libmount/src/hook_loopdev.c
+@@ -276,7 +276,8 @@ static int setup_loopdev(struct libmnt_context *cxt,
+ 	}
+ 
+ 	DBG(LOOP, ul_debugobj(cxt, "not found; create a new loop device"));
+-	rc = loopcxt_init(&lc, 0);
++	rc = loopcxt_init(&lc,
++			mnt_context_is_restricted(cxt) ? LOOPDEV_FL_NOFOLLOW : 0);
+ 	if (rc)
+ 		goto done_no_deinit;
+ 	if (mnt_opt_has_value(loopopt)) {
+-- 
+2.43.0
+
-- 
2.43.0


