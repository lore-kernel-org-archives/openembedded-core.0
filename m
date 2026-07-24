Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24470C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:00:47 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.105])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15466.1784883636747066190
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=KHCGwr3w;
 spf=pass (domain: navimatix.de, ip: 52.101.84.105, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ky6KRoFdrmRpqtQDEpcLX+QtS+sYauJOw1HptdSQGcVFJLq5AlcD7g7FjlivYHfKFwdeTv8S8VytHLmPeqDG3eukJ+uRTI0IuxKFrVp48fb/M2Q5jBx3Y+GpuXtWx3312V4Vv+jEGTxrXd2xaPMM7HTBePRPxoNc2RtpBLKD1qj671D7cIbKVHkmFewHDkzCihWPV0IGYT0+YBV+7Xx5/ZLKVzRWrOmgUMWXBGwWRExQgy+hF+YysEuod5oEFb4X0/MNHpCc6m06EovBIBPs5Fk1J9b+2JG/HW1NB9CQPTRBuKCoL5ZDj4lhfEqgRILVMNaSHNhpOft9bfcfXEmocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bn/TXi3MKvME7tJzbElPTOEsS/FodJx/uQalNFRam6g=;
 b=QffHRXejIyiMVtT97GwYXzvZDEFNwcGpoa9AT6gktmkUexvk6/1r76pDzUD9UoNN/UHs+wc+vit5iMHyoaQaYS+3dXKUUAQzuKRdVq+qrZb3rw5kvblHmhhW5RxsapRmsz7VJ1J7LdKZEAroI3MJajKGE3ClvjP+jHt/IeHpRtaZ/gptq3iLiRKC9ZFSYsjaaCJvpPG7aaMBOufXGIgpxxqE/I/2DKaeH9KtL/KOeP2JYOB2N41jQ6/HtTspt7D1LljWIwW+zQSRfvjlO1GcGgpTeoAho+34RfAVNJJDDbapAT1w2qKO61LXbtLvlMKx/CAAEQZUEWG7dxQFjokZIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn/TXi3MKvME7tJzbElPTOEsS/FodJx/uQalNFRam6g=;
 b=KHCGwr3w6PzTR/6tekj2K9wJxwiIe9NNpjOHRkl9Rk4CIknwpBTZLGAs/8HBwV8qTqk0YFyI+TK7qnxKtjCtMWqWB2rDF2RXydcqdTeuDA0l278hDy2i4AbtYREbYlUHINFIVBq+XoxqLkAzzkQZRMUMBvz9G+53t22+T28M9lE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS8PR01MB8555.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:44a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 09:00:31 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0245.009; Fri, 24 Jul 2026 09:00:31 +0000
Date: Fri, 24 Jul 2026 11:00:30 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, mathieu.dubois-briand@bootlin.com, 
	rs@ti.com, joerg.sommer@navimatix.de
CC: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	mathieu.dubois-briand@bootlin.com, Randolph Sapp <rs@ti.com>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to merge
 bin+sbin
Message-ID: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::20) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS8PR01MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b6afc6-d95b-46d7-2d12-08dee9620401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	hz88SH077sLszHSYpbe5BMOkm2Acpx1W6nNuVHzlDnhtxsjwmKya3RJVOc4N8RfgqW60MK44lhmVByCwnWb2v3U3WRKdzabPmfPnCv6Q3zVdssS3Tqp/J+MDDXb1KGdbl6EFzBlrejaBYLw3hFWkCykf0Tcip8R7fLki5a/giLFwVaHntu3KNZ2Nm71eFCC7/CYHrfdWxO+qDrGDbhT1aGZhLXRA0HWbOaq07aC8zz7U54b5+01BuduEhOf8orgiHQCKgL5Ze+O1QLn6iAKuMrPCKe1/EY5cK1R0ADU9Kfk5N/pjnps1Og2s/ZVe+uJwFnf55qivofk4VbHDcT5CsCzONrBOK6WdfP7udepYmHACDYOorsDq949IOFcK9Umyi035p2zsg4EzHb8DCqFFUgzpWJ4zI25iA5FzJPkctyyt21FSYTDO2BwKHtKa+34f4Ixwlf72Ym/5vLnG8qDesaUiRQaUihxHGxPKB9DcNlkMuGI4JhghNkMBOzeChcVjepoJpzm+BZC94bIvYhTeae+qzngCLkrKWfQpSdZivO23V/Km9ForCNt7s2TzM4EkdEiBgoWlvDYpFfJ0nZqi8rcK/FBhmiI6i6Ea/2ylA7s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?menqYgQkfPUBM4U3SGAk+dBe4KuxnRA1xKpSpdxSMlCt/090PEZFP1sSZn0y?=
 =?us-ascii?Q?ByxlfDAzgQ3W6qf1YQ5sy6xOC5nJh9IVMToBXBkz0gxM4qoeJ7e9IKb+4XMa?=
 =?us-ascii?Q?0iXcmyo6joDsS3PZ4yL6e72bDh3ZHCKB98cJEpSUe406qq+aGWdUOOiS9xb7?=
 =?us-ascii?Q?iRcZnK/ZozIa8NnNLEC0vNTq5XsyD3hRLQbvSDO676GQSqSvTlXvQxarQNbj?=
 =?us-ascii?Q?/6AMwnqqGfMN6vBIPWkrWT0FOSYzZkjREES8ZgLYazINepP6/7BNEx6xLD4D?=
 =?us-ascii?Q?TV1yWUzeBWjYobZTd49Ac3lLeNY+CV5EjAa5q2WFS/hiFrVcazdK1Lt3aDkJ?=
 =?us-ascii?Q?5vehDuWhj6jEGhyTtUsydm9SrbLg5sqdYWVOAIpXccO8PVuMNMKqCrdiowXe?=
 =?us-ascii?Q?46UvdEm/aDulfDjVIDduUbXUxfu9k6D6pBOfLIaZrrF7GWttBjH8RIBsIUww?=
 =?us-ascii?Q?f/ba2nmg+Obu4dTIe0t2PR2PybzgOdU+wLTS6Cb+u0DJRVr32Rg6qjYJopMU?=
 =?us-ascii?Q?MDNWGHGI3tb4YW77csmO5rd/BWnYPZQi5iKVmZcS7dI1/nOt4ajkxMQCvEZg?=
 =?us-ascii?Q?TrFdo5TlaYheo60++XksZ6S4deIv9QWOlLppkzewbKZPOy0Tw8mFjyizP9T1?=
 =?us-ascii?Q?5YLVcfQ7YizTsXl41lLVzt0pP+ufCKBMYwUigIYQMjBtgNQFIMDgt14yd8kt?=
 =?us-ascii?Q?w3G3kqAredG7McnlRTwQZfTFQWnIvCGJjPx19vGvmHpkDwjDOYoqh8Ps0PmG?=
 =?us-ascii?Q?PvhmakBg9XEzAoll1iQGtesYPAabkpWJverW9ykMws/QaG81o+VghA0UAvUJ?=
 =?us-ascii?Q?GCc8Br1piOarsNIaeLOY39wMB8MSyzaBjWkGD/373oA8Wilc+wU8Y3HCYzui?=
 =?us-ascii?Q?pbV5z9HR2dPmV7TAniEWMZnsIqLbmBUoARdtVU7HDHfbk5TwzjDx/rh3C5rH?=
 =?us-ascii?Q?mbquojcMy4Ufk5z3jykgQA31vfixGkDIEUTZzvLj2mWA76UJTnft5c84QGcM?=
 =?us-ascii?Q?oxkbJ5NoD8Un0N2zqA50acgn0cnq0Y2tREc2tBGzgp3/JrV6mmj6zZtq0MCh?=
 =?us-ascii?Q?Utu7cKjFKwThqr2bPuB2er+jShQAwBL+AJp2Fbq2RlHIGGkzzSHkBmCUZMjq?=
 =?us-ascii?Q?ESLYK7/DPWoEa6Q3cT3ilSlMHarpYUkae+xyY5UIIDuY0HLWkk2+MMO8x3V2?=
 =?us-ascii?Q?6bhzvIklkKdKDzmvOa8UBbd0pKTjMXNJE6g+2sx1KcLdhvkes6g0ginlLiQz?=
 =?us-ascii?Q?1OWkTbaT7rwtAwQai1V6oRCzDH1AKyOoYnJ4jBO0uI1yha8p2hj+2jKXKjJY?=
 =?us-ascii?Q?BI4soHqPwNPUEyQaBydzohVEbGSA6HnDEy+vBp2eLqQyugWoS240yZfsDZ4C?=
 =?us-ascii?Q?OBQ47RGfbFzR2IACRsV6CPcfHWmh7B6Lm0j5zc7LLReQaT4uFaj6726MvJoc?=
 =?us-ascii?Q?YYi0viDt0qnoX9aFMeUKlF8bUjXl5eXjFDKVe0SRUxoHPMkwbYFbKeMpDtqc?=
 =?us-ascii?Q?+aMfedTcXI/tiJ5EFLCRmOQLsFiveUWfDJfJpunbp9y1Z+zJ1Jo6qTPBHiTZ?=
 =?us-ascii?Q?qpnLLRad/Ef0xgeZuoZKET22nXmYjWByHBXCdiuXjwA2xJit0q8SQfd1r8NO?=
 =?us-ascii?Q?oZZCEljH2qim6SY9LxpQPtyvtCwsMgVJZdenM0lUikG1KRo8hx/tTyRLNrOI?=
 =?us-ascii?Q?VzK4U3PfswV8586S1WncyZZdD+5Qgv2FPTmVbtsWZD1fkxQtX2FI6o04NFlU?=
 =?us-ascii?Q?u8V8LPzOp36iFSktFrbzmDZnB8ZbHqY=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b6afc6-d95b-46d7-2d12-08dee9620401
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 09:00:31.8208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGsByJdmu6jD0fNHPAuSIz1HzFyDJuZeQp/iCFgPuTctyAMihDfORzF2rrLMq+SsWoLMj9wEOERAXHc/BeVgW/+suQHt0NFdrzfUW6zSo5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB8555
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241909

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

I took Randolph's version and reworked it a bit. But the idea stays the sam=
e.

 meta/classes-recipe/populate_sdk_base.bbclass | 2 ++
 meta/conf/bitbake.conf                        | 8 ++++----
 meta/recipes-core/systemd/systemd_261.1.bb    | 6 +++---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-r=
ecipe/populate_sdk_base.bbclass
index b427ff2761..c63601b1da 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -189,6 +189,8 @@ create_merged_usr_symlinks() {
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
index bdf37d0da2..18aa1441e6 100644
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
diff --git a/meta/recipes-core/systemd/systemd_261.1.bb b/meta/recipes-core=
/systemd/systemd_261.1.bb
index 0a1d4870bf..97a91ff5e2 100644
--- a/meta/recipes-core/systemd/systemd_261.1.bb
+++ b/meta/recipes-core/systemd/systemd_261.1.bb
@@ -195,7 +195,6 @@ def build_epoch(d):
 PACKAGECONFIG[set-time-epoch] =3D "${@build_epoch(d)},-Dtime-epoch=3D0"
 PACKAGECONFIG[timedated] =3D "-Dtimedated=3Dtrue,-Dtimedated=3Dfalse"
 PACKAGECONFIG[timesyncd] =3D "-Dtimesyncd=3Dtrue,-Dtimesyncd=3Dfalse"
-PACKAGECONFIG[sbinmerge] =3D "-Dsplit-bin=3Dfalse,-Dsplit-bin=3Dtrue"
 PACKAGECONFIG[userdb] =3D "-Duserdb=3Dtrue,-Duserdb=3Dfalse"
 PACKAGECONFIG[utmp] =3D "-Dutmp=3Dtrue,-Dutmp=3Dfalse"
 PACKAGECONFIG[valgrind] =3D "-DVALGRIND=3D1,,valgrind"
@@ -226,6 +225,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
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
@@ -342,8 +342,8 @@ do_install() {
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


