Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4964BC5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 17:25:14 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1675.1787160309627756217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 10:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=UmTnHbxc;
 spf=pass (domain: axis.com, ip: 52.101.83.20, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAJDaNHMhO3lJE1yTDOHXl8WtMxQhbbhpyoLvAqHwnoywFefxtuC33b/8owsud0zuAo69OAL145bvZ0DIRhnU36P13zBaZsvFIam4CPuGl6kFD5DwCmhD8GYr6+JCpYFZjuiwwS2B32Yykn1sV258PatBq0i0TKUetbIMa/lvSBjxJlyPt96yOqPHkPKXb8O3CveIluTUyZQDlRuoQiYhMJmTCYBKwucv/VoK5K+QsDZb3I1hFr2BcjU0eRPcgaWKoNpifqUXpX9yZok2jcTqjTE6oWvyVRKOh1Pma8lJ4JJH4yDyeJoWUI3EuyI6i+DfR1aAsy/USx7TJLRua1IEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzf7Gl7miYANnuMcPnIGZLiLjKg669ho8b/dPk+OAcE=;
 b=TbLtj5dIR0b7qCblBqjSN5v7FcG3K1C58X4fdroynqFmbkpBDNwUejpHububGfw8mgUD3vLjlZCXefzNTXDVOfXdexIeRf8L3QR4+Gs/w37wlQBfrjPLX06l1vvF4nl9kbr4kYUpGzwxaPEZyxFQ+WTKOXyiFcoF7W8/GSL0JVNWAPMwNP3nRV+Q1jKbDx4xijwQAt5xqMKQdyLT+e2CjF2E9eXtEtuOLSUB+GX3FG8h6+33RnnP0zIXoBKwzRj+WYYSuYI0GOd705QNdIjVKrwc/fKJ5yogbsVl0Rdlo/d3cDrY1eAdu1qUQIJcQ0vE1Ns4v8si425qThkmwBf+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzf7Gl7miYANnuMcPnIGZLiLjKg669ho8b/dPk+OAcE=;
 b=UmTnHbxcc1xD2zqCkCCw/2IsbtoBRFvOWVP/rFX49jUczcQDvdqRpWTCfq9zH14W4A24Dt7tQZ2QUsLzigtGPbswdBavY2SQyMZ8Se3OLMVzwqsBc2wrh+KUrreI4GUckKVKf+NjjhU08oj+B+aFHXS3IFsCyF/SdnvvwUPSg5M=
Received: from DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) by GV2PR02MB9495.eurprd02.prod.outlook.com
 (2603:10a6:150:e3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 17:25:00 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::33) by DUZPR01CA0074.outlook.office365.com
 (2603:10a6:10:3c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 17:24:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 17:24:59 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 19 Aug
 2026 19:24:59 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 19 Aug 2026 19:24:59 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 3E89F2900
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 19:24:59 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 3570E12A84E; Wed, 19 Aug 2026 19:24:59 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] Revert "useradd.bbclass: drop groupmems from sysroot setup"
Date: Wed, 19 Aug 2026 19:24:55 +0200
Message-ID: <20260819172456.2843283-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|GV2PR02MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 2348eea3-482d-4809-2bf0-08defe16cbec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	sziCGXptU8TD563oTUZZDmfb/RAjiFZpLIjkt0oBXJmwFkDjEIrdeFcKtLhCENPFRW8HkhrUmeYkKYLdXk1aQewM5lUofXZdnL0eDtarWyzhN1hxWgJb//a5GlyQIBiqD3Qi9sVjRH+FHgBIBBxwASdqBtsMgv9160uQX7QQCdgKUoAIxV804FWW5HfWKW6job5QMuukZe2FpXLvUjJZZIU9YopcByyVagmI4PtUPHJWdlffChEZSY6/pI1nyidNVFLfPvVTZpwPJt347lOqAAo5htkhUScE82JdKqSA0LreYtJo6c0cV8kq9OV8vAu0DFSuSUy+Xcv9/EZK3awVhtgvh95KMrwLczPPfWxa8WQZXZTcwEy2s3OVXe+UcBf833kiEJs9V4Y9Ae7qid0Zfwc3PLwlspqxQqtnYBrf0C4AdJugbtbF2r8xcgneZgNR8NbkxeU649HI/QM5s1d5V+kXwVq2Y2zlIFiwawmWSO+KyTKzwoiQDJUHNiAodoSpILQE0b6966SlwoLaJz6za5Buhy/FxHLYGuGreiraVc62OqgfattsIhBkPWEREhZ2abVw2zjnUV/XCvc05qqlyqzPB7C+6aqhAz6me+bVbkRTNovLyjfE3ZM+f3FwZ0nTn4q6tipsk2uN1EoqRQyEFoUwfR1Wz0mFdNIMIs2BtFv6vrmrAsluS9+0Vav9xfY2ObKvPhL5vkZ4BNK1wC5YCA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	q+fAnZqC8a2OKJOixgrAnwww2TCRKbHhywMvMptsThYVrwRoCTR1jmmcUc49yBXQe0anO8WdaklhO6jEHUP5CxX9TzjVEcjnlJsGcG+R/Rp+LJzp6xrNctYEHeC5xtUl9FpL7gs3gOS0h0vKDK8rRvuGVilBQw9I6bNMzKJdEfONkB8RmFkMtMs91A4GS+0X/1ZgukEgJsdN085qaJngIH+Qtg45p5XIKFZMiVV+Ci5Ui1pNCfPRPv8xj+EakNxzLpzcpvK/27eNA51CX6PeMEdkO87brTEDC4kB9RG44rUdWw1fNjDc09ivrD0a2og3/Kt9q/wObGk8Tv5z7KKO5HgE+JyjjaY+vBP6sOxtGa6qSzFJ30NHw1eYdW5FZRw29EBloiKAtY1DHKTUgL/vLajcwlOHwAWl6Pp/WH4G77BRj4Punb1lJlZG/ZXzrNgZ
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 17:24:59.6671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2348eea3-482d-4809-2bf0-08defe16cbec
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9495
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 17:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243779

This reverts commit de0bf5771644edbe317ee9ad89cca4bc8836cf12.

As long as support for GROUPMEMS_PARAM remains, this code is needed.
The lack of the groupmems command is handled in the next commit instead.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index aafd996fae..c9f24bf7f3 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -131,6 +131,10 @@ usermod_sysroot() {
 	common_useradd_sysroot usermod
 }
=20
+groupmems_sysroot() {
+	common_useradd_sysroot groupmems
+}
+
 common_useradd_sysroot() {
 	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_sysroot_=
setscene) be running
 	# at this point so we're explicit about the environment so pseudo can loa=
d if
@@ -164,6 +168,7 @@ common_useradd_sysroot() {
 		groupadd) GROUPADD_PARAM=3D"${@get_all_cmd_params(d, 'groupadd')}";;
 		useradd) USERADD_PARAM=3D"${@get_all_cmd_params(d, 'useradd')}";;
 		usermod) USERMOD_PARAM=3D"${@get_all_cmd_params(d, 'usermod')}";;
+		groupmems) GROUPMEMS_PARAM=3D"${@get_all_cmd_params(d, 'groupmems')}";;
 	esac
=20
 	# Tell the system to use the environment vars
@@ -179,7 +184,7 @@ common_useradd_sysroot() {
 EXTRA_STAGING_FIXMES +=3D "PSEUDO_SYSROOT PSEUDO_LOCALSTATEDIR LOGFIFO"
=20
 python useradd_sysroot_sstate() {
-    for cmd, sort_prefix in [("groupadd", "01"), ("useradd", "02"), ("user=
mod", "03")]:
+    for cmd, sort_prefix in [("groupadd", "01"), ("useradd", "02"), ("user=
mod", "03"), ("groupmems", "04")]:
         scriptfile =3D None
         task =3D d.getVar("BB_CURRENTTASK")
         if task =3D=3D "package_setscene":

