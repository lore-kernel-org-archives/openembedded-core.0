Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFADC433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:43:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web08.5885.1633678986590087679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=ewvRaq0P;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.52,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPFur3J1lDhDYxUZGRAuuyupQi/eqZGepSDuc2hTWlXDLmh1CtNk3pgFXqiPa5Afj8quQk6+kqU5BzI25ccJ9H44oHb9V3P10ZNrldYZbZ8ItB+Y1GADyw/ASh95bDfjaittvhzLzwKD6FOwZaGrjF6L8DDkOCy77CsUH1dW+XMMefhHZ7PR/OcJP32cNFsfR3CCnKVSVXOjmznuTZdx1yvN2GTGu4jtA9fcnlsiFlauq+Rev15KHvgzkT8GZm/Nnkj1cGR3dsgAvlV2IEjiGWOZF9M3sh3bzS0bS8AL39nCEaP/4YgdHXCO3rr63zBcwDD1CCI+aa6S/1JacikDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5uWmokHYBrRRDAP9zXZ+CTkGe1yfGSgPs5v0CBqxFw=;
 b=M3qcl5hhWgsTNY8AWrekc6mVuAgmZDC/T3606iJeHpNHCgL0E/zHQtSGgngKqLMHG471MmYy8YhqzfkQx2qYoDTOvsqfZnMX7mjG6CTjY4mqPSUpXEe4As98kg0s26AiMkDPbNCGjt6aebleMvzodzS41HUfC3AzjovEE1m+9hrcSKqltrXME0Tuuxm5mmspB8QnSXqUPXb7k9j3Y/kc+PYz3dh3idlO6DCjHjbqQqlr8ZfF20AvL4e3GGQrUiWp/9/mhJ6EggWdYlBhzasXH3YRFq36ZzEl7udDelKVccm2bO+h8cb2BeYKzfGHUQmMBKzaGBAlhyMzi+FSAk+duA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5uWmokHYBrRRDAP9zXZ+CTkGe1yfGSgPs5v0CBqxFw=;
 b=ewvRaq0PWGbNq+vm2AxasLys4VHeRdoEXSHqyzdSWh5LiUZ53v3c3jlsXUF6VEZkWlfHYmxlo1ql861+YA3ZwwU9bfCzUOPCXr3jU4qgtfCDaOSEH1mhRWAFCqVdcjBOpIYMhyMKaGM9+oXa29sE275RQYC8y/fchKfzZGUFp2U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5772.eurprd08.prod.outlook.com (2603:10a6:102:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:43:01 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:43:00 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 10/12] npm: Add variable NPM_NODEDIR with default value
Date: Fri,  8 Oct 2021 09:42:26 +0200
Message-ID: 
 <20211008074228.8635-10-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0023.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::35) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 AM6PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:20b:b2::35) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 07:43:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7920e4f0-b5e4-4afd-b813-08d98a2f40ff
X-MS-TrafficTypeDiagnostic: PR3PR08MB5772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5772D43CA2778C2A6750560AD7B29@PR3PR08MB5772.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mF+OeCI/DReYxWXoUG2AC/i4XGLSmvGfCFChvj658EbU1jl/x/Bh0l2bLuP+JpJB3XKn6RWzfl83YujltjJYrciU7K6MHmD34FwPBtLRukFrujcQMzKYNpa08ouTJnaavXvJtk/7eXx0HlJ1+Zzr+tsxteJRuwnBQhGuB5Q+HlbpZZiE8MoZEpu20ePoJ9TtKZJ8wOWPhBHL01RQFEaZApf7ZvOxy8MoPNugyBbLfEERFrVJCJ7XiTTuWiIwzUuDUeN8setWzZoYmZyubPqrbRsctKg/kj82enrqIdwNzL2flzIjpezlXkmEZJaGUUtkRqL1xrHt+iI8CtmjKa3KbYopKO6cgtKO5nZz60vHAP1S85mRSpWTKUUL/u7igwq8l8fKlKt5vApI3aoONRMjpJkan9pNfPdlMWjA5UUql4HGGKVy5AFb0s9QPomWkzRRGnYL38CDGYvrhJPBhygUVPFkx91CFaKuKV76anrhAPBljw8MDUwtM2n+bzQf9D5+LHzIu4WLC1Rn/j0J0vZqtxHk5Y1IvIPv++Er2asNGJYAikLyoH27sm/V9KY7MSeBamrXdIce3AQWSKrCgcIVoBmql9zw6ni1PQKFOU5Krbt0/tiTaqswdI/7BVtyrZDOaDPOSjZkMR3PV6g4D33vbdAoSsw5hrR/EVBDoLuBSvROKiJqrUoJSfJSMmgb5lo7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(36756003)(316002)(26005)(83380400001)(6916009)(38100700002)(86362001)(4326008)(6486002)(508600001)(66946007)(2616005)(2906002)(186003)(5660300002)(1076003)(956004)(8676002)(107886003)(8936002)(6666004)(66476007)(66556008)(7696005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4r1sS+YWkYBkbWX8gVHGvkFEJsuQBCAUE7q2IO9TLN5P4ipuPL407AVxEtG5?=
 =?us-ascii?Q?p/XsSLkWvOYQ19uF5v2vEn/vPFqC0GIBLylCTr9f5/U9W1xPrm0MPy1TDasb?=
 =?us-ascii?Q?E9nWkbEml1mB560Tee5nJVqEpuaGEzwKNoCyxHSWB+749x/uZhuLNc4BGvN2?=
 =?us-ascii?Q?wUbQuNZwRfSuxztswccuj/RfiDDq78Aa4UUuzejRhAR/bvQcWGZtDKJWsgcy?=
 =?us-ascii?Q?KKVqpRyuXW2fLm2pFiHM81eH+h105qnYHC3FqFd1kSCT+uoqz9/iilNMSPy6?=
 =?us-ascii?Q?KrcE8awQZe0lf+BikC6qBjhbjvYNnY9YmhTciDTRTdufl/r9yCKZMQwhL3Xi?=
 =?us-ascii?Q?ENbMjtf6VKN/ZQBli8CWwpJJCIEwwOW6k6rdriLhZMzvdACI+OkXNAF5Ol/V?=
 =?us-ascii?Q?DxhoOnhJjeO843LmGhf+1cBtk88uZ+D0941XFdirdUEC2NmZdCSv7aL2EM+2?=
 =?us-ascii?Q?8UzhS9MnBQhwdOmKPbc/JXzP8g2ANkZ6McgijGoAsVkcxxrDlItPNTHwWYNe?=
 =?us-ascii?Q?BB8OxXZDluT3iODY23jnw+lTt1Et66h/hjnR7AWFPY4KvtOCCz+WjwHoiHu7?=
 =?us-ascii?Q?h6Jmwt0sbSPE/+g1QYVURknW42FX2LTr4x9jKSt9W/7Xc5V0FF/lQJBJlfYb?=
 =?us-ascii?Q?IBsynB8RDQbgl2rCBgORIxDniAX00LFnJjLZ+COiugxAAe7ardk0JzLmQ3P0?=
 =?us-ascii?Q?dmt9OcvZo58j7YyLqITrZrwH+QUYnDiSM9ZbTY06v32KXmlzPQnrYIzeel8J?=
 =?us-ascii?Q?A40zSMFPVfZn6C7ISclPqoDRN8cMerUQoSTtC6Fj2b0hbOoR4DeW2ghBDLsz?=
 =?us-ascii?Q?uagWCD/fWFa6c/uvKI9RYEqBiZ5L2t3UILH6R+AJHp/q9e1uLR/K/TmShSEk?=
 =?us-ascii?Q?/j0MOdnDEzDBFEmixEc9dRjehcIIDqeVNrLfXUjh51lqyMnnnFMRFz4SAUKb?=
 =?us-ascii?Q?H1/Auquag1aKcvtGYhOkb/rWhjoLiQi1GD8nlxDWzISKdx9BJ/nV7bX80Et9?=
 =?us-ascii?Q?NNXAwVyHCIv/QloxLjY+9I3gtUejdzPca0P4bHhhsLeiIbIzEkk71pzKWXHG?=
 =?us-ascii?Q?RIqLGno8SAgqPErSXg4pE3mla+fnWnUKZVSpvnyzhDcSV3I6K3YO4F7FnNDl?=
 =?us-ascii?Q?U9pABhRwwkD5uoEPZfoxZ06xYcktq7EA2Jl4X2wEbFM2hJ9iVYiwM9MAeoyT?=
 =?us-ascii?Q?+N/dGTKji3Sh7ZCKtPRRuCxwiCyo+RF57kSew/aoFhNgVN/g7l6XhsDeu6+K?=
 =?us-ascii?Q?GCH+BiKrjRrDnNYoCMLGhOLI+jsKPM1kTuJHtxAYuknnMs86o/I9j88gvugH?=
 =?us-ascii?Q?aw30/V+JcMZMZwtVms3K8gn3?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7920e4f0-b5e4-4afd-b813-08d98a2f40ff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:43:00.9098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 82ix0svQGHms+gkmWMAgMVHeJD1/f4mUKQnle0HOF1344LpUEpzL+rKZL1VRhB8rr9Jm7hBwi7Y913GHzdKQSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:43:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156753

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Replace the variable NPM_NODEDIR fallback to a default value inside the
code with a variable NPM_NODEDIR with default value.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/classes/npm.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 477b40d921..05bb9f578d 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -26,6 +26,8 @@ EXTRA_OENPM =3D ""
=20
 NPM_INSTALL_DEV ?=3D "0"
=20
+NPM_NODEDIR ?=3D "${RECIPE_SYSROOT_NATIVE}${prefix_native}"
+
 def npm_target_arch_map(target_arch):
     """Maps arch names to npm arch names"""
     import re
@@ -249,11 +251,7 @@ python npm_do_compile() {
         # Add node-gyp configuration
         configs.append(("arch", d.getVar("NPM_ARCH")))
         configs.append(("release", "true"))
-        nodedir =3D d.getVar("NPM_NODEDIR")
-        if not nodedir:
-            sysroot =3D d.getVar("RECIPE_SYSROOT_NATIVE")
-            nodedir =3D os.path.join(sysroot, d.getVar("prefix_native").st=
rip("/"))
-        configs.append(("nodedir", nodedir))
+        configs.append(("nodedir", d.getVar("NPM_NODEDIR")))
         configs.append(("python", d.getVar("PYTHON")))
=20
         # Add node-pre-gyp configuration
--=20
2.20.1


