Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80B9C001DE
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 19:49:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web10.4875.1689796146017961249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 12:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=sevaR2GQ;
 spf=pass (domain: welotec.com, ip: 40.107.22.84, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfGZHa1M/uRfVy9gvzwXRCGTmoMWlncyIAP4NTSGKYOkMUcgZnxXV6+6xm7QE8IOJVRAABvFj37WfeY9X8QjHtuiS43ivvOktT27txMxeNmuL7c9wXh1v+u1Sf/NHfQ9S8AOx8DcPPEoNVvooPc/5Xz6ylekblAHLVPSrC7i0aH/RAqDB4LtQiT/3V9m/Y/RPnti0lB8rlfTzRKchSSQt8QK4+zB1y2w5WOBLixTP/AJXWC/n8nfUGLgjQiilUPjHY27N2jF8J//jzbtSMF0gtmyZJZwVae/CBUnTZXZD1KZzb40drAMC1pyhGWH+8mu1ctrvhdduDaVsSzOVYzxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8WY85S3HzUeKkAzZdQjNkkIr/f5Mfwxx/weWhlHJBQ=;
 b=Wyq7zvtiYk6Hhy+9dVWKVPbvbBDH4ZytqIp34mbHT2zYDXXalB2ph2c7AleynGtllFL9nI41giyKcWs+ylf5b94QsQGjhMZM0Y3LaUQaRf51vzWYrAL0FMeQJynEcy/wyl023qyYQ0Z91Dxb7WydcrRnzw7zxQYQKuVbSDu3sCw2PKaUK2ZmdeBTmPyk6J21l1HFqjS4KnK76SgIKadHjHBN32lvRAOAtfV/P/JpZ/vQOX9By8KahTH7hqwIphuvl7N/xoIVRpkl6W0NXyg5aOX4DZ2sMUgmVec53u7hZSsB3WRcYkc2QzH9S7PLDRLSo7D02LgsAOxlMmUtAG7v8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8WY85S3HzUeKkAzZdQjNkkIr/f5Mfwxx/weWhlHJBQ=;
 b=sevaR2GQX85ei+qO1pIlN209Rv/qr9vryMotfwRT+pguEPls6O6JmTbTnySPMkxXAlYOUMOfN9tF9OPSkInUMdX81F7Q1/LVf3xsf4eYXQdAsNscNzfOChZ2HLt53hIoUzW38xb5hEJCL3LgX7AGIm86pFAeDE+a4uHNm2nlJBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB9107.eurprd04.prod.outlook.com (2603:10a6:102:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 19:49:05 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 19:49:05 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v6 4/6] opkg-utils: add acl and xattr support
Date: Wed, 19 Jul 2023 21:48:41 +0200
Message-ID: <20230719194843.330741-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719194843.330741-1-p.lobacz@welotec.com>
References: <20230719194843.330741-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: cf26be42-7f7e-4625-85c7-08db889135b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mC6cVyY8TkJuFl8OxqMODhbkWuT5ogB0RAsSsZw1X7vP+V6slTRZTUDDxDuhTW9JlMP6FcgqEoUqaLW09QD/BC0RHaHRrqr3iwiH24aBdUPcmJ2mU3Z9JcCt4RDxGhbxT7dE/G+A1wlcwjfrIB4NY8ZRL3Tx03B+pUbhIt9gGTilYtzRC09PA3QhKUr94CiUcJQLz7EfGpy18cralGWRWFNC2MXjtwakYbWRcv+400j39Ke7kQekZ9HPB5Es88mH4r1ymBAj6+orKNa7TOl1Q9rxElLnKFdiiNHAuEQHn233RG9s0E5cqhWkSkQtSu1kNA3HqOZqZ/2PfFcocszvYkirSqTMeTurXC65yWI8w7YTOId2EuvvQBqygPyH6J9DtVwzHa4Yxaj7uaxvLauA1gkTIR5rwamvruo8UUxd4uXSE0XMpmCE7Y0wFyhUqRW5q+Q3hvCRnlSzNmwsJZas5HZEXrSqqPbdBkzTjCK1TZpempYZ8YVOqjUrx8+Pj/o1QwKGZkMBkrdTzf57oujyFzPTjMhdQB92fQbJGwTvV0ewp78t/nqlb4Dq8rN0hjO2tMQYE1/z5lDXWBtRsXSfN1xBi0UD+8vvn/SVspZgdWI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39840400004)(396003)(376002)(346002)(451199021)(66556008)(5660300002)(66946007)(66476007)(4326008)(6916009)(316002)(8676002)(8936002)(41300700001)(2906002)(6666004)(478600001)(966005)(6486002)(107886003)(52116002)(6506007)(1076003)(26005)(186003)(6512007)(83380400001)(66574015)(36756003)(38100700002)(86362001)(38350700002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6Xx6dGltJKk4GfRiq00wZaaYrs8YDKg+14yZZHjMXNQWlgxm3Rh1YcpMUeuT?=
 =?us-ascii?Q?EEAxDTjpRiQouj5fjmV+0y9NtjnZTTb3/5E4woTn9J2gHr0XJpVM4DTtvKYo?=
 =?us-ascii?Q?8R0uZsWBC8g0+HL4/2UoowbW9A717JN8J6F/c1cv195PRTjSiibqoHxN21o3?=
 =?us-ascii?Q?StrKfrXyyqKTyMJSvCk/0kCwPsm73qqhCZQCyrEKTrMnhuXbCRfF339MmDyK?=
 =?us-ascii?Q?XzK817di5bGlZ1L1WsKS8klNRV/6aafVRkmQHe1AGNQJu/dITpuMn2fYx+gX?=
 =?us-ascii?Q?qC6J+5LxhHFDhzAECHMjnIGnQfAKxLf1XTze9GCFagPSwtn8Y95m35ACgnxY?=
 =?us-ascii?Q?MImWjDgt4XwjNHZqC8q9PRAzUVwOy3kZ3Oiaztxh3IzvGDoYSau6LpnavgPB?=
 =?us-ascii?Q?EXf+qRd22LOrivewaY+hJ5MEaL2Ju1Bp6+9EXDTCbSft8nb+v6mh3w8WdP8h?=
 =?us-ascii?Q?6VVqbIR6fNe0JY4wK3YDPafPp0Ss+3KsyaL3W7DaadURdITouEXQwi/jGfoC?=
 =?us-ascii?Q?fRsfLA2X5AsEshq8l1oMcnudwzGFrx1yoefqECGu4vReqmLkaJ0KwIYbyExN?=
 =?us-ascii?Q?VoJNyMqVZoLqJ0ojLQFexoJ2pH58kn0eebGaD9yX+UfdZ/xFNpVAnG2R/L3n?=
 =?us-ascii?Q?vlHUlckXRjCtcsUUm347EqfU409fbZf2clSyDMpV10kYjftliktEBQPq5ylG?=
 =?us-ascii?Q?X1c+Z1VTC/mR+oeY7olfQVKPr3EqDPmLkeTHbuut1q3v/HEpAYVTpaNjjUg6?=
 =?us-ascii?Q?qup0Jdd2zpTb+2Ebl2cYu7BB3euV2crMBa2kuQDcmmY3JgcRx99V0nKCjALD?=
 =?us-ascii?Q?p2NBh9XnT3pCDoz2dmiV0rmV4i4WUpAe+sQ0isLdan7K+NXApqVy7la/D9GD?=
 =?us-ascii?Q?5xiucrFtO/jTOVtgKF+ZllaYwNeT99r24R/sdQX/WZdhrYA9dsezjiHoql0b?=
 =?us-ascii?Q?kr9tRrAEgNzfE0jrCqP+Le7Xh9/cfnjbL4d0eJxA66zeA8xi69MChAzZcOyM?=
 =?us-ascii?Q?IeaJu7SJEgINtgNhancZ/z2UNdm/buSljDF3Q0B3Mdz2FE0NvUMRMgsnmEtd?=
 =?us-ascii?Q?9g5T9J0WTR3UPG1yk600dS7/M7bffRpuzEUkGFy/SP4O75M8qNZrv1ZWejaM?=
 =?us-ascii?Q?FktUb9/FOzdY/W3R1KCyEGWe8ldjtbMRrtn1Wd3Z3Q4cZGob4N+4D6afWedP?=
 =?us-ascii?Q?C+IseQtkwUDH4RR/0D6qeITUYL9w3cTJcefZwm+XH7eLmiO/2ZPBG1GhvxCV?=
 =?us-ascii?Q?7nLk+vRdU9ZaCBEkkD76cBpJSH7rXHjcDbkOU6yf/G3PvBXfXLc/c2yeZUaw?=
 =?us-ascii?Q?hlSJe/JAWP9QtsywEqoXhXd6/wgvpX3aU3eH/vvZDC3Tpz0+BZLK0GRE4NcS?=
 =?us-ascii?Q?8qDYJeEaqf5aLBAVeOVF2W26FJFpLZE0FZNaSWjXHu8T0gpQZeYJI/vcmkPt?=
 =?us-ascii?Q?K8vUuXfdMOCxCvhIK74Qj+QPp+iHD7lFWab4nwnOQGYvb5DiZkqeLaqka23f?=
 =?us-ascii?Q?y29yzW8cKJVyCR1jBecaw/PG4z5cM4oV7cEJR+ZwghqjkNHrqMdZFoDdZUhl?=
 =?us-ascii?Q?movCnm8PLoUIjcLy9zviMASx/EWtMjXAqfLQVaWT?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf26be42-7f7e-4625-85c7-08db889135b4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 19:49:05.7154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRK5ghd1tON+hoobRIMFN7/UNk6YY+O0cfpo2iKVCHr7EhW46sqSYSwlECDbViJKyKkKyMfLyZI1fd+B1hqaow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 19:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184597

Add support for tar archives created with --acls and/or --xattrs options,
PAX header format.

GNU tar and libarchive already supports ACLs and extended attributes.
We can now add this support as well to opkg-build script in order to use
fsetattr or setcap inside do_install command and end up with a file in
an image with the relevant ACLs and xattrs.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...kg-build-Add-acls-and-xattrs-support.patch | 80 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.5.0.bb            |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-b=
uild-Add-acls-and-xattrs-support.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Ad=
d-acls-and-xattrs-support.patch b/meta/recipes-devtools/opkg-utils/opkg-uti=
ls/0002-opkg-build-Add-acls-and-xattrs-support.patch
new file mode 100644
index 0000000000..a9e5f0e191
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-acls-=
and-xattrs-support.patch
@@ -0,0 +1,80 @@
+From 5664c17923cc1ab9644ef01f549bc8d352dd8868 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
+Date: Wed, 5 Jul 2023 10:31:13 +0200
+Subject: [PATCH] opkg-build: Add acls and xattrs support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Add support for tar archives created with --acls and/or --xattrs options,
+PAX header format.
+
+GNU tar and libarchive already supports ACLs and extended attributes.
+We can now add this support as well to opkg-build script in order to use
+fsetattr or setcap inside do_install command and end up with a file in
+an image with the relevant ACLs and xattrs.
+
+Upstream-Status: Accepted [https://groups.google.com/g/opkg-devel/c/dYNHrL=
jDwg8]
+
+[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15097
+[2] https://groups.google.com/g/opkg-devel/c/aEGL7XRXfaA
+
+Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
+---
+ opkg-build | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/opkg-build b/opkg-build
+index a9e45d4..8d9bcfa 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -145,6 +145,7 @@ You probably want to chown these to a system user: " >=
&2
+ ###
+ # opkg-build "main"
+ ###
++attributesargs=3D""
+ ogargs=3D""
+ outer=3Dar
+ noclean=3D0
+@@ -166,7 +167,7 @@ compressorargs=3D""
+ tarformat=3D""
+ if tar --help 2>&1 | grep -- "--format" > /dev/null;
+ then
+-    tarformat=3D"--format=3Dgnu"
++    tarformat=3D"--format=3Dposix"
+ fi
+=20
+ compressor_ext() {
+@@ -197,13 +198,17 @@ compressor_ext() {
+ : <<=3Dcut
+ =3Dhead1 SYNOPSIS
+=20
+-B<opkg-build> [B<-c>] [B<-C>] [B<-Z> I<compressor>] [B<-a>] [B<-O>] [B<-o=
> I<owner>] [B<-g> I<group>] I<pkg_directory> [I<destination_directory>]
++B<opkg-build> [B<-A>] [B<-X>] [B<-c>] [B<-C>] [B<-Z> I<compressor>] [B<-a=
>] [B<-O>] [B<-o> I<owner>] [B<-g> I<group>] I<pkg_directory> [I<destinatio=
n_directory>]
+=20
+ =3Dcut
+=20
+-usage=3D"Usage: $0 [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-=
o owner] [-g group] <pkg_directory> [<destination_directory>]"
+-while getopts "a:cCg:ho:vOZ:" opt; do
++usage=3D"Usage: $0 [-A] [-X] [-c] [-C] [-Z compressor] [-a compressor_arg=
s] [-O] [-o owner] [-g group] <pkg_directory> [<destination_directory>]"
++while getopts "Aa:cCg:ho:vOXZ:" opt; do
+     case $opt in
++        A ) attributesargs=3D"--acls"
++            ;;
++        X ) attributesargs=3D"$attributesargs --xattrs"
++            ;;
+ 	o ) owner=3D$OPTARG
+ 	    ogargs=3D"--owner=3D$owner"
+ 	    ;;
+@@ -314,7 +319,7 @@ export LANG=3DC
+ export LC_ALL=3DC
+ ( cd $pkg_dir/$CONTROL && find . -type f | sort > $tmp_dir/control_list )
+ ( cd $pkg_dir && find . -path ./$CONTROL -prune -o -path . -o -print  | s=
ort > $tmp_dir/file_list )
+-( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion $mtime_args -c $ta=
rformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data=
.tar.$cext )
++( cd $pkg_dir && tar $attributesargs $ogargs $tsortargs --no-recursion $m=
time_args -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs=
 > $tmp_dir/data.tar.$cext )
+ ( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion --mtime=
=3D@$build_date -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $t=
mp_dir/control.tar.gz )
+ rm $tmp_dir/file_list
+ rm $tmp_dir/control_list
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb b/meta/re=
cipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
index b27e3ded33..edf730711e 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
@@ -9,6 +9,7 @@ PROVIDES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'updat=
e-alternatives', 'virtu
=20
 SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dhttps;branch=
=3Dmaster \
            file://0001-update-alternatives-correctly-match-priority.patch =
\
+           file://0002-opkg-build-Add-acls-and-xattrs-support.patch \
            "
 SRCREV =3D "9239541f14a2529b9d01c0a253ab11afa2822dab"
=20
--=20
2.34.1


