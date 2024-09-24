Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9113CF9C71
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 06:42:41 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.128])
 by mx.groups.io with SMTP id smtpd.web10.7879.1727160160059133078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 23:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=SU4+n4Tj;
 spf=pass (domain: kpit.com, ip: 52.101.225.128, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K//OAc8LGOlTr8SM6BwsV/zfH8N4aAZXU2j5FG/adnpqtiZ3rbp7eErs/tQbDU6am+CCgQ9bmHjzSbT/wNjBhwUsCHln6a0n2EqdkkkpYvjVsZnt9LbKEJaFHk2RqjGp6ZItN7go1vASkOSSYTLpDOXIVOROYIg2DM4c7DfF1NMLhDLowe7lNl0LQJaR5a736x+6Awq3zCxCBmrvZKMdhC6+u8zIRfg+0LRkonDymKK8yNpBd3g4ksb5Epl3ZVral/NxY6PyGmzfA4FcFPrtLrH3kgyH+B3FCw4bgm4vNibQvai9G/KMK9sRJ8jSN51prd+9XiReqDaq1wlH1Ok0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8v6mL2TggOj9BSByMeaff5SS+TgfHB+EtgGggvr+/EM=;
 b=Ad4/wmZpnZxq/FD3EqISg/RsSXiGRPsXEcyljzb0Vufi19O21vVAgz1V5qt3iT9jwA9YZuOYbaalKPH8Pc8riOHAI6UKTALk7iGW/yYZ/hBgoXYWn0Ap1WW7DxFiAqFQEteeRPmFFCFA8og19zAUV0w996FQCNtzix9FPT0PJK4NAzvf57Bf9HWI6i9+L6pIqrQANJmPLV5WSgfu69X5j4Zy2sFdA8MAgN4tSthqR+aV4l5YMxtnv5JwLd8qyzsKE4cJUYMDa8UdNcgT1zjI+qkqVPhzkF6rPKCxBEBYgtLp+zAB7UCEpFXsNDa45WpKdGVN98cfEhS/eNZjyqoDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 103.243.227.16) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=fail (p=reject sp=none pct=100) action=oreject
 header.from=kpit.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8v6mL2TggOj9BSByMeaff5SS+TgfHB+EtgGggvr+/EM=;
 b=SU4+n4TjhiSDH6qOctP7r30v6wJoxGdITq3kf7hSW6dFFffb7nx7B66QfNPAv3brwl7zM363V8rOpEprfCMmsozWJOeyUuB3WnkF3DTkoCvEeTD3988LJeD7I9jb08qOQtAdLodyPP/vqCG6X2wD3fM17yfJfRn6z4BAvh77PEA=
Received: from PU1PR04CA0003.apcprd04.prod.outlook.com (2603:1096:803:29::15)
 by PN3PR01MB6236.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:83::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.14; Tue, 24 Sep
 2024 06:42:31 +0000
Received: from HK3PEPF0000021B.apcprd03.prod.outlook.com
 (2603:1096:803:29:cafe::28) by PU1PR04CA0003.outlook.office365.com
 (2603:1096:803:29::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27 via Frontend
 Transport; Tue, 24 Sep 2024 06:42:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 103.243.227.16)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=kpit.com;
Received-SPF: Fail (protection.outlook.com: domain of kpit.com does not
 designate 103.243.227.16 as permitted sender)
 receiver=protection.outlook.com; client-ip=103.243.227.16;
 helo=mail.kpit.com;
Received: from mail.kpit.com (103.243.227.16) by
 HK3PEPF0000021B.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 06:42:29 +0000
Received: from L-17494.kpit.com (10.30.140.23) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Sep
 2024 12:12:24 +0530
From: Nikhil R <nikhilr5@kpit.com>
To: <openembedded-core@lists.openembedded.org>, <nikhilr5@kpit.com>
CC: Nikhil R <nikhil.r@kpit.com>
Subject: [OE-core][kirkstone][PATCH] ffmpeg: Ignore CVE-2023-46407
Date: Tue, 24 Sep 2024 12:11:59 +0530
Message-ID: <20240924064159.54094-1-nikhilr5@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.140.23]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021B:EE_|PN3PR01MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 175f7bcc-dddc-4886-6ef0-08dcdc640fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZIfjTfrclhQsIHbUcSTmxqMqn1E14L8UN9aJxam2i0UHvAkUNevtWRgYFmex?=
 =?us-ascii?Q?m431rRJE0zj99Y6W31bBswnd5PaaTmaRDdrsS8L3f6OBxt5UPx6kh0gcSGzE?=
 =?us-ascii?Q?NABxlc23wTLGGrN5WC2yD4hfsXHZEWZ72yTQ7GUljSupxDQZo1yKffz2cxB8?=
 =?us-ascii?Q?x4S1XWRk3/7XFPC+swCcIBgb0YNR0G+XGlbn27/VSNLOgWSmXZkyVfmFz1vX?=
 =?us-ascii?Q?Qr/yg3O03bLEbsT1KuChdsO2sAJodW6TPWKEzuuvYYqCXrd59AsHduMPCUoe?=
 =?us-ascii?Q?aFIy+FyXsHUdlRFZnwjswLQBnMuFqWC+801MQIH8bvVYODzGDYsJySDNiFZ5?=
 =?us-ascii?Q?QWXhKrrYUFvNLjjS/+fR1iXMGxAYSi2SpEjh0i7lXqfsmNW2Rqmx4QRXuSSH?=
 =?us-ascii?Q?pqCDAL9uJvv4oo6q+QDuKyhzEUoX01wukdG++35Z1b/v78cRT7pQmOFCW47u?=
 =?us-ascii?Q?0IjnvTsdD2Y/9jsP1xpOfjd3xWmDWtShRaMvrldbRvA3xZBz/X1Jo35npFn7?=
 =?us-ascii?Q?VDZxlKou5egL6aZjqswOKZdGhYEV/JzCkIcWV2KmpH/c1uaaIFNSPAzJfatM?=
 =?us-ascii?Q?k4tA2Dgfrw3I8tDuvtYoKGCIqa0VHivz0Hjoqc6EtwdoGyRSr0x0HeFibkqs?=
 =?us-ascii?Q?yNCDj0zyHpdt0KziR/A1SSisI/SQGwT+/GiXCA1IpLX2NDQbP8zfDYfulCfr?=
 =?us-ascii?Q?XEBELHmrnu92MlSxylLZDXIRPip6uMvpQN/rJ3trCjxtFBeUpl9yE6NlzpaG?=
 =?us-ascii?Q?Wd5cZSBt5wLcMMy7HxIyIvpY7rMiYXk1+uFl2K9OCiYphLv/uph0QjSsHyOO?=
 =?us-ascii?Q?2X1nGeZK9Z7zXQoQOvaOC84YtHVIz+35CPgi5jO4gwy1d239OJc42e/bMhdq?=
 =?us-ascii?Q?nXZHV4Qo0Kda90hwFCaqHNRV+LVLbRTCsoqWsWO7H/7LZtgHglSrWBQ4lSDC?=
 =?us-ascii?Q?Npia14yrz3KlN0WK+k5fQ3iDC0ilVovp4okjPEoEqF4uJH2qTo4HYR8pcvk7?=
 =?us-ascii?Q?+FGrbGwY+zsUy6XrLjUxEa36DkdJbD+iLUOeK0ItrfYbWd0h7N9/Ds1VYx83?=
 =?us-ascii?Q?7WwuwlIhHpgAD0/HnMAdVOJ9EGbCAZFNQnnUFm6cIADEJhqfyWZxEG5B9686?=
 =?us-ascii?Q?tNrk/8kGd40rPHZziIT2UBMYkC4OdUiXEJbprnKdDGqR3xrv7WLZf3wazJmz?=
 =?us-ascii?Q?zOanEYYDKL5bkVNueHv1uiD7gmsg2NEgju7tXt8yza1BSrtund25dM2PXN1L?=
 =?us-ascii?Q?QDFE3xZhboWmToAS5i6VkRFCKMOjyaP2e70EW4M8HoD1XyIQIp9rBeDQdeXC?=
 =?us-ascii?Q?Kb6PRDYAySjGRFqVaxcq2dSfCYZPa6WgFy6bN6W8dB4wGVWrCC8bpfp0R0XW?=
 =?us-ascii?Q?TP0yeB2oFyvWZrG9RLmHenpg/hvA?=
X-Forefront-Antispam-Report: 
	CIP:103.243.227.16;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 06:42:29.8484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 175f7bcc-dddc-4886-6ef0-08dcdc640fd9
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.227.16];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK3PEPF0000021B.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6236
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 06:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204835

From: Nikhil R <nikhil.r@kpit.com>

Ignore CVE-2023-46407 as Vulnerable code
introduced later than 5.0.1 version

Introduced by:
https://github.com/FFmpeg/FFmpeg/commit/f7ac3512f5b5cb8eb149f37300b43461d8e=
93af3

Debian link: https://security-tracker.debian.org/tracker/CVE-2023-46407

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 1295d5cdf1..c0121edc7d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -39,6 +39,10 @@ SRC_URI[sha256sum] =3D "ef2efae259ce80a240de48ec85ecb062=
cecca26e4352ffb3fda562c21a
 # https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2023-39018
 CVE_CHECK_IGNORE +=3D "CVE-2023-39018"

+# CVE-2023-46407 was introduced in 6.1 version of ffmpeg
+# Vulnerable code introduced later than 5.0.1 Version
+CVE_CHECK_IGNORE +=3D "CVE-2023-46407"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/sho=
w_bug.cgi?id=3D7717
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
 ARM_INSTRUCTION_SET:armv5 =3D "arm"
--
2.25.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

