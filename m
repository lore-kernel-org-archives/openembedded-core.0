Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621A3CD342A
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:32:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web10.35607.1725273122732170815
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=CRKREcDp;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.22.84, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPOADPT2DbvanvuyeoH5kYVSXTwIpNkR712LqKevND5tRZFDk+no+b7IoOMgb/cDQ3Ie0EAnjP/1KVeJToI3p2VjLqIgGbBbvHMFmunrOimjBj/6i2mlquDzPI2IliKvxcuNGGOnRS4pU5KnWgc7r38iT3n3F9Ec0yRj48s7cYgqLVLa+EkyVEBvyDF0yz+N9Khnpku2p/l1bCBzSsO7qbaRmmJHs+8BG2lzetWFUkFqvsxmpnlUBJ1/BiL2VGiuKYlecL0OePaJO+BzsQkTiV0KTqvRzTIT0+mNliwkit2ofeLMBm6l8/JOzBrZPWaB07y3BPX5DhxP24jC4nu+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tp/YyWRxW2yhZAhJfN7XXC/eOWwvKxNJYq7V3RsUOs=;
 b=yt/8o5qSdUFVi7rn6MnE8Zjuek/j9PXE3InnizAruze+uGDGz6r6JDsBP00DbZko1eTz5uExNuvCOHwHtigqkpwOj5CySnpiEZjnMBFqwUGaXN+EZgXi2zytXRF6zMQy3/GX5I3kpeWnrsp+L3ddmPcncm7U2ojDDoSITAFZTdHKIxjoBmxzpIKx16pvVmLIJ9z+tAvZYGOIjWAaAWml28yJY9Zapwe1otXUJ6UcfqtAOBsWUn796aW0lAkDiMS+/i7gRlNRmh7/UGDgviGU8ZJrEi8jyRVsJMkyQg7izMRN6gBXaZWnmQhNuMan23ub2rQ9r4eC9pPyLRHgImAtwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tp/YyWRxW2yhZAhJfN7XXC/eOWwvKxNJYq7V3RsUOs=;
 b=CRKREcDpEtsYYzQlMkxDE4eZ+qBzqzEdfVDTgD0D9UDYSJJuOQoCj74dglciMb9J/Y+f3A+TZ5tW0VrXxQF+1AXkmfsCFkpK3Ip9Tqer9SgpdNoVClbKe0J5BszHxMlam1o80q/7xBISXozhlMXt/NoAIlFIjWwblSXyGQZsHyAc6ZyU8syLFYtpatDkeX2dZWQXUrjCYEghA15njYDBCkw0IqFGKVk/tO31/Ps8juvI6NX1qDIG6NpRA8Tnoxq2ESrRwjCF9LMT9x2XRLd8rdS8yj54xiPFPd5KFaCMkIZbmskKWM1ceoViXCE3FF8l1YsYjRANcoMSTSJYYK6ieA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by DBAP193MB0890.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 10:32:00 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:32:00 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 3/4] buildhistory: Simplify intercept call sites and drop SSTATEPOSTINSTFUNC usage
Date: Mon,  2 Sep 2024 11:31:47 +0100
Message-Id: <20240902103148.3762538-3-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902103148.3762538-1-pedro.silva.ferreira@criticaltechworks.com>
References: <20240902103148.3762538-1-pedro.silva.ferreira@criticaltechworks.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0502.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3da::27) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|DBAP193MB0890:EE_
X-MS-Office365-Filtering-Correlation-Id: 759d2b23-7e6b-494a-10cd-08dccb3a7890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Bv4FZLurhdfL7l5hw4dA7DVwsPzS1PazodOe6unZjNovJ8oHL/tq2T9LHzMT?=
 =?us-ascii?Q?Oo1+PrJIEQwvJJ64xGHyr4OL28uLRHVTRdvFfk+jE5aYw3L7dXej+IkpOGBX?=
 =?us-ascii?Q?YPLR7yUhO3Vv6XGJL5TCioY9e2cpiocO00DarOgT+iCtxBJ0UaErnteaUHYS?=
 =?us-ascii?Q?dD4XHSXef5LsKIv/kleXgS3vUovCn+fLuiWySq/sfxEyKKmh9shlSVupC39B?=
 =?us-ascii?Q?YfXRjUNGhD/Pd7eNdIWn4SCj3zS7e94jc/pbsD+rFb90n/WLEZrRNTr9gpRw?=
 =?us-ascii?Q?DFDP8OcRyGFFaYFnBJfqvuj0tJ0p//+E1rDdT9hdV6dcmhhZr82PLi0jt3wJ?=
 =?us-ascii?Q?eDkVE822CCMpy7rhr5WxXd+E+o00TbKkEpBpU9x7rT1t7xTI0a+fnFdNsI22?=
 =?us-ascii?Q?G3cLSFprdaMzqYkYHWs3llKHgXkx5D7a4E5VupLKMFxjhJ//RDRN+puf+t1+?=
 =?us-ascii?Q?xQJwHyJNUuip1S9A457P9CPpp4pK8BrlW7LSsrJLMolUdLOVWIzZzF+YRIBy?=
 =?us-ascii?Q?MKLMjqGFGDFWHDX4fEncyVkYfkiFF6Eaa407O4w7j9xtIjjVU2wO0eC5oHTJ?=
 =?us-ascii?Q?IjNt99F7S2mjuXWI7XJs1N93dH8rc16w8a33q0j84tZEGfgJKw8oNuETXlZD?=
 =?us-ascii?Q?r50kx/F4RQEO6CGLIKWWOfPEjwXxsWikaLgWql9fGbWlTYL2nHWrdnkg0VYE?=
 =?us-ascii?Q?SrHQPw8XVGdcd3fJt1UqLIzzwBRM+Pq4LoIag6TWUfBUYrkWYC6umhgN2waR?=
 =?us-ascii?Q?XSAmxdif3r/3M3QBuc702OQEV1J+FhYZAEy3MY4WxXl7XSTNTyUW5dW7JOLz?=
 =?us-ascii?Q?uwY8/K4rynTTvJgUz3pDCPih+H5etj0J6dCCvzHxqZ+P8RmwzB6tgMTHwfHx?=
 =?us-ascii?Q?goIAw8JDGLo4g7HMU081QxZKIxRjefR3wmDR0QTB2inzSEXpgD/zZARvQtA/?=
 =?us-ascii?Q?mBQlXgwAsJAE5OmAA3iQukJ/cT4ve6ReLEfrP2aqPqDoFfnftsMe+Qjwez5O?=
 =?us-ascii?Q?FjshQAyRjQkZedktXTQ2Sa0FfKsM182nUXJ9DtHpVsCFA1g2I3VKKHIdeLaI?=
 =?us-ascii?Q?kSKYPmFbWi+YHcXFKilQzRVdiQQ+R7nuFfZifnQLkPjHgHXoR6CpwcO9Nu7/?=
 =?us-ascii?Q?cUbHMW0DGvQioCZfGYODO3/C2lsB4U1nzTLJ9zcezwEpr/bldKSbDPYphGmt?=
 =?us-ascii?Q?qzd212xMA32oVkYbG/i5K4IRoUmB1xZVsB/15oDryWavStr882hRPEOr3Usq?=
 =?us-ascii?Q?G4TqbjBVBsVwhGsTv7Z9kq+Px7yHV0+9z714bv13hyeBLRRKsgfhFqYL2cOS?=
 =?us-ascii?Q?FwfH8STsUqU4sBZ06kXM3LlN7sZhhelFRBwe8TQDCmQWh7mGuMlq/1T9RXQm?=
 =?us-ascii?Q?s51og53jXzXFwc9/sWQBggprrqzWxpghqCkyCslckCFkKYiSoQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tGI/1u7Ma48yXtaoBQaO4gk7vSXs+XrA8f9ZDD6Bl35bAEewcjzyGqKPDvqL?=
 =?us-ascii?Q?UHlqDPDLkSJsyO6YwdE6d7m4p6WudwiCSGzx7e5zVQF/DKmK4j3/so6ZBc76?=
 =?us-ascii?Q?/GVSFB2u5bvpFhExrzQj7qdsK24/th4JJNDMkHFiTNFWCX/082RloUTo60L/?=
 =?us-ascii?Q?taR/Xz+HbAJEvG23XkZPkBHKjFj+NZHD7B810ZPHCZCADZGI31Km2VIs45hy?=
 =?us-ascii?Q?tWsBPjMTiYcjz3PhGJQM0lBmgGpJqN2cpG7B6jGHbgRJWRVedAmCBvCDORkv?=
 =?us-ascii?Q?IOLmqK7L9nhsHBmNkYB6/NCA9ge94MMo+7qsUNmQolQBvxupaKE/5uIWZGCJ?=
 =?us-ascii?Q?wPcgMm5DC8oe9cI+1W38r7pVpH1hqggldQo5x2DDL4yIRsZ4xsYJ/jrQ087Q?=
 =?us-ascii?Q?fuKgOn9I+51W7BUdwOYhakG0qY41X2AMMsQWrmpEgZhI25awQYz4erWOXQls?=
 =?us-ascii?Q?kLxuIpx2bkjZQGFU0zPN/ujqDKq8VJOAaFfh5ES2stpo7319RMbU4GzYcgBq?=
 =?us-ascii?Q?impQvN78htFafobmVXPbjvT7VO8SB7LHjAlFHz/0jRYJbu44SPjwA1LfpzKs?=
 =?us-ascii?Q?paF0vJRDxzSnKnGwYY8jvH7ZSoSv0DkWAvEO62HzJJ4nGb6TLKq28NA4DUki?=
 =?us-ascii?Q?LgKw8XZYF0Vza7iqpHUTARCcnR9rtQufhNPI/nAcMtAT2bBjLXSx0myHdpkr?=
 =?us-ascii?Q?0LEN3FPQsvMZLKOnhebf+L7nizUWqQD+wa4YBDx0NGZAjvQfVan/r20C5b6n?=
 =?us-ascii?Q?jRYYKlLaUu7oMt5nfawRWIB910wil2glgUwfap7pWN2p5cKDiYA2FCZjJKAW?=
 =?us-ascii?Q?aYj2bEuu7gPMuKVR7/0G7dtRVGrKXsUDriJfjUpDu8JabGHaNP7I9aaAqxSn?=
 =?us-ascii?Q?u6Ngv8Ybl8gdaExqrlsQQ4oA5NhAAy4KGAQjVs0uoej5ZlPC8WYfYIfKa31u?=
 =?us-ascii?Q?MnIPBjFdG922vHWhAxFqc8zMSbGkeb//4QTIpn+wHtSnRRrgMEzq3K5kh8Uj?=
 =?us-ascii?Q?z34bxcun1lL1GOjyabsMmVbO5jyVXMhK2KMwWFHUj+LpLDpTzZgjF2ozs+pp?=
 =?us-ascii?Q?CHGGPcFVBXA5ijOgSMU9pRRvy6hRLrtcG+KZAGWsAIMEfLQT/cyrOqnvLdkh?=
 =?us-ascii?Q?SDiW00qIExBm4tr4m949eNROD+cbsNoiyjXzWeiiJY3wyeG7iYGo0xKdFWz/?=
 =?us-ascii?Q?tTK7g2/S17ALOV09YWJz5h8baSeX0LLBT7lwKrkzNgZ82snzRyb9U0+15tKQ?=
 =?us-ascii?Q?OLaxZtVRtZCZgAOQxXxYGpi4GWU6rks0o20bq5/gmZ9Aq+ogv/ULH36k1RaU?=
 =?us-ascii?Q?9WkAdFJf/VbgK00oHWcW2fVphUVH1PGxgU2p6TT1UJx3N+9HhsJTwJzxLGOV?=
 =?us-ascii?Q?67Dq2NQQI43IUV3splIkMlIPQbGCkyhR+NMA6ZhRluwPgXxVUS62W0tassWs?=
 =?us-ascii?Q?ZFaZH5D632C7CsVmljF79NiavlnsINfYJkVyOrqhM81VhByh2BPkTCPtmuov?=
 =?us-ascii?Q?O3gjUrXX1M1Li/V0qZ9+BBtEL74Uooj5rTowHA9kvYe+D0db4lF97/6BM2FF?=
 =?us-ascii?Q?uwJqHHz0JsqVqJHHjjcJR1VJQfDZXivM9IOVZ/GTS8Ay1vsNEIAVyKJjPFRk?=
 =?us-ascii?Q?Ca+DhjJXNkKLSSiyf8faOdE=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 759d2b23-7e6b-494a-10cd-08dccb3a7890
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:31:57.1789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3V9PM4PilMv7G7+b4wb+zvgmSdnflCElw8UFXUGQez931oaxFQWrdevD+m3HUWvsMAPG9xo0jRY9u//glNRqt/X2wQWxgprlO/nygP6EuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP193MB0890
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204082

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
---
 meta/classes-global/sstate.bbclass |  5 +++-
 meta/classes/buildhistory.bbclass  | 39 +++++++++++++++---------------
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 76a7b59636..93df5fa9e6 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -161,7 +161,10 @@ python () {
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
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index 08970aafea..0b1bd518fe 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -47,11 +47,18 @@ BUILDHISTORY_PUSH_REPO ?=3D ""
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
@@ -91,27 +98,15 @@ buildhistory_emit_sysroot() {
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

@@ -621,6 +616,10 @@ buildhistory_list_files_no_owners() {
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

