Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF551C3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 09:45:05 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.40])
 by mx.groups.io with SMTP id smtpd.web10.10575.1746783896240505842
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 02:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=VjZmZe0I;
 spf=pass (domain: de.bosch.com, ip: 52.101.72.40, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+x5dvixiH1cVAKI90YFwFhsi8L7tqWLpS5n27kRh0PJLNwP1HbgNCwmQdbv4Wo8chI+BZBRdQulPApZWBVVNHUCYsERi5dPeDHx2vbX+8EIYJ8OJoxKNmFj6htf6apbhG98nDpCHuHOgQiHTHBdvT6V0S9EXX/vnDLy7/CDhfzC/6OXgBePrO0LYFnB56n7rHX1ZeTNHNWEwj6yhmoOuCTPUZ3PdAKIbjb602pJnoMU9EtIV0OskZTtLjGIRGBpc2Ws2PrLJkggRHKtjj21C9CdoygYI+4ZyOYQAaCMgdMDyYXVLIvVutDBFo/FC9d137jtNpUVuSw4M/9iX34rRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE0GrrEUmkkYlU+OYsf48YK4i4K+SiZVH74pPXaNxaA=;
 b=LI7s8G+dMn1OElskdWDIqssSZd8eRHnnHXF12/PjmzOiRLR2I6EBcxm/YNfw4oxjl8vcuOEDWdLlj3dsacO66mYDTlComeRSTTtzVSB+e7mvO6wHz4fn0NZKNRRM4r5fRc7W5X7XvHRtSRgi9QTohbrv9niTwg9qkZof4TTy+nKwLVhxSpXPmyDl6iN/Ve3InwI+xiiQnhg2IV/9Mbgbk5+wbPGCjV8wVTVS4YsguZxgliYdPVXvgNMjRxOnenBaQM1ZXF7VBK1mmp010F9fpJ1SqEmkUVLjiIJH59uDruRj/sCWpX+wCek/g7lQakrWnkFifQup9lXFcUynsXGzSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE0GrrEUmkkYlU+OYsf48YK4i4K+SiZVH74pPXaNxaA=;
 b=VjZmZe0IL6Vl1VYzKwLKBoiZ1TfzDiDxQr6e86fhXHAyATIwlM+CAs+cyZKRSt661ryFat7OBzRIWXMdy7+E7cXtkieI/3bgG8HTiDf+odpXJW23lBGJ3HQcnsQoZBZjI/CfJzUzBTTY4OiueUy/JRaPVtzYVclveSWjglCtlNOITXr3UBuvhx4C4y2wuPr/5klkYTKYdKrga+dpku8L/9jZqJmwK7k1iiDZE7RzBQOYmUlgiDV1hxxcTexPMKnDIvY5ObPRQcOZa0xTDNnzic3rK/jw1EXQ0VCnszFsYLkvEuzRIuX6dD3San6raIXB4UiNW2/rbW6wWgPUs+fgEg==
Received: from AM0PR10CA0050.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::30)
 by PA1PR10MB8672.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:441::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 09:44:51 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::65) by AM0PR10CA0050.outlook.office365.com
 (2603:10a6:20b:150::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Fri,
 9 May 2025 09:44:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:44:51 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 9 May
 2025 11:44:49 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Fri, 9 May 2025 11:44:48 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <JPEWhacker@gmail.com>, Ricardo Simoes
	<ricardo.simoes@pt.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH] udev-extraconf: Allow optionally skipping systemd-fsck
Date: Fri, 9 May 2025 11:44:21 +0200
Message-ID: <20250509094421.20786-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70B:EE_|PA1PR10MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: f72e0f01-a4fd-4db3-47b9-08dd8ede2512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EmBKShHL+bdeP7/xVu+AYR1F5cnbxTrPpcg+TIhSnPjbSDXGrm9EZC62oYSL?=
 =?us-ascii?Q?Z4ekAymd6iK97xUTjw6GT0US5qwH6TCDW/bRU2T8f9QM98xQBeSZe7jENjrh?=
 =?us-ascii?Q?APPErhj8wUMplMEouCp6NWr8D8Cze6L3xfFFQ2Wt/xcp8Of+3XogSnEx3k1z?=
 =?us-ascii?Q?/FCDmWptHgYfSt8XSroWF+6Cz+nNou28mXfNM4tfhprrIM9jg5qfZLpriAbK?=
 =?us-ascii?Q?ozI73mfEjvlG4wvTXFLHh7biW5cRhY8ddekW04jj61Cyqi3iOebaJWzlMwKV?=
 =?us-ascii?Q?hYdUTfGYW1BXuH4rC05a7pf2yQiXlA3RVYuqJPNUCRRLiYEmI7YGrUvAtiQ1?=
 =?us-ascii?Q?vavpV4lJE8TLB9rm6tgjm1A3M4aJqJvY5qQaPdt1gn1mzqSwVJLV4CLQrUuQ?=
 =?us-ascii?Q?BCgKOd2oNyH1wdW7ha4XgsNQbXpI5qQ9sF0XReFLHdBuK6Gp+gftGRRFSb/x?=
 =?us-ascii?Q?T4aOhEcR441gmC9WXpexHv3XXsmEeIf4ND4qqbMg/tAOcdFMe8LXzIGASIlC?=
 =?us-ascii?Q?AIet3YB7z6kDDUKb5V6r/GW/dXUC24e9nYgD2ugN7S6IxsoexzsPhZHn1Bhv?=
 =?us-ascii?Q?F0eEdGkKWoIbhU+DqmDKfhUr8gLh+hE3L1uhfAhRPb6wuqIN/jMhCp+hwUfC?=
 =?us-ascii?Q?b3JZqraahIvJohDKaKzLe/Xn0L+jwZsP1TZe1xIvkbFhxShkCU6QX/Fkre4L?=
 =?us-ascii?Q?KBnsp7iMqbteNX3amjH50e6cJjBtwxGk1o89niGGEnXc+itBKbDp8AcTRple?=
 =?us-ascii?Q?T2sojBZzc0Qn2Lmy3WWmhwtkFUMxESB6BGuQ5OZzKZmE4gOGai/JWTBbbiSj?=
 =?us-ascii?Q?VOHBF4I1A2iLyN5MwWDNPDvaXai6ZshE0ZYx7fJqWRmYKeqvjKKi/OBrDqk6?=
 =?us-ascii?Q?4jpldTiUxnKhS+Imk7665KMnPysyJRyyLMBaO5GbCquDtPOSZF+FJW1oY0pd?=
 =?us-ascii?Q?9nYqRerKlM4pKwmUHmcoHDKjDjdAmoVK5SOIagi07igee+J6BpxvyyRzBfhX?=
 =?us-ascii?Q?2EhrUa2NN9XJRb8r4Kmb52PYJWsxj0I3kfANHlKnlqeT14d87wBP8tFp5vb5?=
 =?us-ascii?Q?NAddwafF/bl1UEAwrLJsXk8UxkK4eqQtF5yr6P3bjXGg0ZQ2ZPKZ/rZAXzW2?=
 =?us-ascii?Q?o+r/fRBm8AT75oWg0MCuAZfVxGjAycjMOOimlC53ZpDOG0rwgKM+sIvoOB/A?=
 =?us-ascii?Q?T8jBjnPmkSDyEVXqE/kYB2iYbeIQnV7GKOgvij5lA7VWCcKHnABnHvtYRPT6?=
 =?us-ascii?Q?AVAytRSdgA5zNePBDbMZn5clUDCJ87b5slOw/04YUW+ml+bd3Y2yQ+BK0OpF?=
 =?us-ascii?Q?LKHYJ6AkL/dOT94aPbGS/rP15Z+SXLH+NHitMXwMIJB+5hSZ5GbNBlQOd7gT?=
 =?us-ascii?Q?2bfXu6cdpKszRwFdhAmfEPK71BzgmgnkxU+5PxrrV5UvfXLsP2gI/NnQ1b5m?=
 =?us-ascii?Q?Swnenrrv++vKSTFljpXFy93+iwih75BQve6J8l3z/Uwx3+AIsLqHLB/OATnh?=
 =?us-ascii?Q?8n/HdltAMy5yKfo=3D?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:44:51.1640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f72e0f01-a4fd-4db3-47b9-08dd8ede2512
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8672
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 09:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216190

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

When the fsck backend does not respect the exit codes predefined by
fsck, systemd-fsck might not work as expected.

This is the case for fsck.fat from dosfstools [1]. When a FAT formatted
and write protected partition is checked with fsck.fat it will terminate
with exit code '6' [2]. What fsck.fat wants to signal is that a write
protected device cannot be checked. However, that code is interpreted by
systemd-fsck as a bit mask:

- 2: System should be rebooted
- 4: Filesystem errors left uncorrected

As a practical example, a write-protected, FAT formatted SD-card will
not be mounted in this case.

This patch introduces the environment variable SKIP_SYSTEMD_MOUNT_FSCK.
When SKIP_SYSTEMD_MOUNT_FSCK exists systemd-mount will be called with
the --fsck=3Dno option. Thus, the partition will be mounted without
running systemd-fsck.

In general, this new feature is useful when the filesystem is known to
be clean and the fsck backend does not respect the exit codes.

Finally, one way to use this new feature would be to add
ENV{SKIP_SYSTEMD_MOUNT_FSCK}=3D"1" to the udev rule calling the mount
script.

[1] https://github.com/dosfstools/dosfstools/issues/89
[2] https://github.com/dosfstools/dosfstools/blob/v4.2/src/io.c#L63

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-=
core/udev/udev-extraconf/mount.sh
index 0cbae48729..d6de05f0b6 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -83,6 +83,10 @@ automount_systemd() {
=20
     MOUNT=3D"$MOUNT -o silent"
=20
+    if [ -n "${SKIP_SYSTEMD_MOUNT_FSCK+isset}" ]; then
+        MOUNT=3D"$MOUNT --fsck=3Dno"
+    fi
+
     # If filesystemtype is vfat, change the ownership group to mount group=
, and
     # grant it with  w/r/x permissions.
     case $ID_FS_TYPE in
--=20
2.34.1


