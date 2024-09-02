Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C3DCD342B
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:23:18 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.49])
 by mx.groups.io with SMTP id smtpd.web11.35585.1725272591078618791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=VTcqvzmG;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.249.49, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agws+9JILIjJ6HvypABw9cZPGolVP4x/1OBKoi05MMCAVwhw7LEgOij/JjfENGhuWGYZUXR2ebtqjxLBIpMwZm3JPUIZYhSQxCD9tMH766b1dhYsvHZ2SNLRhX4lzFkimcvjVMDUKCWZp+0dYm2oB8apaJpeszh1T4VJYKKWZ8h7OL5Cvx+YBW1j3beupImdlp4fWF2iYMWVt/N1OfJozPpOoZ4AGXOe3TakN6ufBv/oOcztBww1u07WtlD2AIk8UmMK2DYojq9tes+fO7PF2crglOIuq4wSe6aeG3XdXmch316+av03hgXJr2KAwVWLHeCzmeoRo2PFPwE4oiU90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAY+9bAqTZlo0oWhifuJmxgP3N7dBcC8iWfuDzmEi+8=;
 b=n0JoRzW352SwLKE1uizlCKFI9zVeGcEg+JLuL6CtOK6MYJ+2gCSuApXEFbd6D5irJ7+4eBThtRbwHPVJLWqSwkpwsCoHtR1g5KdRPHp/deoGyyP3rv//HxcgLVs8R8Od8qghzFszvRg+W4S5Ixnijj6/6WzZYk5apH5cujD+PkZbtrYUjE7yvVYuHRigf0wTug12u1p6oWEZf1pJrifjtCBFuo/iaTJw94hbgrdI+n3jG7WxATksl9Bixy1+u+yjRL6wP7C6DFYxYYkHlhjbpxDa6vLZxVpbdr8ELETCouvpd6zQaLpNIqxWNcJ00cXp1UK7Shwe6kyEGsX/bmGGpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAY+9bAqTZlo0oWhifuJmxgP3N7dBcC8iWfuDzmEi+8=;
 b=VTcqvzmGQAJsF2QPfY2aRJN9QO4I7Dxb7IJzWQ6lnvYF4PX1eH7KMSbHEa25QaqMfWbm5GEHMfwlYD8DhZLw2Wek/G+NTXmSyeh+KK+B3TRb9z4FRCABfv7reJvMDllDC4q/pCZJQgtssvZtSwyYo7C62i20Qac/vwB43bJZc8GFCGhsYLonTaSpNfoRw4MutO7ssTFVYmg+9oytF5idRNnuLVCWKiypoZtj/5sYmJItxAJziXIyZgXJLHuiCF18CVqAbrPsjR9DULjeqQbzoO5xAqT7c9rqS/KOIpIZe6AFfsR2iOH0OCQ/tHOmJWnLySYaP818KMK11HYx9FaaRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by AM9P193MB1427.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:304::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 10:23:08 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:23:08 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 3/4] buildhistory: Simplify intercept call sites and drop SSTATEPOSTINSTFUNC usage
Date: Mon,  2 Sep 2024 11:22:39 +0100
Message-Id: <20240902102240.3760442-3-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902102240.3760442-1-pedro.silva.ferreira@criticaltechworks.com>
References: <20240902102240.3760442-1-pedro.silva.ferreira@criticaltechworks.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1ef::18) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|AM9P193MB1427:EE_
X-MS-Office365-Filtering-Correlation-Id: 15408d77-99d3-4af1-931b-08dccb393d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b4TlfnskoEWRO+oNuIOhvN7HSBHACA2CxB6/V+JuqYm+1breWtvitjTx3jP+?=
 =?us-ascii?Q?LuCfzss/GRSWJKHIJ58oQeGbkGbn0epYEXsjAp1gF7iTiQLr/owxfDP8mznJ?=
 =?us-ascii?Q?X8lhTCchIy2aZL5Bk0txNlP+YdWf6rgzWap+UQn70FqlWtxh5M0cLTotQM20?=
 =?us-ascii?Q?hkWUrJkBOxMp/uslIr+C1e0Mad4VblJrREo7NGbxxPv3uq6hU5Uu4FvMlzUT?=
 =?us-ascii?Q?ztD7EbIeQzIJ7kJ+qcXknMRPKSr0231RI/HrguB8p3yu4DYW3FIFWQJJjNfj?=
 =?us-ascii?Q?H79QEcIzMuIYv8JjRUgOCLsm14ODa8eKRpS+4OeDm4VrlXH1/ACXTd+CPqpZ?=
 =?us-ascii?Q?lMLdH0t8oS4s6ihY9xHY1dAk23e9EV3k7qyvnivo7YlzLuUrN3zg/fNUx7FK?=
 =?us-ascii?Q?G6c7OQ/RI9AUqYJRsR00B51cJTvuiHPU+/p8R78SbggESZTS6Xy1kbAV4ENj?=
 =?us-ascii?Q?5fkopwNQuLmRls5Nf2ahKoOPbczQGGtSTCES2vus23Rx3KrLT7515ILUrJCE?=
 =?us-ascii?Q?peCeerh/YpoLO+xKQzHcLXc1JwegcTAb+ueacIjfP79ffSH9h+CAZgOkYgyV?=
 =?us-ascii?Q?AU+SSEMmRjXerKpGv2o2HdFfArwdkrVAE451yFaK8DV5CJYeaWVQv5BfqOkb?=
 =?us-ascii?Q?gpiPap5dCBgOcqOl/hQOEjQMKIA3SCqqd3zB5adNX+nFmBGTA2Xm9ABv0Di4?=
 =?us-ascii?Q?ihDzEe5KY9/RATby4aM473wJbc2ZyFT580qrfKsimG+cLL0qKdLMdpnCoaZ/?=
 =?us-ascii?Q?KmZOS32KNWIpAMY/20Sqwz0vJsaADPnkt8v4xnSlBuBmLc/BKxwFeKBz8er6?=
 =?us-ascii?Q?kYjYGGZ1HOy8XylaPCAeMO8/i2oE+NxTvKGpKKIxY79uA0UPm1rWr2924/fg?=
 =?us-ascii?Q?FCE+7br0muMQZOZFro8NjRiDIS+yjJ52jy2w457S1e/8P5/Nxrou9YKjCR2U?=
 =?us-ascii?Q?aC/6a2b6yTBYTAYiUwAPgbMBQURvGyJ0eqV8G4mLB1LTrP7a4ERIiV55M2D4?=
 =?us-ascii?Q?vt0sFEEGYX+0dkr9UZ8kw5R1V7Pl4HI2cm8t2NoYfhAUhKvAPwuSq1kdn1UD?=
 =?us-ascii?Q?Q5MNJSibq2dMeckGD6PwJqjLPW+n0WwlU+dChl2iEdxqM9WEKc2UyGo94nhz?=
 =?us-ascii?Q?3CJZT0SJd4Vq7Zh90iHGBuDoamCT3ylmB9amr1Iy7D18xjFX0zTG62RBMPxL?=
 =?us-ascii?Q?Cek3AK8buDWHND0dgoALrCZlDTkg/GXmimaBGt1Ct0V4jxLwurmAxNzfq0DD?=
 =?us-ascii?Q?zbPM8fPeZXFwDtQay5LGBX9xfvnemKd4SszyuFlahAgum5Jw8UVihJfz3urk?=
 =?us-ascii?Q?/dOras5OCsMZ6lnh+XaU+1Ysn22iKbWIuMhSrTjM66bO8FJ5WMq+Tv6qfEPa?=
 =?us-ascii?Q?0ThjIJiGYZ1a7oe+xWh5EsWz+UkbWRuFpLopIGzzhKupVN9y3g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M18s5qw2zyIWPjToJ+rrxGgM2cfiXoepocOGPb8AmYCMp+dHzE0nfhg2gyXN?=
 =?us-ascii?Q?3fMjDrjk1OYCR3b2cDmQ8jfEt76pPmx1lKpipwlwXcintJN74XgET9hn53Wg?=
 =?us-ascii?Q?yAp++v7fEkv99g3yXyah6SjE0OHuNN1VcNykABZ7MH/OmgeBZ3QMGTp/u0h0?=
 =?us-ascii?Q?Aa2ZW+z7KHaSyLIVZSBPqypMbyhaJwj02uC/ov3JFu4g4AcaCGCaNy/j1TKb?=
 =?us-ascii?Q?2doGddIbt7rs4Xk0sSIATyKkzU0ROHQhRikEtj7mGH+FtvD/FRyUJ4wzUKCw?=
 =?us-ascii?Q?7Xe4GJdzPIwmDbge4g5CKDsQNDI3F0YWlGPP72lvrkob5lWSJ4fFS1e1ttsK?=
 =?us-ascii?Q?CbQXfKIH+tw58yECSXeCANltMkhDNHN7rReV3G8/odOouBWJI0g/IMdznmjw?=
 =?us-ascii?Q?NXhFii8XAR3qAPSpviWJazw/5SbVVkZwXDxY0L/TAVAakvHaFOIGbu/8rZPA?=
 =?us-ascii?Q?Fir8gnuVRJj90sK2AvduP/oBbrIgmZi+hdWfcaVNDpeaxGohg7QMlimRHddq?=
 =?us-ascii?Q?UmGwPDtoG2aNT0gthpWvOmk77oeQ8pHPxtoy8tfjJu0X5A/gD0ehZ+9hlEiD?=
 =?us-ascii?Q?u05O9qDu3a+pxmfcwI6/Kgr4DlHVKOJMZYMOwqxGtfXczVNCfrgpC4THmo5b?=
 =?us-ascii?Q?ICHOz6WfVxow0+bP60EZgG1kPfUIQYPsbarRG0zAJwW5QgnZi2moYzDJYu/6?=
 =?us-ascii?Q?sx0RPsZeL2js0l77DOYXjdb/XqyhPXDT5XxVDUEuljaWXTWsvJu6zIJ3mMhN?=
 =?us-ascii?Q?x+IV8UiotLhNWt6IM+CqG9TgWNzen9JZtBq09fBiRdATVRXPXZrHR+NmpKE4?=
 =?us-ascii?Q?yvET0C6g5Lj3bOPvcP3REUBS81Y8XECYyZdGNAuScYlJmU7s26p0+No3GdLX?=
 =?us-ascii?Q?XnJPmeWn3sXCNDQBVmaNX295rGxotPFBtPJ2p5mVYeZhvQDTsBPGzg0cM0v3?=
 =?us-ascii?Q?qU3sF715gv0uCJnbl6LV0weV/kY8KVHbarRxzZr7bC7iEubgZq8osHNgTjkS?=
 =?us-ascii?Q?jtXEfxf4JeuDLG2Y8MGarL1Dk9FlHEMPPbIkYCigjetd284xqdUVQ2CWKqFm?=
 =?us-ascii?Q?bKEOdeJhNmsqCefDvgr3qH0cOH5Jhg9QoMb4aYQW88FW3JsUclut3R6BUqiS?=
 =?us-ascii?Q?PvJ1FPsmkdRGlEq+GbEP5IihccdoPYT1r16MuN1KBbOFrD7+amgTgLtDgRnB?=
 =?us-ascii?Q?QyD6Ad9X6dGbFRFJ/eDwoPz2D7NRSIN0W7JI68xoyhSBT0gKoDPfYbZ+krDt?=
 =?us-ascii?Q?qJfDnmcpZt/pTV1zfiLEcLqFvnHhfxthhgeSjxGeCPooubYA0XcHjCVL0S7u?=
 =?us-ascii?Q?jOFHli7/tPjFdvkQZmAQIXbSdLsnmE6VVveXJcW8ucAAQSQ0AkSa4vs4dwDf?=
 =?us-ascii?Q?JNu9jnAJibBwXrYljR654JtiWs8ttXmpqyoQIR/4Otb3+s+0fg9hTkStsi0W?=
 =?us-ascii?Q?OnA4DcGAIo+KwjNBeVRuDYqQh47/W+EUlnmsdtYXSsKvksScOej2+LG9PceA?=
 =?us-ascii?Q?sN0/qdY7fSUoflBw+Cgq5cZ+iB9hY5/RFrGXUNYbtoXlac9TCSQTYF2wI6vH?=
 =?us-ascii?Q?pHEeO6KtVo/F5MUXdq+ekwI+OsD8YiBxmr++Kzn6M2zGRrZ7945BVWNWvNIp?=
 =?us-ascii?Q?nh6RND5wg8egbL+kGlRFIVg=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15408d77-99d3-4af1-931b-08dccb393d8b
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:23:08.6990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8xvOvj01qhW1E4oiZ6w9DhS3JDMrBaWBw39nIvH54UKwTpVbfKmlGkZRu97K01wPEh7+V0vVuqcEwABXWCQ0z9KKe+wVgM50kFkdWMQOA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1427
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204076

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We planned to drop SSTATEPOSTINSTFUNC some time ago with the introduction o=
f
postfuncs. Finally get around to doing that which should make the buildhist=
ory
code a little more readable.

Unfortunately ordering the buildhistory function calls after the sstate one=
s is
difficult without coding that into the sstate class. This patch does that t=
o
ensure everything functions as expected until we can find a better way. Thi=
s is
still likely preferable than the generic sstate postfuncs support since the=
 function
flow is much more readable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8cb5d084199210508a824969eaa69b9271bc9123)
---
 meta/classes/buildhistory.bbclass | 39 +++++++++++++++----------------
 meta/classes/sstate.bbclass       |  5 +++-
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index 8adb44eba5..83993f5752 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -45,11 +45,18 @@ BUILDHISTORY_PUSH_REPO ?=3D ""
 BUILDHISTORY_TAG ?=3D "build"
 BUILDHISTORY_PATH_PREFIX_STRIP ?=3D ""

-SSTATEPOSTINSTFUNCS:append =3D " buildhistory_emit_pkghistory"
-# We want to avoid influencing the signatures of sstate tasks - first the =
function itself:
-sstate_install[vardepsexclude] +=3D "buildhistory_emit_pkghistory"
-# then the value added to SSTATEPOSTINSTFUNCS:
-SSTATEPOSTINSTFUNCS[vardepvalueexclude] .=3D "| buildhistory_emit_pkghisto=
ry"
+# We want to avoid influencing the signatures of the task so use vardepsex=
clude
+do_populate_sysroot[postfuncs] +=3D "buildhistory_emit_sysroot"
+do_populate_sysroot_setscene[postfuncs] +=3D "buildhistory_emit_sysroot"
+do_populate_sysroot[vardepsexclude] +=3D "buildhistory_emit_sysroot"
+
+do_package[postfuncs] +=3D "buildhistory_list_pkg_files"
+do_package_setscene[postfuncs] +=3D "buildhistory_list_pkg_files"
+do_package[vardepsexclude] +=3D "buildhistory_list_pkg_files"
+
+do_packagedata[postfuncs] +=3D "buildhistory_emit_pkghistory"
+do_packagedata_setscene[postfuncs] +=3D "buildhistory_emit_pkghistory"
+do_packagedata[vardepsexclude] +=3D "buildhistory_emit_pkghistory"

 # Similarly for our function that gets the output signatures
 SSTATEPOSTUNPACKFUNCS:append =3D " buildhistory_emit_outputsigs"
@@ -89,27 +96,15 @@ buildhistory_emit_sysroot() {
 # Write out metadata about this package for comparison when writing future=
 packages
 #
 python buildhistory_emit_pkghistory() {
-    if d.getVar('BB_CURRENTTASK') in ['populate_sysroot', 'populate_sysroo=
t_setscene']:
-        bb.build.exec_func("buildhistory_emit_sysroot", d)
-        return 0
-
-    if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
-        return 0
-
-    if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']:
-        # Create files-in-<package-name>.txt files containing a list of fi=
les of each recipe's package
-        bb.build.exec_func("buildhistory_list_pkg_files", d)
-        return 0
-
-    if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_sets=
cene']:
-        return 0
-
     import re
     import json
     import shlex
     import errno
     import shutil

+    if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
+        return 0
+
     pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE')
     oldpkghistdir =3D d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')

@@ -619,6 +614,10 @@ buildhistory_list_files_no_owners() {
 }

 buildhistory_list_pkg_files() {
+       if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'package', '1',=
 '0', d)}" =3D "0" ] ; then
+               return
+       fi
+
        # Create individual files-in-package for each recipe's package
        pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)
        for pkgdir in $pkgdirlist; do
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index dd6cf12920..91d42665c1 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -156,7 +156,10 @@ python () {
     d.setVar('SSTATETASKS', " ".join(unique_tasks))
     for task in unique_tasks:
         d.prependVarFlag(task, 'prefuncs', "sstate_task_prefunc ")
-        d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
+        # Generally sstate should be last, execpt for buildhistory functio=
ns
+        postfuncs =3D (d.getVarFlag(task, 'postfuncs') or "").split()
+        newpostfuncs =3D [p for p in postfuncs if "buildhistory" not in p]=
 + ["sstate_task_postfunc"] + [p for p in postfuncs if "buildhistory" in p]
+        d.setVarFlag(task, 'postfuncs', " ".join(newpostfuncs))
         d.setVarFlag(task, 'network', '1')
         d.setVarFlag(task + "_setscene", 'network', '1')
 }
--
2.34.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

