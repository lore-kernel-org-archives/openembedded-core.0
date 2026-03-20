Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB781099B4B
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 22:39:53 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1456.1774046383279407838
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 15:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=BubRCUn4;
 spf=pass (domain: axis.com, ip: 40.107.159.36, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pbb06wgWgVo6oQeBpOIO5j5qzUVBn7N0jxAKCBoBKWLoJnMQ+e+gX2IlW6h+HsAqlNvliQOHGTTpVWDCfhJMNIEwbz/0eUaKLQUozD+dISRPoJQz/MXYnilQLemzbhk7bKDHgn/BaHHUKZZHlaNbXhuvHedSJmrytw3sueQQ6Abeix3SRJQ1IAccg7ApwBWbSM911iCoTUTRbnOw9UgtQjjT57dI32HLNoMBz9gfhc/NKV0z0vh0wKUctSiNw61wO9CUGFIi5q3HBgiZ/9u64UgWGX2yVcZlRQVFUV3xSLPNi8TgS0OSMiGvTdMEfe4MhEdMKbwRyzZyhbkD6THj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6YkTu5NzCyzGYSXtVy+McEt65ehrCs72J+FuH9yAJQ=;
 b=devfIb7kHszpxOEFoz7MWao+wWShtUNwSg8BiFXFahZt+loJD1IXKMMH+JiFcj4nFs7uujb/ACRtlB82kjnFba5lMeNuoSAtTw8SrF4/pF/SxSnIv5atn/KPSR54lDz4J9ZTZkHkyeqH+3kLkjFZHxVWOX5Yq7jo71G2reE0fP6NVSjMJ2m7c1yW8SOiMw85w/M/jDgQj1o+iuqzEfWTzzsDP6DUWAD6qruDNkNQ6Hg2szQrHOqdOr0s5Z/iix5+VxOG44cLCb1vOGNhW5e5pN0J1tNCfJsOmmOMRdhv54p/GdNkf0oQsKIQbSQwbmaSWFatJesErXLwNh1TYasc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6YkTu5NzCyzGYSXtVy+McEt65ehrCs72J+FuH9yAJQ=;
 b=BubRCUn4AUkNIE5qd8s4DZKGSvBE3fhyw1LtWiN1ufhjLNSzqxMfkv7sYQY/sxUbKWctHdOsqYi49DxZP/iMih1SjlRg6qKe7mfPkM96OpLsqB/GcBYNsUNG+LiReyPbcp7FCAK1UG+BwG84+t9kL0M/5XDkHxvJcGHDkBvwoqI=
Received: from DUZP191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::18)
 by GVXPR02MB10666.eurprd02.prod.outlook.com (2603:10a6:150:151::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Fri, 20 Mar
 2026 22:39:36 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::7b) by DUZP191CA0058.outlook.office365.com
 (2603:10a6:10:4fa::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 22:39:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 22:39:36 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 20 Mar
 2026 23:39:35 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 20 Mar 2026 23:39:35 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id CD0242788
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 23:39:35 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id C9E90120274; Fri, 20 Mar 2026 23:39:35 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/2] insane.bbclass: Add a package QA test for invalid PACKAGECONFIGs
Date: Fri, 20 Mar 2026 23:39:33 +0100
Message-ID: <20260320223933.1589940-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320223933.1589940-1-pkj@axis.com>
References: <20260320223933.1589940-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|GVXPR02MB10666:EE_
X-MS-Office365-Filtering-Correlation-Id: 1863957b-f54c-4620-e655-08de86d19063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	BUd1jSzljgUhVA01xaFyRPFuantDAy/y3p5dtFp91yx2AhxZAyEk7er0BcUXfPHU5Knb3p/c8KfK6v48dKQ19uyvZk7UnBfjjZLXXhL1dCtIk14jujRuaVfxjNO0cGNOGHpqEio/rzfKHaJIKjctTRsqXQD5YEF0h7sgT3Hh3fs3Bm1P1MxIjRXGLF1L3d1VDQol2eDxuQgY/Ny7UD+lxozFtP6WJWtUz1Pdi9s0MJcJ0+GhXy/WGtMzXDT5iAFsHz7F2y+/c8hNKs9yaRYeMjv4Lm8zqQF7RQ7MqJSgzW+gPjDNxn0VeSvWBlOuvBMWBSCjMzZ+/FVi66yA8muHFzCJ+5fS51Gr9yH3QA7Ata8bt4StNO37wBHAJMf+dgq4EB8jcJr7lH+ZN61+uuC1TzlLmFdVGkmO/P0xsT4cvD1J2B5lYj0kH8BxR4+ilvrEWp8DqohIyS1JFfKHtASDAWGp59OAM8qXiU5Pjrz2BFVVTaOlexaK3MBwZWZmoGuXBjQuI9e1JYlgXT56lMRtkd6EaSL74/NRt05w97paxwm/xaHMTfEoRQByGWTdirkqdwRlAcfC9N0DCXumkyT88ttog9pofJPshlmxSJoq5jH3AJJBVk3l31HwFbu07Q9ZjVhOHrMA7ow7kWoWIDYQvQm810OrDUfKVyOmi6aR6lrxlgXUV7c7Ug507XEzfEWstnQh699KIqcIvtJ3QyC2R6uFaczth5gR0FdDW59CoPYr8X5k01C59tU4P+UIRAhhBGdDwWY1mzEWwd5jjkjWzA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3o6IxqaW6o4hwmh/qMCFoepfFiMslwJC2rQigx244xz0gaqsjeW7dZon+1tkXVEyrwLbOJxb8aXJy5evFhcIpsPFrv/zk7M9eA/d52pM2GadxWyUJhbOr6MsoRnsugKQqW2uG6jU2sFZRr/XiDAko2Za7SsA4zT0431inESEL14fHlIUPpZ2hZB9c2bFAjgsKhZgP0hWK47EH1KD/DFCAMWsGYNI5YLFDbF748HZxwOorimwFyKzYjTm7KQl8uLjakez+Ck7OmAY5ZQL+I7tE51ZgyUgl/AsbXKyZ7RbDdMxTw+EwKWLqg2ME1nq+OCTFYjvMlwhtwlUIOK8JcTVad9vjl0hx0s9rBvRTqHyUAYtBQEd5qihZF2jwgRK3jVU86/cY22BIpcRqivJ7AI78dAW2KaqlmzR7MqKS79M6YLvR5soipj27cnzLX9ZopGz
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 22:39:36.1448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1863957b-f54c-4620-e655-08de86d19063
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10666
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 22:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233634

Normally, this test is run as part of the do_qa_configure() postfunc to
the configure task. However, for the rare case that the configure task
has been deleted (e.g., in packagegroups), then run it as a package QA
test instead.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: New in v2. Replaces the previous solution that instead modified
packagegroup.bbclass.

 meta/classes-global/insane.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 8bbe5bb19a..77d708f367 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1087,6 +1087,13 @@ def package_qa_check_missing_update_alternatives(pn,=
 d):
         if d.getVar('ALTERNATIVE:%s' % pkg) and not bb.data.inherits_class=
('update-alternatives', d):
             oe.qa.handle_error("missing-update-alternatives", "%s: recipe =
defines ALTERNATIVE:%s but doesn't inherit update-alternatives. This might =
fail during do_rootfs later!" % (pn, pkg), d)
=20
+QARECIPETEST[invalid-packageconfig] =3D "package_qa_invalid_packageconfig"
+def package_qa_invalid_packageconfig(pn, d):
+    # For almost all recipes, the check for invalid PACKAGECONFIGs will be=
 run
+    # as part of the do_qa_configure() postfunc to the configure task inst=
ead.
+    if 'do_configure' not in bb.build.listtasks(d):
+        configure_qa_invalid_packageconfig(pn, d)
+
 def parse_test_matrix(matrix_name, skip, d):
         testmatrix =3D d.getVarFlags(matrix_name) or {}
         g =3D globals()

