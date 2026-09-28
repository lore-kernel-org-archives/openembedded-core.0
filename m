Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42E5CA5FA9
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 11:40:10 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55337.1790595604195884966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 04:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xHhCCksW;
 spf=pass (domain: est.tech, ip: 52.101.84.67, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNkQ78ZTW1TMQl2hvzIlo48L0l6Zqh/rTXhSnMcvkC2f0ty+ISSnrmYxUL+/WxSdCvCzqd5fBSmJ1ihjca086OyZNohmT5tXL/tRl5hRgblzMMliDDdUmv5vzdw7aQfX4dGlrcwHO66CCdWuMhIbMsnn9tPscuf2T8AFbsIX0IO2sYpRo9xkH3K3VrHn4fOpwcONKdnAF4qCUiqHZ4DSRWYthm6qF0q2gjZX5CTJ2uzei8B7aGbxyxWDU7gXrVvb32G0Sv6PzXimtIYqO9DGPC70ypy0VFzXMZEtkD4PAD85pKQyuTPUGrqMSKPqQc3fOHVdJTGdP5gQz+HXiSqakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30Lsel5YlgTXe1OBRfot3pHMsIq48vOSWzR0rKfo26s=;
 b=Ma77pFAYWZ6acDMPhCLTrj7Z/Jg8f6nw8OpHtdBXngDXtTJyWd97fJbHt0B3wp5YCKf7NAWRLG+TzG6cYWeanCYFRwRzBjWbP3gZ1fzty4gRL6ni2aKHJKyBNIT62QJqaHTvflYV3xW34F7jNw2kHV614AWGr7uaCd4WlKNxsJ3Dq25uOwf+OfpdNILrKbS025pYJVQFFl8Ve22v894HD6Dz4tcJGOx30eK0gasuFKDrgFulfqBGDzk/ZFxmBLsQRoXOJ7zLG9mgXiBOnyqg2TwWVxZUbNObCQwBfRK6XAkNXSYEJ32yih/LURtX8DetZ6AxB0SRhf9ZWVBmlNsp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30Lsel5YlgTXe1OBRfot3pHMsIq48vOSWzR0rKfo26s=;
 b=xHhCCksWXkGeAWTE21DfFmg7y+u1WRVxB0qi82JBW7SzXc2bP69NTEWZyAZdgfj/RDtwagsNm5Hbq5OMj2twh2uRZOHMa1855RG45lImpNOb5dtAWvf6nyD3UzP64xS5DtwBPx7JnbyImX8JUbyzqGurh5ZeLf6BTazc8uF/T+Ubt1ltV4Sv9TkWbsvCNU1p7t8Bhc/GPTjKuj93NIfE/gps7lOer0/hJl9PNRRpvJGdZ19DrDQeIwHgO9yZfmuP9iZ4c3CB8aQEwwSmCFJ92VQ7ZJ3xPz8tgdHnD2qudIotepXcmrBwxpiEp8Ex+gCMTRw3nT/BNRR1WdKKjqflUQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VE1P189MB1053.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:162::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 11:39:59 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 11:39:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] systemd: Upgrade 261.3 -> 262
Date: Mon, 28 Sep 2026 13:39:54 +0200
Message-ID: <20260928113956.42485-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260928113956.42485-1-jaipaul.cheernam@est.tech>
References: <20260928113956.42485-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0381.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VE1P189MB1053:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b06402-7c81-4ba4-9937-08df1d5539c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|260925022911599003|260925021911599003|260925021311599003|3023799007|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	+1w1glmwmVWGzuhB8uvjtUoM5G9aOBATVi0BxC5P0oflIDk6vQ20vRH+8/p3BCexYzS973EeUg2zD4mWZncX5MhrS6+BCCiUhOnrWc+FLD6oBSOZYyZmrtld24Iben0sP8XU7eVuYJFlf5vJ57H6Xn7a7PFjT9WeAdqfo3IzXmYG1zFJzW8C9x5Qh6ZN54bYO1pfPXmg67mCONaDQjps4Tjrn1OfJP5ZNHXKDzMnl+KAD1dthXGBy3u9slX1XyjTrhdr6vVzNv8HNQ9mSK2QvpYDk1qumKifd4v1qUcAZrgYmMFo6/zkYNCJrJ042+zZD31Vucb8q6OYltfNQGy5E2dbSD1//cergnS0gk29RWmO9y7eYPphDTfoc8w59HbRrQkFJ/sPlCGduVe9wq5dco7iUBB1C6uYP/IJXXjJfoB6nqEYQxKa+RgmqMOcgGn8RLA9Yv7NGXNS5vH4nmxbScu6X7Qb+bGU5s1pKSzGuhVCEzgRTNnvdWijJszr/BbAQqKoTjbU+pUo37MHOVjEaCiTyqhDq6rV6rhZPFunD/vQTqkAhn+u/gISJ1FTiUa9yvnYPyjfXVMro04H0QnElkgpGd8Gw7tIuCFtn4Urx2vG2Vz9/yBbzztPB6ActJ3lcJ1Ikw1uhDpPDYSbvutExozdQussJFmAXsjHORwgb44=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(3023799007)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vMzAqRjrqbrFBO9Uu0VdKzwQWaGubhOlfo+et6vMRTszqkydNnEc69494vtQ?=
 =?us-ascii?Q?KZToUhkpsfRSqHCg0ADoF+M/v+itsRSyQDDLoiFNv2NMVHR6D9bRS08fMkew?=
 =?us-ascii?Q?9DMmZ/BxwD9FZ9Qpb/6pKFP18I+NKUjgx2TRICDj5SOFpss3W8E8hqkBu0KM?=
 =?us-ascii?Q?1njtaEKiPWRW/D8ySFNKeTZo/s93kAiFJmpSNGJQ1oTB2QDLxeopb6AKa9SR?=
 =?us-ascii?Q?UDGWNyu4wSkXdRhsk0oXYsxHimMPzROo+70Gz8+pYh6Clwmb825cUsRH5Npk?=
 =?us-ascii?Q?bpM2xVyI4+hvAXqvS3of6SvbtTlI3Rz8Qmn3lCpNFIJfqoTIEKq0aY/1Eoik?=
 =?us-ascii?Q?Ck7UOKxBxcJ5upNUpsR1OFcHAMX2R65CiPhwS9ahmTMiCxqudC8BL6u6uUYc?=
 =?us-ascii?Q?AcaRGixkhMP2ZSHyOi4Veaa5nxSpythnh5Qn8BVOxRPwFWsjJhjc5o+YFaEs?=
 =?us-ascii?Q?vvRup0h0xj5gPqoKxzDvRmiC602VJfpAGxI4hJZWXYidQMEsfT/EqJ+RM7uL?=
 =?us-ascii?Q?7CEsQhHKwt/KCcpBzr6htenpJ0+MxgQfE4TqIfXX7SkkKPAR11ms7rHsqwnP?=
 =?us-ascii?Q?RAPCNBliK77OS8cGi77a15EbobKexm9mkknN8ayEI7GJlzOA2aDZm5LUGBsJ?=
 =?us-ascii?Q?8TTPq8cX+MSLQ4jGj2PJ4fZUGQHq5n/UaImrdhIOWCZVlodRyiHUrZ8E5IZH?=
 =?us-ascii?Q?rc78bqLPG16yIbQhHDoVMmIotsB99I98qFRro4LWTZrlHhoWHDpmWvR6yU53?=
 =?us-ascii?Q?7neSZP/zu+tRjreLsRbeuzHiVQXqYCNVHn3JNcuaB1ciFJJJziacOPL3HsOo?=
 =?us-ascii?Q?mtK6WNXAPWT0Gd8YspQ/6V32CvqFZWrvTIrlpMbYAjwfsgjE3LhLw4zTNE8U?=
 =?us-ascii?Q?7d1KlC7jF0vILvRcCCqo6xmlYk7rKoVySSWVk64Vnd1ZHhgLPnrbQFCW70gr?=
 =?us-ascii?Q?UQcTJOtn1Yw5kD4z1iDKQT3p9JOLVbXm5zLw9+Kyo0JrVVJq4ifqAT8D+LmK?=
 =?us-ascii?Q?0LrIsY/kcJQsnMEsHqFJEvmNE62pU9LPczA7r1NVusqijccHKohfa8KQazLw?=
 =?us-ascii?Q?Gymjq400AyBpEFWAmV9PWueX5DyTUO+T/YfW76zitpVRuSdIvlBNTPl4Dvf9?=
 =?us-ascii?Q?so9NvLOmtUNYM1uTmnbql2JkBHHFyJb/Oznguih8zo1AV8OmwYZb7YvanQnX?=
 =?us-ascii?Q?cdUyfjTvccFJqLJ7HOXa95C302y+KXp+42WP3/Chtstm7MtHZzEFPWzWQY2Y?=
 =?us-ascii?Q?ZC6xYRXhO+SS7aWfTipj3VJ2tbLBoxzXHmSJNaKZDillKz+To8/pQJXMYkXd?=
 =?us-ascii?Q?/cMUKGbWLv3NANoRgenK7yGj/1lTSeIuyGqoWzg1GV4CTTM8JpTMK7IH3eG4?=
 =?us-ascii?Q?JDotzcsP75dkAqyXGbwQxf36UkudSSvctjsUj01+SCDdQOpd8SUzD+yflRW8?=
 =?us-ascii?Q?t4Ctg5zbrTf9IwcS7XpM1oG7sgB6Nmhb8AvLwOhGo9zSe9wHX/AZov67ljml?=
 =?us-ascii?Q?S4LkPKBYzMHF9unPrphZx20jBEDfaaK1urREbtEmAG7sQIbkIoOIvbaFhwmT?=
 =?us-ascii?Q?VIPd/9m3e5mT0gf/izN/XXRVBjiLm2tUEFjXqSrPDrpSUCOh94+c3IZfdUw7?=
 =?us-ascii?Q?0znMYJmjP91ebkP77C5u194S7754IroMKcM7nGve1Iggs2QqE5ZcV7uy4n/C?=
 =?us-ascii?Q?dR6r7AQpts8u8im/5C6/bjVpsn0IH/Iw+ba4YXq5ovJlTzuI62IG2nmErxsg?=
 =?us-ascii?Q?lKiGiR3uww=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b06402-7c81-4ba4-9937-08df1d5539c6
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:39:58.9884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYLcZu/exy5OL1lR6ejE7eT2jk+65lDMVqnKbr6TzP9LxZYskvpQnqEeqL2ZaG9lxHtSMY6LZDo7T9R2+uQ2U6LqTnKnq6AmgePMrTQP+3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 11:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246755

NEWS: https://github.com/systemd/systemd/blob/v262-stable/NEWS#L3-L877

- Refresh patches for 262
- Cleanup deprecated meson build options [1]
- rules: install 60-persistent-media-controller.rules [2]

[1] https://github.com/systemd/systemd/blob/v262-stable/NEWS#L41
[2] https://github.com/systemd/systemd/commit/d153b49473

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...md-boot-native_261.3.bb =3D> systemd-boot-native_262.bb} | 0
 .../{systemd-boot_261.3.bb =3D> systemd-boot_262.bb}        | 0
 ...-tools-native_261.3.bb =3D> systemd-tools-native_262.bb} | 3 ---
 meta/recipes-core/systemd/systemd.inc                     | 4 ++--
 ...mt-Don-t-install-dependency-links-at-install-tim.patch | 8 ++++----
 .../systemd/0003-Do-not-create-var-log-README.patch       | 2 +-
 .../systemd/{systemd_261.3.bb =3D> systemd_262.bb}          | 2 +-
 7 files changed, 8 insertions(+), 11 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_261.3.bb =3D> system=
d-boot-native_262.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_261.3.bb =3D> systemd-boot_=
262.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_261.3.bb =3D> syste=
md-tools-native_262.bb} (93%)
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
index 1a256a598a8..2562c9ff3b9 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_262.bb
@@ -143,7 +143,6 @@ PACKAGECONFIG[journal-color] =3D ",,,less"
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
@@ -798,6 +797,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
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

