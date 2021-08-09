Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.45])
 by mx.groups.io with SMTP id smtpd.web12.19815.1628493651699698600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 00:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=mm6J62B0;
 spf=pass (domain: kpit.com, ip: 40.107.138.45, mailfrom: purushottam.choudhary@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeJdhsYO+Xxs8qgW8RxMdPoAUax5L7ZpEPY4V0yXg21SQXt78DzLlV49dYu4hWvZaiWYALW00b6REIYQo7Tsb0Q2+mZdrLldES4xx7tPvlndpNhQoqHiIzAR22JDwJIVjOME1X2etKQQbHhBygq2vwRtMi0w13/PmC/2Sfw+Xq4S1qU6L9p2VirsSWK/w872s3bebnVuVv8HfBivd2zqU/XHmuPjsyn2arRogyg09tflEDlFR5Hj73CuAoX0P2CxQc0JQMdjJsNz4mHAbnXW3ryfdtqeR/Hu3H9/Axb/ygYukK5nBnnMjRfVhlwYUXf0GJKckjKHvNrfwFlczK4ZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xizjzdHlf7YJInVVqe/gxFFuS61b0tYsqDC428ObH3I=;
 b=eOaESTUEKuGz46z0sYFJSEFKGqRu9yRNqSYmB2r1YcOvXKkPOxGTZkVCouw4I7GJEiGJTMKXYee5twVG46aVuvhJRglVEmwV9n2vE8A7FRNuL1I4du0zGvyzxPCmMkpH+qqrfesp5nxNlyIFLBuEd2pr51DgfI3M5jdb7YgTtsm/1gK0I0bCfZj1iWFZVahDMuNY7LFS0wKDGTNJUINWJg/tTDYiox1WKmjTrQv9QZs1nZCNvZSi0XtXd0V2yrWFt3bJ9fegD7ETOzKjJAunA7l0Cx8dyKlk+pDYnTd0h0Wq2rcguNicks2i7x9qWld07Viv4+FxMG07Ufgx2DFwLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xizjzdHlf7YJInVVqe/gxFFuS61b0tYsqDC428ObH3I=;
 b=mm6J62B0L1Mm+/ncGygD0ZzMqcVAO4xFuhFFNPfjxbGYStDRaNb9YWCtUyDfo7/CHSGu2jQRJuN1RRMuuwW6fLnHhvfT1jSHcL0WQhbu0hE8MCzKrI4HaIR0APOpca7NxzzV3ZiTG6URRN6przdSXAl1MWdAefcrYsuACdU0wF4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2e::19)
 by PN2PR01MB5192.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:5b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Mon, 9 Aug
 2021 07:20:41 +0000
Received: from PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b5cd:4835:1ddb:9667]) by PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b5cd:4835:1ddb:9667%7]) with mapi id 15.20.4373.031; Mon, 9 Aug 2021
 07:20:40 +0000
From: "Purushottam choudhary" <purushottam.choudhary@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Mikko.Rapeli@bmw.de,
	Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
Subject: [poky][dunfell][PATCH] lighttpd: Add patch for reuse large memory chunks
Date: Mon,  9 Aug 2021 12:50:21 +0530
Message-Id: <1628493621-2045-1-git-send-email-purushottam.choudhary@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BM1PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::28) To PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2e::19)
Return-Path: purushottam.choudhary@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2405:201:a410:a032:fd4b:6b7c:b23d:e54c) by BM1PR01CA0088.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4394.15 via Frontend Transport; Mon, 9 Aug 2021 07:20:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf535321-8d9a-4d36-01b5-08d95b0630d5
X-MS-TrafficTypeDiagnostic: PN2PR01MB5192:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB519238D67CC508ABF6D6592490F69@PN2PR01MB5192.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M8xfkFQMClGD7LCRDa2K2u4rjoNDNY/RufZeO6dp/Rpl0VRqBINFLRfTClFRMCuLYxzYDtLkatw7lww3LUkAVdDabek+INfS2JYnP9me2D4NBzSfZMPgVgxJCpM76M3UyFNCT37+WDYd7IIeMIbNImFOBezqPiO90rmwWZIx/S/dDu7reZfr6bjos/pjgkb0LqiMYizicV5GaX1B5IJQJUHbwj2DFGRQA/2DZ0WtId0bJVJ8pXiJf0yY3LgSuMKihpgL5dNXzbxXhjfKjFKCWwoyTskR6w8wpdT7uZ0+vzjRbJLZhxq9wzF7FkxXIpCUDvFtRfoCqFUGFMDqfElYFeVDB/4tZMBnxuOrnkZNSn05HCG1+u/DFgFAo437fNQUf8qdR2xYBcvPRQgv9ASHf6UGUcsfwCfJKSMpDrhGkrIZTEfgMIDzzFHerzdHEUqk0FQ9HtuKCuIKAE9nuyFoQe2GARaZJEhXkCG90RE4d2U3YHk1+qiMXoSI4UJnNW0Kr1KYTOIySeio1pLDKXGhUAv0QueB34UzCe0Q47uiYLHe5kZddYlzd/SclLsExHossGisEExXZYeUOSIqhmbS4zaIi+YjKiwUFxhSMY87PMkhtojUXsj2OhqQSbtdOUGGnlE9D6qIoh3CE8aCjsm5ToJ6lz7JUCEIk59tmpLZrFNBkvJHVROe0TpsX4VIfILBLEM5a74cl81zJkF7+mV/0M2mLIX7tp6u+kmWRkUsh/4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39840400004)(186003)(6486002)(44832011)(4326008)(2616005)(107886003)(6512007)(8936002)(66476007)(478600001)(66556008)(52116002)(66946007)(966005)(6506007)(316002)(8676002)(83380400001)(2906002)(5660300002)(86362001)(66574015)(36756003)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YGh73FmYAb0yPh2/LHX5gQMoXMHljjU+O9X3pbt6/hkKrLMU9GvGT1zlPF1J?=
 =?us-ascii?Q?oTueXeH9tFE17xiPfobPSvwOzTWQlNDwgSmw2f4qGKQsQ2z9T0YfxUF5/OaI?=
 =?us-ascii?Q?MyLhiAiQ6TY7mXRE7Zlw6YPDjT9Z25MUyONoGujvmYEHeqOsCZdqUUbMQOEO?=
 =?us-ascii?Q?yKSO28+GPG81h0ii/9nnHUOJQqqB6nJsAfPb+9ZX3vI/rX01Bg+qRhHwPlGe?=
 =?us-ascii?Q?x2tTmhIF3QB2t4/Lj21RLaufF6RnM8K9O/6XWe1lDzJIiXDPFIQG3SzZWVKT?=
 =?us-ascii?Q?fqMe8Ct8VthrOp5paEV8Iqd75bmLbDy2r8ctNnP2uyJRhCjwIy7t+/SP6jeE?=
 =?us-ascii?Q?f9l4u3NakLsIH2NHll5o2bxMrhGrEU2nLexeWpAE20RO08Z6SOo46tobfcLL?=
 =?us-ascii?Q?WEjsQPliRVa1h87vXRveJ2bL6HHGJUxY14tKBwG7eCbQAJNbFv7kqpieyL2P?=
 =?us-ascii?Q?/Awvmi+CuxJFpehD2VehNJ+mgUyTA8N8LtJdutt7fQ6uNnQ94yIWvTWdfUho?=
 =?us-ascii?Q?iRo2xpVIzvjHP9RZy6T9eCGAmG6+NjnRLMo6ejjzBQZKOKa2H5kXL/Ne+ZLS?=
 =?us-ascii?Q?O7t1kjTMUSeLqz08NcSCYQdTYcfZ5vs860oAueU29b4P4O9lFk439ft15IwX?=
 =?us-ascii?Q?6ojuq+IxgR88ewwV24TXCNeyb8R93EnmPB7rqFNBXopI/niFvocBtDye3/t5?=
 =?us-ascii?Q?DZuRoVEzW6cScu0L3c61kjX+o+dCsJwg6x1n1+oJZrlOe/ZWnmYgWj1IW99j?=
 =?us-ascii?Q?ZVCgbmmCACPIdgeDGI6Khie2M9qofSzaaj246F+rDFo7kZmAxhbG6eeQ0gJi?=
 =?us-ascii?Q?ZrBFmXhsNMvvMtJmNuL7KMObWU9w9cQAVs9+u8W+3WuwYFdkPlY0yiwBXQVz?=
 =?us-ascii?Q?gFhb0y0XlNc8dlc7t9oSHppQce4f9r/+obziCz4ygHl4QSd1tmSNMApTO0J1?=
 =?us-ascii?Q?FqP4pLrvQzVIEXSUBRP3vAGpGrrCO70gYMsBb6gF5QU8dTEE8WUIwh9r09Bt?=
 =?us-ascii?Q?tA5R6nCe7x/xsQslJkoMk2DG1rOSB+QxO6+4JImZ+fTSJpdS6rd9szwDhVHy?=
 =?us-ascii?Q?Aos209lxuFtg4VOEVGQudRoBija65uNz7/jJMl57AYXV/780MLaSdcYLDrRA?=
 =?us-ascii?Q?eWbfmXxGnw879T0nDr1Uia6aofxtnyxncHh6F1TctWglAVmlqJpCG4cjsSnq?=
 =?us-ascii?Q?YiP4rEVaSnnxuaS+qKOnAqBCWa0FHLixIvRWjFdQO5jEwkoqa7y7jIXoLW++?=
 =?us-ascii?Q?d7UKxAO1yHh1ndbUqjBckd6CuTG6toIPZzzqhCxA4qIwLc04XvR31bzMu1oe?=
 =?us-ascii?Q?ShzSjKr+e1uzE2ALTU/Q2d4lzR0vU8d6SI1RR9qYDYACGCL4qDhyJITyiFVr?=
 =?us-ascii?Q?dC5yjgtjKyHnA6dGBJNxXXjblaqK?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf535321-8d9a-4d36-01b5-08d95b0630d5
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 07:20:40.1120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4zYaorSQ9WldGSONEnp6rm0xgSHeD/JEuitA+UmE7oVijaHyDdSLbicIeJRW21zX52N3y2i7C10TXfxWJbGKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB5192
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
 ...large-mem-chunks-fix-mem-usage-fixes-3033.patch | 224 +++++++++++++++++=
++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb  |   1 +
 2 files changed, 225 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse=
-large-mem-chunks-fix-mem-usage-fixes-3033.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-=
mem-chunks-fix-mem-usage-fixes-3033.patch b/meta/recipes-extended/lighttpd/=
lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
new file mode 100644
index 0000000..e3ede66
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-chu=
nks-fix-mem-usage-fixes-3033.patch
@@ -0,0 +1,224 @@
+From f46bba11bf47ab6d6601e6ca653f1cdc7a2673ed Mon Sep 17 00:00:00 2001
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
