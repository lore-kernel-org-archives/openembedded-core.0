Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62CEC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 18:55:13 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15992.1783536905551072717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 11:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=OcRQ8xsn;
 spf=pass (domain: est.tech, ip: 52.101.72.15, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjAGvR5MVdpS9vyabxsLO4+p5DjGoPTQidTEG5Eoh4PR6H/dpqRCR6Wpx7Zu5t6zICgTHWqQfngcdo7A4j/1GVF/mjdbv4L3T1UMsRa2D9d/C01GYkgdsSCYC5YIQY+DMF2zyckph3HVIfRryfrF7YH17ykeklkGtOZJ8SO5V8//p507NC1goCAd+WPVRob+IhlwWXq/jmSjSRp/vqfnOIyEPJi1lPQGwPI12jfI7FGyWqt5kZCj/VCuAI4FhN5LXByDao1/O6i1h+ZwO8BrlhVh56j34eJ7fldeNiUGNmong1ErjKt2JSKIh1JUNpxBHglFzxM5rtka7rC6OGgI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVbTttVeSBtxG0ZT0N+L5sYuL2BB9mzr+F5jgVdfmDQ=;
 b=I4fpVhgOpQqy/qElIJ+acN3L1WMztiaW22wb1gGE7vrB98gCp25kQYp4t462cgQyAPFWUPo2fiBHG7kOyG2hZn4yicoXhTwihJJIqkI79hO8CW9cYOgc7BxmyQbZcXS5uUcZZdXlJ5cR7KaZ7iTOXLycf8D6PQHKgq0SbvHX7YoflXJptb8hSRHi8KAmIt8wVxFaIBePEJOIQoFYhu8q9naQRo2WTGmaAjLhMfgR76A3SndXlLN2w+o9nhW30axFQwmXCh7pnwhE2kc6ms8xjqUlLsN3C+x9tigRCAjqeCYBhGFW5yxQtJL/ZyZ8QVfWrCE3Eodifs0iwEZ/Gz3W1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVbTttVeSBtxG0ZT0N+L5sYuL2BB9mzr+F5jgVdfmDQ=;
 b=OcRQ8xsnoJOSbkZDXpdknrakjY5KHUKP+7LbH4AirOr9DgpQ6pGiygoLYbBGaRfn9gZuuDufDuF8X71CYRijqRP0CHYUOlV7EQPU3Gi19JWsysPQLlTUApVcmGXKYIQQXgQ2PNv4Gg/4I04+benSW2FiZM6kaHCrrxyrxkWY06Oz8y+CF0FSpPRpA/g/bzONv/emvAN5UFbYCYn9iDuvrXHNTXONQrNW28ncRAJgkj6OkGcmF4XxKKVnXrBzeXSuAZ7XQ/Pk1ZyZ9/qOLBYnixttSC0Jozw8wBphuJDuLNcpe7efg0qP4nddlvWXHcmbT3SdQtk146fuebLYSoaXaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:263::18)
 by DU0P189MB2017.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.12; Wed, 8 Jul
 2026 18:55:01 +0000
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96]) by GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96%3]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 18:55:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v2] gzip: fix CVE-2026-41992
Date: Wed,  8 Jul 2026 20:54:58 +0200
Message-ID: <20260708185458.91632-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260707143421.34255-3-jaipaul.cheernam@est.tech>
References: <20260707143421.34255-3-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO3P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::18) To GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:263::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P189MB2954:EE_|DU0P189MB2017:EE_
X-MS-Office365-Filtering-Correlation-Id: ff38f54b-cbde-4eab-9f48-08dedd226a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|376014|3023799007|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	KNP/0v1Mo+bzKfTCM9ROf+Lxc7y9BlKaVxKyVNzcjr++VLV5Lgq/CrdjZtP5oXvg7jGij2Z0c4jftiuRTcNZ5fzpfV1aIZHcvVfq5nKnLI2BuCNdV7TKsLgIlUjB8gpT205GeyIR9+LGYPbXIY/ZqQnl3CCtaeYH6P3zk5wxdIoo424ZemK1LlZ0nqb/CK4x5X9ERBHxrc1reHPAN8o34AxpCwJnuyNfIFvMvkVB8nrRaj/D5DFcLnqyZIlZgNDH1szcaz7KNTRijJgZtecWYihJeIG8vNxPgB6qToeiYlKzUz+AruPcRCxZTHseUlB39bb1k4gUru5aRp9UwHrnwRlB/MkzCky+nehJN+8+yp7kbXDSn6QnrF/zJF1pcGPUPlN5oS6w66l9OBZd+AfsLKfLnrDOvN+59aN6psPxu0ntp1lJtXZi9A4zlrIhLuqF01xGqqt1W3Or7kt7aT25l1KrE0U7/vwZp36Dn3lQyQfCVgL7xzgn+paM8fk3tg1pqRfTkeZa8sRm2HPWet4/bQ/98IF60mr6hggVLxOfe3/QhY0zSvvodVWpQIQ/rUSImwCXPFzL6f4TBpo0VJRm/rSs75LEbMH+D5l5R0gsZBTCE9GQLyqZiMvQjlL3bta5+Zbl6UG48ryo/UsJxgoNFOMZjTG4z/S4ciaiO2aB+BU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2954.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(376014)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7fjUTKxsav38plERMgy3zw0t1m68kxapH39OND3W86EhzPBj4JwtDrf70n3d?=
 =?us-ascii?Q?lREyhHn+du6U+s17GjIoa6b5RSvkjfSbFr6XCSZZ7OjGhhQx4BWGSW9fNRlz?=
 =?us-ascii?Q?/rk3qD5ANmpAHSCxY0GWGf22qMK6tTlwO6R0XbiXQ0oJlf1URyj+d4E7kWtL?=
 =?us-ascii?Q?IGvsKbbyMYQVgB2HvYUl5BjMiegkvQIdQaVRkn11o4jAd+Otyr4dD/d6lh5D?=
 =?us-ascii?Q?9bRiKWGh8m9MkgJEhq4XdTcF/F9yAFo0d3ADRhWBHgKA+lGpmb6XEVwhK/vR?=
 =?us-ascii?Q?3VjqMjXVSWw2RHGKM63kuuTpvmUunhhXQDAwKPeUCmct7vhkMBrh3L7thJSm?=
 =?us-ascii?Q?XD+wHcb4Ovj390nW8yo3HuxGtMC3nKnqr7SUtH5rRF0KVFJ8VILSy+9Un0WK?=
 =?us-ascii?Q?aT0DuQSlKR9foKcltX2F0+7CcGY7GyDsPTNSd8akg4DlAINJCpTdq/yk6EV4?=
 =?us-ascii?Q?R+41GIIQOrTkXhYwCw/Km3TSbW+QkMCZxSFOk+SlI6bqnGw1w19pl9rJ9LXG?=
 =?us-ascii?Q?Pq8/uJ0IEmUjwg3q9mxWQ79NDe4LTvdOrVBNXa3OeTGdnb9t7XgZtG9Rfe3n?=
 =?us-ascii?Q?RfBEiXXxS7iM1sFhL9hChW1KsQI2T/EcMmtgzX37KyxpairGKSqyJBr2svqj?=
 =?us-ascii?Q?b/mp2cwuILtkalEhvcw+wF2aqxjxoDP6KrcihZey9QVak+L33Lt1bLYVhoid?=
 =?us-ascii?Q?RKFZ+BTUXynuP1WZR7vgxXW0fQ1tHlKOUS+6Llv/YliPLxapNzQh4WWvI7V+?=
 =?us-ascii?Q?SqKq310BF1Yhv09+MN5BoQHPaBWp0KWVfBHynO7X+fpU9Tk4CqX/rWPTP60P?=
 =?us-ascii?Q?zz7P9YtpmaSAeNJMmpO9Mojn3xm1AJL+XOD+FJoYmUhW3PVptDtvJ7m5rPPn?=
 =?us-ascii?Q?H8SrA9+9mwGofV7Wkq5tFTxsIujTjbj3F3tleYHA09EgTn9H6JOF2pwkXe1j?=
 =?us-ascii?Q?KcqY6E1mBUATibu6NQOnJ7qHTSn1qnm8vcqqGe6SqT2O0SStRZ/i/41z2p8w?=
 =?us-ascii?Q?CcECBKKRoNPR/lUtpnyfgcMZR1cOT5CrIq55S4PhYHxPh9IcBpTysU/uMzsy?=
 =?us-ascii?Q?ugnuJ/JOxIj8f63xMdwnbh5AeOIMSAKlikJLXo6PC1Q8zteOUVh4MUCoDO79?=
 =?us-ascii?Q?NfyHMD8cg4SlNssG4zEmCdtL8H8208HUhLWHpUfDwGQzSGKAbR6eEdPw1/DU?=
 =?us-ascii?Q?/KQmQQRTwdyYE596xRvG/y/9H7MMvPlVzCLq8y19T4m7HeaKTqLG9SZ9RXUz?=
 =?us-ascii?Q?O2ZkEYiC8IY271IuqGN50M+c3ktTJ1FeU/0DTlxRQTDyfTEOimt3gNfdP244?=
 =?us-ascii?Q?v3Q3XA+/40l53HEo7pjheI8DEMTMBvGAslB6Oi5/sNJIgp9YWscHI7zbvOkY?=
 =?us-ascii?Q?DlK2hQ5PlZzY52ZqEj/HiXzbX5YL5fBsz1j9PnqL7ZD8b8liFF9N0VPvW8RQ?=
 =?us-ascii?Q?Y07NlvjZsq4BzkU+7geNVWYZiFoi65+gjIAufEol7I8Y/KM+vbOA9LUA3bBn?=
 =?us-ascii?Q?mWC+nnVcXw0yRRmX5eeoCEbSEyePTKUxbmfjTvNXbz9EKn2QPmnUapdWiyIB?=
 =?us-ascii?Q?E4ZSboXKU8dQQixV8k72/lVRlVRQod/yBHDtdFvG0yFDT21HasxPixt7a13H?=
 =?us-ascii?Q?YI4nK+tRjD+62dei2KbnqL+VuClFPKZDzvL+8rmmGzgAyPaQd/Oca2Bk7oTQ?=
 =?us-ascii?Q?1z+pffwjUn9uHLS8luBYDS71/tuP8dSc0HOObhZdoIucl3lZlZDkELdmoY4G?=
 =?us-ascii?Q?M+qGlPnsazEg4zFtzFvkE4crKhQj8Qfcvr9LHH8ZCpvr6BRLSXMbgsXwpaQT?=
X-MS-Exchange-AntiSpam-MessageData-1: 33yfUwJRRYHjdf2o42vXwTnKNWTnh2gK/Y4=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ff38f54b-cbde-4eab-9f48-08dedd226a49
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:55:01.7344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FH4Q91HwtsgOUSKV29jkHFRH/8gz/2yUdD/v4UfoiSEvtAuhcFR0rQg5cvIk/HGWKBNcGvrKnVxkB61z07hE8oYXeXeEAAUgQIZP1HTZqOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 18:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240508

Backport upstream fix for a global buffer overflow in the LZH
decompression logic (unlzh.c). The left[] and right[] global arrays
shared across LZW and LZH decompression routines are not reinitialized
between files processed in the same invocation, allowing an
out-of-bounds read in the LZH decoder.

Adapted for gzip 1.14:
- Refreshed NEWS and THANKS hunks to match 1.14 release context.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-41992
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---

Changes in v2:
- Include full upstream patch (NEWS, THANKS, unlzh.c) instead of only
  unlzh.c
- Preserve original UTF-8 encoding in Subject and commit message
- Refreshed NEWS and THANKS hunks for target gzip version
 .../gzip/gzip-1.14/CVE-2026-41992.patch       | 64 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.14.bb       |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.pat=
ch

diff --git a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch b/me=
ta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
new file mode 100644
index 0000000000..f55c89978d
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
@@ -0,0 +1,64 @@
+From 63dbf6b3b9e6e781df1a6a64e609b10e23969681 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 15 Apr 2026 12:00:17 -0700
+Subject: =3D?UTF-8?q?gzip:=3D20don=3DE2=3D80=3D99t=3D20mishandle=3D20.lzh=
=3D20after=3D20.Z?=3D
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Micha=C5=82 Majchrowicz.
+* unlzh.c (read_c_len): Clear left and right when n =3D=3D 0.
+
+CVE: CVE-2026-41992
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.git=
/commit/?id=3D63dbf6b3b9e6e781df1a6a64e609b10e23969681]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ NEWS    | 4 ++++
+ THANKS  | 1 +
+ unlzh.c | 6 ++++++
+ 3 files changed, 11 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index 6388227..8fb8918 100644
+--- a/NEWS
++++ b/NEWS
+@@ -4,6 +4,10 @@ GNU gzip NEWS                                    -*- outl=
ine -*-
+=20
+ ** Bug fixes
+=20
++  A buffer overflow has been fixed when decompressing an .lzh file
++  after decompressing a .Z file.
++  [bug present since the beginning]
++
+   'gzip -d' no longer omits the last partial output buffer when the
+   input ends unexpectedly on an IBM Z platform.
+   [bug introduced in gzip-1.11]
+diff --git a/THANKS b/THANKS
+index 4e545d9..a7d25e4 100644
+--- a/THANKS
++++ b/THANKS
+@@ -186,6 +186,7 @@ Jamie Lokier            u90jl@ecs.oxford.ac.uk
+ Richard Lloyd           R.K.Lloyd@csc.liv.ac.uk
+ David J. MacKenzie	djm@eng.umd.edu
+ John R MacMillan        john@chance.gts.org
++Micha=C5=82 Majchrowicz	mmajchrowicz@afine.com
+ Ron Male                male@eso.mc.xerox.com
+ Jakub Martisko		jamartis@redhat.com
+ Don R. Maszle           maze@bea.lbl.gov
+diff --git a/unlzh.c b/unlzh.c
+index 3320196..a6cf109 100644
+--- a/unlzh.c
++++ b/unlzh.c
+@@ -232,6 +232,12 @@ read_c_len ()
+         c =3D getbits(CBIT);
+         for (i =3D 0; i < NC; i++) c_len[i] =3D 0;
+         for (i =3D 0; i < 4096; i++) c_table[i] =3D c;
++
++        /* Needed in case LEFT and RIGHT are reused from a previous
++           LZW decompression.  It may be overkill to clear all of both
++           arrays, but nobody has had time to analyze this carefully.  */
++        memzero(left, (2 * NC - 1) * sizeof *left);
++        memzero(right, (2 * NC - 1) * sizeof *left);
+     } else {
+         i =3D 0;
+         while (i < n) {
diff --git a/meta/recipes-extended/gzip/gzip_1.14.bb b/meta/recipes-extende=
d/gzip/gzip_1.14.bb
index c7837cdae0..99174a58c5 100644
--- a/meta/recipes-extended/gzip/gzip_1.14.bb
+++ b/meta/recipes-extended/gzip/gzip_1.14.bb
@@ -6,6 +6,7 @@ LICENSE =3D "GPL-3.0-or-later"
=20
 SRC_URI =3D "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-41992.patch \
            "
 SRC_URI:append:class-target =3D " file://wrong-path-fix.patch"
=20
--=20
2.34.1


