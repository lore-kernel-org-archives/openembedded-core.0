Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B93C41513
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:47:09 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.56])
 by mx.groups.io with SMTP id smtpd.web10.186319.1692276425651255430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 05:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=M8pD3sm7;
 spf=pass (domain: welotec.com, ip: 40.107.105.56, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIdKOPqWgtSE4QRL6Qi2ehwjo+2+EZFti1R+FYd6qTYIGhcNWs9Uyz9WN4+0733jHVXA4ptkDn9prAz6Z3zfqq8tGStO9jDZKyZMNDSUhrGrCc7ehCnVZRiGMOBvcXZ48aWZP+s6wohE1jVrl+T0W7etQvRF1FnFA/LDUw+xUrjhAFj6tZTRv6VcCxe4GvF1R4dU6fJFeKlFIq2iQvpKUbTFoEPEYBoU9ysfqGxyIqEVThySzqGLRE9a+cK3Q+DTUvjqMimeuQs6P8g5pOJqo7+PHgXZFUdgusQPpnrKqA3ITgYRjYxjkwcJgVVr0GtTqddtffa+9QWQrTVd8MlOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvNalNkfKE6mmhkB9eHTAmxeM/0bJ3htolBzMKuEj9s=;
 b=CIQw4Ey6g0xvd23/06AE8IrjBJHR/naWBhHmgOBpaglCmVi68WX3x0B+tx3bwZXsic0ad7AU7K1TFITSWTKvjdMXCEW+/gZxuxc1wFlQJ6ILvgK8GOb5L5Zu4WoDy/97XI9HK2VT/iGRzS3QMkYJ9LGUNszQ/pcUjfBxKaFhn+pSlj/LlIHitTR5URP6AsEc6peuQ25tQLQYQlNKjyC1Rb+nhIDTZSgRYBfgXckFFgLYYVSYIGkqFkiLveYdpMZJ4Gf+ZhnIxqE/LmhHvkF6tZsYVXuDQsle9itDa6jYLl77NnfflagwqHNu0gMjM3DE9gDacEw2dohsvYTfPynP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvNalNkfKE6mmhkB9eHTAmxeM/0bJ3htolBzMKuEj9s=;
 b=M8pD3sm7lfrl6h77MP16yFFgBFtMK8BIR3uqNVaOgSV0Sj6b3IRQDZyYRLIoYciVZ2zfBMrDcvKRPxCeritcnE5w8gBYPR8pg6oc0qjipv7Ott2lUwcHnz6aMuk2JQfxb4GV3Hc3hgop8czQ3k17GMTrdmiGGXHt1FYyT+y5qyEE9k58LJ6BLyH6/JpAPHXof1js7zskz86IVQ44pM69HVx6uJyE4MvP6XT24r2PWG5ARSUGErld/FJKxjfliRZ+XrU7t1+/Yx43z3+tGNg/nsjhJCl8LR86BIbH8BpYvTHQl+L1QKuDbPZe05/ae/NAGnnnHpAeI9Rfa217LImUcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7808.eurprd04.prod.outlook.com (2603:10a6:102:c8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 12:47:03 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 12:47:03 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v13 6/8] opkg-utils: add acl and xattr support
Date: Thu, 17 Aug 2023 14:46:10 +0200
Message-ID: <20230817124612.1043464-6-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817124612.1043464-1-p.lobacz@welotec.com>
References: <20230817124612.1043464-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::11) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: df10d203-2fef-4d0c-60d3-08db9f200e22
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	79JlvTWWGLJ1vwdxg3HUz9ca9A4ZP/oVKDto0uqh0rj+KXpGxmRasBWeZEbf5XxTmYoaKgJ3tugcgXLraJrob4N6IQS5Zn0qQ5gMKu4bNoxcEy8UxaadW7DhnncP2AxXhw/nDapC21+Vc1Kuet3UFs6e3d7EXKmDHuRY26dMqgovmXeCmL/vQMvmSjq/OyXG7LtTysynxHV8vhTOlyHCToucBvZh3u8U5Vbp9/E9mnHMmFqYGd5i9fqhPAWwSws8+vABP6JGwWbaOdCK0Pf5PuQUDl4vG6duV/qOO46ybW4bUp5hsLgMn3VJ6iGMzPGdVXIdCc1IYFdYKKkBWjp6FAm2cokZcWU3WbM3HKGYdXJ0B3xN6n6W9SxEdOCnHSP1e2VB1AZhUFmUFsp4Kup13yxoZKqXewOXzFg8WFvGivvQgfWpETzMT88J08iZ5SLP3U6t21gK2/p9ELmVWKPPtYgUNQPcwBqlcvd4YoA/2Ig+rLqAVa9wv8rBWP3WmG6D9u0Kc/T0Vn1TcZaGCmFQ+ygYnrFyN5FuWeHSlVxNzeYcu+ZTQlDzj4qNHYh4JEvozYGnpDsWNXJG1gP5lYHscyucUQ49kgtJ/1sCFkBgyVU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(39830400003)(376002)(186009)(1800799009)(451199024)(8676002)(8936002)(4326008)(86362001)(5660300002)(2906002)(36756003)(26005)(1076003)(2616005)(107886003)(83380400001)(6666004)(6506007)(6486002)(478600001)(966005)(52116002)(6512007)(316002)(6916009)(66946007)(66476007)(66556008)(41300700001)(38350700002)(38100700002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9G5BUOPQr7cqlEntWJfcxcE9t2g0W8P1oBq2xNX7J7cl3kifucof2GVGD7ke?=
 =?us-ascii?Q?CAUzeVHTUx/3SMkAe6Q73yYTZN2r5KptSjLm9lsCHrhbedbX42X0ZB046tcs?=
 =?us-ascii?Q?rvOo8QqK96ubEM6uRwKR+DjLqS3iHAyozeS1Lg1YqMRQsqzCBRQ9DtamPYgo?=
 =?us-ascii?Q?i9cKtGLE9KdpeSuuCfrsnAH5nhosPBfXG7xIvuZZ7Q4hrGPYZ+JuKnCNtu0v?=
 =?us-ascii?Q?zBOUtZgTaE2SIHdLkdmc1+WmmXsPDzMIgW0sP4sBDtkVLL1ExLkKDKBkMHF3?=
 =?us-ascii?Q?ZhtG8AZyShpsYSxCEy6DjMaX5E5LV81KAJ4qFyE7F2SdS5V1i+HxA32rbcZ9?=
 =?us-ascii?Q?AjYgdWo48XNxDBEoORGKOMfnUU1ngehzxT99Gk+xyQU0+MwvUqJ4MjzYrTzT?=
 =?us-ascii?Q?WXVPYkazKTSoKwfKLWtLx9mcWqjgtqXV3qWMMIKViAxbODnOrcJi8kI+pWWZ?=
 =?us-ascii?Q?I8LDoiG5F/DR5na5PkxVMiqXfkI74N5EvENO2DAZtmaWqcB++EGjrz4LCIRm?=
 =?us-ascii?Q?WYpYBi3rtumpVdJFh3H7lOS267qI9oL4N13qo2szpGC3nve7OEk5+16Ro+vU?=
 =?us-ascii?Q?5DWZbG+2p3Uqu2JykiM1RnoXwSPR8iT5lPL7Cd5udssTBQx4NxZYH+3I8tik?=
 =?us-ascii?Q?zfmJ7LmUBF/tQoiXhXCpJorQ6BayxVj1zp/inpi4sB61ucV90VkPLggwa/a8?=
 =?us-ascii?Q?zFbSLxC5w+rFQFBdEOnpnSTRn/xiPrtSiFkq0w+y2JJpJv6Y+xrcBXtzYPKq?=
 =?us-ascii?Q?j4AjrSaF+t5P/Ual475g4NYTzr/hubajX8mAeGtml9+AmxqP3m4x1fRagLmC?=
 =?us-ascii?Q?NwSkYPruesqAvZCPlg0xKTmHalQnFZUoX++uH3A9Bd83inQghsGqijpQe8xT?=
 =?us-ascii?Q?uFePgcvNCs5GNMAJhOA+HFD8zejf0E0Kf23llx2fD5RHWnY8okZmHCBSvR5R?=
 =?us-ascii?Q?UCcX5xdjLhSf+Hnxo5OBYjicfz/MckOxYk8kiEAlyuoqtCNI0b+02MJ0LEIS?=
 =?us-ascii?Q?UfGXjXXPbq2g2AWFH9tP8+5S5DK+NnI7rUsii5HZ5/fXmAtFAs5p9JLH/QKC?=
 =?us-ascii?Q?+JqYJp4ig1JIccojk0OBgBTDrcfRcO7pLxewQPQhqODa48XTOCeRSTduml0I?=
 =?us-ascii?Q?SC2lVBuIyMuP8236vsEJmi8Z+DKNfWtzIEGdeMkD+m8s6Yg0Z23DT/XnsNQz?=
 =?us-ascii?Q?mJPPs56peN1+0oA8DS2UTPAfAK7NavYAQ32XQROb2L6FXa1dMlOdxFbJC1cV?=
 =?us-ascii?Q?rZTQEk/3N7LyZvOZB6yAlj16Ih2fVhXFNrUj9BG6JHuEXz+reXuARAbrD4E7?=
 =?us-ascii?Q?1RtvEBzSZiQdI00/tf0rjG4oE7XSkcoFgf1rxunXBYcTDPZQQcUIifM3c5QS?=
 =?us-ascii?Q?Poo4Z8u+O+H3cUEK9oJq4qP+90a9wZSuCuWTb0vlsP06jhO1zgrjE2cFJq33?=
 =?us-ascii?Q?bhAFCrgVxfLxS1kpVf/CSk5O02piksfSzAvqQOti7HFmUnkNKdZSHYN5sEXD?=
 =?us-ascii?Q?892Bt9dw4EwK7/dJ0/R84P7EAK5P4DiAaGUDRzdM9f7eBC1F97QkIxOopNYy?=
 =?us-ascii?Q?jLMAGJ3p06REtY2yG1mKaVSZVZ6Mt318MPcGkbw8?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df10d203-2fef-4d0c-60d3-08db9f200e22
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:47:03.2287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrG0mlbSprMy144eEaL+1ixwdTTQv/7USJ3Q3/Pzk65N+yJ1J8HFj820bmLqPGOBhuX0SSULlSgvkrgne7N7XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186312

Add support for tar archives created with --acls and/or --xattrs options,
PAX header format.

GNU tar and libarchive already supports ACLs and extended attributes.
We can now add this support as well to opkg-build script in order to use
fsetattr or setcap inside do_install command and end up with a file in
an image with the relevant ACLs and xattrs.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...kg-build-Add-acls-and-xattrs-support.patch | 174 ++++++++++++++++++
 .../opkg-utils/opkg-utils_0.6.2.bb            |   1 +
 2 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-b=
uild-Add-acls-and-xattrs-support.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Ad=
d-acls-and-xattrs-support.patch b/meta/recipes-devtools/opkg-utils/opkg-uti=
ls/0002-opkg-build-Add-acls-and-xattrs-support.patch
new file mode 100644
index 0000000000..32513d9b16
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-acls-=
and-xattrs-support.patch
@@ -0,0 +1,174 @@
+From 8d9953dd8d589e9b740307976cbe474e0ce292a0 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
+Date: Wed, 16 Aug 2023 14:59:35 +0200
+Subject: [PATCH 1/2] opkg-build: Add acls and xattrs support
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
+Upstream-Status: Accepted [https://git.yoctoproject.org/opkg-utils/commit/=
?id=3D8d9953dd8d589e9b740307976cbe474e0ce292a0]
+
+[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15097
+[2] https://groups.google.com/g/opkg-devel/c/aEGL7XRXfaA
+
+Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
+---
+ opkg-build | 81 +++++++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 53 insertions(+), 28 deletions(-)
+
+diff --git a/opkg-build b/opkg-build
+index a9e45d4..fb0873d 100755
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
+@@ -197,20 +182,24 @@ compressor_ext() {
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
++	A ) attributesargs=3D"${attributesargs:+$attributesargs }--acls"
++	    ;;
++	X ) attributesargs=3D"${attributesargs:+$attributesargs }--xattrs"
++	    ;;
+ 	o ) owner=3D$OPTARG
+-	    ogargs=3D"--owner=3D$owner"
++	    ogargs=3D"${ogargs:+$ogargs }--owner=3D$owner"
+ 	    ;;
+ 	O ) opkext=3D1
+ 	    ;;
+ 	g ) group=3D$OPTARG
+-	    ogargs=3D"$ogargs --group=3D$group"
++	    ogargs=3D"${ogargs:+$ogargs }--group=3D$group"
+ 	    ;;
+ 	c ) outer=3Dtar
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


