Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725FECD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 19:04:38 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83620.1778612669359534215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 12:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Nsy2XTVM;
 spf=pass (domain: axis.com, ip: 52.101.72.37, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnDkIhelbhKwWDup0P/bGvcx0oFhBMaL7dtxSELA8yBZYZiMgyzntZSA7V/2BGJI8jHK/KaOD9E/kqlS3rmvWDC24i1vrBUXCW0QDYfg69CvPO1P6uBLH8dTzXxG49M/A87zPgLxrzV/DDZ0+WATtu2pgHSoLpMpNzMyq+0uHrSaNzFA12W7H/pkgH14On96C8JsocTo/C9j//fGe78+qj9aZBJlaS+9T40iDxcyVCaoCHJK/aQCM7ccVnxGFg0obwFkloXl3LiEhPUP6yJRISgKbybFxpYNVjAwNfJN3PN4kHcedW9bTsD5767bOjMSZHLdeuiM4LvqNesDiVWPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5I1xPOkGDtWgMNcyh+3O6NWAttuG5jea2LcYePamBZU=;
 b=dJ73rllkJhiRJdVo+VqXGp1KF3NBbIPf/bV8+CptLJjFH+5mAFhKIzonvywMfY+Ikzn2DU15N7UnnlKXX/iHG2yyhb3jnTpaBRjPUw6GOafvxL/QHqsgwyXr8YqFbfP1JtbAen7jdL9/GHmNyXD4o3cxcME0s0v5ONHBLx7j+FUDk/RVco27OIE2euOK/y/nIZmb7ImiDldAXL462mVsVMvvT6Uv7pEDEm/S7k3L78q+KwHMN0zqORj+9D2hovXUPA2PrJKapxwVZUklRtAP0EmcJmKluQCODsZL7uZQhjaFxh48gKf0qwyatbsFHqWiKrW7UVsXOYdIU9nfNldMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5I1xPOkGDtWgMNcyh+3O6NWAttuG5jea2LcYePamBZU=;
 b=Nsy2XTVM/nB8X9uGbX/U2YasJDBxElzXwaGEHsTdGlVXiyoIq0IaYm2pEY9fjbE73WsuCQe/tPmWwySwOXiN3n5egJvvjfY0UOIimUILhPjFfNsHSgvt7RzSMArKAepo/QFDVe9URveDzIa8NpQEi+7F1wvjQiGY8aZzdY33Y04=
Received: from AS4P189CA0007.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::18)
 by VI0PR02MB11523.eurprd02.prod.outlook.com (2603:10a6:800:2e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 19:04:25 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::b4) by AS4P189CA0007.outlook.office365.com
 (2603:10a6:20b:5d7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 19:04:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 19:04:24 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 12 May
 2026 21:04:24 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 12 May 2026 21:04:24 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 4218729BC
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 21:04:24 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 3E444125E2D; Tue, 12 May 2026 21:04:24 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/5] useradd.bbclass: Show a deprecation warning if GROUPMEMS_PARAM is used
Date: Tue, 12 May 2026 21:04:15 +0200
Message-ID: <20260512190415.948535-6-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512190415.948535-1-pkj@axis.com>
References: <20260512190415.948535-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000094:EE_|VI0PR02MB11523:EE_
X-MS-Office365-Filtering-Correlation-Id: 087b0443-c952-4696-616b-08deb059485b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|11063799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	LGoI2cFiV+wGyghAje8B7fCw0oPcxuafE81GQnkdwk8JImW1jC+22iry7LnvWjMr5zPO+YQjzbztwn1UxQZHDxseKwLcpLS8lvw49k0QlDBXQfnm2+DNKlInY9Sh0IAcwylzFL9peQugkcHEtUPXO5fBrNgHRXkV9bK0jmhhCsm7rTR/VYi4kHxmK+MyeyMRzmJ7G9J4ScBN0wMK79lha/TEbYPH7nrknAWKwUUMalpVbLYERBBSID7TlnG6bi4cR/OSFHAdnCGHF+z1B98UaUjtaRXejGTacwAupnFuLttgQd9hfFOc1Dth9X/TI1ICyt+fbObuUuW1fSi56sPBUmiiKvPu5SVAq8gZOWW8Uf9RdRPr2QvnNAPagt/mWMKVVCsqckwt12zIkUFpjU8smqSk5X5RoGYGpKhDmu2PX3nWv7NP/9oAsby+qCw3TAyizB59sZMavNjgR3ey3s77rSQjk9sp7q4wEbcr1JYBu5S/fzZSyW4SEkYPMfLohBM53cwnBNV7GRqm+6tiQkr4DHKE7+KTl9/qSeGcG5sUiEALtF9/68oM9LafeQSaQqJePbuhoGafb5cp0iiywmjIXwqiMf/tFXlg4fP+QlxTSqp7P/byIsV2N5b/kMLxRAEf1ha8JAhUYnqQblUvf5wYzyzivoOh45+eYE5vIv9Ia1AwQNkj6BRv9xlR2M4DR2/E9iEJ8gkvUrk38n72hZbi3mseg4MiV8qAR3soXWWPcjQ=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(11063799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Gsa+8KpNGo+5TRFCznovSeK8a09GlaX9Lh26XrOIJuxiMpwq28mGfLb/ff1g3H4u+0WspCvN2KLhEDqzGlQ4xEWqU1OBhDwoIF0W0OvcpTLiODdo9vSbEsjUNu0kDswJOj/koi0wRfaHTEtzQfFGTZj89Jbwrzm+gZedgrz8917esf06jbZ0Ies9gQtPf1R1WiOWPsS8cB4qlJYLbUp9DOzBzKkvmRxjlghps82QNh+/wxkDWzw6npV7uvgdVCB9p8ueEdjOnWGhxIYA01ZyVaAJ7XHq0fIG/9dkJQEW7gxAPvKKWREIas9cMIv7aXGhADijJhLcbbuRlVT60ZXvxVUtFBzqvuoHq+x5MYWDOYIWJsMc5jrOG208PWYe6cXNT3J+vbfGqgkhFQM/vmu33Pjnh/GYZaASY4jpd4pvqcRbfbICA6Xf/CZlLciyo38t
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:04:24.5356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 087b0443-c952-4696-616b-08deb059485b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11523
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 19:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236904

Tell the user that they should switch to using USERMOD_PARAM instead of
GROUPMEMS_PARAM.

[YOCTO#16277]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 55393d38f7..e83a886af0 100644
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
+            bb.warn("Use of the GROUPMEMS_PARAM variable is deprecated. Pl=
ease switch to using USERMOD_PARAM instead")
+            return
+}
+
 # Use the following to extend the useradd with custom functions
 USERADDEXTENSION ?=3D ""
=20

