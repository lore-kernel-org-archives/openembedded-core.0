Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90023C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 13:06:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6271.1648559178842227528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 06:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99D8223A
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 06:06:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 322BF3F73B
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 06:06:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][hardknott] zlib: backport the fix for CVE-2018-25032
Date: Tue, 29 Mar 2022 14:06:15 +0100
Message-Id: <20220329130615.2430159-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 13:06:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163747

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../zlib/zlib/CVE-2018-25032.patch            | 347 ++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
 2 files changed, 348 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2018-25032.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch b/meta/reci=
pes-core/zlib/zlib/CVE-2018-25032.patch
new file mode 100644
index 00000000000..5cb61836419
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
@@ -0,0 +1,347 @@
+CVE: CVE-2018-25032
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 5c44459c3b28a9bd3283aaceab7c615f8020c531 Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Tue, 17 Apr 2018 22:09:22 -0700
+Subject: [PATCH] Fix a bug that can crash deflate on some input when usi=
ng
+ Z_FIXED.
+
+This bug was reported by Danilo Ramos of Eideticom, Inc. It has
+lain in wait 13 years before being found! The bug was introduced
+in zlib 1.2.2.2, with the addition of the Z_FIXED option. That
+option forces the use of fixed Huffman codes. For rare inputs with
+a large number of distant matches, the pending buffer into which
+the compressed data is written can overwrite the distance symbol
+table which it overlays. That results in corrupted output due to
+invalid distances, and can result in out-of-bound accesses,
+crashing the application.
+
+The fix here combines the distance buffer and literal/length
+buffers into a single symbol buffer. Now three bytes of pending
+buffer space are opened up for each literal or length/distance
+pair consumed, instead of the previous two bytes. This assures
+that the pending buffer cannot overwrite the symbol table, since
+the maximum fixed code compressed length/distance is 31 bits, and
+since there are four bytes of pending space for every three bytes
+of symbol space.
+---
+ deflate.c | 74 ++++++++++++++++++++++++++++++++++++++++---------------
+ deflate.h | 25 +++++++++----------
+ trees.c   | 50 +++++++++++--------------------------
+ 3 files changed, 79 insertions(+), 70 deletions(-)
+
+diff --git a/deflate.c b/deflate.c
+index 425babc00..19cba873a 100644
+--- a/deflate.c
++++ b/deflate.c
+@@ -255,11 +255,6 @@ int ZEXPORT deflateInit2_(strm, level, method, wind=
owBits, memLevel, strategy,
+     int wrap =3D 1;
+     static const char my_version[] =3D ZLIB_VERSION;
+=20
+-    ushf *overlay;
+-    /* We overlay pending_buf and d_buf+l_buf. This works since the ave=
rage
+-     * output size for (length,distance) codes is <=3D 24 bits.
+-     */
+-
+     if (version =3D=3D Z_NULL || version[0] !=3D my_version[0] ||
+         stream_size !=3D sizeof(z_stream)) {
+         return Z_VERSION_ERROR;
+@@ -329,9 +324,47 @@ int ZEXPORT deflateInit2_(strm, level, method, wind=
owBits, memLevel, strategy,
+=20
+     s->lit_bufsize =3D 1 << (memLevel + 6); /* 16K elements by default =
*/
+=20
+-    overlay =3D (ushf *) ZALLOC(strm, s->lit_bufsize, sizeof(ush)+2);
+-    s->pending_buf =3D (uchf *) overlay;
+-    s->pending_buf_size =3D (ulg)s->lit_bufsize * (sizeof(ush)+2L);
++    /* We overlay pending_buf and sym_buf. This works since the average=
 size
++     * for length/distance pairs over any compressed block is assured t=
o be 31
++     * bits or less.
++     *
++     * Analysis: The longest fixed codes are a length code of 8 bits pl=
us 5
++     * extra bits, for lengths 131 to 257. The longest fixed distance c=
odes are
++     * 5 bits plus 13 extra bits, for distances 16385 to 32768. The lon=
gest
++     * possible fixed-codes length/distance pair is then 31 bits total.
++     *
++     * sym_buf starts one-fourth of the way into pending_buf. So there =
are
++     * three bytes in sym_buf for every four bytes in pending_buf. Each=
 symbol
++     * in sym_buf is three bytes -- two for the distance and one for th=
e
++     * literal/length. As each symbol is consumed, the pointer to the n=
ext
++     * sym_buf value to read moves forward three bytes. From that symbo=
l, up to
++     * 31 bits are written to pending_buf. The closest the written pend=
ing_buf
++     * bits gets to the next sym_buf symbol to read is just before the =
last
++     * code is written. At that time, 31*(n-2) bits have been written, =
just
++     * after 24*(n-2) bits have been consumed from sym_buf. sym_buf sta=
rts at
++     * 8*n bits into pending_buf. (Note that the symbol buffer fills wh=
en n-1
++     * symbols are written.) The closest the writing gets to what is un=
read is
++     * then n+14 bits. Here n is lit_bufsize, which is 16384 by default=
, and
++     * can range from 128 to 32768.
++     *
++     * Therefore, at a minimum, there are 142 bits of space between wha=
t is
++     * written and what is read in the overlain buffers, so the symbols=
 cannot
++     * be overwritten by the compressed data. That space is actually 13=
9 bits,
++     * due to the three-bit fixed-code block header.
++     *
++     * That covers the case where either Z_FIXED is specified, forcing =
fixed
++     * codes, or when the use of fixed codes is chosen, because that ch=
oice
++     * results in a smaller compressed block than dynamic codes. That l=
atter
++     * condition then assures that the above analysis also covers all d=
ynamic
++     * blocks. A dynamic-code block will only be chosen to be emitted i=
f it has
++     * fewer bits than a fixed-code block would for the same set of sym=
bols.
++     * Therefore its average symbol length is assured to be less than 3=
1. So
++     * the compressed data for a dynamic block also cannot overwrite th=
e
++     * symbols from which it is being constructed.
++     */
++
++    s->pending_buf =3D (uchf *) ZALLOC(strm, s->lit_bufsize, 4);
++    s->pending_buf_size =3D (ulg)s->lit_bufsize * 4;
+=20
+     if (s->window =3D=3D Z_NULL || s->prev =3D=3D Z_NULL || s->head =3D=
=3D Z_NULL ||
+         s->pending_buf =3D=3D Z_NULL) {
+@@ -340,8 +373,12 @@ int ZEXPORT deflateInit2_(strm, level, method, wind=
owBits, memLevel, strategy,
+         deflateEnd (strm);
+         return Z_MEM_ERROR;
+     }
+-    s->d_buf =3D overlay + s->lit_bufsize/sizeof(ush);
+-    s->l_buf =3D s->pending_buf + (1+sizeof(ush))*s->lit_bufsize;
++    s->sym_buf =3D s->pending_buf + s->lit_bufsize;
++    s->sym_end =3D (s->lit_bufsize - 1) * 3;
++    /* We avoid equality with lit_bufsize*3 because of wraparound at 64=
K
++     * on 16 bit machines and because stored blocks are restricted to
++     * 64K-1 bytes.
++     */
+=20
+     s->level =3D level;
+     s->strategy =3D strategy;
+@@ -552,7 +589,7 @@ int ZEXPORT deflatePrime (strm, bits, value)
+=20
+     if (deflateStateCheck(strm)) return Z_STREAM_ERROR;
+     s =3D strm->state;
+-    if ((Bytef *)(s->d_buf) < s->pending_out + ((Buf_size + 7) >> 3))
++    if (s->sym_buf < s->pending_out + ((Buf_size + 7) >> 3))
+         return Z_BUF_ERROR;
+     do {
+         put =3D Buf_size - s->bi_valid;
+@@ -1113,7 +1150,6 @@ int ZEXPORT deflateCopy (dest, source)
+ #else
+     deflate_state *ds;
+     deflate_state *ss;
+-    ushf *overlay;
+=20
+=20
+     if (deflateStateCheck(source) || dest =3D=3D Z_NULL) {
+@@ -1133,8 +1169,7 @@ int ZEXPORT deflateCopy (dest, source)
+     ds->window =3D (Bytef *) ZALLOC(dest, ds->w_size, 2*sizeof(Byte));
+     ds->prev   =3D (Posf *)  ZALLOC(dest, ds->w_size, sizeof(Pos));
+     ds->head   =3D (Posf *)  ZALLOC(dest, ds->hash_size, sizeof(Pos));
+-    overlay =3D (ushf *) ZALLOC(dest, ds->lit_bufsize, sizeof(ush)+2);
+-    ds->pending_buf =3D (uchf *) overlay;
++    ds->pending_buf =3D (uchf *) ZALLOC(dest, ds->lit_bufsize, 4);
+=20
+     if (ds->window =3D=3D Z_NULL || ds->prev =3D=3D Z_NULL || ds->head =
=3D=3D Z_NULL ||
+         ds->pending_buf =3D=3D Z_NULL) {
+@@ -1148,8 +1183,7 @@ int ZEXPORT deflateCopy (dest, source)
+     zmemcpy(ds->pending_buf, ss->pending_buf, (uInt)ds->pending_buf_siz=
e);
+=20
+     ds->pending_out =3D ds->pending_buf + (ss->pending_out - ss->pendin=
g_buf);
+-    ds->d_buf =3D overlay + ds->lit_bufsize/sizeof(ush);
+-    ds->l_buf =3D ds->pending_buf + (1+sizeof(ush))*ds->lit_bufsize;
++    ds->sym_buf =3D ds->pending_buf + ds->lit_bufsize;
+=20
+     ds->l_desc.dyn_tree =3D ds->dyn_ltree;
+     ds->d_desc.dyn_tree =3D ds->dyn_dtree;
+@@ -1925,7 +1959,7 @@ local block_state deflate_fast(s, flush)
+         FLUSH_BLOCK(s, 1);
+         return finish_done;
+     }
+-    if (s->last_lit)
++    if (s->sym_next)
+         FLUSH_BLOCK(s, 0);
+     return block_done;
+ }
+@@ -2056,7 +2090,7 @@ local block_state deflate_slow(s, flush)
+         FLUSH_BLOCK(s, 1);
+         return finish_done;
+     }
+-    if (s->last_lit)
++    if (s->sym_next)
+         FLUSH_BLOCK(s, 0);
+     return block_done;
+ }
+@@ -2131,7 +2165,7 @@ local block_state deflate_rle(s, flush)
+         FLUSH_BLOCK(s, 1);
+         return finish_done;
+     }
+-    if (s->last_lit)
++    if (s->sym_next)
+         FLUSH_BLOCK(s, 0);
+     return block_done;
+ }
+@@ -2170,7 +2204,7 @@ local block_state deflate_huff(s, flush)
+         FLUSH_BLOCK(s, 1);
+         return finish_done;
+     }
+-    if (s->last_lit)
++    if (s->sym_next)
+         FLUSH_BLOCK(s, 0);
+     return block_done;
+ }
+diff --git a/deflate.h b/deflate.h
+index 23ecdd312..d4cf1a98b 100644
+--- a/deflate.h
++++ b/deflate.h
+@@ -217,7 +217,7 @@ typedef struct internal_state {
+     /* Depth of each subtree used as tie breaker for trees of equal fre=
quency
+      */
+=20
+-    uchf *l_buf;          /* buffer for literals or lengths */
++    uchf *sym_buf;        /* buffer for distances and literals/lengths =
*/
+=20
+     uInt  lit_bufsize;
+     /* Size of match buffer for literals/lengths.  There are 4 reasons =
for
+@@ -239,13 +239,8 @@ typedef struct internal_state {
+      *   - I can't count above 4
+      */
+=20
+-    uInt last_lit;      /* running index in l_buf */
+-
+-    ushf *d_buf;
+-    /* Buffer for distances. To simplify the code, d_buf and l_buf have
+-     * the same number of elements. To use different lengths, an extra =
flag
+-     * array would be necessary.
+-     */
++    uInt sym_next;      /* running index in sym_buf */
++    uInt sym_end;       /* symbol table full when sym_next reaches this=
 */
+=20
+     ulg opt_len;        /* bit length of current block with optimal tre=
es */
+     ulg static_len;     /* bit length of current block with static tree=
s */
+@@ -325,20 +320,22 @@ void ZLIB_INTERNAL _tr_stored_block OF((deflate_st=
ate *s, charf *buf,
+=20
+ # define _tr_tally_lit(s, c, flush) \
+   { uch cc =3D (c); \
+-    s->d_buf[s->last_lit] =3D 0; \
+-    s->l_buf[s->last_lit++] =3D cc; \
++    s->sym_buf[s->sym_next++] =3D 0; \
++    s->sym_buf[s->sym_next++] =3D 0; \
++    s->sym_buf[s->sym_next++] =3D cc; \
+     s->dyn_ltree[cc].Freq++; \
+-    flush =3D (s->last_lit =3D=3D s->lit_bufsize-1); \
++    flush =3D (s->sym_next =3D=3D s->sym_end); \
+    }
+ # define _tr_tally_dist(s, distance, length, flush) \
+   { uch len =3D (uch)(length); \
+     ush dist =3D (ush)(distance); \
+-    s->d_buf[s->last_lit] =3D dist; \
+-    s->l_buf[s->last_lit++] =3D len; \
++    s->sym_buf[s->sym_next++] =3D dist; \
++    s->sym_buf[s->sym_next++] =3D dist >> 8; \
++    s->sym_buf[s->sym_next++] =3D len; \
+     dist--; \
+     s->dyn_ltree[_length_code[len]+LITERALS+1].Freq++; \
+     s->dyn_dtree[d_code(dist)].Freq++; \
+-    flush =3D (s->last_lit =3D=3D s->lit_bufsize-1); \
++    flush =3D (s->sym_next =3D=3D s->sym_end); \
+   }
+ #else
+ # define _tr_tally_lit(s, c, flush) flush =3D _tr_tally(s, 0, c)
+diff --git a/trees.c b/trees.c
+index 4f4a65011..decaeb7c3 100644
+--- a/trees.c
++++ b/trees.c
+@@ -416,7 +416,7 @@ local void init_block(s)
+=20
+     s->dyn_ltree[END_BLOCK].Freq =3D 1;
+     s->opt_len =3D s->static_len =3D 0L;
+-    s->last_lit =3D s->matches =3D 0;
++    s->sym_next =3D s->matches =3D 0;
+ }
+=20
+ #define SMALLEST 1
+@@ -948,7 +948,7 @@ void ZLIB_INTERNAL _tr_flush_block(s, buf, stored_le=
n, last)
+=20
+         Tracev((stderr, "\nopt %lu(%lu) stat %lu(%lu) stored %lu lit %u=
 ",
+                 opt_lenb, s->opt_len, static_lenb, s->static_len, store=
d_len,
+-                s->last_lit));
++                s->sym_next / 3));
+=20
+         if (static_lenb <=3D opt_lenb) opt_lenb =3D static_lenb;
+=20
+@@ -1017,8 +1017,9 @@ int ZLIB_INTERNAL _tr_tally (s, dist, lc)
+     unsigned dist;  /* distance of matched string */
+     unsigned lc;    /* match length-MIN_MATCH or unmatched char (if dis=
t=3D=3D0) */
+ {
+-    s->d_buf[s->last_lit] =3D (ush)dist;
+-    s->l_buf[s->last_lit++] =3D (uch)lc;
++    s->sym_buf[s->sym_next++] =3D dist;
++    s->sym_buf[s->sym_next++] =3D dist >> 8;
++    s->sym_buf[s->sym_next++] =3D lc;
+     if (dist =3D=3D 0) {
+         /* lc is the unmatched char */
+         s->dyn_ltree[lc].Freq++;
+@@ -1033,30 +1034,7 @@ int ZLIB_INTERNAL _tr_tally (s, dist, lc)
+         s->dyn_ltree[_length_code[lc]+LITERALS+1].Freq++;
+         s->dyn_dtree[d_code(dist)].Freq++;
+     }
+-
+-#ifdef TRUNCATE_BLOCK
+-    /* Try to guess if it is profitable to stop the current block here =
*/
+-    if ((s->last_lit & 0x1fff) =3D=3D 0 && s->level > 2) {
+-        /* Compute an upper bound for the compressed length */
+-        ulg out_length =3D (ulg)s->last_lit*8L;
+-        ulg in_length =3D (ulg)((long)s->strstart - s->block_start);
+-        int dcode;
+-        for (dcode =3D 0; dcode < D_CODES; dcode++) {
+-            out_length +=3D (ulg)s->dyn_dtree[dcode].Freq *
+-                (5L+extra_dbits[dcode]);
+-        }
+-        out_length >>=3D 3;
+-        Tracev((stderr,"\nlast_lit %u, in %ld, out ~%ld(%ld%%) ",
+-               s->last_lit, in_length, out_length,
+-               100L - out_length*100L/in_length));
+-        if (s->matches < s->last_lit/2 && out_length < in_length/2) ret=
urn 1;
+-    }
+-#endif
+-    return (s->last_lit =3D=3D s->lit_bufsize-1);
+-    /* We avoid equality with lit_bufsize because of wraparound at 64K
+-     * on 16 bit machines and because stored blocks are restricted to
+-     * 64K-1 bytes.
+-     */
++    return (s->sym_next =3D=3D s->sym_end);
+ }
+=20
+ /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+@@ -1069,13 +1047,14 @@ local void compress_block(s, ltree, dtree)
+ {
+     unsigned dist;      /* distance of matched string */
+     int lc;             /* match length or unmatched char (if dist =3D=3D=
 0) */
+-    unsigned lx =3D 0;    /* running index in l_buf */
++    unsigned sx =3D 0;    /* running index in sym_buf */
+     unsigned code;      /* the code to send */
+     int extra;          /* number of extra bits to send */
+=20
+-    if (s->last_lit !=3D 0) do {
+-        dist =3D s->d_buf[lx];
+-        lc =3D s->l_buf[lx++];
++    if (s->sym_next !=3D 0) do {
++        dist =3D s->sym_buf[sx++] & 0xff;
++        dist +=3D (unsigned)(s->sym_buf[sx++] & 0xff) << 8;
++        lc =3D s->sym_buf[sx++];
+         if (dist =3D=3D 0) {
+             send_code(s, lc, ltree); /* send a literal byte */
+             Tracecv(isgraph(lc), (stderr," '%c' ", lc));
+@@ -1100,11 +1079,10 @@ local void compress_block(s, ltree, dtree)
+             }
+         } /* literal or match pair ? */
+=20
+-        /* Check that the overlay between pending_buf and d_buf+l_buf i=
s ok: */
+-        Assert((uInt)(s->pending) < s->lit_bufsize + 2*lx,
+-               "pendingBuf overflow");
++        /* Check that the overlay between pending_buf and sym_buf is ok=
: */
++        Assert(s->pending < s->lit_bufsize + sx, "pendingBuf overflow")=
;
+=20
+-    } while (lx < s->last_lit);
++    } while (sx < s->sym_next);
+=20
+     send_code(s, END_BLOCK, ltree);
+ }
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zl=
ib/zlib_1.2.11.bb
index ef9431ae475..bc42cd64e9d 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D6;endline=
=3D23;md5=3D5377232268e952e9ef6
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.=
xz \
            file://ldflags-tests.patch \
+           file://CVE-2018-25032.patch \
            file://run-ptest \
            "
 UPSTREAM_CHECK_URI =3D "http://zlib.net/"
--=20
2.25.1


