Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40DFC001DF
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 08:45:17 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web11.7188.1691138712218312327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 01:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=b0NEOLGJ;
 spf=pass (domain: welotec.com, ip: 40.107.8.47, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bu8McLPXbOxPkrO8Zg9ZLV2mtKCBieaeOKleHqc6BdLJbfvY1qYRYy55L9/MlJ0tkiUjO7KuLOCsoK9P/0C5uoBf191mODfpjuQ1B8kItcSYCpIxevFvwsx9uY7hSQEhuyL6FiDPP4vwuO74wwhIf3wRPWcN+9xDFEnqb/QRTsckeQclYldT80YHRrO6SkI6pYMHdeLI4bkcOhyn36ThEgPVabLKPMbtgd/lkY3tstQsB2e9ubdT77oLgeLIt32c6sTdxaitKk2xsVbwLVPcJngFSK7nYljAmuHWok2ArIJMI4X66f7VEm34GEudHYvG0wgjE/olUvDlcBYU/wiVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P33WQJEW30zqyepsleYyL+zcJJR+n5oCySYOappl14k=;
 b=BievXmiV8W7ne+g0XsMa2WzTOSf0J9T3WKzuKiolk93SZlTaehkJc0Y6JnOiyTqVeJEOelb0Kal65u4yJuw+qySeRNu2X2zOaI24j51j8uXOMa3S0r8gqIHtitWTz9aQ9TNtW39JtJ+vF2PCLn54NqeakSqYmn7iuTUgT/Gns014fp837Y1FtDVe/Ht1uriRUB+QFYT2gU4EVqtxu4olfEC66v75mYhxkjyeQDHgR4vcCJ4jfT+RWyMLGp0zvGUAippTvGCNSL939TxrMHaoCdNAcP1hjSIpoExfcRh5+gtNBVXR7O/p8LVNZlsIBL1VlhelqQ13W9rqFMfIGKShKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P33WQJEW30zqyepsleYyL+zcJJR+n5oCySYOappl14k=;
 b=b0NEOLGJFX3ihNVe+fUbCNwnbTmNa/wecs03M2Tw9j/x4FMDGdx8WufQ8h7O09ZAktTJFkyrW4vQRzczqF4fMWLxuMSd+0I3jbqn3dh8HK5J9ht7OSPgQLIDBVMRSzUV90Y7NUKDuplALuHGwdlti2lmzz/FlPh3ttvDZ2IU2o4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Fri, 4 Aug
 2023 08:45:10 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 08:45:10 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v12 5/7] opkg-utils: add acl and xattr support
Date: Fri,  4 Aug 2023 10:43:13 +0200
Message-ID: <20230804084315.55768-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230804084315.55768-1-p.lobacz@welotec.com>
References: <20230804084315.55768-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: d303f696-3911-4294-9ce4-08db94c71c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oDKWvCMscafontWldfshhA4OzFfByMJ+oKxM7FHQ91X4Ki6JF0MKBlV8kQ1xRhJh4f2YKB8SlWp8Djw2jzNUCq4vdEm23Ya3EWRx0fTcs9zcDlBCV75diCUYT2duUZTOpwjfPRGkZSAvQVbHlDo5rObgVu0VRLpcdxSAI+H2Cyta+HSc9eV6T1uZ3P5Fv2i33DoZoe1NK6PiqQTfPSMllTKZrjNZANl/nPIVJRtCrf0/Sfi4uPweU6IZweb9OE5bgZCmD8ro7yUl2kFrOGkkSeQgDvmfIyXrszzu8GPaWcTCq8FvxL3tALu1HR8a1F2LcZCn3ZfIZLr3VDYcsyzPiCxNeeUwy8MGH4j0jbKomWA2aypGsMK9U2YQk5xbl+w0x68w4srogVp/duBVE6qEI77qZQ9gsU1HyGt92RsKs+twSwKpsHIdTUr9LDLR49q/z9+Nzka4DGfK0UCv2WVEGawpyUb3QvF1jzEGRQDj0tu755o8zSE4Z6/HYaZ+XsUAg1YD/57izob5mMY5u8EHcC+V1K1D/wo5WyktPliT5AC43Z5JM0ZQ3D35Z00xFH1Np/5zaHxAoRf1iTyHNR20LNK+3+4fe7C5KuelfAaWjeI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(451199021)(1800799003)(186006)(38100700002)(8936002)(478600001)(38350700002)(52116002)(966005)(6486002)(8676002)(5660300002)(66556008)(316002)(41300700001)(4326008)(6916009)(66946007)(83380400001)(107886003)(6512007)(6506007)(66476007)(2616005)(66574015)(26005)(1076003)(2906002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MI/x+FXspfpb+JfkIxnybUr5Ffp9SI42L4Y5kMpaCcwFltdQVoKFrVMovqgg?=
 =?us-ascii?Q?QmLEXmyhcn+HpF04iIB5c3GnN4Lhqztn+HjGh48t82Y0uVAgoZGbOoaDdbv1?=
 =?us-ascii?Q?9YwHWeKdJq+EkKRhNa6YzAujrU/xQEozkZaCEQ5TX0Xb3TFDG+zhPVSWIed+?=
 =?us-ascii?Q?7hAxJKJy7znkHhs7jvlkP3PALyHaQpDFDmYtPgr44vrmgr+QOQoBmy6eDp6k?=
 =?us-ascii?Q?q513HawiHk78iKcl8Q0/UvwyAFbl1PitE/QQnSEFTIzW+0hbvXYzI+Bk4NUI?=
 =?us-ascii?Q?MgtdHDEqt927hV1UKcor3MMqG0fv8jX+y/kL7T+GOPvsc3PBGBOF5aUOqehg?=
 =?us-ascii?Q?bIgwejKS0Ar+Gs/aIJkr9RPKWjjTEie8bx05+9kLsXmODrMd6kEbk4x/a/GG?=
 =?us-ascii?Q?VFjJeASSlbmvE9HHXeMQax5Dw3mOhuP2XduKHvFnMz0NWt0+BafEje4zWSsf?=
 =?us-ascii?Q?MIXTaKdI+NGPP/KlN6VHmJdy+TwmPqwcPPFFnRlOjIf2oXV3vCfKSim8G9I4?=
 =?us-ascii?Q?+pjlmopfZl51qN82OZiJYe5vZyWa1mmHH1wgJTwewJP5dliVOMzg8HaJiun0?=
 =?us-ascii?Q?vBjzyBYRrspzH06Oe5eQEFtVXrtYk+lxcrnrDyY5Yg81T5FxzrFnrGAR8yDW?=
 =?us-ascii?Q?/WAlK7qSKEqTdIqU7NbB1Rx002OTHE09gIPYuj0hjlnXsnywjv+jTuGXg9Ez?=
 =?us-ascii?Q?FKAUS89skdf1IzybEfvCc5dAlllwIDu4BYah+tb3E0OG/yr+b0IvIqMBtHr6?=
 =?us-ascii?Q?hv6T+gzbtzOjmJ3yfgKUVKy2BBvkbax7ILQAx5ebwEfE7XsuI7IlR2ppY+8h?=
 =?us-ascii?Q?abkcLYGNmwD/adPfF+FO4bqgVs0gLqUZYVGlL5C/b6bxHIK/T6ZJFDcWWfXN?=
 =?us-ascii?Q?U3y3ZX6hFtPQAlQZfpSXPwIdxXhNe7bEBsvEAikcdhe4nXGNQt5D7Ev8dr2L?=
 =?us-ascii?Q?B/iMUsf1as3CGDVUgHbLC560pN5uzMUXnjSEk4QeeEqCxVTI9CZ2oJgWYkCN?=
 =?us-ascii?Q?w+rvC/iT15ahyabREA9Lc/iMDU71kXFxXHK/YLkNtvrn3LSGSY0JYewHN4q0?=
 =?us-ascii?Q?lSHrmP2HkFSnVc0tdldBMP2p89gmo2CnVmph7zmdTBvLkfSSYvRbq1Lg99Q+?=
 =?us-ascii?Q?d42LT/S78cGsfZFrt5/ajQFOAJ16kdCdBX6wwBLTMaswhlLw3POmIMojmJcD?=
 =?us-ascii?Q?xrbRd0NZmJIa+TMvmlytHipV1NG2w2HE5ISw7X9ISBr83EXJlKkN9uoQpuUy?=
 =?us-ascii?Q?P8kuZ51vBozWVMZ8UM1kJ7sl82YNBkUUG1gQ5nId2m52IC8W32NI60gW2o1O?=
 =?us-ascii?Q?8dgoneaLzDDt3xaAzxBTf4+CYZXWGJJB0VZXXCVJeHbgSrpY3YZIKSOYdzQT?=
 =?us-ascii?Q?93NFdORl1FyAKaaF8CGyZSa8lC1DIHN7pgoXvyGujf+vovDGatjQ2KJOxkrr?=
 =?us-ascii?Q?izjQXhZFM6cVjk/EHi6DFz2Zx/8JheqrHE2hkIFRncgidHSZaSjr7n9+xs6z?=
 =?us-ascii?Q?dfIfcvL/W+DqE418p++SZ0vsM9o11HBESMn3fXQFUiev9loh4JGpMvv5pme/?=
 =?us-ascii?Q?v/0uVLHxcop6Je8/Xdey1alXUn9FyurLuWzEqY/r?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d303f696-3911-4294-9ce4-08db94c71c6b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 08:45:10.0161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PAeYK9YWefZOyZrjDPV6yvI5Sgva2pXkoRW462yZ12pb19UChqaqdN4QYAKz8mf2GTgqfUbjvkITtJ1NW/jtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 08:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185515

Add support for tar archives created with --acls and/or --xattrs options,
PAX header format.

GNU tar and libarchive already supports ACLs and extended attributes.
We can now add this support as well to opkg-build script in order to use
fsetattr or setcap inside do_install command and end up with a file in
an image with the relevant ACLs and xattrs.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...kg-build-Add-acls-and-xattrs-support.patch | 165 ++++++++++++++++++
 .../opkg-utils/opkg-utils_0.6.2.bb            |   1 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-b=
uild-Add-acls-and-xattrs-support.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Ad=
d-acls-and-xattrs-support.patch b/meta/recipes-devtools/opkg-utils/opkg-uti=
ls/0002-opkg-build-Add-acls-and-xattrs-support.patch
new file mode 100644
index 0000000000..3d98ddedf9
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-acls-=
and-xattrs-support.patch
@@ -0,0 +1,165 @@
+From 8316b5869625f38d6a012c1319ee9ce0e55fc311 Mon Sep 17 00:00:00 2001
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
+ opkg-build | 77 ++++++++++++++++++++++++++++++++++++------------------
+ 1 file changed, 51 insertions(+), 26 deletions(-)
+
+diff --git a/opkg-build b/opkg-build
+index a9e45d4..2a2e607 100755
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
+@@ -232,6 +221,32 @@ while getopts "a:cCg:ho:vOZ:" opt; do
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
++#    - Opkg currently supports posix format archives, but gnu format is l=
eft
++#      here intentionally for backward compatibility
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
++	echo "*** Error: Attributes: $attributesargs, don't work, without posix =
format, which is not supported by host's tar command." >&2
++	exit 1
++fi
++
+ cext=3D$(compressor_ext $compressor)
+=20
+ # pgzip requires -T to avoid timestamps on the gzip archive
+@@ -301,21 +316,31 @@ fi
+ tmp_dir=3D$dest_dir/IPKG_BUILD.$$
+ mkdir $tmp_dir
+=20
+-build_date=3D"${SOURCE_DATE_EPOCH:-$(date +%s)}"
+-
+-mtime_args=3D""
++mtime_args=3D"--mtime=3D@${SOURCE_DATE_EPOCH:-$(date +%s)}"
+ # --clamp-mtime requires tar > 1.28. Only use it if SOURCE_DATE_EPOCH is =
set, to avoid having a generic case dependency on tar > 1.28.
+ # this setting will make sure files generated at build time have consiste=
nt mtimes, for reproducible builds.
+ if [ ! -z "$SOURCE_DATE_EPOCH"  ]; then
+-    mtime_args=3D"--mtime=3D@$build_date --clamp-mtime"
++    mtime_args=3D"$mtime_args --clamp-mtime"
++fi
++
++# Notice, that if you create an archive in POSIX format (see section GNU =
tar and POSIX tar) and the environment variable POSIXLY_CORRECT is set,
++# then the two archives created using the same options on the same set of=
 files will not be byte-to-byte equivalent even with the above option.
++# This is because the posix default for extended header names includes th=
e PID of the tar process, which is different at each run. To produce
++# byte-to-byte equivalent archives in this case, either unset POSIXLY_COR=
RECT, or use the following option:
++#
++# --pax-option=3Dexthdr.name=3D%d/PaxHeaders/%f,atime:=3D0,ctime:=3D0
++#
++# https://www.gnu.org/software/tar/manual/html_node/PAX-keywords.html
++if [[ "$tarformat" =3D=3D "--format=3Dposix" ]]; then
++    mtime_args=3D"$mtime_args --pax-option=3Dexthdr.name=3D%d/PaxHeaders/=
%f,atime:=3D0,ctime:=3D0"
+ fi
+=20
+ export LANG=3DC
+ export LC_ALL=3DC
+ ( cd $pkg_dir/$CONTROL && find . -type f | sort > $tmp_dir/control_list )
+ ( cd $pkg_dir && find . -path ./$CONTROL -prune -o -path . -o -print  | s=
ort > $tmp_dir/file_list )
+-( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion $mtime_args -c $ta=
rformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data=
.tar.$cext )
+-( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion --mtime=
=3D@$build_date -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $t=
mp_dir/control.tar.gz )
++( cd $pkg_dir && tar $attributesargs $ogargs $tsortargs --numeric-owner -=
-no-recursion $mtime_args -c $tarformat -T $tmp_dir/file_list | $compressor=
 $compressorargs > $tmp_dir/data.tar.$cext )
++( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion $mtime_ar=
gs -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $tmp_dir/contro=
l.tar.gz )
+ rm $tmp_dir/file_list
+ rm $tmp_dir/control_list
+=20
+@@ -331,7 +356,7 @@ rm -f $pkg_file
+ if [ "$outer" =3D "ar" ] ; then
+   ( cd $tmp_dir && ar -crfD $pkg_file ./debian-binary ./control.tar.gz ./=
data.tar.$cext )
+ else
+-  ( cd $tmp_dir && tar -c $tsortargs --mtime=3D@$build_date $tarformat ./=
debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file=
 )
++  ( cd $tmp_dir && tar -c $tsortargs $mtime_args $tarformat ./debian-bina=
ry ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
+ fi
+=20
+ rm $tmp_dir/debian-binary $tmp_dir/data.tar.$cext $tmp_dir/control.tar.gz
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


