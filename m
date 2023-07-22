Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A31C001DC
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 20:56:20 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.42])
 by mx.groups.io with SMTP id smtpd.web10.13777.1690059370641442747
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 13:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=cvnk32Zj;
 spf=pass (domain: welotec.com, ip: 40.107.15.42, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrShkO8mKuyoZoukxZVM+Q9qxOwxF9Hyho4DT0ga807Y5DyGA+YOjH+e2gK7HoJwPothxhGv6q8amz2crTs2smEx7w3sUZvL7riyFzbh82tnYkV5AnbQC44LtNypuk19AJMGmPHwqlxArtANb4NYB103qMeN5Pg+e9Y9Gst78M60gGJAbH1FIQmu5FpFZ+ETzLpasJvOkfFK1PNzMAbBjKlnm3ECZI2rHmKDiwTklIrnUOdiQ6CjOOsCUoYm79lalRL81Ub17T11kwv5KrdsW6aS8ZOLjiW08CUd0GlIaPo+bq7S3Qz9hRnUrpps6o+mx3pLnXQKu4s3uzEXDvFm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B15tHd8+rMQsrk4hLGhU9zDyvsmDeM4mNZGZxwAmH50=;
 b=ftbKDxBclEFXwHFiZ6IxPFKjInnNb3ntZIMbvvw3sDw7NaJeJg4xignqdlb0qF0u33t7lG12a76FW/VJOYBSWVWIsam8573WO9T9gbxLkavHIZf2IM1dml2uKFZsKWAZmDsvCUgSdnKF2FVubR0O/A5x6gdQ1H8GOhD/HFys/h/MGag4a3oHpEAmQJWvYEx8pG/VkOEsIYkQ2psq+dArjmef9Iwt66IPedK/l44aMdpjlJCNCzFbuHDrHluEnNpjZtNe+CyNJj/wvez0aP19AGbmOshU5HMV7vDnspnhQnGoouzxg9Nc/iBqtiYU4faiOGOpWV8ZCMSsexz0b88s3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B15tHd8+rMQsrk4hLGhU9zDyvsmDeM4mNZGZxwAmH50=;
 b=cvnk32ZjuVf8Uc/Yg4vJGKcDKypwQZ+Q1Noblr+Qe4hAPZeht/4J1jhjikRMMg6oPBpcC+Oqe8eyEMri3B6wjPeoCIhAjR3OjgvdG3s7fN55+8vli7GR/rhj15IVRJ8UFgP1ww7jeCSLn5Wo5wQQe4erGOcuu/cDVNeOx7jTeUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com (2603:10a6:20b:9c::17)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Sat, 22 Jul
 2023 20:56:08 +0000
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53]) by AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53%7]) with mapi id 15.20.6609.030; Sat, 22 Jul 2023
 20:56:08 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v8][master-next 3/5] opkg-utils: add acl and xattr support
Date: Sat, 22 Jul 2023 22:55:53 +0200
Message-ID: <20230722205555.2487992-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722205555.2487992-1-p.lobacz@welotec.com>
References: <20230722205555.2487992-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::7) To AM6PR04MB5368.eurprd04.prod.outlook.com
 (2603:10a6:20b:9c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5368:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: ff648684-e33c-4ef2-3e2d-08db8af612ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t6TXLUbNVNAhGEP8QuovZ/fJmRUjOctAsJxV3m0kLcXxiJd/6UZiWKmkueVq2TI6u4/jTapJiil/F2NS6xyypkhTZQ5qwnTZYMYdioJP0iT+kkaQRWQEtrlMshmERx1XbI7apLWAjlzt4uYEp6muruYW9crvSSGHAJVbkRExxn8gX6IFFKoBoGj9b7sCL35ok0phBUms1ssxx4vXo+3YC1RRv3as2nJx8ivDH3Q3+3pzlA3a4zh+4cBOi8c+UvBdL/kyfbAaCJzK2twWXyHHI4h4GR5cgKEiYNSzH8eBXjzFng9fK1WTxl2KpxF+FCq0O7RvYmHhhr2kMu4nCoo6E9OyFW214Y3VdqXtkKDqdFQRQ0+5EtmlJGzrWGyxAgsouslbf2p4ASaeMdi1J3CFP4h+u5oFGmHvmQRqhWkhGc0i5Go+vjH58s0pn9k1gNnsbOBoW/7hukcLk1dGxgDzw96+RtrtZm5vVz1NuuW/80aY7jqyMjfo+El9owpXOZt1i5Ak9NovDdtN1kxr5wnvm4utdXTZ1Bd7SJkzZKsH7Cpq0O4OuKh96aP31tLw6LKL0cABrZVN30E1iXLh5rKLrHlc/FxEwvGCL2XXI63/ljY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5368.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39830400003)(136003)(366004)(451199021)(6512007)(966005)(6486002)(52116002)(6666004)(478600001)(186003)(2616005)(6506007)(1076003)(26005)(107886003)(2906002)(316002)(41300700001)(66556008)(66476007)(6916009)(4326008)(5660300002)(8676002)(8936002)(66946007)(38350700002)(38100700002)(36756003)(86362001)(66574015)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GvizqbWL0o3KBTQgXodlWNbjORaTzb2l4xGVRG8Z9kTXN2Q9c3DXIJIUlgiX?=
 =?us-ascii?Q?bOQOKsvzPrsqra1iJbsN5mlqb8wfQZq/to+KMSGTzFY+Tzes0+Wp/AfZa1TQ?=
 =?us-ascii?Q?I8aYVgeI7jq9t8aIhXm8hBCLw9Oar2vuu7TDDrwbNKKFtEKA+VeVXr4TzMA1?=
 =?us-ascii?Q?s8OUmz07xCBkNcP+vLCv6802PhLqaHtGfc0eL68SAbjvuo7Mv1uLdcpdfToe?=
 =?us-ascii?Q?xTOeQB8BP+0QhrK25OpsSLw/Ncxd5Tiqk6kkpgNxbkfSvbaRrrSPr5Gn4OVc?=
 =?us-ascii?Q?bg7QC/PVDmq111QeuhjXDEW+dse1qjXNuP8NT7vOmmRQglHio/CsTLT3chpQ?=
 =?us-ascii?Q?M5g0IhKQoEWRhnX0bEhne5VmKBd9c2nalpMaKEo7XUAn1wEUT7s383gOOeXx?=
 =?us-ascii?Q?H5dK2HWYPGZ76PwdhTRPWSjlXd9b5CcRk1OslcdmUWROqljRPUMVQaUSygKa?=
 =?us-ascii?Q?kw9Pi6/+cBxmEOhJCbcaLmp1D62+cdCEXGgKUUxzYK7WoW4r53A3C/7emjP7?=
 =?us-ascii?Q?kwNghTM0qM8WuVljAu3jEfbLOtCL/pdoMRAeRpm2cm1v87rFf+HHKEAZgHjF?=
 =?us-ascii?Q?KlIq/Utau8EGa/iQWGORakZzQCAzXmhhforKyrz1TZMQTeRCL2/yaVoPrMqu?=
 =?us-ascii?Q?xrzdkn50Te7YWPZ1W4F687y5TmfeG00HX6Rh4vl71SoEoV9p5+MjRwZPkZEd?=
 =?us-ascii?Q?Gy2VfkgY+ONXh2j9sSRCSqbIt4EARQvvz0UhH12uUC3XSfeL7cBuLUz84yHt?=
 =?us-ascii?Q?89VJTeQBY3/R18OUzttcBmpX0W9G3rSMquHKp9e7MbdTXjyOGF9pqrCuVb1u?=
 =?us-ascii?Q?frgSon60E7WIiaANsTJ2oPP6YjCK8oyfzv/YxFAi9YCg9k8PUS2HSF3v7xgV?=
 =?us-ascii?Q?oc8ugdJvGywoqGZGtWsHOZWdq7mkXQB2y0uuLhJBsuEmxorh+MpJ1q2m7F8X?=
 =?us-ascii?Q?WRisyAabTFO6IX/vZjAvIvkgUt5wqcRSBbihJp4hwudXHkBY8H0D73UK6cfU?=
 =?us-ascii?Q?AvJSx2MCR0T7b8LwWVyse/ncu+IiaFgE7366vN8nsq6O/KaQDzT2TjFVEVWp?=
 =?us-ascii?Q?ZdbtMgrTQkZIEz3yOZcF1Pn7yIOJByjWkh5eCN5/9NCMYQtj19v62zJ0dHt8?=
 =?us-ascii?Q?5ApoKj7DgiUQgkPdpy7ZGlBrGtgnT3J7xeLLIVLDBIopHeUyhHSP28vj8X2e?=
 =?us-ascii?Q?x/w4vFZqgML3moucAdJzTJ+2GyvyEBp+CJ2FKN9j4lJYYpriRy2Z0huP3eiB?=
 =?us-ascii?Q?zpN77VjNxEf0qTAVqt/zp8BYpL9rflgAhS8s3qJV6J0BxYiLd4zLoU4V/6V0?=
 =?us-ascii?Q?K7Q7eQCz07CdfUhtRke2S7c0EeW2ZBHh4JYz4gYWe8dPShf3ySM2fW81dsfO?=
 =?us-ascii?Q?FRlGzJD0gq3IjZvO0YL9GeB7CEDqsFk8st9V7tq9gb4G2UOos73tSODV+v9k?=
 =?us-ascii?Q?GW2lsSimPLwmkjWitO8L5+K/SpNAsEJC8YMZhJ2mrCeTw2tHiQY7EFwAFUcm?=
 =?us-ascii?Q?oI2g7/g+FlbH9yrzvRvu6d1RTloPefeyT9JmbJUssWZm5cb+lSxCXN2B7g7y?=
 =?us-ascii?Q?v9OJG0cawfi36NuflM6mBN6d9uYd6mrm6u0BS05h?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff648684-e33c-4ef2-3e2d-08db8af612ab
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5368.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2023 20:56:08.4844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9xX2tkrw56cagYIyKm+yi+x+7JJxBJHvCTFh+fvcsnOY/Rmvulz10FhfwFUFJnbBNMbrESuTvVnHHi/FnOK6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 20:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184737

Add support for tar archives created with --acls and/or --xattrs options,
PAX header format.

GNU tar and libarchive already supports ACLs and extended attributes.
We can now add this support as well to opkg-build script in order to use
fsetattr or setcap inside do_install command and end up with a file in
an image with the relevant ACLs and xattrs.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...kg-build-Add-acls-and-xattrs-support.patch | 80 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.6.2.bb            |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-b=
uild-Add-acls-and-xattrs-support.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Ad=
d-acls-and-xattrs-support.patch b/meta/recipes-devtools/opkg-utils/opkg-uti=
ls/0002-opkg-build-Add-acls-and-xattrs-support.patch
new file mode 100644
index 0000000000..362451bf3f
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-acls-=
and-xattrs-support.patch
@@ -0,0 +1,80 @@
+From f2c661f1d5a489e794528dce562939b61de23058 Mon Sep 17 00:00:00 2001
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
+index a9e45d4..74035f0 100755
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
++( cd $pkg_dir && tar $attributesargs $ogargs $tsortargs --numeric-owner -=
-no-recursion $mtime_args -c $tarformat -T $tmp_dir/file_list | $compressor=
 $compressorargs > $tmp_dir/data.tar.$cext )
+ ( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion --mtime=
=3D@$build_date -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $t=
mp_dir/control.tar.gz )
+ rm $tmp_dir/file_list
+ rm $tmp_dir/control_list
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb b/meta/re=
cipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
index eb88b9b734..d5ce2cfbe2 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
@@ -9,6 +9,7 @@ PROVIDES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'updat=
e-alternatives', 'virtu
=20
 SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dhttps;branch=
=3Dmaster \
            file://0001-update-alternatives-correctly-match-priority.patch =
\
+           file://0002-opkg-build-Add-acls-and-xattrs-support.patch \
            "
 SRCREV =3D "67994e62dc598282830385da75ba9b1abbbda941"
=20
--=20
2.34.1


