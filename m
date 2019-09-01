Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5C1B87F458
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:49 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id d1so5939071pgp.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HhqHhlL2fb++aBCJYyTYxdsmHebEDu32euprRmXHbp8=;
	b=T8LWkktr6IdbfpHOiW29TjwClMrjJzYQpo4TjQfaHEvuep/lTjjbmSHt8eDIGIdHOW
	15Kvh4LKvep/HWTkywfWs7qVz7BX5Mawp79BT+C9UL3oJO4Ya3UDKJyDiJVBDBkJGIAL
	lU2qiyOCT0C5G4bzw2shGAeDw91xOkHBTWlyrSQh5Cmtegg7HHdcvuIiTsVcptE2mFAr
	KpEQhLrgRqh7Xl4cZiinFYe9bs/Dcj/XkLNmjK1Ke0A8/usScPuYtp6Tk0TZJ0fGJxUY
	3vUkMk+A2ky6dDY4JhcNHog13G2P+T3QgDJM6GgoY3wgEfNSysPZgTxXR74yCDsPvubL
	NtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HhqHhlL2fb++aBCJYyTYxdsmHebEDu32euprRmXHbp8=;
	b=Aj1KWnPVH6daRHmAxXrwQ4a+X7RP9PHztmqFmdxFrGUWzgLJdL6J0E+QHDVwhLNUh4
	S5ARRzLEOG5JNDZYkDRjgipqV4AZmcNJDT2CKvWhEzLkWKIxoIoYqKvtbfcwBvJIWAUP
	voLpWXc48/pjRCDgHPPkNAPUz5pZNIcrhIlZXFp3x8QSrxyeAi/Z9w9zIAgRkCBmRh43
	GHgNN9uoMQz1Kh4NVIO7NZhgZ25zlNUHkpaECgj4MUU1KAolzfosXOGRTCfEAC6i14eR
	LKAy62oxVgcHlFyjCKRdDgTDK90JHwmE/FII+t14enZZeXv9zU2Koi1xADK/PaGsQ9vS
	n+Aw==
X-Gm-Message-State: APjAAAWw+gygCu1MXJXORYgbcmg0GiHEfyZKvyd0b6JCKLQItuk4GtYb
	XjpUDHQqTRiL8F8c1piWW6QNQY4j
X-Google-Smtp-Source: APXvYqw6fNkP8RaOyYmWAbXMzQ9RniOhPGyPrCVdutHh/FsxSt3sRfOPd3olhaXyYQJTUH1mLHK58A==
X-Received: by 2002:a17:90a:6302:: with SMTP id
	e2mr3514013pjj.34.1567348609961; 
	Sun, 01 Sep 2019 07:36:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:04 -0700
Message-Id: <15416a95f31f4c55132a2c5a162e86c62c493e49.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 26/43] rsync: fix CVEs for included zlib
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:49 -0000

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../rsync/files/CVE-2016-9840.patch                |  75 +++++++
 .../rsync/files/CVE-2016-9841.patch                | 228 +++++++++++++++++++++
 .../rsync/files/CVE-2016-9842.patch                |  33 +++
 .../rsync/files/CVE-2016-9843.patch                |  53 +++++
 meta/recipes-devtools/rsync/rsync_3.1.3.bb         |   4 +
 5 files changed, 393 insertions(+)
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
index 29cb231..ffb1d06 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
@@ -11,6 +11,10 @@ DEPENDS = "popt"
 SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
            file://makefile-no-rebuild.patch \
+           file://CVE-2016-9840.patch \
+           file://CVE-2016-9841.patch \
+           file://CVE-2016-9842.patch \
+           file://CVE-2016-9843.patch \
 "
 
 SRC_URI[md5sum] = "1581a588fde9d89f6bc6201e8129afaf"
-- 
2.7.4


