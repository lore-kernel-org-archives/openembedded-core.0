Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB62CFC276
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 13:25:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11295.1763731531200828128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 05:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=lNNlUy+P;
 spf=pass (domain: axis.com, ip: 52.101.84.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8+aiN/so6XBN7M39wRJnFjfI+LfhQUugiEV9ED8sYrVs9fP6LCx5uVzQWv2l4FkCFt5XDDfrP5yBG82zmrLg5eoLW6Hbx+XQ9+ULcthZH5XshatlmzSeRPpDIcLKB0UslsCoRyIVTITVVqpv9LQ1fZcRnlpU2tWrVjfnj2oJC/+FgUszYvuQZWEu4uvjhQ6gHuhqnrkqiZALbCN/G1IRWXPsCX98VbLEMP0rrr0A2hRuhWElhAS3eR4soZy/vhGNrI1BOHZQAWeyJOvFitzY0CE9YHwKqxsL9gLfjj/9HS2ToXwxIWxUWCCRZhJc+Zw9zQ7/4Vd802mwJb80ZrfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkIOni0WJbsmimxvyWfbUF3tk8vOMlVGPgUk0F+Q6QQ=;
 b=mYRlS6JG52Jf8t1dkz35JI7Kv0YctL0B/GHdAoIvxSa3esUQuOP1HzwsJmPLTR6YnWTOh3o1+TUouIsiY+Ri3UljXGDazI4bIHQIvT6pp8Fe6/ffNpG+dBHV0xXVDdlAt82kaFDya8kHyNMlXlVZP+MgooqVqQd+jcPn1QGGes1d/2ZeE0eLhz2oAFPRFkjP/ZxlXlqHDfuK66tBv5gUq9UvxnRdAEqTbPtfhm1Bd0pRd5KJ0tGGdMNVwzmUkiqb3lJBniz60SGEwVTTS9LUlAODbHujZKQcZ6yyYfEukFg+uZ5FBIggV239VtatGT7TfcetRrA/OohDHmm7O5/A4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkIOni0WJbsmimxvyWfbUF3tk8vOMlVGPgUk0F+Q6QQ=;
 b=lNNlUy+PIeuUD5IiFzqn0X57DUMSOsDnSZsNo86ecNl9R0EjTZf+KdBJjejF/UdyO4N+Wi9GrvLFZM9meOJLzRWVZ6btMtPnJII7+bU5OnslPAe1fdM6r5erUQrLEql5fvZ58m1Ff/DyWfhE7uwW8DrcrA/QRjpPD37zTlrfIa8=
Received: from AM0PR02CA0174.eurprd02.prod.outlook.com (2603:10a6:20b:28e::11)
 by AS8PR02MB7366.eurprd02.prod.outlook.com (2603:10a6:20b:3f5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 13:25:27 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::6d) by AM0PR02CA0174.outlook.office365.com
 (2603:10a6:20b:28e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 13:25:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 13:25:26 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 21 Nov
 2025 14:25:26 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 21 Nov 2025 14:25:26 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 9FD665E4D
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 14:25:26 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 0377E1206C5; Fri, 21 Nov 2025 14:27:15 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 3/3] configfragments.py: Improve reporting of errors
Date: Fri, 21 Nov 2025 14:27:12 +0100
Message-ID: <20251121132712.3970921-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121132712.3970921-1-pkj@axis.com>
References: <20251121132712.3970921-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004D:EE_|AS8PR02MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: b46f1d15-4454-4fc0-5136-08de29016f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X7lhTHfPV32jjObTm7fAdrJRe2ukAKrzc3PkgkYWG+CCRa8K6ccLYi8xdkvE?=
 =?us-ascii?Q?KwjKOkJj8LoQtEZXwaWa1LiaRVgtRqgCD7DBLiklhA5Rn3Nl9k+KHx0oO6OT?=
 =?us-ascii?Q?broTv+4V1io+QoIPijretzgcJ8rsoGFD07bkyJEPfo5niJNwE517YLx8Yzah?=
 =?us-ascii?Q?XYUouVKPcxMBeUBEmIUIxkNuLB1jqq2okEI2Eo2o/zzEnq1KdT8tQPh3ceVm?=
 =?us-ascii?Q?BdfrJN/2Jpd6yWPbQePBn3CYG1Wr5CQAxPyjMOe9jcsBWOSHnlKx5sHs8llq?=
 =?us-ascii?Q?Q8wi8aGHmFOe2rRrY+EF4D6QLNt6ozo4ARcLZvKyGVl/pBJCui0EUKjuLbcS?=
 =?us-ascii?Q?YsnL6YAft6xbC1KwcSpWRo2nH47VDwSt49AUUjo3TkTCXHJPSoM5aTfSccuP?=
 =?us-ascii?Q?XmuQ4Fpch4M8cBIAaIOEsu4IRH1L8JGFKVIufCzadv3nSHr2OOgOYHbSRMMX?=
 =?us-ascii?Q?qOOjYw7qZugeTXiV8Zq8kz0ByG+36krai+LZAVQ72tWEM9GHBx8lWnrq4jVK?=
 =?us-ascii?Q?IAVk+d1MvmpS85a9/lKe+w5k3pspX2gvGUhk2RWR64VZZT8OQuP3Bm5Vi1Ez?=
 =?us-ascii?Q?N+DVF0okr0Za8+NzeCWOvUW1ZObDAPGuvgTbiQ/BKPn6/823h7W+RZysGqyz?=
 =?us-ascii?Q?MASphpXn102HC//8s6qM3zr76oEFUdZoZVshgcYKT1ZsXMKwxn/z2DE97eTd?=
 =?us-ascii?Q?fU+IT672DxcDzgB7TWsExTbHHMGQwi25inuLq0GGfwlioj6Gh60Psy3Ct2kt?=
 =?us-ascii?Q?5cG4j9d9M2G8aNTVeeWSF2SgTuZDVw41V8AULnyWX46NiUiUo/ZB/5MVzvf2?=
 =?us-ascii?Q?oX90H34Ok+N4Fkz3ZSfCSRdh8yVljxfMq83VHTkQo7AWP2aGSiX7rejv40qm?=
 =?us-ascii?Q?1I9ZSO+aSxsDzoTKADsQVrW+9a42bpe6LJCWmVq4dsFB7gmXQ9nCHkAn0WZJ?=
 =?us-ascii?Q?iWED0OBwksO/aNUZf3x2333BEgcj4LPHqrAw/L/EnO7sYK2pMQVfP5YDmyaq?=
 =?us-ascii?Q?ue7UeI/a+V6OWhx01cR7OGJNAPkjn9xYyizZmN6oeIHW2v40PIIrRhyDprz7?=
 =?us-ascii?Q?FE7qmfsh/u2IwrfJ2K/fnzWKfhGP50KTQD/EqmKFVRdZ9tXMPGMwMfwVPz0Y?=
 =?us-ascii?Q?OhQmTABk2jY685bMSpL0KCJuizz5glns01ksHrsQBKktt5+aIma+bMhNKpda?=
 =?us-ascii?Q?DTh9U10ipsRa3lPqUyFGVwLJgtxAXcGFvJFxYQ1HLVptbhzA89DgjRzEus5y?=
 =?us-ascii?Q?erLOWdyf+4WacCxULGroxOrOJxsXjugP26DNfUEAt4EKh6jeSva9eQkwITNt?=
 =?us-ascii?Q?6VzBs+LC6l07rdPLYlByphKcqBGM8ObTyHQClEdr21G7bOa72q8zVw8+zO8Q?=
 =?us-ascii?Q?OulvlcWu1GBvXPMiJZmxTYGxYPr3DDnnBPgXkuYTHlYbFB070vQvHX/GU/Ip?=
 =?us-ascii?Q?auHWiIdQPr3NUS2c8+Dr/hgGOs2l2PPg2DAzobXzYllhCiLedROPwFPbDybH?=
 =?us-ascii?Q?z6KL7+Ve6vDRNXH9/f7YSvGySKm/3qRXJfuyNkMAcHyvT/XLb7HIj8AP3+g9?=
 =?us-ascii?Q?LvK351XEQ9JxGSEuXCE=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:25:26.9732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b46f1d15-4454-4fc0-5136-08de29016f2d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7366
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 13:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226680

Use bb.fatal() to report errors. This makes for a nicer experience for
the user.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Only change errors to use bb.fatal(). Leave warnings as they
         were.

 meta/lib/bbconfigbuild/configfragments.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigb=
uild/configfragments.py
index 15142ec9f9..e53b9c8934 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -28,10 +28,10 @@ class ConfigFragmentsPlugin(LayerPlugin):
         summary =3D d.getVar('BB_CONF_FRAGMENT_SUMMARY')
         description =3D d.getVar('BB_CONF_FRAGMENT_DESCRIPTION')
         if not summary:
-            raise Exception('Please add a one-line summary as BB_CONF_FRAG=
MENT_SUMMARY =3D \"...\" variable at the beginning of {}'.format(path))
+            bb.fatal('Please add a one-line summary as BB_CONF_FRAGMENT_SU=
MMARY =3D "..." variable at the beginning of {}'.format(path))
=20
         if not description:
-            raise Exception('Please add a description as BB_CONF_FRAGMENT_=
DESCRIPTION =3D \"...\" variable at the beginning of {}'.format(path))
+            bb.fatal('Please add a description as BB_CONF_FRAGMENT_DESCRIP=
TION =3D "..." variable at the beginning of {}'.format(path))
=20
         return summary, description
=20
@@ -141,7 +141,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
         fragments =3D self.discover_fragments()
         for f in args.fragmentname:
             if not self.get_fragment(f, fragments) and not self.builtin_fr=
agment_exists(f):
-                raise Exception("Fragment {} does not exist; use 'list-fra=
gments' to see the full list.".format(f))
+                bb.fatal("Fragment {} does not exist; use 'list-fragments'=
 to see the full list.".format(f))
=20
         self.create_conf(args.confpath)
         modified =3D bb.utils.edit_metadata_file(args.confpath, ["OE_FRAGM=
ENTS"], enable_helper)

