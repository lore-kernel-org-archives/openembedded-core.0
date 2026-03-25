Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F128106B503
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:52:10 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20663.1774439524517821276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Gz0RCCBw;
 spf=pass (domain: ericsson.com, ip: 40.107.162.66, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqHZW6Go8G+q4ve04cKgzNEfKVaXCqG33y0n3fj0KK4Cal/mlU0QrvO3XM+PQFtFCXL7Cfi5fyQO+SNulMl+hNnG1TU/JWpPm3mzbFCJiNVRT1v7PP8yVwjth/56qcgc+FcPT8+1SBq+QOTCNTjAzj9+P37JtGlvOuUKwNmAVG5IKtPxIMeACgsQCXU0ykt23LBidDy2azO+8/dFuVXNYZfb2Eq2xEuzCZnwkfPAR19Ds/1XNdOuhVnio0MxYRN4d99vnxYP2g+Aon49Zr6g4vAvE89ETtokQhI1/FOncdM+/7vNp3Fc/4VG22x0klklPTILj48Gl//FCFxBoP6WvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fav6QYYXfRfOFQ2P9x9Aor+mhyoO19Ypmpbzt8yhic8=;
 b=Su6iUjw0rXfZ+DwY5pI67tlcPH1ayBXSlj0Og6PxstDUFo520Bf97tPQ53hbYHY1jzHWBUdK16Aau5oHeo23Llom7s1b5fvCvSM/PIeeN9pYS2FfzYE7Ke6+8Rwk+Z3L/AtfJ2H4CigB3MkP6iinHm0O1803e1rXzNmRHHohH/RQpP3vTIoVj67n5zDwyxttkOEBZ2pE96cRSdhGIiT+qLp6/wiCS4KmfA9SuBsGeXYN5jhIXOhBLu1fsJQnwyCzuQaaeuIoJVY+uSQiz4ds9xHmixuIXnnSCK1ozsDyCTemlbXlTU+VXzl0ZQyf596G7fX9YKMn27vmVE5pr4+vxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fav6QYYXfRfOFQ2P9x9Aor+mhyoO19Ypmpbzt8yhic8=;
 b=Gz0RCCBwbT7mq4QlnXiQ0ZkRgkCQCkJh/YWjLj6ttkz3ysjTwDTsY9bRMV0bQPB11KpDY3qcNvqOQylldeh1J32nV36dEG5XiRK+yaheqaqK4muBmg0MLVHsu2c97Rtx15NcEKiK7YVrnMsMeoLJ82UTbO/73bW7RqadRPGTtENQCZWyhm6fnGImxwI0jQLE3Nkmuyk+d+0O/qxJyZjqQR3LUIRqWnask3mehcCkUrXXDjwv6Ze/+xJ2xH7C6bqcp/zccnC8/NpbWFe4WArSGm76K4oyuHB/BfbOaWH5C7u3UPZSTz3tYRrg/FamcnVfnQjAYPwoYQsbnvQZb8MruQ==
Received: from DU2PR04CA0332.eurprd04.prod.outlook.com (2603:10a6:10:2b4::20)
 by AM7PR07MB6532.eurprd07.prod.outlook.com (2603:10a6:20b:1aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:52:00 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::a9) by DU2PR04CA0332.outlook.office365.com
 (2603:10a6:10:2b4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 11:51:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 25 Mar 2026 11:51:59 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 12:51:59 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 2608921CFC5;
	Wed, 25 Mar 2026 12:51:59 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 14025700CF09; Wed, 25 Mar 2026 12:51:59 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <pratik.farkase@est.tech>, <richard.purdie@linuxfoundation.org>, "Daniel
 Turull" <daniel.turull@ericsson.com>
Subject: [PATCH 1/2] python3-kirk: Add version 4.0.0
Date: Wed, 25 Mar 2026 12:51:51 +0100
Message-ID: <20260325115151.3994996-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|AM7PR07MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 294bad07-de87-4df8-eaba-08de8a64ec50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Rqo+5Hk2CU2K4yd7Cm7HhEGIi1vzaUUDZqeZ2ZcIrRkvJzn62d2BFTNgBxWPtqwSbvgqMQP+WesTGt94n/DsQXHZZjucdh/p9+Sh66ZPDrX4IXeSrTXwtUL3hv3QZYRcCLXjRdXf5HEbj5A9SaTBvld4WvUxsz8pyWwQyk6Xhf/yJOVrLuJJ76c1fuySHJXJCeo0iUzmA2fxnk8z61cX6Xc/Dyp9uTJdPcA6TpkrmSmVIh7DX/DBWiY9XhwCjXz4rC7yMy44lCQuBrzVFbm3FnXI3GxC0S1GZ1rjNk+ZUOp8qXVnSpD7xan/GpJpJwmmlKCbCu+Pz4DiOWo5c3ebVSNztoW/ol6Fty9ThVIPhiWvjQTJfhnaVDjV1Eqa3EXnJnuZ22Nr/FJ3R3Qwu8dKYQbcdrSGBtSKZOc9C1oSARbfOgFJdx84tdapcdzsmGarB0qo2HqgPaIm7uXTUSnLMNgp4Kp4wUHoEr+7eSkupjWu++I5/KfM6QG3sooPgiC9Qw6SRVmrbMAvOKuF3AbnBZ/vUMsH6+erPBJ8r3xvwGNKjZprHcFj8S0l+uxrwJY1r51gwszIL8/K9bnCmkCEV6zRsI7jSgb3ELfkyuk5dEv6TKRls14K323jwNNOKC+Xp0K4PZ630OWrNgQJg1RNVxMrx9ouEH3nejRAy8+PMNj2RQpUmG1Y7KelksLvKElGeCsIx8a/1YntDMgoZF9e8fdz3lbHWCavZ5qHa/5aoAqickR3TmQAlMblh/Vp+utv+z/vaKjLMjW/fyogTxfLJQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	V6cHpQKTACAa9AtyxSOGDIMFwiyjbSwf3Q9moOdn5bSyRJ5bcczoh9UatASTL6tuJuGnfTZIpwY6AfsnbHWbSKW8M8w6kbOLBoKTddVS4t0pMgS7mdxtWym1BRw6mhuwOSKMK2kWK1aQaxgVa0NDWq0KiFTJIvsWqG6V3C+/Oyo3cXIDuXQUUim3PGhCOvPEwkOLkR/L58xJlqHKyrIpba/UEHxe3x+6NVP+O5sUevME1mhXb0lbwAapXuivhQzhW8bej/h0I5sv9S0b1kxNKJOC/AaNm5hSZDFpYk7z1hM9YTuyAxf8yMuYuVhrRgxCwtX82jb+hyUZ+O0qMtnuEj30RniA/zaj6GIBJVGNaQZufb9eBrerFdUW5PKTYc85jq9Z2EzOL9eqdk6okfST9uo8aSrOTX6PVzIvN00SfDUriOtbo1gS8wwKrbupeK8s
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:51:59.8481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 294bad07-de87-4df8-eaba-08de8a64ec50
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233891

From: Daniel Turull <daniel.turull@ericsson.com>

Kirk application is a fork of runltp-ng and it=E2=80=99s the official LTP
tests executor.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/conf/distro/include/maintainers.inc       |  1 +
 .../python3-kirk/python3-kirk_4.0.0.bb         | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.b=
b

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index f9a600ff11..9cd58dbac0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -665,6 +665,7 @@ RECIPE_MAINTAINER:pn-python3-jinja2 =3D "Richard Purdie=
 <richard.purdie@linuxfound
 RECIPE_MAINTAINER:pn-python3-jsonpointer =3D "Bruce Ashfield <bruce.ashfie=
ld@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-jsonschema =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-jsonschema-specifications =3D "Bruce Ashfield=
 <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-kirk =3D "Daniel Turull <daniel.turull@ericss=
on.com>"
 RECIPE_MAINTAINER:pn-python3-libarchive-c =3D "Joshua Watt <JPEWhacker@gma=
il.com>"
 RECIPE_MAINTAINER:pn-python3-license-expression =3D "Wang Mingyu <wangmy@f=
ujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-lxml =3D "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb b/met=
a/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb
new file mode 100644
index 0000000000..75edfc2fe4
--- /dev/null
+++ b/meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "Linux Test Project tests executor"
+HOMEPAGE =3D "https://github.com/linux-test-project/kirk"
+DESCRIPTION =3D "Kirk application is a fork of runltp-ng and it=E2=80=99s =
the official \
+LTP tests executor. It provides support for remote testing via Qemu, SSH, =
\
+LTX, parallel execution and much more."
+SECTION =3D "console/utils"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39bba7d2cf0ba1036f2a6e2be52fe3f=
0"
+
+SRC_URI =3D "git://github.com/linux-test-project/kirk;protocol=3Dhttps;bra=
nch=3Dmaster"
+
+PV =3D "4.0.0"
+SRCREV =3D "32b224021b9c657953f5b2f61ca4744b9b3c5961"
+
+RDEPENDS:${PN} +=3D "python3-asyncio python3-json"
+
+inherit python_setuptools_build_meta
+
--=20
2.34.1


