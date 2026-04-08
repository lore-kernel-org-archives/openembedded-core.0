Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E370105D9A0
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 03:21:20 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98129.1775618449085041249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 20:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=gyznN82n;
 spf=pass (domain: axis.com, ip: 40.107.130.16, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWyk5nWifV2dJJhGO0YJK45snHzyuYyEcA3yopLxJEW10OG/HLZqsaXRmXOIt2s6NGSB2w7th4/CaSka5potJhqbABHV+Yy/WhBjSv8Fl408hq3POxTnvEuYq+a5p85t8YoC1W0S7tw7OxU0tAoqoIT8rD3Ly8pqOwwOWdN8nnfNEOPD+W+kV0JES7R91biY8s3oQqdwbxC/FMWuZyPmF7dNPmUxmcKmNGt2AstSn8U0bONH7xZLN3YIaA6GLuaSm28VzQxjrGtZ//zDuDAPBIkRd3NZ97fxrmu3yGOxl/ZqXxpBkmNc12vAj90g51cMs1MUOCk/DsdsYIAXqFV0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzkMTB1f5F2ZgseBFuBuSr+a2EB5WEiM/RbU00MI6PU=;
 b=klw4ohr7FangWaBUaYqzFRxNM0Up3ghii0UZa39d3OJlZszk7ejDt5OfMhjTCXpcrjpY9SCPLx0Xkw3s0YQp74bHlI8h3VPG+4Hpo4k6P3QsJRL+2TV8vWtFJNxFj98ASCuG30OBs17CQNopGFhnAPu8qYamelS1ZgJ3NKfCRTLDU/Rt7mDqcBCiKpMc13fQcQGBirTgrVGuByzLJ9qhuuc5GgLU9rrHOGJuyi/ja7mbLZCfKlmg80PcDjs6qrS/a1sCNaiGvfTOLsqJ2eOXc5LkY05p8L6GBUn+RY9J+BLs2JlP4GWjEreWhNAPf8s527ovcsAFJbbrOSyKLS1Bvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzkMTB1f5F2ZgseBFuBuSr+a2EB5WEiM/RbU00MI6PU=;
 b=gyznN82nZBNEg12soyrCaQp+GIaxUhPiOdYkD2p3nWz4WNjkPRQiYOD/klR2OneRBbMZPslaix3RCcj2mbOqpkVJAb5BATFXnviTg0Ra3WXj3XX2B4s80TOaVJkCHbkrZSIOM9rpMOBuxMZo64ENCG47tXgYIoRF1sJj7ruFz2w=
Received: from DUZPR01CA0308.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::19) by AM9PR02MB6740.eurprd02.prod.outlook.com
 (2603:10a6:20b:2c5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 03:20:44 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::9) by DUZPR01CA0308.outlook.office365.com
 (2603:10a6:10:4ba::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Wed,
 8 Apr 2026 03:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 03:20:44 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 05:20:43 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 80FD22D0F
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 74720120319; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 09/10] gstreamer1.0-rtsp-server: upgrade 1.26.9 -> 1.28.0
Date: Wed, 8 Apr 2026 05:20:22 +0200
Message-ID: <20260408032023.1810147-9-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408032023.1810147-1-pkj@axis.com>
References: <20260408032023.1810147-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|AM9PR02MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c29cab0-2ec2-4f2f-cc3b-08de951dd23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	HUaozIGX2oJKD8cqqpSucNMuNsC+JyiLH6NMtzHqQ4mbslgXoYftXpJQVnLSaFOtQycUpidawYZEEpoTikxW+vTDkputYh0jNgCnk2CKxrJqKpEwjXoJ2FnYCmz5lNlT2603eOha1PWnas7FzD9V2ThMIf57Jh+ZlVWRvaLfiQbMyFQ7fSGJY+gCI/c/QvaHvFiAQ7vIvw3fh4hcsqVjULmqW4WFLL9Whf/TjNJlyoP7dUJ3td9VzSrhrrABPCOvzjyviaRWDqApXr3Jl+38nEzn8nWrm8moBtOfoJOU/b8FRijqOeeqVKl+bIcnal6ndo5cfUe4+ri0/MiS+qgPigkZr+ux5OarxPopcaTRR2mTvaYZFFVz0XuhlDka7FpIFJlfhJZ5DqekKxSpruUB/wuBwEb46yfg5qw+yVe9fdgYwpzW10P7I8YjkPluguDddkawH1rHp2590+EgMfjyfFquUym5N6OacPqs20g3sC1NUYvyvh822ZGgdmJsR5ae1JMUUQuknYhFdIgy6zhQa99m87k/2IuxErLHmVBPjzkdPIuH+W0uZD190W3/UCiKcxuUNI4mYB0JXB5R/2FDvJKTGLYjtMuKM9qIC6KduatoqQ8Go6qqC2vgmzQvXou3dYUxzg0x4ncFKLXCTwr7MjtvQ/By8LsVpJV6m4lyFHCIW8t1wNWPkgseFZYvJ17H2mii13n7alYnIg2i2yhUo2Bn+YJnzF3n0bFnfWLQSt8=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Ua59QpkawZok+zCioSn2zZl011c6/k/chGzKZUnquHMMHySwhvRBunAoymb/IYcoeZx+ATMOmKAUgtjZ2Yi0zbvB4746Jt3vQzO4pcKxqqni2l+ediNeh3SYe/cuF3WvyfVeXMVcUWvbCvSZdmoHSctnLVyUvBl3LELYQVI8hzcIbXUxEubNH/MQkFRkLWUAQYaIpEbskS3qRTjA0q0xdg6ve8xhayDA1ob9EKRp7FpB5ICxqZUuLApPwCKW6x+X957jaN/qzU/KQmvCQ3LfSutQE7KBK2klIjQOB8AKKGyGqRdHJzP0ccwg9NCA0cJWxcVi7ZuADiyyezTBCJfEoSaC0whQKDCKXMlgP5He0x6nl4DO0zX9fMlnh/y/+XsTPLnyIYbeDttoeKdISmw0yDczE4W+dNobQCPtue90+hlp5N9WNtW6bXZEb9y3YmB2
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:20:44.6343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c29cab0-2ec2-4f2f-cc3b-08de951dd23a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6740
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234798

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 ...rtsp-server_1.26.9.bb =3D> gstreamer1.0-rtsp-server_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.9.=
bb =3D> gstreamer1.0-rtsp-server_1.28.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2=
6.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.=
bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26=
.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0=
.bb
index ac6b52ee46..d8bd047afe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb
@@ -10,7 +10,7 @@ PNREAL =3D "gst-rtsp-server"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${P=
V}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "67e92e9a5b0f2b51eb571cc893b80da2ae2374f19b05d381d1=
e364393fe12654"
+SRC_URI[sha256sum] =3D "5ed0938ea0fc1df2709cc939245d93294f09b2d7220e19f7fc=
db306ce2b6cee5"
=20
 S =3D "${UNPACKDIR}/${PNREAL}-${PV}"
=20

