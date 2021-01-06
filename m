Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.88])
 by mx.groups.io with SMTP id smtpd.web12.6127.1609929238021782187
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 02:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=mwEFibYT;
 spf=pass (domain: kpit.com, ip: 40.107.139.88, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtRq8YoCmC3ak9T3qIhUjbnDKEyU8sZHG0r45iWkG1wunuHnsF8dqLgildzKYFELWzaJAYV84P77SmHHzp8GZ46/jYk0WiyIsMVSfC5k64+zOzf5B30FRfHRFWYRvG9rBFnrWuzh+RHgw9K4He8yo5M9pKk0OxainCXXaoZO42D8hwyxmNrM4E0XWe+aKrB8q8iM3scHvHCSG0OMHopd6VsUd7rKJBge63+1oll05f3/UegWoM3SJ7FGUvmAjY1J8cvoU52CehAHX3AEPaaKVPgjdc7WLPaA7rEpP/lEcW9CDLktU8z9aVBYoyNxTnX+UzbYy13IEswKh4Rz2Gxqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyyRknBQ1X5fuihbDPI3C1//hqGqgrUNiPYCSIatOF4=;
 b=lFAaWuvwhTkItIuIdvUA2ZRxPYsc9S41WthEzxlkCMDkiP2dwPEMM4PgcK/5td4wReincF3dECtWEVq8LtWxi945rRfTCdqPvkV9BFU91wQ4UOVbc81LtM/Cpz2nxNlmDKoiXLFv/k4hT2FerjTGTvqGDL4vnNH+6scBxtHvj082fz+IrDM73UM2raSUzkGqUhQcQXQmFnpTsQeTSh7nw7bfvnsAKKHmf7J7izDLYwShMKTNtjhNMraTzccjQeSXBQXf9Bj27zxVGD01wHEDQI6xQJ1axT6VU5Dj9QLpdmXqzfoo36CcVF9XkjCIUZjd++04T+wrMuYy7avGaum5rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyyRknBQ1X5fuihbDPI3C1//hqGqgrUNiPYCSIatOF4=;
 b=mwEFibYTsroL+Gj/CRZDkJ7VDsKEAHtcLlytYFKUP187bs+6ZfR0K1aVraXAUX3/wLSQjpH0If7WeDUnK7gZgUN26pAM01E/yjGhvIJZRwgXVULTBlCSDY0SVUQtZAUiF7i5q4Lq9KSkL1MOf09dpHWH9rsNSJzdGkaOV+xETC4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BM1PR01MB2994.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 6 Jan
 2021 10:33:49 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::68af:77fc:86a1:7a9d]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::68af:77fc:86a1:7a9d%5]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 10:33:49 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Armin Kuster <akuster808@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Sana Kazi <Sana.Kazi@kpit.com>
Subject: [poky][sumo][PATCH] ncurses: fix CVE-2019-17594, CVE-2019-17595
Date: Wed,  6 Jan 2021 16:03:04 +0530
Message-Id: <20210106103304.13276-1-sanak@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:1ff7:321a:8d2f:524c:b2dc:b8ba]
X-ClientProxiedBy: PN1PR0101CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::15) To BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::17)
Return-Path: sanak@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:1ff7:321a:8d2f:524c:b2dc:b8ba) by PN1PR0101CA0029.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 10:33:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 37f8fbe2-c3d0-4de9-3a78-08d8b22e8e1e
X-MS-TrafficTypeDiagnostic: BM1PR01MB2994:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB299496D6545374640E487C8999D00@BM1PR01MB2994.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+ZO/gk/fKfa6L6snKk5vYmwh5ka1cLf/VjKVlW9ULOoHISXqt1+uLmpdNqsSZpRE2U6Yq3duzzRqiVXYC8szrsKEPbhzhCObdxdlNW/l1gIr/S0gNpmch/aYi74lUa+yNq8KZ3nSZnqJw0sicqQLfIKdzs4oYTI14nFtTP9rKU3IvM6cJzRba/xDyq5kiUxqgcf/LRH9P9Ul53/u4zIaO0z24jESLZgWgMr85I7EuTV+eRl6LgH7U8+DL36V43Vg16lDQMJAx6CljLtELuhnZjC+DyCqfhTX1Gv55HtPnRCQegpymEseJD8X1JwOQOs9sEHoQbaefgLLuXf7SNqiKh0kX9JeglL4KpwUxL5I/K+cTmf7MkeUuRIrZm3li+zPKW9tRFu5XZiw3jvo/M4XRh8vSM0dInMkoUm1aiwmWP2/r9M6a3Ocjk+1DLjPHtdoZwxh5mCrXiDQa0S22scjDsEE6UfB5nAIdmGT67Ow793rPAOzJ/zavoB513OEbi27t1FxsP4JTssvI1a5/mu5tg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(366004)(66556008)(2616005)(66476007)(186003)(6512007)(66946007)(5660300002)(54906003)(478600001)(6666004)(8676002)(316002)(8936002)(107886003)(69590400011)(52116002)(6506007)(36756003)(6486002)(4326008)(1076003)(16526019)(2906002)(66574015)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?dBVErolxXlC+GbL0WH3l19u5qRePwtOX+HoUH5+mtfLkdvBzLlZVOQBgf1RC?=
 =?us-ascii?Q?iFqWpK6nSD5gRczGh4vVlgN3i5+6HizG/lzqBWlp0XocyECE02eBm4cJ4STd?=
 =?us-ascii?Q?Yuxi/bO/VjQ6gJU1CpT+s7Uk1qJptMlWlioUOD+c3zSShaY3VT/LpKacyEpD?=
 =?us-ascii?Q?TXOzIf2CEmzplPQL5j4uk9t+ORcB43U8vYHsjhKCO1hTv8E7FNlYSKRQqwdo?=
 =?us-ascii?Q?dYRrrEbHGtXAsuDDNEIMbp5Ld369bZTOxGUi8iWh/bvTXhOZEC7rqtxY5xcV?=
 =?us-ascii?Q?PyFb5/xbKUVtHpUedEpHoagMqK/9fQvwHJtz5n0dtRs3NEB/k3EuzaX511F0?=
 =?us-ascii?Q?OEsd1h4AtKSpoU25sPQlYQunHhBIYA8Ct/BBprZN4L6p8mNFsB6+6AiYiRyC?=
 =?us-ascii?Q?h8loQNhJ5XiTSaRXI0SQrRf2zHNvnvGnz6o0ExB8OkJCaNHGLGnewUPwwVZL?=
 =?us-ascii?Q?Ymd2VFC8CezXgeldUnUqPBzpz3AsuCf4uN1eXPKZXiyZ7evsvxTWxk/Eut4X?=
 =?us-ascii?Q?J9IW2vatqpgJ2qH/HpB0mz56mKEx3LgaIVT9OHlv1ip4Syfcvz816qRQfPhF?=
 =?us-ascii?Q?IwqecsJDycTW7TV+yN9+U+U/XeHCLB0HB9Brf5W+15emRb9WM2iQeJUEFo5K?=
 =?us-ascii?Q?kjPSiLHe0RGUncaKjkl2kh3VnorZ7aWme5LgX5NtOo8err+vp3Uy0WRhaCRJ?=
 =?us-ascii?Q?CWdNleyt8D+6lnaFN4ycBJ1pXQuZISykMJMdLCmdjbDhzL56EFKX8A23F9Q6?=
 =?us-ascii?Q?0tgL4W42H883LphpCMgpJjpxYOrBTvzKqLhmN69fb3AfaifNsTsjd7GDG0Ak?=
 =?us-ascii?Q?lXuNCYJJA3OmF4nip5g0W44B2wmVRVZkZ4Cq4pYp9DRZk/fhZACIoXDNIr2e?=
 =?us-ascii?Q?Bb68OPUG9ef70hh/WZEngL8oORFPIILsBBxHTDGPI4ptdslkwkPp8ihzc2tR?=
 =?us-ascii?Q?VptAsBj7+DqYyuBojy6IuXYNwyjbVaVD501YahjS5rBWoo6CHQbawhKXI0Z5?=
 =?us-ascii?Q?UL+oXEIrEIjpcDaSsIt4pIyJ7Fz7jaG0RI5h8Bpj/T/iMw6J7A2Xq7LeXOOu?=
 =?us-ascii?Q?3HzWnPgp?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 10:33:49.3781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f8fbe2-c3d0-4de9-3a78-08d8b22e8e1e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgNDkKOR9QhTkC2MSlk03DI/LzzQvxlNQdQae1E72hcUUte6uE3o1BKC9MKbexL0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2994
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport changes to tinfo/comp_hash.c, tinfo/parse_entry.c,
and progs/dump_entry.c from upstream to fix CVEs.

(From OE-Core rev: 7ec70aeb0c6f6080523efa0f983fa36b92cb5558)

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 ...selective-backport-of-20191012-patch.patch | 158 ++++++++++++++++++
 .../ncurses/ncurses_6.0+20171125.bb           |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/0001-ncurses-selective-=
backport-of-20191012-patch.patch

diff --git a/meta/recipes-core/ncurses/files/0001-ncurses-selective-backpor=
t-of-20191012-patch.patch b/meta/recipes-core/ncurses/files/0001-ncurses-se=
lective-backport-of-20191012-patch.patch
new file mode 100644
index 0000000000..989a8ccd4e
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/0001-ncurses-selective-backport-of-20=
191012-patch.patch
@@ -0,0 +1,158 @@
+From 064b77f173337aa790f1cec0d741bfbc61a33d31 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Fri, 18 Oct 2019 09:57:43 -0400
+Subject: [PATCH] ncurses: selective backport of 20191012 patch
+
+Upstream-Status: Backport [https://salsa.debian.org/debian/ncurses/commit/=
243908b1e3d81]
+
+Contents of the upstream patch that are not applied to comp_hash.c,
+parse_entry.c, or dump_entry.c have been omitted.
+
+CVE: CVE-2019-17594
+CVE: CVE-2019-17595
+
+Signed-off-by: Trevor Gamblin  <trevor.gamblin@windriver.com>
+
+---
+ ncurses/tinfo/comp_hash.c   | 14 ++++++++++----
+ ncurses/tinfo/parse_entry.c | 32 ++++++++++++++++----------------
+ progs/dump_entry.c          |  7 ++++---
+ 3 files changed, 30 insertions(+), 23 deletions(-)
+
+diff --git a/ncurses/tinfo/comp_hash.c b/ncurses/tinfo/comp_hash.c
+index 21f165ca..a62d38f9 100644
+--- a/ncurses/tinfo/comp_hash.c
++++ b/ncurses/tinfo/comp_hash.c
+@@ -44,7 +44,7 @@
+ #include <tic.h>
+ #include <hashsize.h>
+
+-MODULE_ID("$Id: comp_hash.c,v 1.48 2009/08/08 17:36:21 tom Exp $")
++MODULE_ID("$Id: comp_hash.c,v 1.51 2019/10/12 16:32:13 tom Exp $")
+
+ /*
+  * Finds the entry for the given string in the hash table if present.
+@@ -63,7 +63,9 @@ _nc_find_entry(const char *string,
+
+     hashvalue =3D data->hash_of(string);
+
+-    if (data->table_data[hashvalue] >=3D 0) {
++    if (hashvalue >=3D 0
++      && (unsigned) hashvalue < data->table_size
++      && data->table_data[hashvalue] >=3D 0) {
+
+       real_table =3D _nc_get_table(termcap);
+       ptr =3D real_table + data->table_data[hashvalue];
+@@ -96,7 +98,9 @@ _nc_find_type_entry(const char *string,
+     const HashData *data =3D _nc_get_hash_info(termcap);
+     int hashvalue =3D data->hash_of(string);
+
+-    if (data->table_data[hashvalue] >=3D 0) {
++    if (hashvalue >=3D 0
++      && (unsigned) hashvalue < data->table_size
++      && data->table_data[hashvalue] >=3D 0) {
+       const struct name_table_entry *const table =3D _nc_get_table(termca=
p);
+
+       ptr =3D table + data->table_data[hashvalue];
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
+index f8cca8b5..064376c5 100644
+--- a/ncurses/tinfo/parse_entry.c
++++ b/ncurses/tinfo/parse_entry.c
+@@ -47,7 +47,7 @@
+ #include <ctype.h>
+ #include <tic.h>
+
+-MODULE_ID("$Id: parse_entry.c,v 1.91 2017/08/26 16:13:34 tom Exp $")
++MODULE_ID("$Id: parse_entry.c,v 1.98 2019/10/12 00:50:31 tom Exp $")
+
+ #ifdef LINT
+ static short const parametrized[] =3D
+@@ -654,12 +654,12 @@ _nc_capcmp(const char *s, const char *t)
+ }
+
+ static void
+-append_acs0(string_desc * dst, int code, int src)
++append_acs0(string_desc * dst, int code, char *src, size_t off)
+ {
+-    if (src !=3D 0) {
++    if (src !=3D 0 && off < strlen(src)) {
+       char temp[3];
+       temp[0] =3D (char) code;
+-      temp[1] =3D (char) src;
++      temp[1] =3D src[off];
+       temp[2] =3D 0;
+       _nc_safe_strcat(dst, temp);
+     }
+@@ -669,7 +669,7 @@ static void
+ append_acs(string_desc * dst, int code, char *src)
+ {
+     if (VALID_STRING(src) && strlen(src) =3D=3D 1) {
+-      append_acs0(dst, code, *src);
++      append_acs0(dst, code, src, 0);
+     }
+ }
+
+@@ -1038,17 +1038,17 @@ postprocess_terminfo(TERMTYPE2 *tp)
+       _nc_str_init(&result, buf2, sizeof(buf2));
+       _nc_safe_strcat(&result, acs_chars);
+
+-      append_acs0(&result, 'l', box_chars_1[0]);      /* ACS_ULCORNER */
+-      append_acs0(&result, 'q', box_chars_1[1]);      /* ACS_HLINE */
+-      append_acs0(&result, 'k', box_chars_1[2]);      /* ACS_URCORNER */
+-      append_acs0(&result, 'x', box_chars_1[3]);      /* ACS_VLINE */
+-      append_acs0(&result, 'j', box_chars_1[4]);      /* ACS_LRCORNER */
+-      append_acs0(&result, 'm', box_chars_1[5]);      /* ACS_LLCORNER */
+-      append_acs0(&result, 'w', box_chars_1[6]);      /* ACS_TTEE */
+-      append_acs0(&result, 'u', box_chars_1[7]);      /* ACS_RTEE */
+-      append_acs0(&result, 'v', box_chars_1[8]);      /* ACS_BTEE */
+-      append_acs0(&result, 't', box_chars_1[9]);      /* ACS_LTEE */
+-      append_acs0(&result, 'n', box_chars_1[10]);     /* ACS_PLUS */
++      append_acs0(&result, 'l', box_chars_1, 0);      /* ACS_ULCORNER */
++      append_acs0(&result, 'q', box_chars_1, 1);      /* ACS_HLINE */
++      append_acs0(&result, 'k', box_chars_1, 2);      /* ACS_URCORNER */
++      append_acs0(&result, 'x', box_chars_1, 3);      /* ACS_VLINE */
++      append_acs0(&result, 'j', box_chars_1, 4);      /* ACS_LRCORNER */
++      append_acs0(&result, 'm', box_chars_1, 5);      /* ACS_LLCORNER */
++      append_acs0(&result, 'w', box_chars_1, 6);      /* ACS_TTEE */
++      append_acs0(&result, 'u', box_chars_1, 7);      /* ACS_RTEE */
++      append_acs0(&result, 'v', box_chars_1, 8);      /* ACS_BTEE */
++      append_acs0(&result, 't', box_chars_1, 9);      /* ACS_LTEE */
++      append_acs0(&result, 'n', box_chars_1, 10);     /* ACS_PLUS */
+
+       if (buf2[0]) {
+           acs_chars =3D _nc_save_str(buf2);
+diff --git a/progs/dump_entry.c b/progs/dump_entry.c
+index d0e420ec..8a47084a 100644
+--- a/progs/dump_entry.c
++++ b/progs/dump_entry.c
+@@ -39,7 +39,7 @@
+ #include "termsort.c"         /* this C file is generated */
+ #include <parametrized.h>     /* so is this */
+
+-MODULE_ID("$Id: dump_entry.c,v 1.168 2017/09/02 21:01:54 tom Exp $")
++MODULE_ID("$Id: dump_entry.c,v 1.175 2019/10/12 15:59:07 tom Exp $")
+
+ #define DISCARD(string) string =3D ABSENT_STRING
+ #define PRINTF (void) printf
+@@ -1136,7 +1136,8 @@ fmt_entry(TERMTYPE2 *tterm,
+                               *d++ =3D '\\';
+                               *d =3D ':';
+                           } else if (*d =3D=3D '\\') {
+-                              *++d =3D *s++;
++                              if ((*++d =3D *s++) =3D=3D '\0')
++                                  break;
+                           }
+                           d++;
+                           *d =3D '\0';
+@@ -1396,7 +1397,7 @@ one_one_mapping(const char *mapping)
+
+     if (VALID_STRING(mapping)) {
+       int n =3D 0;
+-      while (mapping[n] !=3D '\0') {
++      while (mapping[n] !=3D '\0' && mapping[n + 1] !=3D '\0') {
+           if (isLine(mapping[n]) &&
+               mapping[n] !=3D mapping[n + 1]) {
+               result =3D FALSE;
+--
+2.17.1
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb b/meta/recip=
es-core/ncurses/ncurses_6.0+20171125.bb
index 6c4b96f428..ed5181f74f 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb
@@ -3,6 +3,7 @@ require ncurses.inc
 SRC_URI +=3D "file://0001-tic-hang.patch \
             file://0002-configure-reproducible.patch \
             file://config.cache \
+            file://0001-ncurses-selective-backport-of-20191012-patch.patch=
 \
 "
 # commit id corresponds to the revision in package version
 SRCREV =3D "5d849e836052459901cfe0b85a0b2939ff8d2b2a"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
