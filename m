Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D702CD5BD0
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 12:44:44 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35909.1779799477283460427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 05:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=GwVcwjKX;
 spf=pass (domain: axis.com, ip: 40.107.159.12, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXMGIP33Rib1fo4/zq2P7j9+hVy21ciutSEwi9pa9js6vqYxL7UvZbPlq9U/BuQ0FLpytzHp357d9DhRCAC8pY4ppUfZVVcG9B6e+T2VRo23k/vDIF7XtOCzgpanZ5FOT44BL6Y/y+o+59zTzcYG5i5MQ2qNssuroD+Fj+Oblp0Hwc4bXeVo8VPmpUc1C2AeSXvE3sMJMYTNMvigai5mB0zTd8OQpLI9PyFRh3chZ0gYTF6jpovxbymDLCFrGKcnbe1RwiQOAcTZUxajqTftrN4kzZMor6Ejf5UfqbxVj8wx5X6qdjEstv3uSvYbFMKWCdjoU+MOdjN126X/SOks0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIswL4eh2H84cX+mUxqAZXVw9LrQQ+TzWdl1jm7DwVI=;
 b=f7H9FV7cl/9nvOQfzZPHEIf/8wsaghmP8Oc8MO10trftTX2g3LU504z/uswnYsx+l8RgcWsfigR+kJ24YSxRCCft02B4A757dJdnz1nb10EuqgSHCR1SWHHGCIH5eOISDHBnUA3acc7KHiP2lx3f057xLozsyIcvYnJOyzbDz7ijRmwZXpC9oZETcDa6qPvdG4UTNdhRlE5orgb5nGF/maL2KNOBjCk5kqeGXd45VKAW0zbuUyovZ3IkddbVHCvn59hqQkEmTzA7CaKtrAX/79sA4BZZqutp1I9f3Z30Oa6eRHyJPWEi6/BMy2lJxuZSTb5AHGOTtWjM4NvbGseQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIswL4eh2H84cX+mUxqAZXVw9LrQQ+TzWdl1jm7DwVI=;
 b=GwVcwjKXC1Eli7HKBrpKdsv90rRl3nbSS6LJ2jAG5/mTGRzcjywwAz6TcgMRklye2jivwL4oVklhpmT9dB5NIDwJb1R8mFPHkJcc2mVm+88RtqPpwgDMnr5Phzw1+0nmJdig/vZqlZhAX0nbM4iPEbiZE9W5acALl8kKUwSFO1o=
Received: from DUZPR01CA0136.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::24) by DU2PR02MB10205.eurprd02.prod.outlook.com
 (2603:10a6:10:49e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 12:44:30 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::56) by DUZPR01CA0136.outlook.office365.com
 (2603:10a6:10:4bc::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Tue, 26
 May 2026 12:44:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 12:44:29 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 26 May
 2026 14:44:28 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 26 May 2026 14:44:28 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 073E53541
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 14:44:29 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 01C99122A1F; Tue, 26 May 2026 14:44:28 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/6] useradd.bbclass: Some clean-ups and simplifications
Date: Tue, 26 May 2026 14:44:15 +0200
Message-ID: <20260526124420.2564500-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|DU2PR02MB10205:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef6d41c-befc-46f2-173a-08debb24873c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|6133799003|11063799006|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	yI8aOgBzalKn1T9Nq/PJI9XEC+bQZQOgM4bk500pSV4vQ9Q89YcSEVcNddFinH4NaZBSKBzNz/4YOCQjXi22/4L0VcRdiSY6DptD7zah320FVrxUuTXst4hN6KZX/2EiuGpSXIH1Vz9pD5qPtQrHUPiOTLs5DoUSgxKVlLyX+MMCMbvOAcrGaa3wgGdZK9p5D6FPpv9yCHlYazwXdNbUeJDxuOVWJLNqIirYH8wBrs002xgGTWtgB+D3f1/Z8SFK4suxTKIgvkJimNy9y493CPi0QNNkqZnHqpWfZpNu53oe6QvHrpckV/Slkh6rDEh4Jsgw/IQu6aqppYjHo5XJSpw5RTkVZXbUROTCskMY/uLaUlSCTWc+roMVajI6MVlRkiAWFa8nN4z+2B5HGJXjXBLxvebBmR9g2aHnfsnLdUfVKNNIoriOOyL/eYKUtzfXJjwHfvOqitLtB+XxVwPXI7oLxFS7/NATyuxuzhHH5gbxaGS1FR2ay2ch3+dUCMZfB6BN4cdciowORtkxzb+/MESkxJ80L1u3zKqfqlm4jvOlPBphKA37+VkwaD+XvtW4e19xjriz2tX1ZWZOGUMwSe7QtHTY6rfukjCi5ezuW2I3my9SryzocIe+OFOMDJhrWhHnmdnPlv3xPK0OfvPkSSaTkR8tsDsoFHg9IAEDW0JS0KPkPky4zwBde+z6wSBGndidplaTBOcjTVGAdvVG+Sh00cty9CTXVVQdX7CppmA=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(6133799003)(11063799006)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xJZN14UzyxgpDLPVQTrrdSXjx2F+7jsRVUB8c5TYtj9y/4EsHzm+h2JmVf5CcR+G1OHxSMuYyMIayZPWY/Jy8TF9c0W8gmnJ1NKnNKQHv84Dtshh8qtrtzw/vcgX15HsCMI04EykfghnNXdwSh5b7HNMLpBdi1TZvMGlR41qCWNNpLBGsHlAYksNIuSZZeonP0lICFuOUmJASOiCcYZElVgy5yPlOtULrmtptEt1RKivcPMc1Mj9KGrVBOuR6rGASBg6Roj+ZQKIEI58SGuj4vcbyAR+tA7UPR4GfscPUZzhsXbeREl4xzt8O6hBWK7028l+AZBtadf38h/QgIh1BIvArMG7As5xNVaa7d9lrVKlGVj7YXmvVclheEXo2wI+GYuOiPxU03NpG+6cGlWjVdkjIsNXLpAzFHFyB62I2LZxGn18YOjGZJIYr3ShxT+6
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:44:29.4781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef6d41c-befc-46f2-173a-08debb24873c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237605

* Improve some odd function names, e.g., groupmemsadd_sysroot and
  user_group_groupmems_add_sysroot. These were introduced in commit
  322ef726132a47d977d2c6ee41de5358f1e85994 (useradd.bbclass: Fix order
  of postinst-useradd-*).
* Make common_useradd_sysroot() look for the actually used command
  instead of always looking for useradd.
* Simplification of common_useradd_sysroot() by using case/esac.
* A bit of whitespace clean-up.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 meta/classes/useradd.bbclass | 60 +++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index d7ed6cb931..1080008b3f 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -19,7 +19,7 @@ PACKAGE_WRITE_DEPS +=3D "shadow-native"
 # c) As the preinst script in the target package at do_rootfs time
 # d) As the preinst script in the target package on device as a package up=
grade
 #
-useradd_preinst () {
+useradd_preinst() {
 OPT=3D""
 SYSROOT=3D""
=20
@@ -34,7 +34,7 @@ if test "x$D" !=3D "x"; then
 	# shadow package, then while performing preinsts for packages that depend=
 on
 	# shadow, there might only be /etc/login.def.dpkg-new there in root files=
ystem.
 	if [ ! -e $D${sysconfdir}/login.defs -a -e $D${sysconfdir}/login.defs.dpk=
g-new ]; then
-	    cp $D${sysconfdir}/login.defs.dpkg-new $D${sysconfdir}/login.defs
+		cp $D${sysconfdir}/login.defs.dpkg-new $D${sysconfdir}/login.defs
 	fi
=20
 	# user/group lookups should match useradd/groupadd --prefix
@@ -102,19 +102,19 @@ if test "x`echo $GROUPMEMS_PARAM | tr -d '[:space:]'`=
" !=3D "x"; then
 fi
 }
=20
-useradd_sysroot () {
-	user_group_groupmems_add_sysroot user
+groupadd_sysroot() {
+        common_useradd_sysroot groupadd
 }
=20
-groupadd_sysroot () {
-	user_group_groupmems_add_sysroot group
+useradd_sysroot() {
+	common_useradd_sysroot useradd
 }
=20
-groupmemsadd_sysroot () {
-	user_group_groupmems_add_sysroot groupmems
+groupmems_sysroot() {
+	common_useradd_sysroot groupmems
 }
=20
-user_group_groupmems_add_sysroot () {
+common_useradd_sysroot() {
 	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_sysroot_=
setscene) be running=20
 	# at this point so we're explicit about the environment so pseudo can loa=
d if=20
 	# not already present.
@@ -130,28 +130,24 @@ user_group_groupmems_add_sysroot () {
 	# Beware that in some cases we might see the fake pseudo passwd here, in =
which case we also must
 	# exit.
 	if [ ! -f $D${sysconfdir}/passwd ] ||
-			grep -q this-is-the-pseudo-passwd $D${sysconfdir}/passwd; then
+	   grep -q this-is-the-pseudo-passwd $D${sysconfdir}/passwd; then
 		exit 0
 	fi
=20
 	# It is also possible we may be in a recipe which doesn't have useradd de=
pendencies and hence the
 	# useradd/groupadd tools are unavailable. If there is no dependency, we a=
ssume we don't want to
 	# create users in the sysroot
-	if ! command -v useradd; then
-		bbwarn "command useradd not found!"
+	if ! command -v "$1"; then
+		bbwarn "The $1 command could not be found!"
 		exit 0
 	fi
=20
 	# Add groups and users defined for all recipe packages
-	if test "$1" =3D "group"; then
-		GROUPADD_PARAM=3D"${@get_all_cmd_params(d, 'groupadd')}"
-	elif test "$1" =3D "user"; then
-		USERADD_PARAM=3D"${@get_all_cmd_params(d, 'useradd')}"
-	elif test "$1" =3D "groupmems"; then
-		GROUPMEMS_PARAM=3D"${@get_all_cmd_params(d, 'groupmems')}"
-	elif test "x$1" =3D "x"; then
-		bbwarn "missing type of passwd db action"
-	fi
+	case "$1" in
+		groupadd) GROUPADD_PARAM=3D"${@get_all_cmd_params(d, 'groupadd')}";;
+		useradd) USERADD_PARAM=3D"${@get_all_cmd_params(d, 'useradd')}";;
+		groupmems) GROUPMEMS_PARAM=3D"${@get_all_cmd_params(d, 'groupmems')}";;
+	esac
=20
 	# Tell the system to use the environment vars
 	UA_SYSROOT=3D1
@@ -159,36 +155,36 @@ user_group_groupmems_add_sysroot () {
 	useradd_preinst
 }
=20
-# The export of PSEUDO in useradd_sysroot() above contains references to
+# The export of PSEUDO in common_useradd_sysroot() above contains referenc=
es to
 # ${PSEUDO_SYSROOT} and ${PSEUDO_LOCALSTATEDIR}. Additionally, the logging
 # shell functions use ${LOGFIFO}. These need to be handled when restoring
 # postinst-useradd-${PN} from the sstate cache.
 EXTRA_STAGING_FIXMES +=3D "PSEUDO_SYSROOT PSEUDO_LOCALSTATEDIR LOGFIFO"
=20
-python useradd_sysroot_sstate () {
-    for type, sort_prefix in [("group", "01"), ("user", "02"), ("groupmems=
", "03")]:
+python useradd_sysroot_sstate() {
+    for cmd, sort_prefix in [("groupadd", "01"), ("useradd", "02"), ("grou=
pmems", "03")]:
         scriptfile =3D None
         task =3D d.getVar("BB_CURRENTTASK")
         if task =3D=3D "package_setscene":
-            bb.build.exec_func(type + "add_sysroot", d)
+            bb.build.exec_func(f"{cmd}_sysroot", d)
         elif task =3D=3D "prepare_recipe_sysroot":
             # Used to update this recipe's own sysroot so the user/groups =
are available to do_install
=20
             # If do_populate_sysroot is triggered and we write the file he=
re, there would be an overlapping
-            # files. See usergrouptests.UserGroupTests.test_add_task_betwe=
en_p_sysroot_and_package
-            scriptfile =3D d.expand("${RECIPE_SYSROOT}${bindir}/postinst-u=
seradd-" + sort_prefix + type + "-${PN}-recipedebug")
+            # file. See usergrouptests.UserGroupTests.test_add_task_betwee=
n_p_sysroot_and_package
+            scriptfile =3D d.expand("${RECIPE_SYSROOT}${bindir}/postinst-u=
seradd-" + sort_prefix + cmd + "-${PN}-recipedebug")
=20
-            bb.build.exec_func(type + "add_sysroot", d)
+            bb.build.exec_func(f"{cmd}_sysroot", d)
         elif task =3D=3D "populate_sysroot":
             # Used when installed in dependent task sysroots
-            scriptfile =3D d.expand("${SYSROOT_DESTDIR}${bindir}/postinst-=
useradd-" + sort_prefix + type + "-${PN}")
+            scriptfile =3D d.expand("${SYSROOT_DESTDIR}${bindir}/postinst-=
useradd-" + sort_prefix + cmd + "-${PN}")
=20
         if scriptfile:
             bb.utils.mkdirhier(os.path.dirname(scriptfile))
             with open(scriptfile, 'w') as script:
                 script.write("#!/bin/sh -e\n")
-                bb.data.emit_func(type + "add_sysroot", script, d)
-                script.write(type + "add_sysroot\n")
+                bb.data.emit_func(f"{cmd}_sysroot", script, d)
+                script.write(f"{cmd}_sysroot\n")
             os.chmod(scriptfile, 0o755)
 }
=20
@@ -247,7 +243,7 @@ def get_all_cmd_params(d, cmd_type):
     return "; ".join(params)
=20
 # Adds the preinst script into generated packages
-fakeroot python populate_packages:prepend () {
+fakeroot python populate_packages:prepend() {
     def update_useradd_package(pkg):
         bb.debug(1, 'adding user/group calls to preinst for %s' % pkg)
=20

