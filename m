Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AB0C001E0
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 09:22:49 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.78])
 by mx.groups.io with SMTP id smtpd.web10.7252.1690363361353950502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 02:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=pY8cZ2BK;
 spf=pass (domain: welotec.com, ip: 40.107.104.78, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0LEuk0d4/3P3nYVF9bAJNrFbWK/8eUmXIZ52Wq2p1yUxbMnyY3tm8k/GbJWce8r93OFpAGF29QkG97udmG+sjqNTp4z2NjlelDUyWyOqcV36gAr4fvJiVjirLpcMDePuV428svN503pRYP3MIFr3oLzU9WiQVJNPdExlSqx6ydIGZ+fE6UnB1RKUjrdZdAtDTMwuUgctPHL1kC5kswcnXlqoItMs/bXwfIr9RtwkbO9BznBpsaRhguOqmfOGatrP1ZjYC2PuJqH/0njwKmY9zpTI2UqImrsGHIVkytwpHsKsWWga3/mvCN0UA5CqyrYlfC/yWgNojXoHh2sWl1HYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1ELEkI4lRr+4NzUwCldLKlWWXKOseSTxadJe7T0RkY=;
 b=hKIFQ5afSWTmsGkL4zJyFSeI1S4WdYP8MR2YhXq/Vh9hPOC0Qwy/s415LGOlX70GU36nuHTkECTakeX0oDS50OSTqR2Kep8IHq0ScwIhOcF8IOHMYJ/ZLsldsN78FDeY2+6tb5yaAqf6P2tACKGSPw0IpPTADKNih5ZporpyCNTh85YiUJslRBzEdFtyxczsrmfxFK4TC93SpXHXuwgZouFPN++yiohdeCeaQVqNfGoUqDY9r23mD6UZ51g+1CEO0K7WA8yWeVd1hXBHXrxs0Iss/uB/wBfE7JTL0/9zX6sTN4wYpYIEQZzVDnBt82jkzAJFKJewYayf5xvJlDJ24A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1ELEkI4lRr+4NzUwCldLKlWWXKOseSTxadJe7T0RkY=;
 b=pY8cZ2BKKc/m/oSMD4f5TMNZOyQO0u/BoOCf2EjOADgCy/w2GleXMfRmHxyQYeoiAX1bJAAOZRS5nwBzEwfVCrT9DF/C0+irjy03VN6OTPlnJcr7w61OJ5GYGaApQeFtf47o2O+/ASvWdtRcQrv6N8MInaR/4plPnkTeiUt5qfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 09:22:38 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:22:38 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v11][master-next 3/5] opkg-utils: add acl and xattr support
Date: Wed, 26 Jul 2023 11:22:26 +0200
Message-ID: <20230726092228.1005306-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726092228.1005306-1-p.lobacz@welotec.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: feb3a8d8-71c3-4907-3a4d-08db8db9dad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c3eOf2IdlU8BNOYlOgdWO8zEAqd1vEwP305vobHRXSIWg7BrJHWBTT1yrNsprhqDMk6iTpE5NYdoeVUCZpoD9wqUhTsmpaSy1Dq2J1XBzB7+0sRmcsKMA4JEmtxDnPcFGKDsk/CBe+Qtx+rtPMIcay1k5CquiAoKEjyDEUaB6T0ESF4NcTquNKziIXU4TIkNDb3YqXYxbUO+ODx8/J1/fdOQJoGxVAJynNQfYeNS2N89l4RJPsucNCe8+7rAk2aEKEaifVWpbbkc3cpnWVNa+Z+h4CwK5wU2RnmmypqpE1CNZop/3tCnEtSl6T7WDLT1G8Z3dEk5BM4x8s1X8/CxjddoVyRMSbLj7kvarmA0HGqseoinH7Dlf4Q5GBPzCP9IfcaoLv0XNs92ZWx/3+YErC0xjGIo3lfEJ8rAXq9MRL8noGofEzlf9omOry6zqMfia3sq0is0OVWdJGx6QYBVB9NMDZKlSU7AE2eGRYoAfTBM5BbTDvfTLkYnc7hfTGF0ZgBkDAHGKLlUyF2KIX5/hkn/y/Z602khP4+U/dUCpD3hLs/mvHgMvRZEuh9syjNcaQb2jTbij/+uZMZfckHmXVYNdS1dNphhrwruvN7AGC0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(396003)(136003)(346002)(376002)(366004)(451199021)(316002)(41300700001)(66476007)(66946007)(66556008)(6916009)(5660300002)(8936002)(4326008)(8676002)(2906002)(478600001)(36756003)(6486002)(966005)(52116002)(6512007)(6666004)(86362001)(107886003)(6506007)(1076003)(26005)(186003)(66574015)(38350700002)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?owANFPHAcUW4EGL6oqSlF/1k9Y3/GdlZWD9cIehzVmPFx2o3QZR/av3Pt9sS?=
 =?us-ascii?Q?ZYG76RBMNNLPgmDu9VOJP3h2ju9BeMo1ly65bP7AO8Gz6r8c4GMD+s5Fvwz+?=
 =?us-ascii?Q?Voi34LxpBDmXCdaszMZjiLPJBhiwIdBoTeqMai+HkkSP1miZdlUIKY6kf8m3?=
 =?us-ascii?Q?mL2y07WlVpzTTX3DgpwofQbUNsBAdsF6O9iXknnZljJUsQWtW0FbqGOvIQmY?=
 =?us-ascii?Q?4VVFncqi5QVpNdzlqACIv9PsSJ/ijpNK/pyHtlUau2b3a1RP9pitD84QFAml?=
 =?us-ascii?Q?4hdWgf800K0wqjRbefO60CCrE/8pQptAQausc8zKP3a+vo7/tBB4UFZEIUHA?=
 =?us-ascii?Q?vpO8IkDWmochpTrSk+HgyyOEK5oQSk++iGPc3+TQsscvlVhkaHJXuJ2vH93N?=
 =?us-ascii?Q?JNA+ZFpkUzJx5mz3szZo4ypK1xEAjz7LXR+aSj555xbcPD24NNAja5YRd7/e?=
 =?us-ascii?Q?mWs0Op2Q030xFGgaPMcwPsHT9QCHduOv+Ken8oF/Fj7CwPER9Gzgxc8C4nSq?=
 =?us-ascii?Q?QfLUG7EHlBgIQCN8XhNgj9OEA+EJF9eoKB/TAPDFI1HxLiOgYLFww4TJeZjK?=
 =?us-ascii?Q?or95u4sLQukvOKVEduHYpN9yy378JGH2hVy3Sj+S38b4sOxI/7h6X1rS35mS?=
 =?us-ascii?Q?qUR4EublwDDO728E+zXo5Ua23wepFVG42sw38ydRNBIYlPxlP1M6xs+Zw76C?=
 =?us-ascii?Q?9WWBW23BuuEr76UmF1GAr3ltxKM+aVH21nGOZKJi4IcrzMOtr2uIOPlep5F+?=
 =?us-ascii?Q?/a1vz5SjZi4GBf75TRCpal1fBCKGGAc4RfyU0u6c1TE7BDtcfR1DKMwdOmKI?=
 =?us-ascii?Q?VQljqInnOsD6HAGzxcOkyeb2Q7qO9mvpMH8iG7ZS1WhdFwDQZXuvTdXcvPB7?=
 =?us-ascii?Q?eSiLgxTvN4u2WMshrmQDeQKk7s6e1c4Ga71d9R09rw6qRjQnLDbu0eDg7ytb?=
 =?us-ascii?Q?qjePUOFR3/Xpudt+eo6k5GZ0o1RmDZ2wW5pO+dg2JlO4nxrN4WBdv59vCYFy?=
 =?us-ascii?Q?JBW1mR7KLfbk5DA9kKGzLf+a14lj3n7LKqS16iZwwRNbtsdfkJGVqYcfuqb+?=
 =?us-ascii?Q?fJI5bVdBaXSaiVIZbGaBdh3xt8R6G7Be8bOM3madR22kOZGWn/6mo+gL43J0?=
 =?us-ascii?Q?ikltxlYaix2zuPLZ8aTg2pn4Ebys5g5YgT5BdW6co+0yCS126CL3k5+ENSqD?=
 =?us-ascii?Q?yn3eLosawxe4ZDEsHZmi4mI8wAu7Lrv5HQXWWnL0f+9qKhgcPIGxTm0tDeHI?=
 =?us-ascii?Q?R6oUZuKUMKh7NV5OWnkGifzz1gowvjfuDjWXIXAbu78Q7RnwbLRql3crFPOe?=
 =?us-ascii?Q?aUv3jVO0wIz1kku94TMLyLDJDBcf5FFIDdYPdAgrbkwOFZVZY0dPOWcmvewK?=
 =?us-ascii?Q?//E0zcjJeJ/4a31OLPz9qkznNVRZIk3ddV/UxgBT52QHVnp74v3icdIIxCMM?=
 =?us-ascii?Q?FFsj5jDoGSY58xoaNY9JL87sLpmrRPR0kWe5gcnRZjA5ORkG3LHt+Y4qSYK6?=
 =?us-ascii?Q?2BBn0j8hvGBSEt/pKspeKOBVkReQAoh/UaZyXK5zzIi04WT/nIbKkGd06mcn?=
 =?us-ascii?Q?d4FmfmMwB7eWiZiMmw9IhCpMJEEHQZm2CJkG9RXS?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb3a8d8-71c3-4907-3a4d-08db8db9dad4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 09:22:38.4177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X927rG4vDRVqbJJql3bqQIWd9ZtZziL9cDU+Soe8+R07lbUg9KJe5J64NhfMeWC4BAoRn+7dDVMjn/+kBXAJug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 09:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184872

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
index 0000000000..7e88c1754c
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-acls-=
and-xattrs-support.patch
@@ -0,0 +1,164 @@
+From 03931040018a0e3cc34e4c93a625f3671ff1a980 Mon Sep 17 00:00:00 2001
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
+index a9e45d4..47ac1a8 100755
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


