Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95160C44533
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:48:55 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24647.1784645330473820708
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=Vo3lDaKA;
 spf=pass (domain: ericsson.com, ip: 40.107.159.15, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCgvnRuKAdBC1K3UCrkLGmdsUbTfmPKPodBNllo3teSKXrxC4Uca6mLBnR0qbdDCn/tKjN/yK9s1rhuSx+7ZPAnjYPKlqaN1JeaKvOmdijE0yIYYBIAFEy3Gdjrf2UrMbYjBpy9rbvSzyNmKE5TMv1o6Ht+Ug4v3QWLJqqpQLJ+eSJcYB1feGbDAneeWhgbIOuOjwWsBxsoyu6Z1eir6cAPnRWEkGUv3zWjotZpldVE1S25XZEtDU8MvucnAYzTsulbMOqAtJLjODbkYfcDsTeD74DcLEKzRjmObIA5jR1hCbsoJ1nhaEDV5W8GvnpWKZbL3I+B6/dJVgQe+OnYIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDifFmm7YLOe36u0kqdF5EGeUE7fsZuJht4KdM2peqw=;
 b=qnD1uRsvaDuM1qzpIR7fZx44xgIuKJgFHMLfZwLnZ1+vDDAdLwVV4UHtbqaX9OGPV9UcGioBn+GH7ia6JuZT2EQxI6Vf5Se8EJ13x74NUVRpjrBYsOFTrYf17RNydwaviJZG10wwSDOGN56yuDl1a9nWt1dDNWieHuL7FvEhl8mnmF87Fpj6QNjFhryjYDUsOD+hcsVJs1x27xvNaqMVjz7M+UjOggnnFdvEaLBDcukaPzSrXXLtiYIBBEl5/rbPj12wXmK687KyI0Qp8kpX1IZQqzeuWI3QsQHbZW128BjzSqY4JK0MKE2xYTKmBJORRGd6fXWpfniaZUz23zbW6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDifFmm7YLOe36u0kqdF5EGeUE7fsZuJht4KdM2peqw=;
 b=Vo3lDaKAwWLXYAyCb9b88z3bCn441O6D3CaO95dDEfHQbAxyHFCffXPVuZ+oUKgPPerAQvK1SdJVpjaFdaZASubfHJiEKRyFmZ6/YCfPtyS/uXxoNuRRJZMBCFIp+gU8AV66zz4AIQhvY7DpSB/24sVlhhgr70p0L4kTLR7SxgiDorPLLnefBrl6iBM8l3ICXATSLHxpUvg+BjshN5vFJ9enrFPFcF13XqHdT54Xf/ySv1GCCT0phy/PcjwWaq13S1RftRCoNe0GPgHVftQWMPDhN+1yEO+9RD7DgEs9rp3yCr4awWq1xGOw8auH96vg2pzWSZokfK9mUs2HtJiDrA==
Received: from DU2PR04CA0159.eurprd04.prod.outlook.com (2603:10a6:10:2b0::14)
 by DUZPR07MB9998.eurprd07.prod.outlook.com (2603:10a6:10:4df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:48:42 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::2d) by DU2PR04CA0159.outlook.office365.com
 (2603:10a6:10:2b0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Tue,
 21 Jul 2026 14:48:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 14:48:42 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Jul 2026 16:48:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 61E4B4020A9C;
	Tue, 21 Jul 2026 16:48:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 3A1A7700DBB0; Tue, 21 Jul 2026 16:48:33 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 2/4] Add tag in SRC_URI in multiple recipes
Date: Tue, 21 Jul 2026 16:48:06 +0200
Message-ID: <20260721144811.323786-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260721144811.323786-1-daniel.turull@ericsson.com>
References: <20260721144811.323786-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D05:EE_|DUZPR07MB9998:EE_
X-MS-Office365-Filtering-Correlation-Id: fb8f5e21-295c-4f12-f2cb-08dee7372888
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|22082099003|18002099003|3023799007|13003099007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	8m36MTXbMg871Hd9O7et/kxW5mWAopnfJILPYQrqzGZzcXoS1BZRGdrJAsDUF1rfhKF0OMmlqD4JdNQDynOwgjZauXsskAxNzNx1OI8kufYPQTpmwjOKAidGSPV1iFIz5pBUHIJNxfJvWjmBhhD32EZiKNEq8jtQrxYWGsvXFaiN4tgb6sRu8oA0vU99XCxMJjhHSJDM6wAM7d2XW0MDjNqEAzNHCQs8tNdqGKHa/UVax/CmOzTEq/aaAcrOU89vrHLNnl7V1MZRxFJLQyFQeJbtsuYuPYOG9/J45AJLZ0NlwmxBBOuf5JlUOs2l6dihq9E5o86RnSxqB1mTDpXJwcyPxCIQeQFEo9sDOCQ5UYBOEf6mYcZS3YUBNcrYROmqhzSNZGYEUB8yRAwGcy4cWB6on1eagQgHynCfJumUsoNkBl2UQGsycFUM5o/zqlCyw1Qc8geM7pDt/f+BiOvMS4AsxEGfg8XBlCfaVPx3ezEJ4CySItUFwj9hwyPVfe9B2XWk7Mll2jvYcYp1mxpu6GzdgCeDns9+BE9l5CPgRMABjhmGQscQYoPzjSePXpIGlb4Ccan6+GUCFE/+Zk0XqDFbW9kQIJnI4RYsPL4BKsqoiU3658pa9S/UKtoX35g5CmrC3TPUP7bLa3YxHIoLl6vRfqt5T+EzB4fztYW6Kd85GlYE59Dt8FqJZsoFAsthwua+IlyZOJawv/10HRAnaA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(13003099007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ahDZaonWX1jaQepU+KuXOZ6Au4P0ey23WvqSIK2PI/4BKj4dq7cxDA3iF9Y2abM18XYfsHTfGjCGHPEu2RK06re/TNz/6x0JFwKBc3h46zmc2Tfp659Iiwm+cdpHapdyhAgHg60Hq5LV8/1BYshN5Rgzu9yc8DKC0bDkSZoOOhmD3DkgOWDG7vj9+Z9KA/+dHGQaKDHGsNqB9yx0eLqHJkpiu4ojITn4eR2kpB9il0XIRiMkXPg+CQAThX3M00ArF+qoSh2MXjFxNxbJ+qOjzGKdMWjbg4eQA1rYV6SRs2iKMQoGBzvRBGmQvkyzyXPQ9TQkfrCkgSW4QgcKly9BVXwOObSwA+c8O8f+xVHexA05CXdyiuf0PwZG6Rj9u92bN6UVNKxJg/FFY49rf8pkYVOoCFesHG2dAJW9mIPaMbCpe2XsH0MYGhx4rIj2/I+H
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:48:42.1673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8f5e21-295c-4f12-f2cb-08dee7372888
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR07MB9998
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241548

From: Daniel Turull <daniel.turull@ericsson.com>

Generated from scripts/contrib/check-srcuri-tag
Tested with bitbake world on qemux86-64

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-bsp/efibootmgr/efibootmgr_18.bb                    | 2 +-
 meta/recipes-bsp/efivar/efivar_39.bb                            | 2 +-
 meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb                       | 2 +-
 meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb     | 2 +-
 meta/recipes-connectivity/connman/connman-gnome_0.7.bb          | 2 +-
 meta/recipes-connectivity/neard/neard_0.20.bb                   | 2 +-
 meta/recipes-connectivity/slirp/libslirp_4.9.3.bb               | 2 +-
 meta/recipes-core/seatd/seatd_0.9.3.bb                          | 2 +-
 meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb                | 2 +-
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb           | 2 +-
 meta/recipes-devtools/distcc/distcc_3.4.bb                      | 2 +-
 meta/recipes-devtools/dnf/dnf_4.24.0.bb                         | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc                   | 2 +-
 meta/recipes-devtools/libdnf/libdnf_0.75.0.bb                   | 2 +-
 meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb                    | 2 +-
 meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb            | 2 +-
 meta/recipes-devtools/patchelf/patchelf_git.bb                  | 2 +-
 meta/recipes-devtools/python/python3-dtc_1.8.1.bb               | 2 +-
 meta/recipes-devtools/python/python3-pefile_2024.8.26.bb        | 2 +-
 .../sbom-cve-check-update-cvelist-native_2026-06-24.bb          | 2 +-
 .../sbom-cve-check-update-nvd-native_2026.06.24-000003.bb       | 2 +-
 .../recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb | 2 +-
 meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb               | 2 +-
 meta/recipes-extended/cracklib/cracklib_2.10.3.bb               | 2 +-
 meta/recipes-extended/iputils/iputils_20250605.bb               | 2 +-
 meta/recipes-extended/libnsl/libnsl2_2.0.1.bb                   | 2 +-
 meta/recipes-extended/ltp/ltp_20260529.bb                       | 2 +-
 meta/recipes-extended/net-tools/net-tools_2.10.bb               | 2 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb                 | 2 +-
 meta/recipes-extended/zstd/zstd_1.5.7.bb                        | 2 +-
 meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb                    | 2 +-
 meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb               | 2 +-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb          | 2 +-
 meta/recipes-graphics/waffle/waffle_1.8.3.bb                    | 2 +-
 meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb                 | 2 +-
 meta/recipes-kernel/blktrace/blktrace_1.3.0.bb                  | 2 +-
 meta/recipes-kernel/dtc/dtc_1.8.1.bb                            | 2 +-
 meta/recipes-kernel/powertop/powertop_2.15.bb                   | 2 +-
 .../recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb | 2 +-
 meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb        | 2 +-
 .../gnome-desktop-testing/gnome-desktop-testing_2021.1.bb       | 2 +-
 meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb   | 2 +-
 meta/recipes-support/libseccomp/libseccomp_2.6.0.bb             | 2 +-
 meta/recipes-support/lz4/lz4_1.10.0.bb                          | 2 +-
 meta/recipes-support/numactl/numactl_2.0.19.bb                  | 2 +-
 meta/recipes-support/rng-tools/rng-tools_6.17.bb                | 2 +-
 meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb | 2 +-
 meta/recipes-support/xxhash/xxhash_0.8.3.bb                     | 2 +-
 48 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb b/meta/recipes-bs=
p/efibootmgr/efibootmgr_18.bb
index 6f4178216b..8001496fd0 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "efivar popt"
=20
 COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
=20
-SRC_URI =3D "git://github.com/rhinstaller/efibootmgr.git;protocol=3Dhttps;=
branch=3Dmain"
+SRC_URI =3D "git://github.com/rhinstaller/efibootmgr.git;protocol=3Dhttps;=
branch=3Dmain;tag=3D${PV}"
 SRCREV =3D "c3f9f0534e32158f62c43564036878b93b9e0fd6"
=20
 inherit pkgconfig
diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efivar=
/efivar_39.bb
index e5839f7a99..7b087c135e 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6626bb1e20189cfa=
95f2c508ba286393"
=20
 COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
=20
-SRC_URI =3D "git://github.com/rhinstaller/efivar.git;branch=3Dmain;protoco=
l=3Dhttps \
+SRC_URI =3D "git://github.com/rhinstaller/efivar.git;branch=3Dmain;protoco=
l=3Dhttps;tag=3D${PV} \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
            file://0002-efivarfs-backport-patch-to-update-file-variable-sto=
re-on-SetVariableRT.patch \
            file://0003-fix-march-issue-for-ppc64le.patch \
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb b/meta/recipes-bsp/g=
nu-efi/gnu-efi_4.0.4.bb
index 9075487b92..13ee39a2d7 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "file://gnuefi/crt0-efi-arm.S;beginl=
ine=3D4;endline=3D16;md5=3D8b0a
 COMPATIBLE_HOST =3D "(x86_64.*|i.86.*|aarch64.*|arm.*|riscv64.*)-linux"
 COMPATIBLE_HOST:armv4 =3D 'null'
=20
-SRC_URI =3D "git://github.com/ncroxon/gnu-efi;protocol=3Dhttps;branch=3Dma=
ster \
+SRC_URI =3D "git://github.com/ncroxon/gnu-efi;protocol=3Dhttps;branch=3Dma=
ster;tag=3D${PV} \
            file://0001-Do-not-treat-warnings-as-errors.patch \
            "
 SRCREV =3D "37cd8f069bde6715eebdc5e38a8f15ee6de5edcf"
diff --git a/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb b/=
meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
index 6bef43262f..bf0fd752f6 100644
--- a/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
+++ b/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2d5025d4aa3495be=
fef8f17206a5b0a1"
=20
 DEPENDS =3D "avahi"
=20
-SRC_URI =3D "git://github.com/lathiat/nss-mdns;branch=3Dmaster;protocol=3D=
https \
+SRC_URI =3D "git://github.com/lathiat/nss-mdns;branch=3Dmaster;protocol=3D=
https;tag=3Dv${PV} \
            "
=20
 SRCREV =3D "4b3cfe818bf72d99a02b8ca8b8813cb2d6b40633"
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/=
recipes-connectivity/connman/connman-gnome_0.7.bb
index 0c6e823ea2..06d741bd4d 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "gtk+3 dbus-glib dbus-glib-native intltool-na=
tive gettext-native"
=20
 # 0.7 tag
 SRCREV =3D "cf3c325b23dae843c5499a113591cfbc98acb143"
-SRC_URI =3D "git://github.com/connectivity/connman-gnome.git;branch=3Dmast=
er;protocol=3Dhttps \
+SRC_URI =3D "git://github.com/connectivity/connman-gnome.git;branch=3Dmast=
er;protocol=3Dhttps;tag=3D${PV} \
            file://0001-Removed-icon-from-connman-gnome-about-applet.patch =
\
            file://null_check_for_ipv4_config.patch \
            file://images/ \
diff --git a/meta/recipes-connectivity/neard/neard_0.20.bb b/meta/recipes-c=
onnectivity/neard/neard_0.20.bb
index 7825b9a4bb..51ae892c29 100644
--- a/meta/recipes-connectivity/neard/neard_0.20.bb
+++ b/meta/recipes-connectivity/neard/neard_0.20.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c=
09e5b7ccc2c4ca7e \
=20
 DEPENDS =3D "dbus glib-2.0 libnl autoconf-archive-native"
=20
-SRC_URI =3D "git://github.com/linux-nfc/neard;protocol=3Dhttps;branch=3Dma=
ster \
+SRC_URI =3D "git://github.com/linux-nfc/neard;protocol=3Dhttps;branch=3Dma=
ster;tag=3Dv${PV} \
            file://neard.in \
            file://Makefile.am-do-not-ship-version.h.patch \
            file://0001-Add-header-dependency-to-nciattach.o.patch \
diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb b/meta/recip=
es-connectivity/slirp/libslirp_4.9.3.bb
index a13b4b55ab..be13cbc1fc 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
@@ -5,7 +5,7 @@ LICENSE =3D "BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Df95a9bf4a7e411164fe843697ccda=
59e \
                     file://LICENSE;md5=3Dcfea6044642fd63b90ce9d79f5db64d9"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=3Dht=
tps;branch=3Dmaster"
+SRC_URI =3D "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Dv${PV}"
 SRCREV =3D "dd76415fce457e319d665eb8210d05c5731360ba"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
diff --git a/meta/recipes-core/seatd/seatd_0.9.3.bb b/meta/recipes-core/sea=
td/seatd_0.9.3.bb
index d0802eee60..72c54d58ab 100644
--- a/meta/recipes-core/seatd/seatd_0.9.3.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.3.bb
@@ -6,7 +6,7 @@ LICENSE =3D "MIT"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D715a99d2dd552e6188e74d4ed2914d5=
a"
=20
-SRC_URI =3D "git://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=
=3Dmaster \
+SRC_URI =3D "git://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV} \
            file://init"
 SRCREV =3D "daa8196e10b180b8b0caeafa8e5f860eb1bd6706"
=20
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb b/meta/recipe=
s-core/sysfsutils/sysfsutils_2.1.1.bb
index f1975e46a6..13702866cf 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddcc19fa9307a5001=
7fca61423a7d9754 \
                     file://cmd/GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
                     file://lib/LGPL;md5=3D4fbd65380cdd255951079008b364516c=
"
=20
-SRC_URI =3D "git://github.com/linux-ras/sysfsutils.git;protocol=3Dhttps;br=
anch=3Dmaster \
+SRC_URI =3D "git://github.com/linux-ras/sysfsutils.git;protocol=3Dhttps;br=
anch=3Dmaster;tag=3Dv${PV} \
            file://0001-Modify-my_strncat-function.patch \
 "
=20
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/r=
ecipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 922e665028..77fdd67302 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -89,7 +89,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D44ac4678311254=
db62edf8fd39cb8124"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+(\.\d+)*)"
=20
-SRC_URI =3D "git://github.com/xrmx/bootchart.git;branch=3Dmaster;protocol=
=3Dhttps \
+SRC_URI =3D "git://github.com/xrmx/bootchart.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3D${PV} \
            file://bootchartd_stop.sh \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
            file://0001-bootchartd.in-make-sure-only-one-bootchartd-process=
.patch \
diff --git a/meta/recipes-devtools/distcc/distcc_3.4.bb b/meta/recipes-devt=
ools/distcc/distcc_3.4.bb
index 392f4ae272..f5f3ebcbef 100644
--- a/meta/recipes-devtools/distcc/distcc_3.4.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.4.bb
@@ -15,7 +15,7 @@ PACKAGECONFIG[popt] =3D "--without-included-popt,--with-i=
ncluded-popt,popt"
=20
 RRECOMMENDS:${PN}-server =3D "avahi-daemon"
=20
-SRC_URI =3D "git://github.com/distcc/distcc.git;branch=3Dmaster;protocol=
=3Dhttps \
+SRC_URI =3D "git://github.com/distcc/distcc.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV} \
            file://default \
            file://distcc \
            file://distcc.service \
diff --git a/meta/recipes-devtools/dnf/dnf_4.24.0.bb b/meta/recipes-devtool=
s/dnf/dnf_4.24.0.bb
index d40b85c4b0..31bbb4032b 100644
--- a/meta/recipes-devtools/dnf/dnf_4.24.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263 \
                     file://PACKAGE-LICENSING;md5=3D4a0548e303dbc77f067335b=
4d688e745 \
                     "
=20
-SRC_URI =3D "git://github.com/rpm-software-management/dnf.git;branch=3Dmas=
ter;protocol=3Dhttps \
+SRC_URI =3D "git://github.com/rpm-software-management/dnf.git;branch=3Dmas=
ter;protocol=3Dhttps;tag=3D${PV} \
            file://0001-Corretly-install-tmpfiles.d-configuration.patch \
            file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.pa=
tch \
            file://0005-Do-not-prepend-installroot-to-logdir.patch \
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-d=
evtools/e2fsprogs/e2fsprogs.inc
index e83e8b6afa..e474f165e6 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =3D "file://NOTICE;md5=3Dd50be0580c0b0a7=
fbc7a4830bbe6c12b \
 SECTION =3D "base"
 DEPENDS =3D "util-linux attr autoconf-archive-native"
=20
-SRC_URI =3D "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=3Dm=
aster;protocol=3Dhttps"
+SRC_URI =3D "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=3Dm=
aster;protocol=3Dhttps;tag=3Dv${PV}"
=20
 inherit autotools gettext texinfo pkgconfig multilib_header update-alterna=
tives ptest
=20
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb b/meta/recipes-d=
evtools/libdnf/libdnf_0.75.0.bb
index ddcbc7d9ff..a757257abd 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION =3D "This library provides a high level package=
-manager. It's core lib
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
=20
-SRC_URI =3D "git://github.com/rpm-software-management/libdnf;branch=3Ddnf-=
4-master;protocol=3Dhttps \
+SRC_URI =3D "git://github.com/rpm-software-management/libdnf;branch=3Ddnf-=
4-master;protocol=3Dhttps;tag=3D${PV} \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-m=
o.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libd=
n.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb b/meta/recipes-de=
vtools/mtd/mtd-utils_2.3.1.bb
index e831ebb1d7..cb88b723f8 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb
@@ -12,7 +12,7 @@ DEPENDS =3D "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests +=3D "bash"
=20
 SRCREV =3D "053ee1038e5dedae61a88cadfb7bdfe9894d8bb6"
-SRC_URI =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster \
+SRC_URI =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster;tag=3Dv=
${PV} \
            file://ubihealthd.service"
=20
 # xattr support creates an additional compile-time dependency on acl becau=
se
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb b/meta/re=
cipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
index 9f1a91e1d3..50d7b10bcc 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36c=
aa9b7df079bae19f \
                     file://opkg.py;beginline=3D2;endline=3D18;md5=3Dffa11f=
f3c15eb31c6a7ceaa00cc9f986"
 PROVIDES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives'=
, 'virtual/update-alternatives', '', d)}"
=20
-SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dhttps;branch=
=3Dmaster \
+SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV} \
            file://0001-update-alternatives-correctly-match-priority.patch =
\
            "
 SRCREV =3D "68a969f0e867ace0d94faf8ebe7c7bb67f59d386"
diff --git a/meta/recipes-devtools/patchelf/patchelf_git.bb b/meta/recipes-=
devtools/patchelf/patchelf_git.bb
index adc1198937..741c1e6612 100644
--- a/meta/recipes-devtools/patchelf/patchelf_git.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://github.com/NixOS/patchelf"
=20
 LICENSE =3D "GPL-3.0-only"
=20
-SRC_URI =3D "git://github.com/NixOS/patchelf;protocol=3Dhttps;branch=3Dmas=
ter"
+SRC_URI =3D "git://github.com/NixOS/patchelf;protocol=3Dhttps;branch=3Dmas=
ter;tag=3D${PV}"
 SRCREV =3D "7688b17c18d16f67fa8d5a82a2404c2e3a18648d"
=20
 PV =3D "0.19.1"
diff --git a/meta/recipes-devtools/python/python3-dtc_1.8.1.bb b/meta/recip=
es-devtools/python/python3-dtc_1.8.1.bb
index ea536d659d..51abf3640a 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
@@ -6,7 +6,7 @@ LICENSE =3D "BSD-2-Clause OR GPL-2.0-only"
=20
 DEPENDS =3D "flex-native bison-native swig-native python3-setuptools-scm-n=
ative libyaml dtc"
=20
-SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmain;=
protocol=3Dhttps \
+SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmain;=
protocol=3Dhttps;tag=3Dv${PV} \
            "
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb b/met=
a/recipes-devtools/python/python3-pefile_2024.8.26.bb
index 11765b3cb3..662413b704 100644
--- a/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
+++ b/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De34c75178086aca0=
a17551ffbacaca53"
=20
 inherit setuptools3 ptest-python-pytest
 SRCREV =3D "4b3b1e2e568a88d4f1897d694d684f23d9e270c4"
-SRC_URI =3D "git://github.com/erocarrera/pefile;branch=3Dmaster;protocol=
=3Dhttps \
+SRC_URI =3D "git://github.com/erocarrera/pefile;branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV} \
            file://run-ptest"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cve=
list-native_2026-06-24.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-c=
heck-update-cvelist-native_2026-06-24.bb
index ca192bc9cf..ef61eb4628 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-na=
tive_2026-06-24.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-na=
tive_2026-06-24.bb
@@ -3,7 +3,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
=20
 HOMEPAGE =3D "https://github.com/CVEProject/cvelistV5"
-SRC_URI =3D "git://github.com/CVEProject/cvelistV5.git;branch=3Dmain;proto=
col=3Dhttps;destsuffix=3D"
+SRC_URI =3D "git://github.com/CVEProject/cvelistV5.git;branch=3Dmain;proto=
col=3Dhttps;destsuffix=3D;tag=3D${PV}_baseline"
 SBOM_CVE_CHECK_DB_NAME =3D "cvelist"
=20
 SRCREV =3D "966bddf787997b471325e065cae82702a60c64ff"
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd=
-native_2026.06.24-000003.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cv=
e-check-update-nvd-native_2026.06.24-000003.bb
index 73d9e77692..95af1a5805 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native=
_2026.06.24-000003.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native=
_2026.06.24-000003.bb
@@ -3,7 +3,7 @@ LICENSE =3D "cve-tou"
 LIC_FILES_CHKSUM =3D "file://LICENSES/cve-tou.md;md5=3Dbc5bbf146f01e20ece6=
3d83c8916d8fb"
=20
 HOMEPAGE =3D "https://github.com/fkie-cad/nvd-json-data-feeds"
-SRC_URI =3D "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=3Dma=
in;protocol=3Dhttps;destsuffix=3D"
+SRC_URI =3D "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=3Dma=
in;protocol=3Dhttps;destsuffix=3D;tag=3Dv${PV}"
 SBOM_CVE_CHECK_DB_NAME =3D "nvd-fkie"
=20
 SRCREV =3D "11e62eba27133a54836b7a081d05ff96f72d879b"
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.=
bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
index a8976f8a3e..3e435e7777 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
@@ -8,7 +8,7 @@ LICENSE =3D "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c \
                     file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa88=
2bbe"
=20
-SRC_URI =3D "git://github.com/systemd/systemd-bootchart.git;protocol=3Dhtt=
ps;branch=3Dmain \
+SRC_URI =3D "git://github.com/systemd/systemd-bootchart.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV} \
            file://mips64.patch \
            file://no_lto.patch \
            file://0001-Add-riscv32-support.patch \
diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb b/meta/recip=
es-extended/asciidoc/asciidoc_10.2.1.bb
index 848c380363..44587e94fb 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Daaee33adce0fc7=
cc40fee23f82f7f101 \
                     file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
                     "
=20
-SRC_URI =3D "git://github.com/asciidoc/asciidoc-py;protocol=3Dhttps;branch=
=3Dmain"
+SRC_URI =3D "git://github.com/asciidoc/asciidoc-py;protocol=3Dhttps;branch=
=3Dmain;tag=3D${PV}"
 SRCREV =3D "21e33efe96ba9a51d99d1150691dae750afd6ed1"
=20
 DEPENDS =3D "libxml2-native libxslt-native docbook-xml-dtd4-native docbook=
-xsl-stylesheets-native"
diff --git a/meta/recipes-extended/cracklib/cracklib_2.10.3.bb b/meta/recip=
es-extended/cracklib/cracklib_2.10.3.bb
index 7feba2c950..48dd72d5f9 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
@@ -9,7 +9,7 @@ DEPENDS =3D "cracklib-native zlib"
=20
 EXTRA_OECONF =3D "--without-python --libdir=3D${base_libdir}"
=20
-SRC_URI =3D "git://github.com/cracklib/cracklib;protocol=3Dhttps;branch=3D=
main \
+SRC_URI =3D "git://github.com/cracklib/cracklib;protocol=3Dhttps;branch=3D=
main;tag=3Dv${PV} \
            "
=20
 SRCREV =3D "e73d5db1789d198b5f9ec44b68b9c775c3e6c042"
diff --git a/meta/recipes-extended/iputils/iputils_20250605.bb b/meta/recip=
es-extended/iputils/iputils_20250605.bb
index cdebf28ca3..4b09fd2083 100644
--- a/meta/recipes-extended/iputils/iputils_20250605.bb
+++ b/meta/recipes-extended/iputils/iputils_20250605.bb
@@ -8,7 +8,7 @@ LICENSE =3D "BSD-3-Clause AND GPL-2.0-or-later"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D627cc07ec86a45951d43e30658bbd81=
9"
=20
-SRC_URI =3D "git://github.com/iputils/iputils;branch=3Dmaster;protocol=3Dh=
ttps \
+SRC_URI =3D "git://github.com/iputils/iputils;branch=3Dmaster;protocol=3Dh=
ttps;tag=3D${PV} \
           "
 SRCREV =3D "6e1cb146547eb6fbb127ffc8397a9241be0d33c2"
=20
diff --git a/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb b/meta/recipes-e=
xtended/libnsl/libnsl2_2.0.1.bb
index ff4ae6c243..4d588e39aa 100644
--- a/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb
@@ -12,7 +12,7 @@ DEPENDS =3D "libtirpc"
=20
 CVE_PRODUCT =3D "libnsl_project:libnsl"
=20
-SRC_URI =3D "git://github.com/thkukuk/libnsl;branch=3Dmaster;protocol=3Dht=
tps"
+SRC_URI =3D "git://github.com/thkukuk/libnsl;branch=3Dmaster;protocol=3Dht=
tps;tag=3Dv${PV}"
 SRCREV =3D "d4b22e54b5e6637a69b26eab5faad2a326c9b182"
=20
 inherit autotools pkgconfig gettext
diff --git a/meta/recipes-extended/ltp/ltp_20260529.bb b/meta/recipes-exten=
ded/ltp/ltp_20260529.bb
index 0fc3946aa4..f3e20daf85 100644
--- a/meta/recipes-extended/ltp/ltp_20260529.bb
+++ b/meta/recipes-extended/ltp/ltp_20260529.bb
@@ -26,7 +26,7 @@ CFLAGS:append:powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
 SRCREV =3D "3a64d78f58bdceba93ed321e91215fb969a047ed"
=20
-SRC_URI =3D "git://github.com/linux-test-project/ltp.git;branch=3Dmaster;p=
rotocol=3Dhttps \
+SRC_URI =3D "git://github.com/linux-test-project/ltp.git;branch=3Dmaster;p=
rotocol=3Dhttps;tag=3D${PV} \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_R=
E.patch \
diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/recip=
es-extended/net-tools/net-tools_2.10.bb
index a21916fb26..a3c3d2920c 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263 \
                     file://ifconfig.c;beginline=3D11;endline=3D15;md5=3Dd1=
ca372080ad5401e23ca0afc35cf9ba"
=20
 SRCREV =3D "80d7b95067f1f22fece9537dea6dff53081f4886"
-SRC_URI =3D "git://git.code.sf.net/p/net-tools/code;protocol=3Dhttps;branc=
h=3Dmaster \
+SRC_URI =3D "git://git.code.sf.net/p/net-tools/code;protocol=3Dhttps;branc=
h=3Dmaster;tag=3Dv${PV} \
     file://net-tools-config.h \
     file://net-tools-config.make \
     file://Add_missing_headers.patch \
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes=
-extended/xinetd/xinetd_2.3.15.4.bb
index a15ea43d66..c82ea65ee2 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D55c5fdf02cfcca=
3fc9621b6f2ceae10f"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-SRC_URI =3D "git://github.com/openSUSE/xinetd.git;protocol=3Dhttps;branch=
=3Dmaster \
+SRC_URI =3D "git://github.com/openSUSE/xinetd.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV} \
            file://0001-Use-monotonic-time.patch \
            file://xinetd.init \
            file://xinetd.default \
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extend=
ed/zstd/zstd_1.5.7.bb
index 4960ed5b48..ef0bd54c9c 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0822a32f7acdbe=
013606746641746ee8 \
                     file://COPYING;md5=3D39bba7d2cf0ba1036f2a6e2be52fe3f0 =
\
                     "
=20
-SRC_URI =3D "git://github.com/facebook/zstd.git;branch=3Drelease;protocol=
=3Dhttps"
+SRC_URI =3D "git://github.com/facebook/zstd.git;branch=3Drelease;protocol=
=3Dhttps;tag=3Dv${PV}"
=20
 SRCREV =3D "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb b/meta/recipes-gn=
ome/libxmlb/libxmlb_0.3.28.bb
index 0e1c815362..47c07d0c29 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb
@@ -4,7 +4,7 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d7531074=
2"
=20
 SRC_URI =3D " \
-	git://github.com/hughsie/libxmlb.git;branch=3Dmain;protocol=3Dhttps \
+	git://github.com/hughsie/libxmlb.git;branch=3Dmain;protocol=3Dhttps;tag=
=3D${PV} \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb b/meta/recip=
es-graphics/libepoxy/libepoxy_1.5.10.bb
index 2427ce3f96..8c1011e94a 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
@@ -9,7 +9,7 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D58ef4c80d401e07bd9ee8b6b58cf464=
b"
=20
-SRC_URI =3D "git://github.com/anholt/libepoxy;branch=3Dmaster;protocol=3Dh=
ttps"
+SRC_URI =3D "git://github.com/anholt/libepoxy;branch=3Dmaster;protocol=3Dh=
ttps;tag=3D${PV}"
 SRCREV =3D "c84bc9459357a40e46e2fec0408d04fbdde2c973"
=20
 inherit meson pkgconfig features_check github-releases
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb b/meta/=
recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
index 3359193d65..1efacd2f51 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
@@ -11,7 +11,7 @@ SECTION =3D "x11/wm"
 DEPENDS =3D "libmatchbox virtual/libx11 libxext libxrender startup-notific=
ation expat gconf libxcursor libxfixes"
=20
 SRCREV =3D "ce8c1053270d960a7235ab5c3435f707541810a4"
-SRC_URI =3D "git://git.yoctoproject.org/matchbox-window-manager;branch=3Dm=
aster;protocol=3Dhttps \
+SRC_URI =3D "git://git.yoctoproject.org/matchbox-window-manager;branch=3Dm=
aster;protocol=3Dhttps;tag=3D${PV} \
            file://kbdconfig"
=20
 inherit autotools pkgconfig features_check
diff --git a/meta/recipes-graphics/waffle/waffle_1.8.3.bb b/meta/recipes-gr=
aphics/waffle/waffle_1.8.3.bb
index 377187b499..1a2265b4c6 100644
--- a/meta/recipes-graphics/waffle/waffle_1.8.3.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.8.3.bb
@@ -9,7 +9,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4c5154407c2490750dd461c50ad=
94797 \
                     file://include/waffle-1/waffle.h;endline=3D24;md5=3D61=
dbf8697f61c78645e75a93c585b1bf"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=3Dhttps=
;branch=3Dmaint-1.8"
+SRC_URI =3D "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=3Dhttps=
;branch=3Dmaint-1.8;tag=3Dv${PV}"
 SRCREV =3D "920b709036d7313b59007435786fc3da61af31ab"
=20
 inherit meson features_check lib_package bash-completion pkgconfig
diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb b/meta/recipes=
-graphics/xorg-lib/libxcvt_0.1.3.bb
index 1e2c626143..aed61b0216 100644
--- a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
@@ -6,7 +6,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D129947a06984d6faa6f9a9788fa2a03=
f"
 SECTION =3D "x11/libs"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=3D=
https;branch=3Dmaster"
+SRC_URI =3D "git://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=3D=
https;branch=3Dmaster;tag=3D${BPN}-${PV}"
 SRCREV =3D "dd8631c61465cc0de5e476c7a98e56528d62b163"
=20
 inherit meson
diff --git a/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb b/meta/recipes-=
kernel/blktrace/blktrace_1.3.0.bb
index 2c1b6b1d6c..6f9e19b1a9 100644
--- a/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f696=
5873eca0259a17f833"
=20
 DEPENDS =3D "libaio"
=20
-SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.=
git;protocol=3Dhttps;branch=3Dmaster \
+SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.=
git;protocol=3Dhttps;branch=3Dmaster;tag=3D${BPN}-${PV} \
            file://0001-bno_plot.py-btt_plot.py-Ask-for-python3-specificall=
y.patch \
           "
=20
diff --git a/meta/recipes-kernel/dtc/dtc_1.8.1.bb b/meta/recipes-kernel/dtc=
/dtc_1.8.1.bb
index e2c7edcc46..ade36a4e58 100644
--- a/meta/recipes-kernel/dtc/dtc_1.8.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.8.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://GPL;md5=3Db234ee4d69f5fce448=
6a80fdaf4a4263 \
                     "
=20
 SRC_URI =3D " \
-    git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmain;protocol=
=3Dhttps \
+    git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmain;protocol=
=3Dhttps;tag=3Dv${PV} \
 "
 SRCREV =3D "8f48565e5cfedc74d3f7512f1e0188e9d85dc1de"
=20
diff --git a/meta/recipes-kernel/powertop/powertop_2.15.bb b/meta/recipes-k=
ernel/powertop/powertop_2.15.bb
index a9008b4074..5dceac17d3 100644
--- a/meta/recipes-kernel/powertop/powertop_2.15.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.15.bb
@@ -6,7 +6,7 @@ DEPENDS =3D "ncurses libnl pciutils autoconf-archive-native=
"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7=
e"
=20
-SRC_URI =3D "git://github.com/fenrus75/powertop;protocol=3Dhttps;branch=3D=
master \
+SRC_URI =3D "git://github.com/fenrus75/powertop;protocol=3Dhttps;branch=3D=
master;tag=3Dv${PV} \
            file://0001-wakeup_xxx.h-include-limits.h.patch \
            "
 SRCREV =3D "d51ad395436d4d1dcc3ca46e1519ffeb475bf651"
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.=
bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
index ece4f25eca..3ec0027917 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
@@ -2,6 +2,6 @@ require matchbox-theme-sato.inc
=20
 # SRCREV tagged 0.2
 SRCREV =3D "df085ba9cdaeaf2956890b0e29d7ea1779bf6c78"
-SRC_URI =3D "git://git.yoctoproject.org/matchbox-sato;branch=3Dmaster;prot=
ocol=3Dhttps"
+SRC_URI =3D "git://git.yoctoproject.org/matchbox-sato;branch=3Dmaster;prot=
ocol=3Dhttps;tag=3D${PV}"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
=20
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/met=
a/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index 27850a8b98..adb9251fd7 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -11,7 +11,7 @@ DEPENDS =3D "matchbox-panel-2 gtk+3"
=20
 # SRCREV tagged 0.3
 SRCREV =3D "9250fa5a012d84ff45984e8c4345ee7635227756"
-SRC_URI =3D "git://git.yoctoproject.org/screenshot;branch=3Dmaster;protoco=
l=3Dhttps"
+SRC_URI =3D "git://git.yoctoproject.org/screenshot;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D${PV}"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
=20
 inherit autotools pkgconfig features_check
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testi=
ng_2021.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-tes=
ting_2021.1.bb
index 4fcad4814b..30e4f1882f 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021=
.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021=
.1.bb
@@ -9,7 +9,7 @@ LICENSE =3D "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f7e=
7 \
                     file://src/gnome-desktop-testing-runner.c;beginline=3D=
1;endline=3D20;md5=3D7ef3ad9da2ffcf7707dc11151fe007f4"
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protoc=
ol=3Dhttps;branch=3Dmaster \
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protoc=
ol=3Dhttps;branch=3Dmaster;tag=3Dv${PV} \
            file://0001-fix-non-literal-format-string-issue-with-clang.patc=
h \
           "
 SRCREV =3D "e346cd4ed2e2102c9b195b614f3c642d23f5f6e7"
diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb =
b/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
index 3dc02261dd..380c12b867 100644
--- a/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
+++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
@@ -8,7 +8,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De4426409957080ee0352128354cea2d=
e"
 DEPENDS =3D "hwdata-native"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;bra=
nch=3Dmain;protocol=3Dhttps"
+SRC_URI =3D "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;bra=
nch=3Dmain;protocol=3Dhttps;tag=3D${PV}"
 SRCREV =3D "47a5590e9c4eb35d67651b8c05a55f1a48259329"
=20
 inherit meson pkgconfig lib_package
diff --git a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb b/meta/rec=
ipes-support/libseccomp/libseccomp_2.6.0.bb
index b356862dfd..44260e3032 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
@@ -9,7 +9,7 @@ DEPENDS +=3D "gperf-native"
=20
 SRCREV =3D "c7c0caed1d04292500ed4b9bb386566053eb9775"
=20
-SRC_URI =3D "git://github.com/seccomp/libseccomp.git;branch=3Drelease-2.6;=
protocol=3Dhttps \
+SRC_URI =3D "git://github.com/seccomp/libseccomp.git;branch=3Drelease-2.6;=
protocol=3Dhttps;tag=3Dv${PV} \
            file://0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.p=
atch \
            file://run-ptest \
            "
diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/=
lz4/lz4_1.10.0.bb
index 61a7237f83..5a39f89871 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -12,7 +12,7 @@ PE =3D "1"
=20
 SRCREV =3D "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
=20
-SRC_URI =3D "git://github.com/lz4/lz4.git;branch=3Drelease;protocol=3Dhttp=
s \
+SRC_URI =3D "git://github.com/lz4/lz4.git;branch=3Drelease;protocol=3Dhttp=
s;tag=3Dv${PV} \
            file://reproducibility.patch \
            file://run-ptest \
            file://fix-null-error-handling.patch \
diff --git a/meta/recipes-support/numactl/numactl_2.0.19.bb b/meta/recipes-=
support/numactl/numactl_2.0.19.bb
index 5fd35f1770..35bb401935 100644
--- a/meta/recipes-support/numactl/numactl_2.0.19.bb
+++ b/meta/recipes-support/numactl/numactl_2.0.19.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://README.md;beginline=3D19;end=
line=3D32;md5=3D9f34c3af4ed6f3f
=20
 SRCREV =3D "3bc85e37d5a30da6790cb7e8bb488bb8f679170f"
=20
-SRC_URI =3D "git://github.com/numactl/numactl;branch=3Dmaster;protocol=3Dh=
ttps \
+SRC_URI =3D "git://github.com/numactl/numactl;branch=3Dmaster;protocol=3Dh=
ttps;tag=3Dv${PV} \
            file://Fix-the-test-output-format.patch \
            file://Makefile \
            file://run-ptest \
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.17.bb b/meta/recipe=
s-support/rng-tools/rng-tools_6.17.bb
index 9085658697..a6578c0fe0 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.17.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.17.bb
@@ -6,7 +6,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
 DEPENDS =3D "openssl libcap"
=20
-SRC_URI =3D "git://github.com/nhorman/rng-tools.git;branch=3Dmaster;protoc=
ol=3Dhttps \
+SRC_URI =3D "git://github.com/nhorman/rng-tools.git;branch=3Dmaster;protoc=
ol=3Dhttps;tag=3Dv${PV} \
            file://init \
            file://default \
            file://rng-tools.service \
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.b=
b b/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb
index f4551c8f59..7ff69a4c99 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263"
=20
 DEPENDS =3D "libxml2 glib-2.0 shared-mime-info-native xmlto-native"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protoco=
l=3Dhttps;branch=3Dmaster \
+SRC_URI =3D "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protoco=
l=3Dhttps;branch=3Dmaster;tag=3D${PV} \
            "
 SRCREV =3D "fd8ab89c20093f1bfba8fa9e302ba584fffd0fd7"
=20
diff --git a/meta/recipes-support/xxhash/xxhash_0.8.3.bb b/meta/recipes-sup=
port/xxhash/xxhash_0.8.3.bb
index 75b34bb0a2..dc9bbe5563 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.3.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D13be6b481ff5616f=
77dda971191bb29b \
                     file://cli/COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
                     "
=20
-SRC_URI =3D "git://github.com/Cyan4973/xxHash.git;branch=3Drelease;protoco=
l=3Dhttps"
+SRC_URI =3D "git://github.com/Cyan4973/xxHash.git;branch=3Drelease;protoco=
l=3Dhttps;tag=3Dv${PV}"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 SRCREV =3D "e626a72bc2321cd320e953a0ccf1584cad60f363"
--=20
2.34.1


