Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AEDC001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 16:20:22 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web10.52151.1690215618541641239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 09:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=qGOuShNM;
 spf=pass (domain: welotec.com, ip: 40.107.6.74, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4d9BYsPu29k0RF1iuJNzyyWSb8AxInlaTGAMxygRma4BgvII0ueBpTV8HiHur7vulY/HtmSU/iwM6+e3i91s6RTyVhAJ6Qg/0uZKCZ3g8maJUo5OOhobMw5PRqcRF9yMnJkBJMcGRbUWM9s1i8Ha26u35pyBr9ZKAXjcCT6SmIpUKYEU3yI8ApFWgZL8mQEA8E4q0eood0a7ftCiaO0FusgY50BB7yj9odX9nKOrkatWmvtTY9130+fkx1cyH87iwmbKJaKrKxmxHuewkWPOg1I9ArOoxWHrMvOPptKug4cQIfP1ZDCcr9279idHPFlkb4UDisoV6MypVSmLy5jjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjnDoOPQz7COQ1wpe8HXKXaEFL8QuE8NAlsjG/SVqAc=;
 b=FdcJcj5cWa8ooAuz54MLlsIjCJJAomPxHDCseKDxcRVeFQWPaWSsamh+QTvJgXcLLRQJ0bB/GmroptHC6UsNgNWXIW/soGeBs+ReJ2+kQ5anfTTnnIaRV1Yp7gWCt4PQ94ZLoGWZtB4wJwiFpsR4q7PTYksTKmZ6fb3iRXbPU7mwFNpPtyXcgqLaztBOK3JWrFnOdQAN9Wt4VlRu7bZi0R8vH5cjSpHQqEhGxMrWyO4+vQKMSgF808AHF/bDy9wB8CHlED6ePwO/LEr2FEBUR3IxZ//6JEL2lXvs841gllK9Z/adXu8DWCcTCueJ1mFqYnlSvQxNyo+z02IiDQIevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjnDoOPQz7COQ1wpe8HXKXaEFL8QuE8NAlsjG/SVqAc=;
 b=qGOuShNMkr4IisNrx/eTkA+1z3HhVRCAQqfxcmwZPjQuuAhLdXmfPUY16WQUxxiMp14tOED43ViocPOFmjCtjBTeGGGsm4zOUcs3uic8910qybre+pGaT+ZCvyYzjm92TZ6qS1RI+KlEpexbvfX50xPc1tgLnU/qnuNrnsd+Rxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8084.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 16:20:16 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 16:20:16 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v9][master-next 3/5] opkg-utils: add acl and xattr support
Date: Mon, 24 Jul 2023 18:20:05 +0200
Message-ID: <20230724162007.3701193-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724162007.3701193-1-p.lobacz@welotec.com>
References: <20230724162007.3701193-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0464.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::28) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6bae58-7e10-4fb4-ecad-08db8c61dde6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iO5X2DM0eWSIkkPA1eFxbHv0A1OzX0W3m+xmYYD4BQVlMsyXfnGZAiZfqjz/g+WvTxIsy6nXZqJvY89KfBofpNC0ykH83Hg14aiaB8VFRCA02RLIglHTh1oA8rgh93nSOX9YMjgSifSjJ9lgKGr/Vthodhx0cc+9mUvAIYrHTlac7O9KoXTK9ZJw3eGbKfmDvVgl7AHvIqHLqLX+rHHIG8AqAFuzCQyEwTC0MsZrwjXWbxbMr7bZI8+tGFipYEVm+oslQNCWoCq0K7+wRYJuc7odarF+M7DqSpKMh1hTvlx/MpyMKJ1q7Ui3fDu+k82h34+7bFGTFdM7yQcStQbixLuv7OUXeWu6WMzyWXOzv9/wTNvb9IafTeiF06IAIxSJ4c8+jMUR1rGWAKOSJrMNrHyvTqbq1jM8/Pqe/8Z+IaW9dWYYs6/7B8icVM/8V3+IiDFyo83j+VIPw3OUVU0AZwRKEa3XLMxC32cOU0aHu3sEDJcE0x8+qxYoZGxViMoEmoX6Y0oe0FnAVk7uP/r5VCdUeddat4DJgWjE0Ab1M4wIdmj5Rx/WdGz06Gfy6kRblIZ5oiKVpR+ze7qU8Az9MgXZ72aALWrgdUpVR4xlwDE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39830400003)(136003)(346002)(451199021)(6666004)(966005)(6512007)(52116002)(6486002)(478600001)(186003)(2616005)(1076003)(26005)(6506007)(107886003)(2906002)(316002)(41300700001)(6916009)(4326008)(66476007)(66556008)(66946007)(5660300002)(8676002)(8936002)(38100700002)(38350700002)(36756003)(86362001)(66574015)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o/CqT0qKD/0Uk7r24D7cB3jkeh8cYKaNYKBFtrKgMjkyFv2yyjkZ6Zgz+Rh/?=
 =?us-ascii?Q?BX5hbLLx6Gg5SU5fl52h9wnq3XZtesRe/UPtnVtyseX9ybkcTasclEh6plAz?=
 =?us-ascii?Q?U4bldL3KkZlWP47UzYVALBx8+617UN60+ZpxRn9HElje15i68QgZGduo47RI?=
 =?us-ascii?Q?jRrXqnDtXTrOwT5uwxzt2tSxeTNSr1kcZz0G0WWBRvHmOmOfZSfLfkPUcLa3?=
 =?us-ascii?Q?drAk2j1MRZyZZWOp+IHf79AniMM/2Iql6FsGgxKV96kymXEXYDP5HldE2voO?=
 =?us-ascii?Q?j+jdSbdpwl1cJeNfqkXpCgAhkjTfWMUBvv2qHBWVRkO+t+yY2E2bFAVS6c5I?=
 =?us-ascii?Q?Fig10PBb0EhY9EMv2H7FeYKuii90G8Hj1wUVDcalr254HF4moFFJurUXPy+X?=
 =?us-ascii?Q?ekGVSkl+rJ6PjZK1b7pDoG1UwIi4b+qRVnH8r+fYIzFAmRfiPjjymJQ9xXdE?=
 =?us-ascii?Q?nHezIqzyCKRBb8TWy9VV7BYD4TeDcGrynse+ewafxwpj12NNIYYxuthGRctK?=
 =?us-ascii?Q?RrZO234s8noB6k72+P2KzisvhgC1j/MSf6grereuS2gI2NiH90qKR4X6l50o?=
 =?us-ascii?Q?7i6ZQyCaiJmaGdkq0HEfcdDmZD0jwTSo8up1HDI0UsIWxlchbV5yQWIV/Zie?=
 =?us-ascii?Q?kLgYHJtxsw8o9NI1Mc4wqWHdz5HwU0Y0k7Z8vu7zobiWBc0e8XYVF7SkmE9E?=
 =?us-ascii?Q?XORJPKty6tO4hrIRlbHmTiD1RbLeu8xQ852xHcN8uK6kgx32ch+5zZKODUY0?=
 =?us-ascii?Q?Uc0TKAuU9TIpj/W+PDGOts4cw0CuQjFl308dbrxuNjxcGEsdUtvOMhn6zxOB?=
 =?us-ascii?Q?27jZPrJk9eIoLD6FbIS6ZPrljGnBzpAylf6bt57MQGGWBvkQnafwV2Q4s+zU?=
 =?us-ascii?Q?YEYVTt670Sz1Ib1AMUdqizJoEhRknRPXRWBv7jkNKjwQSDY6V9lZiaELWwrz?=
 =?us-ascii?Q?71d8L2KW4vNXJu8eeIGQkuiknt2MOYVw2BgSlpKEZI6BR1kN1O++AY9KZkxR?=
 =?us-ascii?Q?w7e+V+82CU7ODQkrgI+B/4zZhNTaTx4kUn99a4u+ijFLmZ6WqSH2e4hlHyht?=
 =?us-ascii?Q?uXT1kGs7LkbCfj29DNKjRmh01+57AH0ypu2uE80F+vKPr3LiRgRFs5JDZ+ea?=
 =?us-ascii?Q?vq7fhFA5YkkfXMIjCU+K+P9u6QMTt4bn5qv+VY8/HsWg3egwogDy8WSlp7QQ?=
 =?us-ascii?Q?1Z//wYKLixx+ClkDVF4+n5mxFP7pjLmrZAHICmurkQckhll83n2FE1lf/ANA?=
 =?us-ascii?Q?IM93aUcVnegxNIupGRVi6S5jHt0PEpMycRf5iySBrznHufp+CORlobPZN5SX?=
 =?us-ascii?Q?XzhakUB4JHqEXoZsZd2wZX9++lPj889dFv6JUahOX8QA64p+pDODec+CSVDL?=
 =?us-ascii?Q?HJZNJpttYElAuvydBpZrLjyqXUNsey0XMdaUYEbsYsKKBJM8rW6odRRH3pUK?=
 =?us-ascii?Q?unazSj/amv1RLKog2H6N4Qbcbv16fuF60OhxVrHT/gEBkojn/FVtCJKMsgpM?=
 =?us-ascii?Q?yTnAO8WItEGfkm+YU19sGbvokqrKosnn0HJ1hbc3ZFhZOYF1wp8i+ugWhOmh?=
 =?us-ascii?Q?rpBYzMUT10rs63/qu/MObAymOxaGyqyqvW3OtusI?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6bae58-7e10-4fb4-ecad-08db8c61dde6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 16:20:16.6904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdNBGHRAQgR5Em6kmiO8Z6vzz16eQ5zDAieWYMEdLWkiNAKvXbLyvy9NdQTeLL8gtp8NZze7pfHlDJGmNYO7Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 16:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184799

Add support for tar archives created with --acls and/or --xattrs options,
PAX header format.

GNU tar and libarchive already supports ACLs and extended attributes.
We can now add this support as well to opkg-build script in order to use
fsetattr or setcap inside do_install command and end up with a file in
an image with the relevant ACLs and xattrs.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...kg-build-Add-acls-and-xattrs-support.patch | 126 ++++++++++++++++++
 .../opkg-utils/opkg-utils_0.6.2.bb            |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-b=
uild-Add-acls-and-xattrs-support.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Ad=
d-acls-and-xattrs-support.patch b/meta/recipes-devtools/opkg-utils/opkg-uti=
ls/0002-opkg-build-Add-acls-and-xattrs-support.patch
new file mode 100644
index 0000000000..ad8d0b6f8d
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-acls-=
and-xattrs-support.patch
@@ -0,0 +1,126 @@
+From 18cbedcf68c3bc6b4310dfbd8d3ed6e5d85df58c Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Submitted [https://groups.google.com/g/opkg-devel/c/dYNHr=
LjDwg8]
+
+[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15097
+[2] https://groups.google.com/g/opkg-devel/c/aEGL7XRXfaA
+
+Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
+---
+ opkg-build | 54 ++++++++++++++++++++++++++++++++++--------------------
+ 1 file changed, 34 insertions(+), 20 deletions(-)
+
+diff --git a/opkg-build b/opkg-build
+index a9e45d4..8e327f5 100755
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
+@@ -153,22 +154,6 @@ compressor=3Dgzip
+ zipargs=3D"-9n"
+ compressorargs=3D""
+=20
+-# Determine if tar supports the --format argument by checking the help ou=
tput.
+-#
+-# This is needed because:
+-#    - Busybox tar doesn't support '--format'
+-#    - On some Linux distros, tar now defaults to posix format if '--form=
at'
+-#      isn't explicitly specified
+-#    - Opkg doesn't currently support posix format archives
+-#
+-# It's easier to check for mention of the '--format' option than to detec=
t the
+-# tar implementation and maintain a list of which support '--format'.
+-tarformat=3D""
+-if tar --help 2>&1 | grep -- "--format" > /dev/null;
+-then
+-    tarformat=3D"--format=3Dgnu"
+-fi
+-
+ compressor_ext() {
+     case $1 in
+ 	gzip|pigz)
+@@ -197,13 +182,17 @@ compressor_ext() {
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
+@@ -232,6 +221,31 @@ while getopts "a:cCg:ho:vOZ:" opt; do
+     esac
+ done
+=20
++# Determine if tar supports the --format argument by checking the help ou=
tput.
++#
++# This is needed because:
++#    - Busybox tar doesn't support '--format'
++#    - On some Linux distros, tar now defaults to posix format if '--form=
at'
++#      isn't explicitly specified
++#    - Opkg doesn't currently support posix format archives
++#
++# It's easier to check for mention of the '--format' option than to detec=
t the
++# tar implementation and maintain a list of which support '--format'.
++tarformat=3D""
++if tar --help 2>&1 | grep -- "--format" > /dev/null;
++then
++    # For ACLs or xattr support, gnu format will not work
++    # we need to set posix format instead
++    if [ ! -z "$attributesargs" ] ; then
++	    tarformat=3D"--format=3Dposix"
++    else
++	    tarformat=3D"--format=3Dgnu"
++    fi
++elif [ ! -z "$attributesargs" ] ; then
++	echo "*** Error: Attributes: $attributesargs, doesn't' work, without pos=
ix format, which is not supported by tar command." >&2
++	exit 1
++fi
++
+ cext=3D$(compressor_ext $compressor)
+=20
+ # pgzip requires -T to avoid timestamps on the gzip archive
+@@ -314,7 +328,7 @@ export LANG=3DC
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


