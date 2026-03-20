Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBC61099B4D
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 22:39:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1457.1774046383998920050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 15:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=i52NEemH;
 spf=pass (domain: axis.com, ip: 40.107.162.31, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrvfvRQCFA/PpcRBeD6d5zQ75oYCM3XA61+OKeDdEzvnlmX2X2UcLtg7E9SHdHQQMtJcZMzX+1eAGePP1xVtt261oVB++afrGubgH9H22+bkEnMvW9vCauvt7UPTKj//cRY9ghLTX9nZcG5EzG9A0pmIoz62HZsREdCN1/+O5DuPDk0QQVFFXczi676gPnGG+5Z0tXRwmzfYM0GuBTaTn5STkynMzLEidWbBpklDbnvCjoKMCTU/oK577cE2+091dbf/CHja1prkn75NVeD6Rdy2cTTwkpmJWkkvZBrw7DCqQxvB+2mO9VQTC8EL39PaOVkRBtAH2P84o41k9Pr9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7yDBgH+4ob1JpHhGnoGVgQ4lGERF1myzbd72qRf0i0=;
 b=j8zFkXbABXC5orm8OZIForbk+jqKuO1fNiRV2FGZ3MsHHpvcDLBdpLYhve+ISLnywZ3Tn4bcZS9rE0Uwrg3A7g+UGpniJmenKhWeJiYAuiY5KSK1hQMFvhxRIrqfl+tfPUfY4vDQIy3tAD2TwAdl8T/2Vrx3czDcgR2Q9I3d52b9lEGxBJvXafkZJOT4yrF/ZD+gAjaViR3RkzomSuKWv4bHxtTeULjtu0qmI0g87xSMH/R5yKL0ulwqjjWJdAA+pCDHTNUfzHk8Rt13c/ceJwUyudI0AcGh1NTPBx3XEv7fgMB49SugTRLmS/o0KJ4244xxaG8wGF9nymOFK56/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7yDBgH+4ob1JpHhGnoGVgQ4lGERF1myzbd72qRf0i0=;
 b=i52NEemHgjPNraHPh/Jlqd59Y+PFLaqMaOuyMGT5ZmuZbEbiFcoR7FzXY+0kHQttRZV/juhwqGqC53QaEgQp3yF6rZA9xMwVSFHolW0FtT6RODyiXqKzfshsIYdHPKA1BCPBfJtAELS26DwpqpV9WydHjqmSaFOPBfQ8bvQbyhI=
Received: from DUZP191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::18)
 by GVXPR02MB10667.eurprd02.prod.outlook.com (2603:10a6:150:152::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Fri, 20 Mar
 2026 22:39:37 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::7b) by DUZP191CA0058.outlook.office365.com
 (2603:10a6:10:4fa::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 22:39:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 22:39:37 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 20 Mar
 2026 23:39:35 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 20 Mar 2026 23:39:35 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id D02C42BBF
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 23:39:35 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id C6E581205D8; Fri, 20 Mar 2026 23:39:35 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/2] Revert "insane.bbclass: Move test for invalid PACKAGECONFIGs to do_recipe_qa"
Date: Fri, 20 Mar 2026 23:39:32 +0100
Message-ID: <20260320223933.1589940-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|GVXPR02MB10667:EE_
X-MS-Office365-Filtering-Correlation-Id: d62cca0e-02d1-41be-2b4e-08de86d190ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	q8png0RirYv68Y8cK5Vj0mVrEQUaVCTWIFhQS73+fHExK6ULfrMp5CJXZTgvRF/Q0NX1h7o5h+yVJll4GxDGnBuhtDvCFFJSYfaO6b11aHARS16R+CLwGr6q1g1bUQw5rxJDIFtgDkQHOZAjgwRugLVSwdjIRzXTcTt/J8mE9IXsNaIwe0QjOqNon8yiUoHsLS8M0h/3YA2kUyogLlj1pJrshACcj9IgjyZaA6DHrH41RZoIpgj7DenkQBesMaT6yCB5HyyD/dOn6De2eurZZgYrtoKmZMVDQWglzL0GJo14yXGzjHLJIkf9nA+Zm1ouRXkikgvFTUj4XBGOuU37Asbk/kOB9v+Zqpfr3qxLgHekVnfcLm86IpEKSPCBwUfF51bLu1lIeRMilh+ei1Vil4hMLYnacYz8e4/+/YfK93pmGzC1I2du8zl2kOIHX0atQti3g42q5QxP1Hx6+CUl67gfEsR8wSMpKHgFljbz0GVVCI+5SDg1xBT/ayofgiZw5sH2ZhdE/bCaxt26CiQD5Tzg6daEudYc/LWNLMVLBMDcD4USViKiDU5ulgTKFnHwnT1t4HMwSNKA1sqUrTNBJPBy7u6EViYRXGbMNwiktOLwJ/7UGEUaCWjvFiDTZ79pvVGaibN/1SaBQZ+pRzdbLhyxNA3ctFOzxOoGylDCOZ91U+hFIlFDWWZaHJUDPDxDHu2bbwsxL/GfTHZ7+gLcXBVbladp0nLaeI4BagU+sSH5bKyeqW2Z2pXvnoTwvBWA8EreMLrDnB7X/V2xn5aWqQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	K+s5/yktbx3HO7ZhucI2Ug5wKbCxjzObEdwBQzO3AGHmw1fQAz2wi5QoDeRqWPJZNos4HaPTQh+JAU8VcEPRrwqz4tUWqQ5ouxJNP96/pFOCOybb03DcPVR/DftFZHIe7b4YqovoR+t8M4kTW1Rt5NsAMp1z0g9NhMGMnUEGcS0MZxIEFjmPlXK5rWHZoZuF/qTZfv09MZjcTTxcS46z7TpvOohStbbiSLIHeFl5uIU/TB1ByyAc0xUYVim0glgULHZrftg2dIEs6t8yP2XWBFt6PRWOhmTOQKULWohq4ggs9bio/dFErNJEnGN8a1j3DD6NbT3g9fp/JwSCBy08d9KnH2Ls7ALgXq0Wog+ihzU5rcDgVZjbTVUmvCRGZcgqgaEHkfS8GQbgsi1ajyMpEh9w3dWoaxKJzILVz8WIvwmGPIu+SmnPoZRuwUlWimwD
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 22:39:37.0572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d62cca0e-02d1-41be-2b4e-08de86d190ef
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10667
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 22:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233635

This reverts commit d3325c384a7df54c564cae093659cf7b692629f2.

Moving the QA test for invalid PACKAGECONFIGs to the recipe_qa task
turned out to be a bad idea as that task is expected to be architecture
independent. So move it back to be called from the do_qa_configure()
function.

Also rename test_packageconfig() to
configure_qa_invalid_packageconfig() to match how the test functions for
the package_qa task are named.

Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
---

PATCHv2: It is no longer a straight revert, but keeps the
test_packageconfig() function as an individual function (renamed to
configure_qa_invalid_packageconfig()), which is then called from
do_qa_configure().

 meta/classes-global/insane.bbclass | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index aeffee7983..8bbe5bb19a 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1344,6 +1344,15 @@ python do_qa_patch() {
     oe.qa.exit_if_errors(d)
 }
=20
+def configure_qa_invalid_packageconfig(pn, d):
+    pkgconfigs =3D (d.getVar("PACKAGECONFIG") or "").split()
+    if pkgconfigs:
+        pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
+        invalid_pkgconfigs =3D set(pkgconfigs) - set(pkgconfigflags)
+        if invalid_pkgconfigs:
+            error_msg =3D "%s: invalid PACKAGECONFIG(s): %s" % (pn, " ".jo=
in(sorted(invalid_pkgconfigs)))
+            oe.qa.handle_error("invalid-packageconfig", error_msg, d)
+
 python do_qa_configure() {
     import subprocess
=20
@@ -1353,11 +1362,12 @@ python do_qa_configure() {
=20
     configs =3D []
     workdir =3D d.getVar('WORKDIR')
+    pn =3D d.getVar('PN')
=20
     skip =3D (d.getVar('INSANE_SKIP') or "").split()
     skip_configure_unsafe =3D False
     if 'configure-unsafe' in skip:
-        bb.note("Recipe %s skipping qa checking: configure-unsafe" % d.get=
Var('PN'))
+        bb.note(f"Recipe {pn} skipping qa checking: configure-unsafe")
         skip_configure_unsafe =3D True
=20
     if bb.data.inherits_class('autotools', d) and not skip_configure_unsaf=
e:
@@ -1382,7 +1392,7 @@ Rerun configure task after fixing this."""
=20
     skip_configure_gettext =3D False
     if 'configure-gettext' in skip:
-        bb.note("Recipe %s skipping qa checking: configure-gettext" % d.ge=
tVar('PN'))
+        bb.note(f"Recipe {pn} skipping qa checking: configure-gettext")
         skip_configure_gettext =3D True
=20
     cnf =3D d.getVar('EXTRA_OECONF') or ""
@@ -1417,12 +1427,13 @@ Rerun configure task after fixing this."""
             ignore_opts =3D set(d.getVar("UNKNOWN_CONFIGURE_OPT_IGNORE").s=
plit())
             options -=3D ignore_opts
             if options:
-                pn =3D d.getVar('PN')
                 error_msg =3D pn + ": configure was passed unrecognised op=
tions: " + " ".join(options)
                 oe.qa.handle_error("unknown-configure-option", error_msg, =
d)
         except subprocess.CalledProcessError:
             pass
=20
+    configure_qa_invalid_packageconfig(pn, d)
+
     oe.qa.exit_if_errors(d)
 }
=20
@@ -1484,21 +1495,11 @@ python do_recipe_qa() {
             if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url) or "//=
codeload.github.com/" in url:
                 oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstab=
le GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
=20
-    def test_packageconfig(pn, d):
-        pkgconfigs =3D (d.getVar("PACKAGECONFIG") or "").split()
-        if pkgconfigs:
-            pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
-            invalid_pkgconfigs =3D set(pkgconfigs) - set(pkgconfigflags)
-            if invalid_pkgconfigs:
-                error_msg =3D "%s: invalid PACKAGECONFIG(s): %s" % (pn, " =
".join(sorted(invalid_pkgconfigs)))
-                oe.qa.handle_error("invalid-packageconfig", error_msg, d)
-
     pn =3D d.getVar('PN')
     test_naming(pn, d)
     test_missing_metadata(pn, d)
     test_missing_maintainer(pn, d)
     test_srcuri(pn, d)
-    test_packageconfig(pn, d)
     oe.qa.exit_if_errors(d)
 }
=20

