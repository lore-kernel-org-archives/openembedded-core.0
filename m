Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D77C001DE
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:40:39 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.88])
 by mx.groups.io with SMTP id smtpd.web10.5411.1690231232263140200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=oLv63B/X;
 spf=pass (domain: welotec.com, ip: 40.107.14.88, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vc5T6i5sYF0CyRlVf9H8Pzgdj980s5ME8CfaoUh5PfEsWIZ6sszwwSlVa22sQ5SQY3ZW+z9gcII0X8dAzM+xUh76a5qFg4Y60noRtQbqTAPQ/4zXsyQ/2sxsgTughqLvDMYZHApDFAedMVi9bMFRFVM+lbuV/1+bMw6iyKVI8JfMh2262Ozs7yTXwLK23fgnfU/Pli0zopGZZpiBOcUKw6VGDtwzV/Zy3CsT91VGCYH+IT/p6wUaO9ua+wP4f5KmfmW0tVuGegIq5HQ2vNPrPy21Yf8FFQPnhOBttWovZK1Y0NvW+pDlduLDMaNy53FASBPZryPjTkjbnd7M7MO8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCdWttzDb2g1Sa20qIkYayCUckOrAqLGBEMkMbBk6OE=;
 b=gAqsPrvTGnfJ49sZzhPjwPyZkGIuTUyDDTiaZRYoE0VDe0gr6vYnFfIUSgvzcVSQ47s0cVWa3uXl0YEw5g6uHCPGTN6KajgngSqajTJhEj3BOfaTGSgW5dJBxAhYK/2uK5k02DWABaOkWVdRlEeKxn0qrlshKjULfvrSxpDGcSRO35GqIhzGta9uc6SmOELSvNKM4cCloJG8martuZFvf81VjbMpROAlIX+rrwFk5coQjHMPERZhfO3OB3rS6fCFLMUZfozBzXlkMnzjPhbcE+V5fiJs67fSFTjOH2TD82SVTY5SVEazirbg9mnuCzES69E9Dwgo6OQK59+bGvqF5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCdWttzDb2g1Sa20qIkYayCUckOrAqLGBEMkMbBk6OE=;
 b=oLv63B/XqqssE9o2zvofOz4+NGzCN2FLvGmhaRFyZyOSj1ihKjmZpq4Ii4lTfNFxi2LMA5qioTXW1FsHraoye4ntpZSZGBmmzCwEhXKdGuGyyB644Dzzm5DWk4D8oHsNi48fmC4aw2uHIKtR8kyPfDc79caFGVCW4ueWmoIfc8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7608.eurprd04.prod.outlook.com (2603:10a6:20b:293::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 20:40:29 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 20:40:29 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: Henry Kleynhans <hkleynhans@fb.com>,
	Alex Stewart <alex.stewart@ni.com>
Subject: [OE-Core][PATCH v5 3/5] opkg-build: Add zstandard compressor support
Date: Mon, 24 Jul 2023 22:40:16 +0200
Message-ID: <20230724204018.352695-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724204018.352695-1-p.lobacz@welotec.com>
References: <20230724204018.352695-1-p.lobacz@welotec.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0317.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::7) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad52bf6-e9d9-445b-ae29-08db8c8637ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lqeBUjrWM3ApmhHXud0AxL3IihF96EjBJxj0cG5ME/fBcvAzGXKzhGI9Cr84A9jyayKPmSn3oh2qW4eLZnML/bLeaOn1gqRWoIZdnHdami40NG4CWYM+tS2NDnks9FTBLTL62lIjK/8golYwkjpoWZaSjPcQoR2bFe+QqRXlufJaLDrMDRrm8b93+D/5vy2OD46iAFcpTI/Gc3wheoug3Fxx7xgcTTiITkygnDanhRGDXyp24t9h4KfmkIYiAzYuHeAfoLnXBkpWsd+BrlPd5h8k233e6M32XxFElMQ+DLxeBOjz3KDKiXrATKwnRyzEcSolBDL/JOb5elnZXC/mmcOkynsr/87PgvxCPraMwpolPaYHoXgxRkQSNKrE/yjvivE4lSXu1B+8OnNNmoAae4pDYzHZvRk8ZxppMZ4URJ6dX8BEogl/kVMgLce7Qj09lLk/W1f+xIWO7C+3d44Zmk9Dmj6j6LJsO2leyZ9C+H4fpYlH22G3oW1MkJUgX5u2Z47WVnQEhdI7MZFfjwuYGOyI6q056gu28J0+BcL90FR1yJv+q2MQDvpz8aPIxwIprcIJw3CDz+pCLEzKGb3lveuVUso0kaAIkcprbRSt878y7Dt/8vlbG694LEAExSck
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(39840400004)(346002)(451199021)(66556008)(66476007)(66946007)(316002)(4326008)(6916009)(54906003)(6486002)(6512007)(38100700002)(66899021)(83380400001)(52116002)(478600001)(6666004)(41300700001)(36756003)(8676002)(8936002)(1076003)(26005)(186003)(5660300002)(6506007)(86362001)(38350700002)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2HjINm/W0xuInG52YaIYb65FCslLBeRVvzb55ODKoZ6ZHQCiRuSGXGVZo8Jl?=
 =?us-ascii?Q?tKHSILQpG0FgGe6n5LtHPkSNlhVVvSuaK81fv3cGBfXjEARAtbG7+okyc45n?=
 =?us-ascii?Q?0xsvM+mxXNR/kYbvIlR3JPr16petr4pXCYEFfhxwE7gn+fsQxgKkmNKS2nNs?=
 =?us-ascii?Q?L1z0bEiSNAfnRsPyWxCmzFrz9Xgpr08XHpPaItsUP1x37bvq8dgRLERGVfMc?=
 =?us-ascii?Q?64jrfd6ZNeD6CSfSOoBtDa0ynj8OC95YRmYlpu0kuz+sJUBdckgE37IC1hX4?=
 =?us-ascii?Q?rhuDdzqI2/4PfqIwpX5zwA5i3/GrEYuRb4bwBhhCkbXS5hetQCM0v4bhCdpP?=
 =?us-ascii?Q?CI7dnCuCS9WEVWD/ETBlCQrjxfcA5iQncX7F6DSJBRXA/vAObRVWLCjcEEA7?=
 =?us-ascii?Q?2noQYr9OrMwnK67ivGQZUQYv2sQOearhNIwdwR0PxuTene5d71rdDP+njTbi?=
 =?us-ascii?Q?GoKF3eF6+nqWah9An4UvFBmliFYhDYj7jvqBoNO1u/PPpwOgKoWWdb1PPf6F?=
 =?us-ascii?Q?YEW3gUPH6s2zcrR6ROFuikzp1mA5Dlymy9s0lPBbaok+yiNvkl1LtlQ2LDDY?=
 =?us-ascii?Q?tyHAn7uDi+Lu2Tzqa1hyWm0uiJExszXUHkV+EBLqsPncEPd4qQUgNhRkjfhw?=
 =?us-ascii?Q?33yKzHbwMifpwbZMssIaabF+NjS+hfUPt4n8/Tm3NrvUBViWehqGcuofTO4R?=
 =?us-ascii?Q?nptAG5E+FP4ckV/YG3WepcEVH1j0kHac1qwVOQUA8+BIadHlRAzvvzUy8pvV?=
 =?us-ascii?Q?AkP/R8sBTwwraAAoTLyfX8NCzgomOu3Artj2GrbmLd+6tm5L1nx9nolm2xuR?=
 =?us-ascii?Q?YkskxzGtDG8GXqcrmQyDvje3us/cc6tzxOHN3CjqlTZoH+7nqe8vQNfJjfUq?=
 =?us-ascii?Q?NojHZ2wpZnM/oFysNDOvWTYc27lMbytGTwTTm0kKxTvFIgX6DDQRq26IzndI?=
 =?us-ascii?Q?BpQpVg0HOr5cOQ1aEsh71qQYMnx+QVRMUrmWefZN7ONVOGbmQ0pxsDSJ7+K5?=
 =?us-ascii?Q?7XYnQVpZvN17VD2o9eLP4DqUzAphOqFJNVcuy2tQ3xFiO+34GgOO5upu1Vj+?=
 =?us-ascii?Q?2CCNHS7WPJ/h7zyIJ7kZ2yh7oJRKlnKVlmjYURcoPG0FZYxFsmqt+RsnW7cj?=
 =?us-ascii?Q?jiKHml8kAdIj92O2O1ceXsjSgt3tGpWOcGg3Nwzgphi3McwSVa1Tr8VwPCiV?=
 =?us-ascii?Q?+Z0dYKrSq6M2UXC03coErxmZTHLISr7b5l7cyQiprBzsCrvxrBJAz5y5+Col?=
 =?us-ascii?Q?OXaY5dDLmvvrZ0Au4sYKmRMB6T9qj8u0jKyHfdw8yYERSGgh3waEa5gaZr5i?=
 =?us-ascii?Q?cXqW3j5OcGRP+sZ2eiSzOiIwk9k0irHTHGg9URceV26W9dONNaPhVAGFtFH6?=
 =?us-ascii?Q?OI1I2OWfnkQ7+89DU2q52D9neWS+GP6hQk52+7/1Bs2F4ZlModWpjK09H+hq?=
 =?us-ascii?Q?dFmPYZmp+4Jxj3GZAN/XroWN0gZ6/rPh1IaZo7EuK/itUREb+K5uZLIfcnl2?=
 =?us-ascii?Q?77m46TTBMCbasdxmGL5saGkG4TXYbC5MqbA2eC+PhdecnsSyqR6Wnz1GYjlq?=
 =?us-ascii?Q?EUu6lQgPwoCuohBusJaKJgrjb1XjrThyhtQrLnDJ?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad52bf6-e9d9-445b-ae29-08db8c8637ca
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 20:40:29.3809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQXX0NAmZVDgyZfEXCUwKospUyYVz+NPh/mwG6dMmsJr5/YFjbRq9ToEd/yi9qM9uVP8sk2hXs0PngYCl+uEaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7608
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184810

From: Henry Kleynhans <hkleynhans@fb.com>

Add ztsd compressor option to support using zstandard for packages.

Zstandard compression offers a significant speed increase at
decompression time over the current default (xz). This is amplified on
less capable hardware as used in embedded devices.  Further more, it
offers a slightly faster compression speed at the highest compression
levels with a slightly lower compression ratio and the ability to
choose your own compromise between fast compression speed with less
compression and slower compression speed with more compression.

Zstandard would therefore be a good solution for package compression when:
* install time matters, especially if you are installing on less capable
  hardware
* disk space is not a concern: lower compression can speed up developer
  builds, especially incremental builds
* disk space is a concern: release builds can make use of the highest
  compression setting to reduce package sizes

Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 opkg-build | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/opkg-build b/opkg-build
index 3333020..a9e45d4 100755
--- a/opkg-build
+++ b/opkg-build
@@ -183,6 +183,9 @@ compressor_ext() {
 	lz4)
 	    echo lz4
 	    ;;
+	zstd)
+	    echo zst
+	    ;;
=20
 	*)
 	    echo "*** Error: unsupported compression scheme: $1" >&2
@@ -198,7 +201,7 @@ B<opkg-build> [B<-c>] [B<-C>] [B<-Z> I<compressor>] [B<=
-a>] [B<-O>] [B<-o> I<own
=20
 =3Dcut
=20
-usage=3D"Usage: $0 [-c] [-C] [-Z compressor] [-a] [-O] [-o owner] [-g grou=
p] <pkg_directory> [<destination_directory>]"
+usage=3D"Usage: $0 [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-o=
 owner] [-g group] <pkg_directory> [<destination_directory>]"
 while getopts "a:cCg:ho:vOZ:" opt; do
     case $opt in
 	o ) owner=3D$OPTARG
@@ -364,7 +367,7 @@ Stop with an error if any files ending with B<~> are fo=
und. The default behaviou
=20
 =3Ditem B<-Z> I<compressor>
=20
-Specify which compression type to use when building a package. Allowed val=
ues are B<gzip>, B<pigz>, B<bzip2>, B<lz4> and B<xz> (default is B<gzip>).
+Specify which compression type to use when building a package. Allowed val=
ues are B<gzip>, B<pigz>, B<bzip2>, B<lz4>, B<xz> and B<zstd> (default is B=
<gzip>).
=20
 =3Ditem B<-a> I<compressor-args>
=20
--=20
2.34.1


