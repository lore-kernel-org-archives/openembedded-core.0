Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC58CA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:59:44 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2268.1790665180369870580
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mDDciqwk;
 spf=pass (domain: est.tech, ip: 52.101.65.6, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkcSMUIzvmPBVv+ZcKCQkeEuQX/NmmV1VECxTdRTIxOhS5l2AkaQ9Cim7rEEu4Rs2VuqVzDKIQz6dMKh49+KvEZq9An/O3EEXdn3jE/Jpqjqt590xQlrQrK68V36RzSsXRix75I/L8rzp7qOjuC/Cn1COEwxycBm5wbumcr93yhcjV05EtzpvXDJsQEixhcoT1c/QWBVilpSLsbDF1g5RVgPjopdHblQnl+T8lOiq9DKtX6SM/OxfU+hnxbiZ+SF/JyfWT9Gpb9PrGDF/Q44XdZsU0ZfE5FyUAiR0QTZfilLZ8K1e3vGQWqRDyhVDNDAWll5vBnfyNj2vmpRLsEvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e82oy+2YPiZT4MM7lFNnxrl7BImlYhOx4eKTPtnRWV8=;
 b=mpweoqxHQg5VGKekF4UFgviiMppW9RHGAxmf2wfCXwFOW1dWONSrWhsTokT5KrbHYvkVmAsEpeMKXq6GRkrCql7CT7GuQk3Lg1q8M3RFjhLda6XoENws8qgYhrulpc61zrGR5Yk4ooGh9vxRbK9QgiJEqbwNUPmI/P44YQddhylCclze3fl25AdTb/ogtMvOJ/0R8bkJkq8n34LQ8F0MlyV8jbAWCJTdAHHnocg5KrZVJZejzVAbOADYOk0d9Rv/u/jbKu2RgXV3QbvcAfKE6Oz3lgOL2nSRroC1XLuOVKApM+XUGKaJTi7pQMStayRIC5zc8yxYO8+PE5dO/n6eyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e82oy+2YPiZT4MM7lFNnxrl7BImlYhOx4eKTPtnRWV8=;
 b=mDDciqwktI4ZkXiGvnrt7rcVcuB3r+TlI9fVld5HG1jNrE7BlvISH90+c3c26e7qhRGTuJGNfHW17qNnFv08inxKDFr/Nko6QHNiHdA2KNMLkH8Eg2DLNElst4ZuNAm9L519y534lNijj3mmBqaHlCBSlvtbdvrkAzY/xVAikvFyb05US5ii7kMadUNshNDzcfDTqD2F8MJVuOa/Dz5WP+zarrsQNRR/bohdKsCzhYIONy624d849HbgeOUWsXn3NmMkr0uZVenGuxaBd8dYHWW5jRbbfyFZb7X8fXNc7Uq5gH6Y+2Y5Kfzu6u/yPq411KmJKhiReokTQTcd3rsHhQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 06:59:34 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:59:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] systemd: Upgrade 261.3 -> 262
Date: Tue, 29 Sep 2026 08:59:33 +0200
Message-ID: <20260929065933.71437-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260928113956.42485-2-jaipaul.cheernam@est.tech>
References: <20260928113956.42485-2-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU2PPFB77F8FB19:EE_
X-MS-Office365-Filtering-Correlation-Id: aaee4a75-5160-4eb5-11dd-08df1df73829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|260925021911599003|260925022911599003|260925021311599003|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	5/IL7420HKBjF7F0fsxStiXaHgD4JdK94cSJYGsS8cjFPeR8AdgURlRqzwht11CBQ9YZg9Hvj0LXRfjrgyXd9sGhbDHdYYB4zo3nsL78ebsWrkx1mjfEHZ5agfW7EjxkkpeeKuqgIe6clvlbHv2LuMMQLwz+HVc/4d8nGd/4l6SxXM7XEruYyIILter2kaCyHo6aMtql0/h3qymCmZ+HwgB5sUK/TuX8+nrEjtnP14PrpHhBR3wDTXRD3WMHVp0Yp8190lHbAhZLrRyIoRYOnNT3z+CudDTAKyFRgMedMrYiwvwJmbzbaOp8z36147cGIGSRKqdUYNFvcjaehnk9/AyWQD8Cysg7TaGor0XKvlHddtRP5DtTYcybjiYma6OmJOMkSWYiwSLpgdwMYaStpiDkbukUhmt44kb7JKvz02Ins5AJ+VwTPZ01+1/6ivwDWKTnU6azLaDQAyfpnyjHi82Jkvh6oVbCT3akhyubtPZBJhBQIPbmnZO4DujcXD7/MPa11F53omp8Sc2R9wohWaeJEB7qbpIS+krXlTqZoXbAo8fPBLfVjeAC/hMemkZ8BlFjOrfMmT//5PryG1OZjkQor02fa+O3t5wqLf3adg0x59jnYfX24BD9akdRweJbNmTGvYIq1/0QLyrx8QnY6wgBCGbcOTSl/U9lITXqb1c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yeD6C7W+1vI3IjX0ZSdIePnYy7OX4rzAwBhPZuSeVFHwFKWcIBFoC/EZ+Oxr?=
 =?us-ascii?Q?n3+kXYEITWIJT7zamTUJ4qNRW+4D5uGBBQbLz1j4THE47On2hkx36jhtioWk?=
 =?us-ascii?Q?snTnyi6YgeXeE1BC2UtFgeDs6P9Y8cv9n1BJ7lKiyvx/dvV+88MOuvJ0muVT?=
 =?us-ascii?Q?d70yNLjCljMx7r6utwsBHFkM6/i3HBDfZUM8Tz5Qc2Kcr0H2HsXRjfZSb9Fv?=
 =?us-ascii?Q?rgmmR1JJ4+I17Qx5y6irGYcKMywU5mu8cvo4CKeUVCATfjBImioJz2JL/Bql?=
 =?us-ascii?Q?qHPCejhf2hdseVxS+yrf1JqgcWyHSBlfdUDFaJQ0ZKs5vrRw4+S2RkIb60zZ?=
 =?us-ascii?Q?sbC/q2C5hKYcFOUBhDX284RTsMYiYr8BhKGOqyqW6N2RSUxDl7S5Z8kud8IZ?=
 =?us-ascii?Q?hBRl7QRHXmdwQvArTV19TO3dUZUtKLKeK25W8mcbTiym1aWikG2EK48SRbmQ?=
 =?us-ascii?Q?ef9f5Fv4ayo545J1XYl0SbP2oMlUyhqKPDFtIv058FM0khKfSxIHEfn0ZT9v?=
 =?us-ascii?Q?re7ml9yki2ucVMxfNEGN0EcSSe7MXwMyqxiHtGuNI+4GgYBECRtXF7LtUbC0?=
 =?us-ascii?Q?ltOmg2tu5h3sTOukkESjs4iMSafO2KAm3a3eESmw9O5QgA6Y7+OqURNuUp22?=
 =?us-ascii?Q?2H0mhEKGIZSZmE+wo2X6HVI1OBLRacQx40LFfkVHFbJ1We0QOiC14xAfpuDq?=
 =?us-ascii?Q?yYD8c1/Ri2NfNZj5FcwZKJ36wumlMDN7QIf1UQIZeKKd+7kqkNGFofGPtezj?=
 =?us-ascii?Q?1m47LPD/gfnxKlKOC2ejMT2/2AjUP/TkQ6J/MzNBmJf/du1waq7Y9CvGWnX5?=
 =?us-ascii?Q?hWDMJr3Is+8pMJKR5LXTBLOaBkctPVYFb212GRrE+upy3Oe4piLxbVxRC3nA?=
 =?us-ascii?Q?JHsBqtjhnDNG+vQ5quP1mFDJ5v1DBKMwgxsaQ2b22Duh1HUGTuq2/jNo2dnR?=
 =?us-ascii?Q?qm9h1yR6J9ia0RMLsSe11jvFqMrxn4vJfraxTBm8Sm0M41HFBdYu6a4OqrgQ?=
 =?us-ascii?Q?Ksj3AYhysUFKVvDqCSTRRJvHogK6xCbwiZ99d0J6WRhHBnio/stjcOrrCpoF?=
 =?us-ascii?Q?GWbTLosom8wO55CdPr+mHdvq7n/bI8U0/th1a7Bgm8RmCkrezW+EyeGi0i+j?=
 =?us-ascii?Q?Ue9eUxiHQMcM7EQULPPFiJLAn9A2xpCc0Tqy52ubNJHjCcax6BPemhGJ/4Q2?=
 =?us-ascii?Q?EZmvG8CJSUAAaCbn5oPyZI0L1HTFv09AV/50phAe4jwpI516z23WlfdTB8Ig?=
 =?us-ascii?Q?cLQxFozYgtMHuhIGyBXcQdEzqq02lVPlANKfYn13WiEkuWCfXIkm1l2Yld2u?=
 =?us-ascii?Q?O+sqPSl95TexL2sTP4aTJIM+u5CrcFCzW5KOiYtD/t/VCTmtH4hSmvhQOviR?=
 =?us-ascii?Q?7uhZGKiBl/qh+MqLT7gvU4D0naK06HonwwF11Lcd031H5TwlX4U07els5C6W?=
 =?us-ascii?Q?RR4TjHUw7hCrtypPp2h6QCTBBrbJrxbXuitOH8KiC3IQqaMtkMpmUDUqU1zG?=
 =?us-ascii?Q?n871rd/lJCXF5YVm4cvx0ANA4BlIHsjmeFkaqc7Y4wA6EuZN5Ge6sCjmG3XL?=
 =?us-ascii?Q?AryTNp/YE5TJTUq/dWBdC7S+Jkd34dpysbf3ybJNge8izCwVawpIZ6GILY3q?=
 =?us-ascii?Q?f3GykGPSuQYgu8ZELjLsmGyatgRHCnJqHW7i8PKubm8nwCz2CXwv5Ock9p/c?=
 =?us-ascii?Q?YdRj0d6buCauJeYuYWTzadsun6idFeH9OnbTYVwPbRvBxSUs/XV4C4TJOUiN?=
 =?us-ascii?Q?S800mLG2uw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: aaee4a75-5160-4eb5-11dd-08df1df73829
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 06:59:34.7490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbd+l36qk5MaeFctFBw+0ocy4Obqg79XD7wJnOMStE8y+6vlaOzPVCv+SasytUvNzfW4NF8AqXjwhaTn6QWcY4vlhhk9bFKlrs1elNarv48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPFB77F8FB19
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246845

NEWS: https://github.com/systemd/systemd/blob/v262-stable/NEWS#L3-L877

- Refresh patches for v262
- Drop deprecated meson build options [1]
- Drop 0001-include-fix-limits.h-override.patch [2]
- Add rules: install 60-persistent-media-controller.rules [3]

[1] https://github.com/systemd/systemd/blob/v262-stable/NEWS#L41
[2] https://github.com/systemd/systemd/commit/6a131b32e0fe948e845ae4bf41f8f=
ed003ec30ce
[3] https://github.com/systemd/systemd/commit/d153b49473

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
   - Drop 0001-include-fix-limits.h-override.patch

 ...ve_261.3.bb =3D> systemd-boot-native_262.bb} |  0
 ...temd-boot_261.3.bb =3D> systemd-boot_262.bb} |  0
 ...e_261.3.bb =3D> systemd-tools-native_262.bb} |  3 -
 meta/recipes-core/systemd/systemd.inc         |  4 +-
 ...tall-dependency-links-at-install-tim.patch |  8 +-
 .../0001-include-fix-limits.h-override.patch  | 74 -------------------
 .../0003-Do-not-create-var-log-README.patch   |  2 +-
 .../{systemd_261.3.bb =3D> systemd_262.bb}      |  3 +-
 8 files changed, 8 insertions(+), 86 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_261.3.bb =3D> system=
d-boot-native_262.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_261.3.bb =3D> systemd-boot_=
262.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_261.3.bb =3D> syste=
md-tools-native_262.bb} (93%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-include-fix-limi=
ts.h-override.patch
 rename meta/recipes-core/systemd/{systemd_261.3.bb =3D> systemd_262.bb} (9=
9%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_261.3.bb b/meta/=
recipes-core/systemd/systemd-boot-native_262.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_261.3.bb
rename to meta/recipes-core/systemd/systemd-boot-native_262.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_261.3.bb b/meta/recipes=
-core/systemd/systemd-boot_262.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_261.3.bb
rename to meta/recipes-core/systemd/systemd-boot_262.bb
diff --git a/meta/recipes-core/systemd/systemd-tools-native_261.3.bb b/meta=
/recipes-core/systemd/systemd-tools-native_262.bb
similarity index 93%
rename from meta/recipes-core/systemd/systemd-tools-native_261.3.bb
rename to meta/recipes-core/systemd/systemd-tools-native_262.bb
index bffaf5a2f08..359bc972ccf 100644
--- a/meta/recipes-core/systemd/systemd-tools-native_261.3.bb
+++ b/meta/recipes-core/systemd/systemd-tools-native_262.bb
@@ -18,9 +18,6 @@ EXTRA_OEMESON +=3D "--auto-features disabled"
 # Link the binaries statically as we don't install libsystemd-shared.so
 EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse -Dlink-udev-shared=3Df=
alse"
=20
-# Ensure unused build paths are not in the binary
-EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
-
 # Target-absolute paths that satisfy both tools from one meson configure:
 #  - systemd-hwdb needs prefix=3D/usr so the compiled-in UDEVLIBEXECDIR
 #    (/usr/lib/udev) matches the target rootfs layout, letting
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index 3ee898958fd..5ea45a78b2d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,8 +15,8 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3Dc09786363500a9acc29b147e6e=
72d2c6 \
                     file://LICENSE.LGPL2.1;md5=3Dbe0aaf4a380f73f7e00b420a0=
07368f2"
=20
-SRCREV =3D "3255daee1572366b74fe92f002a3d60ecbb27103"
-SRCBRANCH =3D "v261-stable"
+SRCREV =3D "8cc40e0c5e9234bf45084751ac53b1fbfe70b492"
+SRCBRANCH =3D "v262-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH};tag=3Dv${PV}"
=20
 CVE_PRODUCT =3D "systemd"
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-de=
pendency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/000=
1-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index b83803aa08e..0b9eb4ac3cc 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependenc=
y-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependenc=
y-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From 451af4755f0c1da552498682d910f4f4c5209639 Mon Sep 17 00:00:00 2001
+From 4793a67d3d738520f0193a9edff491989e8d77bc Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time fo=
r
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  3 files changed, 7 insertions(+), 2 deletions(-)
=20
 diff --git a/units/meson.build b/units/meson.build
-index 27d8ef2f72..864caa44bb 100644
+index 9f8f8d0e41..9a74236690 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -168,7 +168,6 @@ units =3D [
+@@ -172,7 +172,6 @@ units =3D [
          {
            'file' : 'proc-sys-fs-binfmt_misc.automount',
            'conditions' : ['ENABLE_BINFMT'],
@@ -36,7 +36,7 @@ index 27d8ef2f72..864caa44bb 100644
          },
          {
            'file' : 'proc-sys-fs-binfmt_misc.mount',
-@@ -279,7 +278,6 @@ units =3D [
+@@ -283,7 +282,6 @@ units =3D [
          {
            'file' : 'systemd-binfmt.service.in',
            'conditions' : ['ENABLE_BINFMT'],
diff --git a/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-ov=
erride.patch b/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-=
override.patch
deleted file mode 100644
index d11a5fe3f82..00000000000
--- a/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-override.=
patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 6a131b32e0fe948e845ae4bf41f8fed003ec30ce Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Tue, 22 Sep 2026 01:55:01 +0900
-Subject: [PATCH] include: fix limits.h override
-
-This is especially necessary since GCC 16.x.
-
-=3D=3D=3D=3D=3D
-$ gcc --version
-gcc (GCC) 16.2.1 20260819 (Red Hat 16.2.1-2)
-Copyright (C) 2026 Free Software Foundation, Inc.
-This is free software; see the source for copying conditions.  There is NO
-warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.
-=3D=3D=3D=3D=3D
-
-Without this change, /usr/include/limits.h is not included, hence POSIX
-constants are not defined:
-=3D=3D=3D=3D=3D
-$ echo '#include <limits.h>' | gcc -E -H -isystem ~/git/systemd/src/includ=
e/musl - 2>&1 >/dev/null | grep '^\..*limit'
-. /home/watanabe/git/systemd/src/include/musl/limits.h
-.. /usr/lib/gcc/x86_64-redhat-linux/16/include/limits.h
-... /usr/lib/gcc/x86_64-redhat-linux/16/include/syslimits.h
-=3D=3D=3D=3D=3D
-
-With this change, /usr/include/limits.h is included, thus POSIX
-constants are defined:
-=3D=3D=3D=3D=3D
-$ echo '#include <limits.h>' | gcc -E -H -isystem ~/git/systemd/src/includ=
e/musl - 2>&1 >/dev/null | grep '^\..*limit'
-. /home/watanabe/git/systemd/src/include/musl/limits.h
-.. /usr/lib/gcc/x86_64-redhat-linux/16/include/limits.h
-... /usr/include/limits.h
-...... /usr/include/linux/limits.h
-.. /usr/lib/gcc/x86_64-redhat-linux/16/include/limits.h
-=3D=3D=3D=3D=3D
-
-Replaces #43824.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/43831]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/include/musl/limits.h | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/src/include/musl/limits.h b/src/include/musl/limits.h
-index 9620a3b0ac..bcc585be2c 100644
---- a/src/include/musl/limits.h
-+++ b/src/include/musl/limits.h
-@@ -1,6 +1,26 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- #pragma once
-=20
-+/* GCC introduces a spurious, tricky inclusion cycle:
-+ *    GCC's limits.h
-+ *      -> GCC's syslimits.h
-+ *         -> GCC's limits.h (again!!!)
-+ *            -> glibc/musl's limits.h
-+ *               -> define POSIX defines
-+ *      -> define ISO C defines
-+ * This works only when GCC's limits.h is included first, but a user over=
ride breaks the cycle. Hence, we
-+ * need to manually achieve the cycle here. If GCC is not used (e.g., Cla=
ng), then including the compiler's
-+ * limits.h twice should be redundant but harmless. */
-+
-+/* First, get the POSIX defines from glibc/musl's limits.h. When the two =
macros below are defined, GCC's
-+ * limits.h includes the next limits.h, that is, one from glibc/musl. */
-+#define _GCC_LIMITS_H_
-+#define _GCC_NEXT_LIMITS_H
-+#include_next <limits.h>        /* IWYU pragma: export */
-+#undef _GCC_NEXT_LIMITS_H
-+#undef _GCC_LIMITS_H_
-+
-+/* Next, get the ISO C defines from GCC's limits.h. */
- #include_next <limits.h>        /* IWYU pragma: export */
-=20
- #include <assert.h>
diff --git a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-R=
EADME.patch b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-=
README.patch
index 175ec7955bd..c64bfa82491 100644
--- a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch
+++ b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch
@@ -1,4 +1,4 @@
-From 0d4a5976056387ff3801fdb7f53e6d0760df0475 Mon Sep 17 00:00:00 2001
+From e36f6fc852f8331791f391a216885b9bea543aff Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Tue, 21 Jan 2025 05:02:00 +0100
 Subject: [PATCH] Do not create /var/log/README
diff --git a/meta/recipes-core/systemd/systemd_261.3.bb b/meta/recipes-core=
/systemd/systemd_262.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_261.3.bb
rename to meta/recipes-core/systemd/systemd_262.bb
index 0901736e7c9..2562c9ff3b9 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_262.bb
@@ -36,7 +36,6 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-Do-not-create-var-log-README.patch \
-           file://0001-include-fix-limits.h-override.patch \
            "
=20
 PAM_PLUGINS =3D " \
@@ -144,7 +143,6 @@ PACKAGECONFIG[journal-color] =3D ",,,less"
 PACKAGECONFIG[journal-upload] =3D "-Dlibcurl=3Denabled,-Dlibcurl=3Ddisable=
d,curl"
 PACKAGECONFIG[kmod] =3D "-Dkmod=3Denabled,-Dkmod=3Ddisabled,kmod,libkmod"
 PACKAGECONFIG[ldconfig] =3D "-Dldconfig=3Dtrue,-Dldconfig=3Dfalse,,ldconfi=
g"
-PACKAGECONFIG[libidn] =3D "-Dlibidn=3Denabled,-Dlibidn=3Ddisabled,libidn"
 PACKAGECONFIG[libidn2] =3D "-Dlibidn2=3Denabled,-Dlibidn2=3Ddisabled,libid=
n2"
 # Link udev shared with systemd helper library.
 # If enabled the udev package depends on the systemd package (which has th=
e needed shared library).
@@ -799,6 +797,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
                ${nonarch_libdir}/udev/rules.d/60-persistent-alsa.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-hidraw.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-input.rules \
+               ${nonarch_libdir}/udev/rules.d/60-persistent-media-controll=
er.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage.rules =
\
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage-mtd.ru=
les \
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage-tape.r=
ules \

