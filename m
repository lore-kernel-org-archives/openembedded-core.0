Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84431CD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 19:04:38 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83622.1778612672891204735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 12:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=RM13aleE;
 spf=pass (domain: axis.com, ip: 40.107.130.9, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h71Vju6Vx8GRm2IIbD9A+vW6QAbhtij91WvTXDivx0lA9dJUfkl2GOFaWDFbaT1b88fAWb3/gdZz4ePZIgrIEjytwN+wxVw2KY1abpXjdjSTGe9K3g0nmDPCsprwdtxAHZ/zLy1FO0EJSlSVNdh5iUDdBo4j3ee9xkrue4c3VrB7ejBa9jVv+SdFL4FmwG1PYNszeHTM1cJLpf2LpZEVk2TPOl2ExIK6b/BgAeJLhQ2iI+W1p+o1o0fWQQou9IGn7UG/goeX97+J3s0W8mvILOQN0KSfoou7QvSdSUz55ySQwq7y36byJlbHWfY421IzV2jfFpJLbSaaRWpCzsUJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8CzjGHl0nN1n574efw2M5mNjP9UpyeGCbAGoyU1hFw=;
 b=IupueWckYLHWKriXHVEyHpZbbASdxGraTBLlkhjfUhL/klD4WI5cvTFTMTCJhch0N2bFtt/PkLHWeHES+2EUNFbMrT2wgV6fqCBZr/uCtm9CGLP1VlMRdMoo5H9WlAxnshTsdQzTvqLS5x8EiLLiJIyXrDkM+g9cA2ixjIys38cOzbqntQkBpVMiRueDs0RqYHH80J5ZWUx3s/7Rty8AFynQBvekOxxV9A4Wf9ev4fxfEi1rhwIxW5sZXU27bYFSygUMOm/vTp00jNVBP+Nf8DJJ9zqGtW0zrRvJ32iRz1EKGSLR31QhxfE5sTqyva3B7i9HWy7at9xR5cfY3dUm8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8CzjGHl0nN1n574efw2M5mNjP9UpyeGCbAGoyU1hFw=;
 b=RM13aleEW7pdZkp2Xc67PbOHHPbqZyDVy9NxZXf0R4HuCVkJc0Yp+CTG+de5Q+tvHELWdpY1PDZPeZK00BkYu/0UvBwQdTlYaOAPqrjRJjMnKcmo9YiW7bYSCIfBnIFiEFYfW7ItYuvu9zlRNx5kjqSQc6Hb2sTPOP6/GDzEVJo=
Received: from AS4P189CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::6)
 by VI0PR02MB11966.eurprd02.prod.outlook.com (2603:10a6:800:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Tue, 12 May
 2026 19:04:26 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::d8) by AS4P189CA0001.outlook.office365.com
 (2603:10a6:20b:5d7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Tue, 12
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
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 19:04:25 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 12 May
 2026 21:04:24 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 12 May 2026 21:04:24 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 3B7812801
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 21:04:24 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 36F04125E2D; Tue, 12 May 2026 21:04:24 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/5] useradd.bbclass: Add support for USERMOD_PARAM
Date: Tue, 12 May 2026 21:04:12 +0200
Message-ID: <20260512190415.948535-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512190415.948535-1-pkj@axis.com>
References: <20260512190415.948535-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000094:EE_|VI0PR02MB11966:EE_
X-MS-Office365-Filtering-Correlation-Id: bd346e48-07cf-4246-9eb6-08deb0594935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|20046099003|22082099003|18002099003|11063799003|3023799003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	XLbtCq8+kFFQN/byfa34NQcLCYDBVIKPD/Q+GRdh/nZvE3DByyuS85FLUrsTYekoPXIyns3tuBqkIIkVkpLD+ObjaARmXXIu848ygisozHTpeJhYt0g2+Dy45Sv/lkp49OL59cJCQdlXv6B+8U+K8b2iKX+/wZDGKHeXvY8WeoemJ0/BjLnWpThE93K5SG9nrTAsuLa+jcSWH7qKvGS+QHPelwe9VqUpadVQjKtv/Q7GemNrsDOsOlXgS8KpMxLFtVpHX+siaZN9vPYgtBWCkyQA84eNu94moXXCj1huKz6/1CMAFHrpTuk9k9G0BHhH7S1dbxxXST0ZQmkuBSgxy4AIKiLijmFnDBt3Mu1UbJZMIyBcNoU/j4WdBJfMV+PO3xuXfLB3GsLWLwO1XZHdm/kRjDUjaonsUJkzXrrogr9T6ffqtqheNDiM8x1q11kRDGFS9+6p39ShJybm4L5Ad7EvNu/r5fe0fwM1hsMVGM4tnWVkJrwyKpCOUPHHSkYQPFaL1lUC5GuvG/xCKlHmfJipzEb/YoEkNZVFrT0BayjjJQzVVm26K0YyUJzWVKYd4e7FdXR2OM7R3u0kdrOC/ETVkCR7MQL7UtVx/+m9yhYgdpsaGKhH/DlagKy48VGVOSqrFUAR9sGY0XI9gnd0yp2/uHIaD6SYAQMVE1s4uGW1zpN0hI3G+TvWyAsEl5exC8bWS+FoXVraARRHrMVY3q8/8aKu+tJsUpQgU7BfnM8=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(20046099003)(22082099003)(18002099003)(11063799003)(3023799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m5QAHBTWzjko71C7MCFpDrPLCaCVobGzIeoKsz9Bu5JEvZpHijL1My1U3rswW1wlsiw0914LDtMfqFq6dcnpIyE5SKTsengovkmg63wYezdtBqOr6AN+fWb2X79p9phHL/bu+M4Z4sM53x+Ovh5wKeIBO9NLtBKTPEXqTVhXh8fw+fe3Cw6FN3Ntidu+IDvNC0dke2+F90giguHBaqFp8jr9Z/R20se6ZkOS+geJmjGC/8DWS8dL9cO2TM3ykBIwFK5lfAw+ZgBw9WvVN8iBwFF6PmU0dLKc/Nrkrc0esKdyeHc5A6xV7eZMlcyjXPNr5crB+RcWHjzAS9MvKZ8a0jWsvSi8saPYiU7yhOAmrtcXb7ZXraUhYm1a9PmxEUnqyyYTo6UTGBvizaOH0jksrbtetpHqX5L9UxC1mYIKmv9OhvBIGsKyxfeUW4SsZUPE
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:04:25.9647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd346e48-07cf-4246-9eb6-08deb0594935
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 19:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236908

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

