Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0BCC54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 12:25:46 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5298.1785500744982684122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 05:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=e7eX1gXM;
 spf=pass (domain: ericsson.com, ip: 40.107.130.48, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsMCieD1ipZZB7cA5pNa+ymH7Kol8TT+WjqPly9nktwOJCRUhpeB3QmZ+YJgwurE06xNoByVAswQ1I8FgfrGsT7TUE2zc35waU7IXsz7MkOwnMJRY89Adb5FbEANl34dG4YSc5MiSEhA9bSwX5kGY8ANWqYdxUSTqzoPIvXOZQPWD7NjvHCGtOm46LPPKJH2bL8y9JpslTd3kGboBt3qe/ItzUMzVTGQleELwqe+5ZVLyrA/EZB0r+9zB0hIrv9Y05W10gA20qBS7k8aDtrWBjXqlIieuTosrpvNEM4KtN+BB9HxGpKcSoRt3umGE2vtjldAA1k/399KZcD/YVdLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF8AIE730hOiaYER6T4JJKkn6y+4ubztAaZafccmFj4=;
 b=Jhsf09I4/yLUR52kngRPfVywIGhhmlROZhukEBghpJuDhiGRmYvG9dmbOPTgyVkPsSl1lucPca/gGdzAP8R5BZ52j7zo+98mFiayVU7Gl1mhakkPAfpa11//cF51BKdJYx0xp7fdrtto5Vzs2Fe8U0p0XdKvduFZl3UF461vNOQIBNiU+93IDPWZ6L+OFv4nMT9KYTEfOjz8NQviigVue8w9uRqf6c23MnyqAZ/eorZfeO5nyMLCq0Pd1URSSkN1PDqpd+yF0URN5N9k8fgaKA3xlmmWZ7tiY3VKeoj/5y1PRUW1C1z85FUI7RUGxYaUOQerWReQwTH8ccvRuhLoyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF8AIE730hOiaYER6T4JJKkn6y+4ubztAaZafccmFj4=;
 b=e7eX1gXMpyT6SNTRBaJxtXKl4jEZsmb5Gy0N2HgP9znrZiOqy2y0KoQxSZ5vsufcthfubReD4ulos8X7FYqX1WjrnfhCbMtHhWMzwB9PoSXWuyk26CSiYbLlgt/jJCsA88nQr+WOeNMgcejVC08OZ6k9qsDeshZrpS5WVoswJ531HuT8G1l9GLphv3Nb0hAR9OgFM3RNnNiohKOcia/whd0gEH81rIQ2U8TNtqUFuHvPev07LcqHM6rpCSuOwGeOiajxgDTbgU+lvVZ9KrlYaWHqB3Il6fDyAxmf+m3syCa5Srob1NnVL2P7iYpcxpmNVeafCrhTFVJ4DeIefBDVHA==
Received: from DUZPR01CA0151.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::13) by VI1PR07MB6368.eurprd07.prod.outlook.com
 (2603:10a6:800:141::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.10; Fri, 31 Jul
 2026 12:25:37 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::53) by DUZPR01CA0151.outlook.office365.com
 (2603:10a6:10:4bd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 12:25:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 31 Jul 2026 12:25:37 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 31 Jul 2026 14:25:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 87F434020DF8;
	Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 5696C700DF4E; Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 4/7] dbus: inherit upstream-stable-release-point
Date: Fri, 31 Jul 2026 14:25:19 +0200
Message-ID: <20260731122522.1647968-5-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731122522.1647968-1-daniel.turull@ericsson.com>
References: <20260731122522.1647968-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0D:EE_|VI1PR07MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 52039d36-429a-4244-d971-08deeefed3c7
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|18002099003|22082099003|13003099007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	DGuh3YaUPVuK5/0EslOrB+L9AMBc/TEsda0D/A9ZCgCqE5aVk2ZDLe6giVcMsjrZi12pvaljDH4pCp18E/kcAAx7BTRYL+X34uiU/v+pUu3xxCEW4NaKgxEzUxLBBGhFpdnjIwLP+o3cOcD9Ezwtr6RG4RrQny0mTxD5eOweHwjoUA60QqM9mN24j4Hzdy4ek6LBXB0ZsPKCNvtZ4MGPmO0DmUc8GRZcenRiQeybMTtvCwo37zIaWoHEYknF7/ghrsUtYXr06cQhbi+I7maOwD5Dz6pBuy1P2irnIXP8OL/BhIx39Yb5guwEyn9UJ+b+hCHIhkOgauyBxye5MCvwKhmuqOYxQVP9vrtGEmO4a2iTSO210galzDtyetQ0lL9F3PHYjGcc4E4cAfL/yJPduIeuk3TWeNo/d+V5yzFJSvaY5mRNTtK5VwdYaepqXtUD1GFkQOnC43kGS3pc/fpLuf5Dg0UDG7Agck7yLNRJKQUAhS3Jot/QZqV/RUmC4r9tAm3Ll9StfEDKujNSMIDHur5iva2TwPPpSHbNmpbtNHYI30wYmSBVUhfMTfQykVOVeKKuMng2a3rIsAcAD6AJbZo81lmbrwrZ1PfQWoRW4zLivk+ZZs+srDF6dIloQVv5PcjhuusHqYm4B2qXxelcNQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(18002099003)(22082099003)(13003099007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RxgVs6DS6pUR3SPjjyXjwtVY4azqsWjJV+qgH1sG8tLijr9NkPbB1EaBKiY4Kt+KuS/dnQWQ58SkyApq7wYtxzoKE0ELw3Sh6ftEt+YCFncCxv8sSkQ8h3Laf4LKXZNGUcfD0onZ+jx0QDEGwp7JkaM7E4heVSSN9Phfhej01X7ro+mw6NPbBSZVCK5ilpSh7Ugh6+kkS5DTQigxmdvJiAt846ENBNtd1VnYS4qpmLignK8NqAUPjGVPia0CGmH8i/HIgNg6jbX1aBgQdxhmDRvqrxAzg5QmMmULhRCoLJ4h1nvKWt3FlRz9jEytvzb66dukalimBAq9DoUyC1A3oHfCXrwdof0Gin2GuOZla7XBYvmO4w86DWwHT/UsL7Sj8QcIOYIxw8zULXcL7oFAJCUY2lthQ1gi1YVRCUlEbUmE94jOa87ZHBEcVl1gRrCn
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 12:25:37.4542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52039d36-429a-4244-d971-08deeefed3c7
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6368
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 12:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242437

From: Daniel Turull <daniel.turull@ericsson.com>

D-Bus's CONTRIBUTING.md documents even-minor stable branches, currently
dbus-1.16.x, that receive only cherry-picked bug fixes, so upgrades
within a major.minor are stable point upgrades per the OE-Core stable
release policy (ref-manual, "Stable Point Release Upgrades"). It also
states that odd-minor development branches such as 1.17.x are not
supported at all and receive no bug fixes, not even for security
vulnerabilities, so only the even-minor stable series should be tracked.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://gitlab.freedesktop.org/dbus/dbus/-/blob/dbus-1.16.2/CONTRIBUTING.=
md#L65

Checked the only point release in the series so far for feature creep,
the 1.16.x series having just one non-.0 release to date:

  1.16.2 (Feb 27 2025): two items -- one build-regression fix for
  verbose-mode builds against libselinux >=3D 3.8, and a documentation
  update. No API or behaviour changes.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 1.14.0 -> 1.14.8.
scarthgap has had zero point-release bumps since its fork and remains at
1.14.10; wrynose ships 1.16.2 as its initial version with no bump yet.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus=
/dbus_1.16.2.bb
index 2e2d1ec55a..c7815d78f7 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -5,6 +5,12 @@ SECTION =3D "base"
=20
 inherit meson pkgconfig gettext upstream-version-is-even ptest-gnome
=20
+# D-Bus publishes bugfix/security-only micro releases on its stable
+# (even-minor) branches. Odd-minor development branches (e.g. 1.17.x) are
+# not supported at all and receive no bug fixes, not even for security
+# vulnerabilities, so only the even-minor stable series is tracked here.
+inherit upstream-stable-release-point
+
 LICENSE =3D "AFL-2.1 OR GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb0ffc69a965797a3d6686baa153ef0=
5 \
                     file://dbus/dbus.h;beginline=3D6;endline=3D22;md5=3Ddf=
4251a6c6e15e6a9e3c77b2ac30065d \

