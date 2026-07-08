Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12E3C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 18:53:53 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15971.1783536829675630691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 11:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=U7RLa3OG;
 spf=pass (domain: est.tech, ip: 52.101.83.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6y03YoC4suX3CFyBULYG2FfkcKDogXZ4XJj+WpOmqdn37w08FBZd6wiRJS4x/GXB69KcVaDJjJ8anvW6DBjbIad3Rd78F7KGBbbA1j3/Hi0uoeOIrZyzjmrLgDbr59YOiXXzVRycUvp4y2U5FT37NRrQegZJWLZyAUhTo8sJVh+ZBlwmf/Iq06xWxMP+yRlfzixxg3e9hMNGb6nmnSbysbFZQXTzwHuXxEiPid0tnAQHyL+3vwHeHku5YTLt+/XLzOBhwhujxvOqiUUn57eXW0kg2IOPTdiC0H7uQr6ALYl/MhSp0Oy4mB64eoe/TibmvQduuFaD1P+/B9ZzahuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVbTttVeSBtxG0ZT0N+L5sYuL2BB9mzr+F5jgVdfmDQ=;
 b=O4Uol0lKcEvp7hPsg9GUpN+ywgFjOvSB9FPRtUBTdqdCWNq5l0QczSRBJPlzucpoPosexTCfMuKnjeBvKy76kxo3al8B/gDruxgK1uQH7mMrdG0KXnGKxL1SfU7TC9C6Y+SFYsbzgktE473TR2ELoH8WMLqbKd9AH5e7BtVcYKQRc2SrJHonZT6uqt9YHYz4Dm9jH8HwM8wgAd/21DF2WtZCkPUfOByD2jc+8IIskDOijISdmCX5/kGIe9Q8itL3T3VKctsUB7WQ7RIUT+onGijML/ipKJx6ThDMs6q5fAy23pQzVs4x3vIlvDBNp2OqtUbZ6DBKNgfHsu4hij/hug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVbTttVeSBtxG0ZT0N+L5sYuL2BB9mzr+F5jgVdfmDQ=;
 b=U7RLa3OGC8D20Cjxnnik80yvAnBR5OYu95XZpo7Hj3Spkyb/jkZi1FEuRlO6LAXgOQSOg1QHPEf4d5cl7r+FsZd2XUdZVPiuX70X23jllRvgd1k+MFpwd7EfJkgNRTdqRtLPEqSYKFti4wB9dS9OnNgbFgIgcUFpx8zPPSZYUvqJAKj+RmRv1dsksp3Ov/PVbpvq+6+exibbbMZmejHVDe6yIf3j5jJKdWOgahreVpYaA+NwI+i1MOYmiLVipkaFa5EnH78+6m563DNZXhq95BFUtVrPQ50Cne+EvszeSFyyIG3XAuebsvx6jsnzVn/V3dnuaoC/MLaVPJ8EOeJNmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:263::18)
 by DU0P189MB2017.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.12; Wed, 8 Jul
 2026 18:53:44 +0000
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96]) by GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96%3]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 18:53:43 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2] gzip: fix CVE-2026-41992
Date: Wed,  8 Jul 2026 20:53:32 +0200
Message-ID: <20260708185332.91425-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260707143421.34255-1-jaipaul.cheernam@est.tech>
References: <20260707143421.34255-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::16) To GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:263::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P189MB2954:EE_|DU0P189MB2017:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e21d19e-3900-4b37-b904-08dedd223bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|376014|3023799007|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Zn8HJG1oadw9jnmgSGrYPTAr3ZzsNHlmgMNHd1WYFlUFB+4qGC3vC+bjp+xPFdN9h1V+UL51UJURHGL4W6+8ZqTkXzTWMcNzeObhw7Q2rJ7+nkdysy5WvUdmFWKWTfSRbxcm+4QYi1vj3F6orMSfgQCYvdxTtEiYWnOh/9/08zyuEFdq+u48h50Ri+VG7c5E0hE5LboubWgCQzz2xGH0P8q9P0qQvcyJ5E9Nkq9KRppXyWAExlthubAkIDhfcgyy2FReQTiZxK3NMIkR8pig+/Sp2pmmyY+M2qaiDXUvgnxbI/+HrsVLQuJ9y8M5AWk5lErTLTdA9WFBWxN3Dvv9Yg4CjqfU4TCN5pDi5OfbUrIw1MJmJ5BW2aEK9eslkD3E0KhfgxoETc6AOseZ/z0H3iX1ku8m1AuumVB1R75p/qE5AZAmaTLw5oX7NVdFD9p22ww+WMp6ff09gmzPRkVEE+wFoTnRFLi93eJsMsUvzdrEYwS9UtSaiMt7Pvd70jL1zn5/31ih/2O+JS1dEAYgGMlXrnUueC2Yzo8cxuGV0Vh+6IdE6qfQV5xkyM2SvAkxEIvUeFbIlUOROiuGJuvcL0SvThrenlV7NO07j+49JtnbBZ9kTO8dPDGvTsM0DSSEPJ6XTaDuoFlxxaZd+m38/GMqpj2GDyN4Lsa+thet8Q0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2954.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(376014)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SCUNOWmSoJQxcGab5VATAnOmidzkEZOuFg2+ObtgWzKD0ukhjXmxIzsd5mUA?=
 =?us-ascii?Q?CZgVBuGkqZ4leJ6hFZOIoTaWWpNyURLktl40uSjJybkBDKcBSy0yofAA1Qsm?=
 =?us-ascii?Q?9ynWu51ngy/TU0SGtnc2SUBMwkQry0mhTeJJIvNqGUnIGClahVQHGI4kIFjl?=
 =?us-ascii?Q?/yNE77TBVqyIBD1/Zg42tgpnPOVc2v9hvdnXqvFhWLrkiScFqDPUce4dDhyc?=
 =?us-ascii?Q?fzRUNjE6eakJwWXp4Nos/PWg567Caw+vh/jmYWtEoriH3ZWlC82BNX1j7+ha?=
 =?us-ascii?Q?/iydTQFdEBXK2uiJBGvUNyLDLX1P4wYUnVhjVOCzcHqOKQOtqkGuttFubx3E?=
 =?us-ascii?Q?ZRbgG44slY4d4w4B9yfZ/NU/iSimTjF95zJKWwJ9SkJ2sPQuM7USabhYciw9?=
 =?us-ascii?Q?G/zgVsKHy0Fb7Ysiwiql67TNwoTYOU43ITOTVyZhR9y3V5ikMj7cjalm5yAb?=
 =?us-ascii?Q?NKOUxNcrVEdz4Po6E6CcNJd1PghWppSEM8p405lBSoYAv31dqyCKD7cGbZHK?=
 =?us-ascii?Q?JNiMNHs/CdCtxvKR5zfaswE1WAirLtUOKnBigeZ5Y8vEKExI5KN38JLGSv3X?=
 =?us-ascii?Q?eeJSs8aofp2lsU+SSELtS9tvu1mXp9rNidQLgyh0UGsT19lCwt7Fj9vaYYDv?=
 =?us-ascii?Q?etJ2OGgb+4YZ8FWhyRYBPiuMlBmMOh6i1GzNLbMnrg4KnqK54a+yMGml1024?=
 =?us-ascii?Q?28bAcNIlWm0LIaArdjpu5UhcfI4Z5KQ6lXTh6+BIKyIszWB+neObCHtDrq0q?=
 =?us-ascii?Q?/Us2EwHX5iSlNgpGt1wODmERKY1cpmkDdTiwUG30gDIXo0E+9ykTn+RJMRo5?=
 =?us-ascii?Q?5ko+iDMyVeLDiWU+7r1i1zjWb3ZgvjcL/vaXWaaI09vcOWvzyTF4rrLuO0PX?=
 =?us-ascii?Q?uXaklfgG64CSYkVDy7F5ruX9pTTS4/N0hYA+noJRxjQvJSHh1MFuSM0ZJDaw?=
 =?us-ascii?Q?5Agw/rMwnQ42hYRBtUwD1QCp6SkfFtKG0j8PdkcwLiJmmGjO87D/zVZrC3nq?=
 =?us-ascii?Q?JH2XKyoE1HNETwp9nhWknCoFiJlmj8ReyOeM1H1YWVFPCPriaI7uWu7uI8uI?=
 =?us-ascii?Q?RMbxWNfz8QtT9q2aul6X2lo8AuklS4aQ0/rt42m5hkQei2bKnQUiU+yAl+ZV?=
 =?us-ascii?Q?sauul5xaKxGmvgAUWBKKHNcmBaZtjdYWYXQsk6DnO9BQMyPIwqExq3rRZhUn?=
 =?us-ascii?Q?2W349vBtjK6lhjuJJhtDbmVIpalhSIT653JmFO2VMLGSjPNuuipbBm9OJXc0?=
 =?us-ascii?Q?6oKfALvZHaSBlFhQeizXhW7eTAFW8v3X8hH3zgtTAcPiph/Wx1CjUAu5bUI3?=
 =?us-ascii?Q?ydp5e/7INGuKm6F+VNp5kfB5QaHjWcTa0sE7xClJyaRxJwj3/bATT3/UHqhM?=
 =?us-ascii?Q?ezstoPNawotUkILfkRy6srrXnLEsY29HMFNWg9E7lYsvbJeNGU0s5OLKf8g1?=
 =?us-ascii?Q?/hsMnlQo8pw9utd6mTBX6fDfxzzpNSRJUiDN/Dt4ZNyWkKtPMV1UsS9S7LbV?=
 =?us-ascii?Q?gJXfzGgaGrbI9UWszGQkOgUdknEFs7+KV8fFYuqlBQc+npMw8dGTf5nRRK9l?=
 =?us-ascii?Q?nFngFUOq5ttXHY04AOz5NjAel1L1bxrsC3C1TPVVh/rS5FQoEvqmAxEw6zpU?=
 =?us-ascii?Q?oBeZk10xRa5SYFmCXUPWYhl7S2eozI6FOV/RiAJGTkbMRSoFBomD09MY1FNA?=
 =?us-ascii?Q?JQ31oARLp79PktWlzU50GWbeBQ608YIuh/i4N67sZn1myAS4JCiB2N2dlzpK?=
 =?us-ascii?Q?7VfTThhuYvSIjxfYGZOFwKkpjsjrXyfej3c7AdrUsgTL9FtFBn3K2vHusBOk?=
X-MS-Exchange-AntiSpam-MessageData-1: HkVj6EMzyG0mWRfJjV9ymASnn4dOEvpHPZM=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e21d19e-3900-4b37-b904-08dedd223bd3
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:53:43.7588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8H+K0Jo8cUfLRkTSPqZkBdl2ittdmvqS51Idr7eg2Mlu9wkw01q1LsHqPuFYe50x3ejZt2ZpCjdyjKrLx/73j+z9GbnQ23z0fpmJ2hD6u3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 18:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240507

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


