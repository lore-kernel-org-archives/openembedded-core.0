Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67484CA1016
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 16:05:23 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.54])
 by mx.groups.io with SMTP id smtpd.web10.1608.1757347514758550432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 09:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=pn9QMZQe;
 spf=pass (domain: axis.com, ip: 52.101.84.54, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hN2xGvgBzcACq6mL+Srk8oHxBPxsnjPPZ1XlXM5g0CPewsVzuvCdHkuswrfUrlQXGzhDKgK6gOzDOTjPXhJKj+B/ewgxxUWBVXNsgQnw5LwvxahHX7r+SmWPU/UeOJDxUYFn9jnnJhlzCZ2oy90epyLqKyLdnrKF8x7SsSIjMsWtcd0tlGeKH1tpUEDoKhsr5z0IdNzr4zppQI27f/uP/JDO3fzGPtIZRJM8GhQvqcy1n3PFUxUzM+SurKucKo/UmmeyKs4+YNsKQXrslu8JCnzZGfbKATJtNw5Aev2tM7BrT75yr77vfTf71GxkJTZ9cqk08Vbzl4zYgqph/7y2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJYEXM3mjiXMAjSfNlxB8BvMxFdIAwJpx1ANyiqawiE=;
 b=UU4B4UIOG9NHEjZUbBcFQpp9D55xrivjP4mDAZYNxK2YFHJH6ftvAYfFx55v5GIxmJBU2c3bPXMlqipflbDRuH6eDkK9z5SFPuDy8wmaBLTZQnogq6WGrYziW+zj7Y2IshITha39Rc0Ll01zgVWaLycpR9M0RNrgFhwhpmR1cyk+l3l7mY798tuF03CGW6Pu1Lh++efezYUT4YprkRIiaU8Cdq62rx2uqkVSuGI9NKZCNq9meIJZ6DR1K5i7OL+PzjZqUHt8A8oev2ojgqxPsx2co4ZGm/E/4TNE+GQV9j0jFG9JT9a41awCR/Ir+ORAi1ri6oux21B4bfmbOu5gAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJYEXM3mjiXMAjSfNlxB8BvMxFdIAwJpx1ANyiqawiE=;
 b=pn9QMZQe8aYzGVYAklagafuhPozlU8pr4BcQYVYc2wyqwjodi3FsbQno9fCEYYHJpvJhjlJTAEeHGg9VxETrPseZiIcHBiBj4wS+94FfnAo7eKsIvqJG+VcPVGV1Vdq4LT0xFG9ArWf3sNgQTu5zCwRDtiSDS1M1ZEE4Q9ShXyk=
Received: from DUZPR01CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::11) by VI0PR02MB11493.eurprd02.prod.outlook.com
 (2603:10a6:800:2c8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 8 Sep
 2025 16:05:09 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::ce) by DUZPR01CA0073.outlook.office365.com
 (2603:10a6:10:3c2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 16:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 16:05:07 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Mon, 8 Sep
 2025 18:05:07 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 8 Sep 2025 18:05:07 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 3998F1AC7
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Sep 2025 18:05:07 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id E25B4121A30; Mon,  8 Sep 2025 18:05:06 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv7 2/2] systemd.bbclass: Make systemd_postinst run as intended
Date: Mon, 8 Sep 2025 18:05:04 +0200
Message-ID: <20250908160505.3281600-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908160505.3281600-1-pkj@axis.com>
References: <20250908160505.3281600-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|VI0PR02MB11493:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be5cdc5-2b6a-4555-8978-08ddeef17b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2fexHfQw+irfJvEEjtX+QC2U729OhGuJiCwQf2llMOosk+mSuo/7+MaVirxt?=
 =?us-ascii?Q?uwFQnbLGFaGdcw49BtEZZEKH5vNU3nFzgmBoZaQ0rcT6nmtss1YLpAiCgXIE?=
 =?us-ascii?Q?1oI97vh8O4hJ5Nf+RJ6nQlX804oEFb9QOoJ4Y5ar4AQIow3GYQln7hC6GFCU?=
 =?us-ascii?Q?vsRXq4iO2IPAkKKj9lJZJwowUDLhphHdeY3s4JS7DWh2dT22CrVnILiODA4D?=
 =?us-ascii?Q?VvlgXcb1hStsQM00pzcmB2aDsBZ5X3Ed14+ugNO9FruMbmnnSGwIfgNfKclm?=
 =?us-ascii?Q?kKz6i0jbD8uEunYbgKwCmq50iz2m2+T/m+AoHMxpoTtyTrfCmh5j/W2ixAcM?=
 =?us-ascii?Q?qTFz/ED/JT6QSZqciwzi3Gk0x4BY2gaiNd3TjELbKBmAubOKqKyzOax8ztY7?=
 =?us-ascii?Q?UrwFoOh6NAUjXSAn5kTP7MXaoVitHAFA73bwVW1sNvp5kmtq0W5FrxjzeaGt?=
 =?us-ascii?Q?QHSWsRLnagNCdV+viicFO/HI5gysZG0WnGZSWgcxfkqeoVP4aUM2eDzkpULL?=
 =?us-ascii?Q?/Ix5lhyMrm/s+lt0ov2fbTWGDw9G1VR+WXUss8TDhYFyTzsP64Wcq1Wul73u?=
 =?us-ascii?Q?j3QSvnI+CLo8GwUlthLCkRXI9NIl8+fUam8hJzc1k1pKxlQHKinISav+ZKr0?=
 =?us-ascii?Q?BUTjvJV2JZiLm8q3exkEsn0N5wiBIAi9w6XaifhzaJI+RrAqSu4x0aYweJve?=
 =?us-ascii?Q?MfJNk97YduK86//DX3ALcULXa8IfcJjXomPrvRjzIDnrjXXpUHzE4DLDe8TO?=
 =?us-ascii?Q?RaJlPfxGAKtsrEKAy8mBpJ/xWafXZ9PKc+Efetzzq7RuI10zZXB9QdRu/Slg?=
 =?us-ascii?Q?wfoCe5ExHs3QJrIXrsryGN1lKesWwBGLOiWuJT3WHg2cVjfKTCFHyK9xtR9y?=
 =?us-ascii?Q?fbP7RXhZ7uwgqOp48UPrN7rH20/YQGASZXbC3EGJsrZ4FLDLsHYa7OmlFgwz?=
 =?us-ascii?Q?FVp8S2SZWFA2feKRU62RSHWFXwnC9UKR/iDgTix846sAJFIwPOFNefnKKVzH?=
 =?us-ascii?Q?n114azUgQ5yIin7w7CQiVENjvOyeE++IpypV7ycegghX3K0jFubdsFQbljZi?=
 =?us-ascii?Q?MqSt4mYlHu1aup1okfj0gMcM1wXV0ClU2+E/VqgNEVtglyLRn7FzZx0yYKRw?=
 =?us-ascii?Q?D5d5B7IDLevTxLgP86QN94R00n4U+2dRcMEVI6Frm4CaYpVv5lGAQV6KXyui?=
 =?us-ascii?Q?ZSLnKIrOl4dXFEwptBNclD1xP2qrohcOcs/RJK0YoGrr1xJH5+fTxcXNU9N6?=
 =?us-ascii?Q?P1WuDW0LBJtFQZkcEDoV24TXGVO9HlcyQMpelqpFeyzAyC45KYTl3p7bYC3F?=
 =?us-ascii?Q?66h1qsLDu3SkMJP/VqIIwlmdx2miCkTw9xOInyy6Dh4t8ygeWIlnd+wdyiPE?=
 =?us-ascii?Q?+PBBOEPPfHH+mB1D+yB92GriUjYyahj8Y4vXz6ELafvzwCAGWBi4nHY12XiE?=
 =?us-ascii?Q?NvhuKa8fg27n2qsy6S1QM/RryxOU6iSChYB+wYvpchi+zFFwuba8w8eSaBPS?=
 =?us-ascii?Q?NNJrfoftXKCYUECoQcBXTPqZ/dEPyzgN4oce?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 16:05:07.6390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be5cdc5-2b6a-4555-8978-08ddeef17b23
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 16:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223075

After the switch from using a systemctl written in Python to using the
official version of systemctl from the systemd project, the
systemd_postinst function has effectively not been executed during the
rootfs creation. The reason is that systemctl provided by
systemctl-native fails if run without arguments (as systemd_postinst
does):

  Failed to connect to system scope bus via local transport: Operation
  not permitted (consider using --machine=3D<user>@.host --user to connect
  to bus of other user)

This is not seen in the logs since stderr is sent to /dev/null, and the
only way to tell that there is a problem is because systemd services
that are expected to be enabled aren't running.

The reason this has gone unnoticed is because systemd_handle_machine_id
in rootfs-postcommands.bbclass will call systemctl preset-all, which in
most cases will create the missing links to enable the systemd services.

This change effectively reverts commit
a52e66762c0c51918b1ba3d4622759637b6e920a (systemd.bbclass: update
command to check systemctl available) and instead only runs systemctl
without arguments (to determine that it can communicate with systemd)
when executed on target.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Add --sysv-install=3D to $OPTS to instruct systemctl where to
         look for systemd-sysv-install.
PATCHv3: No changes.
PATCHv4: No changes.
PATCHv5: No changes.
PATCHv6: Removed the --sysv-install=3D parameter again.
PATCHv7: No changes.

 meta/classes-recipe/systemd.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 0e9f7cfa33..4e687135f1 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -29,7 +29,7 @@ python __anonymous() {
 }
=20
 systemd_postinst() {
-if systemctl >/dev/null 2>/dev/null; then
+if type systemctl >/dev/null 2>/dev/null; then
 	OPTS=3D""
=20
 	if [ -n "$D" ]; then
@@ -46,7 +46,7 @@ if systemctl >/dev/null 2>/dev/null; then
 		done
 	fi
=20
-	if [ -z "$D" ]; then
+	if [ -z "$D" ] && systemctl >/dev/null 2>/dev/null; then
 		# Reload only system service manager
 		# --global for daemon-reload is not supported: https://github.com/system=
d/systemd/issues/19284
 		systemctl daemon-reload
@@ -66,8 +66,8 @@ fi
 }
=20
 systemd_prerm() {
-if systemctl >/dev/null 2>/dev/null; then
-	if [ -z "$D" ]; then
+if type systemctl >/dev/null 2>/dev/null; then
+	if [ -z "$D" ] && systemctl >/dev/null 2>/dev/null; then
 		if [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False,=
 d)}" ]; then
 			systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}",=
 False, d)}
 			systemctl disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED=
}", False, d)}

