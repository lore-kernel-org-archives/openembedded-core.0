Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D02CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:10:36 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15000.1792127435689611563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h4WcLu6M;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9939; q=dns/txt;
  s=iport01; t=1792127435; x=1793337035;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zn3WKjtvxKldF3GBMnaCIlSoSQNH1SA8VzZrVXw7Q4A=;
  b=h4WcLu6Mdz5ymyThybF6prYFVDTqQDVxDsohml7bUkZti6h3gTi66W0J
   Mqv+R718dj+qBTAwoBTEetSfqlhLlsiIYqXD1os62Wz4fML/PQrCErg6N
   mdDO9AF118CpIgo4E0aVFSFU+/hJrYqsFpNDC8yOeWW3Toa/lC5GyJSMd
   7p9D6RhfpsC+uEqaruBehpRsEOZDMfqowND8+9sZJ6gsKFOB8ggzGlWsa
   bME9OV4j5v4ezFZyDZ7fEw+zjpuDjLFHRzg1mhax90D+C/3K7JXfmyfNm
   36DJBU1Yyc03KRvkXV6OKAERngJhqchOoHhiGnFmaoXOXQIY/20HaGFTU
   w==;
X-CSE-ConnectionGUID: +vgylntWSOiB/SYYCoweUQ==
X-CSE-MsgGUID: G6xRw2G3SzOOAnaRcJjYoQ==
X-IPAS-Result: =?us-ascii?q?A0BbAgDnsNFq/5D/Ja1aglmCV3VgQ0mEV49SgiGLaJI3F?=
 =?us-ascii?q?IFqDwEBAQ9EDQQBAZMcAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASASkPARgBWQMBAgMCJgIiCyMYCYMCAYI6AzcDEbxjeoEyg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsNCGqBaAELFAGBCi6FQIJ/IAGFA10YAUSEOCcbgUlEgRWDa?=
 =?us-ascii?q?YEFgRpCAQMYgQkbAQGDe4JqBIMcEoFaHjKUd0iBAhwDWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XL1gbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAA?=
 =?us-ascii?q?gFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNS?=
 =?us-ascii?q?BEsNxUZBD0BbgeSFB6CXgcUZxMBKxcYKS1APhwNIpMTAgEHkBWCIaAecYQoj?=
 =?us-ascii?q?CKPPoV8GjOqbwuYfY4KhAmSRoRpgWg8gUcLBzMaCBsVgyIJShkPji4LC4Vfg?=
 =?us-ascii?q?xTJRycyAgEBBzMBBwIHAgwDgXORfgEB?=
IronPort-Data: A9a23:eKfnF61ljpVyFdlxQfbD5YRwkn2cJEfYwER7XKvMYLTBsI5bp2MGy
 TBOW2/QbPjbMTHyeYt/Otu+8x4E7MfQzYQwGlNo3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGT185LIke5tlMJmBks
 scpGRsKcR2+vrfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsi+WwYYKKKoziqcN9sRiIn
 H2c0D/CEDY9HdqW8zGn8EOrv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:64zyaK/kbGlSbMb8YCZuk+DuI+orL9Y04lQ7vn2ZLiYlF/Bw9v
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3AeTb2sWqHZscqC5Yn9M6lJhPmUYM7fWzZymvvGGi?=
 =?us-ascii?q?5IyFSeYy+TkCdxZoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AzM8bjQwC89wDx/0wkKVfmapfCQWaqIvwGHoSy7p?=
 =?us-ascii?q?dgNujEgV2Mg2WrjaGRbZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535590788"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:10:34 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 8B46518000231
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:10:34 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 31B89CC1611; Thu, 15 Oct 2026 22:10:34 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] bison: Fix CVE-2026-56390
Date: Thu, 15 Oct 2026 22:10:33 -0700
Message-Id: <20261016051033.174566-1-yurade@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247925

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
index 0000000000..a63f3952e3
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/CVE-2026-56390.patch
@@ -0,0 +1,236 @@
+From 8d101c19d4d9aaedf83a448c925513742d4efcf0 Mon Sep 17 00:00:00 2001
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
+ src/parse-gram.y | 31 ++++++++++++++++++++++-----
+ src/parse-gram.c | 56 ++++++++++++++++++++++++++++++++----------------
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
+-- 
+2.44.4
+
diff --git a/meta/recipes-devtools/bison/bison_3.8.2.bb b/meta/recipes-devtools/bison/bison_3.8.2.bb
index 03d3cffe2a..339a9d1336 100644
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
2.51.0


