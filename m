Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B046CD6E40
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 12:44:44 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35908.1779799476904982328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 05:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=j7sHtf/C;
 spf=pass (domain: axis.com, ip: 52.101.65.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyphrPRH4bfEWdcFVd8RFpeq9oYrePf8kmPnYZMXnhCu046VT63c7+lTns1MLOyOyZvvdtFyU4FDwqRdLCREQXYG/giqodYT76ii4kBX6VokVKu3Zk76yV4XOyIAoh+k1ZWOCNTCBDjWxu+D2NO3cFJzON6iPBzvEdskfpkyI09HohqSFb9gl0A9EWB3UwgVkrjE91J+lOfiU4oc8Oe+W0znh7BUNh1DkTEs7pm8hZ6rC4rbSLrbbDOE/yMR3sdy/dpUhnKt19gA0OU7uGUbAk4nXly4qee1M4dLavcNMQinazPxpIeOGVn5I4H0Q61lTP7afeZ5k3T3CVvq1BuItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJBxV0Qooej0x2jGuFdo5moDx5h9QYwqki0X3f7S0fs=;
 b=jDOlsp22QZF79fZQLIQkdJHlhg/jGK7LI7V7lAybFUpuztriI7j+5iUah+KuMlVzpNel6DxlsTXp10iJZVLFCAuqoIAOibVtL2LZk15RY0eZEwAHJu9zh6JHL3pwQJ8TbxTMNifXbwB6YboWEflJry6A7dMiWtuAQjOqNGxaPmGAKy3F8X/X17oFxALOnsXmoPDqC4JUQqAmHUVlcxBg21cFaw234bAUF9eRzCxlmSxjKoBLRjGHKLf13ENM4wjdYnVwRO3vux/iKIrPkY+v56TQGHK1pdATIoq2K3TwiSPin05juKEVCZpMAmRcpGY/XxOlo/JfcpErmeIHXexmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJBxV0Qooej0x2jGuFdo5moDx5h9QYwqki0X3f7S0fs=;
 b=j7sHtf/CoZ2GR2CoQfLtmJnZ7dKvnjJm7V/10gzB6o3rnqChMUXlJfraJEOxYyxdSIUQ5smrV8HH+0oV/EJEJlV6rI+oncpGbt62/ysotrFZpauim6coB9fbKqSSFppDFXdS0nFh7IuJplZq2Lc/9csFqUBsypx5HGN3/fW1AT8=
Received: from DUZPR01CA0131.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::16) by AS8PR02MB9236.eurprd02.prod.outlook.com
 (2603:10a6:20b:5c0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 12:44:31 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::2e) by DUZPR01CA0131.outlook.office365.com
 (2603:10a6:10:4bc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 12:44:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 12:44:31 +0000
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
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8F4E93541
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 14:44:30 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 8C6D9122A1F; Tue, 26 May 2026 14:44:30 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/6] useradd.bbclass: Add support for USERMOD_PARAM
Date: Tue, 26 May 2026 14:44:16 +0200
Message-ID: <20260526124420.2564500-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526124420.2564500-1-pkj@axis.com>
References: <20260526124420.2564500-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|AS8PR02MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: ff87c851-48f4-4289-a4bd-08debb24887b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|3023799007|5023799004|11063799006|56012099003|18002099003|22082099003|6133799003|20046099003;
X-Microsoft-Antispam-Message-Info: 
	RiCF3oI/MsjiiPPppAlnt1XIteuNYQkOUp49HE/oeve5gUy4Na4PzkHZzBTAg2yFHJewyuH8NYgAFA5J/nKUHB06ST3Ka6/ri9qZOcFrHCmV0WW3iTy/Tiwd9hQp4iveZYzmyA++Y08Q+svfGZDUkDEp6FbmhR+shVgqZIF1ZkCI/nfGLn8J/Dxvc05BlsGwNyI7vc+VEMGhRalDTbcI2GkxUS7htpM/vPsqsN/Jo/HSlV3jzts+k3Xom5FzjkQSrDV+9kkjuZza3Cig7SIV5rb1U57auMOM92JXkyYoXUSdWpUUmPDDO7/1u7ICZGz0lqv5nBR3Z83hZJhEkUlIkZmVtOYwsOY2SvlYWXf2vnWtmcE7D7bYp9zzN9r3gav7s0WSXgnIkBvpF79PlCcuI2ofHDdi5/R9UWmJjc3aC/UfS41j/1e+IZT6zb9Jmo568XBjO5vksiWSEq9z+ZRmftBLcWbB8HFhm/oMHAog3MvXf7fOGq7Qt15BOyO9DFVG2VeqH2pv1kv+zzK3ghIbfn6Yxt29aSxiYOq0KBaV+kkuax5E2jDzvnZdVRMaWz+DrJPZtAssYE4VTbjjWhWa5fBFZX0o05XTf5s6xnD/ftokFSmOVsAmcNt2mWY3wpJ55KqKgTiTd2Ik5izgDnlZwwU9pdBSecV/lGHe8UL+MPE+jFk78YSTBqqE+gi8f4Vzevt1SYD/OT/nlyz7YCPuTIT481JGRfR8juMQakZHcDc=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(3023799007)(5023799004)(11063799006)(56012099003)(18002099003)(22082099003)(6133799003)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	f8yeFfnX8ZN5NZdzHenHdUk92svj9qGrDp7xOthNVpw6wbEjcHMNbOo8gIXsxbyTfq+KYtKQ7HAgCwU+SXid75JPB9tXOHfGP7zEddUDrMgI0sW/ov/y0LN2E2n+Zvkg2kjgQnALgadFdEZC4HZAk5JJogkCpJ8gGtVUnG6Txf7pun81vAcN/mB2XGFzOEm8IpGe45aSnVwdPCM/8V5T8hw5DpdEZIUIB2QU4rnj3fn52yB2qXfAHo6QnSgZOqvHDaprNTymUXJuliWi7t9yjnkjeIZYlWL0KG0eK/AuJvg01py9xoCg2CzVPA6DsgG3ix2h4+/qISm2vjVT0UvA+FnfC+CaoCOnKN/bj6Dnh5XOIPUvaSgLHg2HwMfaxyq8BKbht/vCZiakUQyLZXVfZ6B2zA9WDFGUXfO9wt3isG0BKA5sbmDTjMFuoNcd8HEX
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:44:31.5724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff87c851-48f4-4289-a4bd-08debb24887b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9236
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237604

The groupmems command will be removed in shadow 4.20. The same
functionality as provided by groupmems can be achieved with the usermod
command. Add support for USERMOD_PARAM variables to specify the options
to use.

The following GROUPMEMS_PARAM:

GROUPMEMS_PARAM:${PN} =3D "--add user --group group1; \
                         --add user --group group2"

would be directly converted to the following USERMOD_PARAM:

USERMOD_PARAM:${PN} =3D "--append --groups group1 user; \
                       --append --groups group2 user"

It can also be simplified to:

USERMOD_PARAM:${PN} =3D "--append --groups group1,group2 user"

[YOCTO#16277]

Co-authored-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 meta/classes/useradd.bbclass | 39 ++++++++++++++++++++++++++++--------
 meta/conf/documentation.conf |  1 +
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 1080008b3f..55393d38f7 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -48,6 +48,7 @@ if test "x$UA_SYSROOT" =3D "x"; then
 	# Add groups and users defined only for this package
 	GROUPADD_PARAM=3D"${GROUPADD_PARAM}"
 	USERADD_PARAM=3D"${USERADD_PARAM}"
+	USERMOD_PARAM=3D"${USERMOD_PARAM}"
 	GROUPMEMS_PARAM=3D"${GROUPMEMS_PARAM}"
 fi
=20
@@ -85,6 +86,22 @@ if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`" !=
=3D "x"; then
 	done
 fi
=20
+if test "x`echo $USERMOD_PARAM | tr -d '[:space:]'`" !=3D "x"; then
+	echo "Running usermod commands..."
+	# Invoke multiple instances of usermod for parameter lists
+	# separated by ';'
+	opts=3D`echo "$USERMOD_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
+	remaining=3D`echo "$USERMOD_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]*$=
##'`
+	while test "x$opts" !=3D "x"; do
+		perform_usermod "$SYSROOT" "$OPT $opts"
+		if test "x$opts" =3D "x$remaining"; then
+			break
+		fi
+		opts=3D`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
+		remaining=3D`echo "$remaining" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'=
`
+	done
+fi
+
 if test "x`echo $GROUPMEMS_PARAM | tr -d '[:space:]'`" !=3D "x"; then
 	echo "Running groupmems commands..."
 	# Invoke multiple instances of groupmems for parameter lists
@@ -103,13 +120,17 @@ fi
 }
=20
 groupadd_sysroot() {
-        common_useradd_sysroot groupadd
+	common_useradd_sysroot groupadd
 }
=20
 useradd_sysroot() {
 	common_useradd_sysroot useradd
 }
=20
+usermod_sysroot() {
+	common_useradd_sysroot usermod
+}
+
 groupmems_sysroot() {
 	common_useradd_sysroot groupmems
 }
@@ -146,6 +167,7 @@ common_useradd_sysroot() {
 	case "$1" in
 		groupadd) GROUPADD_PARAM=3D"${@get_all_cmd_params(d, 'groupadd')}";;
 		useradd) USERADD_PARAM=3D"${@get_all_cmd_params(d, 'useradd')}";;
+		usermod) USERMOD_PARAM=3D"${@get_all_cmd_params(d, 'usermod')}";;
 		groupmems) GROUPMEMS_PARAM=3D"${@get_all_cmd_params(d, 'groupmems')}";;
 	esac
=20
@@ -162,7 +184,7 @@ common_useradd_sysroot() {
 EXTRA_STAGING_FIXMES +=3D "PSEUDO_SYSROOT PSEUDO_LOCALSTATEDIR LOGFIFO"
=20
 python useradd_sysroot_sstate() {
-    for cmd, sort_prefix in [("groupadd", "01"), ("useradd", "02"), ("grou=
pmems", "03")]:
+    for cmd, sort_prefix in [("groupadd", "01"), ("useradd", "02"), ("user=
mod", "03"), ("groupmems", "04")]:
         scriptfile =3D None
         task =3D d.getVar("BB_CURRENTTASK")
         if task =3D=3D "package_setscene":
@@ -216,9 +238,9 @@ def update_useradd_after_parse(d):
         bb.fatal("%s inherits useradd but doesn't set USERADD_PACKAGES" % =
d.getVar('FILE', False))
=20
     for pkg in useradd_packages.split():
-        d.appendVarFlag("do_populate_sysroot", "vardeps", " USERADD_PARAM:=
%s GROUPADD_PARAM:%s GROUPMEMS_PARAM:%s" % (pkg, pkg, pkg))
-        if not d.getVar('USERADD_PARAM:%s' % pkg) and not d.getVar('GROUPA=
DD_PARAM:%s' % pkg) and not d.getVar('GROUPMEMS_PARAM:%s' % pkg):
-            bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, G=
ROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE', False)=
, pkg))
+        d.appendVarFlag("do_populate_sysroot", "vardeps", f" USERADD_PARAM=
:{pkg} GROUPADD_PARAM:{pkg} USERMOD_PARAM:{pkg} GROUPMEMS_PARAM:{pkg}")
+        if not any(d.getVar(f"{name}_PARAM:{pkg}") for name in ["USERADD",=
 "GROUPADD", "USERMOD", "GROUPMEMS"]):
+            bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, G=
ROUPADD_PARAM, USERMOD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar=
('FILE', False), pkg))
=20
 python __anonymous() {
     if not bb.data.inherits_class('nativesdk', d) \
@@ -226,8 +248,8 @@ python __anonymous() {
         update_useradd_after_parse(d)
 }
=20
-# Return a single [GROUP|USER]ADD_PARAM formatted string which includes th=
e
-# [group|user]add parameters for all USERADD_PACKAGES in this recipe
+# Return a single (GROUPADD|USERADD|USERMOD)_PARAM formatted string which =
includes the
+# (groupadd|useradd|usermod) parameters for all USERADD_PACKAGES in this r=
ecipe
 def get_all_cmd_params(d, cmd_type):
     import string
    =20
@@ -260,10 +282,11 @@ fakeroot python populate_packages:prepend() {
         preinst +=3D 'bbfatal () {\n\techo "ERROR: $*"\n\texit 1\n}\n'
         preinst +=3D 'perform_groupadd () {\n%s}\n' % d.getVar('perform_gr=
oupadd')
         preinst +=3D 'perform_useradd () {\n%s}\n' % d.getVar('perform_use=
radd')
+        preinst +=3D 'perform_usermod () {\n%s}\n' % d.getVar('perform_use=
rmod')
         preinst +=3D 'perform_groupmems () {\n%s}\n' % d.getVar('perform_g=
roupmems')
         preinst +=3D d.getVar('useradd_preinst')
         # Expand out the *_PARAM variables to the package specific version=
s
-        for rep in ["GROUPADD_PARAM", "USERADD_PARAM", "GROUPMEMS_PARAM"]:
+        for rep in ["GROUPADD_PARAM", "USERADD_PARAM", "USERMOD_PARAM", "G=
ROUPMEMS_PARAM"]:
             val =3D d.getVar(rep + ":" + pkg) or ""
             preinst =3D preinst.replace("${" + rep + "}", val)
         d.setVar('pkg_preinst:%s' % pkg, preinst)
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 94368d5c2b..41e67d3365 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -451,6 +451,7 @@ USERADD_PACKAGES[doc] =3D "When a recipe inherits the u=
seradd class, this variable
 USERADD_PARAM[doc] =3D "When a recipe inherits the useradd class, this var=
iable specifies for a package what parameters should be passed to the usera=
dd command if you wish to add a user to the system when the package is inst=
alled."
 USERADD_UID_TABLES[doc] =3D "Specifies a password file to use for obtainin=
g static user identification (uid) values when the OpenEmbedded build syste=
m adds a user to the system during package installation."
 USERADDEXTENSION[doc] =3D "When set to 'useradd-staticids', causes the Ope=
nEmbedded build system to base all user and group additions on files listed=
 in USERADD_UID_TABLES and USERADD_GID_TABLES."
+USERMOD_PARAM[doc] =3D "When a recipe inherits the useradd class, this var=
iable specifies for a package what parameters should be passed to the userm=
od command if you wish to modify a user when the package is installed. Typi=
cally used to add the user to one or more groups."
=20
 #W
=20

