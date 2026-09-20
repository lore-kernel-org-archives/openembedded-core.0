Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EADEC982D0
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 08:27:07 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26156.1789892819771191521
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 01:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Fo+9UXk7;
 spf=pass (domain: est.tech, ip: 40.107.162.9, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjXDQQ3mLKo17XiXdheULj4OJeNvRSHNJbENTr3Y+xZGgTOKI0uyHQjf5FBumHIs0Cw6xVWD+a7kEYo17gdQWyaBa8cS/AfeeB/AB1yVP6t374/zs33T5O3Wyy5zJqHxA7Jy2Jed+lJT+aAgCrMF/fH9lelYiGKVUJnJ5gd0V8+I9tRtHZWwosle9A/K4ZYo+g0ZLIVasMYP3fZgLrq1SjfmNwUu9mAD3ID1pTxI30jbA+Z4L0EmlX/ARTNz1kDuGonotwkDH6q2x+s3F6fXKDroOA8Dik3Aa88SOmi1SK796WZiwEOwKKJ4nCSQVFZcUwqL/cDL9qh13qdcgEdfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1mPA4xIDC8w48OtQwuGiYRBT9MPCItHr54Oe+2VOIY=;
 b=SLjge5OCB4iP5B+DOi0kYNvLb4FLFJDl0aJQ6iJ6zXtBf6IjRV5DXyL8b59mqio/lZ4NXJTn+hCgLk2yrMU5AHDyLLNvtTrw4D9jTvvUk/WH4MtAcxciOsGG5dOYhfHZxscR/fVCp8tRvodoTH3LkLzHGgpKzq/55qGV59kW2t7i1Igw4jjdfHBKSYrs/Czb6Q+lfJBnc5gakD46XoHgxm2wccV8qUgUJVnziypIUBtwX6DL8GwYSfiga4/egafGJDHDX+GyTztMw7FuB8v0YXMHk663sbRIjcdgDKg1YPEVth5Zy1HZmQttblRsPrSIf1/Yf/xQNteTehGJX17GuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1mPA4xIDC8w48OtQwuGiYRBT9MPCItHr54Oe+2VOIY=;
 b=Fo+9UXk7rQXobhv0IwpabVdZghuyGs6w43fAzxCFWbdbXqHxZoOgYJRkXAhNbVxzZScehaVinI4pWGpm/0n5UoF20Uu6OKL38Pu3hV/uaRUyXsAeg1KG5pkTGgOcYR8u8VnxzLOjn4+n6fD9I3uRzx/JdBKhuCKTYga1I8/DU6XEDwbekhQzZ/BWkEsJSF0QTu/aKIK8SFobYFWVv3LcMNAFOz8ON0JH/JvV7CRB1ZZM8Ev622gJieaggklQnKbUQ3P17czRYMnPmyUdTUgHNvG59xBjuLUkDoR5MXn6VSb+PwkLRC9g/tJqMYHTFm1kLbsx5LeB4PnJz1+iNxBKug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by BESP189MB3347.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Sun, 20 Sep
 2026 08:26:54 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Sun, 20 Sep 2026
 08:26:54 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] systemtap: Upgrade 5.5 -> 5.6
Date: Sun, 20 Sep 2026 10:26:51 +0200
Message-ID: <20260920082651.97225-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260919140957.80166-1-jaipaul.cheernam@est.tech>
References: <20260919140957.80166-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P251CA0015.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|BESP189MB3347:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b34916d-a315-4ed5-711f-08df16f0ed2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	rCU2buE1bgrJfAXymv0QcQtTFnkdTzD8TGffhqgOsqN46Nzlrg5e4qVLGUXOKZ5PFGko+Jv9D0fp8VioqP/mybHRVVhur9paj1sT3atm9AayI6eO0bOiw/gRSWki/l0hjlzRA5rXLyHYd3LBVOdi6UzWMtTqHmSoVdvHqJs7mjnTsOOTcFMwjlow3D/6/85nY1dC2oG0Gvucugk63kpR+Y7Ed6qZXTRJGBiWnUHAg9FqxPoqbQuuWla2UAvcGdZL1TSwSM4PCVfwysWmqcv2nBFfnYZpHKyUgISDq08/iW0l2pf2mvP1rxHkxEkuhpy2XBMOPNw2SewLk433GoZ3j7F8n1nstNYbFr8C4wJKVHYHxSu4nUXQAFRNR1W7N7+mBbWW7n4mtDv80mjeAoosdU8ix3WlCWZyLrF4+X4gNODFDPRdlQRJKPM5i0IcDB3m9jNjvYQq3HwInGWleQWY31vxzC7XE3nIEoV7khBTmVgmU0j6j2fk7ENw4bnqxWvAOm8AL+oiLnUHJwc4I99zRZWx4AreN0wMK2RVntz4f7DreHmlUK7a4t9oxSU5OXuaeNP3rru8XZo3GykQK+Q7fbemRbqBbe9m2tlzbc6Lucc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jJsqTipVxhAeePBI6j4s2Prk4Jta+0eL8Q0Vlmo3pqvYK4/R3tELR+d2u7AS?=
 =?us-ascii?Q?5Bu5II8t5fuvOi2ZLclroyYNXCc334C50HekYRX9k8scfWa2zfTWQlBlsWZd?=
 =?us-ascii?Q?TWR4VW9iDF/2fQIrKPrRCinRzNjM1q0ZtoYpo5OkWW9X8tB4RYggUYuH+RMm?=
 =?us-ascii?Q?jHvoLDCTO1jY86R4f4JhFpYud3tM8zlmF6XmXZg8t9M0K6Wk/OIf0ElazuxX?=
 =?us-ascii?Q?u+n17WJj78zfJlBVhewMtLY269p8A5GmwA8PpeSlTq6qnKJL5OOW/aPdBAhc?=
 =?us-ascii?Q?3YWEvAoG/nGLoVskOnZLg5tUiQ4wvIaOtJyBLhIzCl+wMWjlaGcCBMM3OU3L?=
 =?us-ascii?Q?tT4Ad0We9BkNKLSJAI/sDGcQunejECVD8PyfvVu4IUke6Jusdhnw3IY1OtaH?=
 =?us-ascii?Q?xRswky0lfRAFZ2p6UPNe/m7DXmf8XnPGKpOkG/HojHI2NLMBBO+1czHMp1um?=
 =?us-ascii?Q?IZ+s31xkqIp+dnrWhZHAZblQ12Jf1FhLLcZy8yxsilLQMnkxrAEYEp2VG6Qf?=
 =?us-ascii?Q?ooq77xfJR20L6fl82JHLl4IR+as1oZlJ5He3Tr/WXjD/ABIawkqhEZFjODQw?=
 =?us-ascii?Q?wT9eklnMng07oTvhKyQ1UgwAUOHmb1Eh5t7xiJjEvDn5FutcWwQY25unKKXQ?=
 =?us-ascii?Q?gTv6DfE33tko4BcBODr1l/+EdzfFbbdomp0skORHA1UK0/0tmWLZKIs6Zern?=
 =?us-ascii?Q?zfP2XkyiMq9yTNjchBEM/JVksnsQpgau23OaAZV44h6ANxKCVO42M4DNsHSa?=
 =?us-ascii?Q?LcchC2YTJ+UUviRQPNmA4h95ZCA4ZXKHAGHOzwt1oVi5wV3QOyLVXsMPtISA?=
 =?us-ascii?Q?CIsB/O9a9AEIY86uKIDDu583DWw+GuqQB7NJDhVGzEmQwepc/sIwwsuDTtvN?=
 =?us-ascii?Q?HpSjpbxwJkG1XtGD43RZ+xDgO9eOtZvJ+3PBYhPAcZH5xlAqaC7Pc+Urlgof?=
 =?us-ascii?Q?C/K8S/VPb+TPKk0sJLUJ2AS7gozTaYXuuAeGgyezybxmDY9Tfaj7Yr3LgpTS?=
 =?us-ascii?Q?3BUdpEB2GbGUmP4mQjb7rOB5xxPeO/QWSkvezWsa1UKIzd9gd/q2usbR2i1K?=
 =?us-ascii?Q?w/1RZbsOQoPALeozD7hFoRwsO8N9Uv18NHrHRvFVsSZpaD9i0Y5XFjDjNJhE?=
 =?us-ascii?Q?2DiIPVX997ZCw+IuiY/Pu9IL/GrUQHy+3gF7Di9Aq/xCtTnMj6S78vs2DRLj?=
 =?us-ascii?Q?ctAvquDZ7EiJEqJ/fzobofRcSHUpH0AjMyCz5Z0v2SgTiVzih8RPQhKbdUbS?=
 =?us-ascii?Q?h8qA70l2bkmpUCoyG1o2/qhuc0z9iV8RJtuWaHHOWtWjQ2FVVA0JBBBVpksk?=
 =?us-ascii?Q?AV31WYFEqKoXaGg6PFXoXgZAqRYULN6xAHOpBTVxqQUBt2juE04Iwea1RcIz?=
 =?us-ascii?Q?QaWRT9STrdNf1rFXMuxTAqJtvlHhvfNiUOcVvQe1kQgOARZ6o57g7BmC+agO?=
 =?us-ascii?Q?T8f39sfI6bb7SojGYwk5k+a7tXHQZJfTDa9n68Hs33eb0o6SsrlsLMJ725QH?=
 =?us-ascii?Q?beHp3QEQSwBepxUXLFDPxuduQpH4II3TWNCQHBXTiVk/u4R23lVTpoESqPl1?=
 =?us-ascii?Q?8b1HfRBuj5c8WkXtAygYf/nm8DE4zSoRo2CuAh7ayZujJgr5IjCaQ09HTv/i?=
 =?us-ascii?Q?LMEN+5QRs5B/PWKgGLEO9LEj5e472hZFouYrZ9p0eOuvWZGq+MZzehTffnt5?=
 =?us-ascii?Q?BzMkzD9ln1ItMLCcCCi0/5KgkYflFdkRPGSM7FRU7Vl67DjQ6gWuK53vGyxL?=
 =?us-ascii?Q?JE7S+j8e/o4qRvVswk3t33Gg8gRvn3I=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b34916d-a315-4ed5-711f-08df16f0ed2e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 08:26:53.9100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXKaXZ4HBm7xjODQjg6lYXTaHsU9lb80Zj15T1/BS7T7ZBKDZ1TyzWYQKlvexIzyoS/B3Bp1g/6ObTgS75ImVrMXm6f3Vj4IyEEexolVnl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3347
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 08:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246260

NEWS: https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dblob;f=3DNEWS;hb=3D=
release-5.6

- Clean up python2 support in recipe and clean up obsoloute patch
  More details [1], [2]

- Added pip/wheel native to the python3-probes PACKAGECONFIG =E2=80=94 the =
new build uses pip/wheel

- Added two patches to keep do_package_qa passing and the packages
  reproducible. The generated tapset/python3.stpm recorded the
  recipe-sysroot path of libpython, since it comes from sysconfig's LIBDIR
  and python3targetconfig points that at ${STAGING_LIBDIR}; @cast module
  names are resolved verbatim with no --sysroot translation, so that path
  also made python3 probes unresolvable on the target. The pip-installed
  HelperSDT module shipped __pycache__/*.pyc naming ${D} and a
  dist-info/direct_url.json naming the wheel in ${B}, both artifacts of
  "pip install --root"; direct_url.json's entry in dist-info/RECORD goes
  too, since its sha256 covers that build path and kept RECORD varying
  between builds. Reported upstream as PR34652 [3], patches posted to the
  systemtap list [4].

[1] https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dcommit;h=3D3c9c8a8163=
e0a9c77bf9a3a7f87ceaf2d3de98b5
[2] https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dcommit;h=3D55a0168613=
e765f6be5257b0c4fb97678292716f
[3] https://sourceware.org/bugzilla/show_bug.cgi?id=3D34652
[4] https://inbox.sourceware.org/systemtap/20260919135744.78642-1-jaipaul.c=
heernam@est.tech/

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
v2: update 0002-python-don-t-install-build-paths-with-the-wheel.patch to
    drop the direct_url.json line from dist-info/RECORD as well.  v1 left
    an entry whose sha256 covers the deleted file, and so the build path
    inside it, leaving systemtap-python unreproducible; the autobuilder
    caught helpersdt-0.1.0.dist-info/RECORD differing between the two
    builds:
    https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/5022
    No other change; 0001 is unmodified.

 ...-native_5.5.bb =3D> systemtap-native_5.6.bb} |  0
 ...gure-write-a-python-location-into-th.patch |  2 +-
 ...ython-modules-to-correct-library-dir.patch | 53 ----------------
 ...rove-reproducibility-for-c-compiling.patch |  2 +-
 ...-record-the-installed-libpython-path.patch | 58 ++++++++++++++++++
 ...staprun-address-ncurses-6.3-failures.patch |  2 +-
 ...-don-t-support-installing-a-non-root.patch |  6 +-
 ...t-install-build-paths-with-the-wheel.patch | 61 +++++++++++++++++++
 .../systemtap/systemtap/readline.patch        |  6 +-
 .../{systemtap_5.5.bb =3D> systemtap_5.6.bb}    |  6 +-
 .../systemtap/systemtap_git.inc               |  3 +-
 11 files changed, 133 insertions(+), 66 deletions(-)
 rename meta/recipes-kernel/systemtap/{systemtap-native_5.5.bb =3D> systemt=
ap-native_5.6.bb} (100%)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Install-py=
thon-modules-to-correct-library-dir.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-python3.st=
pm-record-the-installed-libpython-path.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0002-python-don=
-t-install-build-paths-with-the-wheel.patch
 rename meta/recipes-kernel/systemtap/{systemtap_5.5.bb =3D> systemtap_5.6.=
bb} (94%)

diff --git a/meta/recipes-kernel/systemtap/systemtap-native_5.5.bb b/meta/r=
ecipes-kernel/systemtap/systemtap-native_5.6.bb
similarity index 100%
rename from meta/recipes-kernel/systemtap/systemtap-native_5.5.bb
rename to meta/recipes-kernel/systemtap/systemtap-native_5.6.bb
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-config=
ure-write-a-python-location-into-th.patch b/meta/recipes-kernel/systemtap/s=
ystemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
index 8a6cc4e0a4..392950631e 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-wri=
te-a-python-location-into-th.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-wri=
te-a-python-location-into-th.patch
@@ -1,4 +1,4 @@
-From adf505ededdd25cf43111fd12a59090a8f7de856 Mon Sep 17 00:00:00 2001
+From cba033a67d6d977cb5fa3862c4d3daa2eede08ba Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 22 Feb 2017 13:37:33 +0200
 Subject: [PATCH] Do not let configure write a python location into the dtr=
ace
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-mo=
dules-to-correct-library-dir.patch b/meta/recipes-kernel/systemtap/systemta=
p/0001-Install-python-modules-to-correct-library-dir.patch
deleted file mode 100644
index 6a3fa04bea..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-t=
o-correct-library-dir.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From a261ee9efca120b6d65310a972d91dffc00ac937 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 24 Feb 2017 17:53:02 +0200
-Subject: [PATCH] Install python modules to correct library dir.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
-Add OE's CFLAGS which contains `-fdebug-prefix-map' options to
-setup.py
-
-Supply "--root" directory to the "install" command, and use
-it as a prefix to strip off the purported filename encoded
-in bytecode files. (It strips build path prefix from .pyc files)
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- python/Makefile.am | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 845db3661..130e90b24 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -8,6 +8,10 @@ AUTOMAKE_OPTIONS =3D subdir-objects
- AM_CPPFLAGS =3D -I$(abs_srcdir)/../includes
- AM_CPPFLAGS +=3D -I$(abs_builddir)/../includes/sys
-=20
-+# Add OE's CFLAGS which contains `-fdebug-prefix-map' options to
-+# fix build path issue
-+AM_CPPFLAGS +=3D $(CFLAGS)
-+
- # Any script in the following variable will get byte-compiled at
- # install time.
- pkglibexecpython_PYTHON =3D
-@@ -47,7 +51,7 @@ install-exec-local:
- if HAVE_PYTHON2_PROBES
- 	(cd $(srcdir); CFLAGS=3D"$(CFLAGS) $(AM_CPPFLAGS)" $(PYTHON) setup.py bu=
ild \
-          --build-base $(shell readlink -f $(builddir))/py2build \
--	 install --prefix $(DESTDIR)$(prefix) \
-+	 install --root $(DESTDIR) --prefix $(prefix) --prefix $(prefix) --insta=
ll-lib=3D${pythondir} \
- 	 --single-version-externally-managed \
- 	 --record $(shell readlink -f $(builddir))/py2build/install_files.txt \
-          --verbose)
-@@ -55,7 +59,7 @@ endif
- if HAVE_PYTHON3_PROBES
- 	(cd $(srcdir); CFLAGS=3D"$(CFLAGS) $(AM_CPPFLAGS)" $(PYTHON3) setup.py b=
uild \
-          --build-base $(shell readlink -f $(builddir))/py3build \
--	 install --prefix $(DESTDIR)$(prefix) \
-+	 install --root $(DESTDIR) --prefix $(prefix) --install-lib=3D${python3d=
ir} \
- 	 --single-version-externally-managed \
- 	 --record $(shell readlink -f $(builddir))/py3build/install_files.txt \
-          --verbose)
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproduci=
bility-for-c-compiling.patch b/meta/recipes-kernel/systemtap/systemtap/0001=
-improve-reproducibility-for-c-compiling.patch
index 894cd3b407..970079ebcf 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-=
for-c-compiling.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-=
for-c-compiling.patch
@@ -1,4 +1,4 @@
-From 06522edad080caa76f5abc8586fe5baf3b620f16 Mon Sep 17 00:00:00 2001
+From e39dbf74b501632bc3e9761eb95894dc1c6b2d86 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 18 Jul 2018 16:58:33 +0800
 Subject: [PATCH] improve reproducibility for c++ compiling
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-python3.stpm-reco=
rd-the-installed-libpython-path.patch b/meta/recipes-kernel/systemtap/syste=
mtap/0001-python3.stpm-record-the-installed-libpython-path.patch
new file mode 100644
index 0000000000..93efec941b
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-python3.stpm-record-the-=
installed-libpython-path.patch
@@ -0,0 +1,58 @@
+From 0387b9416ad7c25d71685441e1046f1c72cb1d42 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Sat, 19 Sep 2026 13:12:44 +0000
+Subject: [PATCH 1/2] python3.stpm: record the installed libpython path
+
+tapset/python3.stpm is generated at build time and installed, and its
+stap_python3_libpython macro is the module argument of the @cast()s in
+tapset/python3.stp:
+
+    @cast(@object, "PyFrameObject", @stap_python3_libpython)
+
+@cast module names are taken literally -- dwarf_cast_expanding_visitor
+resolves them with find_executable(module, "", sess.sysenv), i.e. with no
+sysroot translation -- so the macro has to name libpython as it exists on
+the machine stap is tracing.
+
+configure instead derives it from sysconfig's LIBDIR for the interpreter
+that built HelperSDT.  When cross compiling that is a directory in the
+build host's staging area, which exists on no machine but the builder, so
+every python3 probe on the installed system fails to resolve
+PyFrameObject.  The installed file also ends up carrying a build
+directory, which distro QA checks reject (OpenEmbedded's buildpaths test
+flags it as a packaging error).
+
+Keep only the library soname from sysconfig and anchor it at the $(libdir)
+being installed into, so the macro names the installed library.  For a
+native build where the interpreter's LIBDIR is $(libdir) -- the usual case
+-- the generated value is unchanged.
+
+Upstream-Status: Submitted [https://inbox.sourceware.org/systemtap/2026091=
9135744.78642-2-jaipaul.cheernam@est.tech/]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ Makefile.am | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1f668df..4d255dd 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -140,9 +140,17 @@ $(TAPSET_PYTHON3_STP): $(srcdir)/$(TAPSET_PYTHON3_CAN=
DIDATE)
+ 	mkdir -p tapset # create build-tree tapset/ dir if needed
+ 	cp $< $@
+=20
++# The libpython path baked into python3.stpm is resolved at run time on t=
he
++# machine being probed, so it has to be the installed location.  configur=
e
++# gets PYTHON3_LIBPYTHON from sysconfig, whose LIBDIR points at the pytho=
n
++# build/staging area; when cross compiling that is a build host directory
++# which does not exist on the target.  Keep only the library soname from
++# sysconfig and anchor it at the $(libdir) we are installing against.
++PYTHON3_LIBPYTHON_INSTALLED =3D $(libdir)/$(notdir $(PYTHON3_LIBPYTHON))
++
+ $(TAPSET_PYTHON3_STPM):
+ 	mkdir -p tapset # create build-tree tapset/ dir if needed
+-	@echo '@define stap_python3_libpython %("$(PYTHON3_LIBPYTHON)" %)' > $@
++	@echo '@define stap_python3_libpython %("$(PYTHON3_LIBPYTHON_INSTALLED)"=
 %)' > $@
+=20
+ install: all
+ 	$(MAKE) $(AM_MAKEFLAGS) install-recursive
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-n=
curses-6.3-failures.patch b/meta/recipes-kernel/systemtap/systemtap/0001-st=
aprun-address-ncurses-6.3-failures.patch
index 59c0e8a7fd..e58053c864 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-=
6.3-failures.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-=
6.3-failures.patch
@@ -1,4 +1,4 @@
-From 7672d0e398b29a52f59a1a0cbb75d4d07bd5f975 Mon Sep 17 00:00:00 2001
+From 949a5670611b67f070c58423c9f88b8837aaf443 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 25 Oct 2021 17:59:24 +0200
 Subject: [PATCH] staprun: address ncurses 6.3 failures
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-d=
on-t-support-installing-a-non-root.patch b/meta/recipes-kernel/systemtap/sy=
stemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
index 8273e34b57..7bf723d5d3 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-su=
pport-installing-a-non-root.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-su=
pport-installing-a-non-root.patch
@@ -1,4 +1,4 @@
-From 3483d0bc400eb618add607097027eafb075722f4 Mon Sep 17 00:00:00 2001
+From f0150581619d331522a7f26fb24b445c4f305fa0 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Tue, 5 Sep 2017 16:02:55 -0700
 Subject: [PATCH] staprun/stapbpf: don't support installing a non-root
@@ -14,10 +14,10 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
  1 file changed, 6 insertions(+), 6 deletions(-)
=20
 diff --git a/stapbpf/Makefile.am b/stapbpf/Makefile.am
-index 4bd116bc3..e06d0801b 100644
+index 962b2dbec..ac24b7997 100644
 --- a/stapbpf/Makefile.am
 +++ b/stapbpf/Makefile.am
-@@ -40,10 +40,10 @@ git_version.stamp ../git_version.h:
+@@ -56,10 +56,10 @@ git_version.stamp ../git_version.h:
 =20
  # Why the "id -u" condition?  This way, an unprivileged user can run
  # make install, and have "sudo stap ...." or "sudo stapbpf ...." work lat=
er.
diff --git a/meta/recipes-kernel/systemtap/systemtap/0002-python-don-t-inst=
all-build-paths-with-the-wheel.patch b/meta/recipes-kernel/systemtap/system=
tap/0002-python-don-t-install-build-paths-with-the-wheel.patch
new file mode 100644
index 0000000000..146f0a456f
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0002-python-don-t-install-bui=
ld-paths-with-the-wheel.patch
@@ -0,0 +1,61 @@
+From 3f34320eb37bb583b7bbcec01347a52527991391 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Sun, 20 Sep 2026 08:12:00 +0000
+Subject: [PATCH 2/2] python: don't install build paths with the wheel
+
+pip byte-compiles the module it installs using the paths it writes to, so
+with DESTDIR set every .pyc in HelperSDT/__pycache__ records a
+$(DESTDIR)-prefixed source file name, and PEP 610 direct_url.json records
+the file:// URL of the wheel in the build tree.  Neither names anything
+that exists on the installed system, and both make the install
+unreproducible; distro QA checks reject them (OpenEmbedded's buildpaths
+test fails the build on all four files).
+
+Pass --no-compile, so the bytecode is generated on first import in the
+right place, and delete direct_url.json after installing.  Its line in
+RECORD has to go as well: the line holds a sha256 of the file, and thus of
+the build directory the wheel sat in, so leaving it in place keeps RECORD
+differing between two builds of the same source in different directories
+-- and describes a file that is no longer installed.
+
+Upstream-Status: Submitted [https://inbox.sourceware.org/systemtap/2026091=
9135744.78642-3-jaipaul.cheernam@est.tech/]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ python/Makefile.am | 19 ++++++++++++++++++-
+ 1 file changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 0cb608d..ebd1465 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -36,12 +36,29 @@ endif
+=20
+=20
+ # Note that we're installing from the wheel we just built.
++#
++# --no-compile: pip byte-compiles with the paths it writes to, so with
++# DESTDIR set the .pyc files record $(DESTDIR)-prefixed source names, whi=
ch
++# are wrong on the installed system (and defeat reproducible builds).  Th=
e
++# bytecode is regenerated on first import instead.
++#
++# PEP 610 direct_url.json records the file:// URL of the wheel in the bui=
ld
++# tree, which is likewise meaningless once installed.  Delete it, and dro=
p
++# its line from RECORD too: that line holds a hash of the file, and so of
++# the build directory, which would keep RECORD varying between builds and
++# would describe a file that is not installed.
+ install-exec-local:
+ if HAVE_PYTHON3_PROBES
+ 	$(PYTHON3) -m pip install $(shell readlink -f $(builddir))/py3build/*.wh=
l \
+ 		 $(if $(DESTDIR),--root $(DESTDIR)) --prefix $(prefix) \
+-		 --no-deps --no-index --no-build-isolation \
++		 --no-deps --no-index --no-build-isolation --no-compile \
+ 		 --ignore-installed --verbose
++	rm -f $(DESTDIR)$(python3dir)/*.dist-info/direct_url.json
++	for r in $(DESTDIR)$(python3dir)/*.dist-info/RECORD; do \
++	  if test -f "$$r"; then \
++	    sed -i '\|/direct_url\.json,|d' "$$r"; \
++	  fi; \
++	done
+ endif
+=20
+ clean-local:
diff --git a/meta/recipes-kernel/systemtap/systemtap/readline.patch b/meta/=
recipes-kernel/systemtap/systemtap/readline.patch
index f452188179..f59f5bcb7f 100644
--- a/meta/recipes-kernel/systemtap/systemtap/readline.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/readline.patch
@@ -1,4 +1,4 @@
-From ee20cb1c1ca0337c56087934efbd66ba30d2d5c3 Mon Sep 17 00:00:00 2001
+From 6bd6439042b9fc1155568e8a476257925424b7cb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 13 Apr 2026 11:28:39 +0100
 Subject: [PATCH] configure: add option to enable/disable readline
@@ -18,10 +18,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 38 insertions(+), 29 deletions(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 6fb99da40..2ec72e85a 100644
+index 5bfc86f92..c1835ea51 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -525,38 +525,47 @@ AC_CHECK_HEADERS([rpm/rpmcrypto.h], [
+@@ -526,38 +526,47 @@ AC_CHECK_HEADERS([rpm/rpmcrypto.h], [
                        have_rpmcrypto_h=3Dyes
  		      AC_MSG_NOTICE([separate rpm/rpmcrypto.h])])
 =20
diff --git a/meta/recipes-kernel/systemtap/systemtap_5.5.bb b/meta/recipes-=
kernel/systemtap/systemtap_5.6.bb
similarity index 94%
rename from meta/recipes-kernel/systemtap/systemtap_5.5.bb
rename to meta/recipes-kernel/systemtap/systemtap_5.6.bb
index 980c09d049..f0b14ef90a 100644
--- a/meta/recipes-kernel/systemtap/systemtap_5.5.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_5.6.bb
@@ -9,6 +9,8 @@ require systemtap_git.inc
 SRC_URI +=3D " \
            file://0001-improve-reproducibility-for-c-compiling.patch \
            file://0001-staprun-address-ncurses-6.3-failures.patch \
+           file://0001-python3.stpm-record-the-installed-libpython-path.pa=
tch \
+           file://0002-python-don-t-install-build-paths-with-the-wheel.pat=
ch \
            "
=20
 DEPENDS =3D "elfutils"
@@ -16,7 +18,7 @@ DEPENDS =3D "elfutils"
 EXTRA_OECONF +=3D "--with-libelf=3D${STAGING_DIR_TARGET} --without-rpm \
             --without-nss --without-avahi --without-dyninst \
             --disable-server --disable-grapher --enable-prologues \
-            --with-python3 --without-python2-probes \
+            --with-python3 \
             --with-extra-version=3D"oe" \
             ac_cv_prog_have_javac=3Dno \
             ac_cv_prog_have_jar=3Dno "
@@ -30,7 +32,7 @@ PACKAGECONFIG[translator] =3D "--enable-translator,--disa=
ble-translator,boost,bash
 PACKAGECONFIG[libvirt] =3D "--enable-libvirt,--disable-libvirt,libvirt"
 PACKAGECONFIG[sqlite] =3D "--enable-sqlite,--disable-sqlite,sqlite3"
 PACKAGECONFIG[monitor] =3D "--enable-monitor,--disable-monitor,ncurses jso=
n-c"
-PACKAGECONFIG[python3-probes] =3D "--with-python3-probes,--without-python3=
-probes,python3-setuptools-native"
+PACKAGECONFIG[python3-probes] =3D "--with-python3-probes,--without-python3=
-probes,python3-setuptools-native python3-pip-native python3-wheel-native"
 PACKAGECONFIG[debuginfod] =3D "--with-debuginfod, --without-debuginfod"
 PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline"
=20
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes=
-kernel/systemtap/systemtap_git.inc
index 7845905d10..9a12050e00 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -3,12 +3,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 SRC_URI =3D "git://sourceware.org/git/systemtap.git;protocol=3Dhttps;branc=
h=3Dmaster;tag=3Drelease-${PV} \
            file://0001-Do-not-let-configure-write-a-python-location-into-t=
h.patch \
-           file://0001-Install-python-modules-to-correct-library-dir.patch=
 \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root=
.patch \
            file://readline.patch \
            "
=20
-SRCREV =3D "90b164cf106ef16f873ab58c8c6f653718bb6e17"
+SRCREV =3D "211e84349504077f0c84f759601b02f946465d29"
=20
 COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|ri=
scv64|riscv32).*-linux'
 COMPATIBLE_HOST:libc-musl =3D 'null'

