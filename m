Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E51C55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 12:47:36 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10912.1785415655529224117
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 05:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=d2tOgMgV;
 spf=pass (domain: est.tech, ip: 40.107.130.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPGCSVUnTJmrwbIekEWwz7c18HTaWkl1mCNGzlxfVVNGaLLFmkO/QuNJCEi3cOEUEFMBLzhHbl0f/PmE4P4Ejh4h/F5fImORak/C7TV/EKMDcJZRQ6FCieChB7nsgtfwcfxTSdwlxLRlCDwe2EsvZ7/TQKLIkkp5mJE7eV4bjJjbwGgseMEAXZcQOBco5SrIoQtJNxIlE5+nvmuCTimHlk0SHjdyFw6/6O4SpTanjUFYvWCWoKCA0oHwBH/h4CzcHm+KgbhhYzrIMB54swuNkUIYD/dCJ/2ZvTBgjgU+7JJqAMxZCddSUErl8RdmY7x72lr9TcqdGSuJENAsG5BCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9TKVsf3Og8+z0bstqnTH9nigvn6vDhfnr7U6eD4N9U=;
 b=CxTpDENvYF3IPgDI8p/q6Iw0KP84svkSQbPT/Mztnf2MAu44tsSPsYu1bCh3034vfvWFCrCXAvTWDIGFuMa0pMjCbEr4I22f0+yjGQwBlk9fYR5lIN7mCONGL5hrpl5LoewmI4T6QFcBAc72/U9E+H5lbFvaxtE6lAO3rxttwXt2E6lCOp5skIQ9hurlVWF5HQn9/WPuB9zHLcGokmEbrIEOsVrfOASdvI6UaR1VV5FfsdrN7J8d/ypz6nj8KYGKktT7vDkJc7EUZWlfDKFWgbxsfxuSiCuvAMGlo3tomc1GTjZu9KFefaeRZqx0sIAkx5ZJ/CHLX/LzAvfZYpWFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9TKVsf3Og8+z0bstqnTH9nigvn6vDhfnr7U6eD4N9U=;
 b=d2tOgMgVz2W3DVkceRirYJXie1t3/DTYocVJij3iDZ/B6ldFAD7wHFm7NWmEqpwgOXPGt1znjZ3OoCyToPbqOlYen8DPfBNpTGqadQTzvRwW7A/AmiRraavnt8d76KF4yUm/kKhyY7N+zjjmv5p3KsOF2BEWRb1E4aKYF/a6ByzCNVT8aIlF63pm3v0WomFNfPhTv0HdCIFJ+OCMzsNEjuYask9qzspBuBym6u4gQDJENzmyzC1p0VXQZopl2XAQYg7xUHRwQS5gJ/MPGxcY65Y+tv6eLocFZ5rlCFOQa9k58dwO0wtm5iA4EBtLGG5x6XHVSCgs9Q9QK+9NL+yy2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by BESP189MB3283.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.8; Thu, 30 Jul
 2026 12:47:30 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.005; Thu, 30 Jul 2026
 12:47:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] glib-2.0,glib-2.0-initial: upgrade 2.88.2 -> 2.88.3,2.88.2 -> 2.88.3
Date: Thu, 30 Jul 2026 14:47:21 +0200
Message-ID: <20260730124721.33400-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|BESP189MB3283:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b469641-f81c-4e2f-83eb-08deee38b7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|3023799007|13003099007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	mbsOw3KwHl0UBihGtdAD/9ao9Aidg7XcQI/mYdtqNMldECw4PEsTsujhrv+CgAyZmbpxUKsErE6epJnEZ/3x1JMxCLPwJXqp4cxwis9rzYaHqCYBwFvkF20R6cYhaQ9biTDSQLxvYehvoUVfRVjMbGlrxC8900mWCBqXGj2eilUnK6zxYKxWrCZYQrXZnJ0ZuW9mW+bAgNmj9Ri5b1x3mL/7pKKMxCLWo3EsmKvapZ97v0VDmrJFsXiMlTnEnjQOgM2AMxZbLihBW/FiOeH43LpmtkIHiIJDymf9VX0GIBptKrtTzaRsSnRw5JsKnFrrgPVPkI25nRoXNQ2w0QILB02sDZsKDrW/b7EH/KB/auz1KYQEVr+uDNKvyUBr419xQqu+WsXLsLTDsx6eKCUuhLScGsSH+UHKRj4coNj2BVS+MyLo+JtZzRmF8hjfa61tNu9CqP/u52peJ4WiNar0ct7YMm5g2Ofgwq2N12br7EnRo1QehY4HCCm4O4N4ymtgLjKcI0iBNlfYcJ6sF6/LL0trAVueJRblVvmMbqzCbzvCxOqXW6iQRj91cT4CwTZ0MitFt/S9ZeVWfIH3TcXsts4IbL0c9EpqqzsYQynOWEtYrLJTjU4CThk5oTrmLO4eXS+3MW9een4wqYdS/T9sieiTAoiOTnNEagnRJCkUwzs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(3023799007)(13003099007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2DwwCzkV9v87MV+GyTB5Mege2XY2dk6Y/JUzVsnz7I+JuyXmUF5M/Dn9mNrH?=
 =?us-ascii?Q?vhQXAaLFtBe8oZWbVRIGtbY0RcfARjmLXzm9Ah/qTTLpQY+BV7Iw6QdeoW72?=
 =?us-ascii?Q?0remrpzlF6lrFs7OUFazYwckirLIiOsrSE4eJ2vBLK0ZiZH9ycOBNGgzVmnr?=
 =?us-ascii?Q?lWhkBnTiFshDBQ/z/jaLgd+Varro+JxnQxA+KZncE7EkpYCfzchR9z3CKbSS?=
 =?us-ascii?Q?c+lHac2RY/rrg59Ns8r7HPq3m9FpgdX7W76dKv7iVNuPWqVOeC+ZQnDPgjbs?=
 =?us-ascii?Q?Xb09p087YcIyVTOQ5VK9rmCjLpw5ParJBeWgijWaE5VwkewVVkgubMww3TA6?=
 =?us-ascii?Q?5X64EI5t0doxS2M8iRioWWqgNK2K9Ih7k4mZOlV4fTkkmNal96jIXq2epBKX?=
 =?us-ascii?Q?1p6+tFpd5/yIiWTWxMkTuvYR3bxIrJiwJiM8Be9Mdi9jdJrUT0IPIo4cVTwu?=
 =?us-ascii?Q?Szp42uQy7fGEDXU5WUCJHgZi3gd8iLov4BWYUFN1MqiyHCES3yfpYpQ4U9o4?=
 =?us-ascii?Q?qnMmRORZjaBynMyc6KbyxTC8vPqF4rr/nWvEkHOLh5xRcXpThy420GU+l1Hz?=
 =?us-ascii?Q?6jfhACCFPK0QGVURTR0P9XsUOQFkzN4bvIIu1vcc0L/dvA7w9hDSxhtMsIvF?=
 =?us-ascii?Q?7UCRe/4k8CiVVcWZ3wVyyeH3T9LyogqQcdD6EvdPWaVeHaj+tLtrFszCEKL6?=
 =?us-ascii?Q?jETl6tBlixRAFY7bz1bFmANcLMz/8mgBHpfOrAYNepR32EdKXj4HogFXlvhk?=
 =?us-ascii?Q?vYZCwH/XuUYdUI574/l3rX2wgNOmXTAkdYwqcNbIymsutMmkTcPRZSj5sb45?=
 =?us-ascii?Q?j6Cu9KJT1NtbW1tzmYIhZD5cwLr//2rGdCpSQm74rvENa3Aa1KH8Z4yC+TMr?=
 =?us-ascii?Q?poEKAKeYLbhL82EIVEwo7lONZtMaWIcZpoouxMontyCR+LWhxOUqAI50Uqqu?=
 =?us-ascii?Q?R4FbCF+lNCdaT8yMKNSn4v4T8ik2yy3smXn5k5QCRAR/j3uJV1guPuGvJC4O?=
 =?us-ascii?Q?YsJIkv31kQw1jfToUAxZpWGXhAhetcjGkss4pUD2psh3RsPZki4oVvhe8SMX?=
 =?us-ascii?Q?nLx9oqN+Voc2QCSTG6o/MOfXM1Gqbj3ePJGRplTLLrfZx7lDwXhUxfw6UT2z?=
 =?us-ascii?Q?oOE6FEjtDFjVZG9faO4SMOo5mIO5X0k/Li3x5opXizMaglUeGlzUXRPGIgOz?=
 =?us-ascii?Q?JZCbBKo8RBiJ1Rit2nBkoz/ZwfC9mDDNItv/xxveP2aBz5dR8pDS9q2JWBls?=
 =?us-ascii?Q?naf3A68a0jm6Xv8cUhBV9aOvgDBRiug/WAUOsUomEPAARpRkOtFcb8Vsjtma?=
 =?us-ascii?Q?e2kElwakrzJEnQbE6hGU+Fp8TLnHTzPG/l7zN6Dn4387qAB2vsGjDNADNwKc?=
 =?us-ascii?Q?QvVQZAdjy8K3utY6jzhuwSv/Um28TB6Ybn7p2oCLAkeq3mLgRPr64hVSyvQI?=
 =?us-ascii?Q?Jf00/DH2bZiHtZS/WdhhJSa9NJkxRf8y/hvuTaMe+QevME8wkuH0h+68fky/?=
 =?us-ascii?Q?CzqvqmLal/P2xgssEOJFImQtz/THSj702u5aj27JN3HKxkTnEaOyURYWeCsR?=
 =?us-ascii?Q?d/a7AACIKztq3SKkJJnv5WSlr+HTDdA7PH5iSE3W6OvKTnNAmiy9cmLpyI1I?=
 =?us-ascii?Q?r0trjLy11GW0sZJySOmZvZ8g9pkgTRT4o7kLgHv/NezSnRgaKkGRRvXAeSIG?=
 =?us-ascii?Q?/HpI6ICoq7iiT9dKjcgye06eqzwWE62IG7j0wKbWSOc44YABVRU/wm4PpFUG?=
 =?us-ascii?Q?bYol5aGQbw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b469641-f81c-4e2f-83eb-08deee38b7b0
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 12:47:30.1659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFW4U8PMU4lULRvdRU7lawka2b5u7FkPB7NZujqoy6AkiZzS8227dwMAQzUqg8XGlwH6aqZUjVis46XkWHWNuM6HQ/3hRxyJkEvbnVFq/W0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3283
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242349

Changelog: https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.3/NEWS#L1-L17

Overview of changes in GLib 2.88.3, 2026-07-29
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix potential miscompilation with GCC 17 with G_GNUC_CONST on get_type()
  functions (#3984, work by Sam James)

* Bugs fixed:
  - #3984 G_GNUC_CONST vs get_type comes home to roost (Sam James)
  - #3985 (CVE-2026-15588) Security report: GDBusServer pre-authentication =
DoS
    via unbounded SASL line buffering (Philip Withnall)
  - !5225 Backport !5223 "Drop G_GNUC_CONST for *_get_type" to glib-2-88
  - !5241 Backport !5240 "gdbusauth: Limit length of lines read from client=
" to
    glib-2-88
  - !5242 Backport !5238 "gpoll: Correctly zero-out heap-allocated fd_sets =
on
    macOS" to glib-2-88
  - !5243 gdbusauth: Unmark a new string as translatable
  - !5259 Backport !5248, !5249: several Meson/gcc fixes to glib-2-88

CVE-2026-58016 patches refreshed due to context changes in the new
version. The patch content is unchanged, only line offsets updated.

Fix buildpaths QA error from upstream !5259: use the .in template
as input for the installed service file. Reported upstream:
[https://gitlab.gnome.org/GNOME/glib/-/work_items/4011]

ptest results (qemux86-64):
                    2.88.2      2.88.3      diff
  Test binaries:       308         308          0
  Sub-tests:          6207        6207          0
  Passed:              306         306          0
  Failed:                1           1          0
  Skipped:               1           1          0

Pre-existing failure: glib/gdbus-server-auth.test (SIGABRT, same in both ve=
rsions)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...t-write-bindir-into-pkg-config-files.patch |  4 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch | 12 +++---
 ...ng-about-deprecated-paths-in-schemas.patch |  2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |  2 +-
 ...es-Fix-installed-service-file-using-.patch | 37 +++++++++++++++++
 ...on-Run-atomics-test-on-clang-as-well.patch |  4 +-
 ...ot-enable-pidfd-features-on-native-g.patch |  4 +-
 ...dcode-python-path-into-various-tools.patch |  2 +-
 .../glib-2.0/files/CVE-2026-58016-1.patch     | 26 ++++++------
 .../glib-2.0/files/CVE-2026-58016-2.patch     | 40 +++++++++----------
 .../glib-2.0/files/relocate-modules.patch     |  2 +-
 .../glib-2.0/files/skip-timeout.patch         |  2 +-
 ...l_2.88.2.bb =3D> glib-2.0-initial_2.88.3.bb} |  0
 ...{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.3.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 16 files changed, 88 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-gio-tests-service=
s-Fix-installed-service-file-using-.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.2.bb =3D> glib-2.=
0-initial_2.88.3.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.3=
.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into=
-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-writ=
e-bindir-into-pkg-config-files.patch
index 11e9508840..c22ef9fdb3 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
@@ -1,4 +1,4 @@
-From 83282a978c5107c682ab4c75ac7407961bb17788 Mon Sep 17 00:00:00 2001
+From 94f8f5bf51db5219022f6a646e784cb67d284282 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config file=
s
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 13 insertions(+), 11 deletions(-)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index c7da257..8a00989 100644
+index f9aa0c8..48ff2a5 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
 @@ -934,17 +934,18 @@ libgio_dep =3D declare_dependency(link_with : libgio=
,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclib=
c-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uc=
libc-Linux.patch
index 40398f25f7..bd7a04cccf 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
@@ -1,4 +1,4 @@
-From d02e061f830b7051878e8a467f393e85110e4e1a Mon Sep 17 00:00:00 2001
+From c80659ca01051f8e83dccd4eda15a811b0ea377d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules=
-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-g=
io-querymodules-as-libexec_PROGRAM.patch
index bf669bd4b7..8f6fd98472 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 72a58d19ae7f80985d9c91751fd6c359464ce292 Mon Sep 17 00:00:00 2001
+From 25d6cb83b6b46181fbdad1a6f872a3788d6e4843 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -9,15 +9,15 @@ renamer does not cope with library packages with files in=
 ${bindir}
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Inappropriate [OE specific]
 ---
- gio/meson.build | 1 +
- 1 file changed, 1 insertion(+)
+ gio/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index a3e6f18..c7da257 100644
+index a3e6f18..f9aa0c8 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1067,7 +1066,7 @@ executable('gresource', 'gresource-tool.c',
-
+@@ -1066,7 +1066,7 @@ executable('gresource', 'gresource-tool.c',
+=20
  gio_querymodules =3D executable('gio-querymodules', 'gio-querymodules.c',=
 'giomodule-priv.c',
    install : true,
 -  install_dir : multiarch_bindir,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about=
-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-=
Remove-the-warning-about-deprecated-paths-in-schemas.patch
index eef7c9db86..d64576b11e 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From c1eaa4dd2e2c09e9930949d4a9ee08e3e21b1a88 Mon Sep 17 00:00:00 2001
+From 29be4e2681b78d7856143056f769040be076b03d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-co=
mment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 14c8c701ba..579999fd6d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From d9c75aef8b68887ef4f1dd9bb73542cc0ff02b20 Mon Sep 17 00:00:00 2001
+From 12bf3fded3b4c0c7b2d7ae7810d6eef47ed747e5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-i=
nstalled-service-file-using-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-services-Fix-installed-service-file-using-.patch
new file mode 100644
index 0000000000..7c1809b97e
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installe=
d-service-file-using-.patch
@@ -0,0 +1,37 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 30 Jul 2026 06:26:00 +0000
+Subject: [PATCH] gio/tests/services: Fix installed service file using buil=
d
+ path
+
+The installed version of the service file was incorrectly using the
+already-substituted build output as input for configure_file(). Since
+@installed_tests_dir@ had already been replaced with the build directory
+path in the first configure_file() call, the second call just copied the
+build path as-is into the installed version.
+
+Fix this by using the original .in template as input for the installed
+version and giving it a distinct output name, following the same pattern
+used for desktop files in the parent meson.build.
+
+Upstream-Status: Reported [https://gitlab.gnome.org/GNOME/glib/-/work_item=
s/4011]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ gio/tests/services/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gio/tests/services/meson.build b/gio/tests/services/meson.bui=
ld
+index 1111111..2222222 100644
+--- a/gio/tests/services/meson.build
++++ b/gio/tests/services/meson.build
+@@ -18,8 +18,8 @@ foreach service_file_name : dbus_service_files
+     # Build a second copy of the service file for the installed
+     # version of the tests.
+     installed_service_file =3D configure_file(
+-      input: service_file,
+-      output: service_file_name + '.to-install',
++      input: service_file_name + '.in',
++      output: service_file_name + '-installed',
+       configuration: installed_cdata,
+     )
+     install_data(installed_service_file,
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-o=
n-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-ato=
mics-test-on-clang-as-well.patch
index 1fe00df8fc..3f9b9e4741 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
@@ -1,4 +1,4 @@
-From f72296cbd6f04f4f74b49b961f3cb405efa112f0 Mon Sep 17 00:00:00 2001
+From 0530e624dd47ee18aab18c8d403da12bb297f26e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 25802aa..c53d216 100644
+index 22ed181..87497b7 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2100,7 +2100,7 @@ atomicdefine =3D '''
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enabl=
e-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-=
meson.build-do-not-enable-pidfd-features-on-native-g.patch
index fa46bee904..0912859698 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 03614474ac998422d0348c16c588a9ad50c97398 Mon Sep 17 00:00:00 2001
+From 0147fb147548e0657f298ab8e050ef8aaad3c850 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index c53d216..330ccf3 100644
+index 87497b7..6955b02 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1098,7 +1098,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-p=
ath-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not=
-hardcode-python-path-into-various-tools.patch
index 7a2c168756..c032d575eb 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
@@ -1,4 +1,4 @@
-From f37cec951e3c564d96afcfee1279f4a9fafcc822 Mon Sep 17 00:00:00 2001
+From 2bafa636db0241952b9168c62f051900ebf8b058 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/meta=
/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
index 2c4b248b97..f6883ba85c 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
@@ -1,8 +1,8 @@
-From 38eee3870fbcf6bdf8e6b1281bc7a98d32b68521 Mon Sep 17 00:00:00 2001
+From 9a59b64b294843842efc86148485c8b3530cdfd1 Mon Sep 17 00:00:00 2001
 From: Philip Withnall <pwithnall@gnome.org>
 Date: Thu, 16 Apr 2026 15:27:37 +0100
-Subject: [PATCH 1/2] gdbusintrospection: Fix XML parser state handling for
- <node> element nesting
+Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <no=
de>
+ element nesting
=20
 The check for whether a `<node>` element in D-Bus introspection XML was
 nested correctly was broken. `<node>` elements can only be at the top
@@ -27,10 +27,10 @@ Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.c=
om>
  2 files changed, 34 insertions(+), 1 deletion(-)
=20
 diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index c7be334ce2f7..6f722ee6153d 100644
+index df5daa3..78a63e2 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
-@@ -1272,7 +1272,7 @@ parser_start_element (GMarkupParseContext  *context,
+@@ -1258,7 +1258,7 @@ parser_start_element (GMarkupParseContext  *context,
    /* --------------------------------------------------------------------=
-------------------------------- */
    if (strcmp (element_name, "node") =3D=3D 0)
      {
@@ -40,13 +40,13 @@ index c7be334ce2f7..6f722ee6153d 100644
            g_set_error_literal (error,
                                 G_MARKUP_ERROR,
 diff --git a/gio/tests/gdbus-introspection.c b/gio/tests/gdbus-introspecti=
on.c
-index 44cb7a96af45..daca313f77e7 100644
+index cb99c94..05710d4 100644
 --- a/gio/tests/gdbus-introspection.c
 +++ b/gio/tests/gdbus-introspection.c
-@@ -299,6 +299,38 @@ test_extra_data (void)
+@@ -300,6 +300,38 @@ test_extra_data (void)
    g_dbus_node_info_unref (info);
  }
-
+=20
 +static void
 +test_invalid (void)
 +{
@@ -80,15 +80,13 @@ index 44cb7a96af45..daca313f77e7 100644
 +}
 +
  /* ----------------------------------------------------------------------=
------------------------------ */
-
+=20
  int
-@@ -316,6 +348,7 @@ main (int   argc,
+@@ -317,6 +349,7 @@ main (int   argc,
    g_test_add_func ("/gdbus/introspection-generate", test_generate);
    g_test_add_func ("/gdbus/introspection-default-direction", test_default=
_direction);
    g_test_add_func ("/gdbus/introspection-extra-data", test_extra_data);
 +  g_test_add_func ("/gdbus/introspection/invalid", test_invalid);
-
+=20
    ret =3D session_bus_run ();
-
---
-2.54.0
+=20
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch b/meta=
/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
index a61e35ad8a..3acb16f75d 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
@@ -1,7 +1,7 @@
-From a75052ceeebea434f271b670766acd5416bc83b9 Mon Sep 17 00:00:00 2001
+From 02e38caa6265e25da87836ec46c9e514d4a81159 Mon Sep 17 00:00:00 2001
 From: Philip Withnall <pwithnall@gnome.org>
 Date: Thu, 16 Apr 2026 15:08:10 +0100
-Subject: [PATCH 2/2] gdbusintrospection: Add some assertions before array
+Subject: [PATCH] gdbusintrospection: Add some assertions before array
  dereferences
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
@@ -27,72 +27,70 @@ Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.c=
om>
  1 file changed, 8 insertions(+)
=20
 diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index 6f722ee6153d..ed0d291f99f0 100644
+index 78a63e2..4df8e87 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
-@@ -1110,6 +1110,7 @@ parse_data_get_annotation (ParseData *data,
+@@ -1096,6 +1096,7 @@ parse_data_get_annotation (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->annotations, g_new0 (GDBusAnnotationInfo, 1));
 +  g_assert (data->annotations->len > 0);
    return data->annotations->pdata[data->annotations->len - 1];
  }
-
-@@ -1119,6 +1120,7 @@ parse_data_get_arg (ParseData *data,
+=20
+@@ -1105,6 +1106,7 @@ parse_data_get_arg (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->args, g_new0 (GDBusArgInfo, 1));
 +  g_assert (data->args->len > 0);
    return data->args->pdata[data->args->len - 1];
  }
-
-@@ -1128,6 +1130,7 @@ parse_data_get_out_arg (ParseData *data,
+=20
+@@ -1114,6 +1116,7 @@ parse_data_get_out_arg (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->out_args, g_new0 (GDBusArgInfo, 1));
 +  g_assert (data->out_args->len > 0);
    return data->out_args->pdata[data->out_args->len - 1];
  }
-
-@@ -1137,6 +1140,7 @@ parse_data_get_method (ParseData *data,
+=20
+@@ -1123,6 +1126,7 @@ parse_data_get_method (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->methods, g_new0 (GDBusMethodInfo, 1));
 +  g_assert (data->methods->len > 0);
    return data->methods->pdata[data->methods->len - 1];
  }
-
-@@ -1146,6 +1150,7 @@ parse_data_get_signal (ParseData *data,
+=20
+@@ -1132,6 +1136,7 @@ parse_data_get_signal (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->signals, g_new0 (GDBusSignalInfo, 1));
 +  g_assert (data->signals->len > 0);
    return data->signals->pdata[data->signals->len - 1];
  }
-
-@@ -1155,6 +1160,7 @@ parse_data_get_property (ParseData *data,
+=20
+@@ -1141,6 +1146,7 @@ parse_data_get_property (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->properties, g_new0 (GDBusPropertyInfo, 1));
 +  g_assert (data->properties->len > 0);
    return data->properties->pdata[data->properties->len - 1];
  }
-
-@@ -1164,6 +1170,7 @@ parse_data_get_interface (ParseData *data,
+=20
+@@ -1150,6 +1156,7 @@ parse_data_get_interface (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->interfaces, g_new0 (GDBusInterfaceInfo, 1));
 +  g_assert (data->interfaces->len > 0);
    return data->interfaces->pdata[data->interfaces->len - 1];
  }
-
-@@ -1173,6 +1180,7 @@ parse_data_get_node (ParseData *data,
+=20
+@@ -1159,6 +1166,7 @@ parse_data_get_node (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->nodes, g_new0 (GDBusNodeInfo, 1));
 +  g_assert (data->nodes->len > 0);
    return data->nodes->pdata[data->nodes->len - 1];
  }
-
---
-2.54.0
+=20
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta=
/recipes-core/glib-2.0/files/relocate-modules.patch
index 421dcb8f9a..6c982ca735 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From d99e85f606530950514446a3113fe39c8c67934c Mon Sep 17 00:00:00 2001
+From 226f4955e53c6b3f360f346e41a0a22b74cbbaae Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native bu=
ilds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/rec=
ipes-core/glib-2.0/files/skip-timeout.patch
index 25f5324784..7bc83adf6b 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From e19423cec5b32bfa5ff1bcd567e51fa55713f94e Mon Sep 17 00:00:00 2001
+From 64e957f0fb32ed54748ceb4f220cb4773743d6ec Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.88.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index fafb7e3391..6759ce328a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -235,12 +235,13 @@ SRC_URI +=3D "\
            file://skip-timeout.patch \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
+           file://0001-gio-tests-services-Fix-installed-service-file-using=
-.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
                               "
=20
-SRC_URI[archive.sha256sum] =3D "cf3f215a640c8a4257f14317586b8f1fdd25a10a93=
cb4bdda147c0f9ad88e74f"
+SRC_URI[archive.sha256sum] =3D "ab24d24e698dfa1e408b7bcdb508f4aafc906185a8=
b8ce72fdf79bbbdc9b383b"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.

