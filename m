Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018E4CC6B02
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:37 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13147.1791811226690939817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=RUlUBpBo;
 spf=pass (domain: est.tech, ip: 52.101.84.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzGv9KjN+ajVxK37w+LbP3Ty3RgDeeGWfiHEpGMgeoFxSLP5ARKcv5jd+/clkDa2xJ0xzVFHp/FbXtCrQFGdELhdHmc9PSdsWJfAAcmVi7P9CDS7MxnJMHiKHG0IBkk08Bi4FGkiZexNtdiwS9mwg8h992L1lpRcLRIRTK31e3fwHMK+a+5uo5ZO8tTdOGA47StOLCBxiTg/px1YSBX9mckLhsXV7JXyca3Ze/AHQx+AR1MGFvVx3Aw6NqJj9387GUQEio3iMW5ktQ3BONbmPJD/qpPxpCB7bwU1kn9l5TeouHaPW12tua/7rdvzPhPrMsSDmAXVeE3j8Zi9k0xf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klBDIC9sXR6P4Jc0zJjqBQ5zjjnIHoCLgHk72UT1Smk=;
 b=TLV+BXAIEUYHZZvaqYfCdm1kYN23kr3pil1FsDLWLr3el6489ng0AWP5eIa4wKRXnCTzZ2+Tkyus5l5WAf59gPAOOgvoPqs2pC5xeNBjvvTJt1qHgP5FDYVEZkh8dMJd9Uocv989jU52n8qPDEu4Iy8oZjkEsmqGzGyKM+byEO6age0AYZ+hw4ynP7UbV5J7bGAB2AJVEF+T8BWYGieCREl/01Fk9ck2dZ84FIXxH2dtZetWLzC6DBOqabKUn32v42e0lZ1SpNHaSsdZREZPEkrSufF/sxibNBPsgl5joaaBWw4ZWp+btyYJRJ/XI7QN92xnBwfbcMMrM1r4yDOOJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klBDIC9sXR6P4Jc0zJjqBQ5zjjnIHoCLgHk72UT1Smk=;
 b=RUlUBpBoNalufLRoGNc1QAUFVqWC/9+qyqrE8pBbSkfcSyil1g4Lwj3Y47z8hXRByNCbEWy2WVr5tAGs80ONppCI93wBZDUE+dKG7dDMjYZ3RfY2QP722W48I3+d8TgWo6PMIRExyoD1toxWjkn4y1qeu/TsV1TZaxMCXJZxxswqXzp3hpg1IuD9k0SkXEmFhFNmYszXh8oKvWboaPJDOT1Sub0AizXaBLx3nEICdArrHKpsTP6/oEdTpvqluZz3JBilTuxR+sxRJuCsI15eWIEOQfoop79EoZO2P3LA36HTOhHQhIT2+mZJEygvPPV9PP+OjLM4g+vVq0dhNymOww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1966.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 13:20:23 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:23 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/18] sqlite3: upgrade 3.53.4 -> 3.54.0
Date: Mon, 12 Oct 2026 15:19:58 +0200
Message-ID: <20261012132005.23909-12-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0048.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1966:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d2be4c-302a-449d-f8ed-08df286392ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|260925021911599003|260925022911599003|260925021311599003|18002099003|12006099003|10067099003|11063799006|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 
	m3i/T0aLZ8IN+TXx2IN3R+kanEdHI5mctpH9cscZAzVvS+HBpdMcKQGrza3lEjYoPr0oSBnPXkH+ooNmLuuyuVJRSnx3KbZyckf45mYfummL8vek19mWp+Bcfk3mlhae3p284cuGRGjnKTdkm5ioK3cpj7EPVFq5yw/4gCLNbH5yUwaquf2cOJLZnFvr+2El3YutQCsSxMs5pCJ3u/u/K26SSHQecYGz9G901qQrUKrNDQ9VjUED+E+Ec4JROxVaF7/AmADAVCzz5vjiPhE6unev0I3kj0hIUPXNYOiKvIh4wg7IfDSFERebbHLcDmq57WWoBFOR1V4e5nedOTK/HpYfsFOYdYOQOpflRMEXs70sjaGhBN90JR6gV6JkiF1qEqI+aPRfVLW9B9NkndULacV6D82IMDmv+kbyaUM8crxvO6WphancmTSJlrx5zyyup2anG6dQMhRxYxseBecm4Qgmjv8yeDjXNTbLgx24d552HkAqAecZSrbPp79/1k4WDqxOrXQTyyf1D7HqEDx/8ijl3dn7qTpDqe5KpORZ7+S5xRu52pHltRguR7eQYSqiWDcSyJfgFbT58M4FGHqizI9W4yzjAM6DmJ2wQrm+szg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(18002099003)(12006099003)(10067099003)(11063799006)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wpiurUkB+YFMbCPijNzA/5jGGFUpSR8wW73vR2WRGJjMYdmCl/9lOl0KAC/o?=
 =?us-ascii?Q?eKRnlfXFIRyuLkOIQawHoTEXwW7R/lKpLNLrpl02RqSrQVTETForOrWx6V0/?=
 =?us-ascii?Q?68nzBMkmDy/fdqDCu5LPXkziiRLHPmEljgirfF/MAOA5GTFjs78egJfyl7c3?=
 =?us-ascii?Q?5Zv6YBWTw3lyfKI57mLvoQ+GJKJFS97Qghy8ZpBBJuwDAyW/xKiDkiZje4FJ?=
 =?us-ascii?Q?OBX4NnI4lkGh7jitnoera2/rSUf7GFRfdxM+bJjHHGx3bn+Epiuban6BywgV?=
 =?us-ascii?Q?1avRCWS2OxwNkvBxXlXWVsdo6X01+2Vqs2oU1L1IPjMlKE5sR0bkm9yBRAg8?=
 =?us-ascii?Q?kiKjeDiWTAHoANOynE/dHDgVQ2uGsLXNv+4aBa4+d/8/G1tOXLW2JFdrAIE9?=
 =?us-ascii?Q?CQvyqg7tuZe/g7Fv4h4ZNeyjsfFpgH+zqT79rNFNGzylzIdSS5pkHVjd9nr1?=
 =?us-ascii?Q?0gglZ4fabQ8bwayq3+2lXSaVmCr4s3MzixWtOqAKsTgy/0FPlIJPlGxioYNH?=
 =?us-ascii?Q?bfTjdECey8I4kMXSD1vBZAfXjNQ8ogt4ViFfTHD8jBwJElXOavv6nn6pi3qF?=
 =?us-ascii?Q?VfuE56WNoQbot6/5E4SK4e0v0AhMzAt1XX4ekyJGgQ+1A4euBNNsZccn3lkX?=
 =?us-ascii?Q?Bdvy6zt2utWJ9HmlxPh8/m6rNR35NjZ/H89KNc8HM4l149byzNZxnYWP2pvT?=
 =?us-ascii?Q?nGdA6eeC3c+5peBK0Sl+G0hFlLP7AdvR4rrkkJ21zKOtQtgndR+ycUQe9Abz?=
 =?us-ascii?Q?NxjTvUIT8fUNZJ3qk411lyeRAkzeSOYXwgrV6IAR2zD6ROkXbcZjCIpLs7Ra?=
 =?us-ascii?Q?hjbLIfT4scApOfBJ4iMB/0gl5T2OuF00jvTqkEF3009apEPjelKT5V1WZcXz?=
 =?us-ascii?Q?xSg6Mj4htBmiaygEDR80yQaw2+Cho2jzS0Wke2IJC5/OOaMaNY62Yf3YueIz?=
 =?us-ascii?Q?tMGpO7TfUz/9FARFoNiq8vkbQ/8j3DBDhoJivG84fKkYZIO8xMaVgL9mAG/a?=
 =?us-ascii?Q?cMLDLnUAarxmWHWyi23WCRx19M0MgAHSqJw4/RThKIY2FCzS66C3hYET6YlH?=
 =?us-ascii?Q?WzpXGNXQ7ZRogS0mFVYHYJpMGwAir739z8kTE5u0ymy3kmuDOwuKrQCjK/zf?=
 =?us-ascii?Q?yNnO0UBMfqA7BnAZwzVzM+xbVjxdsS3kgmUQkHPH1fEDHhMxT18XHJkCK5Rk?=
 =?us-ascii?Q?Bk35jWBvbshI1R8StAofBVF2i7/g3f/wv7QVsR2VMg17cPPgXywe2l4YMXmN?=
 =?us-ascii?Q?O4mEqxidyzygNB58iKyJpMk0mJEd6m3TI06scILEJ/5r3hkexn5esEw3FCua?=
 =?us-ascii?Q?wm0H9gTEDRHnWFXyqZQ5assrF0B88BppD9BVeqNy6Q0mpztWI3tvMUelr8TA?=
 =?us-ascii?Q?VG7Us31fswYFNg81J8Wo9zcKfqINrGcDbNvr0rXVy2/oPLJfQ/DIAWa1et0D?=
 =?us-ascii?Q?k1fkDjcG7fhtx3K0q7EuU6kWYpvE6i+23hGjiZ/FAZbnejvPLaK9OFUs64SA?=
 =?us-ascii?Q?kgWNMdBWTCWTIbCrB/FFvDicfziBuEYiaESfkyX7XeasB0STUKSze5BeN3ac?=
 =?us-ascii?Q?5AeKV3gvG7NZxIPzRWrbgX0Sl2G9P8JCYjpfXRXjISO+/BMwDbxUL72L4vsu?=
 =?us-ascii?Q?YL7BHd0ICsZ5eD0FAujqyjuPWj7mv+Kq0trADZVeFsU8OvfhcCxGjnb4kJxI?=
 =?us-ascii?Q?xQTheDgjdc9l9cbNuGh/qPui792n8sHCqLnWn47C4xiWzt5W5y4vI4JNcugG?=
 =?us-ascii?Q?uQ6Y/2BVLA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d2be4c-302a-449d-f8ed-08df286392ae
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:23.8754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aleaMsRMnd7/psYL1mXfXctgHDToBNs1dYTRz03Ey2hL7TkcNYNoqimU7KsljTSK6bd1zj4mjrMIElLSk8urWHod41tvzrJyfDHvCER5ynM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247655

ReleaseNotes: https://www.sqlite.org/releaselog/3_54_0.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch  | 8 ++++----
 .../sqlite/{sqlite3_3.53.4.bb =3D> sqlite3_3.54.0.bb}       | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.53.4.bb =3D> sqlite3_3.54.0.=
bb} (97%)

diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable=
-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disabl=
e-zlib.patch
index dc49a3731f..1aba204f6c 100644
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.p=
atch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.p=
atch
@@ -1,4 +1,4 @@
-From 7c6c5749f809eb3fd50fbaabb4ca6379968b3c5e Mon Sep 17 00:00:00 2001
+From 0e78981daf571069e1361592919a1140e895816c Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Sun, 12 Oct 2025 23:32:46 +0200
 Subject: [PATCH] Add option to disable zlib
@@ -29,10 +29,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 9 insertions(+), 1 deletion(-)
=20
 diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
-index fa36dfb..a78ba8b 100644
+index 17c1315..940171c 100644
 --- a/autosetup/sqlite-config.tcl
 +++ b/autosetup/sqlite-config.tcl
-@@ -287,6 +287,14 @@ proc sqlite-configure {buildMode configScript} {
+@@ -292,6 +292,14 @@ proc sqlite-configure {buildMode configScript} {
        }
      }
 =20
@@ -47,7 +47,7 @@ index fa36dfb..a78ba8b 100644
      # Options for ICU: International Components for Unicode
      icu {
        {*} {
-@@ -674,7 +682,7 @@ proc sqlite-check-common-system-deps {} {
+@@ -679,7 +687,7 @@ proc sqlite-check-common-system-deps {} {
      string.h strings.h \
      inttypes.h
 =20
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.54.0.bb
similarity index 97%
rename from meta/recipes-support/sqlite/sqlite3_3.53.4.bb
rename to meta/recipes-support/sqlite/sqlite3_3.54.0.bb
index 137ec26207..5f15ed93c7 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.54.0.bb
@@ -22,7 +22,7 @@ B =3D "${WORKDIR}/build"
 SRC_URI =3D "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.g=
z"
 SRC_URI +=3D "file://0001-Add-option-to-disable-zlib.patch"
=20
-SRC_URI[sha256sum] =3D "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5a=
c81d8a9516eb9c"
+SRC_URI[sha256sum] =3D "134ec0802dda5795816e25d25872d20b312cb3973438c49b30=
bc40b7705ea9ed"
=20
 UPSTREAM_CHECK_URI =3D "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX =3D "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"

