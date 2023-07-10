Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79736EB64DA
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 09:59:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web11.35842.1688983162832059003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 02:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=bYz3lSQo;
 spf=pass (domain: welotec.com, ip: 40.107.22.49, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTS7DgHI+szit1U0eYMreaZfBqfBuHs7p/QgPj1Md457fk9HbCC+X/9pDPy7aUPLG1EnAw20bsJ+DyZ4PCXAZXYoLDlhkR8CssylOU5ahisXFEG/uN4821MvDa7k3l19fj8C6wuQJ4ZtJ67Il6I9RlWjoQqjcLILpngOXK9fIVe9oRnzEskecglu8Th2SiGo0R5nr3fc1tkEtdaYWw5K7K9KWXx2fnu/mX3ZO5HoUTMESDofVnmZSi+Mph4H72E/vKpFwdrLk6QeBiw2L774lj24Rjek4hUm6jUm4G/huBdJ9rXeAbds8XrJCNJ2JAEE4CoGECOB4KbxZcjWG4YkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcY5wmDUfzefPNyTYZ7/vLTA+gLfzm8/GZ4q7gXC2eg=;
 b=l/GLUhq9v+aGnSLDLYD7Fb6IIF1VWuktU8crsOMCYiz4yDjY2kZgem0SsCMrdaUIhYCjWrTLtqHypE4HfQ4ybjjLor6VRsaCWsHe8OcRimhtVUUPmSCuBHkHhgNHJjYvgjqNIFd41snuxhSwyubIIcLBqM7LcFGoKZxG6llyu8XzOJPuIvLNr3RYbl4SnCsWndGmTzmuy0QBYyXn0+VQagSEibbTGD9F8FGrdcr00JP1c8J7rMdfwvr8So4lJeGCmBrbA5udrgrcakdQQ13Op0fifrsVku7epk3Yf13SS/wYapIY1X0PerBY0Kcc+boVuGIYyQKocIH+2y1P9a0qzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcY5wmDUfzefPNyTYZ7/vLTA+gLfzm8/GZ4q7gXC2eg=;
 b=bYz3lSQoynYy7vbiN/RCFcPY1XqtAjNmvQ8mRNNEB7WKv4EsM71PotBabV1Eauir4rk/60ZOPgi4aS774KocSpedB2ySnQA69sIzoLzyfNlDEObulUp26Lff5gtxHAq973l9joHVI0RaxuI7BJ9fnjUyHsDUYnnGHfJTcPDkSNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 10 Jul
 2023 09:59:21 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 09:59:21 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH 3/3] package.bbclass: add support for ACLs and xattr
Date: Mon, 10 Jul 2023 11:58:00 +0200
Message-ID: <20230710095800.2033309-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710095800.2033309-1-p.lobacz@welotec.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::15) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: 009f1b50-9824-42ba-2e2a-08db812c556a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mF8d/Tt9AKtdvrzpC53UAsSOaYQoIOsHNfvc9yTEYup92XIE03YLZBbOh00VsF23UUEBkOB1NIMUx81GAxVi54u0fs6AaDfSCv33NZ13H6WOI7PnkdG3leh6y2PRZ8ZosVF/Xfoqtk8zqYCVg9e6hnkdLQt0Pw12Np8Asy9qC3NB9aoXGhRFgkGaZaJbnU+A2hHItHWaSNhldrd1xd39aokt8NpCk56QilTsMwC2OwewQPWsDLww0sBCdDn7z66ebecs3UKZKKAkyMacEPT2tZumIPeUpkD2qt6p4AmFmGzm7VbWmoNKXfLupFNhTCZqAIIR7xwykMQ5Vi0FSW7wTMVpQKZx9rBELrLA10rlMVyU8o62LwjP62kurE0hOh4K/VzOxBw+MyGlqezUJ/tFppQdWQAxdIp5EaxjQClNMnsnDnlE0Ucm0PFXwR7O+/0lR6xCY2VntD30F7ZtIDr6q/t6EDyRWTNdUIl5rq5LNNLm5qvmHk62Cowzm9ZhdxLaXTlq0d+3SCDlM/oQrynRTIR4AT34UEhNZZGsFIlxN1UkuCJTVQofpOFRh3xZlKOmuCdAqb7CEmGl5gJrsEJfAd46kq3jFx9f7RqHU74C6idO+Zbadqf0QABU+adSx3vr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(346002)(39840400004)(451199021)(41300700001)(2906002)(5660300002)(8936002)(8676002)(36756003)(478600001)(2616005)(26005)(6506007)(6512007)(186003)(1076003)(6666004)(6486002)(52116002)(86362001)(6916009)(4326008)(66476007)(66946007)(66556008)(38350700002)(107886003)(66574015)(83380400001)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PbqNE4W2FiHZOqiGtwfnvh8h8nxGPHyGaOZdqNYFd1EppcB1USx+eZxHKSSw?=
 =?us-ascii?Q?9CK47+/G3+JZsGrouNLa+RPXmFMnXQmgPbvrTNa9RuQlxjGAmRvgQKXYPiob?=
 =?us-ascii?Q?cJ9kPyes9bAqU8dOqud2ZrubaiKl0TAnw7m9+sldbz5O7DEbnxPC3yNMuR56?=
 =?us-ascii?Q?OTNGTOL4+J+3T+2ILSukVp6aYeFohUdLiHfh+ZiA+T0mQjzeA2wikIh0bN8z?=
 =?us-ascii?Q?K20U99Y6gRwYRBQF6ePUWbNTuZ0F1IlmUEifn2+TsSAaQ7JyEH1Sqh9pfWE+?=
 =?us-ascii?Q?QNzeEcNH/UnnJnsW+kuAjCb//OMGqFeE1EGX+mJKIGvNqweIyD1kYCp3kUHt?=
 =?us-ascii?Q?Ge5HiPgk/zDdRsd9PQ9jL22+5BiGSnpt/mxUo5CpjjOTKAzJIa20VnRqeK50?=
 =?us-ascii?Q?HpuE5WElvxGklUaK3Ix7aZUodPe1kfUAxOw+QK34U5hHbY5Udu1mGrFUU6Ox?=
 =?us-ascii?Q?v10SmPGzb3deWRaq7kJFKPeaLvPQrCyRcFOnqmDjV3yoJYw6SWP7OOUHx8bP?=
 =?us-ascii?Q?G3SEVOX4HjE05Dyrj8DzhTpaUR2UE7Vqm/daa1mvzoYKYtARap+pET/JfO6S?=
 =?us-ascii?Q?FKsH3p40ZJLIDjhKivNrWayq5rAZLNPyGIugkooKMETxoQA+rBKUP4sR0whL?=
 =?us-ascii?Q?E6jqYbZ1IK7gcIMqvtMUlV+arYXPNk8/7TeUEuXEWY+zKpd4sT2jqayL813I?=
 =?us-ascii?Q?EPTdx26I+8GZN6Unopz6BK1KOQnQZxk3VOzicGQft9XQ00rbuvnrqkUccE3N?=
 =?us-ascii?Q?/s/WleCcHQiPfNsKgn3wnZ023wgt5hhZeSHPVenDirx8Zc57icMA2eDt0Jzh?=
 =?us-ascii?Q?aSvBwmEsvopl2jwx1JSCdFR+zmQmT6w1Oh433v5WBhf10838PnS/P+4ufTnn?=
 =?us-ascii?Q?Zq0pTogS2XcXsz8ThRqzO4n6rtJkThNAdxV71rtAuzqMNpXZ8tEsHh5lDPMc?=
 =?us-ascii?Q?j+BAh4QIxsakGsL+tTTuKtI+m9mYpQ7fJGN5SoAjbc1BbFo9UiqRM9sYBEan?=
 =?us-ascii?Q?w0Fnytq3DA8cXsRROLtRkbMka6f6XWIXEwktl0m1si7sY2swA41KfDzVZcwj?=
 =?us-ascii?Q?CHKuLRUnckTzQcA0oIBY3naWSYAZyW8rOr60kYmqqpSgzAfgMsof2ZAE5ONP?=
 =?us-ascii?Q?Oxn6QkAKDto1JkrR/MTYNmZQwed0pjCt1hJ3WNA5yDnOvx6lwFCzh61Z+ewu?=
 =?us-ascii?Q?Q/CZw3D+8fDCNmqaRAsL/3sVAAg5uJVDv50MnwtUgpNmank2ImKcW+ddnTjr?=
 =?us-ascii?Q?A24jTmtKqDS/jPq5blezmQn68MAq9/YwTCcZsMZKbxekH4qRQbOkplPZj/6Q?=
 =?us-ascii?Q?zmfHYS6D5+aLEkGwaJd4ibkDJftMayZ3d7idZvnEJqzchRu9bV6ZNeH+Sulc?=
 =?us-ascii?Q?Rj7WZtUDctRX1Q9Co9KNIrBrMDkxfSe3U9MeRaagKq9MWBXbnqD3wk+fYgth?=
 =?us-ascii?Q?b7CLY0KLsl3S6N108usMLU4ug4jslKtabrDCDagToqGMtK2BJGKkBA8XVGt1?=
 =?us-ascii?Q?VVv6hnw/rwGdOpLPw/d5Y6ZnqWsYrSEJwA9fc/F2LN6a2OrLRD4bMkr9x494?=
 =?us-ascii?Q?KewG671hgsgSTVr49CyCLBn2XaEem1H7L7LZnBMB?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009f1b50-9824-42ba-2e2a-08db812c556a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 09:59:21.5731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfrJkeH1/D5sYBKm9ae5f27M9G6Uj6tn7E1xkzBzL4IrrKXVKPxK6AFhqEr54n6WsMk7i76+aFIyO8WDu6WBzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8703
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 09:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184065

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index e8055a9cdc..7229e4f2b5 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -342,8 +342,14 @@ python perform_packagecopy () {
=20
     # Start by package population by taking a copy of the installed
     # files to operate on
-    # Preserve sparse files and hard links
-    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -xf =
- -C %s' % (dest, dvar)
+    # Preserve sparse files, hard links, ACLs and extended attributes
+    acl =3D ''
+    xattr =3D ''
+    # TODO: for the moment only ipk packages are supporting ACLs and exten=
ded attributes
+    if bb.utils.contains('PACKAGE_CLASSES', 'package_ipk', True, False, d)=
:
+        acl =3D bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', =
d)
+        xattr =3D bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs'=
, '', d)
+    cmd =3D f'tar {acl} {xattr} --numeric-owner --exclude=3D./sysroot-only=
 -cf - -C {dest} -p -S . | tar {acl} {xattr} -xf - -C {dvar}'
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.34.1


