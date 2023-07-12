Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53386EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:26:22 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.50])
 by mx.groups.io with SMTP id smtpd.web10.5969.1689164770219531763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=0LJUjNAb;
 spf=pass (domain: welotec.com, ip: 40.107.6.50, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZUj+XZIy89bje5lzcZSqOJVQeXQ6/Cr1bRv2Cm0h/0eqZaAUb4mNkJPpvnAKbpOwzD2XGGGYooPLNbEuSwVW+BOZpbGylaSqNGjqkwZgTaVaruB2fDGY8gcBE2YaGsJA5zq0YR1VgdruwjsGKX5X8Yum75UPQ2JHHMX7gwr22q+6UHIbH1BsZLnapmRq9g53tIjqc3tldt2FnxgWaPRb4p0KumXmtDgeybLYS4geofX+GbDlvhEgY6gl0DhdYJC7cuGJeRF2lwtEAZqGfTF//F+obyZq1zguofxwIP29LXjrciib/71L+q7nSIum0uAi2ij7n81QUat04gUiQ4LfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8WY85S3HzUeKkAzZdQjNkkIr/f5Mfwxx/weWhlHJBQ=;
 b=PTt6spsV7r3ndOlHg+2C5kSc3gPdo9WN4QxWe9sjBkzLetQb3XWKdQKR9J5Wfl8cg89/QbWge9KzshwKY5PhHEffGECvKlHgCXPAtbiLxgEAEoo9s972DBjpSop8XJwvEd2yW6y6tm1qfF36we7U5Z97n/7MTPP/4mlepmFBKkHt4nmV7Ai51fUu3/FJKPlSKWDAJs2F2K+r2APlwR5PVzGuEtctvU6htXv72re+sBk6w8ORIWLLk7qfvAZO7uUqsIRPhlnCvY9ToXZtbGgCjglHbYJ66iTjFWDRjPGJsq4jBMFEAcPsFvt8N4OgpwTt42/W12kyTP60pM4ATLGxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8WY85S3HzUeKkAzZdQjNkkIr/f5Mfwxx/weWhlHJBQ=;
 b=0LJUjNAbhisgh8PelRAgehF3iT2RJx7bCEBMfL3092LNCj8xO3W6QHXHdmDLe153XUcNB27ectFxeCDKPfkw6DIFSNXG9cG42WadU4VPcQFXcxjcwWWZRrOeKqYGrgbWBGximFO/bu2QlWlhNc/CCbXmg6WlMX2xEKhxS+Zk51A=
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
Subject: [OE-Core][PATCH v4 4/5] opkg-utils: add acl and xattr support
Date: Wed, 12 Jul 2023 14:25:57 +0200
Message-ID: <20230712122558.711029-4-p.lobacz@welotec.com>
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
X-MS-Office365-Filtering-Correlation-Id: d04333fa-1f65-40c9-b773-08db82d32b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	83oLET5blecNbm1f0pdPnWI+cyrprqzdM/5+X1OvXYg0+/9CJIcXfqE3gSjBxiVpSOm9hWyNDAN0UrCijw6C59dDaNpCSkcNsiaFF4STmMouTddW6z61qhsfcoIsYFzyllfk7c6TQkoXtn4CKq7sxZqQEkM3fGjisisS25Hik3Aos9FW3QphU8d4GbXS1AAPE1zyQhGmLYC7M+tBFUHucnEe3gqtl5WETJWZLQHwrhs8hHm51LT/0BxGRsE0ARDb3QsMbyj3Q/NBba64jGrQvgwEAll3soFFRXxpekE/HwIKKjmWDl9y2UBOD9HY9lLf/ERm3rSDATaQEka6tSCi/Ag4pgiILa2iGnlFUTc5Vn7o8xJ6cNPvS8/NR94NwC6nU/fZYrMBDTExMNdAyNWfAdN/3hlbQj7VKsPxj1X88eDAN3VZTvMQu5AFghL5cGxwgt9oolOvFkTMyA3SnKglfv02aih68fwVP5z1ZsDWGGwteIa9n22tUPNnorZ+dnJXw6EsroWT1lxBItzCeu/lcfA1xfrM/I85ECZxr5dI8JioNJxyqTKQ+jdwBcFyhHQkUV85LZn+vwb2iKNsRULYMEtsOczJwHF8+KWGWUw/dQE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39840400004)(376002)(451199021)(6666004)(6486002)(478600001)(52116002)(83380400001)(86362001)(6512007)(107886003)(966005)(4326008)(66946007)(66556008)(66476007)(6506007)(26005)(1076003)(186003)(38350700002)(38100700002)(6916009)(66574015)(2616005)(5660300002)(316002)(8676002)(8936002)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SSSainJ96/IFV38XylTRccTJMQv7Upq5AXg8YTHJy2ghWTAGsiNMvBo4tb3a?=
 =?us-ascii?Q?VxDpy7OnjBfK4PuC1hFxEwMz/kVcAEvaA3sMBRjENbbtaYVfjFcxpr4KgWQ9?=
 =?us-ascii?Q?PFMsutoFt5rwR8FZT9ZndXYCXe4gxeSfAJT84jDq7JLMyqwik4aSB1Di+UM7?=
 =?us-ascii?Q?RKIW1LcLls+N9POXWu/MB7ebNXojUcCIeVd9Q33ryMHN1Hi2luxPLgmVfJLR?=
 =?us-ascii?Q?OKlNQ7DPjJgbRiuw1g8kKRgWmlugshmQzG42M33RD19LNRvzlRaBBpLbnTmr?=
 =?us-ascii?Q?64nP22bpIpH19Pjef4DULS7ntrZi19qRehXpz3W0w4gXP6iy0wD+mFkO0jOl?=
 =?us-ascii?Q?NL1AOUnjrxsd4Li9mHMg5llNmbRP5b0mdl+6Qfm//86hBghGrbl32osg8VAb?=
 =?us-ascii?Q?LHOqEz7F8xZOWF4Vav6tyRrEeeMF4kTyM254m5MSmGt+tvIX6KNqJRnn3Lnw?=
 =?us-ascii?Q?0RYSvXdxK5u3Cbj4/Kyn78weLgH3fp6zqUolbScQy4ZXdaezIJ5kzl54wEdn?=
 =?us-ascii?Q?0OCJX31oDHmbe3rRmyNJUwB5exjvjxmdoJiAd0qHEuww3QpZXcvmaK14/Pmr?=
 =?us-ascii?Q?kLOi4k5csVInkMtCL+trH9aUDf0pxfDzq06AUcGgIsYFOd3EThMXXpFxB+gD?=
 =?us-ascii?Q?qU2JsJAha46GIKMNJzVOSNyQlFklsTV79OWwxQViVc3pktwP8BnZEjKzidgR?=
 =?us-ascii?Q?4DzwwfnOorkVam2xpIo4k+yVuvOy8wFPvE0E0QlmjbL8yjIIuMqs5ghKLGBL?=
 =?us-ascii?Q?Tm4W8lz/38FHhfET/coSQBJVtIS6ZjzrFuX2x3ToAu/IU6dj46wfAu9u3JZB?=
 =?us-ascii?Q?X0tNzISk+gcPqAGQ/LaPEDjw0gAXYLxYbJvzt8pFOT84mtD2NYEB2NTiDsiD?=
 =?us-ascii?Q?XVWIc4FNwJ2IRH/TY69fjpPHyUd59kQk34/099TjUxsy+pySrAH1DN7JVHQV?=
 =?us-ascii?Q?mWai5Da1YourY90x1b7VFs7r+ZI8up5KWUBToBEDDxxLBiKr/+onqaHYO1ll?=
 =?us-ascii?Q?+Be7+wgzkF0Y6DTJySWKWUkF7GlIqTgLYOwWeiUGvcooNcxw5XbiY0bURR6V?=
 =?us-ascii?Q?wnvETpfxJq/8N8d1Bh5Bo3mrdxPWY0S5NJNIrrgl3oznsS0Bz7J6V4tC1IaY?=
 =?us-ascii?Q?ifokMVYjmen6mjU+eHUOeetlOwZbinUVCgwq4EVSwUttXWCQFIrOxy58qHgH?=
 =?us-ascii?Q?o1AlRE/NFEuN2HeDUsW1VReYwMvRkpWDWDLQeID94BmqJ8307+EFQe2gYpqT?=
 =?us-ascii?Q?Vi+t52S3EaFd0dN04hAJso7dYJ5uVAiWX285IiuugU9FfOnEFibZn+uKgddF?=
 =?us-ascii?Q?9N/+kQSrxheYW2Gnjb1UEs/sC+HOInCD0DK+3YErA+r5gMM9MQN/Ebsx8OWA?=
 =?us-ascii?Q?NibCpZrU6d/EFmVJrhCPI6PtUOiBfavhVI7bIl4QtJLfZDuz6jcue8qfDXyo?=
 =?us-ascii?Q?FixTtTwv3QRm59KzvPkgZ+CQh/ejQQKOyXW7R0vfxZydePVa9EXpfySLlN9r?=
 =?us-ascii?Q?2cWVJMK5GJqN0fdzPOC712CEx9E41Kpu1XiP623CY8BKovdw31r91k8UcPpd?=
 =?us-ascii?Q?6bf/KXTkta4V0ffJGc/5hXCfM0nVh1Czc4HtAtA0?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d04333fa-1f65-40c9-b773-08db82d32b80
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 12:26:08.7964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4zUlU7XBUUn7UlCX1B0dA7dcdoZCZUbxSFK/FTPR8vP6zhzHLyTxc3FEfKfthMgwtLzQ4fc0PsVWoxYievH2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184192

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


