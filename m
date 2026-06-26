Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB39CD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 07:38:49 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30167.1782459526129430810
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 00:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=WBarkgX2;
 spf=pass (domain: ericsson.com, ip: 40.107.130.22, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZgpuO/5gLQxKgMpCnl3GB7f+j9Hit5hUyxEta1jkYDs/sI2wW7+ebjAbWSojgGRuzIRFWrdfPBprSXeGc0NtjwEkUiDjHWENaIM1UfjjF+48rXwaPNY3GDw7/aOaRj3M927q7nGWuDHJBc7aBoCKz08oTQH0agoMqeutLcBP/2uwvBYxP98nX6CSqOMX2XWurXcur7co0Z3sHYnlzIQEoJm5uAQ/XldJIXRz9EHeGgP0Hz2N/PTUHpxljjIE7mH5KEvf+X7As1Q8mvR07jd1bBoA/xG7RYyHUJs22rZVmkqDRbYV3XCtLPn8EVPdF4+LyxEP5YhOWLIQOBdNB1fiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njJGUV7krhCZka3zqE/umt2PBeR2h9s/a4juEpV8160=;
 b=r7j2VUMmXCbD3jf7RQhho9ODU7T5cv3w7QIMmEhy3y9v2Ehp3SZrPJ5gxvaI6UuHtd/Cj4kPKP+fE6QVqHMu1+xRyuB4/QwvE8xg/I5cn64J6B0g25THzLUc2M8J7fycA+4eTHyqnV5MMbHFxAKevUs6X+32o7M7EwETRWiRBEaAV1uPtYI3B0RtLLVNHrq6ODAhO7UhEru5yNNp6Ci7ep7ErQLji9wfnPHheZVSHJGSholDGRzeaEgyR3KWTApfvCSH/G6y0A6CH2oJ3IYU4JM6hC8btgtdKbb9rTBLfmAkteqk1pfu+A5rRhrkN4f/gNxIS4CfKaQqW2jw631YWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njJGUV7krhCZka3zqE/umt2PBeR2h9s/a4juEpV8160=;
 b=WBarkgX2EeO9MQYrnYJMebVeNxhS6voQmNRiRko5GH+z5tk0s1kw/V28lMqBDSUnfeXMdK+Zb2lPiJWb/JL8rN1Gj6aewfPw8G02ShOulk4LO5yHV7FNjn/aCP1c5D73IjRv1TBKk6lEOxNaPpOKI6hVMJ5iAsXISyoiIrtl/nnvPJlL0c+a5iLQmBBJYkw1OfJqiHpkolH3CooLRn8LZ6GvwornjsJol+n86GPZg5rV6OJUx4Xa0ZBdgXaDMhcLUCF1u9AoTyfPfspQkQdyu2IM2Y19y1sRTrGSnyktSaFBcUWatv9ULcfd+YjlnbrpbVqpCtb27skHVY3wN48A4g==
Received: from CWLP265CA0297.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5d::21)
 by PAWPR07MB10047.eurprd07.prod.outlook.com (2603:10a6:102:382::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 07:38:37 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:401:5d:cafe::ba) by CWLP265CA0297.outlook.office365.com
 (2603:10a6:401:5d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 07:38:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 07:38:37 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 09:38:36 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 960C24024D94;
	Fri, 26 Jun 2026 09:38:19 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 6C693700DF4B; Fri, 26 Jun 2026 09:38:19 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anders.heimer@est.tech>, <qi.chen@windriver.com>,
	<alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<joerg.sommer@navimatix.de>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 2/3] systemd: upgrade to 261
Date: Fri, 26 Jun 2026 09:38:08 +0200
Message-ID: <20260626073812.769193-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626073812.769193-1-daniel.turull@ericsson.com>
References: <20260626073812.769193-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B0:EE_|PAWPR07MB10047:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a3cfc5-f7a4-4c86-d710-08ded355ef37
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|22082099003|3023799007|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	j/Xjw+YvTzss77MQLWYSalGPX1gNu2A+V6lf1uIOuPgNXyB81hfPCFaGuSnVjyCeEWYdEjtp5s6UAZW1yfKrg3rNROR0ZkA7SO+oqrE9ibpXaF7aXKabdxDgL6uobiA/WwqXAlK2EXcCrEjo3/aubcAk65XHsyWiJnbMAyQpDo+3wJlMxF+fTNy/XORjas3ofak8+LN5JSlTUknucdP8bdNsPDoLxpfJxrE5ztaHCrDiPSz3BtC6NIewFaaeznz4VeTRfP1xeXcZGYSgA5+UJdQOeGzGBaHIhX7sxXIhLgHtLogPPYFX+OKdyFjb+pdLAtAfPXdyB/ICroetQZntB/Dl3C+n0PYFABycWlKnDLaT/ERIfKWLD5ApqijTmDhYQ6hjC4yn1YFxHFTeON4elHR+433du4b9r74dIdz5wfF3XVAo3J1FLUpk0J333XO6ohK6V8z7ZIUnuum5YZQ0ko1ISKwVaKbhQ/I6s+bKI/PXCLdzERiHW3rStEi3UhFocAZ87k2rsq9DFYdHt4sDCQbQ++4n+oZ9ydBnQr3pPfxP3YZMr+jkcRlblStedw+v14mRimnGzj+DLNxhtrNRwYez8QaVYyrZyixhX+fWjVSgXItksLJzan9W1M8l9ZEpaZHb4fqnj1nK1NgjeGEcH/xc6NXeQExPiS+ldHYNjrUkjAcBXwJ2e1WGOD13N9Nlxj8PIaVvY9/7x6dQlH3uiw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(22082099003)(3023799007)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BSaVgw2oKTgC4/bWZxu+TsiRJZa3bpFj2sPqyftQWMJEo1w3EtLNk6OxJkbwYsGtu5GOLEbtPuQ7wVxu+ZilxOS/CwivEPtl+DNNo4f06LadsU//Vo7+ejGRy9/Qg2YpxmOWJJsiYlTecBToaqZC/X/8rfdzh3benk0j/ZP42/evw3T8d07V13m5DgEgGDGMMJS7Hs/J+40cCw4RjBJQANIqcyjMuTiRRL8epIL3TBvJTi9xZIvD3Q/q+17NMzfoIzCCoxKea30CA0EaL1wM2kREh8i+bqD8f21pCVVkS5T9al0KAPQWnhPOk74B1FrkJ6DEjMP4dih3Z4L1fdFmpXbNZ2YQ36YTOqhO2ZCAsJt/3HGl8c/S7Mbnq8NhIQFScGTerq7Bh6jlgGcDRyejAsSWCMjsrJ3SjbnBRbqE5z3vSH7cyPOeK8pm6AnDhtTr
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 07:38:37.1659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a3cfc5-f7a4-4c86-d710-08ded355ef37
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB10047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 07:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239610

From: Daniel Turull <daniel.turull@ericsson.com>

Changes: https://github.com/systemd/systemd/compare/v259.5...v261-stable

- Drop backported patches no longer needed (libfido2_cflags,
  tpm2-util PCR bank, fdset_new debug)
- Remove sysvinit-path/sysvrcnd-path meson options and
  systemd-sysv-install skeleton (removed upstream in 260)
- Add explicit meson disables for auto-detected features in
  systemd-systemctl-native to prevent host sysroot contamination
- Refresh 0003-Do-not-create-var-log-README.patch

Tested on qemu target with testsuite systemd

AI-Generated: Claude-opus-4.6
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 ...ve_259.5.bb =3D> systemd-boot-native_261.bb} |  0
 ...temd-boot_259.5.bb =3D> systemd-boot_261.bb} |  0
 ...9.5.bb =3D> systemd-systemctl-native_261.bb} | 17 ++--
 meta/recipes-core/systemd/systemd.inc         |  8 +-
 ...meson-use-libfido2_cflags-dependency.patch | 54 -----------
 .../0003-Do-not-create-var-log-README.patch   | 10 +-
 ...il-fix-PCR-bank-guessing-without-EFI.patch | 62 ------------
 ...-detailed-debug-logging-to-fdset_new.patch | 97 -------------------
 .../{systemd_259.5.bb =3D> systemd_261.bb}      | 12 +--
 9 files changed, 18 insertions(+), 242 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_259.5.bb =3D> system=
d-boot-native_261.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_259.5.bb =3D> systemd-boot_=
261.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_259.5.bb =3D> s=
ystemd-systemctl-native_261.bb} (54%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-use-libfid=
o2_cflags-dependency.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PC=
R-bank-guessing-without-EFI.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0018-shared-fdset-add=
-detailed-debug-logging-to-fdset_new.patch
 rename meta/recipes-core/systemd/{systemd_259.5.bb =3D> systemd_261.bb} (9=
9%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_259.5.bb b/meta/=
recipes-core/systemd/systemd-boot-native_261.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_259.5.bb
rename to meta/recipes-core/systemd/systemd-boot-native_261.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes=
-core/systemd/systemd-boot_261.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_259.5.bb
rename to meta/recipes-core/systemd/systemd-boot_261.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_261.bb
similarity index 54%
rename from meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_261.bb
index 3d01d60e9c..686448cf1e 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_261.bb
@@ -10,19 +10,16 @@ inherit pkgconfig meson native
=20
 MESON_TARGET =3D "systemctl:executable"
 MESON_INSTALL_TAGS =3D "systemctl"
+# Explicitly disable features that meson auto-detects from the native sysr=
oot.
+# Only systemctl is built here; these prevent spurious dependencies and en=
sure
+# reproducible builds regardless of what is installed on the build host.
 EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
-EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
+EXTRA_OEMESON +=3D "-Dpam=3Ddisabled -Daudit=3Ddisabled -Dselinux=3Ddisabl=
ed"
+EXTRA_OEMESON +=3D "-Dacl=3Ddisabled -Dapparmor=3Ddisabled -Dseccomp=3Ddis=
abled"
+EXTRA_OEMESON +=3D "-Dlibcryptsetup=3Ddisabled -Dlibcurl=3Ddisabled -Dlibf=
ido2=3Ddisabled"
+EXTRA_OEMESON +=3D "-Dpcre2=3Ddisabled -Dp11kit=3Ddisabled -Dopenssl=3Ddis=
abled"
=20
 # Systemctl is supposed to operate on target, but the target sysroot is no=
t
 # determined at run-time, but rather set during configure
 # More details are here https://github.com/systemd/systemd/issues/35897#is=
suecomment-2665405887
 EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"
-
-do_install:append() {
-	# Install systemd-sysv-install in /usr/bin rather than /usr/lib/systemd
-	# (where it is normally installed) so systemctl can find it in $PATH.
-	# It is expected that the use of systemd-sysv-install will be removed
-	# with version 259 of systemd and then this, and everything that was
-	# added along with it, should be reverted.
-	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${b=
indir}/systemd-sysv-install
-}
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index f107c4c5da..d9048e9187 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,14 +15,10 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3Dc09786363500a9acc29b147e6e=
72d2c6 \
                     file://LICENSE.LGPL2.1;md5=3Dbe0aaf4a380f73f7e00b420a0=
07368f2"
=20
-SRCREV =3D "b3d8fc43e9cb531d958c17ef2cd93b374bc14e8a"
-SRCBRANCH =3D "v259-stable"
+SRCREV =3D "de9dbc37ad4aa637e200ac02a0545095997055df"
+SRCBRANCH =3D "v261-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH};tag=3Dv${PV}"
=20
 CVE_PRODUCT =3D "systemd"
=20
 CVE_STATUS[CVE-2019-3815] =3D "not-applicable-platform: only applied to RH=
EL"
-CVE_STATUS[CVE-2026-40223] =3D "fixed-version: fixed in 259.2"
-CVE_STATUS[CVE-2026-40224] =3D "fixed-version: fixed in 259.3"
-CVE_STATUS[CVE-2026-40225] =3D "fixed-version: fixed in 259.5"
-CVE_STATUS[CVE-2026-40226] =3D "fixed-version: fixed in 259.4"
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cfla=
gs-dependency.patch b/meta/recipes-core/systemd/systemd/0001-meson-use-libf=
ido2_cflags-dependency.patch
deleted file mode 100644
index 4bc1e10ee7..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-depe=
ndency.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 97142fd1db4124de5d5bdd3f49cc5a390286e522 Mon Sep 17 00:00:00 2001
-From: Dan McGregor <danmcgr@protonmail.com>
-Date: Wed, 11 Mar 2026 18:26:05 -0600
-Subject: [PATCH] meson: use libfido2_cflags dependency
-
-Add the libfido2 dependency to cryptenroll and cryptsetup's
-meson files. If libfido2's not installed in the default path
-the build wasn't finding its headers correctly.
-
-Signed-off-by: Dan McGregor <danmcgr@protonmail.com>
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/9ce90=
5e35f690e7a10cd286be2b50594d0857f5e]
----
- src/cryptenroll/meson.build                  | 1 +
- src/cryptsetup/cryptsetup-tokens/meson.build | 2 +-
- src/cryptsetup/meson.build                   | 1 +
- 3 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/cryptenroll/meson.build b/src/cryptenroll/meson.build
-index 488ceea14d..11265c8b41 100644
---- a/src/cryptenroll/meson.build
-+++ b/src/cryptenroll/meson.build
-@@ -23,6 +23,7 @@ executables +=3D [
-                 'dependencies' : [
-                         libcryptsetup,
-                         libdl,
-+                        libfido2_cflags,
-                         libopenssl,
-                         libp11kit_cflags,
-                 ],
-diff --git a/src/cryptsetup/cryptsetup-tokens/meson.build b/src/cryptsetup=
/cryptsetup-tokens/meson.build
-index 804e18bc67..0fd6309201 100644
---- a/src/cryptsetup/cryptsetup-tokens/meson.build
-+++ b/src/cryptsetup/cryptsetup-tokens/meson.build
-@@ -58,7 +58,7 @@ modules +=3D [
-                 'sources' : cryptsetup_token_systemd_fido2_sources,
-                 'dependencies' : [
-                         libcryptsetup,
--                        libfido2,
-+                        libfido2_cflags,
-                 ],
-         },
-         template + {
-diff --git a/src/cryptsetup/meson.build b/src/cryptsetup/meson.build
-index d9778259c2..b36354fb0a 100644
---- a/src/cryptsetup/meson.build
-+++ b/src/cryptsetup/meson.build
-@@ -19,6 +19,7 @@ executables +=3D [
-                 'sources' : systemd_cryptsetup_sources,
-                 'dependencies' : [
-                         libcryptsetup,
-+                        libfido2_cflags,
-                         libmount_cflags,
-                         libopenssl,
-                         libp11kit_cflags,
diff --git a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-R=
EADME.patch b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-=
README.patch
index 1d3c4f83c0..0128c83d9f 100644
--- a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch
+++ b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch
@@ -1,7 +1,7 @@
 From a7f6a296707642d05463aec22ea3dfce7d06c989 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Tue, 21 Jan 2025 05:02:00 +0100
-Subject: [PATCH 03/16] Do not create /var/log/README
+Subject: [PATCH] Do not create /var/log/README
=20
 /var/log/README is a link to /usr/share/doc/systemd/README.logs. The
 latter is packaged in systemd-doc and likely not installed, which leaves
@@ -15,19 +15,15 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@a=
xis.com>
  1 file changed, 3 deletions(-)
=20
 diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
-index cdef21fa9b..03798c953e 100644
+index cdef21fa9b..7890abcdef 100644
 --- a/tmpfiles.d/legacy.conf.in
 +++ b/tmpfiles.d/legacy.conf.in
-@@ -13,9 +13,6 @@
+@@ -13,6 +13,3 @@
 =20
  d /run/lock 0755 root root -
  L /var/lock - - - - ../run/lock
 -{% if CREATE_LOG_DIRS %}
 -L$ /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
 -{% endif %}
-=20
- {% if HAVE_SYSV_COMPAT %}
- # /run/lock/subsys is used for serializing SysV service execution, and
 --=20
 2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-=
guessing-without-EFI.patch b/meta/recipes-core/systemd/systemd/0004-tpm2-ut=
il-fix-PCR-bank-guessing-without-EFI.patch
deleted file mode 100644
index c590b01cd3..0000000000
--- a/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-guessin=
g-without-EFI.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 3cef11c710e95bb5f891181e9b2a6d8f174712c3 Mon Sep 17 00:00:00 2001
-From: Patrick Wicki <patrick.wicki@subset.ch>
-Date: Fri, 20 Mar 2026 15:56:56 +0100
-Subject: [PATCH] tpm2-util: fix PCR bank guessing without EFI
-
-Since 7643e4a89 efi_get_active_pcr_banks() is used to determine the
-active PCR banks. Without EFI support, this returns -EOPNOTSUPP. This in
-turns leads to cryptenroll and cryptsetup attach failures unless the PCR
-bank is explicitly set, i.e.
-
-$ systemd-cryptenroll $LUKS_PART --tpm2-device=3Dauto --tpm2-pcrs=3D'7'
-[...]
-Could not read pcr values: Operation not supported
-
-But it works fine with --tpm2-pcrs=3D'7:sha256'.
-
-Similarly, unsealing during cryptsetup attach also fails if the bank
-needs to be determined:
-
-Failed to unseal secret using TPM2: Operation not supported
-
-Catch the -EOPNOTSUPP and fallback to the guessing strategy.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/41231]
-
-Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
----
- src/shared/tpm2-util.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/shared/tpm2-util.c b/src/shared/tpm2-util.c
-index cf11b50695..c0590fe575 100644
---- a/src/shared/tpm2-util.c
-+++ b/src/shared/tpm2-util.c
-@@ -2702,11 +2702,11 @@ int tpm2_get_best_pcr_bank(
-         uint32_t efi_banks;
-         r =3D efi_get_active_pcr_banks(&efi_banks);
-         if (r < 0) {
--                if (r !=3D -ENOENT)
-+                if (!IN_SET(r, -ENOENT, -EOPNOTSUPP))
-                         return r;
-=20
-                 /* If variable is not set use guesswork below */
--                log_debug("Boot loader didn't set the LoaderTpm2ActivePcr=
Banks EFI variable, we have to guess the used PCR banks.");
-+                log_debug("Boot loader didn't set the LoaderTpm2ActivePcr=
Banks EFI variable or EFI support is unavailable, we have to guess the used=
 PCR banks.");
-         } else if (efi_banks =3D=3D UINT32_MAX)
-                 log_debug("Boot loader set the LoaderTpm2ActivePcrBanks E=
FI variable to indicate that the GetActivePcrBanks() API is not available i=
n the firmware. We have to guess the used PCR banks.");
-         else {
-@@ -2811,11 +2811,11 @@ int tpm2_get_good_pcr_banks(
-         uint32_t efi_banks;
-         r =3D efi_get_active_pcr_banks(&efi_banks);
-         if (r < 0) {
--                if (r !=3D -ENOENT)
-+                if (!IN_SET(r, -ENOENT, -EOPNOTSUPP))
-                         return r;
-=20
-                 /* If the variable is not set we have to guess via the co=
de below */
--                log_debug("Boot loader didn't set the LoaderTpm2ActivePcr=
Banks EFI variable, we have to guess the used PCR banks.");
-+                log_debug("Boot loader didn't set the LoaderTpm2ActivePcr=
Banks EFI variable or EFI support is unavailable, we have to guess the used=
 PCR banks.");
-         } else if (efi_banks =3D=3D UINT32_MAX)
-                 log_debug("Boot loader set the LoaderTpm2ActivePcrBanks E=
FI variable to indicate that the GetActivePcrBanks() API is not available i=
n the firmware. We have to guess the used PCR banks.");
-         else {
diff --git a/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detail=
ed-debug-logging-to-fdset_new.patch b/meta/recipes-core/systemd/systemd/001=
8-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch
deleted file mode 100644
index 63fa7fefec..0000000000
--- a/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detailed-debu=
g-logging-to-fdset_new.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 0565f9f27323a8f9e62d85f2add542af99cea06a Mon Sep 17 00:00:00 2001
-From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
-Date: Wed, 21 Jan 2026 14:13:29 +0530
-Subject: [PATCH] systemd: Add detailed debug logging to fdset_new_fill()
-
-Currently, when fdset_new_fill() fails to open /proc/self/fd or
-encounters an error while processing individual file descriptors
-(such as fcntl or fstat failures), it returns a silent error code.
-
-For debugging rarely reproducible failures it becomes difficult to
-know the exact cause of failure
-This commit updates the function to use log_debug_errno() for all
-error paths and hence  provides better visibility into why FD collection
-failed, including the path of the problematic FD (via fd_get_path)
-and its inode type.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/40385]
-
-Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
----
- src/shared/fdset.c | 35 ++++++++++++++++++++++++++---------
- 1 file changed, 26 insertions(+), 9 deletions(-)
-
-diff --git a/src/shared/fdset.c b/src/shared/fdset.c
-index 832e7fda60..f340f41b0e 100644
---- a/src/shared/fdset.c
-+++ b/src/shared/fdset.c
-@@ -8,6 +8,7 @@
- #include "alloc-util.h"
- #include "async.h"
- #include "dirent-util.h"
-+#include "errno-util.h"
- #include "fd-util.h"
- #include "fdset.h"
- #include "log.h"
-@@ -179,9 +180,10 @@ int fdset_new_fill(
-         d =3D opendir("/proc/self/fd");
-         if (!d) {
-                 if (errno =3D=3D ENOENT && proc_mounted() =3D=3D 0)
--                        return -ENOSYS;
-+                        return log_debug_errno(SYNTHETIC_ERRNO(ENOSYS),
-+                                               "Failed to open /proc/self=
/fd/, /proc/ is not mounted.");
-=20
--                return -errno;
-+                return log_debug_errno(errno, "Failed to open /proc/self/=
fd/: %m ");
-         }
-=20
-         s =3D fdset_new();
-@@ -210,9 +212,14 @@ int fdset_new_fill(
-                          * been passed in can be collected and fds which =
have been created locally can be
-                          * ignored, under the assumption that only the la=
tter have O_CLOEXEC set. */
-=20
--                        fl =3D fcntl(fd, F_GETFD);
--                        if (fl < 0)
--                                return -errno;
-+                        fl =3D RET_NERRNO(fcntl(fd, F_GETFD));
-+                        if (fl < 0) {
-+                                _cleanup_free_ char *path =3D NULL;
-+                                (void) fd_get_path(fd, &path);
-+                                return log_debug_errno(fl,
-+                                                       "Failed to get fla=
g of fd=3D%d (%s): %m ",
-+                                                       fd, strna(path));
-+                        }
-=20
-                         if (FLAGS_SET(fl, FD_CLOEXEC) !=3D !!filter_cloex=
ec)
-                                 continue;
-@@ -221,13 +228,23 @@ int fdset_new_fill(
-                 /* We need to set CLOEXEC manually only if we're collecti=
ng non-CLOEXEC fds. */
-                 if (filter_cloexec <=3D 0) {
-                         r =3D fd_cloexec(fd, true);
--                        if (r < 0)
--                                return r;
-+                        if (r < 0) {
-+                                _cleanup_free_ char *path =3D NULL;
-+                                (void) fd_get_path(fd, &path);
-+                                return log_debug_errno(r,
-+                                                       "Failed to set CLO=
EXEC flag fd=3D%d (%s): %m ",
-+                                                       fd, strna(path));
-+                        }
-                 }
-=20
-                 r =3D fdset_put(s, fd);
--                if (r < 0)
--                        return r;
-+                if (r < 0) {
-+                        _cleanup_free_ char *path =3D NULL;
-+                        (void) fd_get_path(fd, &path);
-+                        return log_debug_errno(r,
-+                                               "Failed to put fd=3D%d (%s=
) into fdset: %m ",
-+                                               fd, strna(path));
-+                }
-         }
-=20
-         *ret =3D TAKE_PTR(s);
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_261.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_259.5.bb
rename to meta/recipes-core/systemd/systemd_261.bb
index f3ec0edae7..eedce348c3 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_261.bb
@@ -32,9 +32,6 @@ SRC_URI +=3D " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-Do-not-create-var-log-README.patch \
-           file://0001-meson-use-libfido2_cflags-dependency.patch \
-           file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_ne=
w.patch \
-           file://0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch \
            "
=20
 PAM_PLUGINS =3D " \
@@ -226,9 +223,6 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
                   -Ddbus=3Ddisabled \
                   -Dtests=3Dfalse \
                   -Dlibc=3D${TCLIBC} \
-                  -Drc-local=3D'' \
-                  -Dsysvinit-path=3D'' \
-                  -Dsysvrcnd-path=3D'' \
                   "
=20
 # Hardcode target binary paths to avoid using paths from sysroot or worse
@@ -582,6 +576,8 @@ FILES:${PN}-extra-utils =3D "\
                         ${bindir}/systemd-cgtop \
                         ${bindir}/systemd-stdio-bridge \
                         ${base_sbindir}/mount.ddi \
+                        ${base_sbindir}/mount.mstack \
+                        ${base_sbindir}/mount.storage \
                         ${systemd_system_unitdir}/initrd.target.wants/syst=
emd-pcrphase-initrd.path \
                         ${systemd_system_unitdir}/sysinit.target.wants/sys=
temd-pcrphase.path \
                         ${systemd_system_unitdir}/sysinit.target.wants/sys=
temd-pcrphase-sysinit.path \
@@ -678,6 +674,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${datadir}/polkit-1 \
                 ${datadir}/${BPN} \
                 ${datadir}/factory \
+                ${datadir}/user-tmpfiles.d \
                 ${sysconfdir}/credstore/ \
                 ${sysconfdir}/credstore.encrypted/ \
                 ${sysconfdir}/dbus-1/ \
@@ -687,6 +684,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${sysconfdir}/sysctl.d/ \
                 ${sysconfdir}/systemd/ \
                 ${sysconfdir}/tmpfiles.d/ \
+                ${sysconfdir}/user-tmpfiles.d/ \
                 ${sysconfdir}/xdg/ \
                 ${sysconfdir}/init.d/README \
                 ${sysconfdir}/resolv-conf.systemd \
@@ -797,11 +795,13 @@ FILES:udev +=3D "${base_sbindir}/udevd \
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage.rules =
\
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage-mtd.ru=
les \
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage-tape.r=
ules \
+               ${nonarch_libdir}/udev/rules.d/60-tpm2-id.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-v4l.rules \
                ${nonarch_libdir}/udev/rules.d/60-sensor.rules \
                ${nonarch_libdir}/udev/rules.d/60-serial.rules \
                ${nonarch_libdir}/udev/rules.d/61-autosuspend-manual.rules =
\
                ${nonarch_libdir}/udev/rules.d/64-btrfs.rules \
+               ${nonarch_libdir}/udev/rules.d/65-integration.rules \
                ${nonarch_libdir}/udev/rules.d/70-camera.rules \
                ${nonarch_libdir}/udev/rules.d/70-joystick.rules \
                ${nonarch_libdir}/udev/rules.d/70-memory.rules \

