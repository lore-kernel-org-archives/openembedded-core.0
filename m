Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7967C001E0
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 12:07:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web10.5650.1689941259106516710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 05:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=GliRsIxB;
 spf=pass (domain: welotec.com, ip: 40.107.20.42, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNbBdKMNvtb0HQRXLCrR0gNebPRFwj/xXRQQhUO5cmtkKJyI5T+egdVL0e/tp1AMviWccGaRLkkz8OmTVvXnFeu7N4qelk9hXfEZVgNG15dfhsGf3PY/lNX2jEMU48ThREmaBatS1j6wgUjWGqLdBP16ak8vPHKj1b7iZD4JH5/dPV/AFGT1oslNxhJZiqn7pnVsLFFofHtjVQlF0xLP2CwG5LoPXxXd7LZvPoYfK8gzfMPGJ5BVO3xpDkH3zvvgTd1dIQPRj8dYngFF3xW7PAUZKgvfE+lcVdYI13bUKaLa1tQzU1y+Jwyh/Hcn0ahwHTOBJWhZ3eRNB/PeHiyWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCaa/k/N6lw/eXdo4K/nRDXSEUs4PQQMjJVTNtyb7GY=;
 b=WkPRNOBhgmVt2yaPx5NZ9BBdDAymRnjS5baE6ZFZcwXo8tdrt0LwbRwEkGjZkEaJx/5CX3h9HE+nIZJIqzzQih2e+P6UwLHoacbbiLECcvU0cZ4B6+K/qMQkPeOIZGbyjHpmqPdRBSRQOI95zGnRxsxrgw+sYYWa69s97KkvdbM8RfjG4y1o+EUc/W/uYYOkcQZoINCXi2QXnNtsZo6uJ3+Fh/wxAaiee+ESJc4iUjT5NGcisccykEWhtGApInB51QyNxklzksnvVlS6KP16a+ozgpSEZ6J0d60tYqeEzY6jaoePPBxAPc5O29dcbjVqmkEjw/EdfWMK9WsTDrvgQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCaa/k/N6lw/eXdo4K/nRDXSEUs4PQQMjJVTNtyb7GY=;
 b=GliRsIxBQLlaeWHniOwAgil+fDKbsbnZyIL3kYiH7TA+KQVOC5mgLqkaR7yPiwGHuf6xMyZQ+2MKuAf4RX9i55u9Rg7ESYLYCB4niQgGjXv7azEIIX5TCCVCElLU67xIR/cseU84f+7wDkrgVku5WCEu22qFFdY7+XBZI8SRW7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 12:07:36 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 12:07:36 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v7][master-next 3/5] opkg-utils: add acl and xattr support
Date: Fri, 21 Jul 2023 14:07:21 +0200
Message-ID: <20230721120723.4006443-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721120723.4006443-1-p.lobacz@welotec.com>
References: <20230721120723.4006443-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f3c3201-94f4-4003-6899-08db89e31258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eDnDbNo6LSgxNGubfFj0ok8jqAqWiCVPXcpUM7T0DQPU4AOmsy9aJKpN97Np1fCPvQSA0v1yHhAEQNp1/bau/DnKxYFNoeMuI0N58KlQaIiNuakBsoX4x7rHg9HXuJPhD65G4iGtfVQrurLDDPbXT/buuBgE0bb69IbNG7NO24V1JZ9UJhpZ7ri8g1CEwuo57AFSuHENoTaZyBpeFq5sJtd00WybAyYbhhnOXRKrcIrRSBxIRELdnrJe5329FH+xye/YzpRKi62ig0fo4RwHNZ0pWDbNroSwNQPYcALp/CpYHfz8c84kbRUf1dp7vf0szDmLcjEJd3V7UWmhrqPQ/8xWWWypRLkCllciW6ewEE0BGbRmV67Q0rPvkab7mYjGuDT4DDporKe4caYLV6bMZkoaRCowttivJYAy59H+8+EpmOmuPl1C1lLgwaw9LCtM2C3ZHAreUt4er2Aa2HU1kI/JjxkKTGETrKMZ+KhrUtE98wxY5D/C3CI6tp5rtgFMJuXHjWwX4S4PijoJ6Z+4KbACtCs35pjpCNrEjoXRXoFc1HYMwIu3cOjUtOXpuO9/F3DwmjDFfn6tIrllhBcMG+I3cbQ+CutzcE1C8cyDdzs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(376002)(39840400004)(451199021)(41300700001)(1076003)(6506007)(26005)(186003)(107886003)(478600001)(8676002)(6916009)(66556008)(316002)(66946007)(66476007)(4326008)(8936002)(5660300002)(6486002)(966005)(6666004)(6512007)(52116002)(2616005)(66574015)(2906002)(83380400001)(38350700002)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bBpH0DcTJAjHNGB7OQ1Bkgtuehd9V9mxc1uo+Nrb/XUxc+Rw8bCQr8uFywNz?=
 =?us-ascii?Q?/RoypqRSuf6j9yXFp9ywXuHcuXWvHJx4OMbpmhqSOmncc0gJwaIe80Ly8C+0?=
 =?us-ascii?Q?SHzFvP3F6/1SEX7znDqs0OT+QAvsZvETWcb+5DgMCUldCEu5OB9Y2aDeEmYa?=
 =?us-ascii?Q?greD60ljpkWkUUSOzIhI0PgZaZpUI/NPJS09ylSuS6lM9aVjoMioqQKHs5ar?=
 =?us-ascii?Q?xd0eJygQm9MvEs11K+PVYQrl0E5BsV/S/y6zZD0litvsgtuB0RA+j2gHqdsO?=
 =?us-ascii?Q?OxroAjj20+xNvR19XpTrq0A49PlJPeDMI3b0kpZNu4pZJmul/+E5iDG03SgP?=
 =?us-ascii?Q?veNWb+wR0U/Wr575l09Fcc1TenBd5zVArSpU4aO3Apk3XmXFNNVooW7be1X8?=
 =?us-ascii?Q?rFXd/MeoDwh23WsNqIgMorYNssPUC191mNhTOjsloH+tTn8fRdQxrT42eoeU?=
 =?us-ascii?Q?AqmwOZ8oOme3B8rVucv9Cd9bXIARlJrT+11BxAzfRdfSp5MNVUaVmFsSmTRi?=
 =?us-ascii?Q?bvoUy9H0oAVX4UjsK6oX+9lwvAubr++SviUtBEXnFXt14Dn/PZSOqfTgnPJt?=
 =?us-ascii?Q?XuwLeceAy2NlMG02Qm3vHkj5gZfpl+L3zO3r5XaVYE+/jviLNBuzV3ICnhFg?=
 =?us-ascii?Q?SSMWfy5KYsV2aA6N40qWtJr7xMbTGUxMNxMJXVpaULVUcfAm7tVqrg/XSPFX?=
 =?us-ascii?Q?tvj6RFxQa0E7BTqPxPgrZwonfQmCuZQoMLn1Ud9KKWiJf2Mp6f9Nhp0tNwDC?=
 =?us-ascii?Q?7Pxcl3lVg5RLfrP1Sh8KMTYeKu1IltIDu95kuuuS9L3N51FM6/Rnq8nAjhm4?=
 =?us-ascii?Q?27zeMbIPfKj29uoEIuzbZ/us2y/h8O8zkrstOfNIyy4u00OzdYqcxCKpAwBI?=
 =?us-ascii?Q?JumRtPSXAydf0j5MYaG3CbHwtoabtu/KpsSTQqURUq0Q64ZzCguxbbLfcdzK?=
 =?us-ascii?Q?PQ5X+iwQhdaj37TKnIDKOaiLvDuN5ULtplf4p60H/suHNKK0Y7qkyza14ZEa?=
 =?us-ascii?Q?R8a6+WE0XQotHSThBx60Fq8tedH722RkxeO+epSoLDW3/H6U/vcQl8l+saCh?=
 =?us-ascii?Q?o0Kab7DtLTdZpw5blVkPqAmeBWcJQgl/KAG8UtcJZ4HVuydweQ3vq9E2tILI?=
 =?us-ascii?Q?PK04HFdMj+YSRq8dvb0FUrHpWF/fCneOKdjZKoGrk9SUsCPGcP9rXHP/wLDg?=
 =?us-ascii?Q?9/hsqslgLG6SO7Bw9y+oLm7wpF22bSBXBA6fQJd5yub3xew/LSqbpRlK4Ji+?=
 =?us-ascii?Q?HDqaaM0CntUzp6ukyXoTv5PoM2psPF8nrHThX0alLOpCty+qGzYKmNHr5tkT?=
 =?us-ascii?Q?xqIF8HDMypxtaKzw5oceGiuoTrASCb9BpAJeJiKbxx0xRvab33gV3wMGQC/6?=
 =?us-ascii?Q?/d7vMquCgVDlQJFxDeQ/3Vfgs3/ymP528dzjuqbjrhSocoxqvdE8CKhpW/8A?=
 =?us-ascii?Q?DGJf3/1t6CGwAq0w4lYjn4Yu1BfBbhPd59kppUEfzypXTNCJR7TmXEzhAQcf?=
 =?us-ascii?Q?Apz9m4YRZbhlxM2MmI3CG48uBT1vDi0r+i+CwtNKKQiAq/A3ktWuR4uHlH1U?=
 =?us-ascii?Q?+HjmdRuRa9N1akOEB4B5kniqPQ27fbEiWCs0aqhR?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3c3201-94f4-4003-6899-08db89e31258
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 12:07:36.2708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhRUlMOil6rZBGPGprJJDhG3ECgXDdScsxvUrEnUlnwvuF1nB8Gtlzvrgx9ehgjAKV9f0HxmSqkcB/7ymtRy7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 12:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184690

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


