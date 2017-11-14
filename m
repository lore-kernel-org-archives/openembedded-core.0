Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 00B227857A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 20:01:53 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id x28so9391165ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 12:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iB51tZBlesW8FFuuo4bt+lrTIg28YniZpzlWHohwEo8=;
	b=GfhiLA9HoylgJ4iviBfaAz/7XW4KXhDvTrjVJpR7jEoDzeMfXA6hszerjDNK+/IczC
	Z31wqIEdSj7dWW2c9lunZa+XOoOvNseRXsDk9mNU+HFCBJlD+QnQnDN9WdjqI2slXV9O
	6Wz4RZJABPTYtSRr6G2HD1Er2oXZWZN4pmpsqL8trKF5KFfliBt9Pi69jLnpYMw0RGxW
	S5BQOhyp3zuA1AhKO5ROoPRDaiAq+vid/3wajTeXHMQVQAdHXM7w9mERfns7AM8DThW/
	S35xzX/NYgC9YHIE7m1vKGgce7i2t86kpLxYWPmuHXvWts1dwH+0XfYyARsebsUVIIrM
	Gw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iB51tZBlesW8FFuuo4bt+lrTIg28YniZpzlWHohwEo8=;
	b=l/xjeJDf+nB8P9+w7E9d9ajN3nlZmVzuKOXTHHDGTH1z702CCcZu//NITmVfYUBvvn
	KNmd4CEmxQDNGzJyNJ2EkT5aiq/GbYFwqCk3n4CbqHcjVv/NsyO2e+IjO4IXn1T4beCs
	T2jDGNAvUByXod+Dg0eJXJ3qHGmdb+G6DyZdmDZN0Zm3pOoshF++dQ1/KRNSq/ll0aBL
	kUAkuWVi1IAJYT/+9hVOeAbsJ7h+CBEgG2f3L4wjBn8SDbRAoYt/NI1p2vIhQTbod75j
	f1jArH8toophhwY67KMgJTyjG6nhmZluxZp/tp0uilkob8j63OByVyECEfNezMsxLa0L
	JE0A==
X-Gm-Message-State: AJaThX7NO6pxEIQuHMo8wYOTuWazhdpRiJuK1p3N+DsEcybFe9jvMiQY
	58mhy/Sae6Dot2b3CEix+S5D
X-Google-Smtp-Source: AGs4zMZkOnpNX1i+Imba6GI95fohWpUmG9g9JYeSsupfRxM1Xmw2LImfnjnBL/wbA2zNJtNuMHvNvA==
X-Received: by 10.36.16.66 with SMTP id 63mr16294874ity.105.1510689714587;
	Tue, 14 Nov 2017 12:01:54 -0800 (PST)
Received: from localhost.localdomain ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id x2sm3054754ite.24.2017.11.14.12.01.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 12:01:54 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 14:01:04 -0600
Message-Id: <20171114200106.18227-2-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114200106.18227-1-george.mccollister@gmail.com>
References: <20171114200106.18227-1-george.mccollister@gmail.com>
Subject: [morty][PATCH 2/4] zlib: Fix CVE-2016-9841
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
X-List-Received-Date: Tue, 14 Nov 2017 20:01:54 -0000

Add backported patch to fix CVE-2016-9841 which was fixed in zlib 1.2.9

https://nvd.nist.gov/vuln/detail/CVE-2016-9841

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 .../zlib/zlib-1.2.8/CVE-2016-9841.patch            | 230 +++++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.8.bb               |   1 +
 2 files changed, 231 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9841.patch

diff --git a/meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9841.patch b/meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9841.patch
new file mode 100644
index 0000000000..9cf7a77786
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9841.patch
@@ -0,0 +1,230 @@
+commit 9aaec95e82117c1cb0f9624264c3618fc380cecb
+Author: Mark Adler <madler@alumni.caltech.edu>
+Date:   Wed Sep 21 22:25:21 2016 -0700
+
+    Use post-increment only in inffast.c.
+    
+    An old inffast.c optimization turns out to not be optimal anymore
+    with modern compilers, and furthermore was not compliant with the
+    C standard, for which decrementing a pointer before its allocated
+    memory is undefined. Per the recommendation of a security audit of
+    the zlib code by Trail of Bits and TrustInSoft, in support of the
+    Mozilla Foundation, this "optimization" was removed, in order to
+    avoid the possibility of undefined behavior.
+
+Upstream-Status: Backport
+http://http.debian.net/debian/pool/main/z/zlib/zlib_1.2.8.dfsg-5.debian.tar.xz
+https://github.com/madler/zlib/commit/9aaec95e82117c1cb0f9624264c3618fc380cecb
+
+CVE: CVE-2016-9841
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+
+diff --git a/inffast.c b/inffast.c
+index bda59ce..f0d163d 100644
+--- a/inffast.c
++++ b/inffast.c
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
diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.8.bb
index b6a4c687ca..88f60611d9 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://Makefile-runtests.patch \
            file://ldflags-tests.patch \
            file://CVE-2016-9840.patch \
+           file://CVE-2016-9841.patch \
            file://run-ptest \
            "
 
-- 
2.15.0


