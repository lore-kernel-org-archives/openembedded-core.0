Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791E1CD5BD2
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 12:44:45 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36130.1779799475107238767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 05:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=P5Fbe6sO;
 spf=pass (domain: axis.com, ip: 52.101.66.68, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYJHKVPQRoLYsQscM9RqZlSe+gF0wphVrk/JzaqUDHWsHDsIiILcAWjKkOTNOlJmQgK/c9p2qFxhXflVvnFvLZj0smF9sudd8CEiHrMdY7ayp7Mi7n5mlvnK3Qv56z2drpS19CHEkJz/xTjitFavFtmkxN8QMWLBRSXoRRv9POMGgvXb/85ZMnUOdxocMZvuI8RjPy+fMcRNhDh7N15/00QDkVfIXNgU9HENe5ZafhRDCYmgUbz68akJv0+2pg19iMUXigdLNj6i0LE2kuoJ/6Nt5AfP4vOcsx7mfPMk0WlxQUTYpIeSrmz/ZIh4Oa++8QYsuqNAHyDEGfB7Afztdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2grcnmMGcDftOiCcFBPiXpqPogQ23wJLXIa64GW1tc=;
 b=Tvtmybesc9w3FgseWomc7Iiqpi/InmX4DzoPqqspUS4oDxxrwOw0VUt6Omx0ff+QEDyc+05DR2apta1U+DSg04Q/ywlC+unO22nvqdnShF+ToHFzrrI11o6H5R/3FlhCKcgLJpceKPHp4LbJhZktse5DMigBXwGEs9QBpKM5PD9nkJz03jSDxQrsP/jJ3LAcSx8SuEJx5EGtKUMpYh8lMgZTkTIBRzfmRI0mHnDvPdReP0g5eWG23z6UJ4b5kCrUTs8rAc370daOvJnO6oPE87VWCOIS3oV4n5hSKRSQxaBlnUIYReyFmyfRuz6GfS79f7NB0+wRn+JcEep0dCanAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2grcnmMGcDftOiCcFBPiXpqPogQ23wJLXIa64GW1tc=;
 b=P5Fbe6sOPmjlEiVHXn80Q6SJJi+aQCDdU3FGO+MvPeGAgUj1Vfd1r43i8jq0fwiG7W60f4m3giM7z3ZeoYON4WLuwT1AFEmEuTcU/TjchkXww9diWIOAt/lcfZ+izvDXjcitMO3+eSAm2M3Q+jwq0mfiddH7kHdbsvDaxjqeYUM=
Received: from DUZPR01CA0120.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::18) by AM9PR02MB6673.eurprd02.prod.outlook.com
 (2603:10a6:20b:2d0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 12:44:31 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::a6) by DUZPR01CA0120.outlook.office365.com
 (2603:10a6:10:4bc::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Tue, 26
 May 2026 12:44:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 12:44:30 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 26 May
 2026 14:44:30 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 26 May
 2026 14:44:30 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 26 May 2026 14:44:30 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 9BB9637C2
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 14:44:30 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 98987122A2B; Tue, 26 May 2026 14:44:30 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 5/6] useradd.bbclass: Show a deprecation warning if GROUPMEMS_PARAM is used
Date: Tue, 26 May 2026 14:44:19 +0200
Message-ID: <20260526124420.2564500-5-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526124420.2564500-1-pkj@axis.com>
References: <20260526124420.2564500-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|AM9PR02MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: f364ce71-e13e-4ed1-1b3e-08debb24881c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	wVLMWyKVYCA0DFWrrA6k//Y1S6B4SP6NJ/ND3vBeaQcwwLXGg0u7YbvD1xIIz7EXQIA5RAjTID6+ymoHOsK/5w+A8ftXE1UA1xzSsOXT39A+vbPlUdAV9L65eYmqwGqoj+YoJaX8knJELnEijeYq/rl+9Pbiy7/eztxcAMY1iAUMv5nrQNmOC5Q0TNQ8GBRguFLLEFdsH30J27OYeS8BXo7Q77vw5VpycnSMJ+MMyOBk6Sz63DSYI3yinMXTjleiT3F/YMv03b4fJS442fekK/8vYEsjnnx9Lb3jmziDGCim6bDe3nUiTiKFnqDQbFcO2cp3/7kj/I7fdKqx4KVqG5nOfqAPt8ZYMQdRJ2cvzPHIHMeldCGw6SetaWkQ+y73sdkXfm4h4CU5GfXgzhW478fFwVeHOJs0uWSwHI1BgOgMWthpSCWpijmIsGi8GxH8YlQ8FEYTV8WAwVj4RnKZ6zc5ta/WAxdoI91dWsEs5CVnWMuvaXUr1mIpbYdp0eLf803L8wfR6BaUO6JrdXh2M2JecKyAdOswTjBZbLPrtyDPitDq0b6q+vWCk9W8nqu+5m/IRo47+HjFx4kj3ZCbUIUvXRQY42AwED2TrX8OOCBzvgV+gEw9em2EQPEmpU5GdMFVDpEARluqJ41VAZpFTbCCrjt8PS2fvLaUSubN4VbD5tFGQeHyLjg+RZqfU6qJvRlO/mrBtDbPlqb+7rdCsDUKztr8gb+j1L3NR3gXubk=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pKKh5D7Sj2FNkE6IclmbjM6hQYTLbqoZsStRDfbtziWGLMXGTwTG2xKsNA9dH7Gj8Nk1hQYj44r6GNQk+TvJTEDA0ZQqifW1tLfndnarFaXeaYQ9wK4Jnxy3BonHRx8/MOzijXC3R2dmAWitCHIwZDWdkBY5MGX/OvNqOi3IZmE045JY4oo+wHCB0rHHpMwIO0c5lID7paYybNzWb4d37e/0s5iZiCO33J77gBfNpgEnPQHYo+Vp04CxLT8WO4DRM/Mk1rzhXR/47f+nzZd6iJyNWH6yPC+ejT6a9+uSSvJXifmSDJgFh8L3RgcOaquZISCSIJ3Yc+GRQrv5CbU8jDTeMXlUb1KwXm3D6suMYzk0nTlWQFN2wXzZzLInlr21C+3XUjkcRqvWph+92Fj/vBOzai2TPmKTYe2QvNdGUX0RulP8X46kaXPupvSv7uDE
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:44:30.9459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f364ce71-e13e-4ed1-1b3e-08debb24881c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6673
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237601

Tell the user that they should switch to using USERMOD_PARAM instead of
GROUPMEMS_PARAM.

[YOCTO#16277]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Tweaked the warning message a little.

 meta/classes/useradd.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 55393d38f7..d6e1df2bd6 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -308,6 +308,15 @@ fakeroot python populate_packages:prepend() {
             update_useradd_package(pkg)
 }
=20
+do_recipe_qa[postfuncs] +=3D "recipe_qa_deprecate_groupmems_param"
+python recipe_qa_deprecate_groupmems_param() {
+    useradd_packages =3D d.getVar('USERADD_PACKAGES') or ""
+    for pkg in useradd_packages.split():
+        if d.getVar(f"GROUPMEMS_PARAM:{pkg}"):
+            bb.warn("The GROUPMEMS_PARAM variable is deprecated. Please us=
e USERMOD_PARAM instead.")
+            return
+}
+
 # Use the following to extend the useradd with custom functions
 USERADDEXTENSION ?=3D ""
=20

