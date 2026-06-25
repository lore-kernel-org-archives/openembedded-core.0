Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B94CDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 13:42:34 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11809.1782394951724312725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 06:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=H7dvitdS;
 spf=pass (domain: ericsson.com, ip: 40.107.130.44, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faqL9Izp8X4w1/aJSIwP04ciaFZIRDsBnQjHViMOPzAlIGcL954tNFR7suXsPhGm5MOawEtSuASBbB45lNDj4IRWhfItTg/yvZbFGMnR12MSJ4LHw0iMKfy+aQTuGRwMF9MX2z4vFTLckMg2t9QtFwSBk8eLwpRZ5HeN/9jPnyTWm2ZKXxtBfh6Y0qEAmcNCBhNDTP3FG9kpKEuGrzLKhleZfdoYtmZQL3hYPPkr+ewOzOAs5lLhGSX4vD7ofZx8ulOps7FJiti1BPGww6VTdObygGsL7+w2TcAgAhwXHIP8agSUvlShr0pT46RACPaOE9mBZ3dmGjxMIxVZjkYKhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzRRQ///pZ+HtMvNZZP7MYb+v1+vI6eD8wfZlswsKzs=;
 b=bbjqwyXTH2cpA0AyDUHeN7YTVQXRctwmFyI544Q0eXZSZTpnSDx2vw4DuNTETVUbyBHSfoCQBWyaEgOMhKuGHt3yO9cPdkmHI+AGE3RJKufoRTMXhoPNC4FVG1XvhapNdcZxZ0p2YQ318mj4jDIcMVfCxtX3HONmiREtMSCJ/7R28sAfWbTsTge2GQoIL9JQ/7M/5rs4nhPJEpbQBYfv3qEF8rp5FrNuLCw9ZO3Ji4BibHYEPPrTwTj5/mT4dBQbdOGFiKPdW9iTIakIgBlntQBPmG+BgeU1jc+bY0cQmHYQ1D8nfe4YAfcoCXotBHnEZusptTP935KufhvePEI9RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzRRQ///pZ+HtMvNZZP7MYb+v1+vI6eD8wfZlswsKzs=;
 b=H7dvitdSihhVktPEZkfltrKIrAvVLGaH45nxl6Cm+DjkvCXzgLiYj41ma5f7qdt2IhMG+JaNUacJZqLE55wLOHYpjKwJEVA1DpmEfGo8R4Al3waUCeSCRm4K+W4/CLjEZK653QKm+ALB2+IavV4q4d6c7zBwpEsTeFBfrtDK6iZvzrwl603ehHXmoPMUNixnYJruG64MWX+MxCGTZfRAxQgvB2TLSPYchFjtqpCKHY/B1ypOgvqLng066oAzY8ytOTNg9Q0Kc+ggtG16GNmiwi2Cc03Yn6aC0p9/DEtnGlc7hDvgOvFNG15zD8uVw2ZC2CeDUhi7dXpGPiTLmLKWbA==
Received: from DUZP191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::13)
 by AS8PR07MB7990.eurprd07.prod.outlook.com (2603:10a6:20b:39d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 13:42:26 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::f) by DUZP191CA0023.outlook.office365.com
 (2603:10a6:10:4f9::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 13:42:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 13:42:24 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 15:42:24 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id F058495801;
	Thu, 25 Jun 2026 15:42:22 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id B86FE700DBB0; Thu, 25 Jun 2026 15:42:22 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anders.heimer@est.tech>, <qi.chen@windriver.com>,
	<alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 0/3] systemd: update to 261 and be compatible with rhel8
Date: Thu, 25 Jun 2026 15:41:29 +0200
Message-ID: <20260625134210.4046622-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|AS8PR07MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 845d8027-61cb-47c8-5759-08ded2bf9708
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	k2NFsqZvTTDA1QaTLmRcRN7OEgLGtbCdyFVL32U69N+OyFC297vT+jwAq9rCom4RsKkyvreoklYnkrn65cFcw/2diR1Gkkdyw8tE47cmRvP0OLgtnu0kyeNvZDnNUJc357IUxIhToDl8FbmBHjUKDxVjruX1dWe26syXiDn2TxIZaAo0uO1ux381b0GI1ncJvqgt0DTu1pqnySwGn2D2FemV8g0AuVmuD4PWqaNzt7jwILb3/cB3Cdns/ddQEdrM8JUzCAOAsnuaMmfvvLRazoIen6EsHojaW5IEO1L9Hwh8DWp/FzgOMdNZkhXxHCZB1iyt1hKCxBwnffzNconfCQe4/GGf/KPfGcxOsAX2moM8bHtq+hnPIV7At3ITOrZIzBpwWh1EhU+niYOMAmNg5zVh6Z0/a6BeuC46nQR3uBwSITCr8FJ6jxCrnUnnXju+hbF7bXXRc70DcgQvvTGvIg/clE4aliS+Do4vgmhf2+3NziI/OrD+TA7c52nNbI851Xcgz7VMeI2P5wcxKR1/mpApUjauGE9+4Os6Un2bYgIrfOA/Zt7h0CjEMkgp2z6LiMUdgR0wDANYf3asQHcrods07fAdvK5ukrk0bGMluKhMb3UdBuHqr0Nc5m0W/y+fCQAKC2C1r5U4ZuIxyoEm0+JRobN5gW98mcieljDlUDGTyu1VR1PdLYcsxJmq+qNRVq26D2EoY4sBtAnOBGQC+g==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zyq1eQR3sDmr9JeY+GyWboFQRA9wbMz8o393hiKsDpjAaMGRpQmUfJLFMrdy6/C70TP+SzoDUIP/RK7QkNSKY8NjFkgQIoMErv3TDxEg9QqnHuvvjzIZ7uXExLAXvk2FEi0213wfWSggR2/sVB8HUJrOI8bNtP91lqdJrJp8r75i033dBGr5rj5HwKZ6bwrj4BqENW0/1YLzMKNLcdUjLnsByxlt2laEN25tfkQlzZv6oIGMgi+vYFMisPVlNnNbgdRygGjWunsGDGjTPuNczXJHbFSaVf2kHtRvs8bKZdrCGeYi2DWLL3zECF8Ge7plOPt273BJ/aajK4+7EBvvOBIalYn3oiponMc2Lzq4q8y4mtka2ukygZSNS0ygMBzxnm4/i19riWiUcG1kFcT1teJVLKdWbqtongi/1NRkh/6DtYjz2xbEeufeufni0Q3g
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 13:42:24.6890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 845d8027-61cb-47c8-5759-08ded2bf9708
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7990
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 13:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239567

From: Daniel Turull <daniel.turull@ericsson.com>

systemd increases the dependency on the host kernel,
which breaks builds with rhel 8

This series add native patches in the systemd tools
to make it work.

Tested on rhel8.10 with testsuite systemd on qemux86-64

Daniel Turull (3):
  dlopen-deps.inc: treat soname list as ordered alternatives
  systemd: upgrade to 261
  systemd: add native hwdb generator for hosts without STATX_MNT_ID

 meta/conf/distro/include/maintainers.inc      |   1 +
 meta/recipes-core/systemd/dlopen-deps.inc     |   9 +-
 ...ve_259.5.bb =3D> systemd-boot-native_261.bb} |   0
 ...temd-boot_259.5.bb =3D> systemd-boot_261.bb} |   0
 .../systemd/systemd-hwdb-native_261.bb        |  32 ++++
 .../systemd/systemd-systemctl-native_259.5.bb |  28 ---
 .../systemd/systemd-systemctl-native_261.bb   |  28 +++
 meta/recipes-core/systemd/systemd.inc         |  10 +-
 ...meson-use-libfido2_cflags-dependency.patch |  54 ------
 .../0003-Do-not-create-var-log-README.patch   |  10 +-
 ...il-fix-PCR-bank-guessing-without-EFI.patch |  62 ------
 ...-detailed-debug-logging-to-fdset_new.patch |  97 ----------
 ...idfd_open-and-STATX_MNT_ID-on-older-.patch | 176 ++++++++++++++++++
 ...t-mode-for-reproducible-cross-builds.patch |  36 ++++
 .../{systemd_259.5.bb =3D> systemd_261.bb}      |  14 +-
 scripts/postinst-intercepts/update_udev_hwdb  |  24 ++-
 16 files changed, 312 insertions(+), 269 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_259.5.bb =3D> system=
d-boot-native_261.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_259.5.bb =3D> systemd-boot_=
261.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd-hwdb-native_261.bb
 delete mode 100644 meta/recipes-core/systemd/systemd-systemctl-native_259.=
5.bb
 create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native_261.=
bb
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-use-libfid=
o2_cflags-dependency.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PC=
R-bank-guessing-without-EFI.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0018-shared-fdset-add=
-detailed-debug-logging-to-fdset_new.patch
 create mode 100644 meta/recipes-core/systemd/systemd/Handle-missing-pidfd_=
open-and-STATX_MNT_ID-on-older-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/hwdb-use-compat-mode-=
for-reproducible-cross-builds.patch
 rename meta/recipes-core/systemd/{systemd_259.5.bb =3D> systemd_261.bb} (9=
9%)


