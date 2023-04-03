Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D247C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:42:44 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.89])
 by mx.groups.io with SMTP id smtpd.web10.66776.1680518556307654643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=gN5K7Rwf;
 spf=pass (domain: welotec.com, ip: 40.107.6.89, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S49bGmIXYmccvBUJSqRW2+f5nRBTp9+tCprv7CHLdL8d5gU8Vr2VoN6C0ydVgDaBSfXx4hP/w1u0gqMnqwCJM3iiMW/+aQcYZuOVYhjAg8tp10CibwWZ+5mvAtuAOJxjrECze86BfCHqHa83kZBdO0GkNkTdESEVAuPqKz8Fy9x0CISsBzS0YWgHpzRSKvS+9jLe7sFvVvr4hfMiJ337fkfrBEPzFyLny5gu6kSiIanamNsR4nc37kFQaDItYJ/i60bi00RUl+QGJWjTPgOeW0NX1k3kW/NkgIF48mPT9PdTy7JCQVlQS/xjoAOeeFxX0UMvvmGi+x2ocE9ImxL/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vGjY+6CkZ/bQ9hZ+fN9QZnxV8zV+POAd9pwGHv+JDI=;
 b=dE+vW1PC7W/qaBLJcr9AVVxarxGAD1aNpsncK089NUCjbrOBhVokLSjH8fkUh5qjXyJBD1q3vTE0cAlpkFajo9QBUbKS39ojLC5Qi9jkSoKFRGJ+YxkZleX4/rh/028o0UpF0xBPcsBmd5TiT/hs+RS7VuAPzVKvB4+AX93xWC2ksnMwN7lPdYgTL9lz2FBW0NvDk1wZ0hCsaBURlZ4Dheg0n4LvTxSBYR47Vtx2MOtMNTNw9URIKsST7Tu08ikGM0YaYGTaoFSsJ56ZvsKvAJ7SPMBgu+ZHW+n3+zLj2lQdeOSu2EYoBN/kZ/G34JyzjUpak5GqForXva7sg6mDPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vGjY+6CkZ/bQ9hZ+fN9QZnxV8zV+POAd9pwGHv+JDI=;
 b=gN5K7RwfPo31Ch64Vxkvq+HKqWqEGczI0S/eOPi2KAtUv8G4Ki66ZlhOw6czZbYpP7vMqBIIybu6N+9DRLiy8UT45jZgnKHdQR3Xa+06j6z9MNYRTV11ycTvpFyVKHdL2tu+Pusvdr4PFZhGuU05/tPxWUski9vRyzDwy/01jFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB8659.eurprd04.prod.outlook.com (2603:10a6:20b:42a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 10:42:32 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c%5]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 10:42:32 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [PATCH] package.bbclase: Add ACLs and xattrs to perform_packagecopy
Date: Mon,  3 Apr 2023 12:42:16 +0200
Message-ID: <20230403104216.3058652-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::9) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e2077a-c341-48a6-f447-08db34302119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HCoOWhOWq4aK+q5T8u9lK43MG6+lFs8vqdmO/sDS1n3gO7d5XiYLixuB5nlCMl3yfhwV3OVzsFRSlqJAtXml/49LSDnNvG4NzbbBGFfT6YuGShVawMWyYeDYhFQzCLJ6YKyhRaB20zi3Du7g81iWNwqkFfKBR1Jrzi3aMIulUv96aw/HHjrNJatbpjCiTJaEa2heF7hcO6GoC50dpLH/YdjJmcZO/hpFriJXn0yxW4f0NMbmxO4Fp6bqayRUQSWr2QaheoWhZwAIg8aBEj3S6X39HLpcYpgnZKn1whw8P73av3c/aKrcBsjNebeUa8wydCbVkiMOljmxcOk0XlwOlNfxG+/aBNJO8j1GV9/9iQoICYQ0p0BoCxixrQ8RQ0QIQqDbsSEKfpHmVzoPSdUyPFeI5wvZy+UhB+7PBbVPkpq0WsRkHfcAUxdP6R/TMcVXg9Ha4waFPrrNrxKfoMGb5oxrjvebNtpwNhEfHaU7EauVmWkxt7dyKMJ794chwoldSHdgSXW19+oUvzdmGCeH/6pLImErNY6NN8gA5PWs1SW7O/miShZEAqJmLME/c2Zws3abrxaYqJqlDFyols97kzWrJSTO2Pn035MIjLVhT75M7eTVY16Sg/pFGewBiP00
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39840400004)(136003)(376002)(346002)(366004)(451199021)(8676002)(6916009)(66556008)(66476007)(66946007)(316002)(478600001)(8936002)(41300700001)(5660300002)(38100700002)(38350700002)(4326008)(186003)(66574015)(83380400001)(2616005)(52116002)(6486002)(107886003)(6666004)(1076003)(26005)(6506007)(6512007)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qMdv0sspWAEpTtYTCd+wUtntELmhhAucPxn8+4IkvRwew2ojRyoB8BGOx7KF?=
 =?us-ascii?Q?tDT3sEsnyuJEz0mu5mz5TA9JCAeWx6kWjuUovu70ePszpD8PKoW/tIBBLKxN?=
 =?us-ascii?Q?STWfSZEmBzS4RnecKluvSrDmJ5baX6ScABdegf278wGiFUq2q0j8RYVwy9rf?=
 =?us-ascii?Q?t7VYixflST13jMtxW7woPW8N90P8p3qhEcv1t/a5fY6V1Qa2v1vam4TEujHM?=
 =?us-ascii?Q?isWerahgrrI/6oOT6jusZagt92wyPWHk8K2++FA2rqmDbcqfuNdn/y6sdbR5?=
 =?us-ascii?Q?sy8oEucmbRI55m3E5/6NAoVFk2DM+XO//UCA0slAIYTi63roLW1822PJvJMG?=
 =?us-ascii?Q?KvyDWujoDuVFJ0KO5tCpeeU2iwZ/PFglg/Exyt8spTB4BONt3k5s7wg4/xt8?=
 =?us-ascii?Q?Cc/XNQ6EIFbTPWDJKkSTk3nmkqdya7O32aN8Y5UEp0+r/ntGqeKkyLCg3Jb4?=
 =?us-ascii?Q?g09btqavO+Ku1zC3H4ncALXyTRD2WrbFUXE+skLQVtuzWiydfgzXA/tI8KmU?=
 =?us-ascii?Q?LUNpHRnVPYmkDWko4GnOgQSuEEVaVT6ejwA4pgcvMtsJK6XE2h6sJ5ZmWp4l?=
 =?us-ascii?Q?ltVbzA37D5qZZj5b6eJGTLuOA00FEtM0g3QmKTrwcuFlgdTWyH+yJiMxZInO?=
 =?us-ascii?Q?HomtHo9OHGCg3VBIpv1hMRON6NETnrm2sR/evGyB9RuoUwnM3Uu2B8siJS9H?=
 =?us-ascii?Q?HtUEiC8ZH3R5G5UOlRX6Kithh2H6qy+IZlZpf8sz6rRlDdcrSPqYtQnNXBAW?=
 =?us-ascii?Q?CGdHlTBuT4mzUPTKClxOV7p8MG1kj1NWYIgCLy9eHi96s3arYRtJGVcOufKE?=
 =?us-ascii?Q?jYzO8fXZi0f0Td9HJeFnMJOBWMJsVbQAWj7PiiXkGcD80gImXT7u7j06mv+E?=
 =?us-ascii?Q?1Tx97v6h/3RR/8UrJeVpyxDN6fGYBIs+xW7jYxojoNmRIH7d0XA66zgVOvEh?=
 =?us-ascii?Q?Nt7kzB1h9AXg6+v1goj39xMr8uZD44zpf8yFAO02gpBe//ArgkCTML6j5KcB?=
 =?us-ascii?Q?m7HCLuNI19iGxF17KHrT4thEucwotBwiYH1ZVxfahNDldI7U48VZBnoQme7Z?=
 =?us-ascii?Q?nei/fYNWAx4b0EtzxZmejGHqC4qebNeHYR/RLVjqOITO11n/Llo5/ak91jln?=
 =?us-ascii?Q?GjedfCt1fnG/0U4zh7sKppYxB71DXcFtRcylzewK7CeD9X2u1r93ggorHgbU?=
 =?us-ascii?Q?7oJmWb5VsDOU6dClz4hDVRdnFbVux0k7uQ7cN4fshrbBgDW6FqJtJPTMezRI?=
 =?us-ascii?Q?vWBxSxsIaoHeFU5f0fkvwHjPPkwf2wISsLWJ5IRLa17v9elrLv21iF33PhWq?=
 =?us-ascii?Q?oN4ezea6evh/1jy8b0WkjGQNc/wNn5BIVz1ko3hf0Cnb11Fgt9TjjqCpW2Xd?=
 =?us-ascii?Q?GiSSBapxUNpGnBrNUDdbaEGXBxXu11j8u+niKVJjFVc5/FrSVzQZRNOnYmDA?=
 =?us-ascii?Q?WfVC1fGBcLMreHqxSqYUMTNGS+BtSU/t/COeVhq5x7nXFkRFtHdfymRougam?=
 =?us-ascii?Q?astbwUvK1qT/pg+5/1dkyhwaKkGX/XKnYCDmHl60TGca8w05bmB+27o87nqQ?=
 =?us-ascii?Q?avF8C5qP3ad/eSgR8cbc9w/3KmovcKgEbaovtXMk?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e2077a-c341-48a6-f447-08db34302119
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 10:42:32.4260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGaZaL706vzvBpwqDWURnH6ODUuXCw7kBeDhXU2+JP1B/bB9dQXz7q/vg4tcuRdDgzwgJTaO4BcCuTEOdymjPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8659
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 10:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179609

This is necessary in order to preserve all the extended attributes
set in do_install also in PKGD directory, otherwise they are
dropped and not stored in created package(s).

For the momemnt it is only supported by OPKG package manager
as it has support for libarchive and tar implementations, which
supports ACLs and xattrs.

Fixes: [YOCTO #9858]

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes/package.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2950218145..b0334d9190 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -863,8 +863,8 @@ python perform_packagecopy () {
=20
     # Start by package population by taking a copy of the installed
     # files to operate on
-    # Preserve sparse files and hard links
-    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -xf =
- -C %s' % (dest, dvar)
+    # Preserve sparse files, hard links, ACLs and extended attributes
+    cmd =3D 'tar --acls --xattrs --exclude=3D./sysroot-only -cf - -C %s -p=
 -S . | tar --acls --xattrs -xf - -C %s' % (dest, dvar)
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.34.1


