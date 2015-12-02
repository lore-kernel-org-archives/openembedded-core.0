Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2386FFA6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 18:42:15 +0000 (UTC)
Received: by pfu207 with SMTP id 207so1254180pfu.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Btqos39VKvBIlUyzaE0Rp+l4KTsqh3yolGwBbN9B4gA=;
	b=CiOyIiKkQ6m3zswCWHBfvfYIpehbD4Wj5bFPupGyjb8I1jvrm6Nu5lBc433uqlid+E
	bNcX4645DW9V2jn/oeZMj99ZM/HZOVh3murfpWz60iH2ZCoaQoLIe1jdaobdp325F0nP
	j5grgIL64kCc0eGNij4yTmNqBJ2QHjRONQRYi00BbGoavK+79MP0mWCQD7a3qbICmTBC
	9OnVKqIFz+h6icxK4LtW89/JAcdyOhKZ1s8P8ZonB4DIuSaycKfRrQlaB8molsEZr9Ad
	LMxmRJnxPDiI/m95DJEsglJX6MuA4vpaTeDbgyK5XMm822tAB0menj4exTzuMQ6JIvb0
	Ro9Q==
X-Received: by 10.98.74.26 with SMTP id x26mr6771840pfa.15.1449081736639;
	Wed, 02 Dec 2015 10:42:16 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id 1sm5784163pfo.72.2015.12.02.10.42.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 10:42:15 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 10:41:46 -0800
Message-Id: <1449081706-4058-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] busybox: backport upstream fixes for unzip
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
X-List-Received-Date: Wed, 02 Dec 2015 18:42:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

  http://git.busybox.net/busybox/commit/?h=1_24_stable&id=6767af17f11144c7cd3cfe9ef799d7f89a78fe65
  http://git.busybox.net/busybox/commit/?h=1_24_stable&id=092fabcf1df5d46cd22be4ffcd3b871f6180eb9c

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../busybox/busybox-1.24.1-unzip-regression.patch  | 143 +++++++++++++++++++++
 .../busybox/busybox/busybox-1.24.1-unzip.patch     | 118 +++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |   2 +
 3 files changed, 263 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch b/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch
new file mode 100644
index 0000000..e3c5020
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch
@@ -0,0 +1,143 @@
+Upstream-Status: Backport
+
+  http://busybox.net/downloads/fixes-1.24.1/
+  http://git.busybox.net/busybox/commit/?id=092fabcf1df5d46cd22be4ffcd3b871f6180eb9c
+  http://git.busybox.net/busybox/commit/?h=1_24_stable&id=092fabcf1df5d46cd22be4ffcd3b871f6180eb9c
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+From 092fabcf1df5d46cd22be4ffcd3b871f6180eb9c Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 30 Oct 2015 23:41:53 +0100
+Subject: [PATCH] [g]unzip: fix recent breakage.
+
+Also, do emit error message we so painstakingly pass from gzip internals
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit 6bd3fff51aa74e2ee2d87887b12182a3b09792ef)
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ archival/libarchive/decompress_gunzip.c | 33 +++++++++++++++++++++------------
+ testsuite/unzip.tests                   |  1 +
+ 2 files changed, 22 insertions(+), 12 deletions(-)
+
+diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
+index c76fd31..357c9bf 100644
+--- a/archival/libarchive/decompress_gunzip.c
++++ b/archival/libarchive/decompress_gunzip.c
+@@ -309,8 +309,7 @@ static int huft_build(const unsigned *b, const unsigned n,
+ 	huft_t *q;              /* points to current table */
+ 	huft_t r;               /* table entry for structure assignment */
+ 	huft_t *u[BMAX];        /* table stack */
+-	unsigned v[N_MAX];      /* values in order of bit length */
+-	unsigned v_end;
++	unsigned v[N_MAX + 1];  /* values in order of bit length. last v[] is never used */
+ 	int ws[BMAX + 1];       /* bits decoded stack */
+ 	int w;                  /* bits decoded */
+ 	unsigned x[BMAX + 1];   /* bit offsets, then code stack */
+@@ -365,15 +364,17 @@ static int huft_build(const unsigned *b, const unsigned n,
+ 		*xp++ = j;
+ 	}
+ 
+-	/* Make a table of values in order of bit lengths */
++	/* Make a table of values in order of bit lengths.
++	 * To detect bad input, unused v[i]'s are set to invalid value UINT_MAX.
++	 * In particular, last v[i] is never filled and must not be accessed.
++	 */
++	memset(v, 0xff, sizeof(v));
+ 	p = b;
+ 	i = 0;
+-	v_end = 0;
+ 	do {
+ 		j = *p++;
+ 		if (j != 0) {
+ 			v[x[j]++] = i;
+-			v_end = x[j];
+ 		}
+ 	} while (++i < n);
+ 
+@@ -435,7 +436,9 @@ static int huft_build(const unsigned *b, const unsigned n,
+ 
+ 			/* set up table entry in r */
+ 			r.b = (unsigned char) (k - w);
+-			if (p >= v + v_end) { // Was "if (p >= v + n)" but v[] can be shorter!
++			if (/*p >= v + n || -- redundant, caught by the second check: */
++			    *p == UINT_MAX /* do we access uninited v[i]? (see memset(v))*/
++			) {
+ 				r.e = 99; /* out of values--invalid code */
+ 			} else if (*p < s) {
+ 				r.e = (unsigned char) (*p < 256 ? 16 : 15);	/* 256 is EOB code */
+@@ -520,8 +523,9 @@ static NOINLINE int inflate_codes(STATE_PARAM_ONLY)
+ 		e = t->e;
+ 		if (e > 16)
+ 			do {
+-				if (e == 99)
+-					abort_unzip(PASS_STATE_ONLY);;
++				if (e == 99) {
++					abort_unzip(PASS_STATE_ONLY);
++				}
+ 				bb >>= t->b;
+ 				k -= t->b;
+ 				e -= 16;
+@@ -557,8 +561,9 @@ static NOINLINE int inflate_codes(STATE_PARAM_ONLY)
+ 			e = t->e;
+ 			if (e > 16)
+ 				do {
+-					if (e == 99)
++					if (e == 99) {
+ 						abort_unzip(PASS_STATE_ONLY);
++					}
+ 					bb >>= t->b;
+ 					k -= t->b;
+ 					e -= 16;
+@@ -824,8 +829,9 @@ static int inflate_block(STATE_PARAM smallint *e)
+ 
+ 		b_dynamic >>= 4;
+ 		k_dynamic -= 4;
+-		if (nl > 286 || nd > 30)
++		if (nl > 286 || nd > 30) {
+ 			abort_unzip(PASS_STATE_ONLY);	/* bad lengths */
++		}
+ 
+ 		/* read in bit-length-code lengths */
+ 		for (j = 0; j < nb; j++) {
+@@ -906,12 +912,14 @@ static int inflate_block(STATE_PARAM smallint *e)
+ 		bl = lbits;
+ 
+ 		i = huft_build(ll, nl, 257, cplens, cplext, &inflate_codes_tl, &bl);
+-		if (i != 0)
++		if (i != 0) {
+ 			abort_unzip(PASS_STATE_ONLY);
++		}
+ 		bd = dbits;
+ 		i = huft_build(ll + nl, nd, 0, cpdist, cpdext, &inflate_codes_td, &bd);
+-		if (i != 0)
++		if (i != 0) {
+ 			abort_unzip(PASS_STATE_ONLY);
++		}
+ 
+ 		/* set up data for inflate_codes() */
+ 		inflate_codes_setup(PASS_STATE bl, bd);
+@@ -999,6 +1007,7 @@ inflate_unzip_internal(STATE_PARAM transformer_state_t *xstate)
+ 	error_msg = "corrupted data";
+ 	if (setjmp(error_jmp)) {
+ 		/* Error from deep inside zip machinery */
++		bb_error_msg(error_msg);
+ 		n = -1;
+ 		goto ret;
+ 	}
+diff --git a/testsuite/unzip.tests b/testsuite/unzip.tests
+index ca0a458..d8738a3 100755
+--- a/testsuite/unzip.tests
++++ b/testsuite/unzip.tests
+@@ -34,6 +34,7 @@ rm foo.zip
+ testing "unzip (bad archive)" "uudecode; unzip bad.zip 2>&1; echo \$?" \
+ "Archive:  bad.zip
+   inflating: ]3j½r«IK-%Ix
++unzip: corrupted data
+ unzip: inflate error
+ 1
+ " \
+-- 
+2.6.2
+
diff --git a/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch b/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
new file mode 100644
index 0000000..7186726
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
@@ -0,0 +1,118 @@
+Upstream-Status: Backport
+
+  http://busybox.net/downloads/fixes-1.24.1/
+  http://git.busybox.net/busybox/commit/?id=1de25a6e87e0e627aa34298105a3d17c60a1f44e
+  http://git.busybox.net/busybox/commit/?h=1_24_stable&id=6767af17f11144c7cd3cfe9ef799d7f89a78fe65
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+From 1de25a6e87e0e627aa34298105a3d17c60a1f44e Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 26 Oct 2015 19:33:05 +0100
+Subject: [PATCH] unzip: test for bad archive SEGVing
+
+function                                             old     new   delta
+huft_build                                          1296    1300      +4
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ archival/libarchive/decompress_gunzip.c | 11 +++++++----
+ testsuite/unzip.tests                   | 23 ++++++++++++++++++++++-
+ 2 files changed, 29 insertions(+), 5 deletions(-)
+
+diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
+index 7b6f459..30bf451 100644
+--- a/archival/libarchive/decompress_gunzip.c
++++ b/archival/libarchive/decompress_gunzip.c
+@@ -305,11 +305,12 @@ static int huft_build(const unsigned *b, const unsigned n,
+ 	unsigned i;             /* counter, current code */
+ 	unsigned j;             /* counter */
+ 	int k;                  /* number of bits in current code */
+-	unsigned *p;            /* pointer into c[], b[], or v[] */
++	const unsigned *p;      /* pointer into c[], b[], or v[] */
+ 	huft_t *q;              /* points to current table */
+ 	huft_t r;               /* table entry for structure assignment */
+ 	huft_t *u[BMAX];        /* table stack */
+ 	unsigned v[N_MAX];      /* values in order of bit length */
++	unsigned v_end;
+ 	int ws[BMAX + 1];       /* bits decoded stack */
+ 	int w;                  /* bits decoded */
+ 	unsigned x[BMAX + 1];   /* bit offsets, then code stack */
+@@ -324,7 +325,7 @@ static int huft_build(const unsigned *b, const unsigned n,
+ 
+ 	/* Generate counts for each bit length */
+ 	memset(c, 0, sizeof(c));
+-	p = (unsigned *) b; /* cast allows us to reuse p for pointing to b */
++	p = b;
+ 	i = n;
+ 	do {
+ 		c[*p]++; /* assume all entries <= BMAX */
+@@ -365,12 +366,14 @@ static int huft_build(const unsigned *b, const unsigned n,
+ 	}
+ 
+ 	/* Make a table of values in order of bit lengths */
+-	p = (unsigned *) b;
++	p = b;
+ 	i = 0;
++	v_end = 0;
+ 	do {
+ 		j = *p++;
+ 		if (j != 0) {
+ 			v[x[j]++] = i;
++			v_end = x[j];
+ 		}
+ 	} while (++i < n);
+ 
+@@ -432,7 +435,7 @@ static int huft_build(const unsigned *b, const unsigned n,
+ 
+ 			/* set up table entry in r */
+ 			r.b = (unsigned char) (k - w);
+-			if (p >= v + n) {
++			if (p >= v + v_end) { // Was "if (p >= v + n)" but v[] can be shorter!
+ 				r.e = 99; /* out of values--invalid code */
+ 			} else if (*p < s) {
+ 				r.e = (unsigned char) (*p < 256 ? 16 : 15);	/* 256 is EOB code */
+diff --git a/testsuite/unzip.tests b/testsuite/unzip.tests
+index 8677a03..ca0a458 100755
+--- a/testsuite/unzip.tests
++++ b/testsuite/unzip.tests
+@@ -7,7 +7,7 @@
+ 
+ . ./testing.sh
+ 
+-# testing "test name" "options" "expected result" "file input" "stdin"
++# testing "test name" "commands" "expected result" "file input" "stdin"
+ #   file input will be file called "input"
+ #   test can create a file "actual" instead of writing to stdout
+ 
+@@ -30,6 +30,27 @@ testing "unzip (subdir only)" "unzip -q foo.zip foo/ && test -d foo && test ! -f
+ rmdir foo
+ rm foo.zip
+ 
++# File containing some damaged encrypted stream
++testing "unzip (bad archive)" "uudecode; unzip bad.zip 2>&1; echo \$?" \
++"Archive:  bad.zip
++  inflating: ]3j½r«IK-%Ix
++unzip: inflate error
++1
++" \
++"" "\
++begin-base64 644 bad.zip
++UEsDBBQAAgkIAAAAIQA5AAAANwAAADwAAAAQAAcAXTNqwr1ywqtJGxJLLSVJ
++eCkBD0AdKBk8JzQsIj01JC0/ORJQSwMEFAECCAAAAAAhADoAAAAPAAAANgAA
++AAwAAQASw73Ct1DCokohPXQiNjoUNTUiHRwgLT4WHlBLAQIQABQAAggIAAAA
++oQA5AAAANwAAADwAAAAQQAcADAAAACwAMgCAAAAAAABdM2rCvXLCq0kbEkst
++JUl4KQEPQB0oGSY4Cz4QNgEnJSYIPVBLAQIAABQAAggAAAAAIQAqAAAADwAA
++BDYAAAAMAAEADQAAADIADQAAAEEAAAASw73Ct1DKokohPXQiNzA+FAI1HCcW
++NzITNFBLBQUKAC4JAA04Cw0EOhZQSwUGAQAABAIAAgCZAAAAeQAAAAIALhM=
++====
++"
++
++rm *
++
+ # Clean up scratch directory.
+ 
+ cd ..
+-- 
+2.6.2
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 7d2a7b2..02e8a49 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -32,6 +32,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
            file://0002-Passthrough-r-to-linker.patch \
+           file://busybox-1.24.1-unzip.patch \
+           file://busybox-1.24.1-unzip-regression.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
-- 
1.9.1


