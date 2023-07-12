Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230D0C0015E
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 11:20:32 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.50])
 by mx.groups.io with SMTP id smtpd.web10.4837.1689160823457464085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 04:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=vJw/k+Qn;
 spf=pass (domain: welotec.com, ip: 40.107.6.50, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoOZu9RUqbcPxHoznLVxXJGpuoeAtYCrLnwAxO42KL5ADSskrVyeNpXnbuDTo2GAUV1XuxOkNXse0E8xGCvxJZdn2ctnLKzsXkvrNAyPNLMLmRsZBZvImm3mr3P3Yq34ZeOhEWFC8oSf1C1RUQroY2pzuSZHyr9lctkaqM5/nUNW0lVV9GgG7WwgfqIScjIYkrrogFD4/JyO3Stk7xKc7J7tF78AClAZMSgC73nWpEuDuhlLtkQFHl0D7/dIIADG82955XLeJnc4UOMzfecOtl3B9IrdODSrGXZn+jvKkwehZnaZJeSo5FznxrGNZgQkTzJwORRDRJkU+SUbkEku7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Us2GkAfCt4cIV3IPRrSaUrubdV8t1m8E18N7kxtqDxA=;
 b=jwkgSxYFv2BWXghxkSXVFFjcna4l+xmV69Hhl5YVI/HM652JBWtWsqnxb1VzcIKz2ziTE7IcVrM6dSE1dBj26iYmnZzFwjwcc+XZmcAVU018kN7ynHZQgv+VHKwy4PPSEeRk6k713ale9hQ0DnWQsM9vD9k71j826mZ/gpD3NPdTqVG6rv1EqCQcIpphDu+39/PvrUcgRfR5tz4pNqxtzr2qzNgx1rqq2LyqD1wvuhsqRbQKicEsh9sG9k7R4wIXGcVV5ntIVcfguWwx9KTG/rDGg+7QM5pyvO16sFBGM78B0JocqZ1t0uLkqjG4HLbWVl8sQHqYcx8EvVTpniEWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Us2GkAfCt4cIV3IPRrSaUrubdV8t1m8E18N7kxtqDxA=;
 b=vJw/k+Qnt2VF83XaitK3jaPdimMTb33wvvaNNYxCP1fvIzJ2YTGRN2dtvfi4C9xVItYEFIw0TSLYHIADD3aDk/0Sw2byKheKShF4ysc08vGbVvUoUYgT/Mie7ksqaNslfeXvhOmVeXWHGp55q30JjQakVY8gIIK9wxAJJYxmZGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 12 Jul
 2023 11:20:20 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 11:20:20 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v3 4/5] opkg-utils: add acl and xattr support
Date: Wed, 12 Jul 2023 13:20:06 +0200
Message-ID: <20230712112007.705867-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712112007.705867-1-p.lobacz@welotec.com>
References: <20230712112007.705867-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::8) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a6f474-21ba-44c6-115c-08db82c9fa8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bf4ERoGAhp194ncmDAMXsf3SJwMat/vlwMF/WKE0g2g0Tjuq1jJwDngr/w6yQfQftr8HCLChyeWHUQdXKzoIsu+1BYnd4+RSHGQtbp/pUKy0s2KrQdAXiNLAFWUX6s9ZVd4eXplxLlHHH23zygx1Y0mMNtFa5OG+BVy/fWfiHIy8tAvF0QA9x5Zm5OLkvM5jF6rmqiY18WnbgiRdRymHAUXqpJhaLC7dEoazNMFa+hNJ/U90KD2RlRmkFyUaNJtkMEI8Tu5By6K9hLcuWqqmbqxJYcJVpZv+gS5KPoQv3bgtcvhaQ23EXkLnTEYJTkz68biCm9jPbyeJBCzlIcY0FY75l+8fRt5bCAUi2nOoFWKbAK0ffxZuFXEYshb6YmJ4mGPDz/WHZBn3mYqmvWR0ufNssInjID/pOtzrtHiEnZfXavy2shaH78Yzv0rB8by1hS8rgO6LGffEaVs8KoUyUvJvP0I9VQzBa5vCbjGW9AbJukqjiyqPhi9ypfmmkG5MWX0zr2MbHwktBQvtCCxLEGE3Ih1cIBT1k0HxTUsMY9lCFZ1IBuaBk3WpSn1tCp57s4LtCr9SILr0HF0lpRAWm/wzwT/7qz89F2H7SpJ3DvI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39840400004)(376002)(366004)(451199021)(107886003)(316002)(41300700001)(52116002)(6512007)(6486002)(83380400001)(66574015)(186003)(26005)(2616005)(6506007)(1076003)(38350700002)(478600001)(6666004)(6916009)(38100700002)(66556008)(4326008)(66476007)(66946007)(36756003)(8936002)(8676002)(5660300002)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oihB2crlORxrTXeTX++OarTpWnpK0aiRP7/a2qAYYEUfRs72lo+yyMOa8Wax?=
 =?us-ascii?Q?WljH21L9EJthcqmNPtmXtFsJHAzt6zTRsCEbPxy8wFZv9emz+8yftISqn4I4?=
 =?us-ascii?Q?1vu4KFj+JbS3w/LOblSnKHPjODd4/RmFF7Xvn1/rgkB5+jxKPdRcEmI0GdwV?=
 =?us-ascii?Q?2u2SrmnZ7Dmlm+MH4RQ04EqAGvNc4/mEaP3Ad2wLEGo3aKsMs4OSSEiTmnkD?=
 =?us-ascii?Q?E9wG+zt2JUlztwB4vWMjlZHB2xT/6zIsTt9xwfx7KJ2+c+wQrFDQmWOk0qLa?=
 =?us-ascii?Q?sWl0+yDlgZlecAdQgPdQOLTdaDLs5roOh4wOl+GtMumHc5cDWmOIwgOvhapN?=
 =?us-ascii?Q?d5bD/KxMdlYBV7izJDLJrvlUJ+9OpLAJIjos7snuj1oMdT8Yt4Qw6XNs/7Jg?=
 =?us-ascii?Q?GxFfVgZqYq2Q4+TBy4db2Qxi87qsmKipPnvb9CAYOYVE+e96ZtnAJYblhfrp?=
 =?us-ascii?Q?fvfyKXzVwYzoXAUAUlT3QDrEsGd5S6eyWDh5mZhq8U+YeOIa+tF3kNkEJhAX?=
 =?us-ascii?Q?DKIs2qKg67otCUIMv4F3rO2cjxOrNQqTUfotgIDtWb2F+1BO1iPXey+kYHzV?=
 =?us-ascii?Q?8aDWbl1DGrkH9X52bS6o6oLodgjbKiwO86tR4Ew3Y5Tu6s717c2Lq4YWiEjp?=
 =?us-ascii?Q?NjtKdOfRFAFZcQYmVdLiZQgtMl9MVHGcH3xDxy9yVhBRMygWEpJCTYUO5HDd?=
 =?us-ascii?Q?0sQP1bdLxfVoAkqeeeJwti3FYoeuSwAvCGZJI6TunRkbLpuvdOGSLxO90H0I?=
 =?us-ascii?Q?Jch5amqleEi/ZyITuBgVu4UZFbEcD+UZGkS00+Tx3SSpK77ctU81LpNL4726?=
 =?us-ascii?Q?7haWrcTI2rXjSlnm3T5dllOAXwlm1kHSAk7RWyXUfG2LfjtkqkBy6NYFChOU?=
 =?us-ascii?Q?0HM5c/7wzq4bo9vtu+g9RvyLGyI3yp0WTzs+9edU31INijgw1Vr0BBTLMfAN?=
 =?us-ascii?Q?FeFgfEnAiUiDk+SQro8wqC+gluUXTscmipH+xnsUJb0+KmJovZmmSvhnzt70?=
 =?us-ascii?Q?g0JoY5+yt9p6gAEmrudRplLpH3mOfsQVJ348NDryEHxMTDJe/g6ohkPex8L9?=
 =?us-ascii?Q?zAQT2oZe7Z1YzvLgjk3ydNI+YRVw4F6YFZotq8VtOPITTpa04LM4TsQ+c9SQ?=
 =?us-ascii?Q?SCtYDqHIj9Jq8FyoMny0b30XIEN/aa1/r7J8BW9jVkxU4VHGAZvEBOit3iZy?=
 =?us-ascii?Q?/MELRYEhk+Eqbu1JacCtWKSlmE4SEoU35XvO4wB8cNlOPh+XlUn8Pv/hrs5F?=
 =?us-ascii?Q?smf/cYvWjaBGlnA0gx9BVL6/RnEXJXV7SY/87bNf2ygjol73OW9EyRVMFmVH?=
 =?us-ascii?Q?IhRumJZTqPDSHvevbv/+R2TgdVAaP3BMRGMhyXFGQ//KfRMgrs0XLnqmkWX8?=
 =?us-ascii?Q?Snfg2pL2FlXNuHXR6VbmckEbIYCUi+aimiHRTHDk4dwIbq3lLUxPUuZWPFq8?=
 =?us-ascii?Q?7n6RpWBkCdHWjtosW6/0+MiKWOzqDkzncebPmZkjt6H9Z0NysRNJqXJ4/DHg?=
 =?us-ascii?Q?NKUDh1YEEE0jsgqA4ElJR7p1Olm9ifWo8KtbuLnlQEquT5UV9VlaMif6MCH5?=
 =?us-ascii?Q?EPr/v5/EMT/aun+IDTWJPBMjSAaS/JkfhYMbk6s4?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a6f474-21ba-44c6-115c-08db82c9fa8b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 11:20:20.8198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qH3HYcgy3ryPDlgAsYIHLNC3fnx5jlYSA5QdMudrFon5OhO0+pJhd40jv9RfjxFHMUlNsid3TddrRedeqUXzjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184180

Add support for tar archives created with --acls and/or --xattrs options,
PAX header format.

GNU tar and libarchive already supports ACLs and extended attributes.
We can now add this support as well to opkg-build script in order to use
fsetattr or setcap inside do_install command and end up with a file in
an image with the relevant ACLs and xattrs.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...kg-build-Add-acls-and-xattrs-support.patch | 75 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.5.0.bb            |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-b=
uild-Add-acls-and-xattrs-support.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Ad=
d-acls-and-xattrs-support.patch b/meta/recipes-devtools/opkg-utils/opkg-uti=
ls/0002-opkg-build-Add-acls-and-xattrs-support.patch
new file mode 100644
index 0000000000..2fbb8b3239
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-acls-=
and-xattrs-support.patch
@@ -0,0 +1,75 @@
+From dc589e683c7e8f50993787ea304508cc044fa0de Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
+Date: Wed, 5 Jul 2023 10:31:13 +0200
+Subject: [PATCH] opkg-build: Add acl and xattr support
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


