Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44E6C3DA49
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 08:22:21 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.88304.1722586941092454131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 01:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZCFuSnIe;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3686b554cfcso3973232f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 01:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722586939; x=1723191739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+TccI+YjlqB3JUJMTDIz41WIUnLb2AoXg6JGl1bFy0=;
        b=ZCFuSnIeHN4+2oVClv0qKUeiV5jG1mRBfcTv4+HtPIB8saeQgYD3K19BQFJwXA+XSD
         rNSIAV8+N6bJGSKX0tRha2gKxqj0qQoqhNxlawe4OM+kqa3L9OwqujxLt6Bsuo77aVNT
         989tuY3raAz6Iek2SvphUQVNFMFAN1kJwHbbxF9Rvl9penSLSf5lGiWiJCe9exgRlHU2
         xj82/WMnBh86XFz/Gd4YPQmoU3cCG5ICNb4SShCc+qvsBrwsOK6SNuI26bY94yDE7uM0
         MOCibnkuL5PJK7eo779Vt/5Ca9eKE768KFxAv3ioamHgWvUq/kp0JdTLoYsMCDiHHFzD
         I61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722586939; x=1723191739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+TccI+YjlqB3JUJMTDIz41WIUnLb2AoXg6JGl1bFy0=;
        b=wLfHgK/xWkdyiRfbex3j8eWLFfJ9KfnMieMsI6i1NQ0CJdNxSgTMK66/tU0206f7FT
         XY8rIAy0AbVq3LFX1W1AnVpWJX51C6WH7unuCuuUBqFQnVwAYYeLPpQ3rxslXlxw+orU
         RntiHWDLlulF+4w9AgmS2qBLtyTcn54dUeTHQ7AlqIDo7gZ+75LrkEAClhUkmNRnTCBo
         U9J65f4+wPrVroMtEENUvVUiNxJYaC5JrZagqxr0CyF6c721DD83VdRlRgVBYjGbp4ss
         ynK/tJ8eFadzrOzkNRvomBMBz62RCcZnI5wlK526boqJpagqaNtZ0lvE1LwHDD+XH1r6
         EVXA==
X-Gm-Message-State: AOJu0Yw598RFMe/Pj9uzEbKCKS7mvBQs6y0v1be+d1nIXrBypqsejX98
	s60SZf2g98wrh4ybzq3vLHjG4+VQefZIjjMSCwAaT6MOJou7oQ4G0DfeoN3X
X-Google-Smtp-Source: AGHT+IF6sggZWxRnzNwsnKfcsG9nekjkc1R+WHzGziU9vxA4QF/H8/tyX9iA4lfiSea2JzIKtCH1pQ==
X-Received: by 2002:a5d:6481:0:b0:367:96a8:d94b with SMTP id ffacd0b85a97d-36bbc1d225bmr1795750f8f.57.1722586938675;
        Fri, 02 Aug 2024 01:22:18 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd020c3bsm1330650f8f.49.2024.08.02.01.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 01:22:17 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [scarthgap][PATCH 1/2] busybox: CVE-2023-42364 and CVE-2023-42365 fixes
Date: Fri,  2 Aug 2024 08:21:47 +0000
Message-Id: <20240802082148.30512-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 08:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202889

From: Khem Raj <raj.khem@gmail.com>

backport upstream fix for CVEs and fix the regression that introduced [1]

[1] http://lists.busybox.net/pipermail/busybox/2024-May/090766.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
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


