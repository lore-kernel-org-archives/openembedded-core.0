Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E68C43217
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:17 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.43])
 by mx.groups.io with SMTP id smtpd.web11.7026.1637765293947463928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=lyQz+huP;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.43,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbdLfA90ubFeHp4bvISyj39GDqifh8mG0DaaEbpWr+1nTSyiv3WUc9Ypd1XIOd7O/Tb0rZxBwskcLUFdT3ZHWqWTiGdvhrQIXWgvLIdoA9oGhyx4w5LYgh2qer7YHk+z57ADl1ntT35RQOO4gvOSdBWaexkGGwt6w4jWr95DzrB7Js87GcpMsuU0uHYi1fjrKV1WkO4rPXImfTRLvxB2tmdbNhDiVRL0SHfR0AnhC+HXUP1zao6eUG0BkyCxsRRbY5xNKMCxJVCMmltf1IVpMipVsTGkkC2RE2oaGM7PDwCfz2gwG9pnEnJgjSSS5ORz1Ew+FdwU2TUCOC+NPQ3eOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKYWxFSds7he6FZ6xSrbmDWosUjDcC0H2ibYRW+wtmU=;
 b=Y+GCshH6KqgZuQYj9Y0JcCT8pazlBBRm+pGbpvDjtX3+IoDsK0tMVcld5ln28+VK5gKna+vU5g6V8juA9zVtIRznyjPHQjnpPa08WNIsQaUy2I1RVRYe/LaicX6a5OMvsYCW47v4pX68iqklbHtgWELvRDYtl2Lk1IZp+BGmHj8ll3/gZ5j0xto19TB5vy51qaroJ/oUWPv/IovgUY3iF+xeS7pAe0gA9skjAgaZSlP+cv22y6a28PfUza5CDYCtvX2kCpkFVLY5s7aLAsGiyvyCJaSj7so7WrV+p8/RKbsuS1wrvWCeqT962wWHZbfrAWQIq5z1tZF14/AtxI1u7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKYWxFSds7he6FZ6xSrbmDWosUjDcC0H2ibYRW+wtmU=;
 b=lyQz+huPhz+AWqWYYHEJ/FfOlG03DCMXSXG9fEVp0yrqBL6W6yQnS2QK+WHVe3IVFTvdMAyhLzc72biMmq0X2wP0dQcBcXsywqLMJSotkxYUfn4hYoxmszYoy2Ml+Qj3Cmc7aWDzmBPxgIfAMJ5iX2C50Z3p78WMRi7Yd8SLJMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5801.eurprd08.prod.outlook.com (2603:10a6:102:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 14:48:11 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:11 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 13/15] npm_build: Enable OpenSSL 3.0 legacy provider
Date: Wed, 24 Nov 2021 15:47:37 +0100
Message-ID: 
 <20211124144739.2250-14-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 331d9a61-2888-4efc-a731-08d9af596fa2
X-MS-TrafficTypeDiagnostic: PR3PR08MB5801:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB58019FBC42C365078B062BBED7619@PR3PR08MB5801.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:214;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ofmGQhWjVWBe3Ekv9gm2GEbDs3CGGOpEALmatKg/PGywNvXVgmAUVGS6GgOuri7TRHT/rnSI3kjea7SeA++j0CLmXRbwFPLwkoYglOhwvWV/8K4fuINJ0GXHmxx9RUUFAa+1VxdgbSTMzmc05+//cH2mVG7X3G/A1lXQKVLA4TzD8+7RLP17SgRrhvc5hTtJe1knWhIaAr0EZ9m98cTdyza6Tcg6stVLQ/Vj3K8EBrR9PCfgPk2T8EB1idms+d3qwZAjhGqw/1JkLGA8PyetPkqXjijI8vMGiIQUf3wQGPXyxM2pTFF2tUfzoY24t3wEnFNSCgVl4ZpCny49fW98VJNswkbXlyb7NLwdyD4IPcTw2iGhhwYKNrZnCEqYqBcYb6nO2ZnmdGaCF92e5Md62RYZVp3sJQXCQIH19txrHLUrb9KNC6KaCyt28HtjfHIIjuC+vwE6JJ6BL7EDXlaWrVpOt1f5nKvow9l9tBFnRk9gUyBM82EytJJCI9DmceLM6an80TMSIROMmnFTe2+E2pZh55V/DXv48RDKkg5LgNT5BKjFlFB3r0VdQpRBg+xqTog4VQ8nMru3gHSOd/Lkxozqhv65r92wV6JnIfMc9AkJJAWNWXBNErtU80rwwg18/4W1Cx8ATKbDqWfLfevWQ+/zwOakJ3n3X7Q4cYqXHuHOhRzmOI62W/sqlH34Lh1wDKIQ0qXqEr5iyMm9zn8jcaZ7+BHErzz6S6M/3F3F3jyb+zPf3/xXRgfO1g3XXSnr5EU+96sNDlONAlwc1M/LoUkbd2er+tEVhJaYL8tdD7k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66476007)(66946007)(52116002)(66556008)(6666004)(8936002)(107886003)(8676002)(7696005)(2616005)(186003)(26005)(1076003)(38100700002)(5660300002)(38350700002)(2906002)(956004)(110136005)(316002)(508600001)(4326008)(86362001)(966005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5/6gOCIJXzWo6VgCHs8U9L3OCMHHjtFPABqGaLI05jqlhFsANEJqPqovmmCx?=
 =?us-ascii?Q?tm2rnt7hf3DbnBG3yy8V3puu17c4RMDvVO8g8wH2G9SlOk6uOX1mUaOQeWHj?=
 =?us-ascii?Q?qsjKG2+t/q7SQWXjsX5zPWx8kz4nvGzrw7Z42wQgkJNsN7svX1lSTemWYHA0?=
 =?us-ascii?Q?bt/+Pa4QNuRduVThIOZ4Ii+E43MSjYjJaeP7eTGxpL1tNye4JFPb9Zk6F2dz?=
 =?us-ascii?Q?SYHuNhP7Chjdl+o7cN3Om1J2YzsRlBaprbDi1ufVewORCSV5LqjIYQgJNeDE?=
 =?us-ascii?Q?p+sJ/tQ7dmJuwunZ3AVIakSmJQhE0WgYP4xitdNAKeX/2TDeH09CE0WOPJQU?=
 =?us-ascii?Q?GjeM14nAP/EtESljByZZXVjw5+TpY4Z2eXUyT+9QVn3pfq9SDWqugpZZP0jY?=
 =?us-ascii?Q?iQjbakD58+gUFSldbpyUiiTeMiZ/R5aa5zWaESqqJW7KpwobnReAizlf2MEd?=
 =?us-ascii?Q?xu0yZ57lATPqiDpZz+hvIRDFOOO/gxeEji3o5okXsPxaeQ+ihREafUbVbr01?=
 =?us-ascii?Q?EGEJAYyHXOad887QC4+LDp4IjVvrpuf0EEJWSyPXYuI1Mc5Gg0MgBtyD4RdX?=
 =?us-ascii?Q?a/BaPteBCStkzaN+4idzCN+kd25ZcvSlaDe88a6exW5v69wLqJwyNoeqMcuW?=
 =?us-ascii?Q?uiYntyCWPMkQoY7DTU5U1YrSzdpf6VlIiNw4JfDLWqAWqMq7STikkkdaTAWk?=
 =?us-ascii?Q?BFI47Od5nSon6Usts6FJqWsdPzIu4vjNYC9AeA+v1Th1KSqqwPHKVzWEwdyV?=
 =?us-ascii?Q?wvuA7CQOa18beFJKmrKXosfRQSBF84+TlHFjK0JH8W4rj2mdeykkuLiY8VEq?=
 =?us-ascii?Q?xyr500nzX107jgag5Uc8l1tmodTBx0CZDsbaKSXGhFGwzytWieffTG2X74a8?=
 =?us-ascii?Q?o/B3FCyfQ6mmfBfoFw/+kvOH6vc94OxArVmLeQp/cHSIdVigtGPNyRALGNxl?=
 =?us-ascii?Q?esud0E1BDSIKgqeaWT0AHfmrnGrIQBunk5ztmNxZiqQ4HlUtpZs2FoRau42Y?=
 =?us-ascii?Q?RQcw40NFs/Y4L0Xbq1IqfyofYnUQqonCBMLz2tcdgQQT/KPeOX6M0ekM+Jdk?=
 =?us-ascii?Q?5ab2HJ8OndBptaHMLNC1y0kH3wfzxh08Cjml+XVfse+HR+HaMXGkrqzhwXKZ?=
 =?us-ascii?Q?priFr7dlMjksB0py2QPhhgU0ykhxdXi/pdDlZmgjKLfJ0UUfnjNvYNVjkh4F?=
 =?us-ascii?Q?N+e/xz/1B/bw8TbS2Nr37fz0jpcoG4yiJGSDBQgt2Co7OX0Pq3bUHjYYSwyS?=
 =?us-ascii?Q?2Rj10DWqWhb2McK4Bt5UsMsTJCRRO4Xs3fEWYPf51vL0JIB9qxiQbIeQSF8b?=
 =?us-ascii?Q?Bu7GgkzWGmsYvKMKE93wTbKNToyMODLmf2L9/QNxZeu7ExonnyzoPnaD+y9W?=
 =?us-ascii?Q?YrnsMyCUqMZpYCMO2rcq6AZCG7mZqGt8b7ZJwSajLjrp0spHkMVak2vTOEql?=
 =?us-ascii?Q?XHZw2n391EN02WwCxnS//7OnZhMiQhiCz50XCJwnbIVtSGGY6h2PCbViAYX3?=
 =?us-ascii?Q?2PIvgpM/6ZE+ABPkqO+bkvxElnHWsqUIRQo7krG73fkFNZzjM0KsKmVY9okO?=
 =?us-ascii?Q?jozCr6IKsS5tcqWt+Js5OjRY1xcKjPO8C6ZqcmarrbdkMrs/RHMUgLken9p6?=
 =?us-ascii?Q?nnCTXvUxeNxP2ARWbZPPxjI=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 331d9a61-2888-4efc-a731-08d9af596fa2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:11.1010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PZKYRAlluvs3i1iP15nFQPeAIip//ZUw+BQ8P6mICDzmzE5fpEN4oIKIOABFL9QcQknQl+4dauc9v3fNWVYz0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158708

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The OpenSSL legacy provider supplies OpenSSL implementations of
algorithms that have been deemed legacy. Node.js v16 use OpenSSL 1.1.0
by default and support legacy algorithms (example: md4 for webpack).

This patch depends on a backport of [1] for nodejs.

[1] https://github.com/nodejs/node/commit/1d2f37d970e839ab2acafd871fe369bab=
db1a334

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/npm_build.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/npm_build.bbclass b/meta/classes/npm_build.bbclas=
s
index 388eef9519..2e90da3213 100644
--- a/meta/classes/npm_build.bbclass
+++ b/meta/classes/npm_build.bbclass
@@ -54,6 +54,10 @@ oe_npm_setup_host_env () {
     export CFLAGS=3D"${BUILD_CFLAGS}"
     export CXXFLAGS=3D"${BUILD_CXXFLAGS}"
     export LDFLAGS=3D"${BUILD_LDFLAGS}"
+
+    # Enable OpenSSL 3.0 legacy provider
+    export OPENSSL_MODULES=3D"${RECIPE_SYSROOT_NATIVE}/${libdir}/ossl-modu=
les"
+    export NODE_OPTIONS=3D"--openssl-legacy-provider"
 }
=20
 do_compile_host() {
--=20
2.20.1


