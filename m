Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31622.1793876978210880068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Aez8tenK;
 spf=pass (domain: est.tech, ip: 52.101.66.21, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpwZ8QhFHEAJPGnaSCZ4NFJFGzeCSJoaI2dcpXXLtIkR3M1l/vutfFnkkZq6G4/Q1LbQJGRMQ573jw5Y7HeiWV7jDJcR4AxMEWd7ZaeKr/OdBAPNgC/hvzJsPSky/JUisx7i9XQHiinG5waqwOjW0Kv3AQZVcRn6xUXGMvMZbqLdFFGk2p2QU04UzEpkcWqkm7i8dEHOeu515BeNMF1N5e3nGF5NvpIzBkHfC/+IJyNnUN71EiKaSB5vh4VHdo3MrLfFXUkPxw7+qIKhN3Zikpy0WnUYwZH4TvWdTOkdSw8KWEPW1b5F9OAbVDiUCoYO6nkAIb85sjl+DBtwUdknZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHL/21uKE2wu+iWkqHcek107T4ajuGhTuo2LMWd284o=;
 b=iSXbf0esjPzDC7OkwXQBy93gG3ApGCVIPEnAmJ5IMvRDsqHu6O56i+ZuEO0Ud0h5zXeiikXUd0E2kHuogFWjj/dEOJaEmrjkyrEnCjX50Fk9fGyr/9GyqC8c/xIVG8epkXFXvKKeKdy4vUX3ZRZ9bajQUUEuZPTQiZzgdAU7VGxcjXSGyt8Kjrd+RnS+7Sj+DsXk5LtLN0XqcazsPdB7Spu9KTwgMS+E7PREBKFht9jpXsZmkfQPf0g3Z11Jz+gYOdD4H3LEtT6EodDBq0g3sVJ6eC9TfnJcFPx4LsfFgUZIOxSyrMYPMfGZ2wYVv5OLV+tP2YskI1yQRsalTU5+Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHL/21uKE2wu+iWkqHcek107T4ajuGhTuo2LMWd284o=;
 b=Aez8tenKx1PZx4e0S7YPyQZT4q3dKqaKPbgqjRrjKyS/GugdyiG7SIu9fWIu+BQWnhbKr0Do2OHcoSgs9I0MmMCtoI5Kvv9Tdj5yYWFA2b3/ffem2IOF/6AGmKyyQ9zKWA6oJJFPT/xsmtoCcP2BiZZFlSt2PdL9L6vR6RNEHoyReFxGr8Nz2Nt7M+R1PpV5lDaXxRRq1fCjetO1EXAWNq+U2Ilx1jWh1uifeCXTYNURNSFxcNgpYGJit59538/HvcLA9O4p3OGUP2NtAf6JHESo2N7UjFrv4o9jh5b7ahOWuvtKCrBWp1jHe3SkD2+icqY00GIJ+XSxwQwXxE46Kg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3462.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:09:39 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:09:39 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 04/10] systemd: move systemd-systemctl-native PACKAGE_WRITE_DEPS to systemd.bb
Date: Thu,  5 Nov 2026 12:09:24 +0100
Message-ID: <20261105110930.52643-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105110930.52643-1-jaipaul.cheernam@est.tech>
References: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
 <20261105110930.52643-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3462:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a5a5803-9d27-410a-087e-08df3b2d4909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|4143699003|261021121427099003|261026121527099003|261022105027099003|261009220027099003|261009221727099003|261022075727099003|261009221227099003|261009223027099003|261102123227099003|261009223327099003|261021123027099003|261028144727099003|261026140227099003|22082099003|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: VGNxmHcd1gBgGTcqOTpmAZt+RheoSE1PkEqKC1iH3+7c/HTggdFwVXChiLTH+gVEkOkxl+RGjdo3piroeEX0Fcp5UzyHWuAiM8ASYXFVi0JdImM9ADlaPQ/wc+2ftuRHbn4Mgzc1dkCM3USV88X22QFrbWVTS13uDBuOy+lLuwWSgbF8HlJqQ9D2cWi4n5MO48+0VzCUEJR4B3BXUuo8ypNNDnf1FE6ggevss2wYHE66pGnqn0DSYMmLV5rAPwr9E7UQph1gSeCqvz6DBpzyvQbM2ybt39tKizZn5GA1fqXXA3ZbyODdCiuRSyxWYVwMovgCqRHEKqBykMtM32DiCU47AUaXFLTr5Q5SSwJS7Cad/T0WJ1EvOb2DZigDzCuC2gQqLXrVykNBNsFNFlGL/auNZKN7dVL7FdxzCBNYf1EZjBs/oazpoGjkCocqN4PE6Bgmnf+mF9B6TrrdC8Sajj7CpGHsQ475tpj8Nc4goj6V0bv8GoxDaMwYYZtXB/UJtTBO8Fdk5OdqGaIkvB7q8cy5eH2T68Wgq3I5DK2k/rUCt/tY8ZJiHDxWi1qUK666ncyQpqP+gIYwKuoT8daopfnAnt0e3PqMy22dcK9LCYk6S07BhsRHTIrJ77altRMu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(261021121427099003)(261026121527099003)(261022105027099003)(261009220027099003)(261009221727099003)(261022075727099003)(261009221227099003)(261009223027099003)(261102123227099003)(261009223327099003)(261021123027099003)(261028144727099003)(261026140227099003)(22082099003)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I4Wy48bB/NQedwgEMLUtVAz81ylaszNpaGfyTpETHrG56iI/aKmT0UOWF1At?=
 =?us-ascii?Q?lFuHYxhLcCdvrlAkyRCZLdjtFgQ3GMWzNSIAhOeZGvNgMRj6tqeuX5yVJbji?=
 =?us-ascii?Q?GiiZevp+YYKB02eXVIFLVgwGiPpv487Dm/TSXN6XslpzxJCDDHqlZWLa7KUP?=
 =?us-ascii?Q?bdGv7kAg3qFvtddGV1aG2DhM25rtrdr5HwG+zB23ItOOwMx09N+HV5hYjbGC?=
 =?us-ascii?Q?w1L9/+T+EkAABUcjkpZxKlqIAK2EavqQZOeu8VZEGFO9L2k9u3ZfiJTYTpSA?=
 =?us-ascii?Q?miXn7ES77WjWLk38M3skkXiF5eQ1rqere/9mczIQQTTFoIUuw2InG+Gt9/o6?=
 =?us-ascii?Q?EpGBii+mZYcjzxfv25bD/DxBnu8eAksxYn4plEHHKYNpw5gmlokvOodz0Vu9?=
 =?us-ascii?Q?X3EZTTBULQ8hs7QdOqoDhsL2PgINSmV8AEIYVPW4O8ahVcP+c0vxMkvmSTL+?=
 =?us-ascii?Q?dYaywFCXKqFDTAkFZ7pNNyyRyUo3+rrNON5xW1k+QGS/c2xNHMgyzGknz21d?=
 =?us-ascii?Q?oS058Hgr47wHL0V/ZRdWtzyZ/eRdetkQrkv1N6iqYYo60SebWWgOlXRsHR+O?=
 =?us-ascii?Q?Arp7IJ3rM/wolV14jPlkvB7JhJZjxh2OpZOR1g3m+uTejbC4PoY4XqxDUNLJ?=
 =?us-ascii?Q?rQFAu0AR1ZfKl0okY5UPSTJbRGJZbbshUKlIBU608NybFB7jgwjaPZShgdIT?=
 =?us-ascii?Q?23OuBVOHPlhXIku4sDDHAqEwplz9hevOicKQ+ZF2IZruBeIt6sI4ftLg8mQj?=
 =?us-ascii?Q?+DZpMu6K81zZZ0BBhahcNtv4f2skXTFXliSJEdmYk6K1NDJ5zpaIOXyU6j3o?=
 =?us-ascii?Q?wut6fV4JfHId5mRXtApJoD3CHQzWar4pUIE77QE2M21RCaNcMnF79NDJOqDx?=
 =?us-ascii?Q?060JTuEYU56fBiovWWkGKoDR2w4ISrSHW0xGn92bA3GXCsBMCr2axKP3i+JI?=
 =?us-ascii?Q?LRU+xF55Wm/g6mBQabG9voT+2pBeEFt5vaQu/WEcnkftpN2af0T2FTZ9NmuY?=
 =?us-ascii?Q?HrmL2pZbLxSYXUtlj7JmJppsHGKUBpncLFk1YX0iU+G3atf0fr9+xMVCPgra?=
 =?us-ascii?Q?qjILCHeTuHGi33nMIDKqb2dfPKFX+WIPpMFF+LCQzzRahnR1ndc/LgYBJKvF?=
 =?us-ascii?Q?afbIKAam0kXf01iXeYRHQIdQFb+AQ5x+VjvjI1KlSmDRNJbKgX9TeBGchFIw?=
 =?us-ascii?Q?xILl1UwmNyPm8doz+u8TyN6MTykvm+FiZEkJmpAuTBOC6yMyggtKLSFUjPv/?=
 =?us-ascii?Q?l6rGWnayqt66QqvIUTShOb+5Va7rHLyxygA93ni6YkLKC7GPVHzMJklm+OTS?=
 =?us-ascii?Q?0BsMm5yJOuXKR61ZJJ746TMnEMwkuVRrQ8ODkQ2+EXEoKxJtV1p7bBu7nZYg?=
 =?us-ascii?Q?p2onBZpCuCIUggYn0Ocew5RZ7nyp5UshQZoh362Al66koBFmP7C1mi4JIE19?=
 =?us-ascii?Q?Vn8un2uLC5a9RaQag4e0X1xK+f2HN19jgqujYyOc1eJCWM0vJm4HixD4i1ff?=
 =?us-ascii?Q?hvsUVw4TVUeWB6LpqXFEFAoReg5taanAHlZcTg9fBpEAEiSzEfm/w5N1finu?=
 =?us-ascii?Q?PA+JXYW2+w9kiePkK3DFvZ1VErV3pTWQWyafsBd4jKGYUxAykJ9vXWah+Vyb?=
 =?us-ascii?Q?sG+06/W2Bb9lk+IHJQ6pGqhPFHdd+BjFD5oRtBjy5les99Uya6pIXIonlGtg?=
 =?us-ascii?Q?YMZTgkdgRCnJjNMqTgLZ4frb2lPSbSmpDn+iWWvIcbf8Zk4ZyoxCqb18TyFV?=
 =?us-ascii?Q?xdWQ2wzZbQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5a5803-9d27-410a-087e-08df3b2d4909
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:09:39.6260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZI9g8Ca5oZ0/WAjuE8TnWAjpZcd9a2WStqzI6EiLWLsqjDs2Yk9d6nQ2TOowYyji3QpCMBJzvSIPAS0zVQR2xGuF3YoNQLBIPq6O4xpVuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249531
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

PACKAGE_WRITE_DEPS[1] is used to define package dependencies that are
needed at rootfs time, for example when a postinst can use a native
tool.

We allow distros to build recipes that support both systemd and sysv at
the same time, and the post-install script generated by systemd.bbclass
will use systemctl (via systemd-systemctl-native) at rootfs time to
install the units and thus generate the required symlinks.

Presently the dependency on systemctl-native is added to recipes via
systemd.bbclass but this results in all recipes that inherit that class
having the dependencies. This is actually suboptimal: at rootfs time
the key requirement is to install the units if and only if systemd is
being used.

We can move the PACKAGE_WRITE_DEPS dependency on systemd-systemctl-native
from each recipe (via the class) to systemd itself so units are installed
if systemd is present, and not otherwise.

This means recipes don't depend on systemd-systemctl-native (which has
non-trivial build dependencies itself), and the units are not installed
in non-systemd deployments.

[1] https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_WR=
ITE_DEPS

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a96f87266d63fb5ae2aca6628c35572f83c68983)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/classes-recipe/systemd.bbclass        | 1 -
 meta/recipes-core/systemd/systemd_259.5.bb | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 26eaaf1922..5d8e6086b2 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -22,7 +22,6 @@ python __anonymous() {
     # redundant init files.
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
         d.appendVar("DEPENDS", " systemd-systemctl-native")
-        d.appendVar("PACKAGE_WRITE_DEPS", " systemd-systemctl-native")
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
=20
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_259.5.bb
index e924884bf9..848e12e8b0 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -22,6 +22,10 @@ REQUIRED_DISTRO_FEATURES +=3D "systemd"
 # this and hence we can no longer support it
 CONFLICT_DISTRO_FEATURES +=3D "sysvinit"
=20
+# Ensure that the native tools are available when we're building a rootfs =
with systemd in,
+# so that systemctl can be used in postinst scripts
+PACKAGE_WRITE_DEPS +=3D "systemd-systemctl-native"
+
 SRC_URI +=3D " \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
