Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9572ACFD312
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 09:49:19 +0000 (UTC)
Received: from h4.cmg1.smtp.forpsi.com (h4.cmg1.smtp.forpsi.com [185.129.138.163])
 by mx.groups.io with SMTP id smtpd.web10.7943.1728640148994096885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 02:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=Q6e6Wv0D;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.163, mailfrom: andrej.v@skyrain.eu)
Received: from lt-aval.. ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id zCGHsBivxeqGtzCGgs69OJ; Fri, 11 Oct 2024 11:49:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1728640147; bh=XdpjwzPGQSC4p+9VOzV1KtNNV1PFubLz+bt1OfMfkkw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=Q6e6Wv0D8ToMeNoXevucPkKbR2XAE3n4c5giskqSm/rDNWBIGjRB07hyGkFRpZvyo
	 6YymXYDLNZ7/0D0rPWNCtN42T1/jPg49sCw1hOEjUia1Uut28uN96d1QEfCTKdDR72
	 VZKb3CbpgtnUYBoSRnr4rMWTmMOZuTOBTvgA9pJW+ixldWiSArTB50XGXpjHZNbKyv
	 MzUtOmZl8zoxd1MzYvpX4pYFWavAJunOo5f2lnkVq5gHgDA6C50kHuBto7K+8nsRe5
	 Fl++IQHLB3T9ovEdGOuRVhE82xWqwowhxNLHqrac67a5BmzaihVIrjdxhREAfRoyFh
	 9K0jIa5KOXtZA==
From: Andrej Valek <andrej.v@skyrain.eu>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.v@skyrain.eu>
Subject: [OE-core][PATCH] busybox: 1.36.1 -> 1.37.0
Date: Fri, 11 Oct 2024 11:48:30 +0200
Message-Id: <20241011094830.1009557-1-andrej.v@skyrain.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CMAE-Envelope: MS4xfFziLchUOM+5XizlS19YbueV3pu2dT6OAQahRm4mLCWbR8DzcYcS/R5oTe0qfUIfGHN51UnvxHi52Ya2ITF53+DfvMc2a/RT4RrIuCIT16XtSc31LuVS
 tSC64qD2a4EvR15nH1xNiPivvvc2FQJ1QBUeR+Ldx9F3mpD+u9Gg2aw4Yo/D1xRMTB9j9wHaDAbdvts5m/V71YP5dyErlp04gvXI3LqyJb/Cd2KDV9hr+dxt
 jpm4/frQqZc3KZ6ueCEjrw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 09:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205667

- update to next stable version 1.37.0
 - refresh defconfig
   - disable new applets (ip_link_can)
   - enable new applets (time64, find_exec_ok, getfattr, udhcpd_bootp)
 - remove and refresh already merged patches

Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
---
 ...ab_1.36.1.bb =3D> busybox-inittab_1.37.0.bb} |   0
 ...01-awk-fix-precedence-of-relative-to.patch | 197 ------------------
 ...-fix-segfault-when-compiled-by-clang.patch |  41 ----
 ...1-awk.c-fix-CVE-2023-42366-bug-15874.patch |  37 ----
 ...x-ternary-operator-and-precedence-of.patch |  96 ---------
 .../busybox/busybox/CVE-2021-42380.patch      | 151 --------------
 .../busybox/busybox/CVE-2023-42363.patch      |  67 ------
 meta/recipes-core/busybox/busybox/defconfig   |   8 +-
 .../{busybox_1.36.1.bb =3D> busybox_1.37.0.bb}  |   8 +-
 9 files changed, 7 insertions(+), 598 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.36.1.bb =3D> busybox-i=
nittab_1.37.0.bb} (100%)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-preceden=
ce-of-relative-to.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-segfault=
-when-compiled-by-clang.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-20=
23-42366-bug-15874.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-=
operator-and-precedence-of.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42380.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
 rename meta/recipes-core/busybox/{busybox_1.36.1.bb =3D> busybox_1.37.0.bb=
} (84%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb b/meta/rec=
ipes-core/busybox/busybox-inittab_1.37.0.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.37.0.bb
diff --git a/meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-r=
elative-to.patch b/meta/recipes-core/busybox/busybox/0001-awk-fix-precedenc=
e-of-relative-to.patch
deleted file mode 100644
index 5836cf8a003..00000000000
--- a/meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative=
-to.patch
+++ /dev/null
@@ -1,197 +0,0 @@
-From dedc9380c76834ba64c8b526aef6f461ea4e7f2e Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Tue, 30 May 2023 16:42:18 +0200
-Subject: [PATCH 1/2] awk: fix precedence of =3D relative to =3D=3D
-
-Discovered while adding code to disallow assignments to non-lvalues
-
-function                                             old     new   delta
-parse_expr                                           936     991     +55
-.rodata                                           105243  105247      +4
---------------------------------------------------------------------------=
----
-(add/remove: 0/0 grow/shrink: 2/0 up/down: 59/0)               Total: 59 b=
ytes
-
-CVE: CVE-2023-42364 CVE-2023-42365
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D02=
56e00a9d077588bd3a39f5a1ef7e2eaa2911e4]
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-(cherry picked from commit 0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4)
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- editors/awk.c       | 66 ++++++++++++++++++++++++++++++---------------
- testsuite/awk.tests |  5 ++++
- 2 files changed, 50 insertions(+), 21 deletions(-)
-
-diff --git a/editors/awk.c b/editors/awk.c
-index ec9301e..aff86fe 100644
---- a/editors/awk.c
-+++ b/editors/awk.c
-@@ -337,7 +337,9 @@ static void debug_parse_print_tc(uint32_t n)
- #undef P
- #undef PRIMASK
- #undef PRIMASK2
--#define P(x)      (x << 24)
-+/* Smaller 'x' means _higher_ operator precedence */
-+#define PRECEDENCE(x) (x << 24)
-+#define P(x)      PRECEDENCE(x)
- #define PRIMASK   0x7F000000
- #define PRIMASK2  0x7E000000
-=20
-@@ -360,7 +362,7 @@ enum {
- 	OC_MOVE =3D 0x1f00,       OC_PGETLINE =3D 0x2000,   OC_REGEXP =3D 0x2100,
- 	OC_REPLACE =3D 0x2200,    OC_RETURN =3D 0x2300,     OC_SPRINTF =3D 0x240=
0,
- 	OC_TERNARY =3D 0x2500,    OC_UNARY =3D 0x2600,      OC_VAR =3D 0x2700,
--	OC_DONE =3D 0x2800,
-+	OC_CONST =3D 0x2800,      OC_DONE =3D 0x2900,
-=20
- 	ST_IF =3D 0x3000,         ST_DO =3D 0x3100,         ST_FOR =3D 0x3200,
- 	ST_WHILE =3D 0x3300
-@@ -440,9 +442,9 @@ static const uint32_t tokeninfo[] ALIGN4 =3D {
- #define TI_PREINC (OC_UNARY|xV|P(9)|'P')
- #define TI_PREDEC (OC_UNARY|xV|P(9)|'M')
- 	TI_PREINC,               TI_PREDEC,               OC_FIELD|xV|P(5),
--	OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(74),        OC_REPLACE|NV|P(74)|'+=
', OC_REPLACE|NV|P(74)|'-',
--	OC_REPLACE|NV|P(74)|'*', OC_REPLACE|NV|P(74)|'/', OC_REPLACE|NV|P(74)|'%=
', OC_REPLACE|NV|P(74)|'&',
--	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(74)|'&=
', OC_BINARY|NV|P(15)|'&',
-+	OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(38),        OC_REPLACE|NV|P(38)|'+=
', OC_REPLACE|NV|P(38)|'-',
-+	OC_REPLACE|NV|P(38)|'*', OC_REPLACE|NV|P(38)|'/', OC_REPLACE|NV|P(38)|'%=
', OC_REPLACE|NV|P(38)|'&',
-+	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(38)|'&=
', OC_BINARY|NV|P(15)|'&',
- 	OC_BINARY|NV|P(25)|'/',  OC_BINARY|NV|P(25)|'%',  OC_BINARY|NV|P(15)|'&'=
,  OC_BINARY|NV|P(25)|'*',
- 	OC_COMPARE|VV|P(39)|4,   OC_COMPARE|VV|P(39)|3,   OC_COMPARE|VV|P(39)|0,=
   OC_COMPARE|VV|P(39)|1,
- #define TI_LESS     (OC_COMPARE|VV|P(39)|2)
-@@ -1290,7 +1292,7 @@ static uint32_t next_token(uint32_t expected)
- 			save_tclass =3D tc;
- 			save_info =3D t_info;
- 			tc =3D TC_BINOPX;
--			t_info =3D OC_CONCAT | SS | P(35);
-+			t_info =3D OC_CONCAT | SS | PRECEDENCE(35);
- 		}
-=20
- 		t_tclass =3D tc;
-@@ -1350,9 +1352,8 @@ static node *parse_expr(uint32_t term_tc)
- {
- 	node sn;
- 	node *cn =3D &sn;
--	node *vn, *glptr;
-+	node *glptr;
- 	uint32_t tc, expected_tc;
--	var *v;
-=20
- 	debug_printf_parse("%s() term_tc(%x):", __func__, term_tc);
- 	debug_parse_print_tc(term_tc);
-@@ -1363,11 +1364,12 @@ static node *parse_expr(uint32_t term_tc)
- 	expected_tc =3D TS_OPERAND | TS_UOPPRE | TC_REGEXP | term_tc;
-=20
- 	while (!((tc =3D next_token(expected_tc)) & term_tc)) {
-+		node *vn;
-=20
- 		if (glptr && (t_info =3D=3D TI_LESS)) {
- 			/* input redirection (<) attached to glptr node */
- 			debug_printf_parse("%s: input redir\n", __func__);
--			cn =3D glptr->l.n =3D new_node(OC_CONCAT | SS | P(37));
-+			cn =3D glptr->l.n =3D new_node(OC_CONCAT | SS | PRECEDENCE(37));
- 			cn->a.n =3D glptr;
- 			expected_tc =3D TS_OPERAND | TS_UOPPRE;
- 			glptr =3D NULL;
-@@ -1379,24 +1381,42 @@ static node *parse_expr(uint32_t term_tc)
- 			 * previous operators with higher priority */
- 			vn =3D cn;
- 			while (((t_info & PRIMASK) > (vn->a.n->info & PRIMASK2))
--			    || ((t_info =3D=3D vn->info) && t_info =3D=3D TI_COLON)
-+			    || (t_info =3D=3D vn->info && t_info =3D=3D TI_COLON)
- 			) {
- 				vn =3D vn->a.n;
- 				if (!vn->a.n) syntax_error(EMSG_UNEXP_TOKEN);
- 			}
- 			if (t_info =3D=3D TI_TERNARY)
- //TODO: why?
--				t_info +=3D P(6);
-+				t_info +=3D PRECEDENCE(6);
- 			cn =3D vn->a.n->r.n =3D new_node(t_info);
- 			cn->a.n =3D vn->a.n;
- 			if (tc & TS_BINOP) {
- 				cn->l.n =3D vn;
--//FIXME: this is the place to detect and reject assignments to non-lvalue=
s.
--//Currently we allow "assignments" to consts and temporaries, nonsense li=
ke this:
--// awk 'BEGIN { "qwe" =3D 1 }'
--// awk 'BEGIN { 7 *=3D 7 }'
--// awk 'BEGIN { length("qwe") =3D 1 }'
--// awk 'BEGIN { (1+1) +=3D 3 }'
-+
-+				/* Prevent:
-+				 * awk 'BEGIN { "qwe" =3D 1 }'
-+				 * awk 'BEGIN { 7 *=3D 7 }'
-+				 * awk 'BEGIN { length("qwe") =3D 1 }'
-+				 * awk 'BEGIN { (1+1) +=3D 3 }'
-+				 */
-+				/* Assignment? (including *=3D and friends) */
-+				if (((t_info & OPCLSMASK) =3D=3D OC_MOVE)
-+				 || ((t_info & OPCLSMASK) =3D=3D OC_REPLACE)
-+				) {
-+					debug_printf_parse("%s: MOVE/REPLACE vn->info:%08x\n", __func__, vn-=
>info);
-+					/* Left side is a (variable or array element)
-+					 * or function argument
-+					 * or $FIELD ?
-+					 */
-+					if ((vn->info & OPCLSMASK) !=3D OC_VAR
-+					 && (vn->info & OPCLSMASK) !=3D OC_FNARG
-+					 && (vn->info & OPCLSMASK) !=3D OC_FIELD
-+					) {
-+						syntax_error(EMSG_UNEXP_TOKEN); /* no. bad */
-+					}
-+				}
-+
- 				expected_tc =3D TS_OPERAND | TS_UOPPRE | TC_REGEXP;
- 				if (t_info =3D=3D TI_PGETLINE) {
- 					/* it's a pipe */
-@@ -1432,6 +1452,8 @@ static node *parse_expr(uint32_t term_tc)
- 		/* one should be very careful with switch on tclass -
- 		 * only simple tclasses should be used (TC_xyz, not TS_xyz) */
- 		switch (tc) {
-+			var *v;
-+
- 		case TC_VARIABLE:
- 		case TC_ARRAY:
- 			debug_printf_parse("%s: TC_VARIABLE | TC_ARRAY\n", __func__);
-@@ -1452,14 +1474,14 @@ static node *parse_expr(uint32_t term_tc)
- 		case TC_NUMBER:
- 		case TC_STRING:
- 			debug_printf_parse("%s: TC_NUMBER | TC_STRING\n", __func__);
--			cn->info =3D OC_VAR;
-+			cn->info =3D OC_CONST;
- 			v =3D cn->l.v =3D xzalloc(sizeof(var));
--			if (tc & TC_NUMBER)
-+			if (tc & TC_NUMBER) {
- 				setvar_i(v, t_double);
--			else {
-+			 } else {
- 				setvar_s(v, t_string);
--				expected_tc &=3D ~TC_UOPPOST; /* "str"++ is not allowed */
- 			}
-+			expected_tc &=3D ~TC_UOPPOST; /* NUM++, "str"++ not allowed */
- 			break;
-=20
- 		case TC_REGEXP:
-@@ -3107,6 +3129,8 @@ static var *evaluate(node *op, var *res)
-=20
- 		/* -- recursive node type -- */
-=20
-+		case XC( OC_CONST ):
-+			debug_printf_eval("CONST ");
- 		case XC( OC_VAR ):
- 			debug_printf_eval("VAR\n");
- 			L.v =3D op->l.v;
-diff --git a/testsuite/awk.tests b/testsuite/awk.tests
-index ddc5104..a78fdcd 100755
---- a/testsuite/awk.tests
-+++ b/testsuite/awk.tests
-@@ -540,4 +540,9 @@ testing 'awk assign while assign' \
- =E2=94=82    trim/eff : 57.02%/26, 0.00%                     =E2=94=82   =
       [cpu000:100%]
- =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98^C"
-=20
-+testing "awk =3D has higher precedence than =3D=3D (despite what gawk man=
page claims)" \
-+	"awk 'BEGIN { v=3D1; print 2=3D=3Dv; print 2=3D=3Dv=3D2; print v; print =
v=3D3=3D=3D3; print v}'" \
-+	'0\n1\n2\n1\n3\n' \
-+	'' ''
-+
- exit $FAILCOUNT
diff --git a/meta/recipes-core/busybox/busybox/0001-awk-fix-segfault-when-c=
ompiled-by-clang.patch b/meta/recipes-core/busybox/busybox/0001-awk-fix-seg=
fault-when-compiled-by-clang.patch
deleted file mode 100644
index 3f6145b250a..00000000000
--- a/meta/recipes-core/busybox/busybox/0001-awk-fix-segfault-when-compiled=
-by-clang.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From e1a68741067167dc4837e0a26d3d5c318a631fc7 Mon Sep 17 00:00:00 2001
-From: Ron Yorston <rmy@pobox.com>
-Date: Fri, 19 Jan 2024 15:41:17 +0000
-Subject: [PATCH] awk: fix segfault when compiled by clang
-
-A 32-bit build of BusyBox using clang segfaulted in the test
-"awk assign while assign".  Specifically, on line 7 of the test
-input where the adjustment of the L.v pointer when the Fields
-array was reallocated
-
-   	L.v +=3D Fields - old_Fields_ptr;
-
-was out by 4 bytes.
-
-Rearrange to code so both gcc and clang generate code that works.
-
-Signed-off-by: Ron Yorston <rmy@pobox.com>
-Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D5d=
cc443dba039b305a510c01883e9f34e42656ae]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- editors/awk.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/editors/awk.c b/editors/awk.c
-index aa485c782..0981c6735 100644
---- a/editors/awk.c
-+++ b/editors/awk.c
-@@ -2935,7 +2935,7 @@ static var *evaluate(node *op, var *res)
- 			if (old_Fields_ptr) {
- 				//if (old_Fields_ptr !=3D Fields)
- 				//	debug_printf_eval("L.v moved\n");
--				L.v +=3D Fields - old_Fields_ptr;
-+				L.v =3D Fields + (L.v - old_Fields_ptr);
- 			}
- 			if (opinfo & OF_STR2) {
- 				R.s =3D getvar_s(R.v);
---=20
-2.30.2
-
diff --git a/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-4236=
6-bug-15874.patch b/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-20=
23-42366-bug-15874.patch
deleted file mode 100644
index 282c2fde5a5..00000000000
--- a/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-1=
5874.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8542236894a8d5f7393327117bc7f64787444efc Mon Sep 17 00:00:00 2001
-From: Valery Ushakov <uwe@stderr.spb.ru>
-Date: Wed, 24 Jan 2024 22:24:41 +0300
-Subject: [PATCH] awk.c: fix CVE-2023-42366 (bug #15874)
-
-Make sure we don't read past the end of the string in next_token()
-when backslash is the last character in an (invalid) regexp.
-a fix and issue reported in bugzilla
-
-https://bugs.busybox.net/show_bug.cgi?id=3D15874
-
-Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/202=
4-May/090766.html]
-
-CVE: CVE-2023-42366
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- editors/awk.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/editors/awk.c b/editors/awk.c
-index f320d8c..a53b193 100644
---- a/editors/awk.c
-+++ b/editors/awk.c
-@@ -1168,9 +1168,11 @@ static uint32_t next_token(uint32_t expected)
- 					s[-1] =3D bb_process_escape_sequence((const char **)&pp);
- 					if (*p =3D=3D '\\')
- 						*s++ =3D '\\';
--					if (pp =3D=3D p)
-+					if (pp =3D=3D p) {
-+						if (*p =3D=3D '\0')
-+							syntax_error(EMSG_UNEXP_EOS);
- 						*s++ =3D *p++;
--					else
-+					} else
- 						p =3D pp;
- 				}
- 			}
diff --git a/meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operato=
r-and-precedence-of.patch b/meta/recipes-core/busybox/busybox/0002-awk-fix-=
ternary-operator-and-precedence-of.patch
deleted file mode 100644
index ea3c84897b9..00000000000
--- a/meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-p=
recedence-of.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From c3bfdac8e0e9a21d524ad72036953f68d2193e52 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Tue, 21 May 2024 14:46:08 +0200
-Subject: [PATCH 2/2] awk: fix ternary operator and precedence of =3D
-
-Adjust the =3D precedence test to match behavior of gawk, mawk and
-FreeBSD.  awk 'BEGIN {print v=3D3=3D=3D3; print v}' should print two '1'.
-
-To fix this, and to unbreak the ternary conditional operator, we restore
-the precedence of =3D in the token list, but override this with a lower
-priority when the assignment is on the right side of a compare.
-
-This fixes commit 0256e00a9d07 (awk: fix precedence of =3D relative to =3D=
=3D) [1]
-
-CVE: CVE-2023-42364 CVE-2023-42365
-
-Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/202=
4-May/090766.html]
-
-[1] https://bugs.busybox.net/show_bug.cgi?id=3D15871#c6
-
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
-(cherry picked from commit 1714301c405ef03b39605c85c23f22a190cddd95)
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- editors/awk.c       | 18 ++++++++++++++----
- testsuite/awk.tests |  9 +++++++--
- 2 files changed, 21 insertions(+), 6 deletions(-)
-
-diff --git a/editors/awk.c b/editors/awk.c
-index aff86fe..f320d8c 100644
---- a/editors/awk.c
-+++ b/editors/awk.c
-@@ -442,9 +442,10 @@ static const uint32_t tokeninfo[] ALIGN4 =3D {
- #define TI_PREINC (OC_UNARY|xV|P(9)|'P')
- #define TI_PREDEC (OC_UNARY|xV|P(9)|'M')
- 	TI_PREINC,               TI_PREDEC,               OC_FIELD|xV|P(5),
--	OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(38),        OC_REPLACE|NV|P(38)|'+=
', OC_REPLACE|NV|P(38)|'-',
--	OC_REPLACE|NV|P(38)|'*', OC_REPLACE|NV|P(38)|'/', OC_REPLACE|NV|P(38)|'%=
', OC_REPLACE|NV|P(38)|'&',
--	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(38)|'&=
', OC_BINARY|NV|P(15)|'&',
-+#define TI_ASSIGN (OC_MOVE|VV|P(74))
-+	OC_COMPARE|VV|P(39)|5,   TI_ASSIGN,               OC_REPLACE|NV|P(74)|'+=
', OC_REPLACE|NV|P(74)|'-',
-+	OC_REPLACE|NV|P(74)|'*', OC_REPLACE|NV|P(74)|'/', OC_REPLACE|NV|P(74)|'%=
', OC_REPLACE|NV|P(74)|'&',
-+	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(74)|'&=
', OC_BINARY|NV|P(15)|'&',
- 	OC_BINARY|NV|P(25)|'/',  OC_BINARY|NV|P(25)|'%',  OC_BINARY|NV|P(15)|'&'=
,  OC_BINARY|NV|P(25)|'*',
- 	OC_COMPARE|VV|P(39)|4,   OC_COMPARE|VV|P(39)|3,   OC_COMPARE|VV|P(39)|0,=
   OC_COMPARE|VV|P(39)|1,
- #define TI_LESS     (OC_COMPARE|VV|P(39)|2)
-@@ -1376,11 +1377,19 @@ static node *parse_expr(uint32_t term_tc)
- 			continue;
- 		}
- 		if (tc & (TS_BINOP | TC_UOPPOST)) {
-+			int prio;
- 			debug_printf_parse("%s: TS_BINOP | TC_UOPPOST tc:%x\n", __func__, tc);
- 			/* for binary and postfix-unary operators, jump back over
- 			 * previous operators with higher priority */
- 			vn =3D cn;
--			while (((t_info & PRIMASK) > (vn->a.n->info & PRIMASK2))
-+			/* Let assignment get higher priority when used on right
-+			 * side in compare. i.e: 2=3D=3Dv=3D3 */
-+			if (t_info =3D=3D TI_ASSIGN && (vn->a.n->info & OPCLSMASK) =3D=3D OC_C=
OMPARE) {
-+				prio =3D PRECEDENCE(38);
-+			} else {
-+				prio =3D (t_info & PRIMASK);
-+			}
-+			while ((prio > (vn->a.n->info & PRIMASK2))
- 			    || (t_info =3D=3D vn->info && t_info =3D=3D TI_COLON)
- 			) {
- 				vn =3D vn->a.n;
-@@ -1412,6 +1421,7 @@ static node *parse_expr(uint32_t term_tc)
- 					if ((vn->info & OPCLSMASK) !=3D OC_VAR
- 					 && (vn->info & OPCLSMASK) !=3D OC_FNARG
- 					 && (vn->info & OPCLSMASK) !=3D OC_FIELD
-+					 && (vn->info & OPCLSMASK) !=3D OC_COMPARE
- 					) {
- 						syntax_error(EMSG_UNEXP_TOKEN); /* no. bad */
- 					}
-diff --git a/testsuite/awk.tests b/testsuite/awk.tests
-index a78fdcd..d2706de 100755
---- a/testsuite/awk.tests
-+++ b/testsuite/awk.tests
-@@ -540,9 +540,14 @@ testing 'awk assign while assign' \
- =E2=94=82    trim/eff : 57.02%/26, 0.00%                     =E2=94=82   =
       [cpu000:100%]
- =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98^C"
-=20
--testing "awk =3D has higher precedence than =3D=3D (despite what gawk man=
page claims)" \
-+testing "awk =3D has higher precedence than =3D=3D on right side" \
- 	"awk 'BEGIN { v=3D1; print 2=3D=3Dv; print 2=3D=3Dv=3D2; print v; print =
v=3D3=3D=3D3; print v}'" \
--	'0\n1\n2\n1\n3\n' \
-+	'0\n1\n2\n1\n1\n' \
-+	'' ''
-+
-+testing 'awk ternary precedence' \
-+	"awk 'BEGIN { a =3D 0 ? \"yes\": \"no\"; print a }'" \
-+	'no\n' \
- 	'' ''
-=20
- exit $FAILCOUNT
diff --git a/meta/recipes-core/busybox/busybox/CVE-2021-42380.patch b/meta/=
recipes-core/busybox/busybox/CVE-2021-42380.patch
deleted file mode 100644
index 3baef86415b..00000000000
--- a/meta/recipes-core/busybox/busybox/CVE-2021-42380.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 5dcc443dba039b305a510c01883e9f34e42656ae Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Fri, 26 May 2023 19:36:58 +0200
-Subject: [PATCH] awk: fix use-after-realloc (CVE-2021-42380), closes 15601
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-CVE: CVE-2021-42380
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D5d=
cc443dba039b305a510c01883e9f34e42656ae]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- editors/awk.c       | 26 ++++++++++++++++-----
- testsuite/awk.tests | 55 +++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 75 insertions(+), 6 deletions(-)
-
-diff --git a/editors/awk.c b/editors/awk.c
-index 728ee8685..2af823808 100644
---- a/editors/awk.c
-+++ b/editors/awk.c
-@@ -555,7 +555,7 @@ struct globals {
- 	const char *g_progname;
- 	int g_lineno;
- 	int nfields;
--	int maxfields; /* used in fsrealloc() only */
-+	unsigned maxfields;
- 	var *Fields;
- 	char *g_pos;
- 	char g_saved_ch;
-@@ -1931,9 +1931,9 @@ static void fsrealloc(int size)
- {
- 	int i, newsize;
-=20
--	if (size >=3D maxfields) {
--		/* Sanity cap, easier than catering for overflows */
--		if (size > 0xffffff)
-+	if ((unsigned)size >=3D maxfields) {
-+		/* Sanity cap, easier than catering for over/underflows */
-+		if ((unsigned)size > 0xffffff)
- 			bb_die_memory_exhausted();
-=20
- 		i =3D maxfields;
-@@ -2891,6 +2891,7 @@ static var *evaluate(node *op, var *res)
- 		uint32_t opinfo;
- 		int opn;
- 		node *op1;
-+		var *old_Fields_ptr;
-=20
- 		opinfo =3D op->info;
- 		opn =3D (opinfo & OPNMASK);
-@@ -2899,10 +2900,16 @@ static var *evaluate(node *op, var *res)
- 		debug_printf_eval("opinfo:%08x opn:%08x\n", opinfo, opn);
-=20
- 		/* execute inevitable things */
-+		old_Fields_ptr =3D NULL;
- 		if (opinfo & OF_RES1) {
- 			if ((opinfo & OF_REQUIRED) && !op1)
- 				syntax_error(EMSG_TOO_FEW_ARGS);
- 			L.v =3D evaluate(op1, TMPVAR0);
-+			/* Does L.v point to $n variable? */
-+			if ((size_t)(L.v - Fields) < maxfields) {
-+				/* yes, remember where Fields[] is */
-+				old_Fields_ptr =3D Fields;
-+			}
- 			if (opinfo & OF_STR1) {
- 				L.s =3D getvar_s(L.v);
- 				debug_printf_eval("L.s:'%s'\n", L.s);
-@@ -2921,8 +2928,15 @@ static var *evaluate(node *op, var *res)
- 		 */
- 		if (opinfo & OF_RES2) {
- 			R.v =3D evaluate(op->r.n, TMPVAR1);
--			//TODO: L.v may be invalid now, set L.v to NULL to catch bugs?
--			//L.v =3D NULL;
-+			/* Seen in $5=3D$$5=3D$0:
-+			 * Evaluation of R.v ($$5=3D$0 expression)
-+			 * made L.v ($5) invalid. It's detected here.
-+			 */
-+			if (old_Fields_ptr) {
-+				//if (old_Fields_ptr !=3D Fields)
-+				//	debug_printf_eval("L.v moved\n");
-+				L.v +=3D Fields - old_Fields_ptr;
-+			}
- 			if (opinfo & OF_STR2) {
- 				R.s =3D getvar_s(R.v);
- 				debug_printf_eval("R.s:'%s'\n", R.s);
-diff --git a/testsuite/awk.tests b/testsuite/awk.tests
-index bbf0fbff1..ddc51047b 100755
---- a/testsuite/awk.tests
-+++ b/testsuite/awk.tests
-@@ -485,4 +485,59 @@ testing 'awk assign while test' \
- 	"" \
- 	"foo"
-=20
-+# User-supplied bug (SEGV) example, was causing use-after-realloc
-+testing 'awk assign while assign' \
-+	"awk '\$5=3D\$\$5=3D\$0'; echo \$?" \
-+	"\
-+=E2=94=80 process timing =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80 =E2=
=94=80 process timing =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80 overall =
results =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90 results =E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=90
-+=E2=94=82 run time : =E2=94=82        run time : 0 days, 0 hrs, 0 min, 56=
 sec      =E2=94=82  cycles done : 0     =E2=94=82 days, 0 hrs, 0 min, 56 s=
ec =E2=94=82 cycles done : 0 =E2=94=82
-+=E2=94=82 last new find =E2=94=82   last new find : 0 days, 0 hrs, 0 min,=
 1 sec       =E2=94=82 corpus count : 208   =E2=94=82 0 days, 0 hrs, 0 min,=
 1 sec =E2=94=82 corpus count : 208 =E2=94=82
-+=E2=94=82last saved crash : =E2=94=82last saved crash : none seen yet    =
                 =E2=94=82saved crashes : 0     =E2=94=82 seen yet =E2=94=
=82saved crashes : 0 =E2=94=82
-+=E2=94=82 last saved hang =E2=94=82 last saved hang : none seen yet      =
               =E2=94=82  saved hangs : 0     =E2=94=82 none seen yet =E2=
=94=82 saved hangs : 0 =E2=94=82
-+=E2=94=9C=E2=94=80 cycle progress =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=AC=E2=94=80 =E2=94=9C=E2=94=80 cycle progress =E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=AC=E2=94=80 map coverage=E2=94=B4=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4 coverage=E2=94=B4=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
-+=E2=94=82 now processing : =E2=94=82  now processing : 184.1 (88.5%)     =
 =E2=94=82    map density : 0.30% / 0.52%      =E2=94=82 (88.5%) =E2=94=82 =
map density : 0.30% / 0.52% =E2=94=82                                      =
                                                                           =
                                                         =E2=94=82  now pro=
cessing : 184.1 (88.5%)      =E2=94=82    map density : 0.30% / 0.52%      =
=E2=94=82
-+=E2=94=82 runs timed out =E2=94=82  runs timed out : 0 (0.00%)          =
=E2=94=82 count coverage : 2.18 bits/tuple    =E2=94=82 0 (0.00%) =E2=94=82=
 count coverage : 2.18 bits/tuple =E2=94=82
-+=E2=94=9C=E2=94=80 stage progress =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=BC=E2=94=80 =E2=94=9C=E2=94=80 stage progress =E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80 findings in depth =E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4 in de=
pth =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=A4
-+=E2=94=82 now trying : =E2=94=82  now trying : havoc                  =E2=
=94=82 favored items : 43 (20.67%)         =E2=94=82 =E2=94=82 favored item=
s : 43 (20.67%) =E2=94=82
-+=E2=94=82 stage execs : =E2=94=82 stage execs : 11.2k/131k (8.51%)     =
=E2=94=82  new edges on : 52 (25.00%)         =E2=94=82 (8.51%) =E2=94=82 n=
ew edges on =E2=94=82 stage execs : 11.2k/131k (8.51%)     =E2=94=82  new e=
dges on : 52 (25.00%)         =E2=94=82 52 (25.00%) =E2=94=82
-+=E2=94=82 total execs : =E2=94=82 total execs : 179k                   =
=E2=94=82 total crashes : 0 (0 saved)         =E2=94=82 =E2=94=82 total cra=
shes : 0 (0 saved) =E2=94=82                                               =
                                                                           =
                                            =E2=94=82 total execs : 179k   =
                =E2=94=82 total crashes : 0 (0 saved)         =E2=94=82
-+=E2=94=82 exec speed : =E2=94=82  exec speed : 3143/sec               =E2=
=94=82  total tmouts : 0 (0 saved)         =E2=94=82 =E2=94=82 total tmouts=
 : 0 (0 saved) =E2=94=82                                                   =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
    =E2=94=82  exec speed : 3143/sec               =E2=94=82  total tmouts =
: 0 (0 saved)         =E2=94=82
-+=E2=94=9C=E2=94=80 fuzzing strategy yields =E2=94=9C=E2=94=80 fuzzing str=
ategy yields =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80 item geometry =E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4 item geometry =E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
-+=E2=94=82 bit flips : =E2=94=82   bit flips : 11/648, 4/638, 5/618       =
          =E2=94=82    levels : 4         =E2=94=82 4/638, 5/618 =E2=94=82 =
levels : =E2=94=82   bit flips : 11/648, 4/638, 5/618                 =E2=
=94=82    levels : 4         =E2=94=82 =E2=94=82
-+=E2=94=82 byte flips : =E2=94=82  byte flips : 0/81, 0/71, 0/52          =
           =E2=94=82   pending : 199       =E2=94=82 0/71, 0/52 =E2=94=82 p=
ending : 199 =E2=94=82
-+=E2=94=82 arithmetics : 11/4494, =E2=94=82 arithmetics : 11/4494, 0/1153,=
 0/0                 =E2=94=82  pend fav : 35        =E2=94=82 0/0 =E2=94=
=82 pend fav : 35 =E2=94=82
-+=E2=94=82  known ints : 1/448, 0/1986, 0/2288                =E2=94=82 ow=
n finds : 207       =E2=94=82 known ints : =E2=94=82  known ints : 1/448, 0=
/1986, 0/2288                =E2=94=82 own finds : 207       =E2=94=82 0/19=
86, 0/2288 =E2=94=82 own finds : 207 =E2=94=82
-+=E2=94=82 dictionary : 0/0, =E2=94=82  dictionary : 0/0, 0/0, 0/0, 0/0   =
                =E2=94=82  imported : 0         =E2=94=82 0/0, 0/0 =E2=94=
=82 imported : 0 =E2=94=82
-+=E2=94=82havoc/splice : 142/146k, 23/7616 =E2=94=82havoc/splice : 142/146=
k, 23/7616                    =E2=94=82 stability : 100.00%   =E2=94=82 sta=
bility : 100.00% =E2=94=82
-+=E2=94=82py/custom/rq : unused, unused, =E2=94=82py/custom/rq : unused, u=
nused, unused, unused       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98 unused =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
-+=E2=94=82 trim/eff : 57.02%/26, =E2=94=82    trim/eff : 57.02%/26, 0.00% =
                    =E2=94=82          [cpu000:100%] =E2=94=82 [cpu000:100%]
-+=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98^C    =E2=94=94=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=98^C
-+0
-+" \
-+	"" \
-+	"\
-+=E2=94=80 process timing =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80 overa=
ll results =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
-+=E2=94=82        run time : 0 days, 0 hrs, 0 min, 56 sec      =E2=94=82  =
cycles done : 0     =E2=94=82
-+=E2=94=82   last new find : 0 days, 0 hrs, 0 min, 1 sec       =E2=94=82 c=
orpus count : 208   =E2=94=82
-+=E2=94=82last saved crash : none seen yet                     =E2=94=82sa=
ved crashes : 0     =E2=94=82
-+=E2=94=82 last saved hang : none seen yet                     =E2=94=82  =
saved hangs : 0     =E2=94=82
-+=E2=94=9C=E2=94=80 cycle progress =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=AC=E2=94=80 map coverage=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=A4
-+=E2=94=82  now processing : 184.1 (88.5%)      =E2=94=82    map density :=
 0.30% / 0.52%      =E2=94=82
-+=E2=94=82  runs timed out : 0 (0.00%)          =E2=94=82 count coverage :=
 2.18 bits/tuple    =E2=94=82
-+=E2=94=9C=E2=94=80 stage progress =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=BC=E2=94=80 findings in depth =E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
-+=E2=94=82  now trying : havoc                  =E2=94=82 favored items : =
43 (20.67%)         =E2=94=82
-+=E2=94=82 stage execs : 11.2k/131k (8.51%)     =E2=94=82  new edges on : =
52 (25.00%)         =E2=94=82
-+=E2=94=82 total execs : 179k                   =E2=94=82 total crashes : =
0 (0 saved)         =E2=94=82
-+=E2=94=82  exec speed : 3143/sec               =E2=94=82  total tmouts : =
0 (0 saved)         =E2=94=82
-+=E2=94=9C=E2=94=80 fuzzing strategy yields =E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80 it=
em geometry =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=A4
-+=E2=94=82   bit flips : 11/648, 4/638, 5/618                 =E2=94=82   =
 levels : 4         =E2=94=82
-+=E2=94=82  byte flips : 0/81, 0/71, 0/52                     =E2=94=82   =
pending : 199       =E2=94=82
-+=E2=94=82 arithmetics : 11/4494, 0/1153, 0/0                 =E2=94=82  p=
end fav : 35        =E2=94=82
-+=E2=94=82  known ints : 1/448, 0/1986, 0/2288                =E2=94=82 ow=
n finds : 207       =E2=94=82
-+=E2=94=82  dictionary : 0/0, 0/0, 0/0, 0/0                   =E2=94=82  i=
mported : 0         =E2=94=82
-+=E2=94=82havoc/splice : 142/146k, 23/7616                    =E2=94=82 st=
ability : 100.00%   =E2=94=82
-+=E2=94=82py/custom/rq : unused, unused, unused, unused       =E2=94=9C=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
-+=E2=94=82    trim/eff : 57.02%/26, 0.00%                     =E2=94=82   =
       [cpu000:100%]
-+=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98^C"
-+
- exit $FAILCOUNT
---=20
-2.30.2
-
diff --git a/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch b/meta/=
recipes-core/busybox/busybox/CVE-2023-42363.patch
deleted file mode 100644
index 379f6f83b16..00000000000
--- a/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Mon, 20 May 2024 17:55:28 +0200
-Subject: [PATCH] awk: fix use after free (CVE-2023-42363)
-
-function                                             old     new   delta
-evaluate                                            3377    3385      +8
-
-Fixes https://bugs.busybox.net/show_bug.cgi?id=3D15865
-
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-CVE: CVE-2023-42363
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3Dfb=
08d43d44d1fea1f741fafb9aa7e1958a5f69aa]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- editors/awk.c | 21 +++++++++++++--------
- 1 file changed, 13 insertions(+), 8 deletions(-)
-
-diff --git a/editors/awk.c b/editors/awk.c
-index 0981c6735..ff6d6350b 100644
---- a/editors/awk.c
-+++ b/editors/awk.c
-@@ -2910,19 +2910,14 @@ static var *evaluate(node *op, var *res)
- 				/* yes, remember where Fields[] is */
- 				old_Fields_ptr =3D Fields;
- 			}
--			if (opinfo & OF_STR1) {
--				L.s =3D getvar_s(L.v);
--				debug_printf_eval("L.s:'%s'\n", L.s);
--			}
- 			if (opinfo & OF_NUM1) {
- 				L_d =3D getvar_i(L.v);
- 				debug_printf_eval("L_d:%f\n", L_d);
- 			}
- 		}
--		/* NB: Must get string/numeric values of L (done above)
--		 * _before_ evaluate()'ing R.v: if both L and R are $NNNs,
--		 * and right one is large, then L.v points to Fields[NNN1],
--		 * second evaluate() reallocates and moves (!) Fields[],
-+		/* NB: if both L and R are $NNNs, and right one is large,
-+		 * then at this pint L.v points to Fields[NNN1], second
-+		 * evaluate() below reallocates and moves (!) Fields[],
- 		 * R.v points to Fields[NNN2] but L.v now points to freed mem!
- 		 * (Seen trying to evaluate "$444 $44444")
- 		 */
-@@ -2942,6 +2937,16 @@ static var *evaluate(node *op, var *res)
- 				debug_printf_eval("R.s:'%s'\n", R.s);
- 			}
- 		}
-+		/* Get L.s _after_ R.v is evaluated: it may have realloc'd L.v
-+		 * so we must get the string after "old_Fields_ptr" correction
-+		 * above. Testcase: x =3D (v =3D "abc", gsub("b", "X", v));
-+		 */
-+		if (opinfo & OF_RES1) {
-+			if (opinfo & OF_STR1) {
-+				L.s =3D getvar_s(L.v);
-+				debug_printf_eval("L.s:'%s'\n", L.s);
-+			}
-+		}
-=20
- 		debug_printf_eval("switch(0x%x)\n", XC(opinfo & OPCLSMASK));
- 		switch (XC(opinfo & OPCLSMASK)) {
---=20
-2.30.2
-
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-cor=
e/busybox/busybox/defconfig
index 8e3b6e480ca..d172ec46e9a 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1,7 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.36.0
-# Tue Jan  3 14:17:01 2023
+# Busybox version: 1.37.0
 #
 CONFIG_HAVE_DOT_CONFIG=3Dy
=20
@@ -17,6 +16,7 @@ CONFIG_SHOW_USAGE=3Dy
 # CONFIG_FEATURE_VERBOSE_USAGE is not set
 CONFIG_FEATURE_COMPRESS_USAGE=3Dy
 CONFIG_LFS=3Dy
+CONFIG_TIME64=3Dy
 # CONFIG_PAM is not set
 CONFIG_FEATURE_DEVPTS=3Dy
 CONFIG_FEATURE_UTMP=3Dy
@@ -466,6 +466,7 @@ CONFIG_FEATURE_FIND_NEWER=3Dy
 CONFIG_FEATURE_FIND_SAMEFILE=3Dy
 CONFIG_FEATURE_FIND_EXEC=3Dy
 CONFIG_FEATURE_FIND_EXEC_PLUS=3Dy
+CONFIG_FEATURE_FIND_EXEC_OK=3Dy
 CONFIG_FEATURE_FIND_USER=3Dy
 CONFIG_FEATURE_FIND_GROUP=3Dy
 CONFIG_FEATURE_FIND_NOT=3Dy
@@ -792,6 +793,7 @@ CONFIG_FEATURE_CROND_DIR=3D""
 # CONFIG_FLASH_LOCK is not set
 # CONFIG_FLASH_UNLOCK is not set
 # CONFIG_FLASHCP is not set
+CONFIG_GETFATTR=3Dy
 # CONFIG_HDPARM is not set
 # CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
 # CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
@@ -929,6 +931,7 @@ CONFIG_IP=3Dy
 # CONFIG_IPNEIGH is not set
 CONFIG_FEATURE_IP_ADDRESS=3Dy
 CONFIG_FEATURE_IP_LINK=3Dy
+# CONFIG_FEATURE_IP_LINK_CAN is not set
 CONFIG_FEATURE_IP_ROUTE=3Dy
 CONFIG_FEATURE_IP_ROUTE_DIR=3D"/etc/iproute2"
 CONFIG_FEATURE_IP_TUNNEL=3Dy
@@ -1002,6 +1005,7 @@ CONFIG_FEATURE_WGET_OPENSSL=3Dy
 # CONFIG_WHOIS is not set
 # CONFIG_ZCIP is not set
 CONFIG_UDHCPD=3Dy
+CONFIG_FEATURE_UDHCPD_BOOTP=3Dy
 # CONFIG_FEATURE_UDHCPD_BASE_IP_ON_MAC is not set
 # CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
 CONFIG_DHCPD_LEASES_FILE=3D"/var/lib/misc/udhcpd.leases"
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-cor=
e/busybox/busybox_1.37.0.bb
similarity index 84%
rename from meta/recipes-core/busybox/busybox_1.36.1.bb
rename to meta/recipes-core/busybox/busybox_1.37.0.bb
index f7c3eff29e5..9fff4889476 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -49,16 +49,10 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters=
-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printabl=
e.patch \
            file://start-stop-false.patch \
-           file://CVE-2021-42380.patch \
-           file://0001-awk-fix-segfault-when-compiled-by-clang.patch \
-           file://CVE-2023-42363.patch \
            file://busybox-1.36.1-no-cbq.patch \
-           file://0001-awk-fix-precedence-of-relative-to.patch \
-           file://0002-awk-fix-ternary-operator-and-precedence-of.patch \
-           file://0001-awk.c-fix-CVE-2023-42366-bug-15874.patch \
            file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
 SRC_URI:append:x86 =3D " file://sha_accel.cfg"
-SRC_URI[tarball.sha256sum] =3D "b8cc24c9574d809e7279c3be349795c5d5ceb6fdf1=
9ca709f80cde50e47de314"
+SRC_URI[tarball.sha256sum] =3D "3311dff32e746499f4df0d5df04d7eb396382d7e10=
8bb9250e7b519b837043a4"
--=20
2.34.1


