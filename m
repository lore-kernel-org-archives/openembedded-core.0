Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950CDC27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 08:09:13 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.42])
 by mx.groups.io with SMTP id smtpd.web11.13871.1717920544334427538
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jun 2024 01:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=WPIVe41d;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.6.42, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbxtiJf+BG57s0OnkX8bmLYYNVfSy+4gJfIU58NtuhbqrvVBNeisYc8GMWqqbkvFq2k1sgEtqp/IIrlTgZAAQ6Bg5V6xMbObrDRZK0miGP2dE0rDxpp2F8OKJsNhoJDsTJv2UcsgY7qRzS8K0EUkOuLAdr/bmotSA1Lcu2si4z6fMS+h0Vb4S0fQwOWBxNX8gI1mIKJxd9jPLcn+cglUm8RzD96PTDdHmB9Nn5g2JSpTpPZ3kutuIQ8GISeEmic8t+iokyQoiDMf1m9hiNvs0wjG6BMtNVdajF1APWghUtuitOb/73yQUejk4zW7VFWdIZgYTSSzCsoThJ7jSFjdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bs0o90ncqG6uKIO+y4t7iMhosJImvcsqpWMAyWYJGCw=;
 b=WuaubNFjDpgmKlh1iae9Wi4TBmdx9CvA5BbDSR5DcVjy2VTWWlsDLuQR/phi5Wh9lJmFeNSFIM3ykkDVJpz0T91fWKIKEwggtFrN6ZSXm6kcnoEeHLsQ+blRNrOU/J087NdSFCOHSNJK/14qh9Ln1RB3hLEf2HNlzXc/TGUztePp/KvleVp6WWBTWlqKywejp5Q123iwi1wq+M3gilRPCrxWaZFwvG5vPMzjQDAtsQ3TCZwgVhdI3lwIMuahQRvh+bm6FgCJeZPjHeKdcD+amjjSUT6i3RvQ7iNlUkKftHRa45iW5Uou5b0uJThZKrCSazoZbYlNzkuKDg3YcaQC8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bs0o90ncqG6uKIO+y4t7iMhosJImvcsqpWMAyWYJGCw=;
 b=WPIVe41dyn3sk3mISbj+MVb4k/ZLWpcC5YfhDyKhnxtn5813Hwdn9SF8QDkFg9tZ9me2NvjZ/WwEzCQwEsO3LEa+yZTy87p1PRm4PbTmkCB06UEfGrvCHqLKPzDYoekTuI3vtbziElYg6/ytUFsRjpJ3MgqcJNfvdDzJlynDhcQ=
Received: from DU2PR04CA0261.eurprd04.prod.outlook.com (2603:10a6:10:28e::26)
 by AM7PR06MB6517.eurprd06.prod.outlook.com (2603:10a6:20b:120::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sun, 9 Jun
 2024 08:09:00 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::35) by DU2PR04CA0261.outlook.office365.com
 (2603:10a6:10:28e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.23 via Frontend
 Transport; Sun, 9 Jun 2024 08:09:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Sun, 9 Jun 2024 08:09:00 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sun, 9 Jun 2024 10:08:58 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1 2/2] systemd: bpf-framework: pass STAGING_INCDIR to eBPF compiler
Date: Sun,  9 Jun 2024 10:08:56 +0200
Message-ID: <20240609080856.1020300-3-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240609080856.1020300-1-johannes.schneider@leica-geosystems.com>
References: <20240609080856.1020300-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 09 Jun 2024 08:08:58.0806 (UTC) FILETIME=[47EC4560:01DABA44]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039232:EE_|AM7PR06MB6517:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5b8946b5-b242-4908-363a-08dc885b6b86
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9S6fPDwXZqTWLMVM/qKhtID4qtho8SZTMhPggACHGG3rFp9gMNUOk7+bDSm9?=
 =?us-ascii?Q?Br1NEl1haVBwJ24H5JZwLtPBqI3tJflMFPJarEDE8+ZbmiVqFiMqGPRP6BWP?=
 =?us-ascii?Q?5xmD1+2ziS/90wL4Z4aRSA6MbNQw2SsJBm0pwFuivGuzKurYDLG5o5y+4R7C?=
 =?us-ascii?Q?Hh6P42Vf9fLHtYcom8qeywlsoN3rkwc6+GhZPuGBsUdLHHYZwK+/s6Bl54Jd?=
 =?us-ascii?Q?QVzM+4irPG4ulNAwbQCb9oRCNREZvyxMcrFF+Pm82r1WQgQjxNrZ6HcxXVbs?=
 =?us-ascii?Q?6UljMUdd1F95GwOdN2UG/3Dl0cJv7ZnUxapbyJgdvKuIV1VD9EyLjlRlLysg?=
 =?us-ascii?Q?DnHH8FrS4jv7KJPFrabvq30Ev7ceW/u6mfZBmiyK3KR0E2LEEKgxvc5ZyTgt?=
 =?us-ascii?Q?EFHNY90bI5y7UIOUQE1SUd/q065fjApxAIZ5uSnJLCRPYX3ylhDyZCknh/h+?=
 =?us-ascii?Q?3OMgkz/bNPaFq0QeY7gOTOBLxMNrQWYSH/G0JOFWxmp/psdTbbE1XB2unKSV?=
 =?us-ascii?Q?MZnKYSFqrAu53YaQULJ0sewQWohbGIc5wLGOkYVjOVhuEX5h2PMwiif/FHSh?=
 =?us-ascii?Q?jLcScL0Sn2pb5GHAcPOZ5pqeHDPxubqH9NFgVShqwwEwnhHY1LmGaEN20z43?=
 =?us-ascii?Q?O5Bvom9U9lkMvtQM8UcEmHZ3qNidCeHKI2ucnPU4S23xoVksZahuKk9MikR2?=
 =?us-ascii?Q?vuqlKW7NMrXnGgXUAF0hDW/63pGyaTGRxeQhb038ItNP7SPZdC+r2jnN6km7?=
 =?us-ascii?Q?FfLr02H8BRFLwHkV7eOfew33iCHn5LpTAMfMroYhPlLbfFluwTffol3xsjYh?=
 =?us-ascii?Q?fXH/o7dQwk2NyplptlaixLf1Nst7n9MWlJjXdGzKkasl19mZ+s3MXKsCs/0l?=
 =?us-ascii?Q?RIAeMoHZBvgG6VdBn7Km0yZ8Q100EDD54/l1bGIlGUDH+9QdgRJzqCFCWk0d?=
 =?us-ascii?Q?FJ/jKwx5BYTa8bdyvuILXMNjNJJgaCRxVz4/IIJyahzjslpfGTmD0M9amK9Y?=
 =?us-ascii?Q?JbSbbcUsi0VMyR7t/WD10/BTOGwQIdbmKtUJjF7UOfzQk1RRuIglxCBdakSq?=
 =?us-ascii?Q?MupcNEFt3tDpLH5Ez+Iy8aHB7OaNq+ni0oJL2T8VCrZgfSg0G62x6UV32CoW?=
 =?us-ascii?Q?pwh8hgq1fPh24PArnOstNJfBLrLbLISsH8dbiJtaCXeCovj+XVTOtgxpsRg/?=
 =?us-ascii?Q?qgMLf79rML1Y9U/IdsxEwVIuD7KbDJ4ds+R5oQ+yYkedesK++xcp7hslpKYY?=
 =?us-ascii?Q?5hC/alcfWr+BSGqwuZkX93tMPb6RoQ7qZrvdS/1bTerNVgj+qxFHQbOUi4hl?=
 =?us-ascii?Q?t3j36lPN9BRPHtvgGFPd5nz/Ppz9Gsw3EUTOKai2RJvp8QTOUpBLN/JnB17u?=
 =?us-ascii?Q?hfJIGTdF02uZc5xEAf2vpMpk/Sd7e8igPA8hS94VLUB0HWRsew=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2024 08:09:00.6502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8946b5-b242-4908-363a-08dc885b6b86
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6517
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 08:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200454

The eBPFs are pre-compiled during the systemd-build with a different
compiler than the cross-compiler used to build systemd itself.

This is either a 'clang-native' or a gcc (bpf-unknown-none) which do
not see the BUILD_CFLAGS set -isystem ${STAGING_INCDIR}. For this the
meson.build file constructing the compiler call had to be patched to
handle this bitbake specific setup.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 ...bitbake-pass-STAGING_INCDIR-to-clang.patch | 41 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.6.bb    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-bitbake-pass-STA=
GING_INCDIR-to-clang.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-bitbake-pass-STAGING_IN=
CDIR-to-clang.patch b/meta/recipes-core/systemd/systemd/0023-bitbake-pass-S=
TAGING_INCDIR-to-clang.patch
new file mode 100644
index 0000000000..b907fd79b7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-bitbake-pass-STAGING_INCDIR-to=
-clang.patch
@@ -0,0 +1,41 @@
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


