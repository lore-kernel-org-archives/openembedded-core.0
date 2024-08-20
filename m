Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676D3C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 22:31:59 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.48])
 by mx.groups.io with SMTP id smtpd.web10.7246.1724193109302940632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 15:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ksopad+Q;
 spf=pass (domain: axis.com, ip: 52.101.67.48, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RY+XEvo39SROJhDZlRalvAmMz8+iY7sMCOoVIsjPi3YT8cZBtH5SNnNnXMeF/JyZdsBX7U7RtLcChtub6x+2lLzg2hPu/ChJE/S0ROsjYMxyKljrivHPu7ybiDxSw58DSbDU3Wf4A34q0xF6RAeFI6B/wja6xTNfgVsEV/bFFATazY3ti7r1xQnvJokwOE2Qh3K0bazWDJhRpwL/LMXolpdcdOZX50rdE8FbOjyV24Kadmbbdvg4O8IE+PsbBVrcKTlZp9dq8T/xNs0LGiQB4iZhVMUPmE9/+7sshDoKp17vnHqmsnwERZ8i5yBHpJ5/3gT2M825VewLbnAWti4+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7snkz8Q5qdIpwzBUgDZKYNhwC5T3uJmWla8ox0okcZ0=;
 b=tH4ZUgwJhLtV9nBlTtwq06oVvVq/aAljqg4UNKajAYmdqD0oAkoO3ctTR8x6opBE6VcVUhtz7yJNIey4PmCPHvWGxIo1cmPANOm97pcbm7DiM5mnC1BaQJE1du1ukNfO4O4861Z/rMBwlbOntupl151d6XE6xlSeQtMTGUE3LvWfKEQm5RInBEH5XAHi/0WHV8yVrryTjiEsgYYIThCaK3M8uAL1Oai1RQ3HJJivvyuZ7A66yltHYS+KH37PnNyL8Am/awUZUolTXj1PJFnYGz8j8VkZVHKYg2CChxW4c85ez1PNLtxnljg3hi3SUwXM8sM/iNzfiiyVeOJlYb0HMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7snkz8Q5qdIpwzBUgDZKYNhwC5T3uJmWla8ox0okcZ0=;
 b=ksopad+QnIIUhPGqrqeHig2UM+/SXOaf1Cit46+Yzk1N+jVSLuEWgN/wRDh/r/tVh8q8JmJ+/6Dis95pjQR4T9iujW2F7k7L8OyMTrvK2+0TWzYRISmnDacodOzJ2W56/B+MCtGcPQjFFIU2ZbQxFf2zv/XL/ylyWNLWO5y+sxc=
Received: from PR1P264CA0042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cb::7)
 by DB9PR02MB7290.eurprd02.prod.outlook.com (2603:10a6:10:25f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Tue, 20 Aug
 2024 22:31:44 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:102:2cb:cafe::79) by PR1P264CA0042.outlook.office365.com
 (2603:10a6:102:2cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17 via Frontend
 Transport; Tue, 20 Aug 2024 22:31:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.0 via Frontend Transport; Tue, 20 Aug 2024 22:31:43 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 00:31:42 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 00:31:42 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 21 Aug 2024 00:31:42 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 4ED771B3
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 00:31:42 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 47KMVg4A770606
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 00:31:42 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 47KMVgMW770603
	for openembedded-core@lists.openembedded.org; Wed, 21 Aug 2024 00:31:42 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/2] systemd.bbclass: Clean up empty parent directories
Date: Wed, 21 Aug 2024 00:31:39 +0200
Message-ID: <20240820223140.770567-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F96:EE_|DB9PR02MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 15773a14-5f68-4404-c654-08dcc167de15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?k+HdqMnzrEOXq0OBcgnMujZJx1QGAta6I5zSpT+snzMDWqluHWGm5sFrv+9t?=
 =?us-ascii?Q?7RiQtnJdlstjVfXNVx6XNec4s/IaPVXV0S54kdqVl4pmr6m4T3eDztXyQr6h?=
 =?us-ascii?Q?EQav4ZF/hKTCfAbYV0P+lOA6TnIfxJyYP/wt1iZ5rgu5AC+FGEP9F4/lDqap?=
 =?us-ascii?Q?MrwZhUQvCrrMaVXSp1p7aFtdN+Z78tbp76WGMxO/D4QMU2RpXlvdd52fJ1Zj?=
 =?us-ascii?Q?OKifLgW2bV5FZ1ub+kSIesDZ8eenn0bFFlW1vcchjaLC3HwKJsMxlAkFQ1R3?=
 =?us-ascii?Q?ls9lcsto37xXikVeLmowEf2FSGVhukfYGVCFONsyDZlaTh31fM54PAVy1NJB?=
 =?us-ascii?Q?YHv5rnc4Mx/dyTQmtdBM4Py2c8x6PjZ+ZSgSB2opNVu4M+tqAzJfCidHq91w?=
 =?us-ascii?Q?6E6Ix4Z2ju9zWgJIXmUe6kBwaM6L4O29vAI8xc8SkKrLUit53u67VdMFZrEv?=
 =?us-ascii?Q?bwuB4DqM+5VWtCzXlsr8MybHjMMCR0Tp+1SrLyjZ/Xn1ZPtHvwlnQe9ChFdR?=
 =?us-ascii?Q?Zcxb+LkHJNj8Uq2PBQiAApY+dv2oe68G3l5QOnltlTqByeHagU/r830tw9j3?=
 =?us-ascii?Q?CBotrIRWYF4BH9mP0qEhevsPaNANtACzSmO6kw+/yAx6e1cmrUerg229i/qD?=
 =?us-ascii?Q?7hXyQ7v0EcBsrZZwC+T28CJxA+/oFW0Fg+uTJ21kt78Pf4Y22eFqP8z3elMr?=
 =?us-ascii?Q?WvaVLEJYyZumRM0HDDbetR6Uqic4mTAoNQ05EI2auKIyDnqnyXrcXLR3pWWY?=
 =?us-ascii?Q?WdhEEaoOeCTlk5lDgTXGeGppJk4Y17Ts4aELd0TstTnb9pquodFhsrQ+aMyH?=
 =?us-ascii?Q?zXaH6q5R9Jqg1fIz/exDRl2+wV51ISElEOnK2jdTD63nOBm6gn3zHLj3Js6P?=
 =?us-ascii?Q?q5Dw9NbzmgpHwwiahnqifUvzAFjxbMBdRqxizvgNkveRepm87fXiIoeWNqC9?=
 =?us-ascii?Q?lyC5Zca0rnLYpQrW9HKWklgX4MwiX3W/V2RtkxCgBWpQgKaeugyJA7kTso4r?=
 =?us-ascii?Q?FGN1q91o5JrP1K9tAYflDG+xpD99vM2boDK8H5CD1mJ7pyoZjsJ2ri74Q4Pg?=
 =?us-ascii?Q?7MjrIgizN8VvMwWsYB6yyRI6AyzeR1wreajrRO+JtTfBIRrc4uIvvCUL9wGr?=
 =?us-ascii?Q?Tz1M/ayyW4dijBhCOyzHET/h+xAMjffDXGJoJBEMOFPqnVPOl+WEfQfZkirO?=
 =?us-ascii?Q?oCXOp0cIiQzcKMAcAz2Q4bm+IBR4zBMMIoyn2fZQgSBKl5dh/GdejKSkqS7w?=
 =?us-ascii?Q?5o3xI0Lfj9b7X3mbFxQbtxPdK/j4iA7F85+qbAJc1yxrLkbePQPBg7ViuxE+?=
 =?us-ascii?Q?9yJI4dhhBsCbH5tiye2K9pMfF3/wuT6ixp/UrDbrsQY+0J+WQst0x+quQ1Jm?=
 =?us-ascii?Q?yAVgW5dDYg5UZQx4tvRgZucwO26u8g5yvWG6nbLMmH+6tq6lVw+F8NmTooB0?=
 =?us-ascii?Q?F7dyw9GnwDzkS1WARqN8I6ycQcFwpdCb?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 22:31:43.1060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15773a14-5f68-4404-c654-08dcc167de15
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 22:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203572

Previously, rm_systemd_unitdir() would remove one parent directory of
${systemd_unitdir} if it was empty after removing ${systemd_unitdir}.
rm_sysvinit_initddir() would not remove any parent directory. Thus, if
the only directory created in /etc was /etc/init.d, an empty /etc would
remain after the cleanup and would be packaged.

Simplify rm_systemd_unitdir() and rm_sysvinit_initddir() by rewriting
them in shell, and use rmdir -p to remove all empty parent directories.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

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

