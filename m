Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A838CDD54E
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 17:00:59 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.44])
 by mx.groups.io with SMTP id smtpd.web10.20693.1726678850529329324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 10:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=W0mCA6Ee;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.105.44, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAA8MkdYgHsYwSekm5+0PtpjBFve94D+z4KlHTXThAXBPwGVXCLpPxwvM9JFzPIn9yYGQ+3X7VzS/dw+mUzVX4OJEqTWshH1eJUjTeRYVb5ym01S09YaV/vqZsUvep6ioEWPVEG+b6oXpkMbD4x5HmPPlyamZKCwA5jph5owj34cCbPEFhY27lhbgFLFTZdla9GMA5KTe0FgVyeCGaqa159QzdnVRoiSnbXlUighqWeRt3Eokn7AJwEsihq/4RQ/9VnCTdV+ywY2q0aLTMbtZY0Xd1QsWqzND5qC1qTN0g7HDw+UCuxWrAJ6xAKA1PdQNzQQdTX3BWF+bFYtxoPxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFr1b7RmfolQW2g/Gr7I6xLFLbvJhYPuwcpu3aKBH3E=;
 b=ZlLytK7zQfpEwqT+BI+H0kZaQVuiUE+Yn6KJEFYjbxXRzZRdJUHPnXfIXpJPv0TyU6COOMl8OBOcC5cxbXBi6yOO9EDRDsZY9M3k5S92gR/bFvs+qCiWfJ4C+P0K0sPqcSn+KQltNYB+Kz//o59YCOKYnm16O5Mb209/lpxJE2eroraPT+F3RYEAeRubENxrGZGQUUvAwLqI7qHL6mOg8iS3HuXbCNV6CEO0P0L/lNl6MpIkz0MYaGNsQ5L3uiUV+iLFWAXnU8mnKuujDCtB1JzqJxUM9Zwg6f08UxicIAY/iE0F0AxEdGmiar3oZd3kF5CYCoZqOhjBN8hmRn3BZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFr1b7RmfolQW2g/Gr7I6xLFLbvJhYPuwcpu3aKBH3E=;
 b=W0mCA6Ee0G2k9gMgJ/E0+P/PAjJvjl16A7JmE+A5yvBqiDl2/qzMd9udjsSzxjuv/3Ab9/GN5atT1rQvqAnuwlgFwTlXmeHs6QASW4XOhiuvBKQZqqhSw0u+FdkadNt1tjG/DCLsZ3CImgGhfibjFzNO+3J2m3rJLccbxg9cghIfs2myDFeRvmFENeXfNKfy+3tXCiJvrAyrtaLqGjFN9jq3MlbTZAa0IyIRsTWFXbvr6TqWU+hfqS9BHn8eZYZUTZVt7fbxVsR5OTz5kEdYi38YeIXU07zzOXVhVIFZj0ZJ/9+lXyfCUwbOtkmrljOvIsgUoxhnGWTpi9p9tPTG3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by PAXP193MB1278.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:156::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 17:00:46 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 17:00:46 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v2 3/3] buildhistory: Simplify intercept call sites and drop SSTATEPOSTINSTFUNC usage
Date: Mon, 16 Sep 2024 08:16:20 +0100
Message-Id: <20240916071620.2831989-3-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916071620.2831989-1-pedro.silva.ferreira@criticaltechworks.com>
References: <20240916071620.2831989-1-pedro.silva.ferreira@criticaltechworks.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::10) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|PAXP193MB1278:EE_
X-MS-Office365-Filtering-Correlation-Id: 742c505d-1dc4-4ea5-2a7f-08dcd8037058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I1T0ZB9oRGuCv7iHR2dV6L+m7bi655CaY7z+jNNLyHvsNePX+xd5CYJNkYpp?=
 =?us-ascii?Q?HJiBHI5UmFux5Vb90VTRk/qRrf2Y5zehY4Dd7y7TMqRru11hAjzWFe9akVAO?=
 =?us-ascii?Q?beqsw0M9NKgooEDBP5lwXWLXpND+9CfAqXYGWle54V4+1pyV+0FtFvKIzF6Y?=
 =?us-ascii?Q?Lm6+flDjLA5V9RrdR1PYVLF9FjNx8B7WboTHSUbsx4yOsvK+zZNZBi+lyLnj?=
 =?us-ascii?Q?R8J/Fxlf4Oy3bnXLbrB9QheHrD8kUqbJPzZHuC08zD0wxXovXg2cRHJmc3uL?=
 =?us-ascii?Q?otE/VshdCM9l2J/5lIgZN3F3KG5E1VazZg/VsnZVgmT1FtOB4xV6WpjAkKcx?=
 =?us-ascii?Q?uXWbZyxjmBNe1N0TZvAd2CKvdljfh+kiWmV8ftAoIm0/qMkmREzAtjmhGrP1?=
 =?us-ascii?Q?ptR2WKhwygVI7ZLEsKmKghNqvt7Ws6kFeS5mBmuX2nKxDLLdQ7x89fdqjwtf?=
 =?us-ascii?Q?xlh0FO6r+MzXv0yDkq54dJ4uxpH7kSEmcCBC4bC1gIa0VT0RXbt763i0gRXt?=
 =?us-ascii?Q?NI52uR7ZQ214X9SOdIZV1HT1AZeelZCWvEfmgcx62fUIQ1Q6xM9zxmCQFWhp?=
 =?us-ascii?Q?/d0hoT0ypDu7JUqaX2VyWqA1SlXeo0qi3cZGYyOq+Tt9vV8wLdOnxeqKowZb?=
 =?us-ascii?Q?OnXkzDRLHyHEMck8K9cNJqpFWtF+3FHAsNfoGgqElv+KKdFAKtYRRCbt5im6?=
 =?us-ascii?Q?vi2Uhgxo6Qa/eU3zx/mPxUVKSbn4SbJZ3N6mpxSoFF3oe+Gmv5wJNTdFfxh9?=
 =?us-ascii?Q?2kx5VDgdH0caQGu4O3zXaaeUyI4JFzJpPyggRXHto1xMJcq7U4+AQX9AYXPN?=
 =?us-ascii?Q?Z3WQD1k01lfAqu6DXrkjmK/EnKni39kjrLoCQmjX8p0I3kyFtuN+vJWxoSWN?=
 =?us-ascii?Q?rXxlR8uscSYjWMzhfkj/Z/O4MebRHR84WKKcXztzS5p+EGI6MMxLsK+7iqaG?=
 =?us-ascii?Q?IWnhymSKZ91Qb9ieqRLaTz7JcqG5VkFdTjShgFN0lnt7fC+pN8V34e/+/c69?=
 =?us-ascii?Q?xSgp3FXQsxQXdROONeSFKvHGqWvX+Nmy21UVTLKVdTbNmr5wz6NpmXXs1a94?=
 =?us-ascii?Q?boE3cGlbRDAyS35vOm8j70IkJBU9NH+UqAHa/2moow4I9Ut+ZotdOdm4aO0y?=
 =?us-ascii?Q?cADzwO33IGeXlPjgUJnTJY4WYVj8sy+jzb1PP0wT++wDGTXleMWfP2EmnsR0?=
 =?us-ascii?Q?dxeRukKEU000wvJlbKdHg3Q5V/J/tXVHedmBr4RD+jachDak5KBtwUsxm7PW?=
 =?us-ascii?Q?oTgSUP8ktL2LJYWH13LhR7h0/n7ef9C77EznqVpdkQ8+l3WD76QXrAsy9ed5?=
 =?us-ascii?Q?dDDqU7RPU90aruFTjpxb07p8UBDgb3PbRd2T/O1kAAw1eFfYj/I5LcAMBfJx?=
 =?us-ascii?Q?kY76vmtkMhAfhmCr0WTknSOld15Iv63w//bMUBhqXd4TkH9JpA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?09ott2Lw15g+rWg9kuRi25xVlD6adpHjex/a2HULxaPk8FheySpGshy+1Rqi?=
 =?us-ascii?Q?PqjoxO7KhhM9wgAUqHuDxOLyrDUbldtrJ96QcHEYDdSFZ/KXjRHrlpHQ3h5X?=
 =?us-ascii?Q?tQsZCOVfcZVCwKFBUgVwTl+F/lVULgm6NRSgodVv1p9t0KrGcjRRkeWbXlyy?=
 =?us-ascii?Q?WioTmmpGn2PUHesyqbOv3V9DSK+buhQoD4DSWxxXpzYFBNMDYoUDiy/3h95T?=
 =?us-ascii?Q?up3Sk+R0vkLBhxIY4+81facRvYuT1eGSY3qBxvkEAQ1hFjwVYb570ULqvIVK?=
 =?us-ascii?Q?+aNhFnVFh6E9R1HoCV7NtNrpYPa0I3HwIP1Ph89LYTSi5Juy6cIUyMYfwyE2?=
 =?us-ascii?Q?Hp3YtyXpljiQvGb4GgITkeXDwjrCAAyPcyPE/6Hk96rhlVudKy5pOfRj0fFR?=
 =?us-ascii?Q?Pz0O7tt6XvoguJ1lcbfwcdR+AZB5yhmI52m6EHHXHGLvnrXhp/zbXwmlvVXg?=
 =?us-ascii?Q?+byW/q0mT2MDEqBbPvMFo/l6WcZXocUckbnxw1yKVyBepPum/MlijsAdA96T?=
 =?us-ascii?Q?/WYuzfwQIh/wuEvzcpXdedrq7Ejdgu6Ii7PU0r4PaqKVD4pdwBLJst3z88Rp?=
 =?us-ascii?Q?pS1YZmfEmQ/lEVLLwifX2FYbmiYCd42MLqqAJlg4CH0/8mBBvPdxTcGoVM3T?=
 =?us-ascii?Q?VsuGzIZ8RCLcrOHDazB+e1AdrNqHidh8xrFRlOpaioCM3wBYhcGcOWse43C3?=
 =?us-ascii?Q?n7E905p0Wcz9d5P9fUpSwm+PSFB6FGdV47NJzJ5mesbCZ1a2Wb75eUP2IocQ?=
 =?us-ascii?Q?HXXMZHllSUyp3v3pXz6NT3ZvaPiF9GEpx+ZF0ufpz2BvUABoEkI8cC5Jz5lk?=
 =?us-ascii?Q?0PKFluCEAxnYTdYPfSMaoIH7Di0igjduaROhzONEbjlSngTFcpZf9yrWErfn?=
 =?us-ascii?Q?xnq+5CauKFqrmk6cW6fmpImduHu67Ietlhuf9YTyM7IhNme5LsrUEk7MIP1e?=
 =?us-ascii?Q?WPbRWwPoXUeImEDPuybruejGCo6QojYfPbNiNG2LE2bzCwpUNfAOWE3SJ38J?=
 =?us-ascii?Q?8XKpfVOXAHd/X/aJ2GwPxUKcSrNTVo6JBeXHbCKImuCG9hfkKjkg+4IVLiy9?=
 =?us-ascii?Q?lQGD2AIsLJg9AK+xLVNMDNFt64tauB0q+jztUYvrrzTkX93PkuGgQ1JT6DJP?=
 =?us-ascii?Q?COsXqtA/69sdtI9XdjtsdxlPRPnnyUL3vw/8QMqt50SfyurS6nXCRG0GZVHw?=
 =?us-ascii?Q?oBPulm1SZnA4/6XnfwsYDX+UPAqc+EsyNt8njTkJdNsMNtI29gMzWHNF9yPs?=
 =?us-ascii?Q?BaLgaBIu1iNZ6gI6brTHG6ZwAzi8ob6GktkXMBdJLXoy6Psyr2Y8ZJv2m3C9?=
 =?us-ascii?Q?pvFK3HbJBrAaCnLBoP0DoGuLovOk5TYDloXzIArTeDPKKgnXv9V7xwi8LRJb?=
 =?us-ascii?Q?HxVOLuqyy0SGUp+1vYz4OyEDipXvhaTfL3tCs0cIbJBCm80rjuNAUMDEL4T8?=
 =?us-ascii?Q?j4UWX11Y5G2Y6p8n3pl7B06fkesBgdIYvwkkhoZTWc3z6wm29AhCVbKVqRRs?=
 =?us-ascii?Q?Nz2wQLKqZ26EoeMlV5QhRbNqr0Gt0dFtTNjoMoBe2gq/9V5rrlN/3opDPUIL?=
 =?us-ascii?Q?91CoN7aZKGQYU+m4XkFjP0b0BNrlED8ucT3TLiatBLAcoMf2v7bwcReEjLn0?=
 =?us-ascii?Q?j+8Qk/90sb8x3CVWjHmpozQ=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742c505d-1dc4-4ea5-2a7f-08dcd8037058
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 17:00:46.2247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9QSEcGVBfwsKhNfYohWejIu0lim3vrdhZ8A3Rm4FLUp8BGOHCQyLU4U/YJMa851v0Yj45QK5CUUv5pWMWO1YJ85KNM21dAYbkgVQUEgBGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB1278
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 17:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204653

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

