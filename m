Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.78])
 by mx.groups.io with SMTP id smtpd.web09.1693.1628232900322250136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 23:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=WpVKH+CB;
 spf=pass (domain: kpit.com, ip: 40.107.138.78, mailfrom: purushottam.choudhary@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8Q2xOpnDbL8fcENGlJkuucd4nrjrzD8se4KcXV5/bkFiN3zWaHy5f0OJSpfF8qhAf1UzGymYXEnZ8Cq8nQfQr49zcb18YBthrgZwGQVYcbtHtAjeibwNYgO3EMUDHIxZ4vGlfGLhr6ho1znZWKeEPp+/5OvSHBI55WR/hN278sx/2CT+SGXa7pA5OXk4MvrfE1M9dmUxd6IM7Iq9goPalNCkBceBGsW9r5A+O30D/O5tJpsT6xTVnAXp8drwQg711uV28Ghh/49+J4CQjRzwyNa/zg8QIlpqSXkhUwA8Ao0CztVyTzC/uyne5iPi2Cr1P+sw7/Z1032kqyFc7zSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC/OScFMz4ONIVbJTK7M6DlPUhhxUYr/DmM4uzmtnls=;
 b=FREJh3DGx2hgsHQDJAuRxRfmC8tgW2K0cHq9M3Q+nySGJVISopQW+8njVlhyvAiuBhoLdwK9ai7yCKKcxzsNk9ddzzWZiYWTjsYOPJHMWUC87jDFkLTaBTsIjtDlEs8cs8xiIEwZDCa4oBub6ZPJm5RJWu5DUA4I/wGa8rpw/5V3cC42Ez4BBi5kn2yPboN9wvCgHRbMMgym72wNbcMk644EE3RgelAj81LCvrwx89YkHaXpvdCdaN7vjEEHR2vaMEO9fwoDtReKehojJ1JCP6UPe+K+yR2805E8na/Ncq8JDCfQue48/IENHiBRygrGXGAn3AIkPR2pEnqkHxzqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC/OScFMz4ONIVbJTK7M6DlPUhhxUYr/DmM4uzmtnls=;
 b=WpVKH+CBJbrPlEC8ceZlOGWLpoXO5yzFOQv26LMD4hkjpbKPK7nMfcLE0H6yRIohNjiO1O3X3yK8Az/F3+Tfa1/TBU4GVtHxsEAx61KWdBMpZcWGfK2Ze/fTWkTnewq9ZSl081dIajtprDOyudU5kRMTCUDzoXmShpBE/cTqBsQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2e::19)
 by PNZPR01MB4879.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Fri, 6 Aug
 2021 06:54:49 +0000
Received: from PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b5cd:4835:1ddb:9667]) by PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b5cd:4835:1ddb:9667%7]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 06:54:49 +0000
From: "Purushottam choudhary" <purushottam.choudhary@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Mikko.Rapeli@bmw.de,
	Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
Subject: [poky][dunfell][PATCH] lighttpd: Add patch for reuse large memory chunks
Date: Fri,  6 Aug 2021 12:24:40 +0530
Message-Id: <1628232880-3676-1-git-send-email-purushottam.choudhary@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BM1PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::13) To PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2e::19)
Return-Path: purushottam.choudhary@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (106.206.199.111) by BM1PR01CA0073.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 06:54:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b730fbf8-0920-40c0-f0ba-08d958a71525
X-MS-TrafficTypeDiagnostic: PNZPR01MB4879:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB4879F893977553340C26802C90F39@PNZPR01MB4879.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q5ndvWLguWskoOwvhN8T8JPBLTz+SP+lYioyq0IQdZGJSS30ctkHMrkxw2+6L6rtiNna4xH3gnpbPA/5YdXevOiFwfObpSO+c1x03Fhkd2Rx4T8oJQFs5TRgaZp0ZTNd0L3nCLOY/igdgfunC/0B8SGIXYKvYZNU+RmdMsSeKA/q3g6rX98mlFsgw0FRtcVX4lz/upM/aTl7m+LXhgpnRws0nk5RdMOOfDPzLECMcJXdpMcbKSScolwKNKAxGWPP1m8YicJqvqd4JzXrIz0vKzHIzf0bQ1hNfJ7oPvZOljphLqqSLVXNJEEY0vPLUVxBh9y9hVAYX3tnLjlhEvS5CJJDTyJLhOScgQeH5zcExEr3BfvjHteztXULK4Y+BP1qSIKpjJWKB5JYjh5Y3tcm8NU4icBwX0GroHtGFxwX/n0q1ZCZE7VhwRv+yWJWrt6W15FY5Evb7HGEymblRz5dIGGtEQdPzHO8c5yonnkbDykZGE22NuDJ/mpunpUEfktkaRW+LOyup3nyHGL1jD0ZOxRB9PMH5S+Rpif9xrQNAtyi0T5zNcaRfnKey3FpTFGcLnk01WYxXGNYHKaKBA4KJsE0lCLRgsKnWaGkK8ml79dXF3KbQdn3C8xAwpgml0pqb/+vfRMUIWLbyoxXiwrp+ci2hNxHPIpx3AJrnBdMwxa+KKI+yFsHogGXsLd/dq27ZJnCtmgcOEoIYVbXqgB8GmZrllLwFyr07C+DQktPa/Hdh1SrfMKNXn9Lbc1CLaky4D22h+bFZkmPJo9WOI7j7YhwyHHWXsy4aLMZAjl7jnI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39850400004)(136003)(346002)(8936002)(52116002)(44832011)(966005)(2616005)(956004)(2906002)(8676002)(107886003)(6506007)(5660300002)(6666004)(1006002)(4326008)(26005)(83380400001)(6512007)(86362001)(66556008)(38350700002)(6486002)(478600001)(36756003)(38100700002)(66946007)(316002)(66574015)(66476007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0LixXx+l4DzsmPpTxQ+w1gzV1gdDntE6YdDNzGTZhZeqO83UKsA34ua2hHBY?=
 =?us-ascii?Q?pq07avb0l44ZOcLwHvTdHxOMTQvQct1fFa79ubXGoRbbw0UdpfsmfSa8IJML?=
 =?us-ascii?Q?ByDAFXrivLS4XGwDq/OIZl0cohAr97W1vWnqLyUEoYbjCi8ms1xAaGmE7/mP?=
 =?us-ascii?Q?6yIB/pc899PwuO798VoiksdGksY8PavS7Xd4Ky8xcHUe95SG43Z3+ARik3jW?=
 =?us-ascii?Q?V0WZIvSECFvKoHi5woHO+rG2teJ1mWXQznvOWzqklH8YZwAgSRr3hrovfpZg?=
 =?us-ascii?Q?QwHTXxo03l0gf738vwaawwsnIgt2XJZsjxr2TLQBf1+mFavoWcvBobWsYxp6?=
 =?us-ascii?Q?mr5YXN0LYyqMobMAPxo3anJa/hp6pYyhYxT+TjGm0HjmU42TGVdaESctZTKr?=
 =?us-ascii?Q?zQFj2PumvAaz77gPBHyB0jlrPmdXgF5FuZFrP+p6ibVrAKWDUPLuYjS1a1h7?=
 =?us-ascii?Q?53RqSys8NFrTMqYhjPNRAsKDXICUGpK5xf55D0bmDqPxGMls+Hro4iARxZ4u?=
 =?us-ascii?Q?0dVpK4HOjdZrz3LvGX1q2RuMJi1zqLEddBPJXDc2F/ncBtZMLy1eX2+rV0q/?=
 =?us-ascii?Q?H8v0rN8yBo6zAcZNapBsO+psFgb//mVJqBoRMuciUbCCEVp9fT0uYL7QZ44Z?=
 =?us-ascii?Q?qT+D9QVIRXTtTUjmcACuzReZP20Ma8+7pWQaJfanhTwVKDPFuCHA0b58UXNT?=
 =?us-ascii?Q?ZGx29Yxw1ZBBpbaMwy8KQq5OaBday/1+DgZ4+PhBwEdtg7ty3bF/Fx9dBEzG?=
 =?us-ascii?Q?FeIXldc6yvIU9QFK0NEF+q+Alxji4gNnwLF6ghqLeN5a+ZMZiRfNQUUiBouN?=
 =?us-ascii?Q?NS2CQF9HaBp1lIvD6U1FlSdDjQ7RLCz13jXn7GMH2+QJvnEwsGPwIaqD5w64?=
 =?us-ascii?Q?x36NTEnzMPvJZ5auM2eenO96IIMbeitZXONOl/C8kFb1v+cESn5zOJhsagu0?=
 =?us-ascii?Q?9H3Z7u9KY4ffea/mqXdkrqaW6R8sgvvxRym8kuRtiV4raC7S3fzOoIQEpTVc?=
 =?us-ascii?Q?iIsdvymdVIMNoO/Af/gOB+61p2AEHIhAfh5y0zl2xNtXm1QLr8buiTDNaT21?=
 =?us-ascii?Q?OFIFlwSdUlZhWqwPBesG+dC7sdjTczKpTy8Rvgrj2s22+EMGF3bak6qgU9NC?=
 =?us-ascii?Q?YK4Slk7qbmDHTfKEIEuLOd5Y9gyUuW1+8NboETBS9mnwipob2JDXJVscKWNW?=
 =?us-ascii?Q?+M8RycuDpK+ctiJSpGu+L3U/OZ6YsIikkCk3Ae952lcZaz5oxgN304JxQC/k?=
 =?us-ascii?Q?9D1IBOgqcCgc1XTpzZDlB+a465FnkwKWRyFVvtMZ9EDM5oxnJsvsiyxu10E4?=
 =?us-ascii?Q?w7Oj/2wB+tArFzc+NJDAVSRO?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b730fbf8-0920-40c0-f0ba-08d958a71525
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 06:54:49.1224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /aFdow8QGZqcDANgYBuSztsP+az/+vUqVu8u3ldsp644wktQZrkgCs6+U6WCuybWyEWK0K3vhZc1Ql0wFDKJvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4879
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
 ...large-mem-chunks-fix-mem-usage-fixes-3033.patch | 225 +++++++++++++++++=
++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb  |   1 +
 2 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse=
-large-mem-chunks-fix-mem-usage-fixes-3033.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-=
mem-chunks-fix-mem-usage-fixes-3033.patch b/meta/recipes-extended/lighttpd/=
lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
new file mode 100644
index 0000000..c4e4a60
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-chu=
nks-fix-mem-usage-fixes-3033.patch
@@ -0,0 +1,225 @@
+From 40dadb863fd105c4a66b598c2423b1eb11b1f26e Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Wed, 23 Dec 2020 23:14:47 -0500
+Subject: [PATCH] [core] reuse large mem chunks (fix mem usage) (fixes #303=
3)
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
+---
+ src/chunk.c            | 99 +++++++++++++++++++++++++++++++++---------
+ src/chunk.h            |  2 +
+ src/http-header-glue.c |  2 +-
+ 3 files changed, 82 insertions(+), 21 deletions(-)
+
+diff --git a/src/chunk.c b/src/chunk.c
+index 09dd3f14..ffb37951 100644
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
+index 4c6b7e47..93f343c3 100644
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
+index d54f00cf..2231fba9 100644
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
+--
+2.32.0
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
