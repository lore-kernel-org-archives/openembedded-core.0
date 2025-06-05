Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4FEC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 21:31:44 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.24])
 by mx.groups.io with SMTP id smtpd.web10.19757.1749159094444330409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 14:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=jCYE2iqY;
 spf=pass (domain: axis.com, ip: 52.101.70.24, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3doqDese83tqg+yvrpBvOrPSFOjCCjVTHAUE3XjKEIO7QmcBFhmbUmVDvfRRjgjDC9xGSjD03vDZBJU6NYgIPia0cCuHi96Sb0APg+IzvqAaYEdRE2VaJ0kMz48YkZOj55xBMfq7aLmfH7xaKQugGVlFhXQVU91Ku1DMsguQLlpSDoAuyGpgOOhwjVKpltoQS77ZHD49fhewXAd4R2omcVz4toiqadXalHZTm4kDOcBuDCnlzdalyVRpBqhVXN4C3GnbZr03fo+0UOTgUQodnjLAk776XxVHzFNANqKo/Z7TXR4CUlYsl99Gqmwm2efTxN1UO0ZnAi+NcI86YFY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AEbGrVy7jSXAWrhZjPH+bkTyzufWYWmeBqj4ozl9OI=;
 b=Y5yeE4cVhHPSXsc9S4xHT75k/j0gIMcP7uUQ3cajnRnVXnqF88m6Fczd2hNgrDzMrJbkpAQJrfXBnIQBQwKDU9/TzST3CYk9GACtgbtHq4Qb/25sLbz3QedVhqxvx2iHnFLSUjhua2aOGp88eUv6wiDBzbMy0NcSIUdiA6BDp0d/o9DCHo2uirtbocpGBAMPIqt8Scjxmt4nhUB81kMlU9KgfJDZ22xe9Hc9zT9H5rOsvTQOqfvqSzaTsltEj/tSz6hPt0fUg4drnsmhRld5WewEp4GRl/emqv7RJekIzIVZ/SoUmE5smXTyXVyvm8XaBUV418BunNPrP2VfpxJ+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AEbGrVy7jSXAWrhZjPH+bkTyzufWYWmeBqj4ozl9OI=;
 b=jCYE2iqYmt3Yf8Xw+I12hZjXpO+5cseOySKjONjpmv8dDqmhhcRKx9FEgC7Q6nlflwqAfAgOTGmLkM/M+e0E3ob7B8kopFSdfhPP2sWhruu4QPNKogA4OmK7y1MEnaWjc9eLBlZcFw4PjGP2QB8LauSO71/AmUBhIj7bXQME97U=
Received: from AM0PR02CA0080.eurprd02.prod.outlook.com (2603:10a6:208:154::21)
 by VI1PR02MB5760.eurprd02.prod.outlook.com (2603:10a6:803:131::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 21:31:29 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:208:154:cafe::35) by AM0PR02CA0080.outlook.office365.com
 (2603:10a6:208:154::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Thu,
 5 Jun 2025 21:31:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 21:31:28 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 5 Jun
 2025 23:31:26 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 5 Jun
 2025 23:31:26 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 5 Jun 2025 23:31:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 24586141D
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 23:31:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 1A52C1200CC; Thu,  5 Jun 2025 23:31:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 2/3] util-linux: Move the license information to the recipe
Date: Thu, 5 Jun 2025 23:31:20 +0200
Message-ID: <20250605213121.2685855-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605213121.2685855-1-pkj@axis.com>
References: <20250605213121.2685855-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|VI1PR02MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: 74188834-5e05-47cd-4f44-08dda4785545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u2/Yg4lxmlwK7GyBr48PhA6EKSlS4dO9N6fzsFH5ESkNounCDlZFWpiW+APd?=
 =?us-ascii?Q?j+d8xbQDSaMwpAqKgc3guNXLQPdXQnBJiwbe8jQqbVl+/SIJSyf3Dv/u8362?=
 =?us-ascii?Q?9k0Ni5mq3a2P6QmFsSZ7lKnyfGpTcFzbkX0oTIuZcZXbBFma9TKSHbh/pMZJ?=
 =?us-ascii?Q?nPRiDMgHnHcBbvxhNFh/C0IAce0Xkt2swf6Tiq1jxA7G0xni9Nbeg0ipMSNv?=
 =?us-ascii?Q?X9cUmk+YVIZZ9urtnj4/LedgblIlvqCP4ErK9ZdlvNs6PhF5CugdKZE9316R?=
 =?us-ascii?Q?kar5a6RnvQj2WIRuX33iv1JwsFpTcJC0TEjf6K+Nnukg/vDteIMdCCJC7J7v?=
 =?us-ascii?Q?xJtgxm3tjDyA7m0ozPds0KvEjKVjo8cxJINwJ+YSy5sK/Qk/LmnC2P2PagqF?=
 =?us-ascii?Q?CyP1ZQYqftB0za6DVGkWziqePeplBtyvl90KRd14/dF1kWqFhV/Nzu/gjXpt?=
 =?us-ascii?Q?ZOiWzQpPucz2otP+VZ695yWX9s3z3arSVnBlEtwVelFd4h1TgGepuR/Pa7ll?=
 =?us-ascii?Q?hRW3EsoIHqnEVOZbgasyOio+pb+jVpXjsJ3crC/uu3nrugwGbkuZog3FOPz9?=
 =?us-ascii?Q?9y1C6bAH3AEiyFKeNK3AmhI6ZRzLEGsKroRhdIULw8OXtkKMqWaUozcvP2IB?=
 =?us-ascii?Q?5LRAcxn8TOlk+0Ds5QH4eMB+NI489xKxAUuTyCuQyaUZVIUMwxeYfIy0xsQl?=
 =?us-ascii?Q?h7HmLKP/usxqiS7cFvNfwi/rHyvBitNgdf5LuXGotV5Ite+Bv2BizbHed/mH?=
 =?us-ascii?Q?COguu2v9uBnI14wVzRChWO9qTG+PZ4FFV1oxWRf5X7IXBWTzCLAI+fCES0PL?=
 =?us-ascii?Q?SZDTW3OG2hXlmgwDt93/KdoRJhftHULPvtPAXtUogGilJEL44igv/7uM3YL4?=
 =?us-ascii?Q?yQrdl0WwSKwFI8pQygTKMjrsfZ57YKNe3aBZe3pPX5ghpm3Il/XSU2iUVL04?=
 =?us-ascii?Q?3SNJjATyoCLTu5xU4izROWx3LwQU853zFVimJ2JpOzRAldTHmwXEmS9NS8zY?=
 =?us-ascii?Q?YHlKJqTLaZDryu5XolrvUuFeP2uHnp9VlP9SD8rK7v5JlfifCsIDF8yfvf4O?=
 =?us-ascii?Q?hIeA/S4hnn9vzQnY3XveqagA9S1Of6i8urX1hKn7G1KyWs0g0CchcHU/C2yQ?=
 =?us-ascii?Q?Z1vrIiMWF7ZQ3vascfyeOSUM8gKGwe6KqoKoKlgcQN7y3TqWwYhICAx5u8RK?=
 =?us-ascii?Q?dcZJfiZpIqPNEGTKFf7yv8jEkgzS4ycqOXro6FywZuoV8sBO3WsBWbcoD5LN?=
 =?us-ascii?Q?yft3QqS1zuScgQZlG+GPu7OsuPe8U2UCSIOHxHsaWGoCKwmS7fbYB8EgmrV1?=
 =?us-ascii?Q?+CxOocAvk+OdsvnO6F+QJoaCIubJsf9YFvVG3Jid7Io8PhJosU1sidofVggo?=
 =?us-ascii?Q?hF0L3qxQKf4VrYjhCGb3MgUNa5YB+IdDY/W3nVjXs5Ih0TFxwq6obOBBcjFO?=
 =?us-ascii?Q?/RrVwnKbPF1kZYeCTw2DkZFY0zQvVCXEq9Kx1ocKghZdd7mwLu2zMIT4Dbgi?=
 =?us-ascii?Q?wKiIByG/XDXf3YQ+wuxMZd1oxuL6XJw6EzQt?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 21:31:28.9726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74188834-5e05-47cd-4f44-08dda4785545
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5760
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 21:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218086

util-linux does not share the license information with
util-linux-libuuid so it makes no sense to have it in the util-linux.inc
file.

This also drops libuuid/COPYING from LIC_FILES_CHKSUM as libuuid is not
built by this recipe.

License-Update: See above
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv3: New in v3.

 meta/recipes-core/util-linux/util-linux.inc   | 23 -------------------
 .../util-linux/util-linux_2.41.bb             | 22 ++++++++++++++++++
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index b0f2a9d4977..d41d093e059 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,29 +6,6 @@ disk partitioning, kernel message management, filesystem c=
reation, and system lo
=20
 SECTION =3D "base"
=20
-LICENSE =3D "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1=
-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT & EUPL-1.2"
-LICENSE:${PN}-fcntl-lock =3D "MIT"
-LICENSE:${PN}-fdisk =3D "GPL-1.0-or-later"
-LICENSE:${PN}-libblkid =3D "LGPL-2.1-or-later"
-LICENSE:${PN}-libfdisk =3D "LGPL-2.1-or-later"
-LICENSE:${PN}-libmount =3D "LGPL-2.1-or-later"
-LICENSE:${PN}-libsmartcols =3D "LGPL-2.1-or-later"
-LICENSE:${PN}-coresched =3D "EUPL-1.2"
-
-LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D55e895a80bdd4ffc65e167=
a76d2e7569 \
-                    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
-                    file://Documentation/licenses/COPYING.GPL-2.0-or-later=
;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://Documentation/licenses/COPYING.LGPL-2.1-or-late=
r;md5=3D4fbd65380cdd255951079008b364516c \
-                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=
=3D58dcd8452651fc8b07d1f65ce07ca8af \
-                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;=
md5=3D263860f8968d8bafa5392cab74285262 \
-                    file://Documentation/licenses/COPYING.EUPL-1.2;md5=3Dc=
075d2767167a2355b23392018a1cbbd \
-                    file://libuuid/COPYING;md5=3D6d2cafc999feb2c2de84d4d24=
b23290c \
-                    file://libmount/COPYING;md5=3D7c7e39fb7d70ffe5d693a643=
e29987c2 \
-                    file://libblkid/COPYING;md5=3D693bcbbe16d3a4a4b37bc906=
bc01cc04 \
-                    file://libfdisk/COPYING;md5=3D693bcbbe16d3a4a4b37bc906=
bc01cc04 \
-                    file://libsmartcols/COPYING;md5=3D693bcbbe16d3a4a4b37b=
c906bc01cc04 \
-                    "
-
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/util-linux:"
 MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/=
util-linux-${PV}.tar.xz \
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.bb b/meta/recipes=
-core/util-linux/util-linux_2.41.bb
index 00036e8a68f..18b8ac03b94 100644
--- a/meta/recipes-core/util-linux/util-linux_2.41.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.41.bb
@@ -1,5 +1,27 @@
 require util-linux.inc
=20
+LICENSE =3D "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1=
-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT & EUPL-1.2"
+LICENSE:${PN}-fcntl-lock =3D "MIT"
+LICENSE:${PN}-fdisk =3D "GPL-1.0-or-later"
+LICENSE:${PN}-libblkid =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-libfdisk =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-libmount =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-libsmartcols =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-coresched =3D "EUPL-1.2"
+
+LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D55e895a80bdd4ffc65e167=
a76d2e7569 \
+                    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
+                    file://Documentation/licenses/COPYING.GPL-2.0-or-later=
;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.LGPL-2.1-or-late=
r;md5=3D4fbd65380cdd255951079008b364516c \
+                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=
=3D58dcd8452651fc8b07d1f65ce07ca8af \
+                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;=
md5=3D263860f8968d8bafa5392cab74285262 \
+                    file://Documentation/licenses/COPYING.EUPL-1.2;md5=3Dc=
075d2767167a2355b23392018a1cbbd \
+                    file://libmount/COPYING;md5=3D7c7e39fb7d70ffe5d693a643=
e29987c2 \
+                    file://libblkid/COPYING;md5=3D693bcbbe16d3a4a4b37bc906=
bc01cc04 \
+                    file://libfdisk/COPYING;md5=3D693bcbbe16d3a4a4b37bc906=
bc01cc04 \
+                    file://libsmartcols/COPYING;md5=3D693bcbbe16d3a4a4b37b=
c906bc01cc04 \
+                    "
+
 inherit autotools gettext manpages pkgconfig systemd update-alternatives p=
ython3-dir bash-completion ptest gtk-doc
 DEPENDS =3D "libcap-ng ncurses virtual/crypt zlib util-linux-libuuid"
=20

