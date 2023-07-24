Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D68C0015E
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:47:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web11.5608.1690231619658110944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=dRA1rhIH;
 spf=pass (domain: welotec.com, ip: 40.107.21.59, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ev5QL94QtiutNuUlpAhuXYwcGewqRffRhzcRszCzjFK98ESjjEUmP3SjCKWnZntC1LhyI6mB2pIn1kxeRH3aqm+YGYZ3Orv0Ng5f8OOpyEDmmOBD7fMQgcbu5VVKEmgfZ3aVTJLiv7qtxHNDfQd2LG+uAjloTh5S6KSuhrX8r7p9SO5SB6cs8iOAZB8taFfgOEdX/1GNDm9uOy96zdpZr+ztZEpA0Ft0SRAI2rnR3Xb88KmU0vwwPt9si6nfE0afDbVGXrXSD2jZotwLQ7wir5H+ELaiX6f6s03UASer5U6vwHVsYV6PFyx9k9pK3+ToWS5GxafeCKz26C+UYvUvTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+F2kLopGLQjUBlkO6mO+LhXbsWAoujU2FivGCFF448g=;
 b=W8X8wIc3d/h4Qd+zRQ3+dcLViNyV/PGx4zkQ0Cy1WFJ+P5Naeh/PriLKOq5CWE7iKgY288BHl6W+y210Zwq6wLSLggPN3QZhtZTG5dsXo1N4cP9NKidJzQ4+9E5Hu3rRuyaP6heQ6cXH1b/jj1i6NIVJH4rpvC1rXN9l5gzRq2Qh4vTDcbpvXBexDgeOUFgKq7DC4poSCA0osPt/+Ju4Qj3vf88si+VRnpRi9LfN/mFDul9hfe0tWdfbLKQeWCPkwkeMv3lUTGXB8k4JzfKSeg2ZanEQLB4Mr7Da5IiI8HXnaFGxREl8qZQX/q8kHt51pEEOzHjd1gvvRzsqfeCBhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+F2kLopGLQjUBlkO6mO+LhXbsWAoujU2FivGCFF448g=;
 b=dRA1rhIHbhu6I7o8i0erd/DUw1zjIllTXB/ysu/c2D4hSNTLWwi3HNk3n8qQpUvw0b0mnwZuOcaXgf2hM0H7idYzKjbk/9EUk5jUagjiUCZsFFIgZlx9XUboQVbR8/6N5lxRAr9cZIgPelr07tnbyifv3r/Mr6XBfWrSqbM9BDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS1PR04MB9262.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 20:46:57 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 20:46:57 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v10][master-next 3/5] opkg-utils: add acl and xattr support
Date: Mon, 24 Jul 2023 22:46:37 +0200
Message-ID: <20230724204639.353571-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724204639.353571-1-p.lobacz@welotec.com>
References: <20230724204639.353571-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS1PR04MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: 284ec1c4-e701-48ea-9255-08db8c871f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	btSB7mFjYSGGTuedrfHnWtQfT/KlQFTsOOJ3HNL53kLKAdy5cAClR71LDeebjQqEy1kP1xeEqCopruzuMK7WycjHdeXILVQwR797NePjbCPz5KNlKVeb9mBla9c+/u0rf3CgQACMrQ23+rNs0dW0Ttkl7QmVpVeUT1SQJsNp1TMpdBnyjRDAwN2HNzIDqlOpDbPY5iD1IOEjXNDlbrJjJw6//XEg3HAII4ONIyhQU2bR2QPMD5bEiW5u/sxarmhTVaQ+LePnkSKn1aFZqYA8auwQY0K6Drk8LtFQSAwdYgjCKzKFk400no57FvaXHfa6VVDECqg5ZPMyxPz4cId9gfsqYh53G5SroN3yRC0W6wLJh1qq2T4exN0clpzokQ9lAPR/ORNFIwTqPoPbTv6tKCCXwIBgSNKafgypljpuPpHqJNxUSCREqAkp3pzDIv1OvRA12JtZojhN0WHUiOfG5BoUoC5xh6V2M2cn55ZXNUge6bistzOoaVkRnYrJLsIcz9OYI+nB77PMNgQPlapxx1Y2fdPlFAfmNqwYPW0XyYU+xhowrAVAj8k5aKVFXFGSmemgE7Zj7d5/tP7i5F3HG+10TfhPU4zx3JXdH7Iu+9w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39840400004)(346002)(396003)(451199021)(186003)(26005)(1076003)(6506007)(5660300002)(36756003)(8676002)(8936002)(2906002)(2616005)(66574015)(86362001)(107886003)(38350700002)(38100700002)(52116002)(83380400001)(6486002)(966005)(6512007)(6666004)(316002)(66556008)(6916009)(4326008)(66946007)(66476007)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GFAcPRjW87By8WSHh3G1JkKjltKXjowfr96PxqaScvPst+QUJcRGbkljXInh?=
 =?us-ascii?Q?gDT7fWoi/ZoOM+eVTUVMAcAaZzg/ctbJFJHkulcWxs3HqmMs6+l5rnnErBPa?=
 =?us-ascii?Q?p4J17P51A5pmhyAM1Lh775kGZrml6keF/GFKK9e+HlLwxPqzH0+6JGkCLDJN?=
 =?us-ascii?Q?ir1NNqLh08+B4Cry9T5b3YBgbzPAPM8lOeLnLpXS/3+2OlMZnGdLSDu7mm4z?=
 =?us-ascii?Q?GUX4xg0eh2lNu2DUfbEJ0FDgpX6xNfpMULtidcBbA26vP40bzanEY2vHI6Ns?=
 =?us-ascii?Q?Nq0Je6z5hM6h7k/6JTrtE3KzzrLIFi7WDqIP1eDTl7MYqFImYFgA6mZWzN68?=
 =?us-ascii?Q?pLlrSAca7QTXtPDq6xhPYxl82PbPZtjU7G+3C21u7TmOMvv7TpDmjlZVTP5k?=
 =?us-ascii?Q?ESpSYqLdgqeceVJdf2W7pnPlFd2Y0iDZ2xoiD/Tf1Wb6Q4Pinmi8TCtFpwfD?=
 =?us-ascii?Q?NVDREpUPtUmr2c9y9Tk6CDI/jlRUp0k4rNeTEQGBt+4IWo9H5cLJ3IYuVhnh?=
 =?us-ascii?Q?UrdfoGESjJ+h6llBxviFDXYrYB/mwwQfSqp0OrHxElq0P6npqjlH0kZZzR8I?=
 =?us-ascii?Q?KLWR2UxONWqO1/riltZtQqQx47VF5ggQyEWmBIvMJKKhawVSIl57IsW/hemI?=
 =?us-ascii?Q?sf6KYlA8BpUqy8uKgHpjDBb2z/kOhmlKKTIhMA8hDr4gko+KBTckjnU/TFtf?=
 =?us-ascii?Q?suuWP27KmR7xtH9tJ46SKURZD1f1rC5/3PzwHwhEi6qtMIFKXXE6pWDX9/dY?=
 =?us-ascii?Q?7Jjizk9Q9Cu5kmzIPJRHtDSNVTWkrrk27ns7WWhW1YBv6qCWvabyyqIxkK02?=
 =?us-ascii?Q?GH9YnEHflbaeNRQYIrHSylcOU0nxrt7QOnkRuXRpApUbHrdp21ZcB0/ApAD1?=
 =?us-ascii?Q?zc/vohQc2d9phebEz3e41fJGCLFG4yqqlJZqQEtdrln7yzvK0tAkNcVfr0jP?=
 =?us-ascii?Q?FTzolOah89uK2g5ZT5BfWU/Tx/xD7ABVCvwxV2p5nvFwSHxoeEQoNbPhMnuH?=
 =?us-ascii?Q?6QeVb8bQ2PpnuyhvMNMWcR6ThKWl3lGuj4uVJWZshXunblkiqdYXl6ydlz3l?=
 =?us-ascii?Q?6FlVHz1gs804NxlqV5weSZEQiX1h5H4vdImpk1jwO0vyba+jUvV7O2WDV9ZX?=
 =?us-ascii?Q?3eHgDvQbQOmDyqib4SuGCD1npP59EQaXs+c2fPOrJHTxlG3U4wfyKY8Q1na4?=
 =?us-ascii?Q?JONQ4Pr2/l0ATAqqBpMeL32IwB5qZbfY+4yS75Osw11nNNZB7F7ukuvOYEiU?=
 =?us-ascii?Q?sMtcGY5jP4TMkkiyD9dBkUDTXZKNfE8YXu6AapFna9FWFgx2rnN0d536dlSW?=
 =?us-ascii?Q?j5n/YFUEAZZJz+8vOht5LTGBGJmLelE/3sOVUOoSmmouEHbXCciquf4WXn4F?=
 =?us-ascii?Q?zVqnHwZ9MCzrQ5+6m/WjmmzuNFsbsQaVl3episMXGQ52V48TS2HqgrCVadr9?=
 =?us-ascii?Q?ozf+1yV6cTaNnAFDanKW3FOnCYWdiUy+fBIz8BYC8VwTnKAuMyMCx5j8rt9O?=
 =?us-ascii?Q?7imsbzygPh8pIejIV/hg0xX/o8QhqdZX3NANYjW5vDVVjf6JbnmstP7eyZmQ?=
 =?us-ascii?Q?AImClOVF2bDx2Wducg0wnhAXAxdZ3/ltN7Rbjp8m?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284ec1c4-e701-48ea-9255-08db8c871f29
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 20:46:57.5774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0+HTK3RDp1ZGrulSN27danpsw3wp10k2XSQTU0rX/Zjo2fV9+ZhxiwiMw/atRsZwWjIR/y+LaeFYiuSjFnf9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184815

Add support for tar archives created with --acls and/or --xattrs options,
PAX header format.

GNU tar and libarchive already supports ACLs and extended attributes.
We can now add this support as well to opkg-build script in order to use
fsetattr or setcap inside do_install command and end up with a file in
an image with the relevant ACLs and xattrs.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...kg-build-Add-acls-and-xattrs-support.patch | 164 ++++++++++++++++++
 .../opkg-utils/opkg-utils_0.6.2.bb            |   1 +
 2 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-b=
uild-Add-acls-and-xattrs-support.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Ad=
d-acls-and-xattrs-support.patch b/meta/recipes-devtools/opkg-utils/opkg-uti=
ls/0002-opkg-build-Add-acls-and-xattrs-support.patch
new file mode 100644
index 0000000000..0874d3f75c
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-acls-=
and-xattrs-support.patch
@@ -0,0 +1,164 @@
+From 5a5901f703bfac7376cfef3d4734c37400db03f1 Mon Sep 17 00:00:00 2001
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
+ opkg-build | 76 +++++++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 50 insertions(+), 26 deletions(-)
+
+diff --git a/opkg-build b/opkg-build
+index a9e45d4..b3127e0 100755
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
+@@ -301,21 +315,31 @@ fi
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
++if [ $tarformat =3D=3D "--format=3Dposix" ]; then
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
+@@ -331,7 +355,7 @@ rm -f $pkg_file
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


