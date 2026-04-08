Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388A9105D9BE
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 14:17:39 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.107631.1775657858608240438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 07:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=UkPT1plk;
 spf=pass (domain: axis.com, ip: 40.107.159.47, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjQVRfhhCPUYSV1s8FSvDbYT7Wojc87uwEVAj3eCsYTCvsRw4txjlDRAkNnqTt0BXhy2jnudlAGcQ3itWdHKZ64AXyg9MVbnMye5ylWk5mruMnD7lX+QMNVzVmaojjCtP5f89In98qlCyempCHQ4a9DhDaSqkM6nbHrmxiMZKS9qnYnPrDMWSelKj46eBwAaCQabEWHQJKYdsjTGOvKl4x1nJJUODSg8HywLB9IYp6mF1q2AFEV43TJsRYoKmRHX+8w0Amgj/qdupE1dWSYKXLni/ICSzA4A3YDiHGC7txgcTTPO5cbGdIzVN/xLk+rb+X2Xm2uib7HpO/aV9tmTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8aTeOS4luyTCuId2wyLwQKJUa1maG0GZbiwZjAK+wA=;
 b=CwKRTczvV/7I/gyS8hnoWLyuPXYJ/WPHgPSy6ck0v+9rc9sreo75SqfddPcxrpAryauPPuOTUenaLvIKGRBDPQgX3JsVe26Y5aPkEEYkU9gB2E7+A8MzmrWUMyTgCkk1s8p5aEtnHVo5fcjQmEhiXoGctRwp7o3yISSiN4vNiXpZQcI4RNoWUFfAqjA6y4MLEjDsMZdp5hmGZ3Af9FciUHyyyzCsjJc3mVphUTnA0UR22nF0Obkkh1xuWXRII7T9I+/Dad05hezaLxYllyHbtpmFgRd3TZfM36w26r8wiVWqm5FmcOFRHOKsOTSnazz8ILXwjkoKtkhTXEfiIVYEEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8aTeOS4luyTCuId2wyLwQKJUa1maG0GZbiwZjAK+wA=;
 b=UkPT1plkQ6borC9jXabTzxz482yI6wkHcbn8puCXlVnA/9+0csn4KbXPRcIK5ggjY8FYmDFP+VlFEbkipowP/NO86W46J82ZCPcrbBUeJfLIWaG6oYq7gr3A+FABqChYlgplkY2iT8A92RV4jJTajkAg/sVspJ3kWYT/M2q5SW0=
Received: from DUZPR01CA0289.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::20) by DB9PR02MB6908.eurprd02.prod.outlook.com
 (2603:10a6:10:22b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 14:17:33 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::79) by DUZPR01CA0289.outlook.office365.com
 (2603:10a6:10:4b7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Wed,
 8 Apr 2026 14:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 14:17:33 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 16:17:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 910644B55
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 8D55E120831; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 07/10] gstreamer1.0-python: Upgrade 1.28.0 -> 1.28.2
Date: Wed, 8 Apr 2026 16:17:15 +0200
Message-ID: <20260408141719.1086823-8-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408141719.1086823-1-pkj@axis.com>
References: <20260408141719.1086823-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|DB9PR02MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 817a3c0a-4867-4d41-39fc-08de95799378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	IIPVHJW32+ez33S0F6+XxSy2qSwAwQx1gX5Dbiz/T1thrxrIrBvquxFFSWzPcv5LE3M1KePxER7MwVQ/pshc/9cTm6sm951EByo4OVAFUVzkHTrcK194Yqj1/J7lfNQjbVUFKa04XWcGFLUFn5QhGorIIsDLZKuTAxkKr5JPYdT0jTz1bm7h25iB5gkf/yY4yFFA8l4giTwpto3mC5ne3LH//jLq6xTU5UmBcjiCgqfjb9pWTOj7jXVh3d0iNZXLNT0doHOHW5YPfYwF2XKGjGxM0dCeveg8bmLbcQ1qp5yO5l9BnEdKT0Xnwust1CWrNnIGo+WhHKXPF/4GYA8rA0ozip8W8r5ySdMyCkwoN5wdCUn/ovNn+DxEV2U+5qED6O4e0+jjWkbLZI+xxA9plcgEDXn+5O8/3bOaLkmMlnEGdQGImKU+lVU8zxKuKNbG1RSrIrZO24gKx0RZwiDPKt+yypspqeYSk1i6l/rYxdPDUcgdvem5z1ZVfSZ0x7HuVWM29PuGCndttDrNnwapmdk095iqRQwmDCu9TqdWhrTgi0rB4AR/zBzRIAVA0yGSWkuHYXQJLWmK+bfM3B3ogvjtagL4FjZNy2FPGyOQpfchHlVL4B1BpmR5A2h7QC4bH4MjBilBbVKof6PnFOQ1AOuLn8p5vWKwhDj8UTHjFbZwuVFQxXkdrcL7w2SQF0ScStKIfW88mrqC1ZkmHS7PJJIrIOUb7+QFEE8c6JjVwBI=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KlogcOF+RMkxKyogdKHYXzO+21HFY8ukqmJgSYN1BQ6EYEXhqqq4ZH8lCj2FdcByiCCb1Tvo43OnUT8yxJEQcL4oKnzLeEUFsCf9MKyUvZm23tqNQTpqWcMhDtgFW9b4RJonjbBqg3hwGxLaX+22sX/S4C2wmX5cOgKICENK0MLnyEJGdhR/cmLUgqcdC7jD8gxvLNeEeT/rDWbVo0fFSlzKdXXvriAeueb9baRrHV9fSgpRQty47/WF7rpWPNZCMD4K39b4JX75c+L5ULBMUu1KxE12g4n/8ZbIZ2XZJs8yG2XOizSPOHYC5SG+RlBCSRgFnOiUuB1sU54QsYtoi29jLVPUo8wqcMRkwWATHpjStYw21iv3QuuBmp9M2oAc5/eE5scHu0gt+HfQYNmADN+IphovtCSCEB2CLyvmzKkdUgoQo7tl5po4W0zutjqy
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:17:33.0408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 817a3c0a-4867-4d41-39fc-08de95799378
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6908
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234851

Changes since 1.28.0
* b2a3b2e: Back to development after 1.28.0
* 539aaa1: python: Caps constructor has a single optional argument
* 18d4781: python: Structure constructor has a single required argument
* 6f21099: python: Add type hints for MapInfo members
* 0df78d0: python: Remove duplicated TestDoubleRange
* d4af24c: python: Add type hint for public fields
* 5f4fe17: python: int|float type is redundant and cause linter issue
* 835da19: modules: Remove NEWS from git which is generated from full
  release notes
* 201b14e: modules: remove RELEASE from git, will be generated from
  template on dist
* 7694a7d: modules: remove subproject README.md from git
* 6376a84: modules: dist common files from monorepo root
* dcb37e2: Release 1.28.1
* 32113a6: Back to development after 1.28.1
* c43f2b2: python: Add item type annotation to Iterator class
* 49ca53f: python: Make Gst.Bin iterable
* 43421c2: Release 1.28.2

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...reamer1.0-python_1.28.0.bb =3D> gstreamer1.0-python_1.28.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.0.bb =
=3D> gstreamer1.0-python_1.28.2.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.b=
b b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
index 7169b853c3..181e3d8ea4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
@@ -8,7 +8,7 @@ LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc34deae4e395ca07e725ab0076a5f74=
0"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${P=
V}.tar.xz"
-SRC_URI[sha256sum] =3D "9eba882a413cf06bf0575e635f73c0a2d01f3abdf76e18f804=
a90f3ff6a0aa2d"
+SRC_URI[sha256sum] =3D "12fdd8e19af97d797a6b2c195228e6c9edc4cddfa68274912b=
78ef66068ad822"
=20
 DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstr=
eamer1.0-plugins-bad"
 RDEPENDS:${PN} +=3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobj=
ect"

