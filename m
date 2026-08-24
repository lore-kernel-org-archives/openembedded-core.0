Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B1FC5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 12:48:34 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.112])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15703.1787575711088794152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 05:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=x0dsresl;
 spf=pass (domain: navimatix.de, ip: 52.101.69.112, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vc/yYiwe8/pznO8N08Vb02mhifAFzFKcYH+bJoRmDQNqcCsdy6YLK+mPLkjNFXVUXz4unwYpc97sZJlyQv+M0jt3Z76l0mTtHeYJNLFjWqJi4mD8TnPyUieNvTDRRGhhcijtOB47wgoGUopaSOvPdMpPd6W9Rr0jdN4ABsCB0PgEP7GZ5XB/BcQEvek42qEOWl34+g8BspYHypCZHIhrLH5EBg868HitqOY+9gPnHmgJCmAPlUqZl2Hn9lh8c+t9p2dQ3F+WiQyL+VDvzJlkT7AkrH2H17OpyKkoMwZjDFJK/V+8fq4oH9KLC10BH/Q+z/4SMCpyOEwD80azoVRLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebxZjeKG++InFPYMBnUrLB6mFKpn5fR3E0ALmGbFnns=;
 b=PtuAbhkRv390th55DsULP8ey+hnoZZTxXyLnv2Z2UMM5iIFKMzevob1xtNSTd0xmMg7AxIJlyyn834dBZ7qy5uFecHr8UmRi/HQQR3UD5DHVrXItCASomLxy3eehXrc6Y4HWJ6eGglAUvfWLudqej3tzxwTEUdY9uynrUUdArwuJGB178FULZrt0QHQgexFo95Y5Ehxxxwn9oRZVfovySaj+qNl6kYZUMhpcbuqvPZsv7bO9duc9t5SL7Le+/ulQ7s5qWQt3tC+SWgbBIPUhms+S8umJt3+o2GKlc0cPZsNIMqtHcJWhThbSHig8uiyT5B9LptEu23VRzJ5GWJ8SvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebxZjeKG++InFPYMBnUrLB6mFKpn5fR3E0ALmGbFnns=;
 b=x0dsreslkXMy5bGnWDFnSfa3OsEuue9TawFFoCUqJxMnJtCDzKX3MqY/rVtrg6eSe+RM09ENnwfejpsALKv+85dGRfAq7A10tS3fqv59KvP08b3CNHmCGuMexDx6XzqVYzz01Ti5WqHBHz+xzeKqM4FNV757eXctleKUaLw6jtg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AM8PR01MB7569.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:241::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 12:48:25 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%6])
 with mapi id 15.21.0339.012; Mon, 24 Aug 2026 12:48:25 +0000
Date: Mon, 24 Aug 2026 14:48:23 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, rs@ti.com, joerg.sommer@navimatix.de
CC: mathieu.dubois-briand@bootlin.com, Randolph Sapp <rs@ti.com>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v3] bitbake.conf: Extend distro feature usrmerge to merge
 bin+sbin
Message-ID: <5fff22004037096d27276023cf29c473c8c8ce85.1787575546.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::18) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AM8PR01MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df0abff-9f39-4f09-5915-08df01ddfca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	iLNs7Tqm+65AIoGQcCJq8xHt4X/zF8JFIGOG9xirh0RQ2YTWC3b3VIlKHwn8n1/lgAoKD8eqhvz0w3rTD1Fc9vu/KZ40VpH3w3QDaDaXDOFXZFUAkngTuFoDeUgO3wqmYHGRhjxeqVdhkBoJzyD3B7y1F2YOrsn+29dv3hXt64XizPAQ3KkNeIXXUm1CT2oZJtmo3DgHcsQtAT9WAuzMLZQgxYSXiKR/I1Pgw8K682TkwQ5pdDKYvq223g8My3dc5YQW1TFXktHO3QbvCRgPowbst5yjKRxghSwkTkce6ssX3s+Ia5CL8HvRtSnlV+iBNgoeJnc63kc9+Xi0b8Xh8em2nCAV6tojtvVgzGJmLcDlaWtDYgXfJNVLyPkHfnj5mX2yqQyHYiUby3cmY0sPsgArBfmdl3zyP7qAPspFfT5Ee2bF0WF4tyWyLg/UqCbscxLUzEh9rWBk6hChAgYwv1Sv4mIQRCazimmsazxPd1cfCqKUxDtL4qeQLnX7k4VfJRcRXczfI7AjgXYyCRack9P+PptMXtLluU/xOC5pMktHz8tmgUA+3zOSyPri47kSj/v7gFAmGOQqemPhfz4/uwvq9mXbVRWnFimFA5/Pb20=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u4Wkx5Nk3LCmhjqdCUEdKjpb68MboHBgfG/jvKg+2BviZeBRAjk0Z4Ztvjnu?=
 =?us-ascii?Q?tfUM3RkTArBgYN39pTtfxu+vkwLf9fy+XTmQ4BWvzX+hg2mwzwu6uAB2yP4h?=
 =?us-ascii?Q?BmUU2aHjwDVKg18w0FiwZe8HmqHB//INLdoolGgkqQd5xmH4Q7UVBR5+wzwg?=
 =?us-ascii?Q?ZoaOrhr5WYwZ65Tra/gOaY55ahGTOjUvquBR9Axn4qUUAN3ewBuWL5DwnKXI?=
 =?us-ascii?Q?S24+oKmZd2R2NyhQ21PJBpZ1atEioturuMuSOdThL3vyh+j8JprB5ytmKs32?=
 =?us-ascii?Q?j2jT6xwcZ3tJ2y+2cstYIUQXj15AuEpaJOiBymp/Rj9sSxNy1DCxkioYEQxg?=
 =?us-ascii?Q?JspfSWAxJY8jhnho2lVVzuA00A2rQ6YZ6Tls84hwRMbNm8tcTZ2YtUDmsxgh?=
 =?us-ascii?Q?j9QDUl99OSHYG3KA094IPc8dp+EsRzUBFkREXSPghBHzIR0k8crwcCQLI2+8?=
 =?us-ascii?Q?pNYf7QJh9yqxE4vWwIKFCaX8ikfg1DuZcwEcAAlbqDy1SK4u8hlbn1Nf3Zkt?=
 =?us-ascii?Q?6bIIZY5VlhfjwFITJ4wM9fp2MtetZJZUjVIkliUVS1j/eEjT6GMxSHfuOHHj?=
 =?us-ascii?Q?FvWWaYzW0m3mV1/42PF01SLF4PbFQ6Zf8fLec7GjzgUD0CjISpnWvVMg2aP7?=
 =?us-ascii?Q?DqyimhzNeC1JFAdIKRoHTiD/xz3k0BUCLyDxbriLU08Woz2lUlseRXYy4291?=
 =?us-ascii?Q?yUcWcKaRVtiwj03lI5YV6kDA6ajb4TjTwabr1T+L73TCsY8UgExQQmZj4Ute?=
 =?us-ascii?Q?CWf/yf7ELI7lZ/1p0TFvOiRs4xoSKiCQzTfitNjukVnHduUcypGRIRReF663?=
 =?us-ascii?Q?VLPvvRebWOP/LM5T23Tl343z4k4xjcX5eRuiNFN6RZ0VI72mS+29YVB5vz35?=
 =?us-ascii?Q?7D8lXJ1o6q6HMey9JRdeFhAKvAcdvowO9tJhXI1k14uN2gcRPAeQP3ZZQAz4?=
 =?us-ascii?Q?qAVDS+87SwYz5vWOIAGW5FrDKNEmJFUMG+mgpujXKMVT5TB9Y8tWmzcBMh+N?=
 =?us-ascii?Q?Q6CCvll/XhrB0C65W01fVZczTqm3eefG39IZS1cZ3o3k8oXMI7Mgmpozn63X?=
 =?us-ascii?Q?TOFee1YX8ak5/gXDyaGqQd3vTfFMiNUq6CLcYcUNGWgW8Tdeauz1wMv3vsmh?=
 =?us-ascii?Q?m0ULArsDDJlehkCwoDDF/PO4JTP+0X2g9KpORgjgwhRxEYRWgskyBwiC6PiL?=
 =?us-ascii?Q?0TT7QTFn26Ei+WOev/IndWqoTx2svQZx/xgS5OnFsV0zd34MYQ/tRSQMwsGy?=
 =?us-ascii?Q?UyvomPGz7j1LkMN2KffvpghvcEnjHiBGDgWMSparLxECpEigFAFIoruHkLv6?=
 =?us-ascii?Q?0M4q9jABOqkEF9FQITuLiFz/k4l7ImDV4F8+kxIobnrQ5I9Vpa+kdaEZ+sKq?=
 =?us-ascii?Q?ql/Qhl71x9t31bjRpIzdRwPk9HZ9OzRnpd6IUoxbOwt8z32KJwaVtQiydRM0?=
 =?us-ascii?Q?D3BzKEX89H6Lj9H5+wQ4keUanv6mUmE2UpPQGT1hjKMlR/CqeEwCAJeHhCMM?=
 =?us-ascii?Q?h4dEicj1e2PMhEUKojhIy1eT+37r6nOposWnbopf/VB+aI1DX0v5wSe8Dg+a?=
 =?us-ascii?Q?cyf/JxAijGXdAaWbtYOOHIXQjvaWWYFzrOJ65LWuThmZLgUFkxZE/fxmv1Hd?=
 =?us-ascii?Q?tOFtxHZMCZSIu7DQLBev7gyRrr+gKtZbxkPjYDuGG9DJ1GJ2VWkirHLn5TSA?=
 =?us-ascii?Q?6RbckNxLgCV+ukQr9RYqWW14Q0ErdI21b5j4Sx0bUdZkWadCpAuZhoWZRJjt?=
 =?us-ascii?Q?px4NCWkvlLU/ycQ6E1gDloqx0TsHtQw=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df0abff-9f39-4f09-5915-08df01ddfca5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 12:48:25.2788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMjJO9mpjRxfhQFJc/xc+UFg7kr0SgqnrT6Ad1ElknxUrlcn0bMhCGLe2ENnatbpzOTGSqaMBd71nad9A9co6M4wlqNKyZAk/q9hLHWBGMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR01MB7569
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 12:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244095

From: Randolph Sapp <rs@ti.com>

The split of bin and sbin became more artificial over time, and it is no
longer clear why programmes goes into the one or the other directory; e.g.
forever normal users have used sendmail in /usr/sbin, and fdisk and mkfs
learned to operate on files to create images long ago.

Because systemd drives this movement to have only /usr/bin and symlink /bin=
,
/sbin and /usr/sbin to there, the usrmerge feature (started by systemd too)
should be extended to include the binmerge. For a system with split bin/sbi=
n
`systemctl status` reports the system as tainted for *unmerged-bin.*

Override most sbin variables to point to their bin equivalent when
usermerge is enabled, with the exception being base_sbindir_native and
sbindir_native. There is no guarantee the host machine is using this
filesystem scheme.

This check was added to systemd back in 2024 [2].

[1] https://gitlab.archlinux.org/archlinux/packaging/packages/filesystem/-/=
blob/main/PKGBUILD
[2] https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4d1e=
4a6aa6d9f0d

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
Changes in v3:

* rebase on systemd 261.2

Changes in v2:

* I took Randolph's version and reworked it a bit. But the idea stays the s=
ame.

Reference to v1:

* https://lists.openembedded.org/g/openembedded-core/message/234858

 meta/classes-recipe/populate_sdk_base.bbclass | 2 ++
 meta/conf/bitbake.conf                        | 8 ++++----
 meta/recipes-core/systemd/systemd_261.2.bb    | 6 +++---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-r=
ecipe/populate_sdk_base.bbclass
index f32e9add01..f9367d0d17 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -188,6 +188,8 @@ create_merged_usr_symlinks() {
     install -d $root${base_bindir} $root${base_sbindir} $root${base_libdir=
}
     ln -rs $root${base_bindir} $root/bin
     ln -rs $root${base_sbindir} $root/sbin
+    # if base_sbindir =3D=3D base_bindir, aka binmerge
+    test -e $root/usr/sbin || ln -rs $root${base_bindir} $root/usr/sbin
     ln -rs $root${base_libdir} $root/${baselib}
=20
     if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 41e98ce629..a6833f98de 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -22,7 +22,7 @@ root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURES', =
'usrmerge', '${exec_prefi
=20
 # Base paths
 export base_bindir =3D "${root_prefix}/bin"
-export base_sbindir =3D "${root_prefix}/sbin"
+export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge=
', '${base_bindir}', '${root_prefix}/sbin', d)}"
 export base_libdir =3D "${root_prefix}/${baselib}"
 export nonarch_base_libdir =3D "${root_prefix}/lib"
=20
@@ -44,7 +44,7 @@ firmwaredir =3D "${nonarch_base_libdir}/firmware"
=20
 # Architecture dependent paths
 export bindir =3D "${exec_prefix}/bin"
-export sbindir =3D "${exec_prefix}/sbin"
+export sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '$=
{bindir}', '${exec_prefix}/sbin', d)}"
 export libdir =3D "${exec_prefix}/${baselib}"
 export libexecdir =3D "${exec_prefix}/libexec"
 export includedir =3D "${exec_prefix}/include"
@@ -66,9 +66,9 @@ bindir_cross =3D "/bin"
 bindir_crossscripts =3D "${bindir}/crossscripts"
 prefix_nativesdk =3D "/usr"
 bindir_nativesdk =3D "${prefix_nativesdk}/bin"
-sbindir_nativesdk =3D "${prefix_nativesdk}/sbin"
+sbindir_nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',=
 '${bindir_nativesdk}', '${prefix_nativesdk}/sbin', d)}"
 base_bindir_nativesdk =3D "/bin"
-base_sbindir_nativesdk =3D "/sbin"
+base_sbindir_nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrme=
rge', '${base_bindir_nativesdk}', '/sbin', d)}"
 includedir_nativesdk =3D "${prefix_nativesdk}/include"
 libdir_nativesdk =3D "${prefix_nativesdk}/lib"
 base_libdir_nativesdk =3D "/lib"
diff --git a/meta/recipes-core/systemd/systemd_261.2.bb b/meta/recipes-core=
/systemd/systemd_261.2.bb
index 8237b040a5..4475fb2514 100644
--- a/meta/recipes-core/systemd/systemd_261.2.bb
+++ b/meta/recipes-core/systemd/systemd_261.2.bb
@@ -196,7 +196,6 @@ def build_epoch(d):
 PACKAGECONFIG[set-time-epoch] =3D "${@build_epoch(d)},-Dtime-epoch=3D0"
 PACKAGECONFIG[timedated] =3D "-Dtimedated=3Dtrue,-Dtimedated=3Dfalse"
 PACKAGECONFIG[timesyncd] =3D "-Dtimesyncd=3Dtrue,-Dtimesyncd=3Dfalse"
-PACKAGECONFIG[sbinmerge] =3D "-Dsplit-bin=3Dfalse,-Dsplit-bin=3Dtrue"
 PACKAGECONFIG[userdb] =3D "-Duserdb=3Dtrue,-Duserdb=3Dfalse"
 PACKAGECONFIG[utmp] =3D "-Dutmp=3Dtrue,-Dutmp=3Dfalse"
 PACKAGECONFIG[valgrind] =3D "-DVALGRIND=3D1,,valgrind"
@@ -227,6 +226,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
                   -Dtranslations=3D${@'false' if d.getVar('USE_NLS') =3D=
=3D 'no' else 'true'} \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-Dd=
efault-mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
                   -Ddbus=3Ddisabled \
+                  -Dsplit-bin=3D${@'false' if '${bindir}' =3D=3D '${sbindi=
r}' else 'true'} \
                   -Dtests=3Dfalse \
                   -Dlibc=3D${TCLIBC} \
                   "
@@ -343,8 +343,8 @@ do_install() {
 		install -m 0644 ${UNPACKDIR}/org.freedesktop.hostname1_no_polkit.conf ${=
D}${datadir}/dbus-1/system.d/
 	fi
=20
-	# create link for existing udev rules
-	ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
+	# create link for old udev rules
+	test -e ${D}${base_sbindir}/udevadm || ln -s ${base_bindir}/udevadm ${D}$=
{base_sbindir}/udevadm
=20
 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
--=20
2.53.0


