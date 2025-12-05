Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E87D32D8E
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 14:51:32 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7362.1764946289893613153
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 06:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=BaxteDO8;
 spf=pass (domain: ericsson.com, ip: 52.101.84.28, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkT81pk2f6Em5VVQMkFte4XTNC5hXS63R6c3UewcD2Rx7XHgQA4O0Lde8EyUq1aZtahLXZXlURZQ5/vBQfGCPBL5JMKRyk2iS9i8bqGoGVTe6Ak6xstraBNB9YG3QO4rawTB7ilEIqBzpE3V6mfTboAqAFnB+QaK8tI3AHOVo65DhwBdJ+K9ifpBlzrZFvJtdEE7MJcvOZFcNl9g2tgsBznmcDUeUFviZhUUTsxsJFpKIa7q7+LOYuSWI4lTAILcXWOSCpwqFu+ghzSCXl7btKh/T938NPo8ML848TpXr+fKdiQ/ED/pPeIEooaST15vXqp5/Z3dfhpqwcK/ewci/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbdSdRKJnMfuUKAEsdrqz/AiJscwz0LgagjRMmV3OW0=;
 b=UVXUqKT53h9Iy0qT2rjBPVBgRyNZjpfRSNNR4kRAKfuPJTvx5NIsDMC8sBCUKqKfp6V69Fe2Y57l6O6YpzF96609w7vMYztne4jJ2Ri9GnxjkVlcFz+tCADIxf95B4lS3BvrfN4YOZwZR9X8EY2+UxD/4D1MiIMwIQhVIJjKRMwHjGWYeABlDL3e2h245BLfnwLcGJg5NRNZFxYec6GllVrNjDH8vPG2pDDBr7D3Uc7hErZv4aBCsI4iHQvN7kxuRUhXO12SI0MJpli5DS0Qh3ff2EgQxIj5Paw5u+R3SbokXzHGhWhxrLKGd+ghyc5dzlMabLBO6AMp/uwYvE0ILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbdSdRKJnMfuUKAEsdrqz/AiJscwz0LgagjRMmV3OW0=;
 b=BaxteDO83iRcf5XthOTPhZWaq4k+DEb5OD0y1bddPILAm0bF+EfApSjb7MHcNZJtmI6TSpI+aPr+dwfLALm0wizqMPxDuTqU1vDpPNN/9bH0nvb2E5cGWitChX9M1Kn2Na7QPJ0I4uWKb9lhU44+1lK8YJoWLJm385qwQcqtsxESLNl++9lu4ervym/NiDnjRP4/eGrfJeuF/K+ID/V3ZaakC26t9pmiQbvOwEbXwH6vr6q7SxMG9JK88110YLH8Sj+B6geNjmCThmvrDWE6zZyZq7ZvQWvWkGaI2ZSi+jO1k7D4eK4juQDHB5d/gOFGXcciTq+D29X5sw/A4lsHzw==
Received: from DU2PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:10:232::16)
 by AM8PR07MB8108.eurprd07.prod.outlook.com (2603:10a6:20b:36f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 14:51:26 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::23) by DU2PR04CA0071.outlook.office365.com
 (2603:10a6:10:232::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 14:51:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 14:51:25 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Dec 2025 15:51:25 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id E618E4021580;
	Fri,  5 Dec 2025 15:51:24 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id CCFED700DBB0; Fri,  5 Dec 2025 15:51:24 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Kamel Bouhara
	<kamel.bouhara@bootlin.com>, <JPEWhacker@gmail.com>
Subject: [scarthgap][PATCH] classes/create-spdx-2.2: Define SPDX_VERSION to 2.2
Date: Fri, 5 Dec 2025 15:51:09 +0100
Message-ID: <20251205145109.272925-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DE:EE_|AM8PR07MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: cad4cddb-c518-47a9-2830-08de340dc3cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Mqnm8vTkBS3QVNoTQfwX5pGp49NMEDZrDzifvPw7czvhoiFwfOc/euSAIqGX?=
 =?us-ascii?Q?GagBSQGCANz3A+H+qwAG61dT5wb6WT/HyOEVwvIhrGy6iuVxBeS/f6EqfMLV?=
 =?us-ascii?Q?IQ1k+c96a3UfFIPv/UZ4ta52llzam+dK1qSiOB2PduM9P1LvAUKOzuiUW2bZ?=
 =?us-ascii?Q?prR6chdei2LelEGBljxzLJI54mMcC3KwP53mJ/rPijHn1QCjPy+d1VYQTi6V?=
 =?us-ascii?Q?A/Y3khoE7rfa+66Hn0X48sPVdtz+A0rMYf9EdjOzFddouU9uuT60bReU3HiX?=
 =?us-ascii?Q?h0eJ6cNqvZ74GkZ3Z5SJI/Josg6KBwi+DAo4vGAAir1CoF2kltEjf2SSlQXJ?=
 =?us-ascii?Q?HosSsa/hkC/mTzpq5P3IXPYd0Skdbbp0HicGYY5eHcR3ONL/8UHdIptMr1Jy?=
 =?us-ascii?Q?vr0aF/z8D1afhrGfz6UB3edYimJBeX5HYTynqP4LdehBlFf95uEanuV38cMR?=
 =?us-ascii?Q?XEjNipXg+slDqlxmh4++WRAxYmUv0BueKmMFKDE1v6W85YP942Q7khQQZuG+?=
 =?us-ascii?Q?4Sq5F+DLaEN5BkGXG338uoKZcBfoB8UTeGiV76zd6drdRhDiSjNf3aukmhxN?=
 =?us-ascii?Q?Wg8RPjfWJ8dmyIfDBPSB7+h98Bifd6CjI9YjLQYgxyWa+HY+o5vMKZkeDyt7?=
 =?us-ascii?Q?NrZpIZN+Rh9YNbPBpVskkrIHr/Rgsvf5KBKJp7Vf1qallH0BNgFzcLr6UxMl?=
 =?us-ascii?Q?VK1MLq1tOjVTFK3+Zuu3ytDgJPl87fpj4YR6+w9zlnNf3TCj951mYk0W5Mxh?=
 =?us-ascii?Q?Rtv5QAk2AeCxvd5uWSJi4Zo5nExpGeI6X3hupVHwFVmJw0O1RLC2vWtvYRPf?=
 =?us-ascii?Q?9/43nZWjOH/0iBKOr6XpznnYO9twj9caDNjJaS8FrFFPd/S1aGFBox/2+QNX?=
 =?us-ascii?Q?KfhQEZQbJYpApGdp1O0yhuvEhfAvO9jTfhleM3+JGHiSV5miPEMG5kLTDO3r?=
 =?us-ascii?Q?kPdwpZs6BSN6D62FNcsDE3BZB4dsL2gRfZibIRGLy3aWzlZXKmZ4YTBjzYa3?=
 =?us-ascii?Q?PC5Pio0nthvyXbWOjCDcsvy/yFtgrY3c5m9RBABfeJuWDSWB922c11J1kWyK?=
 =?us-ascii?Q?efriIoUUek66cSCgrDaKfrImT+N9I2LFfqHNRtur5Zu7U4FHVeu8ic0DHGha?=
 =?us-ascii?Q?Y7/7Cj6bSHqSs6bDt6N1+y0et503oqPOKQeQ7HhNg6MEWNiR26/+OBjnK6J+?=
 =?us-ascii?Q?RU5J6D3LmQhQ4ytAWBVLgI65RU++7A3DZMIr9Y6wV3E+NgqR6ScC1R5zIgCo?=
 =?us-ascii?Q?/qScYWnxf0+b6/tilETxGlpDm+AulbhTXeK3MhAllRHToFmpOheFdDV3DPqf?=
 =?us-ascii?Q?aLLrzifdNIFRqqS+qlJfaW2sL8lgt/VzVpjnXuMfS4XreyYT/VE/ElYGMncN?=
 =?us-ascii?Q?/UzK1IMFKBITp2sE+/8V8wzu9TJJleGZVNiMkvSc1CI3CLVqqunPov4mW1Dd?=
 =?us-ascii?Q?dNjea/GC0un2ipyeXZvgvzmI213A3dV3ic7YYQpkIO5Jvfkidv2yfLwHkBZ/?=
 =?us-ascii?Q?uwI70KXuRKJY/uqI3AhdIkauw2TvG/U+XrTjySl3lRc9fMwcOliIzYlPNW8c?=
 =?us-ascii?Q?FiBvfUq/9kPdYiEq3hg=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 14:51:25.6826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cad4cddb-c518-47a9-2830-08de340dc3cf
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB8108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 14:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227352

From: Daniel Turull <daniel.turull@ericsson.com>

SPDX_VERSION is used in DEPLOY_DIR_SPDX but if is not defined,
will default to SPDX-1.1

Define SPDX_VERSION to have the correct deploy path, to align
with master branch behaviour.

The change in path was introduced in 8996d0899d

CC: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.com>
CC: JPEWhacker@gmail.com
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass
index 2351a3d5a1..aaa2e78fe2 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
=20
+SPDX_VERSION =3D "2.2"
+
 DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx/${SPDX_VERSION}"
=20
 # The product name that the CVE database uses.  Defaults to BPN, but may n=
eed to

