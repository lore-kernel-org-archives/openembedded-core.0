Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0836710ED669
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 12:28:39 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70826.1774614515330707359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 05:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=rl0abMAL;
 spf=pass (domain: ericsson.com, ip: 52.101.72.30, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8GGn2wNGkUlMm/uzDDdBcnvHnGvFYmIii66tB+aO1HgHOo2BnIyodFrbWU/ZqTNteT0GFK0hQ5WBmyGUcWR5jjKdrXNXFpD/vYIl04wBZx9FeRgoE1Ca2DQDHVKwuFFrsxNn3dvD8R3UVRpXqJiJ7fZIleow3ZZDQYwZcR9t2C3TMGzXMJ7+B9duc9XP5B8s54DSMqZG+0qjIztHRmkpjIA7rQUtk0MMqNjDHdErHl1JyLgY7aSTrPL8DGHgNHex8c7Vko1ZVwBaATm7pa05IkfgHG/s6tEqV+M42CwxD7kHip0LqgyjQ2E5tYv1julVHDDcfVTAfAU+JA37QJRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dE0W3xesJ7qg5njxK7vlN1JUn6dteL3bgZDxvsEYpZ0=;
 b=By9y9dynCehILtQHPapl5xB7X7qHGs0Knl46FzD0+/tpO3eGZgj+nVouWWFgHeWQ+yU4OylWykr6BFpccv6B5sAGm6JNGYFa1zR2nguU/bSwRWkV/923+lajkballQbiCNj/7TveHtuOBpZwum9Sl9dygkhdOrQBOy+ptM0pzl2F9Hho393bCT+sGJJT2gI0SmtovoqU368RBfJTbk5D+YV/NRrhORbGnkSgw24pNabzv+DNbapns4UxEaBjizPL5dHxBvlhV5NeVsOvr3+CRmbr+R6MafzEPh8cAl63EhMgLaCuJ6cH0TDinYPg6Tm4bdzmhDBp26mx7KbKH62arw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dE0W3xesJ7qg5njxK7vlN1JUn6dteL3bgZDxvsEYpZ0=;
 b=rl0abMALRpEb9DWL1AZiBSZI/kC/TT9Y8PwAroLZosJpEQWddeXDEKPvrHDi/LYX2XyC1jY1bdmAXUZqXVvsjjc3mcltj/q70alEii3LEKMlN87oArpDD0WN35+4+seX+AL0nj7fE0qXGCqT5qm00j5EXdVF1rlp4xSB3qhL+JNKBA2IylfwKNuFG6vXJfXioPakU9Hvt4V2ZmD+VsP+8jyXy3A0GXWnFYysx+W5/ZWOsB9NKUn/fWRSXaStlbnDp0b075rQqc2DXhWNbW5NvM4w0p4lhgBENsttn2aVclp5oHKKsuZQFe/rd1lS0reZCBmlB39VC+1y37JDsu+7BQ==
Received: from DB9PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:10:1da::16)
 by GV2PR07MB12240.eurprd07.prod.outlook.com (2603:10a6:150:366::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Fri, 27 Mar
 2026 12:28:30 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::f8) by DB9PR05CA0011.outlook.office365.com
 (2603:10a6:10:1da::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 12:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 12:28:30 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 27 Mar 2026 13:28:30 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id B592F9517D;
	Fri, 27 Mar 2026 13:28:12 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 338C0700DB94; Fri, 27 Mar 2026 13:28:12 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
CC: <bruce.ashfield@gmail.com>, <alex.kanavin@gmail.com>,
	<pratik.farkase@est.tech>, <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2 4/6] ltp: disable cve failing testcases
Date: Fri, 27 Mar 2026 13:27:56 +0100
Message-ID: <20260327122758.1851989-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327122758.1851989-1-daniel.turull@ericsson.com>
References: <20260327122758.1851989-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F2:EE_|GV2PR07MB12240:EE_
X-MS-Office365-Filtering-Correlation-Id: 77eeafeb-9fb0-45e3-e425-08de8bfc5aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	LuusEeIqqCoU8+4Tax4la11fF9HKM/X6zDn08zg88jaWf5PtzOxC3rXAnzeIgjjR1j3qpwZ4eTpuo3phohd/QXqiohz++K36rbws1gkUQcfK+nBOX71YDct6emsE7YTll0kR/LRxf/MhrQfBldNxEAI27rn/yp/sonzXOD8DhQyRU7dVGN+Wc0bET5O/ONR79zGbjo0532guqESGb/s2S/fd2rhxng+ANea0rdO11TQo83hwwY6JUEKNxhlDnKloU6WLUgWmRHEKcjB64847HDeUywMWp/HDC5nHjG8LY08YZd5kFoYhVDwTdRA/QC+xsGteCg8H4DY+sp+mM13neymBsmlJRWAgiOPp8lR8Wv/48iGb41E29WO966UjvC/C4b+WgRdjdCqMnRlEeMlAtybyJGqalpHE3xechrVEdb8leDBbCM7/V+vo65dxtGL+tqByvYmFOzYDLrEy03xAnzN07my5Jy8WKAhG8oF3Jk7SeHHqPJlWgHgwrtjKjAbkiC4AYIAlROlaV9H/gxxhWB0kpX6Gi1giDgsgc65k1EWOjB0ECNSIVNcsNPmJW2PFhH+HUqID4GcZy8NNEycX8UvmK1SYPQEuZAcL7l9LaMhBWec2eA7nHbk9pLvryHt5vFgKt7SYXgkyTZrH2As8GOjBX4rHVllaeHWF4zIA0DvNuO8mvpSnjAlHbeTOfs2ZVQUPGSyNU0S0pOR20jLwodbDmz2mYXulghHUymLcFEelI6o3JIofrxQIxMThYOtYlwBYyOw/z+oRzW5vgwIa3g==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IU6OAsE50hr1HGOqXjM/U5vFIk7+wCEKQv8cerLUrHZvPeGrc+A8f3k4TMnnluzv7stiYJHPG92OvRCCaU8oFTFEQ1S7eD/U5/4no9dup4s900b0pLsok07ZCcPi24EVHrBaqf9J65OUeMtKH7wD7hMMtKWip/MOeTxdO+RoW5cnmlBBglzUJB0TTZ4EkVZhLqqkZ28VOoKrm+nRm1BP8kSpQ+umkzdUBdKbukh9GKLqBm3C9EUEI193rEJtErLTYvc5vGLYWFEX+43mlvedxdXiM8++WbVxFg1E5+E5THoMveoOazzy8i9CsEGkH1wcS035XGOwaerjOxbry2ubBPcCpOjcK0Pc0McGPmzPn8hCVuSf6gMnjUOPp1tjZPsYNKN5FdL36qvwUzf1RmeqhMIHUTLOoIWbGzHa2okQGCBC4j1khn+Rbw3wh21P0gOK
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 12:28:30.5662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77eeafeb-9fb0-45e3-e425-08de8bfc5aec
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB12240
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 12:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234083

From: Daniel Turull <daniel.turull@ericsson.com>

On a qemux86-64 with 1 CPU the following testcases causes an OOM

CVE-2020-36557 and CVE-2018-13405

Test cases triggers memory deadlock kernel panic with CVE-2018-13405

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
We will investigate why to be able to enable them again
---
 meta/recipes-extended/ltp/ltp_20260130.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-exten=
ded/ltp/ltp_20260130.bb
index 0b4f9c1ad5..e5da94855f 100644
--- a/meta/recipes-extended/ltp/ltp_20260130.bb
+++ b/meta/recipes-extended/ltp/ltp_20260130.bb
@@ -81,6 +81,12 @@ do_install(){
=20
     # min_free_kbytes can be disruptive on constrained targets
     sed -e '/^min_free_kbytes/d' -i ${D}${prefix}/runtest/mm
+
+    # cve-2018-13405 triggers memory deadlock kernel panic on constrained =
targets
+    sed -e '/^cve-2018-13405/d' -i ${D}${prefix}/runtest/cve
+
+    # cve-2020-36557 triggers memory deadlock kernel panic on constrained =
targets
+    sed -e '/^cve-2020-36557/d' -i ${D}${prefix}/runtest/cve
 }
=20
 RDEPENDS:${PN} =3D "\

