Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE629C52D73
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 16:53:30 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.38500.1723049607153471728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 09:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nEZUfMr6;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.170, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e0bf677e0feso20370276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 09:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723049606; x=1723654406; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIgf3AWbvFMkjuCqnAdCQ2EOSn918xwF45s+5NOrymI=;
        b=nEZUfMr6opthIvxl2P3wDALuR1+4jwbxsgFzm8l2kmNAx6q3zUXJ3b4VpHV/BUqbsl
         BPw7b9dKW5J1TiH7BaE8nhww8t/k/yfC0XX56wvW9MJ80fjQZngl82sToG3OD5W6IGb0
         /3F4tlfCRTXe7Pbj2b7CsAkya4wHuqrEF3MJHmw+ZP2DnEouFGw1Jon3ii9cHmVsIrMg
         lZEV9lZdWLHlNnVfaXIZqhTHKZ+ppmthhL5Ow4qnB1nPsENHZKyBE6YKU2J012jfWFUi
         N7BncjuRT08GCOxHMhE/IIZRTmzQ2Aus9bmEWXapF2P0uyTETDMnOrH22kLnR5Y0RuIq
         ljNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723049606; x=1723654406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIgf3AWbvFMkjuCqnAdCQ2EOSn918xwF45s+5NOrymI=;
        b=eZB95Wca6sfxacz3dkRDa4enaoTeG9CbNorJ9oy63k2Z2jWWwu4Nmq6mQNfq8RqCeC
         x83id+OoXMZ9bfTmxlWuW3FPahLuW157wj4/W47XvHnDQElc0J6CSBxYgPYbl5F9oQp3
         3jBlE2MH3m/Iwzp3S+MNM7+XqW8PcMNnWQu4pvozwFbhmCkxZaLZJL9SF5gsRmqrVaOi
         oT7r2uGzXIwbtD6tpsQakaTJYcz6RQEfW2cMX3Ow2XCmdljCZezveq5ltjtwd8l+zT1Q
         PhXExYxZ8CM6EzG3T7rW/8ZMj1Ztv+5dQnqoMQzIVHxHULHe3baNTBF0XXLz66SzwkfF
         IMPQ==
X-Gm-Message-State: AOJu0YzDH1drw2LCGFsMTBG/sVXat9Zqbsft6DaS5u8tJi8buSgx7pmM
	y5sHMoWBcSvJGkSghPYbBk7w4IqIlS8LYfXUTwjj31+riJP0JTKbd54mqsaTrE5EB/pRmU1FPi7
	UP4hcbeUndR8AQt+/lKrAxmT5tIUhbA6nBoUObLGj26G6QD4tyk8gew==
X-Google-Smtp-Source: AGHT+IEK3sxZGNp6ncTemqTySInzU1jp/X2JaGJagV2vAZB48flzGZ5Mq8ajhqnVhpMZkXMgBwig6hGc+kQNIC3gIq0=
X-Received: by 2002:a05:6902:20c7:b0:e0b:c99d:b6dd with SMTP id
 3f1490d57ef6-e0bde2c208bmr22149143276.12.1723049606112; Wed, 07 Aug 2024
 09:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240807072049.229288-1-hprajapati@mvista.com>
In-Reply-To: <20240807072049.229288-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 7 Aug 2024 09:53:14 -0700
Message-ID: <CAOSpxdbaVrBDCz-rRWBr2Sb3XFOEz0Vc6DQehvOAs44_OAc-tg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] busybox: CVE-2023-42364,
 CVE-2023-42365 & CVE-2023-42366 fixes
To: hprajapati@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 16:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203093

On Wed, Aug 7, 2024 at 12:21=E2=80=AFAM Hitendra Prajapati via
lists.openembedded.org <hprajapati=3Dmvista.com@lists.openembedded.org>
wrote:
>
> backport upstream fix for CVEs and fix the regression that introduced [1]
>
> [1] http://lists.busybox.net/pipermail/busybox/2024-May/090766.html
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  ...01-awk-fix-precedence-of-relative-to.patch | 197 ++++++++++++++++++
>  ...1-awk.c-fix-CVE-2023-42366-bug-15874.patch |  36 ++++
>  ...x-ternary-operator-and-precedence-of.patch |  96 +++++++++
>  meta/recipes-core/busybox/busybox_1.35.0.bb   |   3 +
>  4 files changed, 332 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-preced=
ence-of-relative-to.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-=
2023-42366-bug-15874.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/0002-awk-fix-ternar=
y-operator-and-precedence-of.patch

The naming convention is to indicate the CVE number in the file name,
so the file name for the CVE-2023-42366 fix should be
CVE-2023-42366.patch.

For the patches that fix 2 CVE's perhaps: CVE-2023-42364_42365-1.patch
and CVE-2023-42364_42365-2.patch

> diff --git a/meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of=
-relative-to.patch b/meta/recipes-core/busybox/busybox/0001-awk-fix-precede=
nce-of-relative-to.patch
> new file mode 100644
> index 0000000000..e3d623498c
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relati=
ve-to.patch
> @@ -0,0 +1,197 @@
> +From dedc9380c76834ba64c8b526aef6f461ea4e7f2e Mon Sep 17 00:00:00 2001
> +From: Denys Vlasenko <vda.linux@googlemail.com>
> +Date: Tue, 30 May 2023 16:42:18 +0200
> +Subject: [PATCH 1/2] awk: fix precedence of =3D relative to =3D=3D
> +
> +Discovered while adding code to disallow assignments to non-lvalues
> +
> +function                                             old     new   delta
> +parse_expr                                           936     991     +55
> +.rodata                                           105243  105247      +4
> +------------------------------------------------------------------------=
------
> +(add/remove: 0/0 grow/shrink: 2/0 up/down: 59/0)               Total: 59=
 bytes
> +
> +Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D=
0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4]
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +(cherry picked from commit 0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4)
> +
> +CVE: CVE-2023-42364 & CVE-2023-42365

Don't use an ampersand, a space separator is sufficient.

Thanks,

Steve

> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + editors/awk.c       | 66 ++++++++++++++++++++++++++++++---------------
> + testsuite/awk.tests |  5 ++++
> + 2 files changed, 50 insertions(+), 21 deletions(-)
> +
> +diff --git a/editors/awk.c b/editors/awk.c
> +index ec9301e..aff86fe 100644
> +--- a/editors/awk.c
> ++++ b/editors/awk.c
> +@@ -337,7 +337,9 @@ static void debug_parse_print_tc(uint32_t n)
> + #undef P
> + #undef PRIMASK
> + #undef PRIMASK2
> +-#define P(x)      (x << 24)
> ++/* Smaller 'x' means _higher_ operator precedence */
> ++#define PRECEDENCE(x) (x << 24)
> ++#define P(x)      PRECEDENCE(x)
> + #define PRIMASK   0x7F000000
> + #define PRIMASK2  0x7E000000
> +
> +@@ -360,7 +362,7 @@ enum {
> +       OC_MOVE =3D 0x1f00,       OC_PGETLINE =3D 0x2000,   OC_REGEXP =3D=
 0x2100,
> +       OC_REPLACE =3D 0x2200,    OC_RETURN =3D 0x2300,     OC_SPRINTF =
=3D 0x2400,
> +       OC_TERNARY =3D 0x2500,    OC_UNARY =3D 0x2600,      OC_VAR =3D 0x=
2700,
> +-      OC_DONE =3D 0x2800,
> ++      OC_CONST =3D 0x2800,      OC_DONE =3D 0x2900,
> +
> +       ST_IF =3D 0x3000,         ST_DO =3D 0x3100,         ST_FOR =3D 0x=
3200,
> +       ST_WHILE =3D 0x3300
> +@@ -440,9 +442,9 @@ static const uint32_t tokeninfo[] ALIGN4 =3D {
> + #define TI_PREINC (OC_UNARY|xV|P(9)|'P')
> + #define TI_PREDEC (OC_UNARY|xV|P(9)|'M')
> +       TI_PREINC,               TI_PREDEC,               OC_FIELD|xV|P(5=
),
> +-      OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(74),        OC_REPLACE|NV|P=
(74)|'+', OC_REPLACE|NV|P(74)|'-',
> +-      OC_REPLACE|NV|P(74)|'*', OC_REPLACE|NV|P(74)|'/', OC_REPLACE|NV|P=
(74)|'%', OC_REPLACE|NV|P(74)|'&',
> +-      OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P=
(74)|'&', OC_BINARY|NV|P(15)|'&',
> ++      OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(38),        OC_REPLACE|NV|P=
(38)|'+', OC_REPLACE|NV|P(38)|'-',
> ++      OC_REPLACE|NV|P(38)|'*', OC_REPLACE|NV|P(38)|'/', OC_REPLACE|NV|P=
(38)|'%', OC_REPLACE|NV|P(38)|'&',
> ++      OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P=
(38)|'&', OC_BINARY|NV|P(15)|'&',
> +       OC_BINARY|NV|P(25)|'/',  OC_BINARY|NV|P(25)|'%',  OC_BINARY|NV|P(=
15)|'&',  OC_BINARY|NV|P(25)|'*',
> +       OC_COMPARE|VV|P(39)|4,   OC_COMPARE|VV|P(39)|3,   OC_COMPARE|VV|P=
(39)|0,   OC_COMPARE|VV|P(39)|1,
> + #define TI_LESS     (OC_COMPARE|VV|P(39)|2)
> +@@ -1290,7 +1292,7 @@ static uint32_t next_token(uint32_t expected)
> +                       save_tclass =3D tc;
> +                       save_info =3D t_info;
> +                       tc =3D TC_BINOPX;
> +-                      t_info =3D OC_CONCAT | SS | P(35);
> ++                      t_info =3D OC_CONCAT | SS | PRECEDENCE(35);
> +               }
> +
> +               t_tclass =3D tc;
> +@@ -1350,9 +1352,8 @@ static node *parse_expr(uint32_t term_tc)
> + {
> +       node sn;
> +       node *cn =3D &sn;
> +-      node *vn, *glptr;
> ++      node *glptr;
> +       uint32_t tc, expected_tc;
> +-      var *v;
> +
> +       debug_printf_parse("%s() term_tc(%x):", __func__, term_tc);
> +       debug_parse_print_tc(term_tc);
> +@@ -1363,11 +1364,12 @@ static node *parse_expr(uint32_t term_tc)
> +       expected_tc =3D TS_OPERAND | TS_UOPPRE | TC_REGEXP | term_tc;
> +
> +       while (!((tc =3D next_token(expected_tc)) & term_tc)) {
> ++              node *vn;
> +
> +               if (glptr && (t_info =3D=3D TI_LESS)) {
> +                       /* input redirection (<) attached to glptr node *=
/
> +                       debug_printf_parse("%s: input redir\n", __func__)=
;
> +-                      cn =3D glptr->l.n =3D new_node(OC_CONCAT | SS | P=
(37));
> ++                      cn =3D glptr->l.n =3D new_node(OC_CONCAT | SS | P=
RECEDENCE(37));
> +                       cn->a.n =3D glptr;
> +                       expected_tc =3D TS_OPERAND | TS_UOPPRE;
> +                       glptr =3D NULL;
> +@@ -1379,24 +1381,42 @@ static node *parse_expr(uint32_t term_tc)
> +                        * previous operators with higher priority */
> +                       vn =3D cn;
> +                       while (((t_info & PRIMASK) > (vn->a.n->info & PRI=
MASK2))
> +-                          || ((t_info =3D=3D vn->info) && t_info =3D=3D=
 TI_COLON)
> ++                          || (t_info =3D=3D vn->info && t_info =3D=3D T=
I_COLON)
> +                       ) {
> +                               vn =3D vn->a.n;
> +                               if (!vn->a.n) syntax_error(EMSG_UNEXP_TOK=
EN);
> +                       }
> +                       if (t_info =3D=3D TI_TERNARY)
> + //TODO: why?
> +-                              t_info +=3D P(6);
> ++                              t_info +=3D PRECEDENCE(6);
> +                       cn =3D vn->a.n->r.n =3D new_node(t_info);
> +                       cn->a.n =3D vn->a.n;
> +                       if (tc & TS_BINOP) {
> +                               cn->l.n =3D vn;
> +-//FIXME: this is the place to detect and reject assignments to non-lval=
ues.
> +-//Currently we allow "assignments" to consts and temporaries, nonsense =
like this:
> +-// awk 'BEGIN { "qwe" =3D 1 }'
> +-// awk 'BEGIN { 7 *=3D 7 }'
> +-// awk 'BEGIN { length("qwe") =3D 1 }'
> +-// awk 'BEGIN { (1+1) +=3D 3 }'
> ++
> ++                              /* Prevent:
> ++                               * awk 'BEGIN { "qwe" =3D 1 }'
> ++                               * awk 'BEGIN { 7 *=3D 7 }'
> ++                               * awk 'BEGIN { length("qwe") =3D 1 }'
> ++                               * awk 'BEGIN { (1+1) +=3D 3 }'
> ++                               */
> ++                              /* Assignment? (including *=3D and friend=
s) */
> ++                              if (((t_info & OPCLSMASK) =3D=3D OC_MOVE)
> ++                               || ((t_info & OPCLSMASK) =3D=3D OC_REPLA=
CE)
> ++                              ) {
> ++                                      debug_printf_parse("%s: MOVE/REPL=
ACE vn->info:%08x\n", __func__, vn->info);
> ++                                      /* Left side is a (variable or ar=
ray element)
> ++                                       * or function argument
> ++                                       * or $FIELD ?
> ++                                       */
> ++                                      if ((vn->info & OPCLSMASK) !=3D O=
C_VAR
> ++                                       && (vn->info & OPCLSMASK) !=3D O=
C_FNARG
> ++                                       && (vn->info & OPCLSMASK) !=3D O=
C_FIELD
> ++                                      ) {
> ++                                              syntax_error(EMSG_UNEXP_T=
OKEN); /* no. bad */
> ++                                      }
> ++                              }
> ++
> +                               expected_tc =3D TS_OPERAND | TS_UOPPRE | =
TC_REGEXP;
> +                               if (t_info =3D=3D TI_PGETLINE) {
> +                                       /* it's a pipe */
> +@@ -1432,6 +1452,8 @@ static node *parse_expr(uint32_t term_tc)
> +               /* one should be very careful with switch on tclass -
> +                * only simple tclasses should be used (TC_xyz, not TS_xy=
z) */
> +               switch (tc) {
> ++                      var *v;
> ++
> +               case TC_VARIABLE:
> +               case TC_ARRAY:
> +                       debug_printf_parse("%s: TC_VARIABLE | TC_ARRAY\n"=
, __func__);
> +@@ -1452,14 +1474,14 @@ static node *parse_expr(uint32_t term_tc)
> +               case TC_NUMBER:
> +               case TC_STRING:
> +                       debug_printf_parse("%s: TC_NUMBER | TC_STRING\n",=
 __func__);
> +-                      cn->info =3D OC_VAR;
> ++                      cn->info =3D OC_CONST;
> +                       v =3D cn->l.v =3D xzalloc(sizeof(var));
> +-                      if (tc & TC_NUMBER)
> ++                      if (tc & TC_NUMBER) {
> +                               setvar_i(v, t_double);
> +-                      else {
> ++                       } else {
> +                               setvar_s(v, t_string);
> +-                              expected_tc &=3D ~TC_UOPPOST; /* "str"++ =
is not allowed */
> +                       }
> ++                      expected_tc &=3D ~TC_UOPPOST; /* NUM++, "str"++ n=
ot allowed */
> +                       break;
> +
> +               case TC_REGEXP:
> +@@ -3107,6 +3129,8 @@ static var *evaluate(node *op, var *res)
> +
> +               /* -- recursive node type -- */
> +
> ++              case XC( OC_CONST ):
> ++                      debug_printf_eval("CONST ");
> +               case XC( OC_VAR ):
> +                       debug_printf_eval("VAR\n");
> +                       L.v =3D op->l.v;
> +diff --git a/testsuite/awk.tests b/testsuite/awk.tests
> +index ddc5104..a78fdcd 100755
> +--- a/testsuite/awk.tests
> ++++ b/testsuite/awk.tests
> +@@ -540,4 +540,9 @@ testing 'awk assign while assign' \
> + =E2=94=82    trim/eff : 57.02%/26, 0.00%                     =E2=94=82 =
         [cpu000:100%]
> + =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98^C"
> +
> ++testing "awk =3D has higher precedence than =3D=3D (despite what gawk m=
anpage claims)" \
> ++      "awk 'BEGIN { v=3D1; print 2=3D=3Dv; print 2=3D=3Dv=3D2; print v;=
 print v=3D3=3D=3D3; print v}'" \
> ++      '0\n1\n2\n1\n3\n' \
> ++      '' ''
> ++
> + exit $FAILCOUNT
> diff --git a/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42=
366-bug-15874.patch b/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-=
2023-42366-bug-15874.patch
> new file mode 100644
> index 0000000000..d660768e2f
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug=
-15874.patch
> @@ -0,0 +1,36 @@
> +From 8542236894a8d5f7393327117bc7f64787444efc Mon Sep 17 00:00:00 2001
> +From: Valery Ushakov <uwe@stderr.spb.ru>
> +Date: Wed, 24 Jan 2024 22:24:41 +0300
> +Subject: [PATCH] awk.c: fix CVE-2023-42366 (bug #15874)
> +
> +Make sure we don't read past the end of the string in next_token()
> +when backslash is the last character in an (invalid) regexp.
> +a fix and issue reported in bugzilla
> +
> +https://bugs.busybox.net/show_bug.cgi?id=3D15874
> +
> +Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2=
024-May/090766.html]
> +CVE: CVE-2023-42366
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + editors/awk.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/editors/awk.c b/editors/awk.c
> +index f320d8c..a53b193 100644
> +--- a/editors/awk.c
> ++++ b/editors/awk.c
> +@@ -1168,9 +1168,11 @@ static uint32_t next_token(uint32_t expected)
> +                                       s[-1] =3D bb_process_escape_seque=
nce((const char **)&pp);
> +                                       if (*p =3D=3D '\\')
> +                                               *s++ =3D '\\';
> +-                                      if (pp =3D=3D p)
> ++                                      if (pp =3D=3D p) {
> ++                                              if (*p =3D=3D '\0')
> ++                                                      syntax_error(EMSG=
_UNEXP_EOS);
> +                                               *s++ =3D *p++;
> +-                                      else
> ++                                      } else
> +                                               p =3D pp;
> +                               }
> +                       }
> diff --git a/meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-opera=
tor-and-precedence-of.patch b/meta/recipes-core/busybox/busybox/0002-awk-fi=
x-ternary-operator-and-precedence-of.patch
> new file mode 100644
> index 0000000000..2d11efb1cf
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and=
-precedence-of.patch
> @@ -0,0 +1,96 @@
> +From c3bfdac8e0e9a21d524ad72036953f68d2193e52 Mon Sep 17 00:00:00 2001
> +From: Natanael Copa <ncopa@alpinelinux.org>
> +Date: Tue, 21 May 2024 14:46:08 +0200
> +Subject: [PATCH 2/2] awk: fix ternary operator and precedence of =3D
> +
> +Adjust the =3D precedence test to match behavior of gawk, mawk and
> +FreeBSD.  awk 'BEGIN {print v=3D3=3D=3D3; print v}' should print two '1'=
.
> +
> +To fix this, and to unbreak the ternary conditional operator, we restore
> +the precedence of =3D in the token list, but override this with a lower
> +priority when the assignment is on the right side of a compare.
> +
> +This fixes commit 0256e00a9d07 (awk: fix precedence of =3D relative to =
=3D=3D) [1]
> +
> +Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2=
024-May/090766.html]
> +
> +[1] https://bugs.busybox.net/show_bug.cgi?id=3D15871#c6
> +
> +Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> +(cherry picked from commit 1714301c405ef03b39605c85c23f22a190cddd95)
> +
> +CVE: CVE-2023-42364 & CVE-2023-42365
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + editors/awk.c       | 18 ++++++++++++++----
> + testsuite/awk.tests |  9 +++++++--
> + 2 files changed, 21 insertions(+), 6 deletions(-)
> +
> +diff --git a/editors/awk.c b/editors/awk.c
> +index aff86fe..f320d8c 100644
> +--- a/editors/awk.c
> ++++ b/editors/awk.c
> +@@ -442,9 +442,10 @@ static const uint32_t tokeninfo[] ALIGN4 =3D {
> + #define TI_PREINC (OC_UNARY|xV|P(9)|'P')
> + #define TI_PREDEC (OC_UNARY|xV|P(9)|'M')
> +       TI_PREINC,               TI_PREDEC,               OC_FIELD|xV|P(5=
),
> +-      OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(38),        OC_REPLACE|NV|P=
(38)|'+', OC_REPLACE|NV|P(38)|'-',
> +-      OC_REPLACE|NV|P(38)|'*', OC_REPLACE|NV|P(38)|'/', OC_REPLACE|NV|P=
(38)|'%', OC_REPLACE|NV|P(38)|'&',
> +-      OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P=
(38)|'&', OC_BINARY|NV|P(15)|'&',
> ++#define TI_ASSIGN (OC_MOVE|VV|P(74))
> ++      OC_COMPARE|VV|P(39)|5,   TI_ASSIGN,               OC_REPLACE|NV|P=
(74)|'+', OC_REPLACE|NV|P(74)|'-',
> ++      OC_REPLACE|NV|P(74)|'*', OC_REPLACE|NV|P(74)|'/', OC_REPLACE|NV|P=
(74)|'%', OC_REPLACE|NV|P(74)|'&',
> ++      OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P=
(74)|'&', OC_BINARY|NV|P(15)|'&',
> +       OC_BINARY|NV|P(25)|'/',  OC_BINARY|NV|P(25)|'%',  OC_BINARY|NV|P(=
15)|'&',  OC_BINARY|NV|P(25)|'*',
> +       OC_COMPARE|VV|P(39)|4,   OC_COMPARE|VV|P(39)|3,   OC_COMPARE|VV|P=
(39)|0,   OC_COMPARE|VV|P(39)|1,
> + #define TI_LESS     (OC_COMPARE|VV|P(39)|2)
> +@@ -1376,11 +1377,19 @@ static node *parse_expr(uint32_t term_tc)
> +                       continue;
> +               }
> +               if (tc & (TS_BINOP | TC_UOPPOST)) {
> ++                      int prio;
> +                       debug_printf_parse("%s: TS_BINOP | TC_UOPPOST tc:=
%x\n", __func__, tc);
> +                       /* for binary and postfix-unary operators, jump b=
ack over
> +                        * previous operators with higher priority */
> +                       vn =3D cn;
> +-                      while (((t_info & PRIMASK) > (vn->a.n->info & PRI=
MASK2))
> ++                      /* Let assignment get higher priority when used o=
n right
> ++                       * side in compare. i.e: 2=3D=3Dv=3D3 */
> ++                      if (t_info =3D=3D TI_ASSIGN && (vn->a.n->info & O=
PCLSMASK) =3D=3D OC_COMPARE) {
> ++                              prio =3D PRECEDENCE(38);
> ++                      } else {
> ++                              prio =3D (t_info & PRIMASK);
> ++                      }
> ++                      while ((prio > (vn->a.n->info & PRIMASK2))
> +                           || (t_info =3D=3D vn->info && t_info =3D=3D T=
I_COLON)
> +                       ) {
> +                               vn =3D vn->a.n;
> +@@ -1412,6 +1421,7 @@ static node *parse_expr(uint32_t term_tc)
> +                                       if ((vn->info & OPCLSMASK) !=3D O=
C_VAR
> +                                        && (vn->info & OPCLSMASK) !=3D O=
C_FNARG
> +                                        && (vn->info & OPCLSMASK) !=3D O=
C_FIELD
> ++                                       && (vn->info & OPCLSMASK) !=3D O=
C_COMPARE
> +                                       ) {
> +                                               syntax_error(EMSG_UNEXP_T=
OKEN); /* no. bad */
> +                                       }
> +diff --git a/testsuite/awk.tests b/testsuite/awk.tests
> +index a78fdcd..d2706de 100755
> +--- a/testsuite/awk.tests
> ++++ b/testsuite/awk.tests
> +@@ -540,9 +540,14 @@ testing 'awk assign while assign' \
> + =E2=94=82    trim/eff : 57.02%/26, 0.00%                     =E2=94=82 =
         [cpu000:100%]
> + =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98^C"
> +
> +-testing "awk =3D has higher precedence than =3D=3D (despite what gawk m=
anpage claims)" \
> ++testing "awk =3D has higher precedence than =3D=3D on right side" \
> +       "awk 'BEGIN { v=3D1; print 2=3D=3Dv; print 2=3D=3Dv=3D2; print v;=
 print v=3D3=3D=3D3; print v}'" \
> +-      '0\n1\n2\n1\n3\n' \
> ++      '0\n1\n2\n1\n1\n' \
> ++      '' ''
> ++
> ++testing 'awk ternary precedence' \
> ++      "awk 'BEGIN { a =3D 0 ? \"yes\": \"no\"; print a }'" \
> ++      'no\n' \
> +       '' ''
> +
> + exit $FAILCOUNT
> diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-c=
ore/busybox/busybox_1.35.0.bb
> index 1c7fe2f43e..ead931bc41 100644
> --- a/meta/recipes-core/busybox/busybox_1.35.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
> @@ -54,6 +54,9 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
>            file://CVE-2022-48174.patch \
>             file://CVE-2021-42380.patch \
>             file://CVE-2023-42363.patch \
> +           file://0001-awk-fix-precedence-of-relative-to.patch \
> +           file://0002-awk-fix-ternary-operator-and-precedence-of.patch =
\
> +           file://0001-awk.c-fix-CVE-2023-42366-bug-15874.patch \
>             "
>  SRC_URI:append:libc-musl =3D " file://musl.cfg "
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203060): https://lists.openembedded.org/g/openembedde=
d-core/message/203060
> Mute This Topic: https://lists.openembedded.org/mt/107765584/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

