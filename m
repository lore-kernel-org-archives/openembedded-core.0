Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FD5E9A05C
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 19:01:26 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21496.1771527676897210773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 11:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=htFrv9s/;
 spf=pass (domain: axis.com, ip: 52.101.70.66, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOwrntYFDKvI5HbKLFYcU5jd3f6pwF6TruEKvIKimFRrRWm8GwMag38ev/MNflx2PEUwdkZ8NvG5D5Lgjp17gdBI6iyCV9KtyEFGOBa9tTU6tMaCxY+U0wW5l8LRn55qawTH1Rz/45xdtSQBxjx0kttKO7Rqi0CogRzkJ7cESwpQ41VtYechZ9ull3Z8eGgimiEvVRlA6a5lJo+RHhKFRrr5KYjbE4q1amU+erMmbXzI2tGELeC5YGUHlPICZydoSxtMvvdES8kTTugb9XccYPN2ptrVxad2evOKyp5lOlCKVCZRdciIf6GpaBhJQMr9ME3GJ8864j5Pku0t5F9vlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vY8ArWwCxSc43II0h5hFZJqRhiz7/i1hhIyNFXbuSDY=;
 b=wznGb7iS/aZUq1zrSQ9bo1he1gD6+AR9qA7P8tfxNgZaxC8MBP+yPD8h8lh3Nez/X4H9QxjJd8NRlmqwO8bqpk0DL7VrT5hlNc95KYJ4dnP+ID6niniukPt8JFG2JbvrHXqfXv4vtBUvGT5hv3B14fWlZI6dW+rNdYQvzxrtXIQmuCE8iKbCWqOXF4o5JzepD8WCQzHfbBZ/qY4JkvDzwcrSEXqIYkgqICtc44kDlB0sYe4v9wms4tp0jXmfq9WwqIhfpRyuiKEGIGoUwaa8buA35I7nf/cyqWxXRIS1/eAIh3IBBPzYLhGR6G2cdJbjlW3rh1LtVJ6fH5jUukO0VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vY8ArWwCxSc43II0h5hFZJqRhiz7/i1hhIyNFXbuSDY=;
 b=htFrv9s/nZuTGT8eXWqK9sUehNMvmN5UIusj1jY/OYWF9DdCSasWJSsNeclJOGMQ4rfMXrTSJ32J1BNcNdMF6EJ3tJ2zB8pxVHPvtehV7FthcIVsuNl/STe2MNTBYLM5tmlFIYYq/ebjNMD8DhgmB7QCB9hEqU6C3bn0fM9a+I8=
Received: from DU2PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:10:3b::13)
 by VI0PR02MB10512.eurprd02.prod.outlook.com (2603:10a6:800:20d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 19:01:11 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::2e) by DU2PR04CA0008.outlook.office365.com
 (2603:10a6:10:3b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Thu,
 19 Feb 2026 19:01:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 19:01:10 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Thu, 19 Feb
 2026 20:01:10 +0100
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Thu, 19 Feb
 2026 20:01:10 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 19 Feb 2026 20:01:10 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 72DA4300D
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 20:01:10 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 6A3E2120309; Thu, 19 Feb 2026 20:01:10 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2] sstate.bbclass: Always show a progress bar if an sstate summary is wanted
Date: Thu, 19 Feb 2026 20:01:04 +0100
Message-ID: <20260219190104.1374827-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EB:EE_|VI0PR02MB10512:EE_
X-MS-Office365-Filtering-Correlation-Id: 141ea4a1-5dd7-4a77-26a0-08de6fe93f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bmJS5do/l+VDHDwgf1oJLWzTlh/lo3uMBUx7cyDiFXz9/OmzFNbNTvetUrQf?=
 =?us-ascii?Q?7XRL/eIWSiTbkzKhtyxz4A9x+u1MfAXTAI8Aa6uVZzTn5YhdzeG24CCr843m?=
 =?us-ascii?Q?o5ek2fzK837FgFxXlEatBjbbT/2cpU5iyoDaLuBu9eoKN7Hc7DjFA9Px0XCF?=
 =?us-ascii?Q?OuWiDyp0CAZdXcNO+MX6pP9Hmf1rUMy+EPxbSUrgQxbevmJXlNQtASF0t9Ai?=
 =?us-ascii?Q?1bS2TZQpS0OfkwAtOGLvzbVlN1ATwF4UxWETuVDE2XY5YDhRD15SOuKYRAeV?=
 =?us-ascii?Q?ll4BrEkYPDO7chilYHPzDsulciKi6eXwwyssoCvRVn3waTm7jTMK2uRPN011?=
 =?us-ascii?Q?JLFFX2+VLlkmJppijjBS5fHpfI8l62ss6eg1nSahkUNyB+J4cMQva1GpMv1m?=
 =?us-ascii?Q?xX/23Q1m7MenY9cVv53jUt0/Y1jCAL5LTz9y/3RUojcZBfPJqe/YL2OaP8E/?=
 =?us-ascii?Q?XjNjYUtPA5SRWkaE35Jt2Vkctzg4mVYkd1k9Zvr4Ot/Eem3mGQw0rwjuCss0?=
 =?us-ascii?Q?Aw4Hed9rw/EOPDuiUDoc0kPHFTccOhq/4OzLZON8ObngyklGj9dQIBvlIYHV?=
 =?us-ascii?Q?5tle8N1DFS7MZUqiMTXNsQo2Gm8FUXTssKtohj+cbgLdCyJiS+kMpr17qaT+?=
 =?us-ascii?Q?Rz05gDa/y8zP1PePrqr2CpE1CiG+XZ7wYDtt/9O9SwBvetql/8CansIiVez3?=
 =?us-ascii?Q?Uoej5e7M39BrsLwM05YojwrKseMFzfC1+MWdtU3iJOHw/mTSyMEZF4oXqFr8?=
 =?us-ascii?Q?udvaSRsokp7opsYomHKp8tIfFWasV4RLz1WssuzTDoB6C7FNdU9dyuoNj+ZU?=
 =?us-ascii?Q?OcbFZINXeJMiVioBLURMpvn7SBRLRfRFLZOCOR65XbLyATZAzv68XDYSVLfI?=
 =?us-ascii?Q?jxCp2n5F3Mt0hME+GtnS5L4j2+40Vx6WCHC7zaD1rxvi4rsLWYjfaYt1bX0f?=
 =?us-ascii?Q?1+ecyCyL0M+RDSdwkrAHC465+2JEkDTUbCXaSl6FEWO1VqDEuHH2FV+Rdm27?=
 =?us-ascii?Q?TzLOETp0HujQEpPeW/aydC5UVTXvupVJkXVtp32DLDg/oIqj9fnbyIMNhvoW?=
 =?us-ascii?Q?av1tkhizmDzCmifPKvOOqTXn7nD6TKuMANxU9EzUPiDRJjdNlA9KtCnPoC0q?=
 =?us-ascii?Q?G3L6RutcFZe7LlR8mYCAr4ru15POmvoPnXj5GIf6AtTsXpSU6HVke7Oh7mtK?=
 =?us-ascii?Q?03wd+sjPBh0DCjIXndDWq+YL9gMSSPPbmDuVXVL/7i4yUZhvYpceXCqJ35Ru?=
 =?us-ascii?Q?NfLJqDnvBc5dMp1swxWkhm670yTqPdAFISt1UqYbhJcmtz7/pnHVWZ7hJ6sL?=
 =?us-ascii?Q?V2LARLJkUiCSgJqeZqBVH1J7fv8XpN+s7q6rw9xftoLtG/0TUMB79mh5o5sc?=
 =?us-ascii?Q?FyW3GEOum1KOX+G38bPWItEAXP+1LAdgQiwub6fLf+cZ6ntVVjiT3g/JzwTg?=
 =?us-ascii?Q?OR0SLvb7yt+1B4uOl3fdmqqXF5WuQLD8vHC3qzBEPmwgqdelWE2Oka6yzayI?=
 =?us-ascii?Q?g5PCCDRASySlkLxFLPcEG2GIdxLwcdajVKX7uSf8FR2u3Q98wh5I3w7qL/+k?=
 =?us-ascii?Q?aRGLUbLXbgd26ieU345FbldmuURVpGK8uxys4jANcfHzLSQQD1ZclQgefTY9?=
 =?us-ascii?Q?K4WHkBd0K5lm7Ko9Zn65Q28pUs5PMQzdABFUJf53xEiS?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8+5z0FomQSxJn85nh6L50A2VMt31RGXAMKoSeHJ8OAqddjWHfY/RY++1allMHD/yj+9hObd6R6DaHbsA/eFC58ZxTxF9cS73rRT3ltSTxNG65ZIrsF4XH5NTV14zonWt7YhJt0CIph/WcNwI+Y43dWnF0EkQqXWt4luyszOOSQweCGgRkDFYr5/VwgtIHQrAUDurua2y3Ha1rGZwtqKc3cnFMq1GS7x1HWdTnPL0IoMamGdVwlOdbY2N6+R3jOOxXyfZsffGI8EoPdq4ctK9EfSOlPfg3VHfdXPMjgo5jgRRVLY8aK/JwgfZzWwj0BZ5VpljJ1HpOVElh8MpuFszGQYyhyQlGFAdEuyR7Ff7PeiGZ2fl9W82wAPK2vIBoYItJAxNIoqzvDnEEmvPpKeN6iMWYyfIKpWFJvqapiVNh3xYXrbm+76EbKJ8h4zBf2AK
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:01:10.9822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 141ea4a1-5dd7-4a77-26a0-08de6fe93f20
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10512
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 19:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231438

In case sstate_checkhashes() is expected to show an sstate summary, then
always show the "Checking sstate mirror object availability" progress
bar regardless of how long the task list is. Without this, the sstate
summary could unintentionally overwrite the "Initialising tasks"
progress bar, which may still be active. Forcing the "Checking sstate
mirror object availability" progress bar to show will make sure the
"Initialising tasks" progress bar is finalized before the sstate summary
is shown, and the output of the progress bars and the sstate summary
will be as expected.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Make sure the case when the tasklist is empty is also handled
         correctly.

 meta/classes-global/sstate.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 2fd29d7323..3b2e307134 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1043,15 +1043,16 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,=
 currentcount=3D0, summary=3DTrue,
             sstatefile =3D d.expand(getsstatefile(tid, siginfo, d))
             tasklist.append((tid, sstatefile))
=20
+        progress =3D summary or len(tasklist) >=3D 100
+        if progress:
+            msg =3D "Checking sstate mirror object availability"
+            bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
+
         if tasklist:
             nproc =3D min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist=
))
=20
             ## thread-safe counter
             cnt_tasks_done =3D itertools.count(start =3D 1)
-            progress =3D len(tasklist) >=3D 100
-            if progress:
-                msg =3D "Checking sstate mirror object availability"
-                bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)),=
 d)
=20
             # Have to setup the fetcher environment here rather than in ea=
ch thread as it would race
             fetcherenv =3D bb.fetch2.get_fetcher_environment(d)
@@ -1066,8 +1067,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, c=
urrentcount=3D0, summary=3DTrue,
                 checkstatus_end()
                 bb.event.disable_threadlock()
=20
-            if progress:
-                bb.event.fire(bb.event.ProcessFinished(msg), d)
+        if progress:
+            bb.event.fire(bb.event.ProcessFinished(msg), d)
=20
     inheritlist =3D d.getVar("INHERIT")
     if "toaster" in inheritlist:

