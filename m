Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDF8C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:08:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28739.1787681314556700044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=GrlsScx7;
 spf=pass (domain: axis.com, ip: 40.107.159.31, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gz6KDnbdge5NOxFTVLDJyRBKVfx3I/RqGf1k6BbrpiEgbSTUEzCCALj/hE26ti/dqyTEqrsUzkr3ZleIa6xXRqx5JpgWk2QUT8ZwwBuOOihFXwt2QFatCWICTUIx9eThbEKmW0R3C+00Kw2jzXSEtGbxyfAhGztOOPZpl/6CTkaW90jhYEBSxInbcop0SaHlEW28u6bKRRaojJjqS8EsgeYc/vdwSOHHHvWx+RDKvHH8zsx4qC/ILZrc60AVzQBSfjhZoW0AipHsp1AKPOQe4O0D1HriC50aVKwyRmszy4DWVaI2RwGqAQ31OSp/ekKSAnE38KnMXJ33R6c04dSjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbiTK7UN+d1i3eXVdU+aeqYa892dPlcc2FxpE5ZKQ+M=;
 b=JOR4oHgE8JnaAzNn11ZNqNWRuiV28naqBbal/cQ39vOBRY2InLNt64P8eXOuEAAiJmfyENXHRusm9BZBsXtnwGvkeRb69LVqpbt2NZN53uJcaLcoc02XNB+AMkb5kxHefjxcJMZNHVEKCA49BOYCVvIiVRN+knVDnts6wPQBdwzQvu5VAYdwbvFUc/qqdHUkeYISpvX2YqBiPwN94vvjEiKxK8RGrHYOFeAqZUihOZUwwEFDJndGhUdWV7aD6BUyaCV7vmzaDntLQZTYVr0IGQjSnx3rG9L/u0ZsxZOvFvXMCFmTEiLrL6ZDABjlBSS6NVL9egyIEhmpIVfnIEXJUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbiTK7UN+d1i3eXVdU+aeqYa892dPlcc2FxpE5ZKQ+M=;
 b=GrlsScx7bMH6ApSuddhYJ882JY+A1Rjquqbb4qYVclTblIDlkLXeCq9MXMyyMNdCxfGY0yw0zs2WNNNvwrWP5jCmUqcw6MaMQYjxLnMFgwvYFjAvXwgZRdDutkuKx8xYXu/y4WdynBVKU+Y7lEAiAwNrA1iN1CpKgcMZkD71pfI=
Received: from DU2PR04CA0298.eurprd04.prod.outlook.com (2603:10a6:10:28c::33)
 by PAVPR02MB9866.eurprd02.prod.outlook.com (2603:10a6:102:310::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 18:08:27 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::a1) by DU2PR04CA0298.outlook.office365.com
 (2603:10a6:10:28c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 18:08:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 18:08:27 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 25 Aug
 2026 20:08:26 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 25 Aug
 2026 20:08:26 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 25 Aug 2026 20:08:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 36FE63652
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:08:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 2F08012B4CE; Tue, 25 Aug 2026 20:08:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/5] useradd.bbclass: Remove support for the GROUPMEMS_PARAM variable
Date: Tue, 25 Aug 2026 20:08:01 +0200
Message-ID: <20260825180805.2990506-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|PAVPR02MB9866:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4ea970-894a-4e88-980d-08df02d3dcb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|6133799003|10067099003|11063799006|5023799004|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	G/jiSuMMKD+wPfJbnJTUJofY4vZMYrz3v7/ftA2mzC79ZWLoht0NhW/YLgL2ylm6wsZ9srGVn2YYAUtCc3WQcvE/SLO0Ap2S9HB0f8rcVdJFteHJIMM5CAkbkF2Lfst8zN7kKvAAJu0KplpQgct2v4PJhpy7W76mlXZS72G+aqF4jlvZ5lY3UwqX22/vDpM79k9IMSlG/fxW0U/IBK1ixgNzsZBkDTveOR+vF/OpZh9ZWPcDXHod0dqT29b0vNhTknm4nc+0ZyoO3hgeNU6jEsQRHGpgl9rVhdcwrpF6frvL1794RkMIa1g9kJn2GQvUIJdIpdnvAIp1DYDTi266OIPq+s33O6o86WfbeZ1wF6RACjQjQx2RoNlcFqWf5zkT2xhHpo3t09KCLvBMX0U/TIkDs+oraE2faDfQ+2C+scKNEPQLCEL+P69GTDA5r0vTcZGwMZRHfuyUN9kPfHGlUzliaTVubV4d8P9+TVcP83WvEY7eUUWU1IDFKhWn6HKIkQ0YXfyjVvCR6NQCzPK4VYZa2jIV+NIgdcksLP8TfNfT481NnlWpA1KYa9kMom76U9E+VTmtZDTx4JM04838aDSU7/LwoDUpZ2of5XOWW/SiqH8bSVQBESMtpFQYfUgtXaGCdQjyO9GW3c0voHScZKXFoiP7IpTzWSKg6Cco8AucWPUYpbSZjf/6ELFaIDuOfUU+VWOtm0O7UzBxmaxaYg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cemqkx13B9P98Uxx7fgTyUK25eEXWC7TBxvW7uMuDjVP7vkSvm50+2ys8nd/vvZbvnW1j5WujILAeZZJaF3x37RbibbRbYsrvYB0jyuwII80HaWl9Aamba94+vFdzaWMpavwmtSlMGygheNNEsW+52FdRlpNz8c4HI0H1omZItISyfqMdLGQgW1SNVyOpCLv1l4xcn7YIG0f9YUEcQeziPEUf814OpnFElNlqT6YERlo20GP+aIMvsc7QjJxqp7LyJI+L0iVE8HvIIAJtUlmjXmUSwzjbQyaqKecIEsEOHV80dMOtUd0uUW7AbAS8cNDKfVaQlMQpx5/xKRFLBhGF0rP+aDEz6vZXlL70xxJhXSOglVeShVfoZn9K1H3/M+q82eDWKT+9+EPWH5A5vIDwuFDZJKZ6zpXnA3PwO+zPb1yi2nQwxOqITuMmDLyNEu9
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:08:27.3840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4ea970-894a-4e88-980d-08df02d3dcb8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9866
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244253

Support for the groupmems command was removed from shadow 4.20. While
the suport for GROUPMEMS_PARAM was changed to use usermod instead in
commit cec67e24ac94554e092f8ab18b42e09b4feba77e, it makes sense to
remove it completely now that it has been removed from shadow. Instead
rely on using USERMOD_PARAM for adding users to groups, e.g.:

  USERMOD_PARAM:${PN} =3D "--append --groups group1,group2 user1"

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd.bbclass | 52 +++++-------------------------------
 1 file changed, 7 insertions(+), 45 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 4a07394a56..ca6462edd0 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -49,7 +49,6 @@ if test "x$UA_SYSROOT" =3D "x"; then
 	GROUPADD_PARAM=3D"${GROUPADD_PARAM}"
 	USERADD_PARAM=3D"${USERADD_PARAM}"
 	USERMOD_PARAM=3D"${USERMOD_PARAM}"
-	GROUPMEMS_PARAM=3D"${GROUPMEMS_PARAM}"
 fi
=20
 # Perform group additions first, since user additions may depend
@@ -101,22 +100,6 @@ if test "x`echo $USERMOD_PARAM | tr -d '[:space:]'`" !=
=3D "x"; then
 		remaining=3D`echo "$remaining" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'=
`
 	done
 fi
-
-if test "x`echo $GROUPMEMS_PARAM | tr -d '[:space:]'`" !=3D "x"; then
-	echo "Running groupmems commands..."
-	# Invoke multiple instances of groupmems for parameter lists
-	# separated by ';'
-	opts=3D`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-	remaining=3D`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]=
*$##'`
-	while test "x$opts" !=3D "x"; do
-		perform_groupmems "$SYSROOT" "$OPT $opts"
-		if test "x$opts" =3D "x$remaining"; then
-			break
-		fi
-		opts=3D`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-		remaining=3D`echo "$remaining" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'=
`
-	done
-fi
 }
=20
 groupadd_sysroot() {
@@ -131,10 +114,6 @@ usermod_sysroot() {
 	common_useradd_sysroot usermod
 }
=20
-groupmems_sysroot() {
-	common_useradd_sysroot groupmems
-}
-
 common_useradd_sysroot() {
 	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_sysroot_=
setscene) be running
 	# at this point so we're explicit about the environment so pseudo can loa=
d if
@@ -155,25 +134,18 @@ common_useradd_sysroot() {
 		exit 0
 	fi
=20
-	cmd=3D$1
-
 	# Add groups and users defined for all recipe packages
 	case "$1" in
 		groupadd) GROUPADD_PARAM=3D"${@get_all_cmd_params(d, 'groupadd')}";;
 		useradd) USERADD_PARAM=3D"${@get_all_cmd_params(d, 'useradd')}";;
 		usermod) USERMOD_PARAM=3D"${@get_all_cmd_params(d, 'usermod')}";;
-		groupmems)
-			GROUPMEMS_PARAM=3D"${@get_all_cmd_params(d, 'groupmems')}"
-			# groupmems is emulated using usermod
-			cmd=3Dusermod
-			;;
 	esac
=20
 	# It is also possible we may be in a recipe which doesn't have useradd de=
pendencies and hence the
 	# useradd/groupadd tools are unavailable. If there is no dependency, we a=
ssume we don't want to
 	# create users in the sysroot
-	if ! command -v "$cmd"; then
-		bbwarn "The $cmd command could not be found!"
+	if ! command -v "$1"; then
+		bbwarn "The $1 command could not be found!"
 		exit 0
 	fi
=20
@@ -190,7 +162,7 @@ common_useradd_sysroot() {
 EXTRA_STAGING_FIXMES +=3D "PSEUDO_SYSROOT PSEUDO_LOCALSTATEDIR LOGFIFO"
=20
 python useradd_sysroot_sstate() {
-    for cmd, sort_prefix in [("groupadd", "01"), ("useradd", "02"), ("user=
mod", "03"), ("groupmems", "04")]:
+    for cmd, sort_prefix in [("groupadd", "01"), ("useradd", "02"), ("user=
mod", "03")]:
         scriptfile =3D None
         task =3D d.getVar("BB_CURRENTTASK")
         if task =3D=3D "package_setscene":
@@ -244,9 +216,9 @@ def update_useradd_after_parse(d):
         bb.fatal("%s inherits useradd but doesn't set USERADD_PACKAGES" % =
d.getVar('FILE', False))
=20
     for pkg in useradd_packages.split():
-        d.appendVarFlag("do_populate_sysroot", "vardeps", f" USERADD_PARAM=
:{pkg} GROUPADD_PARAM:{pkg} USERMOD_PARAM:{pkg} GROUPMEMS_PARAM:{pkg}")
-        if not any(d.getVar(f"{name}_PARAM:{pkg}") for name in ["USERADD",=
 "GROUPADD", "USERMOD", "GROUPMEMS"]):
-            bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, G=
ROUPADD_PARAM, USERMOD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar=
('FILE', False), pkg))
+        d.appendVarFlag("do_populate_sysroot", "vardeps", f" USERADD_PARAM=
:{pkg} GROUPADD_PARAM:{pkg} USERMOD_PARAM:{pkg}")
+        if not any(d.getVar(f"{name}_PARAM:{pkg}") for name in ["USERADD",=
 "GROUPADD", "USERMOD"]):
+            bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, G=
ROUPADD_PARAM or USERMOD_PARAM for package %s" % (d.getVar('FILE', False), =
pkg))
=20
 python __anonymous() {
     if not bb.data.inherits_class('nativesdk', d) \
@@ -289,10 +261,9 @@ fakeroot python populate_packages:prepend() {
         preinst +=3D 'perform_groupadd () {\n%s}\n' % d.getVar('perform_gr=
oupadd')
         preinst +=3D 'perform_useradd () {\n%s}\n' % d.getVar('perform_use=
radd')
         preinst +=3D 'perform_usermod () {\n%s}\n' % d.getVar('perform_use=
rmod')
-        preinst +=3D 'perform_groupmems () {\n%s}\n' % d.getVar('perform_g=
roupmems')
         preinst +=3D d.getVar('useradd_preinst')
         # Expand out the *_PARAM variables to the package specific version=
s
-        for rep in ["GROUPADD_PARAM", "USERADD_PARAM", "USERMOD_PARAM", "G=
ROUPMEMS_PARAM"]:
+        for rep in ["GROUPADD_PARAM", "USERADD_PARAM", "USERMOD_PARAM"]:
             val =3D d.getVar(rep + ":" + pkg) or ""
             preinst =3D preinst.replace("${" + rep + "}", val)
         d.setVar('pkg_preinst:%s' % pkg, preinst)
@@ -314,15 +285,6 @@ fakeroot python populate_packages:prepend() {
             update_useradd_package(pkg)
 }
=20
-do_recipe_qa[postfuncs] +=3D "recipe_qa_deprecate_groupmems_param"
-python recipe_qa_deprecate_groupmems_param() {
-    useradd_packages =3D d.getVar('USERADD_PACKAGES') or ""
-    for pkg in useradd_packages.split():
-        if d.getVar(f"GROUPMEMS_PARAM:{pkg}"):
-            bb.warn("The GROUPMEMS_PARAM variable is deprecated. Please us=
e USERMOD_PARAM instead.")
-            return
-}
-
 # Use the following to extend the useradd with custom functions
 USERADDEXTENSION ?=3D ""
=20

