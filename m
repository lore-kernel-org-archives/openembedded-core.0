Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C9810F994F
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 14:17:40 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.107431.1775657853955669152
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 07:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=P2R9rc2v;
 spf=pass (domain: axis.com, ip: 52.101.65.35, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuEUyv/CjDh1FNu/HELRQ+gNKXt6nqLT5k3Y1FodgSwuyq/DB1ZlKM2N4f+yK7ONTsu3l/vgyH0rOQyAINGga4agVcxUu/JXgTwzbuJNnkAPHoYUOGEj7FGXxQiWdzKychL5bJShZA6Zxqxi/e8voLJ60y9LOSyl1jjluCec6oZaoswQXlK+QyFtO//2M06XLdI2HwtNjWSZx9YqGjN/Fh+DbX6sjc+hcuqn/eSaIcqU2Q4ZJ9LFypPviXXdcxJfqb/Hn5O/+KZYIw5uzBxboy6dO2+iJQbiM+LZNIDeHgCs93zxMPeEywsqDE9bkXr7Jc5FuLQkqvx0M5s+z5D4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OU5vq9JjhcEC1O2Dt3GGvBOzJ+iySe1or5M46p40eog=;
 b=OEhbspNGQGprgdttmZIsYqXkSIUFRxmBg2Lbn9Cex20Naemi/1KN6daRT7x4HvNtS8Fx2Mru8cdMn3uz/CCEKbHh76fxRPW/7kp2EK6UJRLlxD+675tWOsTItjDps+S6CZRiLNnl8cRWNBrVat+jplWr4rvS0CyY/kU5eeL+xsZ5bAoMeu4n7YxDajSQnz4/2Igve6ObtrVtXUoFIIQwODkw7xtaAi+iDsOpHFIH4QdwjBZKdeI9XsMhk20lDeWiIyvGwL4UYztNpMJ16/TBDy1trHLAmM1n9thUwkzq8usHklm+M5KB+3aFbzcU9c+DCjO3fvS62uLhSoNzoX8E0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OU5vq9JjhcEC1O2Dt3GGvBOzJ+iySe1or5M46p40eog=;
 b=P2R9rc2vSBfpX2CX7tN6YY01UsaBXGtcKagpmaeOxKz4VOvqeod/14UV6r8ekHLXW6t0V3ulo1zI9JaZvjUsPkM28FSdz8pHNeZBSm8Y5gjaOiuBSGRGTxaK2nSW7ADlzZ1C/9+hCxTI6bNErzIpo2GbfwEcXsea7m3/Eak84Qw=
Received: from AM9P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::29)
 by VI1PR02MB6494.eurprd02.prod.outlook.com (2603:10a6:800:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 14:17:29 +0000
Received: from AMS1EPF00000092.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::3a) by AM9P195CA0024.outlook.office365.com
 (2603:10a6:20b:21f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 14:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000092.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 14:17:29 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 16:17:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 9478F53BE
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 90B8B120831; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 08/10] gstreamer1.0-rtsp-server: Upgrade 1.28.0 -> 1.28.2
Date: Wed, 8 Apr 2026 16:17:16 +0200
Message-ID: <20260408141719.1086823-9-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408141719.1086823-1-pkj@axis.com>
References: <20260408141719.1086823-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000092:EE_|VI1PR02MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c2bd68-b563-441d-4457-08de9579916c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	8O3lUEUbkSHCACdqVfqfwekmWoUeKHvP6iWKpjnHZLOZAIq4K2G5WpIvCIHyvX8VVDI98RDBN1nFcMP2RIpj5ocRT5Cu0j4EOcYEzSXTW8SEHvtpmT+MqFfiOpiwySytdrjxFT/iN3uqqlbCldhDsXOPCXZVESb6vQmy22Sm28/AMVebfVS/sWvmbWiaIPqp9Fbpc+IB1YzQrGYv8yfm3ij9RmvIuR9Kn0qGqKAj1HrLdGLVfUV85HWJzvvuqrXi6URSXxLQHPTwtcf8BksdPWX6C3nqG17j2HUcU/cUUWjWKhhq5z9I4Bm/McSvD4sv5fX2oU8o4HgHXhzd1BiM0ppGxY7WBdgmdjbW9yLjAK2VU4eEh70Q7nNb/qgMn6nZFCKL/TfIrNjlG5Zv5xeRZonVLomlXOtDY0VFH4hnmcrYYlFIhXVv/iOQJoWr3NY4N52GhL/IuM6YPUN94/+nE3PkXiezg77tgLMAn0iVsbAeTR5P+hqmupia7t+Ewp9XCOGISH58qrUkhJLU2r8OdpVP+zmW7+3OWJ9AARDyd37HLE2WQwaXsWK3l4Kc58lycDUbx66dDS+UeUjgp2+m2g1iZf46c5hgdzoAYcJKRQbwxiwvK+tnw/UErg5apxXUi+gnsNk2aLF1NbxOk/iaofZrJASff3Dv8B77ArLKF9Q6Tm/V4URz/8Getzr6suKKVxd5zYW9Ac3hR8aRZH5uzQf5FAw1yix9vSxAphetGoI=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	s6nLa4PT7alK/9ZcBThUcvNa6UHJKIAB77c+scLW0b6Rg3r8DGJHsP/D7TpIZ9CFAqcQBaN7KxVLfjJI0tQxh/KMYgle3zTzUzaigh0m9nhvVX8EqTHbWq9RUskOla6Of24xbYVMoFEvPh4FWlltdiPq7rWUk6yOiIgqpLMYP4WZb0PWC8qyPuXgWE5oWUC5QADnOh2S0L3aKoOuJwmH0+4GqByGBpfwGc3KIudpWa9ktZRkl8lVfnCP2jfIE2YTgE0bU4o6eM5tVyMMXTQUrCYmSfXZ9XOM3577zB30D2RSkpHEMMQcZEj65z4trTJTN67F3QFUk8lc0+gsVvG8H+IJ+H9xPix1ObUbb3mOLhQ7wwQ+2kcyi5BSWelIrLa4fSH4SEElNTlROklpsYy+kWtP2yF9bh/T6HQt1A2CpPomO0YDKKbOiTgF0WkKFLMV
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:17:29.6208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c2bd68-b563-441d-4457-08de9579916c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6494
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234844

Changes since 1.28.0
* b2a3b2e: Back to development after 1.28.0
* 835da19: modules: Remove NEWS from git which is generated from full
  release notes
* 201b14e: modules: remove RELEASE from git, will be generated from
  template on dist
* 6376a84: modules: dist common files from monorepo root
* 012b257: rtspclientsink: don't error out when stream transport
  notifies timeout
* dcb37e2: Release 1.28.1
* 32113a6: Back to development after 1.28.1
* c2ef75a: rtsp-stream: Clear send_thread when it's freed
* 20d3e66: rtsp-client: Lock media when unlinking session medias
* 0882b60: gst: Fix a couple of const correctness bugs around strchr()
  usage
* 43421c2: Release 1.28.2

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...rtsp-server_1.28.0.bb =3D> gstreamer1.0-rtsp-server_1.28.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.0.=
bb =3D> gstreamer1.0-rtsp-server_1.28.2.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2=
8.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.2.=
bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28=
.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.2=
.bb
index d8bd047afe..755c0c7d56 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.2.bb
@@ -10,7 +10,7 @@ PNREAL =3D "gst-rtsp-server"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${P=
V}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "5ed0938ea0fc1df2709cc939245d93294f09b2d7220e19f7fc=
db306ce2b6cee5"
+SRC_URI[sha256sum] =3D "917c58b9ff14f91a6b5cd1c3af16c9fcfdf5d8d78d3d167c7e=
8fa5bdda35f947"
=20
 S =3D "${UNPACKDIR}/${PNREAL}-${PV}"
=20

