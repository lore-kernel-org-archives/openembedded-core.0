Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45EAEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 19:04:55 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.77])
 by mx.groups.io with SMTP id smtpd.web10.4464.1689188688089454094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 12:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=Zq5wPhbr;
 spf=pass (domain: welotec.com, ip: 40.107.103.77, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIZMWDOMb8h1pB7SmbdemIgx9m12dgoAA3poxgJAFHo5zGKVUG5jXMgZCJvoi9zByVG+DMMLYlCbqhyBd9n1w2v+510AbgiAG/mgkoZBeCJ4nOhD1yLEGE43NqgaH4hIgB/4KGQsHaqvZ9WxWGjfkAthep8BQ9GRz4/kPdThDMCPXI+kQG+2beqGtJh+WZKVINI1t3VAOh2U5flPLys0frusqmwrNlnI8PbVbgzBoLHuYFs0yiVJYfnanw47diDw+qy0DwxKhQgjR34Bjl9N3IvktfRfbwi1bpoH5Mf8LEi9w0Fu3cRG93xUH3sbALWE0qBhNM8LzNoBnklttO9j/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8WY85S3HzUeKkAzZdQjNkkIr/f5Mfwxx/weWhlHJBQ=;
 b=d6oWFUHphmyVjKwKA9PFtUi7hF/INMkzJnObTfs9/kKx6LuZrF0K0gw7NqVsFTBU91etbUv0FDGMJ2rGRugdrKdDPlI+0/q4eOD2AEcQYOwnjsIoT9ZNa5VNaMJIU0rvMrl6qo/fd1I/K+mVy7ExhCv5NBiDmXocPzruiGHgR0X4UIlXQRcMN97lHk4Vy8nCyA2PVu48lTWcC75j16+F6wkVOdkpHFvD2kMDgAQIt9JH6z2AElmrsZnZmRdwMj3RIiDIoewmQUsr764vky507v41Pjs0VI5Cm6hzH1UOTfplyCXCDRmGL1Smjjc/MbpB2xtsFVSJQCnPNBHzirbXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8WY85S3HzUeKkAzZdQjNkkIr/f5Mfwxx/weWhlHJBQ=;
 b=Zq5wPhbrgreYCQ2j7BdNcU5Bf6OuxdtcEOsWb4ci70oE93DHFn80I7Ghax4htAgkKt7spjg3LAA6BuIdmU8fwo/BYgcRfo6L4+ilYNv4Ggo9R9+Gu6AiU7TtgFfvNdyYku0zf5fetMBx4ZEpA2bAgswKb7V8BsS3xGv5JtcvlK8=
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
Subject: [OE-Core][PATCH v5 4/5] opkg-utils: add acl and xattr support
Date: Wed, 12 Jul 2023 21:04:27 +0200
Message-ID: <20230712190428.379909-4-p.lobacz@welotec.com>
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
X-MS-Office365-Filtering-Correlation-Id: ad2ed945-1890-4fb8-050c-08db830ad88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QgP1uCW+lvFAWc2ZkLHuWh2DWh8YVaNJeIQlOSRq42eJSnIUk+3fUzk3+2dY0KuXJhfWvSjG0tw7IFSI+X4G+ENWAI1kn07FXrTyBwMIGQkxDBWVMyOhEVYavjI02figPAwHQZWTrzpMl/EqALNCVhQzcJ4+kxVOx7qGqH09hNuI8pJkveHrZQq+KWsuhYFxPCRIkulxyxDTO6WDqE2cjM7cWtaT+ZqbMJ/wbSHH2Rz4xkV0JA5cGy0vEh/Qz9vDdBrp3DqCtYqvRNAKbiBrPVwXzFvRfv0W7dy5Ijsly3tPBLDkieZIEM3P4ZvTdoUvnXZC7HnoKAkKF1C4UpuLxSSNqUVnPC+VV6aDHilQ/rOyJGfI5EVoHkgmOlHwsdDN4zy+hUCx+uuYlpz9KWDUUtrXEY6Df1h9m9SPDrf/4uio0oNjc809jU71ztrmSQYfUOqQKmvj+Y8bbGGq1amxOnSawFe+3U1v38ijqJmUn59kCSmqYxNXTttimDhm1K8OyH0AZar/Nc3JqJqwnauiVEGdw5M865ACcNNfRzVZeZuXG0gwwpowdBpRh+JcB5nAUOhx1ZUPLliwWYGJRZ2GjqPxGJRB0F/gyfqZ1WuV39M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39830400003)(451199021)(8936002)(8676002)(38100700002)(38350700002)(66574015)(2616005)(41300700001)(2906002)(316002)(5660300002)(4326008)(66476007)(6916009)(66556008)(66946007)(6486002)(6666004)(6512007)(52116002)(966005)(83380400001)(36756003)(478600001)(6506007)(107886003)(1076003)(186003)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7cj0/C/ZXlo2SNucKGO+UPe10sgteD7HUjrclmnGzIbf4PycYgSI0rO48WkL?=
 =?us-ascii?Q?1RIt487BkemAJ0TAcaY0peVCMVmwEkNAqIWNfus0MBkG0Q46qsscFzEB6Za1?=
 =?us-ascii?Q?oEVoy/QetCdlukuzIuhD4y9u6yjb/fp84GjFRJIrT8dAa3vy+p8QMQbV0Tas?=
 =?us-ascii?Q?24GO1ptGJRsWDDxPBflhVULT4iRaumGSsZ/G0N1Pw91wjRzUnKHlpGREvLOv?=
 =?us-ascii?Q?d9LPRxhM5Fu4S2Eqbmc6ZwJrbQoxWw4wYbE61c0Qigt1tKAcno8iUQf3KcGv?=
 =?us-ascii?Q?DMhlCgpYO5XDXSNAz6EuGllVuQGGwofX5h8Uj80JYGEqSn6colSV0k0p8WD/?=
 =?us-ascii?Q?gAFVTy+M6u/DwqR0O9a0JmR/4O+9/BqO8yaCsd5sp1XcD/HoNTL4BwBPLHga?=
 =?us-ascii?Q?KUweR24Iu9w/KGjFrKJo6tN2GtjDqQ4RMgsYHYJhBTIrXNKXlNySjPsWb9NV?=
 =?us-ascii?Q?RKftwt/kAhmQgy8y8+BgBgIPqFwWM4MbIEi/iygFszcGhy7oBsiNLSdQ8b5E?=
 =?us-ascii?Q?7wGLrx0as9vd4+aA5JiTxeLn2YL0hpvPjkZtHtzTzi4GYl0dltAMEWG8EVOX?=
 =?us-ascii?Q?F4T/1ttvgOGkC9do8aI0umy8iQt+DyvGEgaZkHyCNvEBmPviWW0m5VjdSz6r?=
 =?us-ascii?Q?K1BLgfcb+IyXCRL8e2X5+mvjjN4AMQ/NpArNr/W2yW1JKRIYptfrkK4AB/1J?=
 =?us-ascii?Q?FsDOXveS/EiWPbV8OchokSr+jB0vxCfvBgU8i2Smf1l8cTogDeaYmxr1yJDT?=
 =?us-ascii?Q?2KSIcw4wic4WIjTW/r4TNYaq4C0/MjxZFSSIWOsqa4RBigmd+46y3l4Bo0f4?=
 =?us-ascii?Q?VZfEipqriu+No0UV09KEsZswS9R0iiNUBiG1dAvou/ejjwoJ/CEYyThdxIKU?=
 =?us-ascii?Q?J1XdG4B5JT6vC+6LRgDGCyPl+mieDo7fAgTtOFVmhbIiNRKSqKxPlDR2f9SF?=
 =?us-ascii?Q?MLeTs6UZ9D44/UjuyO8K4ALQk3ehQLmxELuCEJLGg9kBz4rjp1ky3KIvzQ59?=
 =?us-ascii?Q?iRM40YtYqIoSh3IeioOYzbUMt1kMkqg3f+t8PsYN+U2BdnyjRqTaSTOMeHu/?=
 =?us-ascii?Q?Qp1jgU673dwvkB4foQWekz2acO7OcG45815WCqgdcDoTYkaaCchrHkW1+QHi?=
 =?us-ascii?Q?Iht3rR4nSLE+L4+gFsOm/VPa0t33xHeS4d0qmgNpJomMA2Wor0PGy2RZWB6w?=
 =?us-ascii?Q?9Teq8yhNlxenSiHQ/otHLJdkyppQSrILrTL0Y7B1eUVyzh7128laEgPJUlc8?=
 =?us-ascii?Q?0mo0az7BoZt3Y4rUmxIAuTYWPS/y9GrySfvxdFMFv4dnTCdpxrt6wufrOpRm?=
 =?us-ascii?Q?OCujLtwpo3D/IORupQtUu+nZqUbhT4Oy84V9fTzOridei1H4Vfd7lsuhf5Gs?=
 =?us-ascii?Q?nED1In1jtUqgk3GU6S8f1dnA9UM1IZdxLC5qrxchJ27bTqnYf8hk9xVaRjbw?=
 =?us-ascii?Q?QIVmgCAhPuwD0K1wuOqcMYxYWuMGlBVef2uinrucZyKBno+8JvqkVk/v0V+K?=
 =?us-ascii?Q?kOA84q311PoNwLXAbaJtJv/Md36w5ID8sAk/XtxLZzhLPeGgDvicMJ2weigj?=
 =?us-ascii?Q?n+Dqg5KaSz7aflJoKEpzBjdWS9q37MiEzKbsylC6?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2ed945-1890-4fb8-050c-08db830ad88a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 19:04:41.0200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tYenNJFvtX7XNx91XodjBr0L4QbDEZPE3jycIocImzcMgee5KM4RUoBTdJ+TGRe9xftB7R2dLzsc7ELAobJvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 19:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184216

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


