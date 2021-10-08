Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB64C4332F
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:43:05 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.48])
 by mx.groups.io with SMTP id smtpd.web11.6111.1633678981107909583
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=a2FvPjTF;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.48,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dphQADGyEp1fqWAuL0R1bYtZ6R3hSi0mFuM2Nu+5RJnb10ZGJYkN6JPYNb4Ms5NCuHtuTKf5caYtlRtULoxJPabDzfmiQ3huxI9RDPsjYqVN/J2tLr1CmXUDqGPdMxXajBCkqvoRSXWrWqwsVlKCgVM2KXHDNNElwsfbs07v9fNsUE7DHqXDRjCE1l2yr7l6eZkKQXyhoTt3wFRGW06O3NJIbzdCG93o5/35r5wRNomLsAy8CUPse9BZW8NlsPG1qt/QMqODjhkozeO9ztr6bum+bdJFcxeuRKMzkZQ3RnDV0BiZVkJOjepUPv0ywW4snKsD6tNnROs8cmc/96zVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/58Wl3Wz/JTTdLy0/SdVXBJfzcvEKMOBgMhC2dGNk0=;
 b=Q17L8pPIFxyYm9ZrMH9usJbwoJQrXsSQ10GDs8Onjpd3pt6CYAi5EhgGSXB+wBWWqLVB/tPXRFboAtqEEeFLTm0lKty7hZd3DK/A3XHGhCGURT4/UvdhYdHcp8NowBb7mkUP7IoC10U/La28sFLgqWZnFp5NfRvHBda587/ssvNw0jYG7bMsBIs5XcXnWhlByhjTps7U+bloQJ4OGbLWjgPXL2pNcDKi24ZVoCxBcqbflYdMH05lD6cI9MrOM54fC4r2uCmQsVW3RSSRahnHOk/jBkYI6KeQr+aH9k+QAreJOOHeYTDyED4hoayvNc/ilm2FXtN9ib3pSpJDEZVtYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/58Wl3Wz/JTTdLy0/SdVXBJfzcvEKMOBgMhC2dGNk0=;
 b=a2FvPjTFhJZYqkXZl8yrfQ8RXyb7hu66RmcLopgqR0Pn6zxDkDbsFathot42RIK7dW8zh2WdbkXk5+pbmzh9AX6puyGYrTAlf6AItVz+mzyPd17yB2iIbd4zZv1t8S+Lgx2QqbsD0bFi6REPtVR4F4nxDo0jCfx22Ae2Yk2U/Oo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6207.eurprd08.prod.outlook.com (2603:10a6:102:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:42:57 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:42:57 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 01/12] npm: Add support for EXTRA_OENPM arguments
Date: Fri,  8 Oct 2021 09:42:17 +0200
Message-ID: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
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
 Transport; Fri, 8 Oct 2021 07:42:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba015c37-77dc-40ba-05d2-08d98a2f3eea
X-MS-TrafficTypeDiagnostic: PA4PR08MB6207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB620745869D1B6E4BAE082925D7B29@PA4PR08MB6207.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7lDQpBs5T7WSO+wis96niM+y4Frsc6VpiQP0SocffuxYluVrW9kymXH3Dyj2xda8J0mX3tJOmV9QW6B9QxG/hMtCkcPcEvM0Y2hARNy35iVAugBhGNKA3rrcQ99xR9FAh2ZHLG7c0DDKS37KdUoAtIJgS2PqY5Jt/4zbCgJmGCek3PvLkxk7RXRDuFaZHKnwZq8cTgTJ0QA4vgd2xks7UaIVKbE9MAGwbheWoPvsuKnU0z+8CbMj9EBWFduSHdh+9yp6JVB6Ulf5Tz+r1omDco/R4rYGp53Pu+5+hbhnD/TZxMKulozCryrokO0i/OLvM0w9xlqfsU1GEWGb/0jQtJZk5Rp6DxTshid9fJ8d8wiuBoEa1g9GqlF3n9uuQtpveZiwXettQgUn30ZQD/4humtaIcDc9OrnJsZ0qZcrUVyUgk+DCpHkIEGWlCXiviJW6vQajo3QacqsG0Y/fqzdFZyuaBYuGrKYaG0n5wQMIGAR8IFoUaMMbFf7CHYZM6VI8xW5Zr9HbyAv9G0u900C7fKIS0OCvotk95kU/vnpjlok+F0I8Z9mpM1smCQ36Qen8WwArhfYRGbtkM4e+iql6fMwfdQiMlJci5drPTnWHt3NKx8odGjHBc6pn9mWAOpZavGkgCLy2THclng/qsvZkUXK9IJMLQYAqzWQUDLUZioMNRA6ZMJS+AheAhxeLBZXOwIooNweNbpNG3oBJngaaA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8936002)(38350700002)(5660300002)(316002)(38100700002)(4326008)(186003)(1076003)(6916009)(2616005)(6666004)(956004)(107886003)(66946007)(66556008)(66476007)(2906002)(86362001)(6486002)(8676002)(52116002)(36756003)(508600001)(7696005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?215rTgId4PUznC8m/qkqEiDJ+5geO12bUSKqkyNOAWHkBSwf1aMUrWJJ+Gue?=
 =?us-ascii?Q?aPrXzslonJzbIvHbDkJXn0VGyB9HsnEgj9nrHhOdTlio+XB9NH1V9DFLS41u?=
 =?us-ascii?Q?JOyCvRQX0Dm4jdBcy2mKt/mALGzzl3jCTEB3Nte2BlAYDBNJlCswVF4A+K6r?=
 =?us-ascii?Q?7fUT/v30tN4Odoc/FMsKAY3B7bKJnb46ANwrzwY9neHhoYzF5vmOx47dcae4?=
 =?us-ascii?Q?6qsuYt4G9wETxnXAxf4V5defJi5ebpa+XvB8D7zLFjIEuPAWJ7rGlTywF6VS?=
 =?us-ascii?Q?ETjsN3gN4fWqX4lfnlSnPDK/LaYVw2ikodoPYGeR7FDFbVcG7bYfb8vb+Wqs?=
 =?us-ascii?Q?7PnDxosZSVFVKwxGcIUc6wulMx/s7uH8rSJwuGHwLTLc/uNyOUh9uc1728lx?=
 =?us-ascii?Q?xtyudYFGFXAFN9+YRClzvHEnbnJK3aQMr59IUMvauilQyfvbw9wLrWIsnHf9?=
 =?us-ascii?Q?ObNJ8IrO9VIBn30lqzZLZ5Iny+G+opn8Z7/ppgsGA4vHSktUvNssvFZJJivm?=
 =?us-ascii?Q?/a/iLZCxKRjSa/bCNtSSuwdcO21F0hqVRB03HkzuiNoR6HklaUYMF9s/rcOv?=
 =?us-ascii?Q?VxLpTEbijne5lwqikXW/vCfKKtc6CPh30J6GvTaBMB0W8OrxYB4+bRu9eg/o?=
 =?us-ascii?Q?LPsmCNU7RiGU30XMn822F3mEya6VVEj2y8O9uqDTt4kIfL2SrVYHKpuT+CjY?=
 =?us-ascii?Q?vzmTQuS9sKqCNu1ZDSQUiZK8cSCRpmwSLHn/Ov03t1l3TuhpqEtY1hiFpJTf?=
 =?us-ascii?Q?04k0QRtlL7/F0rsbn2FnMI1yPVrJzMthCmfro5K4zEQJNjoNp944mcGUSLzt?=
 =?us-ascii?Q?GapB8RI4vrl6dZLtb58MQk5nB/0jiOqlrLfjD+nv8QhiaJaV3rzcoB8Vs3n3?=
 =?us-ascii?Q?3q6aD1Hl9yE5k3Wg3ZidtDuZU6FmUTrCyTP2w3Yyek72O6N2tAeP7fYtvcU5?=
 =?us-ascii?Q?bth9lBckoTXPhpi06pVWBYS91HKEYzwD8e1/X/vA/F9SqJCGk3YL410OVjDW?=
 =?us-ascii?Q?Q0Is0/F4OqZWkkn8ssLIP290FTaUgu+BdTEAgh6TwrOFLrYNmkD+fowTYlGc?=
 =?us-ascii?Q?9Ep6jnkYt8BmV7eWMyAD8h9T7NRkGJ8d8rtUOaovJ7xfyFyKRANr4Ii6wj5K?=
 =?us-ascii?Q?tOknJjoCfqc8dgRZo29ZkaGP7eTYGrQa5jjRin3rlf8g/35AZhn8ouTDvk9G?=
 =?us-ascii?Q?GQJORtSCirUEYgysxjYKKcjmSIS0LFHOqQK98f3DdygsYQwCQExuOZZ/2Mm2?=
 =?us-ascii?Q?pKWVnyqbwsx578enDiGoOVc6aqG5kuawWuY4fHmoccWUfWWoBlM7NWLAnfqx?=
 =?us-ascii?Q?MpnwwZ7PnaM+wvLgQUei/spq?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ba015c37-77dc-40ba-05d2-08d98a2f3eea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:42:57.5785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VWGXW2a/PmwO6NRY7LAEOSAq6ibqlAqGtn6ulY8CHdoKSaScFTKifMl3q4FKtpddQEMoF6w0i7VP8HU5+CaoBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:43:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156748

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add support for EXTRA_OENPM arguments to set node-gyp variables for
example. This allows use of shared librariess, avoid download
of external sources or build from source.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/classes/npm.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 91a2321116..477b40d921 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -22,6 +22,8 @@ inherit python3native
 DEPENDS:prepend =3D "nodejs-native "
 RDEPENDS:${PN}:append:class-target =3D " nodejs"
=20
+EXTRA_OENPM =3D ""
+
 NPM_INSTALL_DEV ?=3D "0"
=20
 def npm_target_arch_map(target_arch):
@@ -260,7 +262,8 @@ python npm_do_compile() {
=20
         # Pack and install the main package
         tarball =3D npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
-        env.run("npm install %s" % shlex.quote(tarball), args=3Dargs, conf=
igs=3Dconfigs)
+        cmd =3D "npm install %s %s" % (shlex.quote(tarball), d.getVar("EXT=
RA_OENPM"))
+        env.run(cmd, args=3Dargs, configs=3Dconfigs)
 }
=20
 npm_do_install() {
--=20
2.20.1


