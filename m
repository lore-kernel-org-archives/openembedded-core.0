Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34658C5321D
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 17:06:48 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.51])
 by mx.groups.io with SMTP id smtpd.web10.1510.1724432802063356639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 10:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=mhLju7We;
 spf=pass (domain: axis.com, ip: 52.101.66.51, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYvkLtHd2EjrieqJyWS+Ab9rs7rcY/ymxznvUhHXNAqihTS+8WhjtvE0Wc2M20C8wx0TT/QneQIXKC9PKykidm/EvAMqik6IqW+F+GswcVEF31GHZLrFiPjBsFcsVsqix3eOaqADH7NChjYjPTb/le11YVjb1EHA1RA3sVeyIiERzES4X9W1CVmLFcPE8FbzsYVx4GKQD9L0pWhrDFugRJSgOZJOYWQedSGkJ2pGkAJx5SiqiFnPJCrRSJwGI33jq0x1UnCjTVRTP09pNhXiEh4zZMgmO9jKbOcJKHbYOVvvodJ6nuoCWOo5kML7/YRyNu5JKkiRjHf41d2vca/TQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkGGObmVDHr7ZeLv2nLnXAuvst85XTTwvWRviUpO8cU=;
 b=rF+FM3v9NtOSDjN1x+QRtZhk2M0F8tTHbA5WfMRZSSTHZyqW0fLANI22e57YYxBFhyNO1IHDeJK63QNLorDBUoVircMNVxv9Yh1NEGiX+3icQATsPpEvHzNTHv5BO7YSfOLjcSzfSe9K/rr36Zm1vr6Hqk0KxcVQwJgGgIXtu5SQHqTSjYEezybGVZ4AUy4ZR74RGpsn/I/K6og8XRSqpr5Age5fYWTQsJk2s79TiDV2IxqzTB8YuPY6ZslzcQhY7IRzsIBuRj1ZI4YisyQUikqfsDzyeXXGxAu7B3KqYxH1RfZcjfq79ukqnBJ5co/OYWzyH3rkb+t4l3QPcxwQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkGGObmVDHr7ZeLv2nLnXAuvst85XTTwvWRviUpO8cU=;
 b=mhLju7We5Lel4xq04Re1hfEnVQm8nfeAGMNIsFM/BbbRDAtXd2zHnh62vHXDaFOE0V1l/Q5RCEMXKR+6PbkbodDWHOUMydbNNgiEIPbZnhl5MR8mwpUKPDMyBJCtW2Kf49y6sgRAWa9P+BFbsuNDXAjG2Jj5HG30ciDhMvQN2ns=
Received: from AS9PR06CA0055.eurprd06.prod.outlook.com (2603:10a6:20b:463::6)
 by PAWPR02MB9830.eurprd02.prod.outlook.com (2603:10a6:102:2e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 17:06:37 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:463:cafe::d7) by AS9PR06CA0055.outlook.office365.com
 (2603:10a6:20b:463::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 17:06:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 17:06:37 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 19:06:37 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 23 Aug 2024 19:06:37 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1FC2A351
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 19:06:37 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 47NH6bsc2776919
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 19:06:37 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 47NH6aZI2776918
	for openembedded-core@lists.openembedded.org; Fri, 23 Aug 2024 19:06:36 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/2] systemd.bbclass: Clean up empty parent directories
Date: Fri, 23 Aug 2024 19:06:32 +0200
Message-ID: <20240823170633.2776886-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9E:EE_|PAWPR02MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6b37b0-a5b7-47bd-6db8-08dcc395f316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OQGgcFqmQ18xbjHqnbYKqEtMjqxN5GTKDCE8P28Ui9pwsbOPXoMrvI/L8KS0?=
 =?us-ascii?Q?eZrfnTVqxCMtPqNN1gim/7xHdA6ImZgOqgOjU/nQLJgMwauih9jmS2C6pfbx?=
 =?us-ascii?Q?UTCHoVe7ygIUIaWkric1HV8oe1kvT6wk844v5CTKnhxGVyJQWGAcMfz8RK/Z?=
 =?us-ascii?Q?9KeFOXJYFuRXs4rLajBhySPA5QU+KzXd1l4jYL6FZjba0RKxnUhcWYqXZoTw?=
 =?us-ascii?Q?g/u/paSVJmydq9QmrQM6zOsvOxpE1RjOaoFENxNKdrNrK2kJ85VJnRG6c8yH?=
 =?us-ascii?Q?GULn0eDCOQPTMQ9XuOXlVmJNwhJTaBnaZedpljC4QNCOU4NNIKxqH7RZ/TYM?=
 =?us-ascii?Q?5CbRyTi2KFtoX1PIQhOh/Qp/sK+RbCsFqf0YTmjMlNt/rIUSDYZtImwuIjxI?=
 =?us-ascii?Q?II6lNyvdQtlNLK3v6rmk8JkB3bFdtkHBQYgvvfbJnVzTuUiOvtvCtmD2RgMh?=
 =?us-ascii?Q?rZSpiCR1AS5hxz68fjvZWljRBvw7j+8nhlGAORGUc5ZrU+aOTAOfkmAcLfci?=
 =?us-ascii?Q?jgfMoXFxYkHlOO3tDNdSk/Ps2uamf3H8BXm3pylFOY2M3BubG8WRNS4BSs4g?=
 =?us-ascii?Q?6BI+iSPTkvoegHzN715hgul4Y3a1VzBzC1dCfvXHtDQAf4IzGOq435ki+PX5?=
 =?us-ascii?Q?11K1Z99DrZWcFyxrCfx4emxvy804WEwdti7+u1QQa6/llGBK4OdQ6apmj8Kl?=
 =?us-ascii?Q?rpi7T4q1SuhC48cJEpY0ZAX4Cl2BpXh+dYHWiu895i6pGjsY4HtqQIp7kcr5?=
 =?us-ascii?Q?JdxI3dK+GgsGw1w3tCE4muawIDw03vI+GE5AhrrQhacYKv5elwbtycqOIvYS?=
 =?us-ascii?Q?fsHwV4d2H9dc5w3W9oyOJZQ8bStcM3eOls/dW9n04ixzi4ZnsbA/B8pz3Hup?=
 =?us-ascii?Q?kgroWbvkbt28aQtY+9PhovDWHhjkN2C2IioUV5pQDWKRpIZEtM20wf0HPJZx?=
 =?us-ascii?Q?TBUiKrHMUcFKQrC8/B/xOEZ7vsyQ0YvDwOOARtcgFi3u10e+fqupOZ0k1I6N?=
 =?us-ascii?Q?GFPWZti9Ajoc3R3UPc+6+yJl+21ShAQxbrjZ4EQovkPLJ6o2fs5REQCzagPy?=
 =?us-ascii?Q?OOL4cZTgeG3ocCK7+w0HQ/AaO+/0JgmLOcbd5UbfjkvUfZQR57yqzyxG+nHO?=
 =?us-ascii?Q?6BHdAdOCqgWPZYnY4ge4dG39tZXtrEkldCPmNnzDk1fmhS+mMlwotIopLg1P?=
 =?us-ascii?Q?z9fFeZWL54m6zUpQZFRMA3VMGvlxIF7jJA9m9XElEZxddhfK/GzAIs7zToai?=
 =?us-ascii?Q?gBgF3jEtMYYa/7RRbiKuVDd+gbNa8BDjix3WyDCHHbkGSpspzZ3l+EWaoKG0?=
 =?us-ascii?Q?7oMBNQFF/CS52CslCj+jigZalWpktULGd3AQ1BEc8NIVZVNpgTrvTEAOUYJi?=
 =?us-ascii?Q?L/PfuA34cRmFyH1GsC9Fzaqkg2+nPl8OzgFttH4DCTxfDqjKW/tbd3CfmSiV?=
 =?us-ascii?Q?vf3mN8PdqmUyzro9A/WsAzvJZcqxeCk4?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 17:06:37.5332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6b37b0-a5b7-47bd-6db8-08dcc395f316
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 17:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203701

Previously, rm_systemd_unitdir() would remove one parent directory of
${systemd_unitdir} if it was empty after removing ${systemd_unitdir}.
rm_sysvinit_initddir() would not remove any parent directory. Thus, if
the only directory created in /etc was /etc/init.d, an empty /etc would
remain after the cleanup and would be packaged.

Simplify rm_systemd_unitdir() and rm_sysvinit_initddir() by rewriting
them in shell, and use rmdir -p to remove all empty parent directories.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2:
* Rewrote rm_systemd_unitdir() to avoid having `rmdir -p` potentially
  delete ${D}.
* Add an argument to `read` used in rm_sysvinit_initddir() while
  determining if ${systemd_system_unitdir} is empty. Calling read
  without arguments is apparently a bashism.

 meta/classes-recipe/systemd.bbclass | 45 +++++++++++++----------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 0f7e3b5a08..fa6d3775ec 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -208,33 +208,28 @@ python systemd_populate_packages() {
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
+	# Change into ${D} and use a relative path with rmdir -p to avoid
+	# having it remove ${D} if it becomes empty.
+	(cd ${D} && rmdir -p $(dirname ${systemd_unitdir#/}) 2>/dev/null || :)
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
ev/null | read DUMMY; then
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

