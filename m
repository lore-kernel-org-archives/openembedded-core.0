Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.52])
 by mx.groups.io with SMTP id smtpd.web12.33779.1628841388441304633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 00:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=EFk27GBu;
 spf=pass (domain: kpit.com, ip: 40.107.138.52, mailfrom: purushottam.choudhary@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3t2msy4REitUS0G4P60EiGBS1hTC4WXSn6AJr+emmGCtoQAQV81JB6VWV8We7EOkNDoPP2Tb84M2zor2A7c+cVyU73KVnKJvINdEqkZwLkZC6zSaoFCfbQ88YrUDhd/SrTgIbNvJ9l6UzmFms5EZoYlxo1pRaGrSwVczNS91vgw31JJ/mRr4D2RPLtBTkXHkmXTYVIUEzbHFJ8AnIcb9j7lIHLyGZqFMWkTlQmrkxenEGjzvJskX4+e6XQuZSzzIwelaHI/MR8TWkYMgGDTCjihIP1CV/U+UaL+HXeY4wDHeJ0wy82kz1otdRNOkkXsgGbuBoCSaA8iuUdKvGepkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SROeEttAKbrEbFUFW9J4PA5vkehmfPQKUkRbnsQoXdQ=;
 b=dayrcyxdU+YXrKe66ct7Ke5ZmavEeEwm90tfObAApIwj6h7x7wEUOu4yCxn6DvamJ47nJzHt9Nd+sjJaFzh29/AopdqPmbBBuD1n3+lHaFKVwcqHVboXh8thnlaBUyPgm3/TS9PyTwlVhb33mH4kciTEg4Z7G8N2ASK41v4lWfxKTXp2Adomg1gzvbQUlvUzx0U3oRmP58uJvfBoa/qu26rzeq3g9LkW8W8P0VP7+C8mV5jeF/XQBq5KP9ecOp/Hr7SyyZNFYDOx1tcdXJdxAC9DA53dv6oXAhg8Rp9iKwZQjzKbxYADXGNSuXXjWysFnx/zwM3nNaOeQIDE9qCyaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SROeEttAKbrEbFUFW9J4PA5vkehmfPQKUkRbnsQoXdQ=;
 b=EFk27GBu7t/Eu/bmADFzIYUZc7vyhbY0WF2YPPgcqltEydums0awjprUihNAHDBPfp9nEPJo+9bdws6lfDU1d19kbc/gQwiP50wfVSZxgZ+9T0XpTYpcYLwv5DqpvKYgucEgot7Md9oWHpGAdAHhh2BzaxOgUmC5PPChtu2NGoM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2e::19)
 by PN2PR01MB4713.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 13 Aug
 2021 07:56:19 +0000
Received: from PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f11e:1343:761a:58a1]) by PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f11e:1343:761a:58a1%6]) with mapi id 15.20.4394.023; Fri, 13 Aug 2021
 07:56:19 +0000
From: "Purushottam choudhary" <purushottam.choudhary@kpit.com>
To: openembedded-core@lists.openembedded.org,
	sakoman@gmail.com
Cc: nisha.parrakat@kpit.com,
	Mikko.Rapeli@bmw.de,
	Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
Subject: [poky][dunfell][PATCH] lighttpd: Add patch for reuse large memory chunks
Date: Fri, 13 Aug 2021 13:26:08 +0530
Message-Id: <1628841368-26879-1-git-send-email-purushottam.choudhary@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BMXPR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::21) To PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2e::19)
Return-Path: purushottam.choudhary@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2405:201:a410:a032:340d:3c03:9ad4:ec88) by BMXPR01CA0011.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 07:56:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c17e5cb-96de-4faa-c69d-08d95e2fd55e
X-MS-TrafficTypeDiagnostic: PN2PR01MB4713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB4713ABAC79E0607269C1BA3690FA9@PN2PR01MB4713.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:109;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LXJm8Sz4P+tutQXC9HSIDNXYPnF+4/x+cygEKsAHPBk+B7c8f+kgEWDdgu8u1Yo8buR24Ixb8xZ4+Y+9m8S1+2Gh4t/DYRrjqGxxzis07sJ3KKQkJ+/oNPxeAVu9/P9J4qgZxFfGGoiFM93uxg3+Doh4kxYUR+go4Y6HWzP0tKIVrz2YWHLR6UdpLqjj3IsI6Q9IuJxb09CmwZGzXuXMAIHY0HwjLEY9ACEDgh4JNoloiAamVBGYzvjYd5xMi9Iqjb7YzkejL/eW1uFJpdYeJ41XaZoe97g44AMb0Vsi4zIlKbS0WR/m/29xQL64o7xIHLygtoZbWP9U0mopqorqHDq4FSGvTJ3cmyDkwgBBQoiRQ11nwkMDu/T1qxTQqybj0crp7v53eqj0yHX2gpT37SSHBQx2O+rgnZMsDMmMqN2HsfNfJvV581eP00fMGbGMPgfLwL/DLIxhUFZh2fB0IAHU/bQ7sxNZ5Ny7/CPJnm08DCA9xMjEJEKA5YQ0B+MdbPMr4MWqAKhtO70P9iSMBol4zSP/v5QRg2G1/5IJ5mQD+RThFv1Ys7cY+31mcCkk9sUf8ossCDPcNASEVa39V8HFDcR2h6Zm4UZmEW4RowNmX8YackFFpnJT9O2em8+5mG+IAPOmZyohNE6KW2I9PiDW+RlxoV8OF3kQl3HW1fkuegr9bJ7tEspHy5Q1jDtJ/sJwH2ggrc0c3DzCyM2PjHcmHsRKH3pkTcBev6mvckU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39850400004)(66574015)(107886003)(83380400001)(8676002)(8936002)(2906002)(478600001)(966005)(316002)(44832011)(4326008)(2616005)(6506007)(86362001)(186003)(30864003)(66556008)(66476007)(66946007)(6512007)(6666004)(6486002)(52116002)(36756003)(53546011)(5660300002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4851FlFs1HctVjaM8XTd+ryS/y/Zhe2R4XnsB9PWd7ttbml99iQpH7jUYqYcsGvEiU7GzWcURpjuYyDIEvM5PvvLbkswPKg6KC0NZfEd8yv10AUMGvxz+APrHgLbCljuLKgnvEzOOGhanNFjWShOnAyxbI4pE0myMqlKTWCoDI6YgaVPHUwYzMrdLxaLOUHRNeKejUjOWea4FVHIOscvelTmmpvB3c4EEqoj/ELuxy0KXaBpYcpMbqH/J/TcLd1febl+Od4F9/i5/GVyvSySIFnuWJ/jL5uvfVYNfyKbNGEp25gnz3kCh4KbhQpurdfmLRAe0n3YHpjJUTQAFQvuaHcg+IeZ7VRE/6EUn3m33kDaRRf9+t+dU2O8vhU7g7/dhFteEenXOVSaeG/5r49kz2kF+UNzS0dQaWFIS4OwNnZppBRx4+qYmrUSy3vc0naMR2jI7sZDCkvEg0KRc/7T/ko+a3GGkGNlNQyUkEw7y9OSsDxfhSbPYbVQbf1OpRM2oPjwhlqHMMHZjy+0nm2eZyERvgyzaAqAjI6Xpa3cvaZGkckqwI6lTZojnvlC41AR22G5IlhBYffipKkvP4bQEvDJdxWFfPgzWl6ujFuJuADilc5LadO7QkhYKB87bXYX5tOTrLE/ld2M9KOQNUq0qhDvvThnwgnz7KwLWUhIHKoYIxaSvoTZW3FmI2g1Wq5pBbQH4NMuODxN7LiV0WHfPlffUJ2hYjTXIVIHfQot91f13tqJwkZDunvt0Hr40wGs9ANiekh+XRQCWnuKX3ecyTHrQJyOPaQRBKFXJossS8XUS1vZCd+Opr4BRdTGwqJk
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c17e5cb-96de-4faa-c69d-08d95e2fd55e
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 07:56:18.8156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktthhYZRtUgCmN1Z0uOn6Ej3w0b+exN80XPqRtwn1cutWnnbaDla3zXW7ei4UPPe1zt8Rely3Vb3bCaQM0tZBQ==
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
index f17bdce..0b27bcc 100644
--- a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-=
dependency-instead-of-config.patch
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-=
dependency-instead-of-config.patch
@@ -1,4 +1,4 @@
-From 22afc5d9aaa215c3c87ba21c77d47da44ab3b113 Mon Sep 17 00:00:00 2001
+From 43e22184eede7ee1b29baf3479ce99e953498570 Mon Sep 17 00:00:00 2001
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
index 0000000..777ee40
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-chu=
nks-fix-mem-usage-fixes-3033.patch
@@ -0,0 +1,224 @@
+From 8caa841f2e039ab93a8b63b6dadd1ad1b240384a Mon Sep 17 00:00:00 2001
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
