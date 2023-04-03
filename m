Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B33C77B6F
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 12:24:54 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.48])
 by mx.groups.io with SMTP id smtpd.web10.68546.1680524691649366831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 05:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=tiKCqVAC;
 spf=pass (domain: welotec.com, ip: 40.107.20.48, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHEnA2nUbB7FH1PyI8NVQAorOKt3heUrUFi7A4SC4Xum3AB15xUDhfGkOQ3S3BrYEBUh7MQ8VzJKBCOUZ0yG6bPD6s6TIpc28FkF7ohj+/VJhP0nsKqT5YxnIXG1G8g50RCaNiRN3xFjCInwgMiKmkPVu4reHCjUPmFcmomg5h+t0WuBiurOx3vdDRl2nRuZCT2WkhIzlXYzIvaO711tOkiyPpB5c2czHEwuOtBsYh1/YUyTPvL08yhZEbJrIgIJijyHNQHzWSSdW8hMrd0dQL+qzBB4D3YYGhIRROfJ4CTxTOflWnuIPVFXF7kejyY9dnQz956/5j8Mopk7QBuzgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yx4c6wmbNl48nU+V0ZxCqwpZfb2+Aga7pI+513PbFao=;
 b=kGZilHUAGeglhg41JZhhu0ORWkqfN8CWk9hM/22GrfQKW9feRpqWdZLuNLnlCxQqonHX/o+SDoVFvHrY8R3B0avlVlQwSdFJe+Qng7qreQoJTetY/8QkQAsVjGfWqQCHNA5VixJBk56qTGbVg/kMBYTVTTV+y9xtBTlSnzSvGaU6sBL5j167SzMBOAKuIYH4M+t7fA1KdOP0hWLR6+dH1eAUIkJansXUyNJi507nZG5erVYAX/t8CgQkfxnN5NCndPgLQ99hsZXeIRMMxO4xF5hcbUFwKjrcfdM7UFLelqFxZdOjAyd2Ksap3/QyVz4PZtUm+VanQLg68PaOx+3FhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yx4c6wmbNl48nU+V0ZxCqwpZfb2+Aga7pI+513PbFao=;
 b=tiKCqVACSAC3zyLYhJVVknLrkaT3AUXoumZcAMoGPXHakOm2yUarRJHB6fasVLSuU0XILxbjqNWmNdCrRJhPQPuw1HGaHJd5YhPrja5i2vhYHzDqecKwqQZ+YvaJIZJ3qhwihM92DbjKM2AfsxDITyQbJtU3oStEEFrPf7zceKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DU2PR04MB8727.eurprd04.prod.outlook.com (2603:10a6:10:2de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 12:24:47 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c%5]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 12:24:47 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-core][kirkstone][PATCH v2 4/4] opkg-build: support ACLs and extended attributes
Date: Mon,  3 Apr 2023 14:24:09 +0200
Message-ID: <20230403122409.3067997-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403122409.3067997-1-p.lobacz@welotec.com>
References: <20230403122409.3067997-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DU2PR04MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 4860e1bc-2e33-471b-50b4-08db343e69c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0sSqu1onu7hnvQfm0SEj8wpNgO1q7ioCoWqt8Y5n+MwbFsr+ShNQv5i8TqjZ3TVfIaRmYsflNLzTBwKgowSAu9aibN1pUaUJuBrD5VF2ffKsDG9IEE0paSJ8GYN9A41teaZ9YgneoTeaSrm19j4zgL10GxuO1n4m8GycLiEN1VA+NTvqHNrnqo3p95YKvFZ2ZnjgJIqQi+bGBcu17vZMQIC97VCey1tCHSsoolaCGQyjOWld4nl8Oa+bCUuKUQhtTHzX/jo8Ve9elKqgJu9k5NYc3L/2OOVSuow1AN8utWrOng8GWzZCnlAtxR3d4f7bveWBDW3zEMqf6NM73osTlMJl+s00Ivb9vbp/IjKxgP2J6uwnDgjjO4nUD6N+SPIYBo3n6/Rr7LgMcQpLXY9BJ3MpQYhmXNklqfHaFDEq5YSkulOsc2ehcp+DEWJkcTDYmFB/VIdd7qfe/w6dNqOVltjYMwrY+C5bxWxQ7XJlyIZ+0+EGKMFDS/6a/qpcicjAFNAEzTXoQ5xNCXBWRbw9449WaCjgm/QAFAAVuDYS9Mvnp0Pucexu1DgG7R+XW7vObiGJVlirt07RiAS6fdI8u79gozmNsi2lxtVTTMdkqNe4YIw2vz3H5113h1BVVaBO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(346002)(376002)(396003)(136003)(366004)(451199021)(83380400001)(4326008)(6916009)(8676002)(66946007)(66556008)(86362001)(66574015)(66476007)(2906002)(41300700001)(316002)(478600001)(38100700002)(36756003)(52116002)(38350700002)(6486002)(8936002)(2616005)(5660300002)(6512007)(186003)(6666004)(107886003)(26005)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MCYeifMyVghEa3/sSgODWEL91C53EKHeYWX6GBYJLe2+pgeKq/yGP4XQa/tC?=
 =?us-ascii?Q?VTPqTRQ0lvYI7NVM7WJHjr/CJPfFpXZ3E7BOr4NCT6fx1v4tsEWqRpn4GsLu?=
 =?us-ascii?Q?7zGaQiexZnVVTvaxX9ziSiX1LIKWTNMNDL5euScXYTGrcuIh4oLRE+FK7C0o?=
 =?us-ascii?Q?KQYqnXpGPD3AkL73nrnFtW6gzgAq8vW8ebFHjhpxLm2vt93bE/i1Lp2lLC3Z?=
 =?us-ascii?Q?Yp7Rm8z6yWlSOEaIMzHCQya3eLa8llBTu3P8mShOG53FYuO38TZcNorA1NaV?=
 =?us-ascii?Q?FQd1PS1hDWtNrfAYGrnelhKZ4NBHZ0KIAovEWjSjBtjPYK29hApbQ8OMFUFU?=
 =?us-ascii?Q?sGgD5+LJTWZU3OuRNRhjvgnAdj8S6v0T9my3418POjbrSBPYK7iaUsn4/2oN?=
 =?us-ascii?Q?nF52Jeq1r0fmE4wkMswAIPVaf1qENyll4ndML9+gDtTpZ/UdxEQ+sN4CS+BJ?=
 =?us-ascii?Q?vrt9Lb2Y2TqOJuWqfr0yZKfZGP+mhO171jnNZ+Xj659fgzjO5VO+rmT7EbOz?=
 =?us-ascii?Q?h0AEhnPxdL3zL/RwP+TG1hwwRAgvyskdOIwLIpl7fGIGg2NqEu9KEzJ1H0Gc?=
 =?us-ascii?Q?ujmX8sLUBpQMCCxo9Sx8bQyEnol6zL/BOpkPd/8Gu9Q8VwwRotl5fCzepWHo?=
 =?us-ascii?Q?0CBW5+crzFDOLy23alqLUNsVkwF8XJMYZbuUWoSHC+mqdmg+91UR7EE1t7nD?=
 =?us-ascii?Q?xlJYDsnpFpBZK6Vk1Msx26XGoy/O4vlgSc3/x8yyFaaqCn3SzUmKmvspy4DJ?=
 =?us-ascii?Q?CYQNolKDlIHVkcN4K1CmZxcvPjwnqyZpSpx3U00iRp1upbXKeAhonYY+Irdj?=
 =?us-ascii?Q?+EBIdqQpPwSTykw2BNc5zcuqRjXFwCISiusycNu/W6Ee3EhK5AWzmPhFPckU?=
 =?us-ascii?Q?FUO/WjmBtAJ0Q+du/EvTMZj/xnDy7+XesGnHiEFcsHKvRATABPZgn1hIuoM8?=
 =?us-ascii?Q?Hc5qFzqECBZF/5RvGH+okzftQJTn6qzGY3nJZIdsKyCvZq8laZZwfGkB655a?=
 =?us-ascii?Q?l4vSe/DWY/nj5QNXhPnkRIcwmMjL6TgKPieIeQRg8IIqcEtRMhui7hnsyeWK?=
 =?us-ascii?Q?0sgov2yBRVIi4Q1XShcl8Nrb/2DvdGhQ+OUH9b4dg+RAEfSpgFmeJA+4X0kQ?=
 =?us-ascii?Q?Xh4ZHV5S+lkYHhV+9hX54Tqu16MgtV8YjxfJGf2t/NFqLwyjOTKkzWOSQLzl?=
 =?us-ascii?Q?X3Ve6oiqiVaOP1dopzesKnwhqeYFjrLUZ2+4tpD9cnYrak0Iv2cdI33sQ53J?=
 =?us-ascii?Q?ER3hkjt4+rAPLUPeOC0TyOZ318E1RLwmKVfQWhwrlTmT76CePKWL3Jq4oSxh?=
 =?us-ascii?Q?Lr+cawFS2umv9TKTWyo5SGaJfk3eQ8ExzyPAuYP1AtZahdez0MZKe45tNvcJ?=
 =?us-ascii?Q?q9Q01pOH4oIi4VNP1TOlU1qiJAAaxa+GxJ5JvSXMeNWC8IeMITW3MCxr6HbZ?=
 =?us-ascii?Q?0DqGvnb7ioQBBdb5gBroBr+AYEr4LV4V9CGzSn3cdWcNG1iaBn8sGrIb7tSe?=
 =?us-ascii?Q?Y5tlWTx+rMn9Bvemw+SAQpRU/jOhKf2CqQbqCz8AnNjH74OgSeCHRrCdx7vD?=
 =?us-ascii?Q?tKtTjhioDOK70ibXsJNnKoYaOUhgmqYhdvvoxRCu?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4860e1bc-2e33-471b-50b4-08db343e69c3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 12:24:47.1150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOKvkYK8Unr0lQ4Qsz1uXhRN3OsD4jgJwqHHf+UD+Lh4pKBku+1/TzrYHp3eROEp8XZjntbAecZLYCROlYpMow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 12:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179629

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...support-ACLs-and-extended-attributes.patch | 52 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.5.0.bb            |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-b=
uild-support-ACLs-and-extended-attributes.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-su=
pport-ACLs-and-extended-attributes.patch b/meta/recipes-devtools/opkg-utils=
/opkg-utils/0002-opkg-build-support-ACLs-and-extended-attributes.patch
new file mode 100644
index 0000000000..0744453ce9
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-support-A=
CLs-and-extended-attributes.patch
@@ -0,0 +1,52 @@
+From 61dcbe59656e0100dd13b980c530bf64ece78b37 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
+Date: Sun, 2 Apr 2023 01:10:05 +0200
+Subject: [PATCH] opkg-build: support ACLs and extended attributes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Add support for tar archives created with --acls, --xattrs options and POS=
IX header format.
+
+GNU tar and libarchive already supports ACLs and extended attributes. We c=
an now
+add this support as well to opkg-build script in order to use setfacl or s=
etcap
+inside do_install command and end up with a file in an image with the rele=
vant
+extended file attributes.
+
+Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
+---
+ opkg-build | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/opkg-build b/opkg-build
+index a9e45d4..eb764a5 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -159,14 +159,13 @@ compressorargs=3D""
+ #    - Busybox tar doesn't support '--format'
+ #    - On some Linux distros, tar now defaults to posix format if '--form=
at'
+ #      isn't explicitly specified
+-#    - Opkg doesn't currently support posix format archives
+ #
+ # It's easier to check for mention of the '--format' option than to detec=
t the
+ # tar implementation and maintain a list of which support '--format'.
+ tarformat=3D""
+ if tar --help 2>&1 | grep -- "--format" > /dev/null;
+ then
+-    tarformat=3D"--format=3Dgnu"
++    tarformat=3D"--format=3Dposix"
+ fi
+=20
+ compressor_ext() {
+@@ -314,7 +313,7 @@ export LANG=3DC
+ export LC_ALL=3DC
+ ( cd $pkg_dir/$CONTROL && find . -type f | sort > $tmp_dir/control_list )
+ ( cd $pkg_dir && find . -path ./$CONTROL -prune -o -path . -o -print  | s=
ort > $tmp_dir/file_list )
+-( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion $mtime_args -c $ta=
rformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data=
.tar.$cext )
++( cd $pkg_dir && tar --xattrs --acls $ogargs $tsortargs --no-recursion $m=
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
index b27e3ded33..9349ba06d2 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
@@ -9,6 +9,7 @@ PROVIDES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'updat=
e-alternatives', 'virtu
=20
 SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dhttps;branch=
=3Dmaster \
            file://0001-update-alternatives-correctly-match-priority.patch =
\
+           file://0002-opkg-build-support-ACLs-and-extended-attributes.pat=
ch \
            "
 SRCREV =3D "9239541f14a2529b9d01c0a253ab11afa2822dab"
=20
--=20
2.34.1


