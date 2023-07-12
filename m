Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F8AC001DF
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 11:20:32 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.50])
 by mx.groups.io with SMTP id smtpd.web10.4837.1689160823457464085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 04:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=Pv4ugaOK;
 spf=pass (domain: welotec.com, ip: 40.107.6.50, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A60R9CUzqlusvKRmipkF7WIm5tMHAvgFb1S2cPP5MWUOKGSB1zrVlwmqX4vjBxFQn4uKf6NHERbo3FDR6G4H2nRxG4j4xStvX5Uj+a6PqLsAg1dSlgIxR0kC1+aK2cIN2UU6C3LIQaqgenjjhIi07JK4hTw3m9XClbZuq9/IoJ2zhckB3fkgkdLLX0RmVzEoDm+MD28dJFaEvcMYZ8I5DI2KwLfKB763iga7ND2W27s9W4AFMOZpTZ+hIyBXzIata6VvxLqr/mPT2Z5KhQh5KVcyvUAfs5+3thhPjn6HZ4kLiR7f26kMnceL3HUImJXRQvboCFy0RvFJBxH73EhR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=lea9xPH7OCuSk7ve8XesDH9LV/XnKj8LgCX5VbftHSRwf9wyPMlQoZYkJ+DC59l67npPzkKFDsuL7+KZjEVoB1rOSSCmOja6C+Vc8k/DXFryM16RCseUzcFemXSBL9FfND62etLsgSKWUxkCUG7HVoM2pl+pN6trD3JiPOw9/kIODHpBTKg/4vzQmguW8dPT6+yxv56WOzE7ZD7b/eLW/dbxRpeEvhZbZf3sJUSEpPGvES9uLvfNkOx2fkQgrIhqgHA/9CRK3H7rAovdIYApHGTLtzLPS6JdKQs9w5OYwCMv9FWfONVNi0z2w/8YJnDDq/MV1ROjqqdxJDpPW5qUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=Pv4ugaOKys7IHUi8tteBhlG3BtD9TNq92dN4vMnzm8Jovckj4ev4/Z+ByBRncsPMNEP8A+FdkY1pCgoIOGea9mEnp4CqwZqFhoXtItbcXW0aP1Va+A5sv8joDa+PS8QnwqSM5HW0OChXBG26R51XEn1cub1iLE29vfAg8ZEPUd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 12 Jul
 2023 11:20:20 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 11:20:20 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v3 3/5] package.bbclass: add support for ACLs and xattr
Date: Wed, 12 Jul 2023 13:20:05 +0200
Message-ID: <20230712112007.705867-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712112007.705867-1-p.lobacz@welotec.com>
References: <20230712112007.705867-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::8) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f14d44-dec4-4094-c77f-08db82c9fa3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2ouDcfdOX7m8Ii1qBkDBvj71dfLQBIXUwvsM7PHKV1901QaLr4enymAZEuynwFsm1G/gIEnap6YJIYz0nyu8b9gyRwUeXrNretq4TPtETtGC2N506Yp203R01HxODgmZRq8FuCAOfVliOavWcex/lqMEPqDC3zcH3L1fejVdjPLIo2bEXfTfWCf4VIBPJU12tXt7Ik6qdtiVrz9WqTnqU9XpGIAwbQXOEFSGC+JJzutUNd6IDU+fcdZjndrNbkvuLIs3KObu1L9u/v7TXMylnvdMZei1TmozDQJ6m2thEbygrXmg0gWsWzTxtW/ySz6Qe9jXtuOnbOPU7ijGB/4ZHOMsypW4rTpiXyUeePpXRPkyej2+pWolxMTSOw/VJ9hwV4VlJIuu/jo9gbVhHyF9+/z2uW0bxYjSCJVTaAs+BB58UeZ4xH9uhob99EiA5LTmcrxs2Y96mQ08wslODDWcQ5DhaqWSfmBmZuid1sswOEpRzJ6ceh8Wupe44PbNG/uiR9g1s2QHME9VcpurHXhqjSc2h/1lHP1yheSkMDQkbjVpeJfp/ey0IA0XJVigR5Pw6v+P6CgjzQwEHYz0EgDfqFwQPQWvesvvlUcVzr1+eYszfOISr3+uMqtl1o2lLuEw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39840400004)(376002)(366004)(451199021)(107886003)(316002)(41300700001)(52116002)(6512007)(6486002)(83380400001)(66574015)(186003)(26005)(2616005)(6506007)(1076003)(38350700002)(478600001)(6666004)(6916009)(38100700002)(66556008)(4326008)(66476007)(66946007)(36756003)(8936002)(8676002)(5660300002)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xzd2DmJTGNWZ0h6Eg46AddmNiwOAyTsMlYw04yK/kSZGxDXqDsLDRexRulna?=
 =?us-ascii?Q?Y3fEQfAu/nkGxpzL0hkMNj4OneqRMffKBAMJwA7b8+v9puBiEvyzcFnEY6Ma?=
 =?us-ascii?Q?umlp8DPxIn1jnIFyFyuco0nINZq7f/wCyptCcFhLlN31s8xFtIUdQaX3dwYa?=
 =?us-ascii?Q?j0eWcrVNODmLR7LCQ3frqlq9BDvoe1ZFCHb5sX8zx579dgteGRfqN0qaIYic?=
 =?us-ascii?Q?lBdkrFWcqgi11wQ76SiiBfLqRgER+/bsRp+Z3kdzc9wd2eGh9riBkeXzhUOl?=
 =?us-ascii?Q?CZn8tkuD0pare+w/jGDFiwTvc8k47ooK83npKPji/K0jBkys/EjLnLlhNBWh?=
 =?us-ascii?Q?fbrCZBpCngoES85JqBOQCQ9G9LlcIL2TaGhyyXRAlV7fDg5dywEjtADaco73?=
 =?us-ascii?Q?pK//yKkZt0VaaJCF2+fyRFaHqofcRYp+FoyEqmrwqAmsXe9caAAm5QaQ9yyt?=
 =?us-ascii?Q?ZGKEAJEJztiX/Jwpn7BEKBsYOjHwMBkiPjVK+339IFwt0oQWZwQvRXlcqmrq?=
 =?us-ascii?Q?+MHwIDZKHFssUTUc4PuKGuhRQ7qpFGfCshnBqbJJAAynwItr3vJRJ/FfVCW6?=
 =?us-ascii?Q?+uytoZdj/fbEFGWE2uKX6Yeq6lhDCgGTlBuubwkkkawR5+MezoZR9mcgYH2K?=
 =?us-ascii?Q?Z5Uo4h/Np6B6r9WtmjuF/NXIsnyLVsEul+Xa69VmzdqRPKL2hFENupxwfeIR?=
 =?us-ascii?Q?8OABpTJJmtKAoJyL7fr8QAb0ag1O1fITX9m8hkc+WtyU4F7+/EfV097t9tHP?=
 =?us-ascii?Q?mG6Ru0j5CkV1EfpArq/X6mZ2No91tP3rS3DUHXxN4wqvShHxC49L7j4ghdD6?=
 =?us-ascii?Q?h3ieW1f1XJIpMb0wzhZr/48jcgWPRwVkHO+2YXPNPtHq3VdRCCp4zzIFklVv?=
 =?us-ascii?Q?AfsiOTJJySssAaMAZK96PIHirTIEDe1dIsm20S23CCSyo7K0qHp7HAZTnKEM?=
 =?us-ascii?Q?uS2MgvCRsFjOMDTOTYb2bGYlY64/Lt5aPkH2v5KpsRVH9RNMMl9GA9Chlgzq?=
 =?us-ascii?Q?0p6HgaxRHoqAVOM9A8aSkZaiMHCsmtNF4NEaOvfnjNORncK0Jq0Vl2A9IH16?=
 =?us-ascii?Q?q/yFbdFKycjMaP/W50f0W3bsNgL2Jm7ofaHwbs47959syXMgTPt7M7LbbcWK?=
 =?us-ascii?Q?6JoKmSWA7KvjZqr0SKFDRSG+Fq9WOb4ywBWL9z1/w7u5J2IJiXj90bduW9Rl?=
 =?us-ascii?Q?DHUWTfz2it4c/af21n6qnEbh1B2GyyoDeqLkfoQLI0Rye/l77NvDXtdf4vrI?=
 =?us-ascii?Q?Mi/HzgeCbobBPnYzwQMh1phjrIdt6n+MKnwtgUnsVKmX/GWWd4rBE/JetzCv?=
 =?us-ascii?Q?cas5elhhy2tX5P+d5CHP7lJKDGt0/gAME06maLp0Ql7PLC6MYBCSIGVf39yM?=
 =?us-ascii?Q?pmnVZPqkwOBLaxqAM+Ako9z53rBdluXtG/I8Ax14deQhGgEJa+skgG/6l4Ev?=
 =?us-ascii?Q?yrCQdXHrNWamM24lunRQRA1ubSm+kD5o5Bo5+Sqw0vxli9COHuyQWzBLpt8g?=
 =?us-ascii?Q?DqtuFULkD4rHCuV3kX+cAeCuh6C9PquGqCh2CQap8GO298IsqOCfHcdD9+Rf?=
 =?us-ascii?Q?FOpn3I3XgZPV6MDnYzZ3qspju25cqooC/nPTxi1k?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f14d44-dec4-4094-c77f-08db82c9fa3e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 11:20:20.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zd88Xmx6/HKWRKBfYgTjBljVNNfgpl/3f8C4ewtOUp6l1NfwkAsxoJfjP3xbHn0C3B5m6h3icPLg6nG9OCabwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184179

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index e8055a9cdc..6e5d0dd4dc 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -342,8 +342,13 @@ python perform_packagecopy () {
=20
     # Start by package population by taking a copy of the installed
     # files to operate on
-    # Preserve sparse files and hard links
-    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -xf =
- -C %s' % (dest, dvar)
+    # Preserve sparse files, hard links, ACLs and extended attributes
+    # TODO: for the moment only ipk packages are supporting ACLs and exten=
ded attributes
+    # we need to add support for other package systems as well, but that d=
oesn't bother
+    # tar from creating archives with acl and/or xattr support
+    acl =3D bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)
+    xattr =3D bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', ''=
, d)
+    cmd =3D f'tar {acl} {xattr} --numeric-owner --exclude=3D./sysroot-only=
 -cf - -C {dest} -p -S . | tar {acl} {xattr} -xf - -C {dvar}'
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.34.1


