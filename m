Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94E0C001DF
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 12:07:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web10.5650.1689941259106516710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 05:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=pVPIoE88;
 spf=pass (domain: welotec.com, ip: 40.107.20.42, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSeIwGcgHor/HaHdUmjt5vffbe1VADW4bcRW3K560vgl+g9XlR/616/qAqjOjVlk3+kyXNkMvLjQHu/jsJSsWvg2fmZIQ0L0DFGGTl+PP6wQRxz7NMU0ARM/i9SV+U70mlrfp59pGsg/0LtjmEVlNWia6pXiL4bRM1i3wcTeGf9JaPJgDtV6CA/UVD11MoiTy3SKve12tpxxnGCynxUOT73PHqeSf3UGQPrTddCbpIuUW9b1d0I0jxfOQYXprd5InoPFsd2vqj16YV2uwqADk+Zs59OzviUQVa3roKzKDc7OqHycsVHJtccBO23EFnVucE9bfbr2ZqfCrGwc23DZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=BwNd08+ZAkxX3AI7ppjwe8qaPgAv9KClcqh0XzjmD0bfmTAR+5jSdOCGxw8x1WoRW1y46tBTmcFYkzBUERNAJxigVBAtI1SSfzaBJ8dt0/0opOKTyYJgsZfAaRVClyXxgjyOYuRIctPjxw4+OZb0isaufbmUkYF0lWZIgipt2hBJ9OOOQ2XEGHxOjRHJjr6wKiZ3rhnu5ewpkRMaStHDoxhOlwCg1dF5RTm3xDk70xZMBJpHN+myNyKH1K91jnfn4ewag7uUuQJKDgzFLXGqGUhcBkc9If7NcO9XdLEhDsOuobc7XztV7+PzdnpQIWM+F+jitnBgLS9iRWsW0DA1ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=pVPIoE88eB+gkTFFvlvPOSqg7VrXy5bB2HNjsLp7vuMmIErmfncVPXo33lgHrWxIs0Bd3BIar+DJcAJrjqKIwa/tBH9eHFM7sCgr7/XEBonDZXGf8OuNWl11Y5NYTreNTDDjZcgwKu9wp6qqueyOX8B/L/GFdOBgR6JFI4jNA9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 12:07:36 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 12:07:36 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v7][master-next 2/5] package.bbclass: add support for ACLs and xattr
Date: Fri, 21 Jul 2023 14:07:20 +0200
Message-ID: <20230721120723.4006443-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721120723.4006443-1-p.lobacz@welotec.com>
References: <20230721120723.4006443-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 92fb15ed-021e-4b9c-80fd-08db89e3120e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nMnfeognu9jEYHCkC9U0m4tPTxiEq80syYTFgG6py9nlCYTsSk4SNjnZ6qjK4nZHcWZ9whUrTTWgGdwle7JabdxT83Aaf1tvvV4CX52y5lO+NU7PAKg3OQhuy7tp55RUMi2rylDtgkp6lLdRgwysJBoiTl3Rg7B3oh+p6R+jMlPNbVocAHh6fQz/T0/4NE1vk0RnW0q0N1GvwYzRWix7U7xdugxYJpsvHdvecUlwiJPrkCdOY7hSAMoerz0rRrJqqq4wbOOIG1CDndkPsFDzurYDJOe9spC+0QaERU2nnXO2mrwJZw+d3SeSbb7Z+Bpm/HVvbTAEFNB0qnrH9CplByOS5qg0UprYmnWkmrXb60Si0uqHeRWpNpRS7oGgSAD3rfM9R4JvLbMOlZ3pb0oliIAS21NejXxZGLGUAqyExXVfykY5EHQHhaqE0EsO2TxlxJ34n8y2YXwjevFrbQcgHIBTTmeXtnVQtU2ttl+9nKLkooyr+Op6hZFCCUBHWeRgtVwzvWXMYDmJhXlyAAsBqrdMkkwqmscCUIijFl8XJADbrHM7qZBLqcNZLtMEkRouXiPmFPb/WhyhP0QH069tqQmN1roRiqT41hbauhLBcDIJsw2W65JShb5YuCjZMfjh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(376002)(39840400004)(451199021)(41300700001)(1076003)(6506007)(26005)(186003)(107886003)(478600001)(8676002)(6916009)(66556008)(316002)(66946007)(66476007)(4326008)(8936002)(5660300002)(6486002)(6666004)(6512007)(52116002)(2616005)(66574015)(2906002)(83380400001)(38350700002)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5I5rUhScwCzs9hwQQvcMcBBu3qeq0gwySOlCCXqQazK4Wtz84+vEn8S2dQze?=
 =?us-ascii?Q?1ecQK5Vzr4hMn1mmUE8Xks7f8VSDYQnLp8XFnSFI25SDSOrXNddOK1dWcA9K?=
 =?us-ascii?Q?S3cJdyQlTK0yfn/H97E6GcuORvIi6bg1AoMzEkT2hXSoP21Bb4DE+a+/wsOs?=
 =?us-ascii?Q?4DOtXt3Z7ObaJWbFtvLwK+W94RVMSSUODt+ULyC6eVv7G0v8wBztP0wJkDUH?=
 =?us-ascii?Q?FDSLnQZbuGQBwZZLR80TrEVysf7FVmAE2Yr68X+o0W4e1nC9GFlpxchUmJUb?=
 =?us-ascii?Q?48RuI81E8YPlhcnjvHFfnz3zbhKLzsG+ycNneeQjee0N1mjIxlMGlQxRRiRi?=
 =?us-ascii?Q?UatAPFaSojqNbOufz0iTC+P70girG3Gy6vfAGZ7Gz3vetbgU1te7zuBf6t9V?=
 =?us-ascii?Q?w6/mMuFcIMJU0sIBWzKN27IF8M68GCf7oYKoYU5JNvUkCaUqIcim5jDMN/l5?=
 =?us-ascii?Q?p7n6CuZWcjknocLZUBeuGBFZ8jVN67I6JmN6cjdewVtlVunO/Z+2H+4L31xr?=
 =?us-ascii?Q?NtTYWAq3hzOYiKoDnuo31sGMm/2a9incQv4/wkSPZFd7llpb5ftWgoJzeOtQ?=
 =?us-ascii?Q?CSDGgfIbBKiI/nCnUe3+1LnLXpyMI4JmoDegqQlQmE87uC6RhSoUO45uCTAt?=
 =?us-ascii?Q?9Fq1NHOMvByOlR4tCpo/mWyrpl8ms1KWNoltuAzrfSiPwoQYM+VUmtAD+6w4?=
 =?us-ascii?Q?98gUOOOgrSQO0zFQj25fkXOrsFtOnDovfQbpJt0v6gURZ2ahxs1gX/X8V9TZ?=
 =?us-ascii?Q?ZWn+M6A+8CC14DkdU/XxW+7UINdpswxaSHCECx6+4H4/t0kL7WM4J1Ezt/Lg?=
 =?us-ascii?Q?TbseXGqbVv6G43sCvSe6lttZ+So56vntE0CtDA8MNTdeB1PlDkMiQ9f3mvf/?=
 =?us-ascii?Q?moMDyVMsg70060+X1KaCxq1bNZA4GArh8Li8CE7DKNcFPtCHoXOdJUcBGqqA?=
 =?us-ascii?Q?P5aoadM70FfG1wsGNwEJQ9amefqaXTPsVy9nRx4Nqexii8IJ34Sw5Pk94euI?=
 =?us-ascii?Q?3hOuUgKUpyd9KNvcVlx9ruXmKI9um1MdVS4lHrDA7HJQtRASpb0g5Vt0O1pp?=
 =?us-ascii?Q?mhtL50PWfTlEdKENFiuzowMjcgwU8i3QHm+d37EuuX57q6h68kLkmE5TCbw/?=
 =?us-ascii?Q?iZgWtzF6xRYUpdQqj5dZrqo1S6mGJRYyWZicMvOf24Vw3bWxUmWKtE4GGOL/?=
 =?us-ascii?Q?LqYXrIVMo+2mysSFodClvUNKwH/wxeHrRtNtOjMBQI13pa/2QB330NmTPjUA?=
 =?us-ascii?Q?p2QMe1kSQBjmmedhVQPXKHuL4HtoM1G3lR2DfXM6hyrdC2DOo34YqqvnpS86?=
 =?us-ascii?Q?aFhM45xdQZXbNgFPgDi2ktFLHo6YJnV7ZeZPTz7dgSXW0jwM6h9lu/Md7KBl?=
 =?us-ascii?Q?7Ev7KPM5Wu0AKt9BfYB2Ehp9Bo06BH0iv50r+sr3ImlK7K9WKmNDom2Yrhsz?=
 =?us-ascii?Q?xTrHpSyKHSHkYaWKWaOWRO74kxryN34ECi+ouAF5yTk3SFJG5GvTkvFHhZm6?=
 =?us-ascii?Q?sSNS92Zh7g/dEI1LPYP3YeqAKzavirO7DUfGpIG50Njfp8mUPe+sl/xp0rS2?=
 =?us-ascii?Q?L+Ab4U7oijKta0sL9eDC5mO8aTozadZEsFk5GvaZ?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fb15ed-021e-4b9c-80fd-08db89e3120e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 12:07:35.7872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omIXk3n+czlskHhs7GSR46+oFClLDztrgFMwPL2/xT94HTJC4JUurzfubUAcZkLd3fx4donaKaB5c3TqPPJckQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 12:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184689

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


