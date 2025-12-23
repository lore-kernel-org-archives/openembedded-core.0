Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FF6E74902
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 22:01:47 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109794.1766527299684270658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 14:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=jjCel2V+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.50, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYZiKEgxNxP9Bx4d+I6KAdFmMJZuwhx/PU7nfSmFuAtkG8K624GJRwa00ZxDtH4dPrTi/jipU1v8VpoNWmuC2rAR/CZrzv4RyKmEYEZ478dHUOXc11FtLi/cCx3PJui6L3HRMcOS52qxbuD8pxPpqT5aaovYve33/NdDZalWZVwREXSYujACYGhNc2dR7EH4vuAjYrWFFY4yKOuqfrHLRqaxYcRvKpeeqafpgtEMYHFBfTRxIWpPvyWRmOWUq0AwUqq6HzE2bie/RDK+KrbVfBFVGUJKmVLCINhWSTarUtZhy7w1py3KbNMFKZlvtD+5tG2075uoM21g/wmrYw1LZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZB0Zq+Bgf9L4SJNQLtptKDf4lRypYRdDnOIvY4nuOk=;
 b=c4cjLtA1X/SBnbp/chX9SJBc9fUvz4kpUOEplYilyE8HUDTWA+u3NAlX3QGH8laB6PelVL3Jenl9+LVhrh50CCIQ4NMM85MWe5d6dZ4KdJZcaIrKU6NzWQn+2A1zIXnWdPO2IREL4303KrUc0DomHOoVRLu8Nv+8uqHu3ruLyMbzWWgxavpiTCZg4h2s6PqSYRcWER+8p94IITNbFp4XpACiIgV9Yw7tNi+wMnAwC1GCmNv6MbikdvqflQfkHCjhvw9kKtFZF732HF/D+8ZJJcVe4Bfvv+jP+c6VaonsaVun9jo3KjysG2PIVLOifcXPG599ifzSNftfgsvi9PdfOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZB0Zq+Bgf9L4SJNQLtptKDf4lRypYRdDnOIvY4nuOk=;
 b=jjCel2V+FjhiU9ZAFCMfcZ1Hme9O/K8Z5f7GS/2063iN7r6CJlnCSARavpbwnrIbd6GKVUo0rTQdSUB6qTwtRmNvycj7YYLCUxKFkcinOesCtvXDAcZlbh7c+351tgXMQcNaYl1SglGcQNs1cbgy9TiQDMb31HZw/fxvgOiXJOA=
Received: from BN0PR02CA0040.namprd02.prod.outlook.com (2603:10b6:408:e5::15)
 by SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 22:01:36 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:e5:cafe::a1) by BN0PR02CA0040.outlook.office365.com
 (2603:10b6:408:e5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Tue,
 23 Dec 2025 22:01:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Tue, 23 Dec 2025 22:01:34 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 16:01:29 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 16:01:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Dec 2025 16:01:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BNM1TJL3656883;
	Tue, 23 Dec 2025 16:01:29 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv13 1/6] emptty: add version 0.15.0
Date: Tue, 23 Dec 2025 16:01:09 -0600
Message-ID: <20251223220114.2259233-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251223220114.2259233-1-rs@ti.com>
References: <20251223220114.2259233-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|SJ0PR10MB5647:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c06b1bd-728a-4619-867c-08de426ed657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XN0BQLzgXvgDhAd02NYf0uIphCOafWlHIrPC3eLF5PVdA6oQKBKa9/3OGMoh?=
 =?us-ascii?Q?Ez5thOQnY6t8Aq6Q9mgT9waRVhVG+XLeG8QjHJgLKtCjNkSG1syZjMnf90fb?=
 =?us-ascii?Q?pANco4R9U6tHdFQSSbP9gX6BetfZ35hQPxV3Jcv5E6frpo9rtlv8l2pL/uim?=
 =?us-ascii?Q?cBddKI05mAgsohZAOpD0vSud1Bv40a+a68DDIiwMvdWadUhO11mYTCXrsq/p?=
 =?us-ascii?Q?6NRH/HEjj7RjTQHBPM+jJBgB1B+iUqQMu+ynYvN3LW8cgA2b46TxRyB6Mc9M?=
 =?us-ascii?Q?+ii/TK+VaxGq0NjVFzVgjX/zuvEGxMSaIViaL6LJsjKRL/HzWyHEYqnN35eP?=
 =?us-ascii?Q?+ZHk/u93LDfta6RNK2pRjeqWVZb7QrtAvpH7M8nA4o4bz+F6OmXcq9+ECmoL?=
 =?us-ascii?Q?/GA2LoeIgayWP9BOFssoW2wQmh6qP7JM4pXK4rCoNEMvUxWYtvv6RyUOg8uw?=
 =?us-ascii?Q?Vm7y1zrJKoLnJlT8D6mhlgMuqQsir1e3hX+tKJUa4QrLik4m4qjde150FsBZ?=
 =?us-ascii?Q?MgS2JWBmwSCsDEFOupjOQcTWLWQy2N9MQxx3SnmxvYlXVZ7yZcYSqgURpZsw?=
 =?us-ascii?Q?inZOUGAWvRTHowxJkr2660Bi9KlcWa4/Yq19Sbq7VVdLK1455NwwN3xsPlLl?=
 =?us-ascii?Q?p8kdF1LwNuKE3IElfz4DmKttTN0ZX70MCX2lUeMAgtCJ2RONWNicxb1uu/Jq?=
 =?us-ascii?Q?PyTf6MVdWY7d8mUviBMdwLfD4rE0vYvAoNH9Wfa8qq8G62ZTDH9Xf2AkF3/j?=
 =?us-ascii?Q?73egKkLTjMhF6mC5rWJOmCPSwW2D6iQQWbSK+JoUy4uhEcY0mrAc0pB6Y/yF?=
 =?us-ascii?Q?zCbrhtYdagktRWv8rWj4aBCvW667k99nhKvPB73ZceSR90D0Slu2ShMx35IP?=
 =?us-ascii?Q?g51zPD1Qq411xH4CKCGO8s7GyYxoEYP3CYiR+FEaYxGineSbUxVdMQvtrWIe?=
 =?us-ascii?Q?GnJ4STZuV/kfpwPsV5aTBit1DqZz2Nivro1E57ywgGeaI1hNAFWVsFRtdLHQ?=
 =?us-ascii?Q?R0nT6bAgAOVl9Zh22/DpHYiE1uzp2hfC56vesVlnLzQIUq1gsKm+jgKvnDvO?=
 =?us-ascii?Q?yjniZ3Lg8i+4KRZOzkZqspYa7SJiEze4WkHm7u6YBZ2fb3YSuuWbv2p/koJ9?=
 =?us-ascii?Q?04ZpETzjCnlF9H0moJ4hTZ75bzsbK2hNPr4cgZUYj0u5CL3GSfxHQWcO2Fxa?=
 =?us-ascii?Q?Ex+zDDue+TpHhdJOaCNSGC+ONY+XRPqVhWNZ1or1OCm+Blbz9sHH4zOf7AuC?=
 =?us-ascii?Q?61AZjeJFhdDtZxZSv1hC3zejjvjtCHjSG/py3idiyTK+/WpxScT3C6Iz3nEJ?=
 =?us-ascii?Q?GiqY/CzSe+597YNdbWVI2vowX4Z2Gc3BFGPy2haIYMxJ3JT222V8M74JZAGH?=
 =?us-ascii?Q?jusmtcIQ7HLlXR2Pb2uX2FWjhIapXh8vWBlA5tQEJWNFjCtUkiAtzqtDeuOh?=
 =?us-ascii?Q?6cdbxpQB/4Pf55neAdu+ef50OsSgm7srRwvPg0wejH/20zOcJCG6gb9Csjds?=
 =?us-ascii?Q?ECon/4O208nW/0ciRt28q9/miZMtDBBklSzjKTKKKVQEKPtAWn8pGeL7Ly21?=
 =?us-ascii?Q?dhYWWPX8he5xndOq8Tw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 22:01:34.1856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c06b1bd-728a-4619-867c-08de426ed657
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5647
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 22:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228508

From: Randolph Sapp <rs@ti.com>

Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
relatively lightweight display manager that supports x11 as well as
wayland through both a CLI and an automatic login mechanism.

This can effectively replace the custom init scripts for both x11
(xserver-nodm-init) and wayland (weston-init) with a single tool with
more verbose logging capabilities.

This is split into two recipes. The emptty package provides the binary
and various agnostic configs while the emptty-conf package provides the
default configuration for the application itself. This RPROVIDES
virtual-emptty-conf, allowing other recipes to provide their own
configurations to override the default behavior.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-selftest/files/static-group              |  1 +
 .../conf/distro/include/default-providers.inc |  1 +
 meta/conf/distro/include/maintainers.inc      |  2 +
 meta/recipes-graphics/emptty/emptty-conf.bb   | 14 +++++
 meta/recipes-graphics/emptty/emptty.inc       | 26 ++++++++
 .../recipes-graphics/emptty/emptty/emptty.tab |  1 +
 meta/recipes-graphics/emptty/emptty/pamconf   | 10 ++++
 meta/recipes-graphics/emptty/emptty_0.15.0.bb | 59 +++++++++++++++++++
 8 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
 create mode 100644 meta/recipes-graphics/emptty/emptty.inc
 create mode 100644 meta/recipes-graphics/emptty/emptty/emptty.tab
 create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
 create mode 100644 meta/recipes-graphics/emptty/emptty_0.15.0.bb

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-=
group
index 252fdac67d..a197216165 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -29,3 +29,4 @@ ptest:x:529:
 xuser:x:530:
 seat:x:531:
 audio:x:532:
+nopasswdlogin:x:533:
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index 3f113543cd..820a5d1342 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -69,3 +69,4 @@ PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?=3D "native=
sdk-libsdl2"
 PREFERRED_RPROVIDER_virtual-libegl-icd ?=3D "mesa"
 PREFERRED_RPROVIDER_virtual-libglx-icd ?=3D "mesa"
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?=3D "rxvt-unicode"
+PREFERRED_RPROVIDER_virtual-emptty-conf ?=3D "emptty-conf"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 523ac09b53..cc28ca5af2 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -170,6 +170,8 @@ RECIPE_MAINTAINER:pn-efivar =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-efibootmgr =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-elfutils =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-ell =3D "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-emptty =3D "Randolph Sapp <rs@ti.com>"
+RECIPE_MAINTAINER:pn-emptty-conf =3D "Randolph Sapp <rs@ti.com>"
 RECIPE_MAINTAINER:pn-enchant2 =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-encodings =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-epiphany =3D "Unassigned <unassigned@yoctoproject.org=
>"
diff --git a/meta/recipes-graphics/emptty/emptty-conf.bb b/meta/recipes-gra=
phics/emptty/emptty-conf.bb
new file mode 100644
index 0000000000..0b98e2e13e
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty-conf.bb
@@ -0,0 +1,14 @@
+require emptty.inc
+
+SUMMARY +=3D " (Default config)"
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+do_install () {
+    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=3D${D} install-config
+}
+
+FILES:${PN} =3D "${sysconfdir}/emptty/conf"
+CONFFILES:${PN} =3D "${sysconfdir}/emptty/conf"
+RPROVIDES:${PN} +=3D "virtual-emptty-conf"
diff --git a/meta/recipes-graphics/emptty/emptty.inc b/meta/recipes-graphic=
s/emptty/emptty.inc
new file mode 100644
index 0000000000..cfe9ebf154
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty.inc
@@ -0,0 +1,26 @@
+SUMMARY =3D "Dead simple CLI Display Manager on TTY"
+DESCRIPTION =3D "Emptty is a simple display manager with a command line gr=
eeter \
+It supports both X11 and Wayland sessions, exporting required variables an=
d \
+creating user paths as necessary."
+
+HOMEPAGE =3D "https://github.com/tvrzna/emptty"
+BUGTRACKER =3D "https://github.com/tvrzna/emptty/issues"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Dd1e4d12c7d1d17=
367ba5668706a405ba"
+
+S =3D "${UNPACKDIR}"
+
+FILESEXTRAPATHS:append =3D ":${THISDIR}/emptty"
+
+GO_IMPORT =3D "github.com/tvrzna/emptty"
+GO_IMPORT_pam =3D "github.com/msteinert/pam"
+SRC_URI =3D "\
+    git://${GO_IMPORT}.git;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Ds=
rc/${GO_IMPORT} \
+    git://${GO_IMPORT_pam}.git;protocol=3Dhttps;branch=3Dmaster;name=3Dpam=
;destsuffix=3Dsrc/${GO_IMPORT_pam} \
+    file://pamconf \
+    file://emptty.tab \
+    "
+SRCREV =3D "bb203ad0a224731a7a2ff50deeb342ab79c4af09"
+SRCREV_pam =3D "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
+
+SRCREV_FORMAT .=3D "_pam"
diff --git a/meta/recipes-graphics/emptty/emptty/emptty.tab b/meta/recipes-=
graphics/emptty/emptty/emptty.tab
new file mode 100644
index 0000000000..6359c7224d
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty/emptty.tab
@@ -0,0 +1 @@
+7:5:respawn:/usr/bin/emptty -t 7 -d
diff --git a/meta/recipes-graphics/emptty/emptty/pamconf b/meta/recipes-gra=
phics/emptty/emptty/pamconf
new file mode 100644
index 0000000000..9cbfd6c4a5
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty/pamconf
@@ -0,0 +1,10 @@
+#%PAM-1.0
+auth            sufficient      pam_succeed_if.so user ingroup nopasswdlog=
in
+auth            include         common-auth
+-auth           optional        pam_gnome_keyring.so
+-auth           optional        pam_kwallet5.so
+account         include         common-account
+session         include         common-session
+-session        optional        pam_gnome_keyring.so auto_start
+-session        optional        pam_kwallet5.so auto_start force_run
+password        include         common-password
diff --git a/meta/recipes-graphics/emptty/emptty_0.15.0.bb b/meta/recipes-g=
raphics/emptty/emptty_0.15.0.bb
new file mode 100644
index 0000000000..524ef08128
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty_0.15.0.bb
@@ -0,0 +1,59 @@
+require emptty.inc
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
+PACKAGECONFIG[pam] =3D ",,libpam,pam-plugin-succeed-if"
+PACKAGECONFIG[x11] =3D ",,virtual/libx11,util-linux-mcookie"
+
+DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'virtual/cr=
ypt', d)}"
+
+GO_TAGS =3D ""
+GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nop=
am', d)}"
+GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',nox=
lib', d)}"
+
+GOBUILDFLAGS:append =3D " -tags=3D${GO_TAGS}"
+
+export GO111MODULE =3D "off"
+
+inherit go
+
+DEPENDS +=3D "gzip"
+
+do_install () {
+    # general collateral
+    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
+    install -d ${D}${mandir}/man1
+    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/emptt=
y.1.gz
+
+    # pam config
+    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
+    then
+        install -Dm644 ${S}/pamconf ${D}${sysconfdir}/pam.d/emptty
+    fi
+
+    # systemd init service
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
+    then
+        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=3D${D} install-systemd
+    fi
+
+    # legacy inittab entry
+    install -Dm644 ${S}/emptty.tab ${D}${sysconfdir}/inittab.d/emptty.tab
+}
+
+FILES:${PN} =3D "\
+    ${systemd_system_unitdir}/emptty.service \
+    ${sysconfdir}/inittab.d/emptty.tab \
+    ${bindir}/emptty \
+    ${mandir}/man1/emptty.1.gz \
+    ${sysconfdir}/pam.d/emptty \
+"
+
+RDEPENDS:${PN} +=3D "virtual-emptty-conf"
+SYSTEMD_SERVICE:${PN} =3D "emptty.service"
+
+inherit systemd
+
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
+
+inherit useradd
--=20
2.51.1


