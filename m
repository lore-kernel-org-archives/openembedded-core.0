Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDC1C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 07:21:17 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.27931.1723015268734838529
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 00:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=girDaYm7;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7b396521ff6so988378a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 00:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1723015268; x=1723620068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nBixwGH7zM6C6uccz+aG7yx0nxxAkR1vWt2ZSiPviIM=;
        b=girDaYm7xor5VZkw1Ih17OJAb/xkI1Yb5ybb4jsXTUFzUrgHGCnClg0tJ74fiIb5BJ
         T+IrVlNdHipUGCE9ykSkDy7HBSBzxXbWbmmev/ykTCSvGGaBb1rUfpUihub3CwQITxWP
         RNEOLfrhtr2XYBrEjqP0C8ZC7BtQP9ZJew7aU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723015268; x=1723620068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBixwGH7zM6C6uccz+aG7yx0nxxAkR1vWt2ZSiPviIM=;
        b=l5lvSHLAJajaAUtvAscYu/QgEKl/pdCQu9rr6EiCrDft8WRUngW2lApQX5rvprjWjN
         46yNtLUyel34J3A/6uFszqweRLBuTNLYjRy+Iu3TSgrkviRjtzUJBOBzHhgiRNhOeKOb
         6p0b0fo4DyMFSDDXcWRIs+9U4PsP0SvrauxiGp1x6nUYyYK59b/mD9Uih1a1fd1XS3NH
         iTaLpGxbLctpfzQTL/to1TRv8BZ+1pmUwMtK5ZN6/uEp5Etx2X2A/jtsmQokwlvgidqa
         5Kz53Z9yDDc4a4j0Z4X9i0Eh5wLAdHN+SvhnwZILWtxoc5gBfplmQWQhDs9BNSomKLLc
         gMsQ==
X-Gm-Message-State: AOJu0YwB0Dgrqwmm1UOq0v3QzRv04i0xqihaJH3zaJgTq4P5eWtByDy/
	rBOx+vTsJ3dlpjz6bXZ7mXOjpn6MtEvT105s+s4shgPggWyJGl4nNJ2scXop1z2Wc8WeANBADU9
	u
X-Google-Smtp-Source: AGHT+IH9TxTpxuRGXMq1et5Y2vhcSXueyhiCkV+lzLt3aFX1/TaFDPoGMaTAYMEsCLI9oLM2YpEpBg==
X-Received: by 2002:a05:6a20:7490:b0:1c4:88ce:c996 with SMTP id adf61e73a8af0-1c6996b933amr26486302637.46.1723015267623;
        Wed, 07 Aug 2024 00:21:07 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ecdff05sm8136416b3a.140.2024.08.07.00.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 00:21:06 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] busybox: CVE-2023-42364, CVE-2023-42365 & CVE-2023-42366 fixes
Date: Wed,  7 Aug 2024 12:50:49 +0530
Message-Id: <20240807072049.229288-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 07:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203060

backport upstream fix for CVEs and fix the regression that introduced [1]

[1] http://lists.busybox.net/pipermail/busybox/2024-May/090766.html

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 ...01-awk-fix-precedence-of-relative-to.patch | 197 ++++++++++++++++++
 ...1-awk.c-fix-CVE-2023-42366-bug-15874.patch |  36 ++++
 ...x-ternary-operator-and-precedence-of.patch |  96 +++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   3 +
 4 files changed, 332 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative-to.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-precedence-of.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative-to.patch b/meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative-to.patch
new file mode 100644
index 0000000000..e3d623498c
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
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4]
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit 0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4)
+
+CVE: CVE-2023-42364 & CVE-2023-42365
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
diff --git a/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch b/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch
new file mode 100644
index 0000000000..d660768e2f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch
@@ -0,0 +1,36 @@
+From 8542236894a8d5f7393327117bc7f64787444efc Mon Sep 17 00:00:00 2001
+From: Valery Ushakov <uwe@stderr.spb.ru>
+Date: Wed, 24 Jan 2024 22:24:41 +0300
+Subject: [PATCH] awk.c: fix CVE-2023-42366 (bug #15874)
+
+Make sure we don't read past the end of the string in next_token()
+when backslash is the last character in an (invalid) regexp.
+a fix and issue reported in bugzilla
+
+https://bugs.busybox.net/show_bug.cgi?id=15874
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2024-May/090766.html]
+CVE: CVE-2023-42366
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ editors/awk.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index f320d8c..a53b193 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -1168,9 +1168,11 @@ static uint32_t next_token(uint32_t expected)
+ 					s[-1] = bb_process_escape_sequence((const char **)&pp);
+ 					if (*p == '\\')
+ 						*s++ = '\\';
+-					if (pp == p)
++					if (pp == p) {
++						if (*p == '\0')
++							syntax_error(EMSG_UNEXP_EOS);
+ 						*s++ = *p++;
+-					else
++					} else
+ 						p = pp;
+ 				}
+ 			}
diff --git a/meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-precedence-of.patch b/meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-precedence-of.patch
new file mode 100644
index 0000000000..2d11efb1cf
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
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2024-May/090766.html]
+
+[1] https://bugs.busybox.net/show_bug.cgi?id=15871#c6
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+(cherry picked from commit 1714301c405ef03b39605c85c23f22a190cddd95)
+
+CVE: CVE-2023-42364 & CVE-2023-42365
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index 1c7fe2f43e..ead931bc41 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -54,6 +54,9 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
 	   file://CVE-2022-48174.patch \
            file://CVE-2021-42380.patch \
            file://CVE-2023-42363.patch \
+           file://0001-awk-fix-precedence-of-relative-to.patch \
+           file://0002-awk-fix-ternary-operator-and-precedence-of.patch \
+           file://0001-awk.c-fix-CVE-2023-42366-bug-15874.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.25.1


