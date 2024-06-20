Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E4CC41513
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 11:51:40 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.77])
 by mx.groups.io with SMTP id smtpd.web10.45718.1718884295346212653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 04:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=tBQaneS8;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.103.77, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBo8hjhxyf47+JgQqfh7AIoPUBt+Rw+6ITgRiPXeHEqVyjB/t+cx9Xw9h1xJZfEmYn5ZIUm01vUX3pLSFy9WInWQeMOSjAxjyZJfjy76gegwyjBdxvaTE7nze6UE2MZ+1Y4yLcY9pEvRIYJmiuJKHnTHurbVqhKUDIrSRj0B1D7JI6raGKxfKZrcXaO/R+IWBrfV+wOPhSQEJKD8U53s36Aw6y8rKMsCtWq1uI5a8IbTFUxxvuXH8a1KaaftfouTmZ8oevhR2hvr9pXl21iF5LeNySKlt/NSVCaks/M/FcW4B5GrnXq1rmCHKFtzrp4LQc9neYlCz7No9Mn6uVWHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PL1VQTdOlp29BbWNCkPV3P8wq5GhByixxg0qniCogDk=;
 b=jN10fT3axrGzXA7gJHrrBVCFpsonQbpnClNHqYoJHish+4jWMVt3nTwNRyz3MO407RFMKSQquxVPpG97UDzfS1jsLz06lQqbvazsOwHJXe3ACL8cdSFdctG6DdZKlwGhXubbfVKlycKrXstJHMnVkRJGu8R22hhu3yL+Dq7z+H/STEXc30mYiiqYHern8IeB18cl0hlpWN8WhCWZrffbUi/N8rod/Cw7azOHclQucCPkJT8YXxV0z0y6FVpMNicIgpECmQ6ZButEJDczdmQD/bIOiXLZU/kpe2L5BeHcv5h9LzYlUmHBMx7oeC2w5ZUDDvSyc65ybOiCLOTQ7kcC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL1VQTdOlp29BbWNCkPV3P8wq5GhByixxg0qniCogDk=;
 b=tBQaneS8aX78yCU+GRiPSlmTBroeTBFu572EgeKPgIGFgl8VqPGukHNoOYXbW6WYZOA2zoonk3ekOrOItOlDlbJ2vENqku6CfWlobOxvAs3vluQoB1KH1WLXnVE7RW/IRwXsyUUEmJZhPCWcEddCEVc8W4WMRl1D6h8HqWAzAxk=
Received: from AS9PR05CA0076.eurprd05.prod.outlook.com (2603:10a6:20b:499::11)
 by VI1PR06MB6479.eurprd06.prod.outlook.com (2603:10a6:800:12d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Thu, 20 Jun
 2024 11:51:32 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:499:cafe::52) by AS9PR05CA0076.outlook.office365.com
 (2603:10a6:20b:499::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.34 via Frontend
 Transport; Thu, 20 Jun 2024 11:51:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 20 Jun 2024 11:51:30 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 20 Jun 2024 13:51:29 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	Ross.Burton@arm.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v2 2/3] systemd: bpf-framework: 'propagate' the '--sysroot=' for crosscompilation
Date: Thu, 20 Jun 2024 13:51:26 +0200
Message-ID: <20240620115127.36172-3-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620115127.36172-1-johannes.schneider@leica-geosystems.com>
References: <20240620115127.36172-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 20 Jun 2024 11:51:29.0448 (UTC) FILETIME=[3011D280:01DAC308]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|VI1PR06MB6479:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 92a8e45e-042c-4174-9d49-08dc911f5337
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|376011|36860700010|82310400023|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7IcSkYS1QnFKU5Lj+I+u4XapvpRESJUADOGWG0H9LZ4cyDC4cyw7gIOtCMvt?=
 =?us-ascii?Q?2/xLUaXowRvfeEt782gfziSg/rVHUoHx0WE7pXfGGH9a8ttnBdH1gxsH8don?=
 =?us-ascii?Q?LqcV5sXYMlJKSbe7LNM1UYxziaMkJY48bTnMdjhsqZauP658Wj8PrE5w3Xi7?=
 =?us-ascii?Q?k/m5gBu0kvLr5ZAfGjkisrubnk6jKWqjoo9eXa76FyBEaZSPBP/Hy0ROdOXA?=
 =?us-ascii?Q?g3wZkGIwNQ42VVsDeH9qpFThKdLL2a/wsWgsXElQUACS00/8ImfrswXOlxaV?=
 =?us-ascii?Q?eYMaY4DiINKxKSBPaaw6z82L9SZHv0AneZ8yDxMHGRECUejyaHSg8CRZ5E2g?=
 =?us-ascii?Q?Pdh3jNhc4AYwIJ+3fBBYTAGczudwC2L9fF3dPOx9bsdBXwYKwJKQyJp6whDb?=
 =?us-ascii?Q?v3sRyyLtrQxzGqxUrY+nYMjH9QSRufxSaoJnmbYZHhbh8loGObUCg1VT5m1v?=
 =?us-ascii?Q?C8XfKvpJxdy8S7dPPop2SdVBOie/+NaFOGvZWlGUuSZsjZpj7nWd+6dcuKxk?=
 =?us-ascii?Q?r8JnSCCyYi6ONfFIsnQRup2CwVFqF/eMRmgQfzvJaWE/dUREa47SjHAmFVRv?=
 =?us-ascii?Q?MPaIWzrUDPI42mNhFAKaPs2VS3RdSSfzbIwVsU875dLuI01C1E59C/dq5LnI?=
 =?us-ascii?Q?cX2BuwG7jggEMF+IAzyPte+ghw4xFfKcmrruR1tq4GsJMafwSJpRgiCN78Fy?=
 =?us-ascii?Q?5FEnFjmRgd4HpvROVHwLU3ln5knaarsk5NlJgOVA67NNxabshxsP6aFwAHb8?=
 =?us-ascii?Q?StcFVpsDW5/llzPvFjtUTX6pe5TPdOTLTLLRBrn9QWsfWkni26rXeDGhXNBQ?=
 =?us-ascii?Q?h7Sa3G7pu0PBZRl6sCyN3jVoqeU+F4LZrQToEk8DmYqBk64DgBGRd+G4oF2n?=
 =?us-ascii?Q?IhGjD+v4HLT4A63NK0jjh+ktqEJCDVpXHyXJrmUtYSFq5svNsDwMN6JD1K5p?=
 =?us-ascii?Q?NZUCyjkYey4B8U31bsHc7MwD6LtvrW7yBYZKP/SpZwJP1Qt9Xoomx7RSVAtI?=
 =?us-ascii?Q?hRb1tPqUzelBDCHbcnOMqoBcmVc5cqrVoKfUpRb8X4pfzQZc1oJJIh7QOzgp?=
 =?us-ascii?Q?0zQ/EU/v2V6NG+z6dBJnVx6wv2BrWoXGCKbx+BUB4T+7Hg7gCZdTOqnKD0nv?=
 =?us-ascii?Q?HEHTwvgihubZots9WqD90KTYsqOxHwlL/3dXr+5pv1+MkzV0H7zpAWdMZDHL?=
 =?us-ascii?Q?irQrHFmmxVGtfccU8p2L2eFt0s7oHgkng2hpF6/jpV5v1zSezh+BoZ9AA6ch?=
 =?us-ascii?Q?H4L5rmD7w64h7U34kf85tfXUB73oaMMNgOlp6zy62Jl8IkIaxwsJUi/ETAQV?=
 =?us-ascii?Q?l90y6RiMmzuEfggfeC/qm7i4lUFjyQvtPjx92pL1e0+8jVaCQTl5ToPOP2gY?=
 =?us-ascii?Q?jjGj4b8=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230037)(376011)(36860700010)(82310400023)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 11:51:30.5622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a8e45e-042c-4174-9d49-08dc911f5337
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6479
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 11:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200949

The eBPFs are pre-compiled during the systemd-build with a different
compiler than the cross-compiler used to build systemd itself.

This is either a 'clang-native' or a gcc (bpf-unknown-none) which do
not see the BUILD_CFLAGS, that point to the correct include search
patch. To address this have systemd's meson.build "propagate" the
--system from the C_FLAGS into the BPF compiler call.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 ...pagate-sysroot-for-cross-compilation.patch | 31 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.6.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-meson-bpf-propag=
ate-sysroot-for-cross-compilation.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-meson-bpf-propagate-sys=
root-for-cross-compilation.patch b/meta/recipes-core/systemd/systemd/0023-m=
eson-bpf-propagate-sysroot-for-cross-compilation.patch
new file mode 100644
index 0000000000..e8116b0540
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-meson-bpf-propagate-sysroot-fo=
r-cross-compilation.patch
@@ -0,0 +1,31 @@
+From 7463b382bcaf26aacc60b73f98f0262aa41db3ee Mon Sep 17 00:00:00 2001
+From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
+Date: Thu, 20 Jun 2024 12:32:18 +0200
+Subject: [PATCH] meson: bpf: propagate 'sysroot' for cross compilation
+
+During cross-compilation of systemd, the compiler used to build the bpf's =
needs
+to be pointed at the correct include searchpath. Which can be done by pass=
ing
+the corresponding directory in through the cflags; for example in yocto/bi=
tbake
+this would work: CFLAGS +=3D "--sysroot=3D${STAGING_DIR_TARGET}"
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/33427]
+Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com=
>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index 187e7b216d..15df058ab6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1691,6 +1691,7 @@ if conf.get('BPF_FRAMEWORK') =3D=3D 1
+                 '-ffile-prefix-map=3D',
+                 '-fdebug-prefix-map=3D',
+                 '-fmacro-prefix-map=3D',
++                '--sysroot=3D',
+         ]
+=20
+         foreach opt : c_args
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_255.6.bb b/meta/recipes-core=
/systemd/systemd_255.6.bb
index defdb15620..d2c5e09697 100644
--- a/meta/recipes-core/systemd/systemd_255.6.bb
+++ b/meta/recipes-core/systemd/systemd_255.6.bb
@@ -28,6 +28,7 @@ SRC_URI +=3D " \
            file://systemd-pager.sh \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
+           file://0023-meson-bpf-propagate-sysroot-for-cross-compilation.p=
atch \
            "
=20
 # patches needed by musl
--=20
2.34.1


