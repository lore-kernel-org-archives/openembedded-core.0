Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.54])
 by mx.groups.io with SMTP id smtpd.web10.20023.1628762279972271543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 02:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=ebbNYhN3;
 spf=pass (domain: kpit.com, ip: 40.107.139.54, mailfrom: purushottam.choudhary@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaHrVnUzbC15JQR2rOQObHZdGIagb0xy0IgeL5xPWo43bifS4WGcyebdlNVcSvrPOBUfqblD5OJTVyLJsniezXnitJIK+RqyrbTzte5RSOECVNfFZHJHMfXmI7kP37AUuPyglZqzVvB26M1bXwTal8go7I1kxYZqPBK2Q1sX/hbOToz8NnBpDCuB5vnELlO/6upow5/WnUftKE3/VuwR5rkhIPP3J5m58gePtKR/bKVBZfH54+mNFHJdwQKZ9GItCHjapxpda6Qnisl6rU1g69HmB30ynsLtGOrU2zZcehzcKKts5XPe3Ilc5EjvMBpIhn5q8nkHVStgaZTAp8lqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujysLaxPQHz2MyLaygO+8YiheITBqDOcueUTX5xwP+A=;
 b=UGK2tahpDPvzdmPAKTn0Z5+MWPcSeO4AhWBOBX9C+HiyUqHv8MQAeykMnQJpULE7DHoxTC9YEYKZzBtHcgFfMOjV58RBFJpvXkVVxC6aKtCClNrfUhnOrufdOCN7E383ODhU2OLwgJeVj4ugjvHfboUhfDTF2fTDiX1sg5I/hnx155DSCSxURBTra4Use4KjWarQxBDNZTg5GTViZcSf0rs68fXOmKQHZMN3FZzhL7XrmPBAP6bJAS4bh6DC2WxZq31ExBP70FWVWIqQlvvbt4AV1E4MJ9qBpnC2k5sz/3kmgTfA0Kv/m6fc3fDSssB9vRwbhtWkIAZoBJK7+REvhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujysLaxPQHz2MyLaygO+8YiheITBqDOcueUTX5xwP+A=;
 b=ebbNYhN3m2HkgJcaA+gz/NFOARUVc7odgEz94IqrBqTf/X8TWgP/8SaMUZFAGC7UZmZ54ABW40/AqzPFiyHNfxjGKOQJpjO+eO5GRcoH8PrA9guo1pOU+fMHP7lGW5RvTPueLZIpO0dZVtaRDcWRxgXt2uazzqaf0Znfh5miJo8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2e::19)
 by PN2PR01MB4713.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Thu, 12 Aug
 2021 09:57:53 +0000
Received: from PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f11e:1343:761a:58a1]) by PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f11e:1343:761a:58a1%6]) with mapi id 15.20.4394.023; Thu, 12 Aug 2021
 09:57:53 +0000
From: "Purushottam choudhary" <purushottam.choudhary@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com,
	sakoman@gmail.com
Cc: nisha.parrakat@kpit.com,
	Mikko.Rapeli@bmw.de,
	Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
Subject: [poky][dunfell][PATCH] lighttpd: Add patch for reuse large memory chunks
Date: Thu, 12 Aug 2021 15:27:36 +0530
Message-Id: <1628762256-3816-1-git-send-email-purushottam.choudhary@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::25) To PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2e::19)
Return-Path: purushottam.choudhary@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2405:201:a410:a032:e03b:9c:c8f6:a21e) by BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 09:57:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70fb78d9-e177-46e3-10f4-08d95d77a685
X-MS-TrafficTypeDiagnostic: PN2PR01MB4713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB4713A05EB934C0221FDA406790F99@PN2PR01MB4713.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:109;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0lcZcowkj5AnPY8yCTUoFSs45kSviIwjGxXvKsNHYRjU1DbZmsMWW3OFfB477TBxmYaDUGSLwKRMV/jgiakyz+3SLWegkGqBX++SZF5ZGNi5/rGQMje2IJZoV+2Q1fvK6FSCg32Xhk5erMykACaGBnKPR4vdnhPmtSTcE02VtY+ctFwAZO7iFCgovPxjE+/fLD7FWMarh3bI2eLrcRajQKa3CTn4LuuShWlgnq80U7g5rhvA/4P1zPrRiskibu7/trVh2aSPxSF8pEfjaPyR6I68CV8d2h1AJNFcu5Lal7NZPVoV4OUAs9FqtlDvwVL3rdLbQu440hZliAg4/fPYxqY+GogJxgtrMTPcv1lpg3QVwbG9/waVAHlvxoDAZo1NmCsONHF5CQWxQ1df9VD47FCnojqcONwHk1gF0MVo8SseBP0/0I3p1ZKqaf2Eqt9SZp0/TcNgpMgbkJAhWaNDkCH462/o2LoceynB0+6m3jfLPr+N/+m5ase7yot9JaPMDEVqmFMGltPGpwMl5rt6S0aSrnI12EAO4iAXRWfKLdcJfZzmHl/aKxJDaNBCT/qOn4k94wFCdXBOLaAc8KAvVLsFEvKabBMuqAe5BbOp6LQhabTHYpcpSdVHfbne9Pf6Xo+h2gfbsUoYhIVlIYgA1yFD6O88BJdVh/PoXBdp+C3afUc5Q9HfMc42/J5VuQ5MpAMEHAVg12n+JIizurJm34rcqIn1/W9AJ5YdNty/Wgo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(366004)(376002)(396003)(86362001)(52116002)(2906002)(8676002)(6512007)(316002)(6486002)(8936002)(66476007)(66556008)(66946007)(38100700002)(107886003)(186003)(53546011)(6506007)(66574015)(30864003)(478600001)(966005)(83380400001)(5660300002)(2616005)(44832011)(36756003)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p9Npm8PPQylq4WdcezctPGrOqXoNoP/QlfE0UHipdkc9ot1qslHRIEPFSQWI?=
 =?us-ascii?Q?JXhTP/3pJpmK/qMaVB9dsoVxV6QDC8VF4KMbHxKQLocg7/SG+Qpbd62Mm/AR?=
 =?us-ascii?Q?zTBLx+Y+dm0jm1nvwkQq9FxBAkwg9KaFOWnhAcKammQFZjeHXI7qJC+PRNbX?=
 =?us-ascii?Q?MPQMMziP2lq3GtLt13cAqlJ7RaxIrofkmWWij4IJZ97mcVNZKFLUmRDWlwtu?=
 =?us-ascii?Q?nYfeP5XlsadBEBYVN4lqhN9gbDLlAJ3RXakswChzuLKFxH4EXrA5nUgRY6ZZ?=
 =?us-ascii?Q?ngUKBJ0YAtySQnlmG9XZXg/nOmZO3ib8d9Fl+EmChPtwae2FIqwqW1ilYaqc?=
 =?us-ascii?Q?GeOuA1H2eP+qXxeRUN2z6aoi89H6jc78lrbLyOg2QzDqOCg1mqGiNUr+DrGx?=
 =?us-ascii?Q?BykAYKNWj2cFvP6ff2A2VNXhxJ0MeaNph5L01nwq1Y8OLlxSP1g7Zww+9zC5?=
 =?us-ascii?Q?AjuxQM1n+lIU22eTLV/GPTKXOo72LLK4xQO9LPI9Ik+5aGOu8F/zuT+8+6Ug?=
 =?us-ascii?Q?/CDE4jQoKqb1OC6N4y75ADVVs8IiBiWgNzv/w2j8J94sWfr1gtXQUnQCoErU?=
 =?us-ascii?Q?pfEkgH4yJJJdXwQyEDNs1iqu+xh6FLQ9FHgho5kL+M8bcG+RxM3UUluJ/z+b?=
 =?us-ascii?Q?yIxE+2I16RHNcaOghUJ00ENLLOaN+9OPT1+xEiXYLC26bht/dqAFLBozStLN?=
 =?us-ascii?Q?yon4nbEefLMIZNM103ebTwaJYm4qODQZdEYCBh7/xxP8YVbtAOLsL8/Ch67q?=
 =?us-ascii?Q?oQQyXbrvV9e2l/3sDAkloNFMKY55lA9Hyzc/8zRYqMdLv6oEG0eD53EKhGYZ?=
 =?us-ascii?Q?tuyfUb86Vgb3hbBpbjH30dko0o/ns2Q7yRdXfkd6lsO6OeDJRGEmFcO3nWlr?=
 =?us-ascii?Q?iuHjm6VnoTknLgiw7hmfugYEhnoYRSZSRLqBa9aBBLr9RpbEJEUb7szA+BY4?=
 =?us-ascii?Q?RTz98UvuKJ/agpqcw091XpNjcDpKv/M3U+RPu8wKEdl4cXMFiECV13WZ90M+?=
 =?us-ascii?Q?w2Olu1d+qtUdS0n021MVmbvbFsCwbJc6Sq937pcXoWqQsWZnVhN8ZrmqEYZ8?=
 =?us-ascii?Q?t31EbaqHeVXC+n6HabSKzjVmLXSU/2ZBrqoykjNIHCn81E0bGtai2zMe5XZS?=
 =?us-ascii?Q?Uvi78gxmXCsEEHvbUA2gv0JzHsuVMfEYMGEgy4UB2YjE/0QoSucAe7dQQBbw?=
 =?us-ascii?Q?s4uoCk6/bpSetUWVvA1k82W7nWiShXh3bmgH2eIyO9jJsRLK4+0bgRhOvFnh?=
 =?us-ascii?Q?BHZhkBuUgZLVKlAAge/PtL4BHBHLxRZUUZqRFF0R9NDqpIcSBr6CvGPWYIZ4?=
 =?us-ascii?Q?X4Qnl+N/lr8wFx0qQs8jVN1Kkydc6/0FBdmMwJXwKw5wFFgU3RDh4d+bjlkx?=
 =?us-ascii?Q?1fR0i25H+zNlL3uiedz8KEJixjP7?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fb78d9-e177-46e3-10f4-08d95d77a685
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 09:57:52.9043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2nBSB2YP3WTqoMPiyCYUc5rqIee3UaRj2VpepAtTZn3ofh4lnO7S+IG1pE/NzE/b1zYCkQXQ2jBChBazHdU1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4713
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Added 0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
to fix large memory usage for large file downloads
from dynamic backends reuse or release large memory chunks.

This issue is caused by a bug in the lighttpd 1.4.55 version and
has been fixed in lighttpd 1.4.58. Hence, it is not needed for
master and hardknott branch because lighttpd has 1.4.59 version.

Link: https://redmine.lighttpd.net/projects/lighttpd/repository/14/revision=
s/7ba521ffb4959f6f74a609d5d4acafc29a038337

Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
---
 ...fig-for-pcre-dependency-instead-of-config.patch |  10 +-
 ...large-mem-chunks-fix-mem-usage-fixes-3033.patch | 224 +++++++++++++++++=
++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb  |   1 +
 3 files changed, 229 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse=
-large-mem-chunks-fix-mem-usage-fixes-3033.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-fo=
r-pcre-dependency-instead-of-config.patch b/meta/recipes-extended/lighttpd/=
lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
index f17bdce..81bee7b 100644
--- a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-=
dependency-instead-of-config.patch
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-=
dependency-instead-of-config.patch
@@ -1,4 +1,4 @@
-From 22afc5d9aaa215c3c87ba21c77d47da44ab3b113 Mon Sep 17 00:00:00 2001
+From e777e2627f7c2c681fbc0a194768f101e0a8fc8f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 26 Aug 2016 18:20:32 +0300
 Subject: [PATCH] Use pkg-config for pcre dependency instead of -config scr=
ipt.
@@ -6,15 +6,16 @@ Subject: [PATCH] Use pkg-config for pcre dependency inste=
ad of -config script.
 RP 2014/5/22
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  configure.ac | 16 ++++++++++++----
  1 file changed, 12 insertions(+), 4 deletions(-)

 diff --git a/configure.ac b/configure.ac
-index 5383cec..c29a902 100644
+index dbddfb9..62cf17f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -651,10 +651,18 @@ AC_ARG_WITH([pcre],
+@@ -748,10 +748,18 @@ AC_ARG_WITH([pcre],
  )
  AC_MSG_RESULT([$WITH_PCRE])

@@ -37,6 +38,3 @@ index 5383cec..c29a902 100644
    else
      AC_PATH_PROG([PCRECONFIG], [pcre-config])
      if test -n "$PCRECONFIG"; then
---
-2.15.0
-
diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-=
mem-chunks-fix-mem-usage-fixes-3033.patch b/meta/recipes-extended/lighttpd/=
lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
new file mode 100644
index 0000000..cfd4129
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-chu=
nks-fix-mem-usage-fixes-3033.patch
@@ -0,0 +1,224 @@
+From 270ffeab77473d2ab30d4d09a9738b47bafb639b Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Wed, 23 Dec 2020 23:14:47 -0500
+Subject: [PATCH] reuse large mem chunks (fix mem usage) (fixes #3033)
+
+(cherry picked from commit 7ba521ffb4959f6f74a609d5d4acafc29a038337)
+
+(thx flynn)
+
+fix large memory usage for large file downloads from dynamic backends
+
+reuse or release large memory chunks
+
+x-ref:
+  "Memory Growth with PUT and full buffered streams"
+  https://redmine.lighttpd.net/issues/3033
+
+Upstream-Status: Backport
+Comment: No hunk refreshed
+https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/7ba=
521ffb4959f6f74a609d5d4acafc29a038337
+Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
+
+---
+ src/chunk.c            | 99 ++++++++++++++++++++++++++++++++++++++++-----=
-----
+ src/chunk.h            |  2 +
+ src/http-header-glue.c |  2 +-
+ 3 files changed, 82 insertions(+), 21 deletions(-)
+
+diff --git a/src/chunk.c b/src/chunk.c
+index 09dd3f1..ffb3795 100644
+--- a/src/chunk.c
++++ b/src/chunk.c
+@@ -28,16 +28,20 @@
+ static size_t chunk_buf_sz =3D 4096;
+ static chunk *chunks, *chunks_oversized;
+ static chunk *chunk_buffers;
++static int chunks_oversized_n;
+ static array *chunkqueue_default_tempdirs =3D NULL;
+ static off_t chunkqueue_default_tempfile_size =3D DEFAULT_TEMPFILE_SIZE;
+
+ void chunkqueue_set_chunk_size (size_t sz)
+ {
+-    chunk_buf_sz =3D sz > 0 ? ((sz + 1023) & ~1023uL) : 4096;
++    size_t x =3D 1024;
++    while (x < sz && x < (1u << 30)) x <<=3D 1;
++    chunk_buf_sz =3D sz > 0 ? x : 4096;
+ }
+
+ void chunkqueue_set_tempdirs_default_reset (void)
+ {
++    chunk_buf_sz =3D 8192;
+     chunkqueue_default_tempdirs =3D NULL;
+     chunkqueue_default_tempfile_size =3D DEFAULT_TEMPFILE_SIZE;
+ }
+@@ -120,15 +124,49 @@ static void chunk_free(chunk *c) {
+       free(c);
+ }
+
+-buffer * chunk_buffer_acquire(void) {
++static chunk * chunk_pop_oversized(size_t sz) {
++    /* future: might have buckets of certain sizes, up to socket buf size=
s */
++    if (chunks_oversized && chunks_oversized->mem->size >=3D sz) {
++        --chunks_oversized_n;
++        chunk *c =3D chunks_oversized;
++        chunks_oversized =3D c->next;
++        return c;
++    }
++    return NULL;
++}
++
++static void chunk_push_oversized(chunk * const c, const size_t sz) {
++    if (chunks_oversized_n < 64 && chunk_buf_sz >=3D 4096) {
++        ++chunks_oversized_n;
++        chunk **co =3D &chunks_oversized;
++        while (*co && sz < (*co)->mem->size) co =3D &(*co)->next;
++        c->next =3D *co;
++        *co =3D c;
++    }
++    else
++        chunk_free(c);
++}
++
++static buffer * chunk_buffer_acquire_sz(size_t sz) {
+     chunk *c;
+     buffer *b;
+-    if (chunks) {
+-        c =3D chunks;
+-        chunks =3D c->next;
++    if (sz <=3D chunk_buf_sz) {
++        if (chunks) {
++            c =3D chunks;
++            chunks =3D c->next;
++        }
++        else
++            c =3D chunk_init(chunk_buf_sz);
++            /* future: might choose to pop from chunks_oversized, if avai=
lable
++             * (even if larger than sz) rather than allocating new chunk
++             * (and if doing so, might replace chunks_oversized_n) */
+     }
+     else {
+-        c =3D chunk_init(chunk_buf_sz);
++        /*(round up to nearest chunk_buf_sz)*/
++        sz =3D (sz + (chunk_buf_sz-1)) & ~(chunk_buf_sz-1);
++        c =3D chunk_pop_oversized(sz);
++        if (NULL =3D=3D c)
++            c =3D chunk_init(sz);
+     }
+     c->next =3D chunk_buffers;
+     chunk_buffers =3D c;
+@@ -137,21 +175,47 @@ buffer * chunk_buffer_acquire(void) {
+     return b;
+ }
+
++buffer * chunk_buffer_acquire(void) {
++    return chunk_buffer_acquire_sz(chunk_buf_sz);
++}
++
+ void chunk_buffer_release(buffer *b) {
+     if (NULL =3D=3D b) return;
+-    if (b->size >=3D chunk_buf_sz && chunk_buffers) {
++    if (chunk_buffers) {
+         chunk *c =3D chunk_buffers;
+         chunk_buffers =3D c->next;
+         c->mem =3D b;
+-        c->next =3D chunks;
+-        chunks =3D c;
+         buffer_clear(b);
++        if (b->size =3D=3D chunk_buf_sz) {
++            c->next =3D chunks;
++            chunks =3D c;
++        }
++        else if (b->size > chunk_buf_sz)
++            chunk_push_oversized(c, b->size);
++        else
++            chunk_free(c);
+     }
+     else {
+         buffer_free(b);
+     }
+ }
+
++size_t chunk_buffer_prepare_append(buffer * const b, size_t sz) {
++    if (sz > chunk_buffer_string_space(b)) {
++        sz +=3D b->used ? b->used : 1;
++        buffer * const cb =3D chunk_buffer_acquire_sz(sz);
++        /* swap buffer contents and copy original b->ptr into larger b->p=
tr */
++        /*(this does more than buffer_move())*/
++        buffer tb =3D *b;
++        *b =3D *cb;
++        *cb =3D tb;
++        if ((b->used =3D tb.used))
++            memcpy(b->ptr, tb.ptr, tb.used);
++        chunk_buffer_release(cb);
++    }
++    return chunk_buffer_string_space(b);
++}
++
+ static chunk * chunk_acquire(size_t sz) {
+     if (sz <=3D chunk_buf_sz) {
+         if (chunks) {
+@@ -162,13 +226,10 @@ static chunk * chunk_acquire(size_t sz) {
+         sz =3D chunk_buf_sz;
+     }
+     else {
+-        sz =3D (sz + 8191) & ~8191uL;
+-        /* future: might have buckets of certain sizes, up to socket buf =
sizes*/
+-        if (chunks_oversized && chunks_oversized->mem->size >=3D sz) {
+-            chunk *c =3D chunks_oversized;
+-            chunks_oversized =3D c->next;
+-            return c;
+-        }
++        /*(round up to nearest chunk_buf_sz)*/
++        sz =3D (sz + (chunk_buf_sz-1)) & ~(chunk_buf_sz-1);
++        chunk *c =3D chunk_pop_oversized(sz);
++        if (c) return c;
+     }
+
+     return chunk_init(sz);
+@@ -183,10 +244,7 @@ static void chunk_release(chunk *c) {
+     }
+     else if (sz > chunk_buf_sz) {
+         chunk_reset(c);
+-        chunk **co =3D &chunks_oversized;
+-        while (*co && sz < (*co)->mem->size) co =3D &(*co)->next;
+-        c->next =3D *co;
+-        *co =3D c;
++        chunk_push_oversized(c, sz);
+     }
+     else {
+         chunk_free(c);
+@@ -205,6 +263,7 @@ void chunkqueue_chunk_pool_clear(void)
+         chunk_free(c);
+     }
+     chunks_oversized =3D NULL;
++    chunks_oversized_n =3D 0;
+ }
+
+ void chunkqueue_chunk_pool_free(void)
+diff --git a/src/chunk.h b/src/chunk.h
+index 4c6b7e4..93f343c 100644
+--- a/src/chunk.h
++++ b/src/chunk.h
+@@ -50,6 +50,8 @@ typedef struct {
+ buffer * chunk_buffer_acquire(void);
+ void chunk_buffer_release(buffer *b);
+
++size_t chunk_buffer_prepare_append (buffer *b, size_t sz);
++
+ void chunkqueue_chunk_pool_clear(void);
+ void chunkqueue_chunk_pool_free(void);
+
+diff --git a/src/http-header-glue.c b/src/http-header-glue.c
+index d54f00c..2231fba 100644
+--- a/src/http-header-glue.c
++++ b/src/http-header-glue.c
+@@ -1267,7 +1267,7 @@ handler_t http_response_read(server *srv, connection=
 *con, http_response_opts *o
+         if (avail < toread) {
+             /*(add avail+toread to reduce allocations when ioctl EOPNOTSU=
PP)*/
+             avail =3D avail ? avail - 1 + toread : toread;
+-            buffer_string_prepare_append(b, avail);
++            avail =3D chunk_buffer_prepare_append(b, avail);
+         }
+
+         n =3D read(fd, b->ptr+buffer_string_length(b), avail);
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb b/meta/recip=
es-extended/lighttpd/lighttpd_1.4.55.bb
index 35a268a..5329465 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "http://download.lighttpd.net/lighttpd/releas=
es-1.4.x/lighttpd-${PV}.t
         file://lighttpd.conf \
         file://lighttpd \
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.p=
atch \
+        file://0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.p=
atch \
         "

 SRC_URI[md5sum] =3D "be4bda2c28bcbdac6eb941528f6edf03"
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
