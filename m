Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DDACA5FA1
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 16:27:25 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61685.1790612835224520360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 09:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CXADSPHs;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9939; q=dns/txt;
  s=iport01; t=1790612835; x=1791822435;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=co64fKfKne/ju6WqU4LyITWcePnpP2O8RxO+zcDGhzg=;
  b=CXADSPHs2y6aiWghKHFqEIkPQybcneMZ7uvSE2BwPRv9FEXFWwYV5BDs
   BpBWgsLrx8YHp2f6SUV7Kwul8fJKoP4/eEhwWx51JcdxqTxe0ka+vgDjG
   9ntReAD+Ra03nXOiw8qYXVc4+gvDl6sHTr1b37HZhVoiP41LXNLbV3/qj
   pMF1r9AKl7qUHTEoJp7/uBhY9FOGbrenRxUhEN8xrSPM7Z5GbxaCLvXbU
   rStTmV6hy7lnGIDqHd+dYt98Y0zjWnAOgQ2nVl+LtO/WkznXJJynmCEnG
   o0B6+DTEJthZyiG9MF6EttBVN/+mOeDolit4Xl7MnNTcg+FBgO3Y/MbNP
   Q==;
X-CSE-ConnectionGUID: oSaNDu6eQ9a5EAEEt/bhWg==
X-CSE-MsgGUID: 5ReDoYZWSzaPEr0OJMYa+g==
X-IPAS-Result: =?us-ascii?q?A0BHAgA/lLpq/5D/Ja1aHgEBCxIMggULgld1YENJhFePU?=
 =?us-ascii?q?oIhi2eSNhSBag8BAQEPRA0EAQGTEAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgEpDwEYAVkDAQIDAiYCIgsjGAmDAgGCOgM3A?=
 =?us-ascii?q?xHCQ3qBMoEBgykBPwJDUNhLDQhqgWgBCxQBgQouhUCCfyABhQNdGAFEhDgnG?=
 =?us-ascii?q?4FJRIEVg2mBBYEaQgEDGIEJGwEBg3uCagSDHBKBWh4yknBIgQIcA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+Fy9YGwYFgR2BIIIZIxk2eoEJXoErKWEQF4EHg?=
 =?us-ascii?q?gcCglSCAQIBSUMOB0VTCSVBChJHJiIIEgkBExowC4EhOEEJKAsYDUgRLDcVG?=
 =?us-ascii?q?QQ9AW4HkCoegl4HFGcTASsXGCktQD4cDSKTEwIBB5AWgiGgHnGEKIwijz6Ff?=
 =?us-ascii?q?Bozqm8LmH2OCoQJkkeEaYFoPIFHCwczGggbFYMiCUoZD44uCwuFX4MUxyYnM?=
 =?us-ascii?q?gIBAQcyAQEHAgcCDAMLgWiRfgEB?=
IronPort-Data: A9a23:3nr0NKhS2lZC2iwAHkdPVIN6X161NxEKZh0ujC45NGQN5FlHY01je
 htvWTuBafmLYmWgLotzbo62/RwPvZXUzNBjQVFqrC88QSxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxMuvjT8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUfwe9RLXwQ+
 MVJIW0gRz2um6W8wI20H7wEasQLdKEHPasFsX1miDWcBvE8TNWbHOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgt/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIePKofTH58Owi50o
 EqbxWnVBSAoC+eNwAKo6CqLpMr+lGD0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:BWaS2q+XkjUI/1qfBgluk+DuI+orL9Y04lQ7vn2ZLiYlF/Bw9v
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: 9a23:k6A51268AmUFPZycEtss83UdPOw4LHDknX6NDmaVJHouQr2qRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AKA9K6g7QlvHvNiwdLnBsz5CGxow12amCD3E/rq4?=
 =?us-ascii?q?UsvGpL3RXGRKshXe4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="528312234"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 16:27:14 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 2E91218000206
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 16:27:14 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id C646CCC1611; Mon, 28 Sep 2026 09:27:13 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] bison: Fix CVE-2026-56390
Date: Mon, 28 Sep 2026 09:27:13 -0700
Message-Id: <20260928162713.2651011-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 16:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246776

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=8d101c19d4d9aaedf83a448c925513742d4efcf0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56390

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../bison/bison/CVE-2026-56390.patch          | 236 ++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
 2 files changed, 237 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56390.patch

diff --git a/meta/recipes-devtools/bison/bison/CVE-2026-56390.patch b/meta/recipes-devtools/bison/bison/CVE-2026-56390.patch
new file mode 100644
index 0000000000..82a80a3a28
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/CVE-2026-56390.patch
@@ -0,0 +1,236 @@
+From 81b11844fcbc7abb3df91c629cd2f2c076f107cc Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 23 Apr 2026 12:41:25 -0700
+Subject: [PATCH] bison: tighten up output file names
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* src/parse-gram.y: Do not allow '/' in %header and %output directives.
+
+CVE: CVE-2026-56390
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=8d101c19d4d9aaedf83a448c925513742d4efcf0]
+
+Backport Changes:
+- Adapted generated src/parse-gram.c to the Bison 3.8.2 source tree.
+- omitted upstream generator-version/copyright metadata and
+  src/parse-gram.h-only metadata changes while retaining the
+  security-relevant parser changes.
+
+(cherry picked from commit 8d101c19d4d9aaedf83a448c925513742d4efcf0)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ THANKS           |  1 +
+ doc/bison.texi   |  2 ++
+ src/parse-gram.c | 56 ++++++++++++++++++++++++++++++++----------------
+ src/parse-gram.y | 31 ++++++++++++++++++++++-----
+ 4 files changed, 67 insertions(+), 23 deletions(-)
+
+diff --git a/THANKS b/THANKS
+index be743a23..0e481561 100644
+--- a/THANKS
++++ b/THANKS
+@@ -128,6 +128,7 @@ Michael Catanzaro         mcatanzaro@gnome.org
+ Michael Felt              mamfelt@gmail.com
+ Michael Hayes             m.hayes@elec.canterbury.ac.nz
+ Michael Raskin            7c6f434c@mail.ru
++Michał Majchrowicz        mmajchrowicz@afine.com
+ Michel d'Hooge            michel.dhooge@gmail.com
+ Michiel De Wilde          mdewilde.agilent@gmail.com
+ Mickael Labau             labau_m@epita.fr
+diff --git a/doc/bison.texi b/doc/bison.texi
+index a559649c..44a4e159 100644
+--- a/doc/bison.texi
++++ b/doc/bison.texi
+@@ -5973,6 +5973,7 @@ Introduced in Bison 3.8.
+ 
+ @deffn {Directive} %header @var{header-file}
+ Same as above, but save in the file @file{@var{header-file}}.
++The @var{header-file} name should not contain slashes.
+ @end deffn
+ 
+ @deffn {Directive} %language "@var{language}"
+@@ -6026,6 +6027,7 @@ file, treating it as an independent source file in its own right.
+ 
+ @deffn {Directive} %output "@var{file}"
+ Generate the parser implementation in @file{@var{file}}.
++The @var{file} name should not contain slashes.
+ @end deffn
+ 
+ @deffn {Directive} %pure-parser
+diff --git a/src/parse-gram.c b/src/parse-gram.c
+index 3c1d8229..7f6deb33 100644
+--- a/src/parse-gram.c
++++ b/src/parse-gram.c
+@@ -276,8 +276,11 @@ typedef enum yysymbol_kind_t yysymbol_kind_t;
+      string from the scanner (should be CODE). */
+   static char const *translate_code_braceless (char *code, location loc);
+ 
++  /* Is FILE a valid output file name?  */
++  static bool valid_output_file_name (char const *file);
++
+   /* Handle a %header directive.  */
+-  static void handle_header (char const *value);
++  static void handle_header (location const *loc, char const *value);
+ 
+   /* Handle a %error-verbose directive.  */
+   static void handle_error_verbose (location const *loc, char const *directive);
+@@ -663,19 +666,19 @@ union yyalloc
+ /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
+ static const yytype_int16 yyrline[] =
+ {
+-       0,   310,   310,   319,   320,   324,   325,   331,   335,   340,
+-     341,   342,   343,   344,   345,   350,   355,   356,   357,   358,
+-     359,   360,   360,   361,   362,   363,   364,   365,   366,   367,
+-     368,   372,   373,   382,   383,   387,   398,   402,   406,   414,
+-     424,   425,   435,   436,   442,   455,   455,   460,   460,   465,
+-     465,   470,   480,   481,   482,   483,   488,   489,   493,   494,
+-     499,   500,   504,   505,   509,   510,   511,   524,   533,   537,
+-     541,   549,   550,   554,   567,   568,   573,   574,   575,   593,
+-     597,   601,   609,   611,   616,   623,   633,   637,   641,   649,
+-     655,   668,   669,   675,   676,   677,   684,   684,   692,   693,
+-     694,   699,   702,   704,   706,   708,   710,   712,   714,   716,
+-     718,   723,   724,   733,   757,   758,   759,   760,   772,   774,
+-     798,   803,   804,   809,   817,   818
++       0,   314,   314,   323,   324,   328,   329,   335,   339,   344,
++     345,   346,   347,   348,   349,   354,   359,   360,   361,   362,
++     363,   372,   372,   373,   374,   375,   376,   377,   378,   379,
++     380,   384,   385,   394,   395,   399,   410,   414,   418,   426,
++     436,   437,   447,   448,   454,   467,   467,   472,   472,   477,
++     477,   482,   492,   493,   494,   495,   500,   501,   505,   506,
++     511,   512,   516,   517,   521,   522,   523,   536,   545,   549,
++     553,   561,   562,   566,   579,   580,   585,   586,   587,   605,
++     609,   613,   621,   623,   628,   635,   645,   649,   653,   661,
++     667,   680,   681,   687,   688,   689,   696,   696,   704,   705,
++     706,   711,   714,   716,   718,   720,   722,   724,   726,   728,
++     730,   735,   736,   745,   769,   770,   771,   772,   784,   786,
++     810,   815,   816,   821,   829,   830
+ };
+ #endif
+ 
+@@ -2217,7 +2220,7 @@ yyreduce:
+ 
+   case 9: /* prologue_declaration: "%header" string.opt  */
+ #line 340 "src/parse-gram.y"
+-                                   { handle_header ((yyvsp[0].yykind_75)); }
++                                   { handle_header (&(yylsp[0]), (yyvsp[0].yykind_75)); }
+ #line 2222 "src/parse-gram.c"
+     break;
+ 
+@@ -2289,7 +2292,14 @@ yyreduce:
+ 
+   case 20: /* prologue_declaration: "%output" "string"  */
+ #line 359 "src/parse-gram.y"
+-                                { spec_outfile = unquote ((yyvsp[0].STRING)); gram_scanner_last_string_free (); }
++    {
++      char *file = unquote ((yyvsp[0].STRING));
++      if (valid_output_file_name (file))
++        spec_outfile = file;
++      else
++        complain (&(yylsp[0]), complaint, _("invalid %%output file name ignored"));
++      gram_scanner_last_string_free ();
++    }
+ #line 2294 "src/parse-gram.c"
+     break;
+ 
+@@ -3290,14 +3300,24 @@ add_param (param_type type, char *decl, location loc)
+ }
+ 
+ 
++static bool
++valid_output_file_name (char const *file)
++{
++  return !strchr (file, '/');
++}
++
++
+ static void
+-handle_header (char const *value)
++handle_header (location const *loc, char const *value)
+ {
+   header_flag = true;
+   if (value)
+     {
+       char *file = unquote (value);
+-      spec_header_file = xstrdup (file);
++      if (valid_output_file_name (file))
++        spec_header_file = xstrdup (file);
++      else
++        complain (loc, complaint, _("invalid %%header file name ignored"));
+       gram_scanner_last_string_free ();
+       unquote_free (file);
+     }
+diff --git a/src/parse-gram.y b/src/parse-gram.y
+index 15180cb5..114c5c44 100644
+--- a/src/parse-gram.y
++++ b/src/parse-gram.y
+@@ -95,8 +95,11 @@
+      string from the scanner (should be CODE). */
+   static char const *translate_code_braceless (char *code, location loc);
+ 
++  /* Is FILE a valid output file name?  */
++  static bool valid_output_file_name (char const *file);
++
+   /* Handle a %header directive.  */
+-  static void handle_header (char const *value);
++  static void handle_header (location const *loc, char const *value);
+ 
+   /* Handle a %error-verbose directive.  */
+   static void handle_error_verbose (location const *loc, char const *directive);
+@@ -337,7 +340,7 @@ prologue_declaration:
+       muscle_percent_define_insert ($2, @$, $3.kind, $3.chars,
+                                     MUSCLE_PERCENT_DEFINE_GRAMMAR_FILE);
+     }
+-| "%header" string.opt             { handle_header ($2); }
++| "%header" string.opt             { handle_header (&@2, $2); }
+ | "%error-verbose"                 { handle_error_verbose (&@$, $1); }
+ | "%expect" INT_LITERAL            { expected_sr_conflicts = $2; }
+ | "%expect-rr" INT_LITERAL         { expected_rr_conflicts = $2; }
+@@ -356,7 +359,15 @@ prologue_declaration:
+ | "%name-prefix" STRING         { handle_name_prefix (&@$, $1, $2); }
+ | "%no-lines"                   { no_lines_flag = true; }
+ | "%nondeterministic-parser"    { nondeterministic_parser = true; }
+-| "%output" STRING              { spec_outfile = unquote ($2); gram_scanner_last_string_free (); }
++| "%output" STRING
++    {
++      char *file = unquote ($2);
++      if (valid_output_file_name (file))
++        spec_outfile = file;
++      else
++        complain (&@2, complaint, _("invalid %%output file name ignored"));
++      gram_scanner_last_string_free ();
++    }
+ | "%param" { current_param = $1; } params { current_param = param_none; }
+ | "%pure-parser"                { handle_pure_parser (&@$, $1); }
+ | "%require" STRING             { handle_require (&@2, $2); }
+@@ -952,14 +963,24 @@ add_param (param_type type, char *decl, location loc)
+ }
+ 
+ 
++static bool
++valid_output_file_name (char const *file)
++{
++  return !strchr (file, '/');
++}
++
++
+ static void
+-handle_header (char const *value)
++handle_header (location const *loc, char const *value)
+ {
+   header_flag = true;
+   if (value)
+     {
+       char *file = unquote (value);
+-      spec_header_file = xstrdup (file);
++      if (valid_output_file_name (file))
++        spec_header_file = xstrdup (file);
++      else
++        complain (loc, complaint, _("invalid %%header file name ignored"));
+       gram_scanner_last_string_free ();
+       unquote_free (file);
+     }
+-- 
+2.44.4
+
diff --git a/meta/recipes-devtools/bison/bison_3.8.2.bb b/meta/recipes-devtools/bison/bison_3.8.2.bb
index 9808a96e99..08962ae133 100644
--- a/meta/recipes-devtools/bison/bison_3.8.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://autoconf-2.73.patch \
            file://add-with-bisonlocaledir.patch \
            file://CVE-2026-56389.patch \
+           file://CVE-2026-56390.patch \
            "
 SRC_URI[sha256sum] = "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2"
 
-- 
2.44.4


