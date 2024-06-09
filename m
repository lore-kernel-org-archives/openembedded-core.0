Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59A6C27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 08:43:33 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.69])
 by mx.groups.io with SMTP id smtpd.web11.14182.1717922609565720803
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jun 2024 01:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=UNDR5H8O;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.8.69, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9fJ6tSqhRjLrroU6gTKNwbzpNYqTzpB7FUbke4DP7QFPKn8WAsMWK9LquYGFosOMTyxbStCXqe3joHlTbbSGq/dlC5h+cT4Bd3PKWl5KyFfbO7ZlUGnNkiE2+jzzGxD/jgPFQ4sgkyEk/8leWw8UD2zVBIW/sIkiNcYl2GdeEzZjDBft1KiVTJAYLgsUg3w0+x7Oiiwz2dq25C34iO9WPJuYJgRmeIRR/cLGBDo27pNTTO7hrPOl9m3REsyMPL4LfcociobEjIgCMMLmBVe3jA37UhoeEu/+FAHf6FFjqIhJaoy9Qahk9JERPQrPavTg5om1ojP0LsPp4hX3zOz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyuY71rHSSRxNmBOKl5D91v0oj+qw5iGguRDfaOc4vI=;
 b=ktWoRFQ27Az029tZrHPU2/WtMcbGuiYeNCXYbH3JpK9mz0qAHtGET8G2VApnOVOIxdvFc/RcFfuep7uTVWuUHY5+fPSCzmxQx82oCELGo4sYY2qwLcRTUJSQbO8/ksBdP5nl7Xv3DOB9SADdH02RtAfKPHQdwTHBVVM5oDCSANJDH4necgZuDuu0lOJyqKrFP905zl328rROwb4FLCzU7XDFlb46zAFWTLAgkPOSmp1PKIWA3AyhZtNeiagOLotnmpLonGEMQYvdTLe9VlEmrX6HRkbWfmI3DGKVaB9m+woO2DVRiyjhNM9wC4HRmsfaOMqKY8Ij8w2O43v9HpylsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyuY71rHSSRxNmBOKl5D91v0oj+qw5iGguRDfaOc4vI=;
 b=UNDR5H8OYB51f1mw6aVmybVyQA2aNcl64ws6qrPPozvTtd0LaHYCg2EBrXFMbA9ryn1DSeUuaPxwRq/e9KLbxqu7x6aATweZ830lrGmrtrONjbIFO4c/jHwzlpZ2rEhJ1VxRVwzANHi9fJpTD+Ww/tHBoEPg9FfRSnalfvZMlvI=
Received: from AS4PR09CA0002.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::9)
 by VE1PR06MB6862.eurprd06.prod.outlook.com (2603:10a6:800:1a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sun, 9 Jun
 2024 08:43:24 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::21) by AS4PR09CA0002.outlook.office365.com
 (2603:10a6:20b:5e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.22 via Frontend
 Transport; Sun, 9 Jun 2024 08:43:24 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Sun, 9 Jun 2024 08:43:23 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sun, 9 Jun 2024 10:43:22 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1 2/2] systemd: bpf-framework: pass STAGING_INCDIR to eBPF compiler
Date: Sun,  9 Jun 2024 10:43:21 +0200
Message-ID: <20240609084321.1070686-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 09 Jun 2024 08:43:22.0898 (UTC) FILETIME=[1637B720:01DABA49]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B0:EE_|VE1PR06MB6862:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 480aa9b7-d688-438c-dd72-08dc886038d9
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GVCRdldiuv7Iix8ez+cIx9V1LJAJvfgXstQzmFVqLsb6EETvzT4rRGVeVn8c?=
 =?us-ascii?Q?rl0jWSNG2KZBxgHPqvgO6aIO7jB3yLu8VGMkCCMj2Y2Kzr4Xz4zkd+uGjDzY?=
 =?us-ascii?Q?ERSwD4NUHdYE+E9F6ecBQP3rRnPW2gdgxZQLd348D40rD8KzZu2TZ680CTMl?=
 =?us-ascii?Q?qnQ77hBbwwlEU3kbJa4Y1J+CKt0EEX02i1A055aYR1Y3WWi0aBGkyPmfgNN7?=
 =?us-ascii?Q?JZek7fu7g82g0pOZ3WEurVSGr5/aKtOaSKfXw1kLa02Zsjb4AaQ8PrBSj1Mm?=
 =?us-ascii?Q?RU6nuMZBhrUGn4oBOW1IIn73nbokWo+PzRD6lEZYCHae4DxS7p4yOzhOOBwp?=
 =?us-ascii?Q?Lw3OFwQKo9/5JMURxBECZA7ZxReFw/8J+yNdmcG7dLBsda6IDTJ2bTJw036M?=
 =?us-ascii?Q?0c3g0xJDLAVarji/VbxMA6gEmlRD61itRPQFeZzDBtHLtcKYPmWpAhg+JjwE?=
 =?us-ascii?Q?UnnP94UqNOEqI/nc909JBW5D2M2GVgMF1KS4NrwOWq6SdFxrJXyS4CLlXLig?=
 =?us-ascii?Q?45noYGtZCqoMlHQxESn+fo6VNlQtOPOsr/BVDbdSZjAcKCBQaveZs42Mo008?=
 =?us-ascii?Q?6LLqRVDx2EOqzwt8SUHApR6tAIxYrwtmG/xmLwEEfS2u1dZW5IuyjkzUjWoG?=
 =?us-ascii?Q?wkR1/xFxgsTo9xbJwHjPcNqUyVCT1oU9HZrtPnObmZPj/Qsd4WKdyTAIUYPR?=
 =?us-ascii?Q?z+WQYGSBBFw0ScT4HhbdjRjpn1RE2+KMxhBHig/tn9Qc8HxVeMO9SWHjRzU2?=
 =?us-ascii?Q?srYiqOT8jqBsn2MWD7lnC/sV97kEAr6IS+tt2LMA4wbMhG7egmaqZslWUK2f?=
 =?us-ascii?Q?NLfKhVrEf2k5ZAJ9pLJU8fXveIFcTMazUPVpfHmifQiLXx7P7aYwS2/oFeX0?=
 =?us-ascii?Q?JoKRwyBIGxHcUj/nQHBrhteRVX3qydfsETeSL8GthIAP0rwgjvZ8rPLIR2kb?=
 =?us-ascii?Q?Dybe8RAldv6cQzI8DvNfQQpvQkLOcFkPv2AB60RTOcSj2wJTYdLXlsKo5woT?=
 =?us-ascii?Q?8INhfhin+qUBADZ1RLRBbBPoF79GBlS9EoQOzruB780k67kEBZA8q9RDYT35?=
 =?us-ascii?Q?9uYRzt1LFFHf0jlLI/wH+2IiWf9WGV4xRnFgrTdmSLJJmm5bSNux4MoITl7j?=
 =?us-ascii?Q?S3WLaZtoiRSjVbl1HRl5JIarUaVypY9O2Gp04EHdOyAkyc6LAuDmgTUjmWhE?=
 =?us-ascii?Q?w00dADrSglEYZNITuXSXP3aCVCKb9UvmXPTkLjaGKZ1vsIpTqc8VQegQuuWs?=
 =?us-ascii?Q?Tl6OHuQ+OANRqNzRcnkkU+oxy0Ef1OIy2rkCjFDtdFFvc9dlKrY8QWRDOrpb?=
 =?us-ascii?Q?FffX4V9PpZ2juHPn3hqD4Ck+CgAisyiTMTJ+eNjFEl9ZAVOtMt5gp8BRZlMC?=
 =?us-ascii?Q?ChMMeEh/I+m5j8AUySbaVTon3OaeT4hxSSNysSIoqr4QI4IJcw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2024 08:43:23.1495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 480aa9b7-d688-438c-dd72-08dc886038d9
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6862
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 08:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200456

The eBPFs are pre-compiled during the systemd-build with a different
compiler than the cross-compiler used to build systemd itself.

This is either a 'clang-native' or a gcc (bpf-unknown-none) which do
not see the BUILD_CFLAGS set -isystem ${STAGING_INCDIR}. For this the
meson.build file constructing the compiler call had to be patched to
handle this bitbake specific setup.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 ...bitbake-pass-STAGING_INCDIR-to-clang.patch | 42 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.6.bb    |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-bitbake-pass-STA=
GING_INCDIR-to-clang.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-bitbake-pass-STAGING_IN=
CDIR-to-clang.patch b/meta/recipes-core/systemd/systemd/0023-bitbake-pass-S=
TAGING_INCDIR-to-clang.patch
new file mode 100644
index 0000000000..a6d4d7a81d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-bitbake-pass-STAGING_INCDIR-to=
-clang.patch
@@ -0,0 +1,42 @@
+From 4f4b3d662e5475b375808cea3a6a90d61b6c9522 Mon Sep 17 00:00:00 2001
+From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
+Date: Sat, 8 Jun 2024 18:19:39 +0200
+Subject: [PATCH] bitbake: pass STAGING_INCDIR to clang
+
+Pass bitbakes STAGING_INCDIR as header searchpath to clang/gcc, where
+it can&should look for the libbpf headers when it compiles the BPFs.
+
+This is "the least ugly hack", compared to other alternatives like for exa=
mple
+what '-Defi-includedir=3D...' did (creating an extra option to smuggle in =
bitbake
+variables).
+
+Ideally the compiler would use the BUILD_CFLAGS set by bitbake, which
+set among other things also the corretc -isystem...; but haven't found
+a good way to do so in meson (yet) :-P
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com=
>
+---
+ meson.build | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 187e7b216d..dc1a464504 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1746,7 +1746,11 @@ if conf.get('BPF_FRAMEWORK') =3D=3D 1
+=20
+         bpf_o_unstripped_cmd +=3D ['-I.']
+=20
+-        if not meson.is_cross_build()
++        if meson.is_cross_build()
++                ## point 'clang'/'gcc' to the bitbake recipe sysroot, to =
find the libbpf headers there.
++                staging_incdir =3D join_paths(meson.source_root(), '../re=
cipe-sysroot/usr/include')
++                bpf_o_unstripped_cmd +=3D [ '-isystem', staging_incdir ]
++        else
+                 target_triplet_cmd =3D run_command('gcc', '-dumpmachine',=
 check: false)
+                 if target_triplet_cmd.returncode() =3D=3D 0
+                         target_triplet =3D target_triplet_cmd.stdout().st=
rip()
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_255.6.bb b/meta/recipes-core=
/systemd/systemd_255.6.bb
index e70c9c738d..3fd4d5bc5b 100644
--- a/meta/recipes-core/systemd/systemd_255.6.bb
+++ b/meta/recipes-core/systemd/systemd_255.6.bb
@@ -28,6 +28,7 @@ SRC_URI +=3D " \
            file://systemd-pager.sh \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
+           file://0023-bitbake-pass-STAGING_INCDIR-to-clang.patch \
            "
=20
 # patches needed by musl
--=20
2.34.1


