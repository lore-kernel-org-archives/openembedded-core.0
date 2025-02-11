Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA26C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1132.1739286057297610302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=0Jre4PV0;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srnwm5W1ba/eEvYk3yFkm5VFX7KWa1SRKwiym7Yf5T/cLGI+Lb+zHN9jlkuN+V93IOz005RLgy7cqzWPLw0DbNS3JWPlEMFzbaZZKyk6o7R5ATGNBN+HvrPYxDF0MTVHkf7QcAMTaie5DNDmxmUfqCzbJmmO49dNAtolKwoD9vfIeMo4QI9E6+18W4UWAgpzI8lgbF1GJ/I4wB5jKEdsG9dK7kcVcMm0bJUasI0HkWlNGzNPSK7MYZKTZ/+LcTrp5VNLoMDIrs5cv4IG2V5EJdS6ye4j6HSOIJKB0j5Z5JaU7aSVdGsNa6HHEosWVdxmbgoTxwALA1EYShgT/S7rxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHauyC3HSIwa16A8Zj/4K11S33ZJXz2ON7n/z1gllYI=;
 b=ZYIcHSLz+tWR48CSB9V6Bya8fFgWTACKgWHiLo6LLHOTHSCZ1k0fUW9yJ0ME7E/f8eNyBG8YhBWeP3QUZ8sj92DFX8eHJOUc1mNOG0gUJYgxL+0eNAPAS+o3Qb4UE4/axA5TQD4bUJSBjKPl/SWdqgvXZXHbMyWO35smM4YmVFXG++XCnF1q/SjdrRATd39neuIdTYSCJmncYF2BopdnQ+NK4Amc+DGlPobkNpCgsq/cMaYwoBCIqHVmug9cUWn8SrHejQOMJWy4eCeSP34obM4ninj4fH1jRjK05OIrZZxw61g3QpafP7Qe8gEIsxxtRui8H04jBZJHhI8SqvL12Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHauyC3HSIwa16A8Zj/4K11S33ZJXz2ON7n/z1gllYI=;
 b=0Jre4PV0/3ZnkpFlxK4d0oz+aQJZopd6t3SlRJQzGYtLXxWQ+gfaVgzTDgOHXeWq6zHJTk0AuEhj7fkngJ5aRtVd+wWNlW7iDZLJnrxGuMTlzm/0C+sJYev4eCoxvvmimsgUt/ZPwFRVmcLcXOyi+PLXMshNPKkZxUIGkx/FJfxkdxblU4ZlwvRkSLAbGAtGZtuQ1XnEs2+TAT3Ua+8wEh6eCfNqB/TTNNe1J6HQamrbbQnGjZk9E3WfAzvTPLSRywPNItX2bgfgX0Fvj3SHEB47uxL41KDwhsVsLnXhisMhxb31J+PgIVFowRtqURewJNJmLUklDwUZaQC0mOQ4bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Tue, 11 Feb
 2025 15:00:58 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:58 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 15/30] classes: add early fetch, unpack and patch support
Date: Tue, 11 Feb 2025 16:00:19 +0100
Message-ID: <20250211150034.18696-16-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: edd9be30-e896-4a20-b6e2-08dd4aace162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p5InhMs+LCCytJHxFj7iGs3rm40UTF+tRIzkWWA/f8/4L9PxzbsdkUoSZp1W?=
 =?us-ascii?Q?UbKT9wCAe1r7BFTlLLnsnXpXMUMtIA3x2LXGSC2b0j00ben2y1LLZ+Pe6CNx?=
 =?us-ascii?Q?0hZEZWqDPRoHNn3ppWepws3VyjzKBrOMj8FpahO0KEx0fYSb1S/4J0opNKCv?=
 =?us-ascii?Q?paFtbPzqFcVKoZ26YPlAz5dIuUk3JIg90CS50Tbg8O9CmPSvs+wCpUESJh5c?=
 =?us-ascii?Q?VggJuK6VhGwBYuEdqlIJq5Q5kqFqELz74xgUrML8LCk6WRavBMzx1j61k8f5?=
 =?us-ascii?Q?U1SAaQykYjM+kdCmrqpA/UDpWt7YRSEG5V88duqECkYtgxGCVloiEE+IFnnZ?=
 =?us-ascii?Q?MA+suQauMr9MahjeEL26hRFyLeKkAlKzXn3g/bJaYN7RouCkSOPcj4Uukri6?=
 =?us-ascii?Q?omll33U4nDa/YSjP3iMXx/eoNs+IV1sGKJcq0Xx4nMOQlNqcI8obK02aiiXX?=
 =?us-ascii?Q?7zaicWpb4CJsuPx3c7Jp/YwzBuwEklP7ufQQ0p/jrEosjB6Megbwhws83zG/?=
 =?us-ascii?Q?ia9RA0WA87f+fUL3/CepuezV9DDqMGK8Qhn4fKux1l1IhQVD1R9n8jD44m6J?=
 =?us-ascii?Q?vKDlEEFRIArLZZWy3MZDGGSoE0usimFE8FcXZsjxtmXJu4CCQdPSj6jY3ZMb?=
 =?us-ascii?Q?FuUgMHOfb04bajNpfUd2D6hsuL+Tw91poooygSB8Xv47t+sME0zhHVZCN5/4?=
 =?us-ascii?Q?ByaLL6jWViKWlOin+rHNDZFXwcx+v7hgXPYhxGliSyT0FNVlo14y2JH/OzTI?=
 =?us-ascii?Q?fmFf+Jsj3hDWc3i7Zlv5Nuv8p/VPkZqJL0fJ+F24N/PpF73tJuWZCvQca7DY?=
 =?us-ascii?Q?VZZQ7MgjPoze0JNde/q4S7z8m2zqo6aMyEWs1lbGcAKYKiqeIegdKWlgyJis?=
 =?us-ascii?Q?BHU0SGtCbQ9nkYVy4BYlNWh1FYzOx+kRK3L8HOrZ+OZ2151EYoVYm6q7jSwF?=
 =?us-ascii?Q?4UzfUzXQRRMpCBweUBS/WMdaZBmVcp+gL0T+swk/JQMFJ3+TUScAFn6ibHI2?=
 =?us-ascii?Q?B7L96wI7/d2lqrdm93WjjwDTwPwOa3xSlopptid7BqieYc3hntXZ4k+Hzg5b?=
 =?us-ascii?Q?zKeHDEbsOBG+pJAstIqxdZnUilL4qVmrwwBokarVFvItyzLxPrt/Eip9W0uJ?=
 =?us-ascii?Q?2XMiXy8zeWt43zix1fn8rTVJtB05wpGA2LX2MZ9qXnDFWrxb+QLV7sAJZkHU?=
 =?us-ascii?Q?AIR92iJAXcwbeR6SuGk5ose+BJd3FWHOe8fvjtkgzeSh+YGnKO9wjlp513gL?=
 =?us-ascii?Q?EsYxDzKW7fhh2mVPsJX077qbeGEVKqudE6r3ab3SCsU9NEjGX/eg0sFdIPeT?=
 =?us-ascii?Q?88Ttivz5dXqnnMrF3+S/7drWei/2Dm5R4119qpVOAmOtMQ8E6ijeEybfsdf2?=
 =?us-ascii?Q?5soKfYOJKgZ50HdDxpKHy5OdndqqpPBBcVFLWrwPdqG8pmXSuR7WChQABPzs?=
 =?us-ascii?Q?TpQM3ngkMTzAXk4u6S/ZKVbu8itVverl?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sn8VJgRYwJSMqICabSqN2+ossTYVK8D/ZEcNBIICuNsDaqNaNAnFOTRlRIVX?=
 =?us-ascii?Q?gB53LGtuKmaVIoUYQ6P8Ga/cw30JbrocJi4ozDDi/xIzFB6nJ0oIYbld4R1x?=
 =?us-ascii?Q?0ASAVBHITF+GlnXp4EqgviJWCZQPLt4Y1hmPKv7JtN5isBg8SY3qzUiykYEZ?=
 =?us-ascii?Q?ncHlxna0qD33agL6NArt5MFJj7SQFhEFmGGIRw3OPtg2reCTQ5pASpbytAA6?=
 =?us-ascii?Q?Ep+EQZhc81H5itdldCpP2iYpiZVDYGOsY81S4zUiWneKV6anFthYPfTkHrxz?=
 =?us-ascii?Q?mCOQUagEDxZMbujUDJFGbsnAMrQO3R2iqO29SAwrEC7GmA+NQAefDDUAoYzs?=
 =?us-ascii?Q?4jvvAaUNNGJNNMYd0g5w9owfpRZMJXWLdrdBFCuHSGwR1frneY160DT9KEB7?=
 =?us-ascii?Q?4YnOH2rIBHd0ssT+GySAveha+HJeY/UP9SOj4Mhoc+tn77NIgNI8VSEWFg/Q?=
 =?us-ascii?Q?+Gl+ipcwtf0bAvp0faSz2EVTPA/c1K0x5lJjectJhrDwaR8A04TFdBwPYUnI?=
 =?us-ascii?Q?rUk6U5On9vPD35cYm3t6j1yDMmZGg6u859o9tB+meMVNBmSka8tlgwbK+44E?=
 =?us-ascii?Q?UUGsoTINXl9+FcrX4xmquNXya4XYcVlFv2ICIiFMwYd/z7C6D6C1HGCrarZG?=
 =?us-ascii?Q?1LMlD1Xz9Whi5k11Lt5lGJI+5QxebmoJw2naACcLeyWFHHcww3vCUT8ZdmwM?=
 =?us-ascii?Q?j2JYm3CK389j9i8Pe7W7W3BVMuevDI4Y6070un8znP1VeJtD72hTZDCJQXEF?=
 =?us-ascii?Q?Ce9CAGOKRd1XWSvQU+ZMtNi4qrnWTguzRlNMPBrOUR6ZjOE1yf67aqvt3Vse?=
 =?us-ascii?Q?hGeDHFIK9Ow3Fr2NB6w5s7xHZ9jK8Kq1hmne7bEYDngs3yiiI7qpfkSDmfAO?=
 =?us-ascii?Q?5LJKwHGHj7PHthLc1dvmI54Fa6Gei1FeFiIr/BJCS72NoLMNgKljsnFfg7so?=
 =?us-ascii?Q?xNwDrjrf/RnmwYrIjX+JFaT8waDvah/DE/pQSppFcSjWGlk3xAw+hxYCECu1?=
 =?us-ascii?Q?JkZQg9eNw7Gel0AJeAUXeI9dpMyO2ai3ZY/S2YnYx6TNKxGh22RlsIR3iUYm?=
 =?us-ascii?Q?XlCHYZKoUDiPimbbSOY2YSQsglOSTEwCafpRw4opW68D/wBoktgxtkSwDza5?=
 =?us-ascii?Q?Gd+2EJgDMGJ439XEReUWoHr1+H3zyOZLVOzfJwdFXpz0mw3vqDU7iZdsUxSV?=
 =?us-ascii?Q?fjdGuVTy5lG0PzV+YibdkVbB7gJSE0ElU5+xJF8TKYvkIrnflR92GygATcTt?=
 =?us-ascii?Q?Rh4dJP/NNODRibRejrhmInVO2nWvGQHVLWQBg8hCfjUQQ1IsNw1OSJQf5aMP?=
 =?us-ascii?Q?Wpg+Fsvf0I3LCghftTLR2TkSG7P1Vcsev8BAsL/lHfcEDRE47mED35YBo96K?=
 =?us-ascii?Q?cAiAE7KtJAAapYGQ3xyi/c86iOEy3q+ut1b7uUj9hIsP1AzRLOoZoUNEDLj1?=
 =?us-ascii?Q?soFqu7wGVPeVIvIzqDvoCu5q1ooBC1UsNFrVaxuWJtfwfviiyUKZB6YxHmBG?=
 =?us-ascii?Q?hJwFkqU2hRcsnEx+j64Bpg83rlYtnzwE7mx9HoOvQ2PMv8Cm+7j22CS7jl3Z?=
 =?us-ascii?Q?2tRcgxt1ssBOJ2Sx7/L+MXpA8qBJlJAcpR6qqAal1k3du8XqyNJiqBhxHuAU?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd9be30-e896-4a20-b6e2-08dd4aace162
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:53.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSlkITcpUJipv7S0r0ei4FHpxKl/vHP29XGLIP5xgM0PTRlTFn7Vbc7ybqUvlLozVspCoip83YvWIMpGTqtwlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211141

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add support for early fetch, unpack and patches task which run before
normal patch task. This feature is useful to fetch additional
dependencies based on a patched source before the normal unpack and
patch tasks. The patch are marked as early via an early=3D1 parameter. An
example use case is a patch for a package manager lock file (Cargo.lock,
go.sum, package-lock.json).

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes-global/patch.bbclass | 17 +++++----
 meta/classes-recipe/early.bbclass | 61 +++++++++++++++++++++++++++++++
 meta/lib/oe/patch.py              | 10 +++--
 3 files changed, 77 insertions(+), 11 deletions(-)
 create mode 100644 meta/classes-recipe/early.bbclass

diff --git a/meta/classes-global/patch.bbclass b/meta/classes-global/patch.=
bbclass
index e5786b1c9a..7fa94c7aa7 100644
--- a/meta/classes-global/patch.bbclass
+++ b/meta/classes-global/patch.bbclass
@@ -82,18 +82,18 @@ python patch_task_postfunc() {
             oe.patch.GitApplyTree.commitIgnored("Add changes from %s" % fu=
nc, dir=3Dsrcsubdir, files=3D['.'], d=3Dd)
 }
=20
-def src_patches(d, all=3DFalse, expand=3DTrue):
+def src_patches(d, all=3DFalse, expand=3DTrue, early=3DFalse):
     import oe.patch
-    return oe.patch.src_patches(d, all, expand)
+    return oe.patch.src_patches(d, all, expand, early)
=20
-def should_apply(parm, d):
+def should_apply(parm, d, early=3DFalse):
     """Determine if we should apply the given patch"""
     import oe.patch
-    return oe.patch.should_apply(parm, d)
+    return oe.patch.should_apply(parm, d, early)
=20
 should_apply[vardepsexclude] =3D "DATE SRCDATE"
=20
-python patch_do_patch() {
+def apply_patches(d, s, early=3DFalse):
     import oe.patch
=20
     patchsetmap =3D {
@@ -113,8 +113,6 @@ python patch_do_patch() {
=20
     classes =3D {}
=20
-    s =3D d.getVar('S')
-
     os.putenv('PATH', d.getVar('PATH'))
=20
     # We must use one TMPDIR per process so that the "patch" processes
@@ -124,7 +122,7 @@ python patch_do_patch() {
     process_tmpdir =3D tempfile.mkdtemp()
     os.environ['TMPDIR'] =3D process_tmpdir
=20
-    for patch in src_patches(d):
+    for patch in src_patches(d, early=3Dearly):
         _, _, local, _, _, parm =3D bb.fetch.decodeurl(patch)
=20
         if "patchdir" in parm:
@@ -159,6 +157,9 @@ python patch_do_patch() {
=20
     bb.utils.remove(process_tmpdir, True)
     del os.environ['TMPDIR']
+
+python patch_do_patch() {
+    apply_patches(d, d.getVar('S'))
 }
 patch_do_patch[vardepsexclude] =3D "PATCHRESOLVE"
=20
diff --git a/meta/classes-recipe/early.bbclass b/meta/classes-recipe/early.=
bbclass
new file mode 100644
index 0000000000..e458fd8f7b
--- /dev/null
+++ b/meta/classes-recipe/early.bbclass
@@ -0,0 +1,61 @@
+# Copyright (C) 2025 Weidmueller Interface GmbH & Co. KG
+# Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# SPDX-License-Identifier: MIT
+
+EARLY_UNPACKDIR =3D "${WORKDIR}/sources-unpack-early"
+
+def get_early_source_dir(d, sourcedir):
+    unpackdir =3D d.getVar("UNPACKDIR")
+    workdir =3D d.getVar('WORKDIR')
+    originaldir =3D unpackdir if sourcedir.startswith(unpackdir) else work=
dir
+    early_unpackdir =3D d.getVar("EARLY_UNPACKDIR")
+    return sourcedir.replace(originaldir, early_unpackdir)
+
+python early_do_fetch_early() {
+    fetch_src_uris(d, True)
+}
+addtask fetch_early
+do_fetch_early[dirs] =3D "${DL_DIR}"
+do_fetch_early[file-checksums] =3D "${@bb.fetch.get_checksum_file_list(d)}=
"
+do_fetch[prefuncs] +=3D "fetcher_hashes_dummyfunc"
+do_fetch_early[network] =3D "1"
+
+python early_do_unpack_early() {
+    unpackdir =3D d.getVar("EARLY_UNPACKDIR")
+    unpack_src_uris(d, unpackdir, True)
+}
+addtask unpack_early after do_fetch_early
+do_unpack_early[cleandirs] =3D "${EARLY_UNPACKDIR}"
+
+python early_do_patch_early() {
+    source_dir =3D d.getVar("S")
+    source_dir =3D get_early_source_dir(d, source_dir)
+    apply_patches(d, source_dir, True)
+}
+addtask patch_early after do_unpack_early
+do_patch_early[dirs] =3D "${WORKDIR}"
+do_patch_early[depends] =3D "${PATCHDEPENDENCY}"
+do_patch_early[vardepsexclude] =3D "PATCHRESOLVE"
+
+python () {
+    import bb.fetch
+    src_uris =3D get_src_uris(d, True)
+    for src_uri in src_uris:
+        uri =3D bb.fetch.URI(src_uri)
+        path =3D uri.params.get("downloadfilename", uri.path)
+
+        # HTTP/FTP use the wget fetcher
+        if uri.scheme in ("http", "https", "ftp"):
+            d.appendVarFlag('do_fetch_early', 'depends', ' wget-native:do_=
populate_sysroot')
+
+        # Git packages should DEPEND on git-native
+        elif uri.scheme in ("git", "gitsm"):
+            d.appendVarFlag('do_fetch_early', 'depends', ' git-native:do_p=
opulate_sysroot')
+
+        # *.xz should DEPEND on xz-native for unpacking
+        if path.endswith('.xz') or path.endswith('.txz'):
+            d.appendVarFlag('do_fetch_early', 'depends', ' xz-native:do_po=
pulate_sysroot')
+}
+
+EXPORT_FUNCTIONS do_fetch_early do_unpack_early do_patch_early
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 58c6e34fe8..7737011e5a 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -904,7 +904,7 @@ def patch_path(url, fetch, unpackdir, expand=3DTrue):
=20
     return local
=20
-def src_patches(d, all=3DFalse, expand=3DTrue):
+def src_patches(d, all=3DFalse, expand=3DTrue, early=3DFalse):
     unpackdir =3D d.getVar('UNPACKDIR')
     fetch =3D bb.fetch2.Fetch([], d)
     patches =3D []
@@ -921,7 +921,7 @@ def src_patches(d, all=3DFalse, expand=3DTrue):
         parm =3D urldata.parm
         patchname =3D parm.get('pname') or os.path.basename(local)
=20
-        apply, reason =3D should_apply(parm, d)
+        apply, reason =3D should_apply(parm, d, early)
         if not apply:
             if reason:
                 bb.note("Patch %s %s" % (patchname, reason))
@@ -950,8 +950,12 @@ def src_patches(d, all=3DFalse, expand=3DTrue):
     return patches
=20
=20
-def should_apply(parm, d):
+def should_apply(parm, d, early=3DFalse):
     import bb.utils
+
+    if early and not bb.utils.to_boolean(parm.get('early'), False):
+        return False, "applies to normal patch task only"
+
     if "mindate" in parm or "maxdate" in parm:
         pn =3D d.getVar('PN')
         srcdate =3D d.getVar('SRCDATE_%s' % pn)
--=20
2.39.5


