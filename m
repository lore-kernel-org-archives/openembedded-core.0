Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533E9EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:26:22 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.50])
 by mx.groups.io with SMTP id smtpd.web10.5969.1689164770219531763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=m2+WvkTx;
 spf=pass (domain: welotec.com, ip: 40.107.6.50, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNYGmFHuV7W7ItNqfIBns7JUyV5gvXH4DhJvJz72KwEVDY5aHQQsA/z8rnzQe3YM/MZ5jjylO7p4vL+ZxDVvY3MtZHuefzOLywqg7ARuwBZ7IY7LatH3daxkcq2v25o1NRxbm042w4uxlLM740QetlohSsiRQyP0awojuZYETlylOQInLFzxdcatih5RmonuHb/WJKil0Cnoah9lvcWsmysptBLeaviNqsW4sC+SsYMYVaGjhQsggQTjqkuKNgLWkggzLGp3A/t2GbdmdhNkKGM9NEPupS3os26sqZId5dE0BAbCg4yLI9+Ncbu9mw+H+OWw1gWhgFP3PD4ZTuGeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=D9ZmgJyEUFyU0eyrgE2m4t/SPG9mk3j167QArRnnXyOTUDTrwH6SL+krymPqxgTadYzWSvlLL7k8JzBTCf0FsaD+5xB3UOffSBmimL5NTH/6uOR+0IavRsWq8UdQRQx0pKn6sbhFJIKNboa2Ykkrc7PfXPYJW5Xvf6VPdkik705W8DxBOj7zKZG4tSwYrJX/Z9a6fWxF+ih2amoW8Kse/YwDQo2if4rKczcvqkCaiViSN+ZjDe9lWALzmvPunUKOv1KoNlwcFkVpXrkVLBbjnJmtLEEIuYdkLPevwia3lG0CSZOcxeaI/sUelfrHD0clVODQQ+DDQzKYbKd2+Bbdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=m2+WvkTxsSGqtR7AufIF8BXE0PnxZT5DhGHOs4m1ui3+zlrKJmuK8XL1snxQsHFQGdxHWiasc4eHFIm3fnsNARVrPMkfQIhi3gAKHEJrS4stABIvBUrROhUNH/mrdNX53UUMKo7sIlQUH9lcMdpgoYnHhzyEmN24NJGLg6TD3TY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB9204.eurprd04.prod.outlook.com (2603:10a6:102:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 12:26:08 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 12:26:08 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v4 3/5] package.bbclass: add support for ACLs and xattr
Date: Wed, 12 Jul 2023 14:25:56 +0200
Message-ID: <20230712122558.711029-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712122558.711029-1-p.lobacz@welotec.com>
References: <20230712122558.711029-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d00b6b-18a5-420c-592b-08db82d32b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FBd/STPx09oB0D7wcK58RPvVLBO7YTRd3scS2avphUMe6+3iKYdNOh9YC1Mx49A0GGucUUmTATJbjFnRaCn5DoQGPjW5trPlP6eTmKja6BrhBa3V6uRDkkmFjOxyCsjuTsovlQiNKushJU6FdAYRpUI+0tg8XZfr7pt89kt19pNocDVYBIrmTW4sd27nweTbS/TTKM1UYClWQCKivtfutOe228D1ALr/8/Xf6rSdmCA0dFOmWk8OPqX/Ep13Q34LQuies2Yo3EJvk8U42AlCcoO+9qSp0IhS9YDR5Wgu13O3OzxRSBR4QfmfXooHn35C/pG2aoiYadcFY2vSR/5Q9v0IW9IdqEnECuMLtMk0a4vj+9jFS2ZosKw/WmmhCJxF/lcsYC5VgIxRLVXZkDus/r+K0Zg6D9D3gNtOqpgn+ilX6k2Gkui89CRi5zrkx8x9yqPrHtcBTVq52rYd0mA6bSqK4zkKPfwyVYpf1OXmQY4V0EwsCLHvturIqcr+mFa1TX+pN7lNL6H85KG06K+/3SV5UQJBaxU8yvn5ZAwoJ97zYIXZM8ZeXl6Kn0cdX19yYE3I7h/5vdbYgb/z9vYvK1IPQneyVrpvHL9MNDXT38ncDrJfjajnUIQxgNe5LvRt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39840400004)(376002)(451199021)(6666004)(6486002)(478600001)(52116002)(83380400001)(86362001)(6512007)(107886003)(4326008)(66946007)(66556008)(66476007)(6506007)(26005)(1076003)(186003)(38350700002)(38100700002)(6916009)(66574015)(2616005)(5660300002)(316002)(8676002)(8936002)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+B+OJloG/MtHFeN6OReTQBgEojYk6xinec6RdwfMiZNLH77IkdTsjOYd3C2O?=
 =?us-ascii?Q?Uxqcbfa5QMJOexo3WNlVgmGYu8OnR0wHfUJfbzLHdZwdhmWxoy+pSmF49XHa?=
 =?us-ascii?Q?MDLjl1/xProxj2p7b1pZ9idRtactN4ADiYXym7hCaJw60Yo8yVLrv+C5rHal?=
 =?us-ascii?Q?gSqWIF8OlYoA2DBT4yivae51aVPX6lkbiz2AYFfiIG5xMnzLVoi2KSrh6Tkg?=
 =?us-ascii?Q?6FqLaoJzCKaxTaUKV159rZxGy6kFKAz8uRMD9Rl3JT+TXNxEHlSw5SVk269j?=
 =?us-ascii?Q?2f1hXReeK63x5FXB5QjmlunYUr+tPO/l/OIB/G8bUb9MVtgC+KZ8vGoVwsV1?=
 =?us-ascii?Q?bPGXZjuhmt0d3Rp68XS4Iy4+HyytjuW561TVV+FfuUPV0yXVpbQRIEWIX91j?=
 =?us-ascii?Q?1rPP3J1rAO316QOhGtaBZfewRKjSyGIPwhJHoc4jSe+MeZi6IahDjEakp0mk?=
 =?us-ascii?Q?XmA4HhkMhNbXm1osLuAu9dcKGX1BrQl9cAughnKbuYsavHxy8u4Kn3dItNOm?=
 =?us-ascii?Q?rqkYfRhCYfFrxGlUAeNyRspyPCpgp5YXEzR52LiVwD7ayjOfVjKFeZR8DQI3?=
 =?us-ascii?Q?RhmfmvGKihus6RcfKHm1rNwiFdgTmk7VdoiDY2Wbt8MP7fJQP52ychHeMTwb?=
 =?us-ascii?Q?PA/fv2aS4BRHJfdgRv2YAcqtxVQTHK9M5fyT/CdxHLp89ORGYBXtptStQysG?=
 =?us-ascii?Q?73vEaWqNyEmf83CUSlXhW140tj9mhpqheyU1Wk50Gxe6Gm8Wld7OAV67c6zM?=
 =?us-ascii?Q?HhjaZ93O8almOyOPXMx947zJaDo3h2I+LMaOaA5mZ/ROD+NN/940S4Ud4kZT?=
 =?us-ascii?Q?UN8Ns8yduV2EIrPaFvWXb053rGOoz9uILOtxJRjj2+L8Z8oN9UZ10JoSwq85?=
 =?us-ascii?Q?WZIptUV4x/14P72zLCNvlSFd8lvxTbvmqXMiiYL48o2wMkTEVXBoiLfHTVXL?=
 =?us-ascii?Q?kQ+838k2OMPZh5uH6apnOaEw+lDDVMw3Rk3gbxk8nw7kWvyHo4Z7qETFrZsy?=
 =?us-ascii?Q?1ZrlDtHrQT+I8+VC0RkeDpAsVsPeUSIzWuxTvUKiVjQ4trcfpJ+mWN74xrgn?=
 =?us-ascii?Q?IO/clzxK5oY6PNlLz1XS6Vuq7L6VWkPQ1p82a+AAzVkqT29+KkjxQ28I/m6g?=
 =?us-ascii?Q?bAOlFyL+zES1aauKfCUvos3BqupvpcljI8RpO23Yzy/IYvsgangQTFAUnlKc?=
 =?us-ascii?Q?r962t/488ItfocR+2ifC1WvHgkcvV52wHiCrJPBYehyRNupGLUMiopUYZiYr?=
 =?us-ascii?Q?AY6FwG1QU+9GmWYRPavJXDP599MbSgUbWxSS3nZMoKyduCfAg9j0qrUzJbbK?=
 =?us-ascii?Q?wjVvC29A9TJJmXADs7tiF7BTizUnmMuXf9joTi4BlD8oqFF7NKJn+cN5jh1h?=
 =?us-ascii?Q?oWh4lOqgMWZf0LW9Qq7bpfV5PYWWvA96IJ5Q6Fo3u1GfStMdsCji8Hqoh9F1?=
 =?us-ascii?Q?Af0s6mjKVs6Fa3u+OEXFNctqeL3eioc7tNxtrV8YNg3adDfAGskBT6of9/Mp?=
 =?us-ascii?Q?11mSG38G+TOrv1KP5mNQ7s/e/sb2xS+XdwGJlHdDdqj+NF5TiEl0CXmLgeBt?=
 =?us-ascii?Q?57h+ZjQ0ye7x9OPmEQO+wQFmQ9WX/9HdqXr/G682?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d00b6b-18a5-420c-592b-08db82d32b40
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 12:26:07.9702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmFdfSLF3PDV7fjVvuLuKQ23LiAiX6gtLhRX2KF+To2TVq/JnMItQm5wyRtGNDVi77XAWxBviluN97JAFs4LtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184191

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


