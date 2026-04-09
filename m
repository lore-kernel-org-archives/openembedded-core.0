Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12310E9DE7E
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:29:49 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128076.1775726988283250098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=EzUXFjqC;
 spf=pass (domain: ericsson.com, ip: 52.101.83.4, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klXiQI5PhcsL3gYsuPWHz9PTMBThRtOLdAT/MarH9AHeXsa2p5c+Zj7zhVD7jCqHyWYukCJhSdzSkagIP6dDABqInPdfiCup9BZ3fM4m/O2dBC+mqQL0tWwYmyQdf3oVDGVXuHn7cE7frzeAAkfhec8Ki1iPaCky2Jc3GvLgtbvTuNBpajqg4S6NSPbp5587WM5jw/NLtXOYTFpdqISVCD4swqtZa+pzRdwzi2GkX2Glw33kujfLgKIjne9OiLV9oNKMDxJ+gWRowYjUi6tfaAnjgtOyOzLlmkW2GKeGQzI9xBraCPFXW4C5gbNaSZyafwrFH7sGKEBEKk/M6fDMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqWMdRq6cQH/siV07mm3f+zsBpaaq6VpfZB9NmAZyTM=;
 b=ED5WP+I0pqtzzqKDg3EzrJTQunnIzO9g9oVvvf29krEMwuGg8XbtlMFdcf5NB1ewlzIAa1IBS5x9vleHaKZGZY7nClzRvqN8TWe2AfDsKXK7yfO+zhhaLLkELoSWFvk0h/70LFGbKPZtrNiZMBXAg4PaL3dqZTuB5hU5PmoMHNBDIPBdvz6mE/sAcenIdJZMoB7a0nzPyTANUs51BQ3vW1Rgm5KwMBCSUjw+9YX/9OCVxiz7WFC2FqTtEaXpjVCpmyfYcw3OcUIs3jc9ADJ3A1DsSF4rJ3z6bGVvs24n6hGfvSPydIPZMDjhZEWUgUqRIyhgeQ0fbcPhxRoChL0SLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqWMdRq6cQH/siV07mm3f+zsBpaaq6VpfZB9NmAZyTM=;
 b=EzUXFjqCm7liPVu0KkPA4yJH/jAXaB2OGZYWZgGVwtlgcxh+s1ak1JiKu+Ol2hLGI3hciuxjC2g7sYAvdoH+jN2F24GDlpsobQWppWCkVv4Ua0fLWUkWypZ8deHIoZt+bhEawJ2R5NujTXV4mLjZDY77IXfnDMEsjXHHzuOoajsZ+Y8modhYp+6tIJj3zQJPWnJBqC520pH0akQIEpP1JmamUh+Sb0O5Id6KUx9Wmpv6Q5ZMNmcLlAjL0HyKSAuJPH3w5zXH+PNDruo/K/c3jBpeKe0JQAHTOTHEarNKGyiw7DNMd6Py3pwH/dfeihOuKTlnRANKAtvrR/I5Qkgt3g==
Received: from AS4P195CA0026.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::12)
 by GV2PR07MB12090.eurprd07.prod.outlook.com (2603:10a6:150:30b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 09:29:41 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::de) by AS4P195CA0026.outlook.office365.com
 (2603:10a6:20b:5d6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 09:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 09:29:41 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Apr 2026 11:29:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id E7C134020AA4;
	Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id D3255700DB93; Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH 2/9] gnupg: upgrade 2.4.8 -> 2.4.9
Date: Thu, 9 Apr 2026 11:29:29 +0200
Message-ID: <20260409092936.1740143-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409092936.1740143-1-daniel.turull@ericsson.com>
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B6:EE_|GV2PR07MB12090:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a56b016-b28c-4b43-78d8-08de961a8742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	SJRz+f2I/CH3eCRoUFCeBc3jx2OBRE6a1Q/mTWzHT6MedXDraDmrpnrruRQ0hv0lBsrY0NwDz7JmRpqzfu0PExKSNNx5+ffWOv4D3h+BSHBGkvJKv58iXAStCDF/J4uWAVA4buz8VgGJhz6vLiA7uCAx8cY5AmTq87enaLpbGHg8kWdeTmaHN2RraSEzT6vq62aMpAVYan8x0Vrh6AVyIQuYI3bjo/N0xPeIGHe78/7FP6tJIBdj4FsrHzRyTcsFz8kAKpkt7NT4WagKDLxLxc2My+/iipFnn0+VnsMA977SEpkBuGnBXOh8c7UYnICl7+WVwwCUurYNguqGK75SFqsaF/iL1AclMF6N9+FaFxfmT/zFFNAegd/xHJF2WDaZr9AbjZ5Vzu3jjpN4IFIwjhitThTpAinM6egAeV6zH0pljBbntuZlpGipU1coNTDIMDFI4aNZx9leebYiGmROLbH9QSo+c8qaHmD90kEJNuaiOESIElWn/tg5IgtrwlT+RYGki1c63vyueGsfNfQm/AF1pGRahoricj2IPg3xIIEoseTZPuSCyh0Da299seYkjjQ5kJDK0+4hpexBvmLwAg3RaMmH4X+WTUwIUOFFPKgW+gWXaOe9NmUg55XzU19rKGVnNqQpkC6o5op/lj5WZLBZj+BFnhE/GWGFOYL7YL1DX/BWQ7LCIf/+fP3Y+OM8L/EALeIpKLo05aqtNpiWe7p7lL4UUFVig0ib6WfdUQ7ufxk/8nvvr5rEON9SkoH23yIjYjKY0bUaE7IMlYfw2g==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WoE0yZ+vJ3daRiVGKemCr9UrXA4SpEnBZqialu5A5+BLxff2HICM4d4bAknx3FaAprddIm8SWMFJgy25XKyCeyqkeRt5r3NvIhFPQbsf3lvA9JUH9pO8ccTfpVu7fPcqB1Dc1M6WWALq0+8i64fDl62y/atmxzcnCKz8qWWTIeR5VI5psegLhZMwgT7KTZbPuFKwJDsEdoh56KzmwBENwkn9HLRmCOBf7Ec8AufFO2RnEcCpz9AnrlJ7oW0lxDQfk7fB1dOEP4+wy2j2OYtt53+ligXhIk8UimJX74JoQkEgllECS1HgETtI39BfAwcCvK5NwPfJEhi8PphZQgcz+WuT0qisaXwr5a7WrabqkCkuLjH1UbEgoESbq8vh+ha0TpajteKYLwldpJCZZ0mNt9XBdTDelyhmyKk/xEoX+7EozgzbHYofsmi/VqW5Kvvv
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:29:41.5191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a56b016-b28c-4b43-78d8-08de961a8742
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB12090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 09:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234903

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for gnupg: 2.4.8 -> 2.4.9
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

	Release 2.4.9.
	+ commit 21c7d29d6ed2eb891f7f66f83bcf764fcaaa6752

	gpg: Fix possible memory corruption in the armor parser.
	+ commit 4ecc5122f20e10c17172ed72f4fa46c784b5fb48
	* g10/armor.c (armor_filter): Fix faulty double increment.

	* common/iobuf.c (underflow_target): Assert that the filter
	implementations behave well.

2025-11-11  Sorah Fukumori  <her@sorah.jp>

	agent: Fix a memory leak.
	+ commit ff30683418695f5d2cc9e6cf8c9418e09378ebe4
	* agent/findkey.c (read_key_file): Free BUF.

2025-10-22  Werner Koch  <wk@gnupg.org>

	gpg: Error out on unverified output for non-detached signatures.
	+ commit 9d302f978bd718a7b477294c2f5b386bea6ca00d
	* g10/mainproc.c (do_proc_packets): Never reset the any.data flag.

	gpg: Avoid potential downgrade to SHA1 in 3rd party key signatures.
	+ commit ddb012be7fe2ab0eb713b33c50c22ac8f194fa6c
	* g10/sig-check.c (check_signature_over_key_or_uid): Always initialize
	IS_SELFSIG because it is later used to detect SHA1 non-selfsignatures.

2025-07-16  Werner Koch  <wk@gnupg.org>

	agent: Another fix for a regression with unknown curves and ssh.
	+ commit a4f7417531d7cdee2caf5db39667867497852fde
	* agent/command-ssh.c (ssh_send_available_keys): Clear the error when
	skipping.

	agent: Fix ssh-agent's request_identities for skipped keys.
	+ commit 6bf5696c8578782a25227c0806ce5f8abcafb603
	* agent/command-ssh.c (ssh_send_available_keys): Adjust key counter
	for skipped keys.

2025-06-17  Werner Koch  <wk@gnupg.org>

	dirmngr: Do not require a keyserver for KS_FETCH.
	+ commit 80d56172f29f8e7f2ca5dffa53235a33d5484bd3
	* dirmngr/server.c (cmd_ks_fetch): Remove check for a keyserver.

2025-05-24  Collin Funk via Gnupg-devel  <gnupg-devel@gnupg.org>

	common: Fix read buffer over-read in uncompress_ecc_q_in_canon_sexp.
	+ commit 57c1c96e7f5c2b94daba5ccc0070cf3ee52d66d9
	* common/sexputil.c (uncompress_ecc_q_in_canon_sexp): Only call memcmp
	if the lengths are equal.

2025-05-16  Werner Koch  <wk@gnupg.org>

	gpg: Do not allow compressed key packets on import.
	+ commit 23ccad05c68005b580c7b209e2242bb93893af62
	* g10/import.c (read_block): Bail out on compressed packets.
	* g10/options.h (COMPAT_COMPR_KEYS): New.
	* g10/gpg.c (compatibility_flags): Add compr-keys.
	* common/util.h (GPG_ERR_UNEXPECTED_PACKET): Add a new replacement
	code.

2025-05-14  Werner Koch  <wk@gnupg.org>

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 ...erride-init-is-not-needed-with-gcc-9.patch |   7 +-
 ...-a-custom-value-for-the-location-of-.patch |   5 +-
 ...use-pkgconfig-instead-of-npth-config.patch |   3 +-
 ...h-fix-find-version-for-beta-checking.patch |   3 +-
 .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ------------------
 .../gnupg/gnupg/relocate.patch                |  19 ++-
 .../gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb}  |   4 +-
 7 files changed, 17 insertions(+), 132 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb} (96=
%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-ne=
eded-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-ini=
t-is-not-needed-with-gcc-9.patch
index 83195b5bd4..0411e696e5 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-wi=
th-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-wi=
th-gcc-9.patch
@@ -1,4 +1,4 @@
-From e3adc816d2d56dd929016073937ba24e01e03cb8 Mon Sep 17 00:00:00 2001
+From f72e8441932e94b72eced585b70e679062822bff Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/dirmngr/dns.h b/dirmngr/dns.h
-index 024d6dcc8..c6e141e16 100644
+index 1f647e1..334acb6 100644
 --- a/dirmngr/dns.h
 +++ b/dirmngr/dns.h
 @@ -139,7 +139,7 @@ DNS_PUBLIC int *dns_debug_p(void);
@@ -29,6 +29,3 @@ index 024d6dcc8..c6e141e16 100644
  #define DNS_PRAGMA_PUSH _Pragma("GCC diagnostic push")
  #define DNS_PRAGMA_QUIET _Pragma("GCC diagnostic ignored \"-Woverride-ini=
t\"")
  #define DNS_PRAGMA_POP _Pragma("GCC diagnostic pop")
---=20
-2.17.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custo=
m-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-=
configure.ac-use-a-custom-value-for-the-location-of-.patch
index f957f6b55e..90c6d8bddd 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value=
-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value=
-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 6b581c43bd01f815db78a410fd3814fc5994171e Mon Sep 17 00:00:00 2001
+From e1ca1300720386aecf845aa9095e142a47c21e18 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -8,13 +8,12 @@ This should avoid clashes with the host gpg-agent observe=
d on autobuilders.
=20
 Upstream-Status: Inappropriate [oe-core specific, and only for -native]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 26d7f7b..e953c2e 100644
+index 94bc805..503979e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1921,7 +1921,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of=
-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-in=
stead-of-npth-config.patch
index 0e58fd4c4d..f1150788ff 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-c=
onfig.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-c=
onfig.patch
@@ -1,4 +1,4 @@
-From d9048788d906774b1475c3bb1b17e22455c2add4 Mon Sep 17 00:00:00 2001
+From ea7295ea8b42a7d378c33679d07e100b7d487dfb Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
@@ -9,7 +9,6 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
=20
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  m4/npth.m4 | 53 ++++++++---------------------------------------------
  1 file changed, 8 insertions(+), 45 deletions(-)
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-vers=
ion-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen=
.sh-fix-find-version-for-beta-checking.patch
index d664c36a1b..b669f43271 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for=
-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for=
-beta-checking.patch
@@ -1,4 +1,4 @@
-From 6a7f9b71d936847dcaeeac7d1b69d8299be4dd85 Mon Sep 17 00:00:00 2001
+From f273088de04ffdc38563a81bad7e97a143aee438 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
@@ -13,7 +13,6 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
=20
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  autogen.sh | 1 -
  1 file changed, 1 deletion(-)
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch b/meta/r=
ecipes-support/gnupg/gnupg/CVE-2025-68973.patch
deleted file mode 100644
index 4eaf7cdb38..0000000000
--- a/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 4ecc5122f20e10c17172ed72f4fa46c784b5fb48 Mon Sep 17 00:00:00 2001
-From: Werner Koch <wk@gnupg.org>
-Date: Thu, 23 Oct 2025 11:36:04 +0200
-Subject: [PATCH] gpg: Fix possible memory corruption in the armor parser.
-
-* g10/armor.c (armor_filter): Fix faulty double increment.
-
-* common/iobuf.c (underflow_target): Assert that the filter
-implementations behave well.
---
-
-This fixes a bug in a code path which can only be reached with special
-crafted input data and would then error out at an upper layer due to
-corrupt input (every second byte in the buffer is unitialized
-garbage).  No fuzzing has yet hit this case and we don't have a test
-case for this code path.  However memory corruption can never be
-tolerated as it always has the protential for remode code execution.
-
-Reported-by: 8b79fe4dd0581c1cd000e1fbecba9f39e16a396a
-Fixes-commit: c27c7416d5148865a513e007fb6f0a34993a6073
-which fixed
-Fixes-commit: 7d0efec7cf5ae110c99511abc32587ff0c45b14f
-Backported-from-master: 115d138ba599328005c5321c0ef9f00355838ca9
-
-The bug was introduced on 1999-01-07 by me:
-* armor.c: Rewrote large parts.
-which I fixed on 1999-03-02 but missed to fix the other case:
-* armor.c (armor_filter): Fixed armor bypassing.
-
-Below is base64+gzipped test data which can be used with valgrind to
-show access to uninitalized memory in write(2) in the unpatched code.
-
---8<---------------cut here---------------start------------->8---
-H4sICIDd+WgCA3h4AO3QMQ6CQBCG0djOKbY3G05gscYFSRAJt/AExp6Di0cQG0ze
-a//MV0zOq3Pt+jFN3ZTKfLvP9ZLafqifJUe8juOjeZbVtSkbRPmRgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgMCXF6dYDgAAAAAAAAAAAAAAAAAAAAAA
-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC7E14AAAAA
-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADwZ94aieId3+8EAA=3D=3D
---8<---------------cut here---------------end--------------->8---
-
-CVE: CVE-2025-68973
-Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/4ecc5122f20=
e10c17172ed72f4fa46c784b5fb48]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- common/iobuf.c | 8 +++++++-
- g10/armor.c    | 4 ++--
- 2 files changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/common/iobuf.c b/common/iobuf.c
-index 748e6935d..2497713c1 100644
---- a/common/iobuf.c
-+++ b/common/iobuf.c
-@@ -2043,6 +2043,8 @@ underflow_target (iobuf_t a, int clear_pending_eof, =
size_t target)
- 	rc =3D 0;
-       else
-       {
-+        size_t tmplen;
-+
- 	/* If no buffered data and drain buffer has been setup, and drain
- 	 * buffer is largish, read data directly to drain buffer. */
- 	if (a->d.len =3D=3D 0
-@@ -2055,8 +2057,10 @@ underflow_target (iobuf_t a, int clear_pending_eof,=
 size_t target)
- 	      log_debug ("iobuf-%d.%d: underflow: A->FILTER (%lu bytes, to exter=
nal drain)\n",
- 			 a->no, a->subno, (ulong)len);
-=20
--	    rc =3D a->filter (a->filter_ov, IOBUFCTRL_UNDERFLOW, a->chain,
-+            tmplen =3D len;  /* Used to check for bugs in the filter.  */
-+            rc =3D a->filter (a->filter_ov, IOBUFCTRL_UNDERFLOW, a->chain=
,
- 			    a->e_d.buf, &len);
-+            log_assert (len <=3D tmplen);
- 	    a->e_d.used =3D len;
- 	    len =3D 0;
- 	  }
-@@ -2066,8 +2070,10 @@ underflow_target (iobuf_t a, int clear_pending_eof,=
 size_t target)
- 	      log_debug ("iobuf-%d.%d: underflow: A->FILTER (%lu bytes)\n",
- 			 a->no, a->subno, (ulong)len);
-=20
-+            tmplen =3D len;  /* Used to check for bugs in the filter.  */
- 	    rc =3D a->filter (a->filter_ov, IOBUFCTRL_UNDERFLOW, a->chain,
- 			    &a->d.buf[a->d.len], &len);
-+            log_assert (len <=3D tmplen);
- 	  }
-       }
-       a->d.len +=3D len;
-diff --git a/g10/armor.c b/g10/armor.c
-index 81af15339..f8cfa86db 100644
---- a/g10/armor.c
-+++ b/g10/armor.c
-@@ -1302,8 +1302,8 @@ armor_filter( void *opaque, int control,
- 	n =3D 0;
- 	if( afx->buffer_len ) {
-             /* Copy the data from AFX->BUFFER to BUF.  */
--	    for(; n < size && afx->buffer_pos < afx->buffer_len; n++ )
--		buf[n++] =3D afx->buffer[afx->buffer_pos++];
-+            for(; n < size && afx->buffer_pos < afx->buffer_len;)
-+                buf[n++] =3D afx->buffer[afx->buffer_pos++];
- 	    if( afx->buffer_pos >=3D afx->buffer_len )
- 		afx->buffer_len =3D 0;
- 	}
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes=
-support/gnupg/gnupg/relocate.patch
index ea0252026a..8380a5b73a 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From c50d0a95fcf8f96c272fadd4ba85f3eeac39fcaf Mon Sep 17 00:00:00 2001
+From 030938bf3cc6265c9b0141aa1bf6da22a0bdb499 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for i=
ts
@@ -8,16 +8,15 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
=20
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  common/homedir.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
=20
 diff --git a/common/homedir.c b/common/homedir.c
-index 6f99f3e..f22aa9e 100644
+index 9fcb90b..fe91dcb 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1284,7 +1284,7 @@ gnupg_socketdir (void)
+@@ -1294,7 +1294,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -26,7 +25,7 @@ index 6f99f3e..f22aa9e 100644
        gpgrt_annotate_leaked_object (name);
      }
 =20
-@@ -1316,7 +1316,7 @@ gnupg_sysconfdir (void)
+@@ -1326,7 +1326,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -35,7 +34,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
 =20
-@@ -1352,7 +1352,7 @@ gnupg_bindir (void)
+@@ -1362,7 +1362,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -44,7 +43,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
 =20
-@@ -1379,7 +1379,7 @@ gnupg_libexecdir (void)
+@@ -1389,7 +1389,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -53,7 +52,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
 =20
-@@ -1409,7 +1409,7 @@ gnupg_libdir (void)
+@@ -1419,7 +1419,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -62,7 +61,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
 =20
-@@ -1440,7 +1440,7 @@ gnupg_datadir (void)
+@@ -1450,7 +1450,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -71,7 +70,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
 =20
-@@ -1472,7 +1472,7 @@ gnupg_localedir (void)
+@@ -1482,7 +1482,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb b/meta/recipes-suppo=
rt/gnupg/gnupg_2.4.9.bb
similarity index 96%
rename from meta/recipes-support/gnupg/gnupg_2.4.8.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.9.bb
index 2d27f4454e..d01349e37a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
@@ -18,13 +18,13 @@ SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz=
2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch=
 \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
-           file://CVE-2025-68973.patch \
+           file://relocate.patch \
            "
 SRC_URI:append:class-native =3D " file://0001-configure.ac-use-a-custom-va=
lue-for-the-location-of-.patch \
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
=20
-SRC_URI[sha256sum] =3D "b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bc=
dd060595318616"
+SRC_URI[sha256sum] =3D "dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb=
4176fd8b302964"
=20
 EXTRA_OECONF =3D "--disable-ldap \
 		--disable-ccid-driver \

