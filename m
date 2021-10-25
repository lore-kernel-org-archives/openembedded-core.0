Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2995C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 03:38:24 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.54])
 by mx.groups.io with SMTP id smtpd.web11.27500.1635133104073241179
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Oct 2021 20:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=A3VqGS3m;
 spf=pass (domain: synaptics.com, ip: 40.107.236.54,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HE1b16nFj9my/yZlUYV/9lncQd1lE/6TvmBoASzIeOCZU2RZ4x0Mn64Y0wwZwRmQRBujxwEQpFcmnGUejdIcMdGxsXuxUkt4AZKhV9GQnByj7hsgH+w5sTZemlXMo9bFeopiwwWXzRjhMYmzuerCfcdl4WYCOwkZ2PRLZa08Oq9kD2xEtprpu3jUrhMT+xR/vnsheAxDswZqBBpbKfFolvZOw1ukr6udiWLAnJRMHnmmBYj4AAqXYAfBP/NXiDV5FpmbrUVApihD7Nfg0VfWXn06T9RuNDjNdG8UpnLnq5ljetl5/CRzf2a6yyJcULWd4kW5vZueYD4h/LXJQHqqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4aYdKRq9aJY2sU7czm7+5W0ndcOV1DPnXZAI47rTuA=;
 b=Je2G4CBeWPsnB6KhJssrUlOI7u2HK9/QcW144HG4Ye9KgVgvAXFGMlCNpFD4uXrPbqZ7pkWPnDYj//12XRpzfSz1N0zbv0Ien9O+tL+iGgq4s+N+YnmUAua5Q04WHHj1XGtnvaNBKWowJ5sRPFUJFdUAS7wdoTACAQpW+4Ldcjap9dDHQ2BH7YADJKJ9K2wL/NKmvgWZ3cmX7R8dxbGq+pdvj3ptSJ6u0IzWu7x7ntR7rvCrAl3EyQO73ZPk6IkO7KJBZGkBxAbdcagceS8Y4td8yADJflpPOHAqOlFa8uwxOiNC2XcdEatWllWFtR2Myc5TqTIm55hl25yLciZPfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4aYdKRq9aJY2sU7czm7+5W0ndcOV1DPnXZAI47rTuA=;
 b=A3VqGS3m8O+9Crn/8qSICfpd7cSCQ3xLB+6E+qJ7AopQckr3Cc3B/LAFFtiCpeTX98UC32jl/+nuhNcuuXVjB7wT5ge+U0FZ+QIjBw0tObAUqxEg6TkXdVoUYu5fK+BCLt5Z9c57foqPWURxkykBiCGRZHXl//MT4qjBjKX4ojg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4427.namprd03.prod.outlook.com (2603:10b6:5:10d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Mon, 25 Oct
 2021 03:38:22 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1994:3844:6596:1d13]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1994:3844:6596:1d13%8]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 03:38:22 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
Subject: [PATCH v2 2/2] meson: install native file in sdk
Date: Mon, 25 Oct 2021 11:37:44 +0800
Message-ID: <20211025033744.753260-3-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025033744.753260-1-randy.li@synaptics.com>
References: <20211025033744.753260-1-randy.li@synaptics.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:a03:333::9) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
Received: from randy-t14s.synaptics.com (192.147.44.15) by
 SJ0PR03CA0094.namprd03.prod.outlook.com (2603:10b6:a03:333::9) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Mon, 25 Oct 2021 03:38:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29872403-9bc1-4c92-bac5-08d99768e4d3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4427:
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB4427BF7002647BEE63CD84AD86839@DM6PR03MB4427.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7lNdfGiAM1sCzQgJTw1bT+zDQmAl+cv1cHthMDi7/j2F2uOv77aTNCTFJDH0IGub7eKYYMbY5Zpaze3VEfYuUPDQavC+MNORxfuf+yj9VsPf9hqagH7Pewl5YJmxLRMULZWr/is/tnaP4ndbs1PpqzFakkhJyU9AQ30g746NV9T5OfDJyzr/aWGXSo+Pd5aoXkLm2sNNsIFBISwJxx5YhKp8FTXU3jlr65ZdxFPK0/BwjW3CToadEp9cN6zs/mf1pLqGnDLK/0dx4jhLOUW7xwjnviwanhAby2yTMBGIHHBWQvxrdd31C5c+KakmcvaCc2iFRPiYYzcFLjf6IFNTLEOxMJ52ixZHJhWMawLtoEm2WOI0cS9VfgUJPwg4S2b3AfkQILjG01SPFlYifVQMi5U5T/ErEffnm39XBCNen2cVK2YDHHigazz70CQdcp9rZuG3vz2RACdwgPNbZ+H3ErZGtaQ/5BEQLCWfjVMN/2QkTECyyG14+smAeuOpblCMeBUDihA1cIm2b0ZA/uqz7tmAvCfpJw/z12pQbfH/+ldEX2/FwVblNT6sUBHsoJviGC+Rb/3tvfFxWvzDgTKuLy6OMjv67wNpQefGdwGaxzDDDEQZu4PFZBTSpWKnuMliuZzxQxCDMu2zNy7Hdk4++/xh22QQdbAHYjnh/PITG2JmWOhZvBCaWR0b5Ep4SJmphGCqD67OW/Bjbjwl4zOjMA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(38350700002)(52116002)(8676002)(956004)(107886003)(8936002)(7696005)(36756003)(6486002)(316002)(2616005)(186003)(26005)(1076003)(4326008)(5660300002)(6916009)(6666004)(66476007)(66946007)(2906002)(66556008)(508600001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?66OU1Mv+Oi5iKwxGqJ5DT4qswzh2OpgKgq+9iWNzu0w8Z9DSmPGef34Vk0fW?=
 =?us-ascii?Q?CcUzQ1EMuYJm74c/epCPWPuH+J57+zaT5pcSrK/8FXogrriKdWOB3wtGq5dx?=
 =?us-ascii?Q?vYZKWEKCBp4YAwhAkD4QS3MchYa0GbaMbxcNS2o2i6bFwZGP0qQ9gq1vPebl?=
 =?us-ascii?Q?ay1XLK82H56lGn+mvipEeyJW3DsGB7Jsis/LU22gdbLpBDmjJKIEiUrXKneU?=
 =?us-ascii?Q?tCjINyifs60+ICBwJuwmIT90GSdpCbd82Q4ypxbGGH/lolwJ5fxHyk3xTaNx?=
 =?us-ascii?Q?GzZk22vjzhVXsGeS0xdO5B9s3aHyMzGGblXsQTOX7GfKLzfQGlUJyPCzCbDg?=
 =?us-ascii?Q?dIAA922JnPLRhTRA/q8UGvHpfuUKTB7SEG+iKIkFMvIXOYawi+lPoRiOl7Ut?=
 =?us-ascii?Q?tFEuIOFrL+OzLx12HL2wmc2UI3TMdCmv3lyMgGPBePDv4niGIg0vFFkCOpNw?=
 =?us-ascii?Q?3L1NANEqGjHNFk3wnfB7Tx5m393HuYmAl/O/PThM6IKZ656gOy1orBCftYhm?=
 =?us-ascii?Q?32VuPXb6rNxR0dPaT/lNEaFdLsG1PvcMLnYrTXLG2isfOPBz2v03SiSfP9M1?=
 =?us-ascii?Q?BlKmB9ahhU29BfIXayHQzHqaKa+tzi1SlfD/WkPNmwkZ0lJFFCCnWzuLPPK1?=
 =?us-ascii?Q?vtu0CRWmPuqNRe+Fh39qS5ZS2NsGVCX36/T3GOWmXV7fhmtxaI389h6fwows?=
 =?us-ascii?Q?n1yZC1p/PBcl9LVfeUmvACortQcg2FJSa9mEilK2097C4RaCPInK8QYGtlzY?=
 =?us-ascii?Q?nU51E3KArucHpfJvvT2MZjL2fkggg6+La3uiWpSrCG0KTIHrVKMN/InDYGG5?=
 =?us-ascii?Q?sj5sVdHL7r/bxmk1N5O1eC7+vOWt1sN+YCDyHJp+bh/hex6X9B2+JWPT5qPv?=
 =?us-ascii?Q?fzscmBbOGdhTQbP/uoQBL4hG89FXafFTlvOcsfRwL9g+S/L2cLUol/gWLM1l?=
 =?us-ascii?Q?Na1Ath0xlWAlh1fPYsQdtP0k89JMrplkhzemK0nhY0LIAuf8mAxq1E0AU64+?=
 =?us-ascii?Q?4Y10vOD037/s43EiX1Kr1iyq8P4oOkN2fqi9QM2p3RjhmFOgpVhd+jtR3b93?=
 =?us-ascii?Q?GoHKGtK3J8pKcggaCsWxFD25bECJkhnL93LrrC/ssSFYyDeyqGr7ybwUPfgs?=
 =?us-ascii?Q?mVFvC9r8dF9VqJqDpI7Zp7PP7jTJmHzHbukNXIvEtACQNo5V5MYni3S0u0MX?=
 =?us-ascii?Q?B3Wb+Y1ik6fjaeNKSHIAQUVgdmE4KnPW+NQOmiBGnYBs4TB3i76ksz+UzQGe?=
 =?us-ascii?Q?II4KGhvZ8ZIu+tJQIbLcdLWVnjKH4xI0w4NoltnitAiRA1Xsyr2qJCl1L/7T?=
 =?us-ascii?Q?wW/X41gmrjHAp3LC2d7cWFlK9hfjgpglQDXINTMrRjtiJ0AMvFheAYBIrUzJ?=
 =?us-ascii?Q?fxOPNXW2Wu/MHEc39ngWOGmbV4DQZvmLc2DA1czAdwCzb56saoeU3sxXq5ko?=
 =?us-ascii?Q?0Tn5rLyGtrFdH4GXwqxSl20ftBopzpEelSaPz6bMgYVPZ/h5V8iYWtlRwDB6?=
 =?us-ascii?Q?O8fOSBTLhPlZ9MyGnpAO31cDpOzbjtKAM/6ipu2qgn2pfq3SFxjbQBxJL6gg?=
 =?us-ascii?Q?r0h28N6qzgim1JbiENGBaKVvSUKgV4t5sE5j2/WZN+ybcfwScLOkpAHJrf8E?=
 =?us-ascii?Q?XMcdX3RNXOEqSc4MdE52eBE=3D?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 29872403-9bc1-4c92-bac5-08d99768e4d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 03:38:22.4136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nd0vhNNLQIoZS/2VLm6lqDLmNXr5EzKsqy8B1UqWRFfkVKKUgpRciEBjGd4xAitC2FJNc+4mcLncKJ3W/T1nJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4427
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 03:38:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157331

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Without a native environment file, find_program() can't
locate the native program inside SDK.

That stops wayland compositor using wayland scanner.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 meta/recipes-devtools/meson/meson/meson-setup.py   |  8 ++++
 meta/recipes-devtools/meson/meson/meson-wrapper    |  1 +
 .../meson/nativesdk-meson_0.59.2.bb                | 46 ++++++++++++++++++=
++++
 3 files changed, 55 insertions(+)

diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/recipe=
s-devtools/meson/meson/meson-setup.py
index 7ac4e3a..daaa551 100755
--- a/meta/recipes-devtools/meson/meson/meson-setup.py
+++ b/meta/recipes-devtools/meson/meson/meson-setup.py
@@ -27,9 +27,17 @@ except KeyError:
=20
 template_file =3D os.path.join(sysroot, 'usr/share/meson/meson.cross.templ=
ate')
 cross_file =3D os.path.join(sysroot, 'usr/share/meson/%smeson.cross' % os.=
environ["TARGET_PREFIX"])
+native_template_file =3D os.path.join(sysroot, 'usr/share/meson/meson.nati=
ve.template')
+native_file =3D os.path.join(sysroot, 'usr/share/meson/meson.native')
=20
 with open(template_file) as in_file:
     template =3D in_file.read()
     output =3D Template(template).substitute(Environ())
     with open(cross_file, "w") as out_file:
         out_file.write(output)
+
+with open(native_template_file) as in_file:
+    template =3D in_file.read()
+    output =3D Template(template).substitute({'OECORE_NATIVE_SYSROOT': os.=
environ['OECORE_NATIVE_SYSROOT']})
+    with open(native_file, "w") as out_file:
+        out_file.write(output)
diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes=
-devtools/meson/meson/meson-wrapper
index d4ffe60..d4b5187 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -11,4 +11,5 @@ unset CC CXX CPP LD AR NM STRIP
=20
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
      --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFI=
X}meson.cross" \
+     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native"=
 \
      "$@"
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb b/meta/r=
ecipes-devtools/meson/nativesdk-meson_0.59.2.bb
index 5657397..7b77041 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb
@@ -13,8 +13,54 @@ SRC_URI +=3D "file://meson-setup.py \
 #   real paths by meson-setup.sh when the SDK is extracted.
 # - Some overrides aren't needed, since the SDK injects paths that take ca=
re of
 #   them.
+def var_list2str(var, d):
+    items =3D d.getVar(var).split()
+    return items[0] if len(items) =3D=3D 1 else ', '.join(repr(s) for s in=
 items)
+
+def generate_native_link_template(d):
+    val =3D ['-L@{OECORE_NATIVE_SYSROOT}${libdir_native}',
+           '-L@{OECORE_NATIVE_SYSROOT}${base_libdir_native}',
+           '-Wl,-rpath-link,@{OECORE_NATIVE_SYSROOT}${libdir_native}',
+           '-Wl,-rpath-link,@{OECORE_NATIVE_SYSROOT}${base_libdir_native}'=
,
+           '-Wl,--allow-shlib-undefined'
+        ]
+    build_arch =3D d.getVar('BUILD_ARCH')
+    if 'x86_64' in build_arch:
+        loader =3D 'ld-linux-x86-64.so.2'
+    elif 'i686' in build_arch:
+        loader =3D 'ld-linux.so.2'
+    elif 'aarch64' in build_arch:
+        loader =3D 'ld-linux-aarch64.so.1'
+    elif 'ppc64le' in build_arch:
+        loader =3D 'ld64.so.2'
+
+    if loader:
+        val +=3D ['-Wl,--dynamic-linker=3D@{OECORE_NATIVE_SYSROOT}${base_l=
ibdir_native}/' + loader]
+
+    return repr(val)
+
 do_install:append() {
     install -d ${D}${datadir}/meson
+
+    cat >${D}${datadir}/meson/meson.native.template <<EOF
+[binaries]
+c =3D ${@meson_array('BUILD_CC', d)}
+cpp =3D ${@meson_array('BUILD_CXX', d)}
+ar =3D ${@meson_array('BUILD_AR', d)}
+nm =3D ${@meson_array('BUILD_NM', d)}
+strip =3D ${@meson_array('BUILD_STRIP', d)}
+readelf =3D ${@meson_array('BUILD_READELF', d)}
+pkgconfig =3D 'pkg-config-native'
+
+[built-in options]
+c_args =3D ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , ${@va=
r_list2str('BUILD_OPTIMIZATION', d)}]
+c_link_args =3D ${@generate_native_link_template(d)}
+cpp_args =3D ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , ${@=
var_list2str('BUILD_OPTIMIZATION', d)}]
+cpp_link_args =3D ${@generate_native_link_template(d)}
+[properties]
+sys_root =3D '@OECORE_NATIVE_SYSROOT'
+EOF
+
     cat >${D}${datadir}/meson/meson.cross.template <<EOF
 [binaries]
 c =3D @CC
--=20
2.7.4


