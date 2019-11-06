Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0BA7F89A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2pIfFh9jz+Qs39qnxFowADsx3ruYO2kjhsUMbXs1OTQ=;
	b=Y2pdYNkulRjXRd0yNhBNwpLhug
	PPNJJ8ETqnSSGOiBEvVTASeNtyL7Z5cL2WFjCKIApjOYlHMETH4lysldWJNMJW991dGumajy9pDU7
	SE160k3aS3S5qemOWFsx1JtV0UqP/zW319Qwkq4rXnn+Ri5lf/mpz7PxHi1aOcwuQFIkEIvr9KDs/
	xSmydv5BOpa1RePXFXd75N6fRbkWvCnUFKogY8FhaI3kHqeN1WEzhfAvbedTPWpvV5Sq1N/koOlXl
	pr0yPj8LhDuLdrfy5fpZw1N6hK2PCYt/PFoEIQLGW11Dgb6MA+AfZiyC7hB3OJnnmcucqrxbj1phC
	7/RlElqg==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOP-0000A5-LN; Wed, 06 Nov 2019 17:38:46 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO7-0007av-Av; Wed, 06 Nov 2019 17:38:27 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:58 +0200
Message-Id: <a587153fd1b41644664c2e890c9b52d66ee6e89b.1573047195.git.mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
X-Rspam-Score: 6.0 (++++++)
X-Rspam-Report: Action: add header Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: MULTIPLE_UNIQUE_HEADERS(4.89) Symbol: MIME_GOOD(-0.10)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: RCVD_TLS_LAST(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: NEURAL_HAM(-0.00)
	Symbol: IP_SCORE(-0.15) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID:
	a587153fd1b41644664c2e890c9b52d66ee6e89b.1573047195.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 43/47] rsync: fix CVEs for included zlib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Nov 2019 15:38:46 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

rsync includes its own copy of zlib and doesn't recommend linking with
the system version [1].

Import CVE fixes that impact zlib version 1.2.8 [2] that is currently used
by rsync.

[1] https://git.samba.org/rsync.git/?p=rsync.git;a=blob;f=zlib/README.rsync
[2] https://nvd.nist.gov/vuln/search/results?form_type=Advanced&cves=on&cpe_version=cpe%3a%2fa%3agnu%3azlib%3a1.2.8

(From OE-Core rev: a55fbb4cb489853dfb0b4553f6e187c3f3633f48)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Conflicts:
	meta/recipes-devtools/rsync/rsync_3.1.3.bb
---
 .../rsync/files/CVE-2016-9840.patch                |  75 +++++++
 .../rsync/files/CVE-2016-9841.patch                | 228 +++++++++++++++++++++
 .../rsync/files/CVE-2016-9842.patch                |  33 +++
 .../rsync/files/CVE-2016-9843.patch                |  53 +++++
 meta/recipes-devtools/rsync/rsync_3.1.3.bb         |   7 +-
 5 files changed, 395 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9840.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9841.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9842.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9843.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2016-9840.patch b/meta/recipes-devtools/rsync/files/CVE-2016-9840.patch
new file mode 100644
index 0000000..7581887
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2016-9840.patch
@@ -0,0 +1,75 @@
+From 6a043145ca6e9c55184013841a67b2fef87e44c0 Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Wed, 21 Sep 2016 23:35:50 -0700
+Subject: [PATCH] Remove offset pointer optimization in inftrees.c.
+
+inftrees.c was subtracting an offset from a pointer to an array,
+in order to provide a pointer that allowed indexing starting at
+the offset. This is not compliant with the C standard, for which
+the behavior of a pointer decremented before its allocated memory
+is undefined. Per the recommendation of a security audit of the
+zlib code by Trail of Bits and TrustInSoft, in support of the
+Mozilla Foundation, this tiny optimization was removed, in order
+to avoid the possibility of undefined behavior.
+
+CVE: CVE-2016-9840
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ inftrees.c | 18 ++++++++----------
+ 1 file changed, 8 insertions(+), 10 deletions(-)
+
+diff --git a/zlib/inftrees.c b/zlib/inftrees.c
+index 22fcd666..0d2670d5 100644
+--- a/zlib/inftrees.c
++++ b/zlib/inftrees.c
+@@ -54,7 +54,7 @@ unsigned short FAR *work;
+     code FAR *next;             /* next available space in table */
+     const unsigned short FAR *base;     /* base value table to use */
+     const unsigned short FAR *extra;    /* extra bits table to use */
+-    int end;                    /* use base and extra for symbol > end */
++    unsigned match;             /* use base and extra for symbol >= match */
+     unsigned short count[MAXBITS+1];    /* number of codes of each length */
+     unsigned short offs[MAXBITS+1];     /* offsets in table for each length */
+     static const unsigned short lbase[31] = { /* Length codes 257..285 base */
+@@ -181,19 +181,17 @@ unsigned short FAR *work;
+     switch (type) {
+     case CODES:
+         base = extra = work;    /* dummy value--not used */
+-        end = 19;
++        match = 20;
+         break;
+     case LENS:
+         base = lbase;
+-        base -= 257;
+         extra = lext;
+-        extra -= 257;
+-        end = 256;
++        match = 257;
+         break;
+     default:            /* DISTS */
+         base = dbase;
+         extra = dext;
+-        end = -1;
++        match = 0;
+     }
+ 
+     /* initialize state for loop */
+@@ -216,13 +214,13 @@ unsigned short FAR *work;
+     for (;;) {
+         /* create table entry */
+         here.bits = (unsigned char)(len - drop);
+-        if ((int)(work[sym]) < end) {
++        if (work[sym] + 1 < match) {
+             here.op = (unsigned char)0;
+             here.val = work[sym];
+         }
+-        else if ((int)(work[sym]) > end) {
+-            here.op = (unsigned char)(extra[work[sym]]);
+-            here.val = base[work[sym]];
++        else if (work[sym] >= match) {
++            here.op = (unsigned char)(extra[work[sym] - match]);
++            here.val = base[work[sym] - match];
+         }
+         else {
+             here.op = (unsigned char)(32 + 64);         /* end of block */
diff --git a/meta/recipes-devtools/rsync/files/CVE-2016-9841.patch b/meta/recipes-devtools/rsync/files/CVE-2016-9841.patch
new file mode 100644
index 0000000..3942176
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2016-9841.patch
@@ -0,0 +1,228 @@
+From 9aaec95e82117c1cb0f9624264c3618fc380cecb Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Wed, 21 Sep 2016 22:25:21 -0700
+Subject: [PATCH] Use post-increment only in inffast.c.
+
+An old inffast.c optimization turns out to not be optimal anymore
+with modern compilers, and furthermore was not compliant with the
+C standard, for which decrementing a pointer before its allocated
+memory is undefined. Per the recommendation of a security audit of
+the zlib code by Trail of Bits and TrustInSoft, in support of the
+Mozilla Foundation, this "optimization" was removed, in order to
+avoid the possibility of undefined behavior.
+
+CVE: CVE-2016-9841
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ zlib/inffast.c | 81 +++++++++++++++++++++----------------------------------
+ 1 file changed, 31 insertions(+), 50 deletions(-)
+
+diff --git a/zlib/inffast.c b/zlib/inffast.c
+index bda59ceb..f0d163db 100644
+--- a/zlib/inffast.c
++++ b/zlib/inffast.c
+@@ -10,25 +10,6 @@
+ 
+ #ifndef ASMINF
+ 
+-/* Allow machine dependent optimization for post-increment or pre-increment.
+-   Based on testing to date,
+-   Pre-increment preferred for:
+-   - PowerPC G3 (Adler)
+-   - MIPS R5000 (Randers-Pehrson)
+-   Post-increment preferred for:
+-   - none
+-   No measurable difference:
+-   - Pentium III (Anderson)
+-   - M68060 (Nikl)
+- */
+-#ifdef POSTINC
+-#  define OFF 0
+-#  define PUP(a) *(a)++
+-#else
+-#  define OFF 1
+-#  define PUP(a) *++(a)
+-#endif
+-
+ /*
+    Decode literal, length, and distance codes and write out the resulting
+    literal and match bytes until either not enough input or output is
+@@ -96,9 +77,9 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
+ 
+     /* copy state to local variables */
+     state = (struct inflate_state FAR *)strm->state;
+-    in = strm->next_in - OFF;
++    in = strm->next_in;
+     last = in + (strm->avail_in - 5);
+-    out = strm->next_out - OFF;
++    out = strm->next_out;
+     beg = out - (start - strm->avail_out);
+     end = out + (strm->avail_out - 257);
+ #ifdef INFLATE_STRICT
+@@ -119,9 +100,9 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
+        input data or output space */
+     do {
+         if (bits < 15) {
+-            hold += (unsigned long)(PUP(in)) << bits;
++            hold += (unsigned long)(*in++) << bits;
+             bits += 8;
+-            hold += (unsigned long)(PUP(in)) << bits;
++            hold += (unsigned long)(*in++) << bits;
+             bits += 8;
+         }
+         here = lcode[hold & lmask];
+@@ -134,14 +115,14 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
+             Tracevv((stderr, here.val >= 0x20 && here.val < 0x7f ?
+                     "inflate:         literal '%c'\n" :
+                     "inflate:         literal 0x%02x\n", here.val));
+-            PUP(out) = (unsigned char)(here.val);
++            *out++ = (unsigned char)(here.val);
+         }
+         else if (op & 16) {                     /* length base */
+             len = (unsigned)(here.val);
+             op &= 15;                           /* number of extra bits */
+             if (op) {
+                 if (bits < op) {
+-                    hold += (unsigned long)(PUP(in)) << bits;
++                    hold += (unsigned long)(*in++) << bits;
+                     bits += 8;
+                 }
+                 len += (unsigned)hold & ((1U << op) - 1);
+@@ -150,9 +131,9 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
+             }
+             Tracevv((stderr, "inflate:         length %u\n", len));
+             if (bits < 15) {
+-                hold += (unsigned long)(PUP(in)) << bits;
++                hold += (unsigned long)(*in++) << bits;
+                 bits += 8;
+-                hold += (unsigned long)(PUP(in)) << bits;
++                hold += (unsigned long)(*in++) << bits;
+                 bits += 8;
+             }
+             here = dcode[hold & dmask];
+@@ -165,10 +146,10 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
+                 dist = (unsigned)(here.val);
+                 op &= 15;                       /* number of extra bits */
+                 if (bits < op) {
+-                    hold += (unsigned long)(PUP(in)) << bits;
++                    hold += (unsigned long)(*in++) << bits;
+                     bits += 8;
+                     if (bits < op) {
+-                        hold += (unsigned long)(PUP(in)) << bits;
++                        hold += (unsigned long)(*in++) << bits;
+                         bits += 8;
+                     }
+                 }
+@@ -196,30 +177,30 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
+ #ifdef INFLATE_ALLOW_INVALID_DISTANCE_TOOFAR_ARRR
+                         if (len <= op - whave) {
+                             do {
+-                                PUP(out) = 0;
++                                *out++ = 0;
+                             } while (--len);
+                             continue;
+                         }
+                         len -= op - whave;
+                         do {
+-                            PUP(out) = 0;
++                            *out++ = 0;
+                         } while (--op > whave);
+                         if (op == 0) {
+                             from = out - dist;
+                             do {
+-                                PUP(out) = PUP(from);
++                                *out++ = *from++;
+                             } while (--len);
+                             continue;
+                         }
+ #endif
+                     }
+-                    from = window - OFF;
++                    from = window;
+                     if (wnext == 0) {           /* very common case */
+                         from += wsize - op;
+                         if (op < len) {         /* some from window */
+                             len -= op;
+                             do {
+-                                PUP(out) = PUP(from);
++                                *out++ = *from++;
+                             } while (--op);
+                             from = out - dist;  /* rest from output */
+                         }
+@@ -230,14 +211,14 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
+                         if (op < len) {         /* some from end of window */
+                             len -= op;
+                             do {
+-                                PUP(out) = PUP(from);
++                                *out++ = *from++;
+                             } while (--op);
+-                            from = window - OFF;
++                            from = window;
+                             if (wnext < len) {  /* some from start of window */
+                                 op = wnext;
+                                 len -= op;
+                                 do {
+-                                    PUP(out) = PUP(from);
++                                    *out++ = *from++;
+                                 } while (--op);
+                                 from = out - dist;      /* rest from output */
+                             }
+@@ -248,35 +229,35 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
+                         if (op < len) {         /* some from window */
+                             len -= op;
+                             do {
+-                                PUP(out) = PUP(from);
++                                *out++ = *from++;
+                             } while (--op);
+                             from = out - dist;  /* rest from output */
+                         }
+                     }
+                     while (len > 2) {
+-                        PUP(out) = PUP(from);
+-                        PUP(out) = PUP(from);
+-                        PUP(out) = PUP(from);
++                        *out++ = *from++;
++                        *out++ = *from++;
++                        *out++ = *from++;
+                         len -= 3;
+                     }
+                     if (len) {
+-                        PUP(out) = PUP(from);
++                        *out++ = *from++;
+                         if (len > 1)
+-                            PUP(out) = PUP(from);
++                            *out++ = *from++;
+                     }
+                 }
+                 else {
+                     from = out - dist;          /* copy direct from output */
+                     do {                        /* minimum length is three */
+-                        PUP(out) = PUP(from);
+-                        PUP(out) = PUP(from);
+-                        PUP(out) = PUP(from);
++                        *out++ = *from++;
++                        *out++ = *from++;
++                        *out++ = *from++;
+                         len -= 3;
+                     } while (len > 2);
+                     if (len) {
+-                        PUP(out) = PUP(from);
++                        *out++ = *from++;
+                         if (len > 1)
+-                            PUP(out) = PUP(from);
++                            *out++ = *from++;
+                     }
+                 }
+             }
+@@ -313,8 +294,8 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
+     hold &= (1U << bits) - 1;
+ 
+     /* update state and return */
+-    strm->next_in = in + OFF;
+-    strm->next_out = out + OFF;
++    strm->next_in = in;
++    strm->next_out = out;
+     strm->avail_in = (unsigned)(in < last ? 5 + (last - in) : 5 - (in - last));
+     strm->avail_out = (unsigned)(out < end ?
+                                  257 + (end - out) : 257 - (out - end));
diff --git a/meta/recipes-devtools/rsync/files/CVE-2016-9842.patch b/meta/recipes-devtools/rsync/files/CVE-2016-9842.patch
new file mode 100644
index 0000000..810d8a3
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2016-9842.patch
@@ -0,0 +1,33 @@
+From e54e1299404101a5a9d0cf5e45512b543967f958 Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Sat, 5 Sep 2015 17:45:55 -0700
+Subject: [PATCH] Avoid shifts of negative values inflateMark().
+
+The C standard says that bit shifts of negative integers is
+undefined.  This casts to unsigned values to assure a known
+result.
+
+CVE: CVE-2016-9842
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ inflate.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/zlib/inflate.c b/zlib/inflate.c
+index 2889e3a0..a7184167 100644
+--- a/zlib/inflate.c
++++ b/zlib/inflate.c
+@@ -1506,9 +1506,10 @@ z_streamp strm;
+ {
+     struct inflate_state FAR *state;
+ 
+-    if (strm == Z_NULL || strm->state == Z_NULL) return -1L << 16;
++    if (strm == Z_NULL || strm->state == Z_NULL)
++        return (long)(((unsigned long)0 - 1) << 16);
+     state = (struct inflate_state FAR *)strm->state;
+-    return ((long)(state->back) << 16) +
++    return (long)(((unsigned long)((long)state->back)) << 16) +
+         (state->mode == COPY ? state->length :
+             (state->mode == MATCH ? state->was - state->length : 0));
+ }
diff --git a/meta/recipes-devtools/rsync/files/CVE-2016-9843.patch b/meta/recipes-devtools/rsync/files/CVE-2016-9843.patch
new file mode 100644
index 0000000..ea2e42f
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2016-9843.patch
@@ -0,0 +1,53 @@
+From d1d577490c15a0c6862473d7576352a9f18ef811 Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Wed, 28 Sep 2016 20:20:25 -0700
+Subject: [PATCH] Avoid pre-decrement of pointer in big-endian CRC calculation.
+
+There was a small optimization for PowerPCs to pre-increment a
+pointer when accessing a word, instead of post-incrementing. This
+required prefacing the loop with a decrement of the pointer,
+possibly pointing before the object passed. This is not compliant
+with the C standard, for which decrementing a pointer before its
+allocated memory is undefined. When tested on a modern PowerPC
+with a modern compiler, the optimization no longer has any effect.
+Due to all that, and per the recommendation of a security audit of
+the zlib code by Trail of Bits and TrustInSoft, in support of the
+Mozilla Foundation, this "optimization" was removed, in order to
+avoid the possibility of undefined behavior.
+
+CVE: CVE-2016-9843
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ crc32.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/zlib/crc32.c b/zlib/crc32.c
+index 979a7190..05733f4e 100644
+--- a/zlib/crc32.c
++++ b/zlib/crc32.c
+@@ -278,7 +278,7 @@ local unsigned long crc32_little(crc, buf, len)
+ }
+ 
+ /* ========================================================================= */
+-#define DOBIG4 c ^= *++buf4; \
++#define DOBIG4 c ^= *buf4++; \
+         c = crc_table[4][c & 0xff] ^ crc_table[5][(c >> 8) & 0xff] ^ \
+             crc_table[6][(c >> 16) & 0xff] ^ crc_table[7][c >> 24]
+ #define DOBIG32 DOBIG4; DOBIG4; DOBIG4; DOBIG4; DOBIG4; DOBIG4; DOBIG4; DOBIG4
+@@ -300,7 +300,6 @@ local unsigned long crc32_big(crc, buf, len)
+     }
+ 
+     buf4 = (const z_crc_t FAR *)(const void FAR *)buf;
+-    buf4--;
+     while (len >= 32) {
+         DOBIG32;
+         len -= 32;
+@@ -309,7 +308,6 @@ local unsigned long crc32_big(crc, buf, len)
+         DOBIG4;
+         len -= 4;
+     }
+-    buf4++;
+     buf = (const unsigned char FAR *)buf4;
+ 
+     if (len) do {
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.3.bb b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
index 84a0258..84ecc47 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
@@ -1,6 +1,11 @@
 require rsync.inc
 
-SRC_URI += "file://makefile-no-rebuild.patch"
+SRC_URI += "file://makefile-no-rebuild.patch \
+           file://CVE-2016-9840.patch \
+           file://CVE-2016-9841.patch \
+           file://CVE-2016-9842.patch \
+           file://CVE-2016-9843.patch \
+"
 
 SRC_URI[md5sum] = "1581a588fde9d89f6bc6201e8129afaf"
 SRC_URI[sha256sum] = "55cc554efec5fdaad70de921cd5a5eeb6c29a95524c715f3bbf849235b0800c0"
-- 
1.9.1


