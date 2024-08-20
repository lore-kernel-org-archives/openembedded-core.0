Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28994C531DC
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 20:35:49 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.11])
 by mx.groups.io with SMTP id smtpd.web10.4785.1724186147775523259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 13:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=TG0PzHdR;
 spf=pass (domain: axis.com, ip: 52.101.69.11, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RV8ynB3mn11nocVHjFFKRyBByhyJedREGxEesuBbuT7o4kjv2+Rs9LgWvUB+zaTTEzIBv0MhYtYaBowUaeeIPTfHTWiTl19JA73UJxTzy4mxYcrrSqP3vs7K36GgzL7grN6xK2GrNM+SS986JRONWscILBSNkKZoiORiSHrJSrBPTV69y55RFY/hRONv4g6IsNBr1ja00Vn8dOZ784y6aJdTtdQOd+OMfzwSzu7IGf5tFaPrHGD2UwcPSTNHtAfMMs87MzqNBTUYXI6u2MNaqKXXOX2KfMQyG0KfEHRmo4K6zX+ub9sQyE6r4sajr+NgYNxIfqo7liGR4+Iukt7FNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/aGQWboarU/YiNF9WHRCkFNnHjXyCz4TMUE5cg//Ik=;
 b=eAYN98g5XHMg/Kj/NFXjeck5U0PgV7EFEb2qb2qDh1CI3ppS6AguecS+UTeEQvZeoUArA4I8GMOQFMY8MREPpSa/HzoYaSdFTOIdRtJ+ljyvTnV3okNEHvABvOdcbmNxB2YCTVopi5QYd23tPeTGO4TkG7DkMJH5n3yqC9102R4Fhx5kQR03yM7Jw9Jcqhm2AEWSPw12FsL3I2YfutaFsrHK2f0t33gQbYytClpq5f4vV7+JprnLclBLWbNK1wF1IIkW2zVsLZ0LUbc3nfAjBITGJhTgMmd9Qy4RD+gbkBEma7vWfmCwb9/JeD7Jtp99zFuGymvUpINMXjV2wqtkww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/aGQWboarU/YiNF9WHRCkFNnHjXyCz4TMUE5cg//Ik=;
 b=TG0PzHdRZCBoQlaC18DMjh4xofvogcCMjLU1Te+iq7tJXoBO2llgqEUme5R2LEhkDN4PSDbLzQTsny7Q1m4pIJARTeqy1lmu0VhmQ0EUIZSZIBbMCxm+3vTnL/ZlKASN4hf3QIzyOv+R7ZIpq9O1zm4RDmnJcMWAuz2erziOQt4=
Received: from AS9PR06CA0731.eurprd06.prod.outlook.com (2603:10a6:20b:487::22)
 by PAWPR02MB10321.eurprd02.prod.outlook.com (2603:10a6:102:365::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:35:42 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:487:cafe::f1) by AS9PR06CA0731.outlook.office365.com
 (2603:10a6:20b:487::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25 via Frontend
 Transport; Tue, 20 Aug 2024 20:35:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 20:35:41 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 22:35:41 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 22:35:41 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 20 Aug 2024 22:35:41 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id EAAB81C3
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 22:35:40 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 47KKZeTe4166674
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 22:35:40 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 47KKZehh4166673
	for openembedded-core@lists.openembedded.org; Tue, 20 Aug 2024 22:35:40 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] systemd.bbclass: Clean up empty parent directories
Date: Tue, 20 Aug 2024 22:35:32 +0200
Message-ID: <20240820203533.4166641-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|PAWPR02MB10321:EE_
X-MS-Office365-Filtering-Correlation-Id: eff355f4-a5f4-48b3-983f-08dcc157a8a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Nn5bAE1mzlGx6XftTLrTFpO/quQEgxM5yf2DolssjEM27FJUPg3hf6XGab3P?=
 =?us-ascii?Q?2c5pA2jvilTPyTEdkKIzdp5RMc4RBUMDZC2FcSQ3hzqwLjz/M5Njz4xmcKpi?=
 =?us-ascii?Q?nTsU20sQmEq3khzkTRiHcY2fTwf7huPZjT8l4vLmTZORp2VKy0INIvkyKDnD?=
 =?us-ascii?Q?JAKtqLwupUrDA66IlCMRgreos60jmVknYVkUMuiEXvmvnKRFOI9M7PAArbq7?=
 =?us-ascii?Q?HSFbMIGJZzX1wpcyk+tnX296DF20vlqEM1MwFJgQEzrW7C2+OEdrQpeLBT46?=
 =?us-ascii?Q?7cSx78MfyMasGxJgc48Ppfv75s3RaoNk0NPl09SkMvBpxguGt+0IC8UzQTGT?=
 =?us-ascii?Q?s7OdmSC1w7DKWeD+0xqbX/iZPGqrtHXFdsjMWf3HpQIVCB701kmcgji2as86?=
 =?us-ascii?Q?J0aGly/4zufRDIbRPUXqYTat+f/jE8ugK1fz4t41LwE5L4qH8d9GnuU2BFQB?=
 =?us-ascii?Q?ZI+4Pd+dlZmIs0143rJUG/MoWTVlGVt7mj20PiVku6TVckgcy4bWek3DWXUc?=
 =?us-ascii?Q?YAG+S5kxcsAYCYuZz0LaXBMhdemRKiok/O8MihLkPJf442tdDOpzOxTz3ajB?=
 =?us-ascii?Q?p+O2wBv/b4b4PLckWYyMiVuZzMZ9V8hiqx4ofd/Vq1ZSSHla/StWcSDx1uxe?=
 =?us-ascii?Q?mWOQqlA1gnbTTtYwunVtte4LweZo/f1hg7huWBeDiBmX9z0X0qdFKPOX6uR1?=
 =?us-ascii?Q?gGpcAU5pE58uu9UOsiHmzqUicSLPF0X0+RUxl5B2S1CLZFmpEOUTnGZ1LiBy?=
 =?us-ascii?Q?y8ko9lX90LfOXT3yvx1KQUxobHCsaizquH6WkUYxDuKR3kyYAliIpio5vJCg?=
 =?us-ascii?Q?tPPAcUJ1UimOrTLfQE5ZflBCPFkGijAU5awUSlkuJX8GkWUbp3jY3L4uCC3V?=
 =?us-ascii?Q?J66Z5FdRfE6O3LhW7T34WDb4orrQ4jDpvFcAjqyrzI/TIn9p84VMF451iZ74?=
 =?us-ascii?Q?QVf8z94m8znW8YPrNH8/pjLGHrIwoEBxOBpvV2IxyXtmx6GCwtCrMm+OWgUj?=
 =?us-ascii?Q?GtkWewPIG4FUVEFLvyMhgcDtzPeS3toOcL5sebJEZbkZziwWJFgOWQ53A+6A?=
 =?us-ascii?Q?vdbosT8v7Rbj5G4B78cDjy0tlUDPzzgitySWN5YEeuGSXamXY5C/7VEjNvbc?=
 =?us-ascii?Q?9qZIhnXrpyxR5L9N7JVl2Jd8aLXJ4YYsnbdiBkJx1pPiQcYtJgaP6FANjC+H?=
 =?us-ascii?Q?ENo95uY7GURNC2qBPGkAy0QWUN8VCFTLNH2gKUxXG1fPZ6wW4ngrJ3cHQtz2?=
 =?us-ascii?Q?Kj66f8O6kXCv2IhaNammNGocQHUZ0PWFIKu3AtUls7blEsQNfA+2Xo2QWIzZ?=
 =?us-ascii?Q?XvIK2hi9LfsSA5S6pSLCNv6m0CN/jgMFS79IijU4u+/F7IvfZerYi+Kv6IeC?=
 =?us-ascii?Q?07+0sIH28tUlLTqIbxI/bTz+NNHd1ji5/I9heZ57Ag+96H2gyMP37g58LDYo?=
 =?us-ascii?Q?K4YiRskn2MMVZGqUZKruYvHsQ5VXBUED?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:35:41.4908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eff355f4-a5f4-48b3-983f-08dcc157a8a3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10321
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 20:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203569

Previously, rm_systemd_unitdir() would remove one parent directory of
${systemd_unitdir} if it was empty after removing ${systemd_unitdir}.
rm_sysvinit_initddir() would not remove any parent directory. Thus, if
the only directory created in /etc was /etc/init.d, an empty /etc would
remain after the cleanup and would be packaged.

Simplify rm_systemd_unitdir() and rm_sysvinit_initddir() by rewriting
them in shell, and use rmdir -p to remove all empty parent directories.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/systemd.bbclass | 46 +++++++++++++----------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 0f7e3b5a08..987b3fc0c7 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -208,33 +208,29 @@ python systemd_populate_packages() {
=20
 PACKAGESPLITFUNCS =3D+ "systemd_populate_packages"
=20
-python rm_systemd_unitdir (){
-    import shutil
-    if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d)=
:
-        systemd_unitdir =3D oe.path.join(d.getVar("D"), d.getVar('systemd_=
unitdir'))
-        if os.path.exists(systemd_unitdir):
-            shutil.rmtree(systemd_unitdir)
-        systemd_libdir =3D os.path.dirname(systemd_unitdir)
-        if (os.path.exists(systemd_libdir) and not os.listdir(systemd_libd=
ir)):
-            os.rmdir(systemd_libdir)
+rm_systemd_unitdir() {
+	rm -rf ${D}${systemd_unitdir}
+	rmdir -p $(dirname ${D}${systemd_unitdir}) 2>/dev/null || :
+	# Make sure ${D} still exists since rmdir -p may have removed it in
+	# case ${systemd_unitdir} was the only directory present.
+	[ -d ${D} ] || mkdir -p ${D}
 }
=20
-python rm_sysvinit_initddir (){
-    import shutil
-    sysv_initddir =3D oe.path.join(d.getVar("D"), (d.getVar('INIT_D_DIR') =
or "/etc/init.d"))
-
-    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and=
 \
-        not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, =
d) and \
-        os.path.exists(sysv_initddir):
-        systemd_system_unitdir =3D oe.path.join(d.getVar("D"), d.getVar('s=
ystemd_system_unitdir'))
+rm_sysvinit_initddir() {
+	local sysv_initddir=3D${INIT_D_DIR}
+	: ${sysv_initddir:=3D${sysconfdir}/init.d}
=20
-        # If systemd_system_unitdir contains anything, delete sysv_initddi=
r
-        if (os.path.exists(systemd_system_unitdir) and os.listdir(systemd_=
system_unitdir)):
-            shutil.rmtree(sysv_initddir)
+	# If systemd_system_unitdir contains anything, delete sysv_initddir
+        if find ${D}${systemd_system_unitdir} -mindepth 1 -maxdepth 1 2>/d=
ev/null | read; then
+		rm -rf ${D}$sysv_initddir
+		rmdir -p $(dirname ${D}$sysv_initddir) 2>/dev/null || :
+	fi
 }
=20
-do_install[postfuncs] +=3D "${RMINITDIR} "
-RMINITDIR:class-target =3D " rm_sysvinit_initddir rm_systemd_unitdir "
-RMINITDIR:class-nativesdk =3D " rm_sysvinit_initddir rm_systemd_unitdir "
-RMINITDIR =3D ""
-
+do_install[postfuncs] +=3D "${RMINITDIR}"
+RMINITDIR =3D " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'rm_systemd_uni=
tdir', d)} \
+    ${@'rm_sysvinit_initddir' if bb.utils.contains('DISTRO_FEATURES', 'sys=
temd', True, False, d) and \
+                                 not bb.utils.contains('DISTRO_FEATURES', =
'sysvinit', True, False, d) else ''} \
+"
+RMINITDIR:class-native =3D ""

