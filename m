Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CC9C87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 18:13:32 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.50])
 by mx.groups.io with SMTP id smtpd.web10.3008.1754590405875271779
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 11:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=NYkjkAKR;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.100.50, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQt2CxOp3vAMTVSPPCQmek5VC0XoefqFiBAjdeTJ8IcBZkKiVl7KluUrP2iN1uJiOKOTBtw6JokhZ+9rHlV8qii+3hDxxIDkKux0ftlXRa62kNsk84KKH+NRmaKBoMoocXeQHOJJuOm4XA7jDwzxcsAAjvH9ee6jXm/ehmMBJOBczM0bKEuaY/4vYU11Mwz/7yPaZkBUA/YbMVBun8RxT/NwuXF93Sw5qnkmg+y8kU9i5ZR7zorOujwCj70BZa0EuR9SCTShJvTh+p54+8Wq37F/NOtEfiTwY45qZtZBI8mniygV8VrjltrVabSfLLWEf14+ScGVL7dP4FLhhP9/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWz2rORebz0H28fenuZI5lRXdcAcFZ7p6oUCv7LaeJQ=;
 b=DVkcPZEq0btXfNvgFxMHK2xX3WuvDxvC+20BpuizkMTfHfMn8xAfr1I3ag0829UA72mm4Y1yCuAfWhHQJAM2HTIq/owEdRvjtrvbKE/qSgPIv3gRcdP9XQb4NpcpEeVSqBhoOFKohl1eETzRsQIhDRTnUCqAqC3cobv1nS7krCB4VtCfnlv0jsh2+CzvlNEDDMt3t38T2QB/SewnDr5VV+p7fzZKaW7/i+9LktNF+kMLFpbyIA2AB+TlgzSmKWjoEliUJyM3Z5gCEGjLGKFXWARYWq3DwL+blWWUayyAI/K3y+x221c2M8RTVoonUGOA1abvJxa/mak2ZYn9asIsRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWz2rORebz0H28fenuZI5lRXdcAcFZ7p6oUCv7LaeJQ=;
 b=NYkjkAKR9V18eBx1nD/tSIdgk97/4bGsiui0e47yp0obqBs7D03vFSoS3TV+5E/PkbpEOW2JPNLMCPWiOcQmFeYkNRY0OK191B5cvASTiAUm5z7CMxD5KD+ST3wfVIev0wJU1FYzFyQFt8Kv+AFpbs0p51UIDDsyLxvsy7T53LTvNzq6C4BofqoHpUv2/p4dipuFeKmJTxTLpvAL2A9gSd/X2QEuikb0dt7tdAmH2D3eHmvP2gGJRYV25VqjdCNNC7V6+ZP5V5P9QKvmjqCUpQh0u2WHM0crMcR4s1RLh8AduEvozJsz9CLdkpPauQG0NBx1Df8F7B+ezIeaUVF7ug==
Received: from DM6PR07CA0085.namprd07.prod.outlook.com (2603:10b6:5:337::18)
 by IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 18:13:22 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:5:337:cafe::24) by DM6PR07CA0085.outlook.office365.com
 (2603:10b6:5:337::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.16 via Frontend Transport; Thu,
 7 Aug 2025 18:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Thu, 7 Aug 2025 18:13:21 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Thu, 7 Aug 2025 12:13:14 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 1/1] sstate: fixup calls to bb.event.check_for_interrupts to remove unused argument
Date: Thu, 7 Aug 2025 14:12:57 -0400
Message-ID: <20250807181256.2693568-3-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250807181256.2693568-1-chris.laplante@agilent.com>
References: <20250807181256.2693568-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|IA0PR12MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: 381290e7-4ed8-4b3b-24be-08ddd5de17f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xETGffGuQwyDFtLWp/jHY+Wnqu15xTaJyxZDUwGsz6msLxdeTKIUMk6AOkze?=
 =?us-ascii?Q?xfUkfa4e5U2hr4//vRkZOVXd1FtYS7d6vjpYqZqLLw5m7aq7t/J+7ru/1nYV?=
 =?us-ascii?Q?yaJ5+OUNZlcwqAaEqze+xQGZ78VjQ5JjpnqKQDPUqb1Bq0/kRCb/T8X2YGvi?=
 =?us-ascii?Q?Eqq7g4PYR8Zds9ho/VRyx8yCm23g8/UjvpivDspqin+0ZPpWx7kj750m7O1j?=
 =?us-ascii?Q?UfUR4Z5w4MgnIGaC6Gfn1I8U/zWc2my/UlHIrKs8fqnPMN7gGMJqzE4m5sYX?=
 =?us-ascii?Q?9gwNPGOOEAbpNqvcIpzsFVXcHYw7U4h8vaUspyWSjDrl2fnGCUr/gtdJi4F9?=
 =?us-ascii?Q?ffPTZxwJDjjSnQ3RjnTkHGY4cbhEJe3SD9d7cmyGQOCynnhtpu+yJmqjYu4A?=
 =?us-ascii?Q?zfn2pgqgbY0GPv5FrHKck73V6t888A2Hf1Eoin87eNtxQJ2j1ii8ftUFj/3O?=
 =?us-ascii?Q?c96qK7jHlavktaiFcDiUaLnNxv8xYoby5gUiHYvU25z5odxl2P4nRMjSIys3?=
 =?us-ascii?Q?HCQjcDHjYwhSDCC7Py23VKZxO64/8D+Ypbh6If438rnZOf3RzVZxw5Lpeo2Q?=
 =?us-ascii?Q?mVK4byj4Gd6DmNWajuist06u9HFjNlrfQJV470ApTdnwD+gvMznrbhGO4FYw?=
 =?us-ascii?Q?aRZXtcM8kRv9np/8iA3cPT4n8tujO4vUMRpuUAM/raFfigpf6JDo2WmCg8zH?=
 =?us-ascii?Q?xBKEKB2F6eIO5j4+kkfWIODX+Y8xlEqPDlciHMsqkU/gQzBTss0Mgrdp3Cas?=
 =?us-ascii?Q?QsP9DTZQ7F/B7yEh5mPcZIDIj9CO32SvYW3PfdwNLtQIKOBmoXikTFO6Hb+q?=
 =?us-ascii?Q?tevtyk0KCCkvKZf2/sbBw8ZJkq2H2LB3+c5LpmQkrfi1Lj60G6V+H8ES2/v1?=
 =?us-ascii?Q?bbKQt9IVpOH30AKkD9mXO4+RFOfytpVSX0vbbV2Oe3h/T0kVF/yB/mPCK6Bw?=
 =?us-ascii?Q?Y0qjNHFoiZGuxJlC77IbLxZTSfKgQ3+qk9dbPMNERd0l65LKZD3yd8z0LkI7?=
 =?us-ascii?Q?qLN0h7ik9TKkWzeBj4stE7Oja3exLiOwwe9g4L1Beu5pW+JDlj2SH6/A8ugZ?=
 =?us-ascii?Q?rqGsDzxKcHMt3tFxmKcx+3hMCZKW8F7LKnpnYXtiOzmToNvYjvIZt72133Od?=
 =?us-ascii?Q?O/KaE1xnDoGVo52tH5Cat/ISl8lY+Rcn20sboQ5wmTfQBFzSYnNeAevFEjMz?=
 =?us-ascii?Q?aDoFZi2jxLRC7AjUA0247VlpSskqtrMyQpf0N6VVtiEroz0O32rn64V6oWtr?=
 =?us-ascii?Q?S1Viu9xsnIgHwpCkj5oi11ozN4FvBwIZJTG05zDErR0M0p4MledJupYqfxN6?=
 =?us-ascii?Q?kSwy/6BU6Wp59ID2ss/jF3NMDKxZm183pfVbX+0k44TLPPExrtsj/v/6EQ8Q?=
 =?us-ascii?Q?mH7YejhMuWX2527yVab4/LrgaSRD9sa0mDVEcSnBL8F+FZvorijlJ395f9iw?=
 =?us-ascii?Q?Gb66Q8WrtugM7pNmsazHmljx19t443LWm82Yzf6Pb57/q4muShV7/Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 18:13:21.6995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 381290e7-4ed8-4b3b-24be-08ddd5de17f8
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7699
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 18:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221575

From: Chris Laplante <chris.laplante@agilent.com>

This commit should come along with this associated commit in bitbake: https=
://patchwork.yoctoproject.org/project/bitbake/patch/20250806145308.2052128-=
2-chris.laplante@agilent.com/

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes-global/sstate.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 53bc2e3940c..e3d6373b3f4 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1038,7 +1038,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, c=
urrentcount=3D0, summary=3DTrue,
=20
             if progress:
                 bb.event.fire(bb.event.ProcessProgress(msg, next(cnt_tasks=
_done)), d)
-            bb.event.check_for_interrupts(d)
+            bb.event.check_for_interrupts()
=20
         tasklist =3D []
         for tid in missed:
@@ -1298,7 +1298,7 @@ python sstate_eventhandler_reachablestamps() {
                 lines.remove(r)
                 removed =3D removed + 1
                 bb.event.fire(bb.event.ProcessProgress(msg, removed), d)
-                bb.event.check_for_interrupts(d)
+                bb.event.check_for_interrupts()
=20
             bb.event.fire(bb.event.ProcessFinished(msg), d)
=20
@@ -1368,7 +1368,7 @@ python sstate_eventhandler_stalesstate() {
                     bb.utils.remove(stamp)
                 removed =3D removed + 1
                 bb.event.fire(bb.event.ProcessProgress(msg, removed), d)
-                bb.event.check_for_interrupts(d)
+                bb.event.check_for_interrupts()
=20
             bb.event.fire(bb.event.ProcessFinished(msg), d)
 }
--=20
2.43.0


