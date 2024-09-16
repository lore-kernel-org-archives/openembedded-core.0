Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA0CCDD548
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 16:57:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.71])
 by mx.groups.io with SMTP id smtpd.web11.20626.1726678669093856824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 09:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=U3UxfHrJ;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.20.71, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQmNR2lXD8apYFVY8FJbZI2JVHdRh0iOm+UkZoF6y61orZx3aCI4zsncCqfRqKA3ikfwOCL4TcjTgy9LQAEt5ttGhqUlh3kqfvfKxg+7pzNx2yznTTTftsIcsvcHjTUzWRRcCHgFaTVyTJtl+KztihQS2C9S+UtZYEn/74V6Z5b9PB7lHO4Zb9TQtoTppOFBpgLo+76njT5NchIAyozmxUSi1dWqrpRDpCnmQD9Au3sTt48T1N5jqnzOMaQGR9QWYMciuO2GdQU4YDASdVsb5oaUQVDWbKdUi/AA9SHfZtiJf6HVZrDQiLbOgx5lKfrW780ii/vw2OrF8Y10Z0VFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z0tL4oDzGOx7XCaFAXMZO/Q0tpa4Avd/nZ2f/S3jrs=;
 b=d/iLsXldRafp8o8O1HE4x6kUHDwHEXTV4DhEKi0vc2xZlpz0Uzb0mUAVCO9t6194zM2Jw/ACodsZtkPRUpVWGNg7KwSZklO8Wb5zFVfN/k4GsWEgS80g+/2rw55xZ20uX+HDbowKqVp0pgjOoQysy0TJdBPgvd6YVaIP1JpVB4ARpeAaPXhk5ETLAeCDoyP/eFpU+XHjIymOzPmo3j0/JZACHMojra3AjtaBF5qYw37kCfwR++VrCni4fgczsuy4KiZ1Zpo1/QPLcNEg9nL2KZFSnsjErG48Z+Hi0fr1yXFDApTZ9JEMdN1xuCRmT8yfK1L8xwK7jfQS9m2YgWyM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z0tL4oDzGOx7XCaFAXMZO/Q0tpa4Avd/nZ2f/S3jrs=;
 b=U3UxfHrJFCHCEMX7FMb+9i3qrq5EHJwHjcgmDwlksxJgsZYi+FNubqNuMfTa+SLHRUUADTxnTe2FBmpbyBoGuTnWqo+tzjVbJQ8FFjEkAIdF7GL+PiYgwAvu17zjhpp6tFsgskBcg6Z7cvl6sfvgwSyJVQaPWZsfWc6xxnjNf2OFgOxmrKXUSF/LEgLNYphH/WOcWRgKOhg31rSehFI8G7fW9nOUaNNppPIJZOWM+vyEePQIFCSJb9ys3Gd4NKe0HVgZyhaa2TaY1FG7Ra19PKXS7X/gmb8nkwz5UciGROJCvgO3uc8v3FteKqzZvh9FHgDyTkNZPiSxL4ul+fO3fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by AS8P193MB2030.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:40d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 16:57:45 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 16:57:45 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH v2 3/3] buildhistory: Simplify intercept call sites and drop SSTATEPOSTINSTFUNC usage
Date: Mon, 16 Sep 2024 08:13:03 +0100
Message-Id: <20240916071303.2831698-3-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916071303.2831698-1-pedro.silva.ferreira@criticaltechworks.com>
References: <20240916071303.2831698-1-pedro.silva.ferreira@criticaltechworks.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0266.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:375::6) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|AS8P193MB2030:EE_
X-MS-Office365-Filtering-Correlation-Id: 843ebe2a-fd11-4b90-8078-08dcd80304e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DKIBb1FuN9cscSs+/r7uutii8oAXVQkQdjP4fA1v89Jx8dCGBWkC6Fc3Rw+f?=
 =?us-ascii?Q?64Hq4/8yzV2YAk0HhvH4XV4ug0jWYouuDNuS1uC6WXsaFzrgkCowEoh5bFz6?=
 =?us-ascii?Q?Kth7RnTAQr7MJKi53/wKYJmkGVy0Z3LbIwVIn3Xu3rUqkTd8Qxq1izccI/rn?=
 =?us-ascii?Q?qqk/OTd58LHYDU0fv8iIxNchzDn3brI1NQpV4TgfM/XQORm5Dpoki+U7RQws?=
 =?us-ascii?Q?Ja/JNXyYLbgCkI8FhrQtRZXvaY7rUgpm/G8AW9gdpbxUF1t/tjN87xmqIqEJ?=
 =?us-ascii?Q?M/uSg2g/E4Ct6Np2x77gf0ZlNmbbbzZezaYr4XXLqqpBJmUah0DG34xOSZBF?=
 =?us-ascii?Q?Zayf24+M7B74/42m5FRLJmyfyIRkjgaR6ubw8whfdEb9Ho7GngEglZUiW4fd?=
 =?us-ascii?Q?+Z0iKwgq5PvBSm5PqlYFtvGTrvky6GWSqHKcE7eK0e4lkjjFD28kLEYlmJpB?=
 =?us-ascii?Q?sbwa0zIWj8BnuTuyZ7hcSE9opwTZslJijM+9tCdo1jT2ENUck9y6B8E/p6nI?=
 =?us-ascii?Q?jf9DF4TtpppnZukLntks7LVQi714dY+2/0CXT7a6TPPwsgjWq13rVAzNx6qo?=
 =?us-ascii?Q?kwmobxCxyNB8LfFwt5aTS+PGGKfhfAHpZW5mUi0K4hU10MbKqVEPQX3twWx5?=
 =?us-ascii?Q?bT1rrxRpan3NFEUV+AufOFuhkDHCBf/7AMpntpD3sMlzLWYJ4rl56JzHg9rL?=
 =?us-ascii?Q?RVEC12lgIorPGHw+rdBOiK5gMDtQESg4IOc0mj62fKLPLxufJe5vkaq3FHTA?=
 =?us-ascii?Q?OvZkT8wZwO3UmKlzqxpqePbaUHHwmgjAdjY+XUH20LjeuOigHMQqYJfefzYf?=
 =?us-ascii?Q?rhkB9MqDBBKTjxWIPsu1SAmIUQ58mtxWygAab/GTOLMV9gqivB4YwePMK5Tn?=
 =?us-ascii?Q?UGL/gkALxDvoDSN0IaiPGPEnWVIw88fkYEOG/hRDwGbu/0x8E0ltITw3EFA0?=
 =?us-ascii?Q?33k2WNpWxqlWgdV7+ctETNd54f2Bia/yfeVVJeiKUbt3P3Y2fdglSZ9umv/0?=
 =?us-ascii?Q?UhJ972g25Gy9FpkgiArRQwTyOE6oNfeiIwO/hgUHg4AFWD4ikAkGXqKeUTcf?=
 =?us-ascii?Q?R6620JLXPDkFSbACaLlBPrAcj+WmCn5O2HZlkh3IgKhw+HOsX7n8O0X/dQxm?=
 =?us-ascii?Q?z0TVnmkLMRCfSQ41WwziTDYE7jw4vSZcbYbgLM5eBeFKHWBZe+oNgM8PYgFq?=
 =?us-ascii?Q?+W1l8XopTY9/rsjTKmJIzPmZcffBkxIpfglOn6Tm+Mk72z3zr/8UUvoZdLlH?=
 =?us-ascii?Q?YHw2r1quMUQongSgM03tx1B2Bj08J1+dXWcpqW20J/pS9FITpbgYtNJ58Ruk?=
 =?us-ascii?Q?ZU4cEv2kvP429SrWzhWCU8uFt2FOC6NFUPjcD65C7uXTwGXFxTVQFbBqMThr?=
 =?us-ascii?Q?lkdyfG3HYmbCX4y2sHMJIJc/nz6T1h3T3awfHSQFWU+BTLA6wQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D2wAV+sPnwsfpp+S+FJNXa3JLJpgf5TOtOxXOpDaCl6lwwjnFZIVslYStRPJ?=
 =?us-ascii?Q?f4f8z8qEFwjikHwfSgAbmcgEcVjc7tv4wljGBEI2Y5yW7q00tK06NMsM1KhD?=
 =?us-ascii?Q?tCdbYFMnXH09vh3ovKduDld4I6KpVQxEiwc8ptpu4OGrJbPl+qB1c3Uht6GV?=
 =?us-ascii?Q?Z0rc9fh5mkuYcbfhjqmFq1l8kURH+zb+GOmB/zS3FupWyJe/EsFR/ksguseK?=
 =?us-ascii?Q?91kOe6VXZmux5wbUpytSv6AcH3GXcIK1RV7tQuC4rP+W+xI5WybIxmpEy9yW?=
 =?us-ascii?Q?EVHjvgPdH9aUFBvztyCDzJz/m534U5FSxAqTcA2UYqFeGsb84PFIcuGjAqY1?=
 =?us-ascii?Q?b/Y3fqE7WhlOog6Kv0KHAca9d/Bml7/HBOKQ5dPS6CP6Gi1EsSHiIF/8Gvms?=
 =?us-ascii?Q?WAdVagkAU1wijY80fnfGgbSHdTMAWxZo3z5vZsg03MMruJXCZJb+J3gKqN87?=
 =?us-ascii?Q?PQhD0wUulhNB/aq8lZOo0ZLessvsdN9s7TDsaOH+RNBupVvgtag9wvrNmtE2?=
 =?us-ascii?Q?yWq5lpbvMmduFVk7QyZeuej4aMoW+JAdIvCeNcKBnOgCjiB4siO2V3+KIwl0?=
 =?us-ascii?Q?On/ZU/w9HR+6inesEtZoni9X0SWSVKAKsEuCZ+fr+l7oxv2/TW/vr4cupp+1?=
 =?us-ascii?Q?0Xm4ueItszPyxCOT13sgW+kzUCLXxL1BJ1jTn13QyR7uOiaZizoWW7Nu8Qh9?=
 =?us-ascii?Q?Z4oh9LQjUpKXPJRYyRh2xGceIsdYi5GH3gUHGkX2dcFdLVYnbgDL7z8ge0sw?=
 =?us-ascii?Q?GLo2PA03SJch0pJYOplGUcKvY1bm268eeJw2VsRGP6SQ/FkXQLnOxcBxEOWe?=
 =?us-ascii?Q?ZJkZ9kiGhJ++Spw9ec5809jTNLK5bXPcC4BdZak9MNvcEn5k5TwGfxTihEXc?=
 =?us-ascii?Q?pkKUGF5HlFl7d8zy9YFm+OzNf52KscszhrVVbVhftT09IvAclAesem63vkI7?=
 =?us-ascii?Q?IbJy8byRMYc1e4i33Kaojy14gGW+NTwekR8o9YfE37KiKXpcotLGliveU0wt?=
 =?us-ascii?Q?T1J5NvCD4Y5jd1VtaAIf3rhKUfLo/f9j6BFudygK0Dj/5vMLvepMYREeEPP5?=
 =?us-ascii?Q?iQuVwf9XG6sIytStv54CHl5c6h2q1oTw5Ce3wOulMBkw+HSSzqDUFMrxK9vU?=
 =?us-ascii?Q?2D++nLSSUeP6DyWdH+Yhm+wi3dag7NbTq5s1Ep24EpPFsrk5jkNpmJi9AwT3?=
 =?us-ascii?Q?zyUH2ndyBKn/INIkOrZ3u4que5siJWce7yW/4MLpCDgnmYWCi+22byssr8jC?=
 =?us-ascii?Q?4KGroxVL7aqGm74QCl3yz05BXrxrj7dIzhoPf/abFsUNI2SVwhFDYcv2xWTs?=
 =?us-ascii?Q?IOjm27XUjNMsuw9EEGcvhP+g/PFZbkmJ7LXeWiMwbeF8y6LGyAoa+vf9Er/G?=
 =?us-ascii?Q?tGi/oxvm5Z94omt7hLTWlcbbxwdQn/wBfESCP1qu2k/eeuXlPdnjJ7+SLyJx?=
 =?us-ascii?Q?KqYW9rK9+BgzqdA+bGD2mIfZRgeUI+cZh47RQAV7LsWbH5HTreUmz2+i0IfS?=
 =?us-ascii?Q?2NlVuP/EbsIUprJnrz4+MYR9cMoiMlv9SH5/LJbCBjSptzmpXvNgQfb1hCHn?=
 =?us-ascii?Q?9SV/Z1I1RhYypWm75kWeWymIOyfgrGqSr/de/eL9KzhHIk8KFZGIV8hihAAA?=
 =?us-ascii?Q?XGDml/QWTOAfrucgY+9hjcQ=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 843ebe2a-fd11-4b90-8078-08dcd80304e1
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 16:57:45.9057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PqAMNBD9iEgKnAvyjrMPQvGDOCWP1i5kl6HeNfGKBstkLfRecp1+KhuHv8rEuHK3coRc4mKsyCY6lls9a3Ggv92qXPcRuuqK90pWiFyQFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB2030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 16:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204649

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
(cherry picked from commit c9e2a8fa2f0305ef1247ec405555612326f798f8)
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

