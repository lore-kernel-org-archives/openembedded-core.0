Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB618CD4F39
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 19:04:38 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83621.1778612671549457351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 12:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QnbZ2Hkr;
 spf=pass (domain: axis.com, ip: 52.101.84.59, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLFekC3qcslGt+Avl0uYLC8uKwt8Zu+wrEhOuKXcktBnCo2IvwZUOqWWfwaEHyflPJE3hPxsclAsRV7CPQ+zF7UGPLwTU4/veX8XU8Y1QFPlrdnjg3wO+kErt1nZxWhiEi+sh0pYf+pPkZhEKT1M43KSnc3PvWUQkzV+WMnnOsmWaDJhIvDrFJZCL0nIfyHc3mwHYRbkh2djkGIeanyB0TFeq6gWRZ05N37umkXlnsqRwWj2y+KzKE/39dWJNy5wejE1ywHOL6z47FdtJ1qbFdLeq3WCJ1194QRcj06GqA6AxYNchvOxlNFD0HZKrrF2ETZau0/JWpjjeNHYuQeRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEEdU224ruOYm5nyGYqICkJYEcnXMMW0yCCOwfx1YoU=;
 b=bHEmEZ1ZVVIHVAwYEJMM80jbR7rXyqpBkvZOc6scwB+cGL8FqVBugdeq4NjSwjoXuYylWKx/rSTecHQjU+KIeYiwc1HT0StZoTLi7TQNf5Pvl/izAFmfIfYyvk4DAkFrM4nFPgh8NQIvx4OnQIRyM67nv0hvzPtDLgVAsRBNWQvsZ3KkcstbRIq+aL1XKwcpsLtjvVGoPqOqr/0dloEJDT4+zAIsUfi+kz/2jLM2ttQa7VpXf/u4iMElp0hjRSsZw3qRBPqygxCGRq4so7vsR4NUcbGAs+ysPCEpTY/rVnSrMCmE/Jds1/iQNknbs8fTvG4jBZr/9hCNW+7nQr1Ujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEEdU224ruOYm5nyGYqICkJYEcnXMMW0yCCOwfx1YoU=;
 b=QnbZ2HkrjSX4TtA4wtzl+isB+WT8Hynp2xepYrkbcd8QRMci5x672eG4gAw9CE6wLuC8FZAp/himibpVOhf/EnXSo+zcE0VxQK+oWRNRd+uEY7hgaaIQs8NCleN2SoGWRks5ZgFvthEWzJrxoHgUgbwUj56jiLwmaTYjuOCBY0k=
Received: from AS4P189CA0004.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::7)
 by AS5PR02MB11246.eurprd02.prod.outlook.com (2603:10a6:20b:6ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 19:04:26 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::ce) by AS4P189CA0004.outlook.office365.com
 (2603:10a6:20b:5d7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 19:04:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 19:04:26 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 12 May
 2026 21:04:24 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 12 May 2026 21:04:24 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 37D261611
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 21:04:24 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 342BD1247A5; Tue, 12 May 2026 21:04:24 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/5] useradd.bbclass: Some clean-ups and simplifications
Date: Tue, 12 May 2026 21:04:11 +0200
Message-ID: <20260512190415.948535-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512190415.948535-1-pkj@axis.com>
References: <20260512190415.948535-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000094:EE_|AS5PR02MB11246:EE_
X-MS-Office365-Filtering-Correlation-Id: 87fb63a2-6efa-4b79-761b-08deb0594975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Cro4rRzbwxXZcjoomtQnHImEFzDWy51ycQXv98y62sJOiqoy+GGAbnzP9a/Tt/qJZ9j3l1gB/TI+XSSWGJzVXyQhMvECz5yLLkuSmRefnbKtzr20u0W75+ZCEgVdhDaB/Da8p+ogMF7xGhrtQ5ZTogIKslSk2FkptqCEGPg0sCYv40vvElXolwfOHQUVe07DrAxAdnd8gpb7jpew1pzxVCfCKht+ZNFbWkR1tNgAZWPfvhPiwwa61tKG5h2j5bwhVK/VriooCX8UEvAiGxCBP/ylLVU/twl7e7h9cWd3L+1IPluTTXbE2cLEk6ztbaS6rrAQL9zRkViT11sBnIz3CBwbaGYYV04yGhXAGjpYdV52Jxqq6d/E9G3CRQJAKbexRj2vK4byO6hpCeK7FgWRshtAv8OeHpzr2sndibteHL4bQr8vtTbaZGKNMzwg0P9KxDhG12PBpDtsxuVKMNdXrXC5vxst0yQbMy3YIgbdH25pN5qmAfVtLe8wGhN6qyvswPgIblJ0EVzy4DU1sryfA+SLaYGegJC7HFS2IEAj6KfsJ+8XgIRqh6XUcJiZHSLK8zJsRKqgfwLGdkpqIMoVE0ypBioEebpo8nz1+5oTYir7wZN4HIAF2w/myq+0LsJDF/pP40PLPOj+XOhis3QUGRRNnwuO1Mc4dJ8b0SwfD+8BPwT6bKhAmlfvMgIIhjZzx2yVwQHSzpJwu9LkB9bSC6bCbfGcnf7NGDTUiX1P/3g=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DXI8Jq5VjhnneDY5EH3cBoHQTy//C+Zh9HbV2ep8D5Ck+yItGOSoRZqDSen9bjTHk2sDHOkAIYTLC6XbiaD/E4N9hPcKj6GdJcuBpKjnn47Dsf4xBlHEl33FNTLo8QYwDuGLqDBMvtCoFF0LFeXaddpeGzxFHJ+O7/Wv9xhLBI2fMJ3UVE3HjuXKdmQWJBExKrlhHibERUi/i7UTlm6VSzERMB0vKBwbYk7Gj024AcIUJ0vGRX/Db3EncZ8hwZ2QB9szHh8X/CSUAGsJZi4L+N7UAczFPZ8pRX4KmUuwcoOqHBGUdrP62rx7atxHxAT4vCni5MwHYZbd52L5hZ36bIj/KKk7lUctZieOXIlGqQYXvGVOj7JEq4FM2VD7eNj5nfAfJtc0yYTmisXlnl8HWfrXhTPGi1wwa/bz3xTH5KWHL6tbw5D/NxrSFWr23JWY
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:04:26.3824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fb63a2-6efa-4b79-761b-08deb0594975
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR02MB11246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 19:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236905

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

