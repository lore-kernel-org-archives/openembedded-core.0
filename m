Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B85C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:49:01 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.89])
 by mx.groups.io with SMTP id smtpd.web11.6161.1633679337460503950
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=xMNGfTmr;
 spf=pass (domain: weidmueller.com, ip: 40.107.3.89,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sw62OPDAb4yMlXBFgFqjIGw3PghdeNHK890IecY/x5rDN94bv1YTZ3hch3QFJ2SHfA1ylw6nT0U0pVhfLH7IUqjPkPYFkKPYmaY9O2C22HYmhoGxS2MWczdKqltTzAo3QmW5zBy8uY9P+eZDecSyv6lw50sqn5SDw4OZlDDLFAWv7PPuBRgRqUWKoQsal9B9vmG7JCiFualMCd8Gu8yyNja+uUvMLNAGWH5r6sEG34G+y3xVjptK+BgPcl9lsoXgUu3faexSArFsHi1AjvF9KMl3k4DYbtzxOfpG1TEkadUqS/DeJF5woq0XaQvH5PAYeiUwCsbL+wWNG13N1ieR4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rd8k+YGNrusGN7k8bKGmXs0M7MuSwteyLwYjmVPd8DU=;
 b=jS5lZiod8naYeViCGe/4+aQoDJSMn9lrGRUgM+JcGI/etRfjuNoLkvSjvlSgYhEeAfwTlRFtCH+x27goXynCqebNcL2BcX2YKQwz1bsQQ7OLyEaFukKW7Ds0op0O0hYQuoO/eMD6wfE6CdvOe1WSEk67s2mnim5qKhNahAbPgG787Gv0t1IBKaoex8i9C7lMWk9N0czpr+OkusyKL2+edK1ewjXUeRNGpxfVekif/OkTwJJn0EfHgCGDEr4wq1k0la2Mxywn3ObbydiQ/YNvPP4m8JankG1OPHlW/7fHJBVZfDPO+fpCfaxFX00jXjDBNqIssITgX3i0DkPJ9cbTAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rd8k+YGNrusGN7k8bKGmXs0M7MuSwteyLwYjmVPd8DU=;
 b=xMNGfTmrc11vcpK0TApXDfcAw3JCKhcREG1f+07rsZG02GshFZVTFcb1XZd72Gd3vHC0AbDvenrZvLFAuD7LGVCnaseRLQacrkt8ydp1ikxZrLcn+Q3ZPYUpSifKZJYvcSDbKGKHkubndR0ppWZXvP2r7pe00zznsbQs6jiCqS8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6478.eurprd08.prod.outlook.com (2603:10a6:102:159::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Fri, 8 Oct
 2021 07:48:55 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:48:55 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 11/12] npm: Use configs for npm environment and args for
 npm run command
Date: Fri,  8 Oct 2021 09:48:34 +0200
Message-ID: 
 <20211008074835.10320-11-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Fri, 8 Oct 2021 07:48:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fee89220-370c-4226-526c-08d98a301488
X-MS-TrafficTypeDiagnostic: PAXPR08MB6478:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB64783BBD3B4EBE5995BF9833D7B29@PAXPR08MB6478.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fnOwxWON7JeKzR4egSFQEQ4AdHvU9C8iT5Nin7IxkVx3elasiloBv/92ZYLSviOh8FdFAYsJKIHNeLFmGgNuWkzFhWyfQnjYiCqP+bO34/D72dMFYSPGVWv2EN+jvQlbrW4VXC5vUyWgBx4TlI1NxNtGN9C/ZJT3t2Q+u+N5pkdvEwN6JvLNQgCqCUHVZeXpyMzUpPq43DPzkKuHrAb2N020Vu2O4TuvHhLkuZsfijfmz9gQ9F+MzrjhneHR8XJy1up0rt4dtFEqecZRNhFcoK64BENxHB8so6QP0w2T9qCM/RPwzx+J0xcw/sBOYayX5pl9NUEfgbnIib9bdNDbohXIFa0Aaca+Pe0KonFUxndIb0/IT3yBSQ5Jc7qJkdv+9TKAkXjJKnN2F8RR/r9X7mN07AMlmf+R/v7tQUFvJ3Q6ZyqW5Ab2KX5p+ZEHf9nB62jf+H9od0m1VPLwOnWxzjl0VxX/pm8pW6yx7PN9BY/AUObno3+WR8GYJX1bvI3WHKbeENOGoAvXdx+HO01dd/pFZsyI2aVRwPmx8GHV+LeX4+/CQxWdlp9FgTcCDzr5mkxfRTJKixx46nEGO72JflFxGsANifJRQlXaEKal0fw4QkuVy1SAF1hPLTFaix2DkgUaU9AyGjOBQyg0kIRZiEGQjRskZ7UnZ1kzjV2tAPLntxqa0bIeUsu5KeAFIKvNTTbXj5Ld/Q3w70CexdVW3A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(7696005)(4326008)(86362001)(956004)(508600001)(52116002)(2616005)(2906002)(83380400001)(26005)(107886003)(186003)(5660300002)(6916009)(6666004)(66476007)(66946007)(8676002)(1076003)(8936002)(38100700002)(38350700002)(66556008)(6486002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M6g24yekfdjtOpJqAgA5jg342wsT/z6BhzyOeAQbaSXZtB01JV3+hijayZb7?=
 =?us-ascii?Q?vsKYVaMdxZIB0bSrSF/ZH2MbcFvufu8uw5ONboso5OCaJyNp7D+LnPNXNwzj?=
 =?us-ascii?Q?II6NolBpOV/SXvq1bAAREF8M+k8qJZIv9UrmrvIFCxO0Mf7PYAan/THTmmbv?=
 =?us-ascii?Q?dDngV5sQ8ieUorFPlCjpp7zLRZQtMDvVQZd2e8u7y7QLrN6vl4faAtkebKIu?=
 =?us-ascii?Q?GjNv0sB9iCGoKy3pUCqNCCPaMBrMbHRl0YYGUCfVIcOpwmMz/0mJCoo6aSiX?=
 =?us-ascii?Q?w4irbIzqf7enX1+ca+XLXhYJgeYobp/fYA2pxDjJlS4ww4VeFRH32CdbVjUz?=
 =?us-ascii?Q?Z9DCkmTRB8u/uwBycMRzhgao8MSFdRuuV7wwpLE4hDxLfqJQKDZzfn6xZ9Qw?=
 =?us-ascii?Q?GJDYWqupy2vPaPX3ItMBVCnCzu1SZt8qvudvtebYrbh83fsuLxLm63QhPUgg?=
 =?us-ascii?Q?U6ebFOJbp6snqADYbJ9CRpL8JOrFsLomiQoBX0l2vaX93oSOMK5WmR9mYmzB?=
 =?us-ascii?Q?WM9+kaABf8XbCCDBP/2jXYnaAJ/Th97+8yxohPMMyqsnfL/R7N642pD+WD9l?=
 =?us-ascii?Q?KJveOWp14OeIDoXk+Moe2JNrvrvyrrRA3mdpVKzmeTul4eQWddty/8n4N+t9?=
 =?us-ascii?Q?+g+omWAWkGw6OpkkILoUm0OA40B22aSxVmhkA2sJDKNdkWrSozDsTe+0WovZ?=
 =?us-ascii?Q?My4qYNUGtBtF+uRIuKBCF3RlnOEslbpi9VTOaYxuU2hCubCE/OdHJdEMlw2Q?=
 =?us-ascii?Q?becxJC6RNqUtU1HGELv7l81IHScgvQtfxdcO9IAiBVfQMkC48f+J7yENJ5Oa?=
 =?us-ascii?Q?vx9loHe4d8RZ1AYxrj5+F5wwJek1+RbnXiRuoJry/FDdztbF4l5cy4VyrNR5?=
 =?us-ascii?Q?dmxjKuumFMDRrD7uZ+IAfOv20Z71QhR3Cg2hJsV6/HN5+kslVzE/SVWzJI4m?=
 =?us-ascii?Q?Y4vBvC97TcsZ2efo45w6Xoo+1756ghGOmreigw9VXhQ7FQ4XB/t7KBrvrzPb?=
 =?us-ascii?Q?5wq7BqgBkM15tS2Sh4oVFV4Pxr1oImbK87Q/EbDFIwPl/XEchiuU4G3J0mNq?=
 =?us-ascii?Q?mrIRBg2UhwsgDbKxcqA3TaRIekUSKnJaC0aIJnO5b90Oo/hY3V3s2G4fxk4O?=
 =?us-ascii?Q?IIGwbVVvzJtM3KCpLuYpt27ILt4+Vuxk5BhyNT5XnDg/fSWgYP84X9mJbbvC?=
 =?us-ascii?Q?AmdQ02PreEAj5L70Hf4wIcxjUR/KINEQ37p9QcRMkUwx9DQ+anfPgPix6vQ5?=
 =?us-ascii?Q?9/HSv8rPaHTnb80EjW8MkMIZ57KraL6pzMp8hWTUbDim06E3RRN1L+4AU9DS?=
 =?us-ascii?Q?2UOxjfDAJrhimMlFvLtBTqNe?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fee89220-370c-4226-526c-08d98a301488
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:48:55.7973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aMRVISABbB6I5YqS0S6C3Mt6v2xU7Ffligfieb+jmitEoz6xBv0MO/ht/8Cdh2DKqn+Qs8QDX+IWa22Hp3nCLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6478
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:49:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156767

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Use parameter configs of class NpmEnvironment and parameter args of
function run to support a common npmrc for all run calls of a single
NpmEnvironment.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/classes/npm.bbclass | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 05bb9f578d..547c531883 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -61,8 +61,8 @@ def npm_pack(env, srcdir, workdir):
     """Run 'npm pack' on a specified directory"""
     import shlex
     cmd =3D "npm pack %s" % shlex.quote(srcdir)
-    configs =3D [("ignore-scripts", "true")]
-    tarball =3D env.run(cmd, configs=3Dconfigs, workdir=3Dworkdir).strip("=
\n")
+    args =3D [("ignore-scripts", "true")]
+    tarball =3D env.run(cmd, args=3Dargs, workdir=3Dworkdir).strip("\n")
     return os.path.join(workdir, tarball)
=20
 python npm_do_configure() {
@@ -228,15 +228,11 @@ python npm_do_compile() {
=20
     bb.utils.remove(d.getVar("NPM_BUILD"), recurse=3DTrue)
=20
-    env =3D NpmEnvironment(d, configs=3Dnpm_global_configs(d))
-
-    dev =3D bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
-
     with tempfile.TemporaryDirectory() as tmpdir:
         args =3D []
-        configs =3D []
+        configs =3D npm_global_configs(d)
=20
-        if dev:
+        if bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False):
             configs.append(("also", "development"))
         else:
             configs.append(("only", "production"))
@@ -254,6 +250,8 @@ python npm_do_compile() {
         configs.append(("nodedir", d.getVar("NPM_NODEDIR")))
         configs.append(("python", d.getVar("PYTHON")))
=20
+        env =3D NpmEnvironment(d, configs)
+
         # Add node-pre-gyp configuration
         args.append(("target_arch", d.getVar("NPM_ARCH")))
         args.append(("build-from-source", "true"))
--=20
2.20.1


