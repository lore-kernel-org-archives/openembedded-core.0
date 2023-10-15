Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3FDCDB484
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 14:58:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web11.94695.1697381916061748557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=NNU/EpNa;
 spf=pass (domain: welotec.com, ip: 40.107.8.45, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJDXFsYbz4MNxqSPrZZeYuBRL5onnSSYm7f+sDGYHcW0mbiGL7el/BlRjQjG9ArFgITgFUlOD/hXx+cWNWEjLEiFULHYHaR1SCjv1H8CUbxFDl0Fyf9F5CqRzt5T5FSX8YJnM5YqkF0oG3FM2JyZLrcZfqpIr/R0YFpxR8KCR14xwOqwcDSsFxFD5gNmJZB3Wf1q4rGvpXUddMnv4vjwAr8AdWcxVgWJd4Yj5lP7hwju5WnFFfNk8O5qrGchcMOly/JVSWw6aOYJy46PKwcwz9A5/dn/qISr2NHpFTWVge4aSypxGFscEkC64ip2imeZxHNYmId+2ftU+5RZag/5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0r37I+i7IcUwDLpxeh9T2YIhLPLA6sWmKLn9yi2Maw=;
 b=jnVmucDv27kDzdeB8UHCK3VFTADJHHKkLStu5Ix5yRK5lHkISqZTCkmNuF47Jc1JpoI6ab1amE00/jXIie3NR8jXbt8VhA/ojXkZUtG+khVPZiZJriJMz7Fz73KTgabRO12SHjYRiAYB17jq/X779FZZWhzqE8yAnKNnYWeb8d3fRrGcXUCNBJ3EK1X1SYLCqMqx75W6aeeGWvZPbgGOomgmQ+nJ5A/QAj94EQymuGo6DuxzIu8RmtG25dC99YcycBnI2SfWrkKrck3nsAhE4fAfxWdk9bRJ3gb0U4RKOjAFkvfox5x2nwChigtC3wOiqXY9GnuaMO8y97fpMTJWrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0r37I+i7IcUwDLpxeh9T2YIhLPLA6sWmKLn9yi2Maw=;
 b=NNU/EpNa2wRUYHdz/CALINPbiyKLnqR7lNMS8gNUFvob0HQjO5udQIsvmr+fusybp2DBGKsfW9nnzw0LRYDcgDGctIjyKPCNs8iE1i8g46HyPFsWBu4n0/Ix5tLqPvSebhHAekHLS8Yo0SkzfLQIKc6C+eJUgXErOyLvtH24zrTMMfIht3vyWBhQJ35gxFYmN/AuFUAAA2jpKjVAANoaUsT7Z78iI9mwAybNuh8PC72lMDWkmbo7xO7df0FTNR85G3OkIsbHxwGaU7evSlaOwAHvuv1yKXOFyVjZtu4A6Hqwv/U5SpT7GOmj0Xo1+Y3K3e2d1fc9/rbmbgmDJ2veXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7613.eurprd04.prod.outlook.com (2603:10a6:102:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 14:58:36 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 14:58:36 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 09/11] opkg-utils: add acl and xattr support
Date: Sun, 15 Oct 2023 16:57:47 +0200
Message-ID: <20231015145749.69995-9-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015145749.69995-1-p.lobacz@welotec.com>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 3359dfcb-cf40-493e-f152-08dbcd8f3565
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tr49XCdVz0m80L6dLQl81Vmn7aQKAGl+7dXwmkObjq4I8C2ObOVoHKA3HMxRNjbEnXOdF8Kml3LiM3Cf2fI3C5QEdP7iOU92WYo23QhoOfzSMKKr/Y6FdX+WS67TE2RqW8/1712oGjrKb9A4k0Wq6Fw+MeLuALfEfD7woYQgEKQEUai+pPFOgpmwpmVKlPRSmza9bFjXUkp2nISyX4yLAlGow8UzEkh2s30Xq9bpePKjJUpqq5nfKv03Awq8SsbS2Rfh0C+ndX7CyKYanQ3KHF8b7YsXDef904Kx72TXKtgapslIGsMTdpJwcYcnYzX2dGRRERsUroB3gGDgRxYbt5DzzXoXczpsiEBLqgs09YpcQ4zJoJ38+Ad6UV3+VyeHpzLUWjP4sMSQqJHZPsUlQhA//+bhw5SB86OKwiTbeLdikItq6HtpjZwvAxonX7tuxVTUmcXWWmuEBTyi9P/3jNQpZaawK1XUxxG8fQyguSZZ+7mEWWJSt/Dds/nMU6mpXIVRzMMJG3QsVLUnDPaTB3EhPpmoUH0PFcM1ZixgTWjjy/RADqKkY9Z0l3b/+GZkhFjPJ3jNpVLzhRAHYXTg5ZMMPA1/fLlPOiQdYtJNu/E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(366004)(136003)(376002)(396003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(66946007)(66556008)(66476007)(6486002)(966005)(4326008)(8676002)(8936002)(38350700005)(5660300002)(6506007)(52116002)(38100700002)(86362001)(6512007)(2616005)(107886003)(26005)(36756003)(83380400001)(6666004)(1076003)(2906002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T8RfkhfiIkeW+eHJONLSbEVeuu/yuFlhgFDRDkyMMv7wmvgMLCk7wHInJxj4?=
 =?us-ascii?Q?S+uVHlZ9J7Hcq3q6q9Q/osh2GVSAaX4195nDbK4XMrjwOsd2oePP3vP9DvEF?=
 =?us-ascii?Q?8YvSa8ahDHRZmin8JB8T+lYdOILtGe2gHSlCTWia6sm8Z8m+EqO2JLkRe4Mx?=
 =?us-ascii?Q?+tQww4IatcuDuqADyE0V3c1v5NADgOYDCoVMgPo+T5AyMT5k+yXKPH+uNkXR?=
 =?us-ascii?Q?4PeqOqbllyDGBG4EZhFgx8/2t4fmLBJxQzfKfoMfXRqXdvAwQXK+WeYO1Zrp?=
 =?us-ascii?Q?L0KjXoZ5KThygY8xMHN4oC6I9nERw+7YIHwwB63s00MGWwwgxLB6R+yGfBbH?=
 =?us-ascii?Q?oH2msCKVCg2S+9K91TBfNaky0FU9CtNyTdlLihe+/RLvJ8MHK/FN+rFMikMD?=
 =?us-ascii?Q?n9lErkfVC5Cmj7K04XsBwLom0x4subl9p21kHsP4Uc9AZw2fRR0D3eRQC0L1?=
 =?us-ascii?Q?b96yJjqjjuLlu3O2uigH1Zs6OicmNkHA0fQ3yrop3R7gU2qvYjIk6XOIYh97?=
 =?us-ascii?Q?69XWcOAk+6mzq/V6/+C9hgZniz0rN4CZuvNiuaqy6D0Q9eHvMmoiGOHY7d3v?=
 =?us-ascii?Q?ZwLLN91oNLrHQf60peDqng4g6l+zVujQiJqwTzDs2HhKcUyi4VF496SLbZPZ?=
 =?us-ascii?Q?RUTB4+0XD0WiQlSCjRb5c7z5TviFdjA61dI8cBiZ7KrmHdqEuGA891qM104j?=
 =?us-ascii?Q?f/4AO31go6i7CAbBKCY1ywA2+oJBhCWQl6yKj6AcVbhjIHz8exDVXFQTpBfD?=
 =?us-ascii?Q?Rn+5iOBAsQLhUbdAyG6r/VpkzazT7YJ73RcmBPRk7KeGcZt0ESqnWe7b000K?=
 =?us-ascii?Q?7gn2KA/+3PVoaSIIMk5As2vEjbcyKvYexKQnJJ4mHwaeWVECVuYYWLqozHqT?=
 =?us-ascii?Q?P9PgNIgkfugJbqhGnM96+/sF2lcrPsNXZ/yUSGggpEXBAKS5o4gagMxOK1yU?=
 =?us-ascii?Q?NdK1ohHkdpOf1GV8DDSbsvaC9E02vnHJfPQ+7ZDIs+oj0z4OHD4467x6DJXZ?=
 =?us-ascii?Q?pf/tI1hZgwhpnS68c89QtoPlBi0wr5U4jr6viMPF89DFndKqa94Qz9H06OQn?=
 =?us-ascii?Q?ZndrXW3dZxmRxgkwX3gFxv4KZjhCbHtLbsYc8rKo++PA6b0KR/4zDhE1+0M4?=
 =?us-ascii?Q?BCoXAoVEoEOtBX/t9UpZo0xggLYcknlbKYozzlAPO7u0qTpzmm/7Jue5VORT?=
 =?us-ascii?Q?j1W4ssJXCpsgSBKj2GIlxzxSYz7RAOY5tjhaFvtcoXZ5cl2lMwptWJ+SNm0E?=
 =?us-ascii?Q?mcQUjmYPJoNOEvvyKt1HPn2qGxu01IsOV7hA8s7syS0gDdY6OI5gKxtHJ8aW?=
 =?us-ascii?Q?+9t5i3cExs9tvpIDF9CPxcbDnfMfeo4Pljf0rds32nwl3jPKBN9/SJ+qrBcJ?=
 =?us-ascii?Q?JDoPgKS8ttvy/Q5lh8MMDK6sRtYYiQJoEb8RZUKjYsSGOxwlYFOrNGCFFOt1?=
 =?us-ascii?Q?qZd8AEFpScc7wU19uHCUGwrAOAev8A9qjQgx/nD6NxxL1iox7xyhKWboEAR/?=
 =?us-ascii?Q?vbY56v0zFQj3IViwfYy/joWOOl8uHj7Q4S9GORSsu9Bd6A5/qmd/hJHfriW1?=
 =?us-ascii?Q?PVeB/8up3UJLSl4Q+rUYJpMovOsq/LSSAZpPqptY?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3359dfcb-cf40-493e-f152-08dbcd8f3565
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 14:58:36.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xeqq4lyfVpQCKN7CvLTSbyIHtmMJ8rJTSp/2Oky/OtsASiYCidsQU1m619yo7TaAqR3U7KnZMUqSI586maKTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 14:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189153

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
index 0000000000..6cc81d3241
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
+Upstream-Status: Backport [8d9953dd8d589e9b740307976cbe474e0ce292a0]
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
2.42.0


