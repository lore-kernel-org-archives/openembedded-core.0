Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380DEC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:52:38 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9948.1784130756550803361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 08:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aA9f8k2Z;
 spf=pass (domain: est.tech, ip: 52.101.65.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6BJfV+23/f19VP1MUbckmnvKZhs/u2KLw9uyaMY5cVBNH4UB+eMh5oc6FoP3bD7dQHoQelFS4iF0wNm7amfgeEWt4nhGdb6BJLMTyMWr5kITG1+9sz3q983KAd2K7iwgIGDmeZMIZjP7/fMntk/AOK7l/2q6EPMdEKQYPd/YVTvdno4seGVyJTKSa1LgWBx1KZYSIALnu4KHW/ge7eSbdUJWAwtiWucLsUfi+049gE6mfQ87YtxILVRRlSNJe3CbVlkcAlA1soMoT1tMEUUr3pWUGo2XJHNFGOQKBA/gUjcxLOz26C2ukQDqJbhFQ8EnCwmgE+r/Iansvf9nQmeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6NPVRMmOgRNe5U5lIidY13NsEUYQhECgYIkkDDxVF0=;
 b=jUbl3NB7X14xRd5ixrCe9dk1LFyWu4VxFSTP/kmPB+qNcGeo1doasBSv3uYvuSBSg4lz5xNv23BSYBpyHHIOCxbToGHJWCZV3YauGPbOAKbawlxku1libBrFMkbjzCLww/lznZf1ErVPWULOqqG3dqkfMp/NnuKA6uiPxY6pyLQJc7d1n8NipiySVK9qm9WO9Xjy4UOaezacJE5rlZQmr1zXz1lRTWmjL4haPu0WT+gd5xFqdN7Zo0PR0rivl+Wb/2yeRj0QgmpYPhOVcUDnmf2PNbzbLaAVhQ3ygZc8H6vjKoXM9HY0P5lj0PIhaWWGKPp0hYWd2PjntphCj2NaSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6NPVRMmOgRNe5U5lIidY13NsEUYQhECgYIkkDDxVF0=;
 b=aA9f8k2ZiycZGiFW0C4+0B/ZIWiAZFoNInDWdQzQoMQ+zs7GfLjOscSEnwMxWINEqxktlR5L5GuXSlIRJC6ypEhBVCWv0JVMTPzoiBnMMa4j4sAJmyj6KIZMHUcBq69sxihWzxqhhAs9oUaJdaJCAwRCHBhQDcVmWrjqHYGQ7XCwFC6Y9kSDAR38YQuMi6k4YYMPnA9ShR4HWMlYfmWcS0UH0SEgSrFXJP7nVBBq3vcMGrKuUVmJqeSAuqclKAhzKKs790KoEnMvlQajEbFZ2q9cpP2Kvx7mBsCW5a3hGHj0kY9gVMA8Y2E0DtiPVUAGhuTX0W/aWsp4jvmbncaFoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB1148.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.4; Wed, 15 Jul
 2026 08:19:27 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.003; Wed, 15 Jul 2026
 08:19:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] gzip: fix CVE-2026-41991
Date: Wed, 15 Jul 2026 10:19:22 +0200
Message-ID: <20260715081922.14996-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0275.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB1148:EE_
X-MS-Office365-Filtering-Correlation-Id: a347d74a-967c-4264-17eb-08dee249c983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|3023799007|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1PdYxbzXh6YeRO9gI85uqWTOpPvxBi4tZoTgQmPd0WjZxSAeL1g8q/wRBr4Odokn8IHNf1KAvtUBEBA8W/R/DE1Euvzh21gc6bge9Hwc3OwY3aIgnnQhWZDA4gQnjMwauqeO4FBRlVZLs8oIn5+MR6hojcMRANSfUFOdoVC1C8qAryAegWD/uJLVypMaZqmTOwurB3YM1J1SOZfajEGOkaAzLabIQn1eh9FgoPz2cPX5WMJQbrmWvwW2jLlA3yrJW7hxSIf5+LIVLvzzyXryjtxqCFzHVM4RhVFLP0BgNwOwO65yrZA6zd0+WSvTjeo/GgNQaeVOZNJ/7QS2yOUPbQqZrDTe5oYJeKgXF1UosXrJY3fzIsnA9HQ+eikgb+Myn20lyfBPwKpSEPELrqHsCfdeh7ZUp8DyTa0mhg2oCkmSBODNyhZehlNBjd+4uCCbxfulfFU9yc5czdWyz3PVwyOKhBmMNdTPbzdHMw9LpE+e7SKNpFBJSnzflJP+YU18ynOoKry5XlDsQWAjaTcLG3VVxZ0pOZ1Piig9BXygtmDsHf/qF/Bv9qCeIfkK2NYxSSl9Fip9uKWRIQExpdjiggztx5xtwIN6x+qJNVBytCtUmyNlZv8BkeZUD1pE64W6WV8n3VTovlJ/u2mHlf3BJca0LqByK5XC4jxAikOwoKc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(3023799007)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sje7zTPG3sFuHnb2/e3tYepq4U2R3jLj0FNNwm03d1A9UUABg0zHftSYVmzi?=
 =?us-ascii?Q?AXvxDC58kTYV7xJllq/zmFT+ZXCQyVxm2N2+Z+OLmkMP+ze+KAvlWKFd4Ucs?=
 =?us-ascii?Q?MQ08USwj+snJBGrRnFDNUbEz6ONlQmPitg8oPXer4j1dT/bx//vSZWTSpZ7l?=
 =?us-ascii?Q?HmSIAIGv2/OfZCiWsy2sZ8gm/EEbCTjjk7mtKGJ+Fb1/vNJ9H51DGKJUbSO3?=
 =?us-ascii?Q?pYlEzPAlCzRRoBFsAS4SGG1G4hyXIjaA2EZr4vIrU1PUHRZwj9f12tYXn0l3?=
 =?us-ascii?Q?Bo7lPZzbPRyKQUCdgnXpPCYkdkw5m9lVArBJVX1CU6jCHtyktyo/JIj8O0R6?=
 =?us-ascii?Q?YxgHuuxt6G/N6j9tZefLDPjgA4YRAkd+i/KfSlEzA1wRSFPRhq/fF/KmgpF9?=
 =?us-ascii?Q?gpRILh96m8qFIEgI/IHWE4kj9NmB6r7eZrYcTGe/uDnCTuYLvSW7N85/31Fh?=
 =?us-ascii?Q?SPOKw1Sk8NbTYU4GY/CNPoN67zs7g4ES1FYBrj7TYGuD0XDG/Ck/H34abW4N?=
 =?us-ascii?Q?/fUEEMCjFa7PJoZfqMko1FoG5mXGhrP9rsAqKiwifdFfIzzKXfmWfpyk5Pf7?=
 =?us-ascii?Q?ywkN9HRiP0FQuzj82SO0OSIb1/tDTDWlVJy3rWRLs3j+C/yyH+c/IC8GoXgw?=
 =?us-ascii?Q?qg+nILECpo8Qy956KjXiSyUe3XuzcnAphmLSXzoPVFetacv965bXX/L8LwUs?=
 =?us-ascii?Q?ozUjzmn7ck7DXZg+ssSWVPuvpAgE3mHZLur4sVeo/KsLMCcrTEHUi2VI4sY1?=
 =?us-ascii?Q?qZZx1yBTxiAAre2P8VMUFP+cU1oODzTnSoI+rRLHHq4xLpRUB26hqsp6bCPR?=
 =?us-ascii?Q?qu491TK1LTilBjvUluMQaBdtT1YF+XfJjACJelqFAmMm4qHuxe3x25bjDkFS?=
 =?us-ascii?Q?pnAhSwtyZpooCIHMmQuyd1PQmEFg6Xlrg5OUeBME7bBdLkLu2GGH/Iapi2rQ?=
 =?us-ascii?Q?LobsRkGVfju7Bgor/BgLQJtdMprXpWZTkL5IdvbZDdTJb/weqfs9OYIkoHfT?=
 =?us-ascii?Q?hl8jBK0BEoqykItzrJaaTTAELePGvWkb6mjybrV0pNC8TIikJx+15CL89oaJ?=
 =?us-ascii?Q?ePQEWn/X4GYSt9WslfEnQqJqb77uhGirArdaZIPgDlVnH6Xc3zbsnf1KxP/V?=
 =?us-ascii?Q?+ruklG0LHgaU8HqZYwA2kLzvjWJPxFhp2KBoCBROJZnMo4idlDV7Tod8eAab?=
 =?us-ascii?Q?4/cillxfhXRjsO5Wy/fZOULMmtGU4unRByxUFv2j6Svfa3mTBggs02Z4EjR5?=
 =?us-ascii?Q?d3uqhXQz2tie71ODgqSalM6IbQJPBfjjSgLSbg2HGkjZ1znuM2NUB0gDgUi0?=
 =?us-ascii?Q?KpjD1BYB+6CEdHDQj2MzO2tCUOpCrtQov4EQKgaQ1/dknZaLgE/Z/jm3Z+9Q?=
 =?us-ascii?Q?URigFHRk2KPf+AzMf0I+zp92pyWdtroUQshoPhzOtCJgj3cz7MBT0enON+kd?=
 =?us-ascii?Q?t4TORn5pw/qtpptzgey8y33CtuTvBaNhsef7J+woX8nk/EXdl+GpBH2L7s08?=
 =?us-ascii?Q?NNAssZQAdNngoRHZ4nVTZDfJmO0F9UNMjHmCKzPYT7EaTq2j+OGoJXlxkBYU?=
 =?us-ascii?Q?52HNShE+NH6/l5H1ZVdzZjydK1qRoowLDI2EE5s97ybgdDOh5TjS/w5k5dN3?=
 =?us-ascii?Q?VOVqQKHdzH7MWczKV69Urf2zve1QunVnyg9l97mevZe9qFG2kuSmLqZ242ux?=
 =?us-ascii?Q?Tnt88a2nZiHOU7XP1VVq3EM+JijA5lcsrczCb8PgATtnt0EOd6CBKh6KmR94?=
 =?us-ascii?Q?nmfjsFGttQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a347d74a-967c-4264-17eb-08dee249c983
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 08:19:27.5819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqwVwIlnVQlTMHnCU7IR/4ihK/1mw2VuzWBTnJrqDVtVRW4lpWilsudkHGIkpaUTtnFugsgeaiaROIHVDcfJmgc34yV88/ibAeA7tnndgjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240984

This patch applies the upstream fix as referenced in [1], using the commit =
shown in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-41991
[2] https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=3D4e6f8b24ab=
823146ab8776f0b7fe486ab34d4269

Adapted for gzip 1.14:
- Refreshed NEWS hunks to match 1.14 release context.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../gzip/gzip-1.14/CVE-2026-41991.patch       | 86 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.14.bb       |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.pat=
ch

diff --git a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch b/me=
ta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch
new file mode 100644
index 0000000000..b1a3644020
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch
@@ -0,0 +1,86 @@
+From 661918c7c0d5acf52508107d6bcdeb72a526ce52 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 16 Apr 2026 12:11:44 -0700
+Subject: [PATCH] gzexe: use -C if lacking mktemp
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+(Problem reported by Micha=C5=82 Majchrowicz.)
+* gzexe.in: If mktemp is needed but not installed,
+use =E2=80=98set -C=E2=80=99 to avoid a race when creating a temporary fil=
e.
+* zdiff.in: Use the same pattern here, even though the old
+code was probably OK anyway.
+
+CVE: CVE-2026-41991
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.git=
/commit/?id=3D4e6f8b24ab823146ab8776f0b7fe486ab34d4269]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ NEWS     | 13 +++++++++----
+ gzexe.in |  1 +
+ zdiff.in |  7 +++----
+ 3 files changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 881b6b6..3a05d7e 100644
+--- a/NEWS
++++ b/NEWS
+@@ -4,10 +4,6 @@ GNU gzip NEWS                                    -*- outl=
ine -*-
+=20
+ ** Bug fixes
+=20
+-  A buffer overflow has been fixed when decompressing an .lzh file
+-  after decompressing a .Z file.
+-  [bug present since the beginning]
+-
+   'gzip -d' no longer omits the last partial output buffer when the
+   input ends unexpectedly on an IBM Z platform.
+   [bug introduced in gzip-1.11]
+@@ -18,6 +14,15 @@ GNU gzip NEWS                                    -*- ou=
tline -*-
+   'gzip -S' now rejects suffixes containing '/'.
+   [bug present since the beginning]
+=20
++  A buffer overflow has been fixed when decompressing an .lzh file
++  after decompressing a .Z file.
++  [bug present since the beginning]
++
++  On old-fashioned or limited platforms lacking mktemp, gzexe and
++  zdiff no longer have a race when creating a temporary file.
++  [bug present since the beginning]
++
++
+ ** Changes in behavior
+=20
+   The GZIP environment variable is now silently ignored except for the
+diff --git a/gzexe.in b/gzexe.in
+index 1267d6e..09a2571 100644
+--- a/gzexe.in
++++ b/gzexe.in
+@@ -127,6 +127,7 @@ for i do
+     tmp=3D`mktemp "${dir}gzexeXXXXXXXXX"`
+   else
+     tmp=3D${dir}gzexe$$
++    (umask 77; set -C; > "$tmp")
+   fi && { cp -p "$file" "$tmp" 2>/dev/null || cp "$file" "$tmp"; } || {
+     res=3D$?
+     printf >&2 '%s\n' "$0: cannot copy $file"
+diff --git a/zdiff.in b/zdiff.in
+index a8689a0..c04a8c0 100644
+--- a/zdiff.in
++++ b/zdiff.in
+@@ -156,12 +156,11 @@ case $file2 in
+                           *) TMPDIR=3D/tmp/;;
+                         esac
+                         if command -v mktemp >/dev/null 2>&1; then
+-                          tmp=3D`mktemp "${TMPDIR}zdiffXXXXXXXXX"` ||
+-                            exit 2
++                          tmp=3D`mktemp "${TMPDIR}zdiffXXXXXXXXX"`
+                         else
+-                          set -C
+                           tmp=3D${TMPDIR}zdiff$$
+-                        fi
++                          (umask 77; set -C; > "$tmp")
++                        fi &&
+                         'gzip' -cdfq -- "$file2" > "$tmp" || exit 2
+                         gzip_status=3D$(
+                           exec 4>&1
diff --git a/meta/recipes-extended/gzip/gzip_1.14.bb b/meta/recipes-extende=
d/gzip/gzip_1.14.bb
index 99174a58c5..d6bd36f89f 100644
--- a/meta/recipes-extended/gzip/gzip_1.14.bb
+++ b/meta/recipes-extended/gzip/gzip_1.14.bb
@@ -7,6 +7,7 @@ LICENSE =3D "GPL-3.0-or-later"
 SRC_URI =3D "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
            file://CVE-2026-41992.patch \
+           file://CVE-2026-41991.patch \
            "
 SRC_URI:append:class-target =3D " file://wrong-path-fix.patch"
=20

