Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA37EB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 19:04:55 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.77])
 by mx.groups.io with SMTP id smtpd.web10.4464.1689188688089454094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 12:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=i9BMyza7;
 spf=pass (domain: welotec.com, ip: 40.107.103.77, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OttxuRXvUwteSCUGjZB+2uTGaXp6TFVmG0RMK1a7FZJc00F75NvkgAANzCICcNjx0cu8DtmpaXQl8FrECHgRmvNIiQKc6S1Yf2mwQQq7DpbkVBB2nQG2REDq4mr9zulCi5HgvdXThE8UA/FWkUSUUTl+ijBP5AVBJmPQ9mmL2q+i/HpNIauQsaSonZkXTo7y61nOpY7r4Kmr7ESbs6/KVWOJdazB7qszjplAFElBX9WHaw6fZatcyyUzAenQJxF7OmrL8ZPwxeMqlihsmrtTk7UqHRzTjsk0iRw2CWZ70q+fW81V6fvv2z+r/NwWjDazAm4I0nknpab6wqG3iSmRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=NywS89+G9MPKoQvJ8RzglhtokohXlok7SwPFiLiDYbWLY8pZB5YtCeU6QY7HMbzXoOWvPtp+dieJHrV+nTaEDc2Te2pB43LmWywyMpxSx3Lh3MdIuqBYenqEZfLdZIVVMkIisxRvYeDnYuPqNnr1PHSXFZkOjcgxZdoTCBj92mLTJrsFs9w28H99bStE2KsTyr/eIksqA+RQRQsvSv+DSLzh4/1hNygrTqLxMm5mLDjTpRcb10aluiEBJmnevBXn1ZyNdIPQc8IvvQ/zGg2gDZTuB2HV8ibsR0wRNRvB3m9tVgab0hb7TmJmDHxc75JKfYPya9WLj+lLZ+Am2i7hWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=i9BMyza7THj0u/b2KwPXT1zrcjLWq9keFIopyjzDm6wuUu/cS9V4yjogHQIJQF/Zq9hEVu+3g+I2w9yytgxaSrkq5bg/U3v8XVSh4ATxrRk2T06ALEbfLN3Hnb53bpbM7nh4h8/Wx25QysLNH6fDIMXF+Wu4TSp0AyMcvjhAD6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 19:04:41 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6588.022; Wed, 12 Jul 2023
 19:04:41 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v5 3/5] package.bbclass: add support for ACLs and xattr
Date: Wed, 12 Jul 2023 21:04:26 +0200
Message-ID: <20230712190428.379909-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712190428.379909-1-p.lobacz@welotec.com>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::16) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB8PR04MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf79378-dd33-40b0-d1a0-08db830ad812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qE4i/oP3BZq0pt2SVSIzYplUi4Ff4MK7WwFKrpE3vzRrVsAPzgFrPvdpXe2N805Kb7GM7TWEgzeX8SRZbV93TKvVJaEveteA88zoAzRb6WRwnGIAGLmy7noi8uriBgmPmy4n1L3nX3EjRnaUSOoUxyrOJD3ZEOCQA1XAkgjCRIB/x1WbFanWJxnqOnaSfWfDZgvipDy5tRgKCPrTXyc20XOPETPWbR0Tdljf4kJx0bMKML9ocGLDD8x3JTZl74Jr5SoT5giP/GAG91LMiS63LbKfmJiuTyqNS5VEc4ds2CiHtLkLP0U9SIOhT8Nl3/v13MH5nJpmzj0kwiOTlQr1qOxlNrk51WQDGtHt9Zyc1jXcCIFYgoMCbXdCio5F9cOpiUrpPYSfwuWh3vZ6V4yI2tEh4OWMtjVZCbNxFgfazjdqhlSMPtmOtfNorEF2CP8+1pBiVe8QcnIzqEIVtzBGSPljcWBDjYNDmh7W4hBbHmRzPG5MA8TNjej5uqLhO3MO9rR8AmBSxlRCRhkmEujF1LUzpexCAiAMeJYfBlpi+2FlKK8PUyH4+jbzeBtdwrEaRQz/ZkwIcbabPwDVxgHihjjRJm1iS+KgK9oFGqb8/BTRXdfyyx1v4yPHpkobrcpY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39830400003)(451199021)(8936002)(8676002)(38100700002)(38350700002)(66574015)(2616005)(41300700001)(2906002)(316002)(5660300002)(4326008)(66476007)(6916009)(66556008)(66946007)(6486002)(6666004)(6512007)(52116002)(83380400001)(36756003)(478600001)(6506007)(107886003)(1076003)(186003)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JYoMBkAZUMxUrkweuBRaF7r9JYgBKZA8P4LClCPQ6siuTbjTc4vSxyQxvJ2J?=
 =?us-ascii?Q?abdJL0mDdn7MIL239HiKwKoR22fyHH5xOaQl7wm4fvRz43sYKDH4t7ZrfVzU?=
 =?us-ascii?Q?ZPxyMCp1pSILW1t2Jg+oxBkgrD8DRE3GomF1DRYIdFlp+wSOjzaY51zR2HhG?=
 =?us-ascii?Q?r05KKTJNEqO23Ex97Eb/4sTysnzBrupJZrhZbEWlRV55NhhCtLCeLyKCdjMb?=
 =?us-ascii?Q?oxPOWpH0XhB4xpKRM2OH3GpFT9d6N9YBfSCENsUJMg+Tbx8B43BPIFtWuAq9?=
 =?us-ascii?Q?TfzUZhv3qdFNgnGbt4Ts08uioBD8QmQInoOJauXLH/gxmGAYFvR3LmtYUnnK?=
 =?us-ascii?Q?QTGOjOljBUW8AYzPtb9r6n2hzFzlBrRd/M3C2ln1TjRZYprlGuOF1XVUOtWI?=
 =?us-ascii?Q?xhNRohzREI+aE2ZcwGFucxFhR7hR/TrRnX2uPmn7x1kmVvPKONPldEwEydFm?=
 =?us-ascii?Q?cS/rdT+ZBin1laGCDHTgpTFuJseMkYAYQG4yAK5paVTS6Jp7D/U9hvIlb1YK?=
 =?us-ascii?Q?uQbOBPoJnaq6a/I7+4qkGcyu0MXhsLZsV5RjvC9JKJA6YowMO1TY19j6OJCQ?=
 =?us-ascii?Q?xf74FfVeP47wmO6HxDlxs5jIrGDnaQ16c5KS4wt6d4LcoorldF82XgEMCY1f?=
 =?us-ascii?Q?4R/Ft8dwk0IiNpaFNYN1XIOvBqDD+qxitsbnJHtc8M6F6qHuMTb19hdMwc0s?=
 =?us-ascii?Q?FJK9s4c+uwca2C9g8zp6qBB+nhrx2GsHVGMSMxOeuqMmWTEHtDwdu7XJWepq?=
 =?us-ascii?Q?XkNU/jopzDJAgtlnDpdiWghqHQjAW2+gyWxLcch9YYlk0bPXzO5CzB2ZZbAO?=
 =?us-ascii?Q?+aEtgxzk23wJz6XYFPOuvVF19iCUpAnkaBlqzwNYzjmccmYnmUqd0+shedi2?=
 =?us-ascii?Q?+oWoUuiuAyLJIyAQQ8hi7BdJ1VjIpcYSt3pF8H053J/b6r0BVAS18lD2NfiF?=
 =?us-ascii?Q?X+tfXNvpQL4XyG41i2VSBHyKsdyQb9jzsZ7MoX8jkGp2Hbm7DUdHc5uNSguK?=
 =?us-ascii?Q?i7h49fomfU9T3PFD+avCEDzcbF+ZiCEUoGpDtrnEwKgAj3iyl+KaoR1ocFtS?=
 =?us-ascii?Q?Zlv1iB/Q8tmp7dUvgudgzy9/KnDJ9+BL0sljnaXIAvf0uX9V7Fm/aIOVWDN3?=
 =?us-ascii?Q?I48uTIGj9qGTj0idIDTXvzPqBPQuIWFGVHNZekyFxotEw7+ppUP091nJAXwM?=
 =?us-ascii?Q?5xtncOLMusU2IfOqB7WZfbUomD2dR2Y6MRInXElNSRySRphWfhJCNrIG5NkU?=
 =?us-ascii?Q?d09Zw72zwcKOG4AFfkPSfgzqc6NMXmgNSKq/rdPqRkwMMV+5Wxs/Eohb08kf?=
 =?us-ascii?Q?QtekRDhmgvtHcvBqU/MkGmpXQqxqLXisVFiN7MVO1npr5VD29dA42T4lAgVJ?=
 =?us-ascii?Q?QjHM6Y1RWqRaAOwoGL8yRhwruPjZ2lYCI67sj4OndDIVo6SRNKVKzbHe8drR?=
 =?us-ascii?Q?heOAruH03BZiuW1LNabOJC+AuvapySYPBbuYPvWZfRkeGgTlLedYxa9637bG?=
 =?us-ascii?Q?q2eJ6GI9HO/s7xxGIOaIimA8jyufFJNfXT1XrTtCVQOdz2ZjfaqLRWgohVwJ?=
 =?us-ascii?Q?bprgUhm62UgyIgah8f+tHum/H8yx+WCbw4vRtIHq?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf79378-dd33-40b0-d1a0-08db830ad812
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 19:04:40.2476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcqheY4RweB7Af5Iv7g7JneSGDf63cr/EBlv1qkZBhFdj6QeniF5fLO+JSVuDP9VKNhCfS8QvY3O2dx/0Q784g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 19:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184218

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


