Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1743C3DA7F
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:31 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.30109.1722791370428528947
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yROMzJ3U;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d18112b60so3721105b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791370; x=1723396170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VedhL7dwolt0tlAjGDfRbDv6dJRWjubxzBYN0Tot8Ig=;
        b=yROMzJ3U3HLT6xN4C25ufzMZb8VIIUuIHEQSKhM40T/fl+B+m9JYFO+j1XQkELnbd7
         1a0ZFqh/JMNwPvmAtzSEEyRGPnAIGTDbAlnKBK3Fy+TIEmUVPIs4NHDc9wcyKBfOsdXG
         RJk7pMRKguV1RvdOz73mJaTloVhbIme4SpdbwntFwAsNN4BntFev8gMow4jasLOnE5Bw
         kLt++av5NPTC0bHk2CRyer+tbHcB017W/6jYuQxXv6xI3rE+E7hExboMzPdW9+eNa9Xa
         Otx8VLfsz3xFLSwHYmOMGYajXWziSm+hjNYLudlX+ub3g9A5vhfGBzakD4TNY3G0Gkur
         txRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791370; x=1723396170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VedhL7dwolt0tlAjGDfRbDv6dJRWjubxzBYN0Tot8Ig=;
        b=vZZfMGVH6N97/zxi5eGaUzSXHzNG6DSx93P4sz+nn9YX5ApzDgcugGjHYnWAnSzJ+o
         TlLw1DIukMd5smPrPUQQvHvMlyRKGvacoNCAUBVfpwoKUcOBT55Blg/VMC8HbJdXks/M
         8HgCFx9cymn71N2RMueh1Rk20et/Y8/myCfeytq715AkzyuNc0XobKWQgLpny1HiMK6D
         1dxQZ797SFp4SXc8Ap9wZtq20cgPuQ1Ur+BTRAyL45CeizSmGMPUPRYJDE9o0apBpTCO
         E44/g37Ha3jL4oqd5j0zuehD3+MSDTf4ep+ZLZxICUhF1rZbSdt+r+yrdAN3iD/be63w
         QMAg==
X-Gm-Message-State: AOJu0Yw+ebFZbVB9uDF+DROa7vgOhls3NZa0s9PAQLJympYGmletNW3j
	tBFH1+yUucrrEF51QO8FPOiURixGJ8OYNJwrzsv5nwXsTHP6OXHnfkGp9oQ9rWS9sDS7SOth9jt
	0NzhFiw==
X-Google-Smtp-Source: AGHT+IFLe60ZahBu0znFHDAJJW7UGMZ0yFsTOglFrhRfzyczPSL/eKb3heeF3ghTDIr/nZMe4PoRkw==
X-Received: by 2002:a05:6a20:4392:b0:1bd:2a05:5f24 with SMTP id adf61e73a8af0-1c69a6dbbbfmr11503784637.27.1722791369572;
        Sun, 04 Aug 2024 10:09:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/18] busybox: CVE-2023-42364 and CVE-2023-42365 fixes
Date: Sun,  4 Aug 2024 10:09:05 -0700
Message-Id: <7fa82243e587563172c0c2c4ab005a873583d26e.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202961

From: Khem Raj <raj.khem@gmail.com>

backport upstream fix for CVEs and fix the regression that introduced [1]

[1] http://lists.busybox.net/pipermail/busybox/2024-May/090766.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...01-awk-fix-precedence-of-relative-to.patch | 197 ++++++++++++++++++
 ...x-ternary-operator-and-precedence-of.patch |  96 +++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
 3 files changed, 295 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative-to.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-precedence-of.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative-to.patch b/meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative-to.patch
new file mode 100644
index 0000000000..5836cf8a00
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative-to.patch
@@ -0,0 +1,197 @@
+From dedc9380c76834ba64c8b526aef6f461ea4e7f2e Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 30 May 2023 16:42:18 +0200
+Subject: [PATCH 1/2] awk: fix precedence of = relative to ==
+
+Discovered while adding code to disallow assignments to non-lvalues
+
+function                                             old     new   delta
+parse_expr                                           936     991     +55
+.rodata                                           105243  105247      +4
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 59/0)               Total: 59 bytes
+
+CVE: CVE-2023-42364 CVE-2023-42365
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4]
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit 0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4)
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ editors/awk.c       | 66 ++++++++++++++++++++++++++++++---------------
+ testsuite/awk.tests |  5 ++++
+ 2 files changed, 50 insertions(+), 21 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index ec9301e..aff86fe 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -337,7 +337,9 @@ static void debug_parse_print_tc(uint32_t n)
+ #undef P
+ #undef PRIMASK
+ #undef PRIMASK2
+-#define P(x)      (x << 24)
++/* Smaller 'x' means _higher_ operator precedence */
++#define PRECEDENCE(x) (x << 24)
++#define P(x)      PRECEDENCE(x)
+ #define PRIMASK   0x7F000000
+ #define PRIMASK2  0x7E000000
+ 
+@@ -360,7 +362,7 @@ enum {
+ 	OC_MOVE = 0x1f00,       OC_PGETLINE = 0x2000,   OC_REGEXP = 0x2100,
+ 	OC_REPLACE = 0x2200,    OC_RETURN = 0x2300,     OC_SPRINTF = 0x2400,
+ 	OC_TERNARY = 0x2500,    OC_UNARY = 0x2600,      OC_VAR = 0x2700,
+-	OC_DONE = 0x2800,
++	OC_CONST = 0x2800,      OC_DONE = 0x2900,
+ 
+ 	ST_IF = 0x3000,         ST_DO = 0x3100,         ST_FOR = 0x3200,
+ 	ST_WHILE = 0x3300
+@@ -440,9 +442,9 @@ static const uint32_t tokeninfo[] ALIGN4 = {
+ #define TI_PREINC (OC_UNARY|xV|P(9)|'P')
+ #define TI_PREDEC (OC_UNARY|xV|P(9)|'M')
+ 	TI_PREINC,               TI_PREDEC,               OC_FIELD|xV|P(5),
+-	OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(74),        OC_REPLACE|NV|P(74)|'+', OC_REPLACE|NV|P(74)|'-',
+-	OC_REPLACE|NV|P(74)|'*', OC_REPLACE|NV|P(74)|'/', OC_REPLACE|NV|P(74)|'%', OC_REPLACE|NV|P(74)|'&',
+-	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(74)|'&', OC_BINARY|NV|P(15)|'&',
++	OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(38),        OC_REPLACE|NV|P(38)|'+', OC_REPLACE|NV|P(38)|'-',
++	OC_REPLACE|NV|P(38)|'*', OC_REPLACE|NV|P(38)|'/', OC_REPLACE|NV|P(38)|'%', OC_REPLACE|NV|P(38)|'&',
++	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(38)|'&', OC_BINARY|NV|P(15)|'&',
+ 	OC_BINARY|NV|P(25)|'/',  OC_BINARY|NV|P(25)|'%',  OC_BINARY|NV|P(15)|'&',  OC_BINARY|NV|P(25)|'*',
+ 	OC_COMPARE|VV|P(39)|4,   OC_COMPARE|VV|P(39)|3,   OC_COMPARE|VV|P(39)|0,   OC_COMPARE|VV|P(39)|1,
+ #define TI_LESS     (OC_COMPARE|VV|P(39)|2)
+@@ -1290,7 +1292,7 @@ static uint32_t next_token(uint32_t expected)
+ 			save_tclass = tc;
+ 			save_info = t_info;
+ 			tc = TC_BINOPX;
+-			t_info = OC_CONCAT | SS | P(35);
++			t_info = OC_CONCAT | SS | PRECEDENCE(35);
+ 		}
+ 
+ 		t_tclass = tc;
+@@ -1350,9 +1352,8 @@ static node *parse_expr(uint32_t term_tc)
+ {
+ 	node sn;
+ 	node *cn = &sn;
+-	node *vn, *glptr;
++	node *glptr;
+ 	uint32_t tc, expected_tc;
+-	var *v;
+ 
+ 	debug_printf_parse("%s() term_tc(%x):", __func__, term_tc);
+ 	debug_parse_print_tc(term_tc);
+@@ -1363,11 +1364,12 @@ static node *parse_expr(uint32_t term_tc)
+ 	expected_tc = TS_OPERAND | TS_UOPPRE | TC_REGEXP | term_tc;
+ 
+ 	while (!((tc = next_token(expected_tc)) & term_tc)) {
++		node *vn;
+ 
+ 		if (glptr && (t_info == TI_LESS)) {
+ 			/* input redirection (<) attached to glptr node */
+ 			debug_printf_parse("%s: input redir\n", __func__);
+-			cn = glptr->l.n = new_node(OC_CONCAT | SS | P(37));
++			cn = glptr->l.n = new_node(OC_CONCAT | SS | PRECEDENCE(37));
+ 			cn->a.n = glptr;
+ 			expected_tc = TS_OPERAND | TS_UOPPRE;
+ 			glptr = NULL;
+@@ -1379,24 +1381,42 @@ static node *parse_expr(uint32_t term_tc)
+ 			 * previous operators with higher priority */
+ 			vn = cn;
+ 			while (((t_info & PRIMASK) > (vn->a.n->info & PRIMASK2))
+-			    || ((t_info == vn->info) && t_info == TI_COLON)
++			    || (t_info == vn->info && t_info == TI_COLON)
+ 			) {
+ 				vn = vn->a.n;
+ 				if (!vn->a.n) syntax_error(EMSG_UNEXP_TOKEN);
+ 			}
+ 			if (t_info == TI_TERNARY)
+ //TODO: why?
+-				t_info += P(6);
++				t_info += PRECEDENCE(6);
+ 			cn = vn->a.n->r.n = new_node(t_info);
+ 			cn->a.n = vn->a.n;
+ 			if (tc & TS_BINOP) {
+ 				cn->l.n = vn;
+-//FIXME: this is the place to detect and reject assignments to non-lvalues.
+-//Currently we allow "assignments" to consts and temporaries, nonsense like this:
+-// awk 'BEGIN { "qwe" = 1 }'
+-// awk 'BEGIN { 7 *= 7 }'
+-// awk 'BEGIN { length("qwe") = 1 }'
+-// awk 'BEGIN { (1+1) += 3 }'
++
++				/* Prevent:
++				 * awk 'BEGIN { "qwe" = 1 }'
++				 * awk 'BEGIN { 7 *= 7 }'
++				 * awk 'BEGIN { length("qwe") = 1 }'
++				 * awk 'BEGIN { (1+1) += 3 }'
++				 */
++				/* Assignment? (including *= and friends) */
++				if (((t_info & OPCLSMASK) == OC_MOVE)
++				 || ((t_info & OPCLSMASK) == OC_REPLACE)
++				) {
++					debug_printf_parse("%s: MOVE/REPLACE vn->info:%08x\n", __func__, vn->info);
++					/* Left side is a (variable or array element)
++					 * or function argument
++					 * or $FIELD ?
++					 */
++					if ((vn->info & OPCLSMASK) != OC_VAR
++					 && (vn->info & OPCLSMASK) != OC_FNARG
++					 && (vn->info & OPCLSMASK) != OC_FIELD
++					) {
++						syntax_error(EMSG_UNEXP_TOKEN); /* no. bad */
++					}
++				}
++
+ 				expected_tc = TS_OPERAND | TS_UOPPRE | TC_REGEXP;
+ 				if (t_info == TI_PGETLINE) {
+ 					/* it's a pipe */
+@@ -1432,6 +1452,8 @@ static node *parse_expr(uint32_t term_tc)
+ 		/* one should be very careful with switch on tclass -
+ 		 * only simple tclasses should be used (TC_xyz, not TS_xyz) */
+ 		switch (tc) {
++			var *v;
++
+ 		case TC_VARIABLE:
+ 		case TC_ARRAY:
+ 			debug_printf_parse("%s: TC_VARIABLE | TC_ARRAY\n", __func__);
+@@ -1452,14 +1474,14 @@ static node *parse_expr(uint32_t term_tc)
+ 		case TC_NUMBER:
+ 		case TC_STRING:
+ 			debug_printf_parse("%s: TC_NUMBER | TC_STRING\n", __func__);
+-			cn->info = OC_VAR;
++			cn->info = OC_CONST;
+ 			v = cn->l.v = xzalloc(sizeof(var));
+-			if (tc & TC_NUMBER)
++			if (tc & TC_NUMBER) {
+ 				setvar_i(v, t_double);
+-			else {
++			 } else {
+ 				setvar_s(v, t_string);
+-				expected_tc &= ~TC_UOPPOST; /* "str"++ is not allowed */
+ 			}
++			expected_tc &= ~TC_UOPPOST; /* NUM++, "str"++ not allowed */
+ 			break;
+ 
+ 		case TC_REGEXP:
+@@ -3107,6 +3129,8 @@ static var *evaluate(node *op, var *res)
+ 
+ 		/* -- recursive node type -- */
+ 
++		case XC( OC_CONST ):
++			debug_printf_eval("CONST ");
+ 		case XC( OC_VAR ):
+ 			debug_printf_eval("VAR\n");
+ 			L.v = op->l.v;
+diff --git a/testsuite/awk.tests b/testsuite/awk.tests
+index ddc5104..a78fdcd 100755
+--- a/testsuite/awk.tests
++++ b/testsuite/awk.tests
+@@ -540,4 +540,9 @@ testing 'awk assign while assign' \
+ │    trim/eff : 57.02%/26, 0.00%                     │          [cpu000:100%]
+ └────────────────────────────────────────────────────┘^C"
+ 
++testing "awk = has higher precedence than == (despite what gawk manpage claims)" \
++	"awk 'BEGIN { v=1; print 2==v; print 2==v=2; print v; print v=3==3; print v}'" \
++	'0\n1\n2\n1\n3\n' \
++	'' ''
++
+ exit $FAILCOUNT
diff --git a/meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-precedence-of.patch b/meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-precedence-of.patch
new file mode 100644
index 0000000000..ea3c84897b
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-precedence-of.patch
@@ -0,0 +1,96 @@
+From c3bfdac8e0e9a21d524ad72036953f68d2193e52 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Tue, 21 May 2024 14:46:08 +0200
+Subject: [PATCH 2/2] awk: fix ternary operator and precedence of =
+
+Adjust the = precedence test to match behavior of gawk, mawk and
+FreeBSD.  awk 'BEGIN {print v=3==3; print v}' should print two '1'.
+
+To fix this, and to unbreak the ternary conditional operator, we restore
+the precedence of = in the token list, but override this with a lower
+priority when the assignment is on the right side of a compare.
+
+This fixes commit 0256e00a9d07 (awk: fix precedence of = relative to ==) [1]
+
+CVE: CVE-2023-42364 CVE-2023-42365
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2024-May/090766.html]
+
+[1] https://bugs.busybox.net/show_bug.cgi?id=15871#c6
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+(cherry picked from commit 1714301c405ef03b39605c85c23f22a190cddd95)
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ editors/awk.c       | 18 ++++++++++++++----
+ testsuite/awk.tests |  9 +++++++--
+ 2 files changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index aff86fe..f320d8c 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -442,9 +442,10 @@ static const uint32_t tokeninfo[] ALIGN4 = {
+ #define TI_PREINC (OC_UNARY|xV|P(9)|'P')
+ #define TI_PREDEC (OC_UNARY|xV|P(9)|'M')
+ 	TI_PREINC,               TI_PREDEC,               OC_FIELD|xV|P(5),
+-	OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(38),        OC_REPLACE|NV|P(38)|'+', OC_REPLACE|NV|P(38)|'-',
+-	OC_REPLACE|NV|P(38)|'*', OC_REPLACE|NV|P(38)|'/', OC_REPLACE|NV|P(38)|'%', OC_REPLACE|NV|P(38)|'&',
+-	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(38)|'&', OC_BINARY|NV|P(15)|'&',
++#define TI_ASSIGN (OC_MOVE|VV|P(74))
++	OC_COMPARE|VV|P(39)|5,   TI_ASSIGN,               OC_REPLACE|NV|P(74)|'+', OC_REPLACE|NV|P(74)|'-',
++	OC_REPLACE|NV|P(74)|'*', OC_REPLACE|NV|P(74)|'/', OC_REPLACE|NV|P(74)|'%', OC_REPLACE|NV|P(74)|'&',
++	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(74)|'&', OC_BINARY|NV|P(15)|'&',
+ 	OC_BINARY|NV|P(25)|'/',  OC_BINARY|NV|P(25)|'%',  OC_BINARY|NV|P(15)|'&',  OC_BINARY|NV|P(25)|'*',
+ 	OC_COMPARE|VV|P(39)|4,   OC_COMPARE|VV|P(39)|3,   OC_COMPARE|VV|P(39)|0,   OC_COMPARE|VV|P(39)|1,
+ #define TI_LESS     (OC_COMPARE|VV|P(39)|2)
+@@ -1376,11 +1377,19 @@ static node *parse_expr(uint32_t term_tc)
+ 			continue;
+ 		}
+ 		if (tc & (TS_BINOP | TC_UOPPOST)) {
++			int prio;
+ 			debug_printf_parse("%s: TS_BINOP | TC_UOPPOST tc:%x\n", __func__, tc);
+ 			/* for binary and postfix-unary operators, jump back over
+ 			 * previous operators with higher priority */
+ 			vn = cn;
+-			while (((t_info & PRIMASK) > (vn->a.n->info & PRIMASK2))
++			/* Let assignment get higher priority when used on right
++			 * side in compare. i.e: 2==v=3 */
++			if (t_info == TI_ASSIGN && (vn->a.n->info & OPCLSMASK) == OC_COMPARE) {
++				prio = PRECEDENCE(38);
++			} else {
++				prio = (t_info & PRIMASK);
++			}
++			while ((prio > (vn->a.n->info & PRIMASK2))
+ 			    || (t_info == vn->info && t_info == TI_COLON)
+ 			) {
+ 				vn = vn->a.n;
+@@ -1412,6 +1421,7 @@ static node *parse_expr(uint32_t term_tc)
+ 					if ((vn->info & OPCLSMASK) != OC_VAR
+ 					 && (vn->info & OPCLSMASK) != OC_FNARG
+ 					 && (vn->info & OPCLSMASK) != OC_FIELD
++					 && (vn->info & OPCLSMASK) != OC_COMPARE
+ 					) {
+ 						syntax_error(EMSG_UNEXP_TOKEN); /* no. bad */
+ 					}
+diff --git a/testsuite/awk.tests b/testsuite/awk.tests
+index a78fdcd..d2706de 100755
+--- a/testsuite/awk.tests
++++ b/testsuite/awk.tests
+@@ -540,9 +540,14 @@ testing 'awk assign while assign' \
+ │    trim/eff : 57.02%/26, 0.00%                     │          [cpu000:100%]
+ └────────────────────────────────────────────────────┘^C"
+ 
+-testing "awk = has higher precedence than == (despite what gawk manpage claims)" \
++testing "awk = has higher precedence than == on right side" \
+ 	"awk 'BEGIN { v=1; print 2==v; print 2==v=2; print v; print v=3==3; print v}'" \
+-	'0\n1\n2\n1\n3\n' \
++	'0\n1\n2\n1\n1\n' \
++	'' ''
++
++testing 'awk ternary precedence' \
++	"awk 'BEGIN { a = 0 ? \"yes\": \"no\"; print a }'" \
++	'no\n' \
+ 	'' ''
+ 
+ exit $FAILCOUNT
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 170447743c..86dc9e86bf 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -53,6 +53,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2021-42380.patch \
            file://0001-awk-fix-segfault-when-compiled-by-clang.patch \
            file://CVE-2023-42363.patch \
+           file://0001-awk-fix-precedence-of-relative-to.patch \
+           file://0002-awk-fix-ternary-operator-and-precedence-of.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.34.1


