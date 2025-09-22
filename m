Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7946CAC5B9
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.49])
 by mx.groups.io with SMTP id smtpd.web10.46602.1758529079746341634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=JdECwK2c;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.65.49, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3Zgaxng2q0qLDTT/12gTsO8jPhhfEAzna5D5mmtFaJOx90DG9OkwL0+WVa3AWd5Qhie7i+KmdYP8QN+vu8uK2v/BSrZ47aQd6ZMi4U0CgYAIbWVx9kk1Nf6xQqtkYgOQ46Ippcp7S5trfiK+Orx4qCN2ok2Z8CnTzTGj8ggtKYWlmxNzEJIFJMQLfXODOqIigWymFQPxzL0jxulGMvUZhlKN+kj4cRxCuhreuQyy8JEInNrEn9sWFBrw5LMI8jd0v8+m+71bAmg3rbT09bRSnB81SIIZZm4iSjEk/gtrxRaq0q0ee6PdNToMmOE20tiIKx3oRqg4jiqH+LEyYf0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRW5DW+tbxxer+0sIp8DPfucml4mgpurM5SKxkbS3VM=;
 b=NNzScbZZuJbya0CbNHijodgDdTNdKBiJ9FiEhXLETDETXIiMdOi3qnCd7b3rcViBQwE+AAQV6lLgb5BKaC/qGqXwSWqpIe4j0PyfIwl9k5o7OtTyC+qJ3udjvkc2bny8NnWYL7cUm6qgkjv018qVMQDhCsaWdvq7nPOxgiKcyA9NB6brqI+SsJ7wMhDBnjqh+blCwrNnMIwrIXZrxKOZJ4GrO/ji35jzsTc4aZcCHyUpNhTQ7t8hwg+a3pA3+p+IV4S7k18J+E8Q563/18OMXzofnoOs4+IcxlIyjuhSMdYktVnPnzfw0T1VbGdKKJ6FO6sdKpKhVdpxANQgKF2j7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRW5DW+tbxxer+0sIp8DPfucml4mgpurM5SKxkbS3VM=;
 b=JdECwK2cP7ASerIkVuuQFrxvIoDuX3cXyTCWKgfmVy5xi1+ZRZPqa9TDm+Ev43xwtMNCby1/yKtcZZ0H0L2y62ielwifxujpxxUpti7e+dkO4ZTf9XQVdQKBG4yMQrtaxhr0bKL6dkAVYLRPo8yw9BfV3gDwKjevFSLLLQHQbAk=
Received: from AM0PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:208:3e::37)
 by VI1PR06MB9072.eurprd06.prod.outlook.com (2603:10a6:800:119::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:02:04 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::af) by AM0PR02CA0024.outlook.office365.com
 (2603:10a6:208:3e::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 08:02:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 08:02:04 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 10:01:58 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: bsp-development.geo@leica-geosystems.com,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 8/8] image.bbclass: enable systemd user services
Date: Mon, 22 Sep 2025 08:01:51 +0000
Message-ID: <20250922080151.3483394-9-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
References: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 08:01:58.0933 (UTC) FILETIME=[2BCF3C50:01DC2B97]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|VI1PR06MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: c4361506-6b5d-4c98-3e02-08ddf9ae5152
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fMDLojDORnN2dHTC8YGlIHKJqZyRtPQyCewwqUwrPlrROq1zP2S4iZRp4z+U?=
 =?us-ascii?Q?pnntwdGYhtGStWaFd2JA7zOHfKRYBVnk2ay5PGGe3MTLZnkYmh10nugEKfGg?=
 =?us-ascii?Q?q1TRxFCI0bqf5S8sHBlDdmDvGvP/mqgxfXCXyV6V06DAko3/HkysaGNpYNqf?=
 =?us-ascii?Q?GoSTVY+PkuGxD1NS0WJ99cTov2xc6tgHdqKSyRElUoA82fyfj1+7q7YKLslv?=
 =?us-ascii?Q?lKzFN89ks0sziLHlrECpr1RR6Bu+5Ui8yokzkkKsp0s2Cv/uf+E75PW1Cn0Q?=
 =?us-ascii?Q?D73+4NC0TAA7P9eMCLppe0W0znJDRucdrkSDX8JEygtHiLFSxPDeedrJK6T3?=
 =?us-ascii?Q?XZF8O9mS6jPDRLV3cIlkl1ycfYwea3N8fYWfzsJ5bwg/17TaCODfMfb2OXWA?=
 =?us-ascii?Q?GSrKKupawz3xI6XPAzlUT10BUyzi3WBlxc+cG0/cX7HP4V2Y5gSb+9snThtD?=
 =?us-ascii?Q?7p3h3aqxkKgDIBmqc49XYbFR8csB4wI9vFt2lCF8NfjnyfyfhjDeOEDhsjvv?=
 =?us-ascii?Q?VXhfGopjcE/joLx6PeoiZp+sECKdXPavTCxGi6TenwFByxFHzS9NTcGIlGaH?=
 =?us-ascii?Q?Os/LKo/KGiwvzKJxWyt2uI7xG0Y03jCCeX971wtUqtIs+N4SGyM+Bd01eG/3?=
 =?us-ascii?Q?wVejmkhdcjTeqd/HNz+erDMRiITMR3T1gXObizxW+on01FZfh7pJIxaVg1NN?=
 =?us-ascii?Q?NIRwXDdwMUcCV+erKQnDIX9FjShAafGpZfwZ+r0Br4CpQnNSkFi4MP+r+wbe?=
 =?us-ascii?Q?1c9lEB5yDtdmVUKNTzloysLmcqgaJFeWRwoUTXxunmkxFD5j0Ry7XFGByjrY?=
 =?us-ascii?Q?n6fkfvsuV7iXjwdeTHniUCzQZJ+5C2A+J5DjLDjWzWnEYQgX19kXB1DSKnnf?=
 =?us-ascii?Q?xBULFJ9PItuBBx4zlD6myP+f9w6m+OnaRHJYDK2C+B0+sGAwYodkuCE98jmU?=
 =?us-ascii?Q?9B/FZICPoFhCwke2dX6xGRS9uCWsvIzApHOhwBk8imH27C7rRTCde3dls1by?=
 =?us-ascii?Q?mQKBEXBS0WBsSLOH5cL+dGrC3g32cYSw139nn68YTMltqJmAtpFGieGT35DQ?=
 =?us-ascii?Q?gi/IBGuse5WXPORAw8h4fvHBQib3+jtUAxop+ubkvqJQToE0RkqYj1lxnns7?=
 =?us-ascii?Q?dvV8WW3lN2fdj0x0vWSbwiwPgHU/8r31vgd/jWaE0N2EIMuR34tVUQXF/LQq?=
 =?us-ascii?Q?g2ae/Wvpt6y9ORa3m5LnWEQXicgOKPE6Yh/jADeEwqLa6E59nzDhMQ2xIFMi?=
 =?us-ascii?Q?9jIUmFx0dwMcWCi3qJkbxYzg2hsR7pY/Biy39vORe/4dG7SEWECeqO5BKUO7?=
 =?us-ascii?Q?ZngPjQFMrItZRpf6p/ImeUChRNDjwrLnzh2oX3zG3w6A9t0MQ9Nd0s3JFcQK?=
 =?us-ascii?Q?VA7o3uH+ycN+UQDOq02NvLgDt7tRms83vzjMrB+XzCcIWRS7la71RolZu3qV?=
 =?us-ascii?Q?Xrl+Ejcmk3mhkt2eyPlj7IcEwiKjoAEDgn+XDSjmA/81cHGUSdyp8BrPwTVg?=
 =?us-ascii?Q?hKBIFNXqSmrqTvwQGnB5Hq3+nsA9/ri5atwSDMefDdTyarmna1LAPdNX3EHK?=
 =?us-ascii?Q?hb2XCEJRWuGtkauGdIA=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:02:04.0105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4361506-6b5d-4c98-3e02-08ddf9ae5152
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB9072
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223843

From: Artur Kowalski <arturkow2000@gmail.com>

Run systemctl preset-all with --global flag so user unit's are enabled
the same way system units are.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cdc3b3028f6d71788b5fdd99436f69fbf18f613e)
---
 meta/classes-recipe/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index 1f0ee1861e..0c3b396857 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -670,6 +670,7 @@ reproducible_final_image_task () {
 systemd_preset_all () {
     if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then
 	systemctl --root=3D"${IMAGE_ROOTFS}" --preset-mode=3Denable-only preset-a=
ll
+	systemctl --root=3D"${IMAGE_ROOTFS}" --global --preset-mode=3Denable-only=
 preset-all
     fi
 }
=20
--=20
2.43.0


