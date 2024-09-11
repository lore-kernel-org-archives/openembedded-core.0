Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6B3EE57EA
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:23:37 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.35246.1726097014625104141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bGFCAvNX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71781f42f75so248835b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097014; x=1726701814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8C1c4n9Uos5awsVRWmOmZ6nj/98EEU/BeZFMvuklYs=;
        b=bGFCAvNXgmpgbT4hXu7AIwYQIN2+ZqPTkLvpmB/+mGGZudFbJNbLmaYe1csem0hR3D
         yZk54IxKdd4YJchxFrSJv2FycauuBnB1zrqbRIgwHp4jI7TexQ0HV/VPuc2HGwfVWmHo
         VTGjHv3M7Y8/UvdvCsqUkVUbYslob1W3NGE105UOGi0gaIxONSa1Gta64c5OsYl+sKnz
         4aSN5hJd39e7I5W8CwXfZHW5vOFj/nHhkhIdS/ZRuwzQZxMvPhLRf1eRt3Ke+egpjpxQ
         g3AYriInftzGEAX1z/6Dbg5MWt9GgiG3p0jbF0CoNM4wz9kAQCxGm9wTj7pcotMlwu+u
         PdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097014; x=1726701814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8C1c4n9Uos5awsVRWmOmZ6nj/98EEU/BeZFMvuklYs=;
        b=QSjmHZ7JaYIuafbLYPVapIJ1mCXlFrya534cF1mS9y9/y/qqxs+RHiRV8JbccrYdXY
         c9GVljD/mQ5fXkz/oPC8/aDeSeZtxzUSTQiO/KdqpnXnG7JsM/oskZ83en6FR8LmdXrw
         2BglpSFeKEpNumBxJQgqboauwA1pol0kfaoxN71py0ysmnW3mfLdi9n9TxqhwJmKISwU
         BdUa3MqRUYO80oyCtcw5Mp13TLCReYc0fquUHBvfH2il0bBTMh8uSXxAHBV6E9KdZOFX
         kcEUmDzKo9MUsAcwnaF4crfZLwA6Hq5YbawFgi+/ybQsrY/wV6W4/PCXfTFw7dyTsbkY
         dXOQ==
X-Gm-Message-State: AOJu0YwlhTg+kVQz9HcVOjpa+UD7r908rBq6AIgP7DLqGU03MjCiD4J3
	IAwE9yuoRwcrPReyPxDdHoTpeZTYAuu1AeJjbZCu2m6b9Sip56npZTqRKelr2x3BxqD9JbSzTVc
	0
X-Google-Smtp-Source: AGHT+IGL9y00Bgd0eOTGNvQLNL8+ToaK84bdKzMEvrrjxn1OmDM7vlyiKadKV/74avoKA42cnG5tpA==
X-Received: by 2002:a05:6a00:1906:b0:70d:2621:5808 with SMTP id d2e1a72fcca58-7192607fcb9mr1398098b3a.9.1726097013553;
        Wed, 11 Sep 2024 16:23:33 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/22] expat: fix CVE-2024-45490
Date: Wed, 11 Sep 2024 16:23:01 -0700
Message-Id: <26b6c87fc2c2b4b4860c6c8b1f4892dfd2d3b30e.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204398

From: Archana Polampalli <archana.polampalli@windriver.com>

An issue was discovered in libexpat before 2.6.3. xmlparse.c does not reject
a negative length for XML_ParseBuffer.

Added tests patch and its dependent patch[c803b93e8736e]

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2024-45490-0001.patch     |  35 +++
 .../expat/expat/CVE-2024-45490-0002.patch     | 250 ++++++++++++++++++
 .../expat/expat/CVE-2024-45490-0003.patch     |  91 +++++++
 .../expat/expat/CVE-2024-45490-0004.patch     |  49 ++++
 meta/recipes-core/expat/expat_2.5.0.bb        |   4 +
 5 files changed, 429 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45490-0001.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45490-0002.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45490-0003.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45490-0004.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2024-45490-0001.patch b/meta/recipes-core/expat/expat/CVE-2024-45490-0001.patch
new file mode 100644
index 0000000000..acdeb5b7df
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-45490-0001.patch
@@ -0,0 +1,35 @@
+From 1d4f03d21b4f42031716522a6b96346b7a60d4c4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 19 Aug 2024 22:26:07 +0200
+Subject: [PATCH] lib: Reject negative len for XML_ParseBuffer
+
+Reported by TaiYou
+
+CVE: CVE-2024-45490
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5c1a31642e243f4870c0bd1f2afc7597976521bf]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/xmlparse.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9984d02..6f0440b 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1996,6 +1996,12 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
+
+   if (parser == NULL)
+     return XML_STATUS_ERROR;
++
++  if (len < 0) {
++    parser->m_errorCode = XML_ERROR_INVALID_ARGUMENT;
++    return XML_STATUS_ERROR;
++  }
++
+   switch (parser->m_parsingStatus.parsing) {
+   case XML_SUSPENDED:
+     parser->m_errorCode = XML_ERROR_SUSPENDED;
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2024-45490-0002.patch b/meta/recipes-core/expat/expat/CVE-2024-45490-0002.patch
new file mode 100644
index 0000000000..6be8771a59
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-45490-0002.patch
@@ -0,0 +1,250 @@
+From c803b93e8736ed255ff1a6db5ab6add7ccea736c Mon Sep 17 00:00:00 2001
+From: Snild Dolkow <snild@sony.com>
+Date: Fri, 25 Aug 2023 14:49:29 +0200
+Subject: [PATCH] minicheck: Add simple subtest support
+
+This will be useful when a test runs through several examples and
+fails somewhere in the middle. The subtest string replaces the
+phase_info string (i.e. "during actual test") in the failure output.
+
+Added subtest info to various tests where I found for loops.
+
+CVE: CVE-2024-45490
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/c803b93e8736ed255ff1a6db5ab6add7ccea736c]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ tests/minicheck.c | 25 +++++++++++++++++++++++++
+ tests/minicheck.h | 16 ++++++++++++++++
+ tests/runtests.c  | 13 +++++++++++++
+ 3 files changed, 54 insertions(+)
+
+diff --git a/tests/minicheck.c b/tests/minicheck.c
+index 1c65748..46db355 100644
+--- a/tests/minicheck.c
++++ b/tests/minicheck.c
+@@ -15,6 +15,7 @@
+    Copyright (c) 2017      Rhodri James <rhodri@wildebeest.org.uk>
+    Copyright (c) 2018      Marco Maggi <marco.maggi-ipsu@poste.it>
+    Copyright (c) 2019      David Loffredo <loffredo@steptools.com>
++   Copyright (c) 2023      Sony Corporation / Snild Dolkow <snild@sony.com>
+    Licensed under the MIT license:
+
+    Permission is  hereby granted,  free of charge,  to any  person obtaining
+@@ -37,6 +38,7 @@
+    USE OR OTHER DEALINGS IN THE SOFTWARE.
+ */
+
++#include <stdarg.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <setjmp.h>
+@@ -132,17 +134,35 @@ srunner_create(Suite *suite) {
+
+ static jmp_buf env;
+
++#define SUBTEST_LEN (50) // informative, but not too long
+ static char const *_check_current_function = NULL;
++static char _check_current_subtest[SUBTEST_LEN];
+ static int _check_current_lineno = -1;
+ static char const *_check_current_filename = NULL;
+
+ void
+ _check_set_test_info(char const *function, char const *filename, int lineno) {
+   _check_current_function = function;
++  set_subtest("%s", "");
+   _check_current_lineno = lineno;
+   _check_current_filename = filename;
+ }
+
++void
++set_subtest(char const *fmt, ...) {
++  va_list ap;
++  va_start(ap, fmt);
++  vsnprintf(_check_current_subtest, SUBTEST_LEN, fmt, ap);
++  va_end(ap);
++  // replace line feeds with spaces, for nicer error logs
++  for (size_t i = 0; i < SUBTEST_LEN; ++i) {
++    if (_check_current_subtest[i] == '\n') {
++      _check_current_subtest[i] = ' ';
++    }
++  }
++  _check_current_subtest[SUBTEST_LEN - 1] = '\0'; // ensure termination
++}
++
+ static void
+ handle_success(int verbosity) {
+   if (verbosity >= CK_VERBOSE) {
+@@ -154,6 +174,9 @@ static void
+ handle_failure(SRunner *runner, int verbosity, const char *phase_info) {
+   runner->nfailures++;
+   if (verbosity != CK_SILENT) {
++    if (strlen(_check_current_subtest) != 0) {
++      phase_info = _check_current_subtest;
++    }
+     printf("FAIL: %s (%s at %s:%d)\n", _check_current_function, phase_info,
+            _check_current_filename, _check_current_lineno);
+   }
+@@ -170,6 +193,7 @@ srunner_run_all(SRunner *runner, int verbosity) {
+     volatile int i;
+     for (i = 0; i < tc->ntests; ++i) {
+       runner->nchecks++;
++      set_subtest("%s", "");
+
+       if (tc->setup != NULL) {
+         /* setup */
+@@ -185,6 +209,7 @@ srunner_run_all(SRunner *runner, int verbosity) {
+         continue;
+       }
+       (tc->tests[i])();
++      set_subtest("%s", "");
+
+       /* teardown */
+       if (tc->teardown != NULL) {
+diff --git a/tests/minicheck.h b/tests/minicheck.h
+index cc1f835..a0ff333 100644
+--- a/tests/minicheck.h
++++ b/tests/minicheck.h
+@@ -15,6 +15,7 @@
+    Copyright (c) 2004-2006 Fred L. Drake, Jr. <fdrake@users.sourceforge.net>
+    Copyright (c) 2006-2012 Karl Waclawek <karl@waclawek.net>
+    Copyright (c) 2016-2017 Sebastian Pipping <sebastian@pipping.org>
++   Copyright (c) 2023      Sony Corporation / Snild Dolkow <snild@sony.com>
+    Licensed under the MIT license:
+
+    Permission is  hereby granted,  free of charge,  to any  person obtaining
+@@ -56,6 +57,19 @@ extern "C" {
+ #  define __func__ __FUNCTION__
+ #endif
+
++/* PRINTF_LIKE has two effects:
++    1. Make clang's -Wformat-nonliteral stop warning about non-literal format
++       strings in annotated functions' code.
++    2. Make both clang and gcc's -Wformat-nonliteral warn about *callers* of
++       the annotated function that use a non-literal format string.
++*/
++#  if defined(__GNUC__)
++#    define PRINTF_LIKE(fmtpos, argspos)                                       \
++      __attribute__((format(printf, fmtpos, argspos)))
++#  else
++#    define PRINTF_LIKE(fmtpos, argspos)
++#  endif
++
+ #define START_TEST(testname)                                                   \
+   static void testname(void) {                                                 \
+     _check_set_test_info(__func__, __FILE__, __LINE__);                        \
+@@ -64,6 +78,8 @@ extern "C" {
+   }                                                                            \
+   }
+
++void PRINTF_LIKE(1, 2) set_subtest(char const *fmt, ...);
++
+ #define fail(msg) _fail_unless(0, __FILE__, __LINE__, msg)
+
+ typedef void (*tcase_setup_function)(void);
+diff --git a/tests/runtests.c b/tests/runtests.c
+index 915fa52..3e610f7 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -18,6 +18,7 @@
+    Copyright (c) 2019      David Loffredo <loffredo@steptools.com>
+    Copyright (c) 2020      Tim Gates <tim.gates@iress.com>
+    Copyright (c) 2021      Dong-hee Na <donghee.na@python.org>
++   Copyright (c) 2023      Sony Corporation / Snild Dolkow <snild@sony.com>
+    Licensed under the MIT license:
+
+    Permission is  hereby granted,  free of charge,  to any  person obtaining
+@@ -1804,6 +1805,7 @@ START_TEST(test_ext_entity_invalid_parse) {
+   const ExtFaults *fault = faults;
+
+   for (; fault->parse_text != NULL; fault++) {
++    set_subtest("\"%s\"", fault->parse_text);
+     XML_SetParamEntityParsing(g_parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
+     XML_SetExternalEntityRefHandler(g_parser, external_entity_faulter);
+     XML_SetUserData(g_parser, (void *)fault);
+@@ -1904,6 +1906,7 @@ START_TEST(test_dtd_attr_handling) {
+   AttTest *test;
+
+   for (test = attr_data; test->definition != NULL; test++) {
++    set_subtest("%s", test->definition);
+     XML_SetAttlistDeclHandler(g_parser, verify_attlist_decl_handler);
+     XML_SetUserData(g_parser, test);
+     if (_XML_Parse_SINGLE_BYTES(g_parser, prolog, (int)strlen(prolog),
+@@ -2356,6 +2359,7 @@ START_TEST(test_bad_cdata) {
+
+   size_t i = 0;
+   for (; i < sizeof(cases) / sizeof(struct CaseData); i++) {
++    set_subtest("%s", cases[i].text);
+     const enum XML_Status actualStatus = _XML_Parse_SINGLE_BYTES(
+         g_parser, cases[i].text, (int)strlen(cases[i].text), XML_TRUE);
+     const enum XML_Error actualError = XML_GetErrorCode(g_parser);
+@@ -2423,6 +2427,7 @@ START_TEST(test_bad_cdata_utf16) {
+   size_t i;
+
+   for (i = 0; i < sizeof(cases) / sizeof(struct CaseData); i++) {
++    set_subtest("case %lu", (long unsigned)(i + 1));
+     enum XML_Status actual_status;
+     enum XML_Error actual_error;
+
+@@ -3323,6 +3328,7 @@ START_TEST(test_ext_entity_invalid_suspended_parse) {
+   ExtFaults *fault;
+
+   for (fault = &faults[0]; fault->parse_text != NULL; fault++) {
++    set_subtest("%s", fault->parse_text);
+     XML_SetParamEntityParsing(g_parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
+     XML_SetExternalEntityRefHandler(g_parser,
+                                     external_entity_suspending_faulter);
+@@ -4311,6 +4317,7 @@ START_TEST(test_bad_ignore_section) {
+   ExtFaults *fault;
+
+   for (fault = &faults[0]; fault->parse_text != NULL; fault++) {
++    set_subtest("%s", fault->parse_text);
+     XML_SetParamEntityParsing(g_parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
+     XML_SetExternalEntityRefHandler(g_parser, external_entity_faulter);
+     XML_SetUserData(g_parser, fault);
+@@ -4400,6 +4407,7 @@ START_TEST(test_external_entity_values) {
+   int i;
+
+   for (i = 0; data_004_2[i].parse_text != NULL; i++) {
++    set_subtest("%s", data_004_2[i].parse_text);
+     XML_SetParamEntityParsing(g_parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
+     XML_SetExternalEntityRefHandler(g_parser, external_entity_valuer);
+     XML_SetUserData(g_parser, &data_004_2[i]);
+@@ -7585,6 +7593,7 @@ START_TEST(test_ns_separator_in_uri) {
+   size_t i = 0;
+   size_t failCount = 0;
+   for (; i < sizeof(cases) / sizeof(cases[0]); i++) {
++    set_subtest("%s", cases[i].doc);
+     XML_Parser parser = XML_ParserCreateNS(NULL, cases[i].namesep);
+     XML_SetElementHandler(parser, dummy_start_element, dummy_end_element);
+     if (XML_Parse(parser, cases[i].doc, (int)strlen(cases[i].doc),
+@@ -7932,6 +7941,7 @@ START_TEST(test_misc_deny_internal_entity_closing_doctype_issue_317) {
+   size_t inputIndex = 0;
+
+   for (; inputIndex < sizeof(inputs) / sizeof(inputs[0]); inputIndex++) {
++    set_subtest("%s", inputs[inputIndex]);
+     XML_Parser parser;
+     enum XML_Status parseResult;
+     int setParamEntityResult;
+@@ -12078,6 +12088,7 @@ START_TEST(test_helper_unsigned_char_to_printable) {
+   // Smoke test
+   unsigned char uc = 0;
+   for (; uc < (unsigned char)-1; uc++) {
++    set_subtest("char %u", (unsigned)uc);
+     const char *const printable = unsignedCharToPrintable(uc);
+     if (printable == NULL)
+       fail("unsignedCharToPrintable returned NULL");
+@@ -12086,8 +12097,10 @@ START_TEST(test_helper_unsigned_char_to_printable) {
+   }
+
+   // Two concrete samples
++  set_subtest("char 'A'");
+   if (strcmp(unsignedCharToPrintable('A'), "A") != 0)
+     fail("unsignedCharToPrintable result mistaken");
++  set_subtest("char '\\'");
+   if (strcmp(unsignedCharToPrintable('\\'), "\\\\") != 0)
+     fail("unsignedCharToPrintable result mistaken");
+ }
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2024-45490-0003.patch b/meta/recipes-core/expat/expat/CVE-2024-45490-0003.patch
new file mode 100644
index 0000000000..276badc80b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-45490-0003.patch
@@ -0,0 +1,91 @@
+From c12f039b8024d6b9a11c20858370495ff6ff5245 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 20 Aug 2024 22:57:12 +0200
+Subject: [PATCH] tests: Cover "len < 0" for both XML_Parse and XML_ParseBuffer
+
+CVE: CVE-2024-45490
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/c12f039b8024d6b9a11c20858370495ff6ff5245]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ tests/runtests.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 57 insertions(+)
+
+diff --git a/tests/runtests.c b/tests/runtests.c
+index 915fa52..2479341 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -3813,6 +3813,61 @@ START_TEST(test_empty_parse) {
+ }
+ END_TEST
+
++/* Test XML_Parse for len < 0 */
++START_TEST(test_negative_len_parse) {
++  const char *const doc = "<root/>";
++  for (int isFinal = 0; isFinal < 2; isFinal++) {
++    set_subtest("isFinal=%d", isFinal);
++
++    XML_Parser parser = XML_ParserCreate(NULL);
++
++    if (XML_GetErrorCode(parser) != XML_ERROR_NONE)
++      fail("There was not supposed to be any initial parse error.");
++
++    const enum XML_Status status = XML_Parse(parser, doc, -1, isFinal);
++
++    if (status != XML_STATUS_ERROR)
++      fail("Negative len was expected to fail the parse but did not.");
++
++    if (XML_GetErrorCode(parser) != XML_ERROR_INVALID_ARGUMENT)
++      fail("Parse error does not match XML_ERROR_INVALID_ARGUMENT.");
++
++    XML_ParserFree(parser);
++  }
++}
++END_TEST
++
++/* Test XML_ParseBuffer for len < 0 */
++START_TEST(test_negative_len_parse_buffer) {
++  const char *const doc = "<root/>";
++  for (int isFinal = 0; isFinal < 2; isFinal++) {
++    set_subtest("isFinal=%d", isFinal);
++
++    XML_Parser parser = XML_ParserCreate(NULL);
++
++    if (XML_GetErrorCode(parser) != XML_ERROR_NONE)
++      fail("There was not supposed to be any initial parse error.");
++
++    void *const buffer = XML_GetBuffer(parser, (int)strlen(doc));
++
++    if (buffer == NULL)
++      fail("XML_GetBuffer failed.");
++
++    memcpy(buffer, doc, strlen(doc));
++
++    const enum XML_Status status = XML_ParseBuffer(parser, -1, isFinal);
++
++    if (status != XML_STATUS_ERROR)
++      fail("Negative len was expected to fail the parse but did not.");
++
++    if (XML_GetErrorCode(parser) != XML_ERROR_INVALID_ARGUMENT)
++      fail("Parse error does not match XML_ERROR_INVALID_ARGUMENT.");
++
++    XML_ParserFree(parser);
++  }
++}
++END_TEST
++
+ /* Test odd corners of the XML_GetBuffer interface */
+ static enum XML_Status
+ get_feature(enum XML_FeatureEnum feature_id, long *presult) {
+@@ -12214,6 +12269,8 @@ make_suite(void) {
+   tcase_add_test__ifdef_xml_dtd(tc_basic, test_user_parameters);
+   tcase_add_test__ifdef_xml_dtd(tc_basic, test_ext_entity_ref_parameter);
+   tcase_add_test(tc_basic, test_empty_parse);
++  tcase_add_test(tc_basic, test_negative_len_parse);
++  tcase_add_test(tc_basic, test_negative_len_parse_buffer);
+   tcase_add_test(tc_basic, test_get_buffer_1);
+   tcase_add_test(tc_basic, test_get_buffer_2);
+ #if defined(XML_CONTEXT_BYTES)
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2024-45490-0004.patch b/meta/recipes-core/expat/expat/CVE-2024-45490-0004.patch
new file mode 100644
index 0000000000..e769182087
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-45490-0004.patch
@@ -0,0 +1,49 @@
+From 2db233019f551fe4c701bbbc5eb0fa58ff349daa Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 25 Aug 2024 19:09:51 +0200
+Subject: [PATCH] doc: Document that XML_Parse/XML_ParseBuffer reject "len < 0"
+
+CVE: CVE-2024-45490
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2db233019f551fe4c701bbbc5eb0fa58ff349daa]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ doc/reference.html | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/doc/reference.html b/doc/reference.html
+index cdf3983..ebae824 100644
+--- a/doc/reference.html
++++ b/doc/reference.html
+@@ -1097,7 +1097,9 @@ containing part (or perhaps all) of the document. The number of bytes of s
+ that are part of the document is indicated by <code>len</code>. This means
+ that <code>s</code> doesn't have to be null terminated. It also means that
+ if <code>len</code> is larger than the number of bytes in the block of
+-memory that <code>s</code> points at, then a memory fault is likely. The
++memory that <code>s</code> points at, then a memory fault is likely.
++Negative values for <code>len</code> are rejected since Expat 2.2.1.
++The
+ <code>isFinal</code> parameter informs the parser that this is the last
+ piece of the document. Frequently, the last piece is empty (i.e.
+ <code>len</code> is zero.)
+@@ -1113,11 +1115,17 @@ XML_ParseBuffer(XML_Parser p,
+                 int isFinal);
+ </pre>
+ <div class="fcndef">
++<p>
+ This is just like <code><a href= "#XML_Parse" >XML_Parse</a></code>,
+ except in this case Expat provides the buffer.  By obtaining the
+ buffer from Expat with the <code><a href= "#XML_GetBuffer"
+ >XML_GetBuffer</a></code> function, the application can avoid double
+ copying of the input.
++</p>
++
++<p>
++Negative values for <code>len</code> are rejected since Expat 2.6.3.
++</p>
+ </div>
+
+ <h4 id="XML_GetBuffer">XML_GetBuffer</h4>
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.5.0.bb
index 31e989cfe2..24d5c85d74 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -22,6 +22,10 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 	   file://CVE-2023-52426-009.patch \
 	   file://CVE-2023-52426-010.patch \
 	   file://CVE-2023-52426-011.patch \
+	   file://CVE-2024-45490-0001.patch \
+	   file://CVE-2024-45490-0002.patch \
+	   file://CVE-2024-45490-0003.patch \
+	   file://CVE-2024-45490-0004.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.34.1


