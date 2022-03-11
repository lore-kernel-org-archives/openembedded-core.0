Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD02C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 13:58:43 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.5355.1647007121937234386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 05:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22BDwfMT020196
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 05:58:41 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 11 Mar 2022 05:58:41 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 11 Mar 2022 05:58:40 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 2/2] expat: fix CVE-2022-25236
Date: Fri, 11 Mar 2022 21:58:35 +0800
Message-ID: <20220311135835.4954-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220311135835.4954-1-kai.kang@windriver.com>
References: <20220311135835.4954-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 13:58:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163053

From: Kai Kang <kai.kang@windriver.com>

Backport patches to fix CVE-2022-25236 for expat.

CVE: CVE-2022-25236

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../expat/expat/CVE-2022-25236-1.patch        | 116 +++++++++
 .../expat/expat/CVE-2022-25236-2.patch        | 232 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |   2 +
 3 files changed, 350 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25236-1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25236-2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-25236-1.patch b/meta/recipes-core/expat/expat/CVE-2022-25236-1.patch
new file mode 100644
index 0000000000..ab53d99c8f
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25236-1.patch
@@ -0,0 +1,116 @@
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2cc97e87]
+CVE: CVE-2022-25236
+
+The commit is a merge commit, and this patch is created by:
+
+$ git diff -p --stat 2cc97e87~ 2cc97e87
+
+Remove modification for expat/Changes which fails to be applied.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+commit 2cc97e875ef84da4bcf55156c83599116f7523b4 (from d477fdd284468f2ab822024e75702f2c1b254f42)
+Merge: d477fdd2 e4d7e497
+Author: Sebastian Pipping <sebastian@pipping.org>
+Date:   Fri Feb 18 18:01:27 2022 +0100
+
+    Merge pull request #561 from libexpat/namesep-security
+    
+    [CVE-2022-25236] lib: Protect against insertion of namesep characters into namespace URIs
+
+---
+ expat/Changes          | 16 ++++++++++++++++
+ expat/lib/xmlparse.c   | 17 +++++++++++++----
+ expat/tests/runtests.c | 30 ++++++++++++++++++++++++++++++
+ 3 files changed, 59 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 7376aab1..c98e2e9f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -718,8 +718,7 @@ XML_ParserCreate(const XML_Char *encodingName) {
+ 
+ XML_Parser XMLCALL
+ XML_ParserCreateNS(const XML_Char *encodingName, XML_Char nsSep) {
+-  XML_Char tmp[2];
+-  *tmp = nsSep;
++  XML_Char tmp[2] = {nsSep, 0};
+   return XML_ParserCreate_MM(encodingName, NULL, tmp);
+ }
+ 
+@@ -1344,8 +1343,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+      would be otherwise.
+   */
+   if (parser->m_ns) {
+-    XML_Char tmp[2];
+-    *tmp = parser->m_namespaceSeparator;
++    XML_Char tmp[2] = {parser->m_namespaceSeparator, 0};
+     parser = parserCreate(encodingName, &parser->m_mem, tmp, newDtd);
+   } else {
+     parser = parserCreate(encodingName, &parser->m_mem, NULL, newDtd);
+@@ -3761,6 +3759,17 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+     if (! mustBeXML && isXMLNS
+         && (len > xmlnsLen || uri[len] != xmlnsNamespace[len]))
+       isXMLNS = XML_FALSE;
++
++    // NOTE: While Expat does not validate namespace URIs against RFC 3986,
++    //       we have to at least make sure that the XML processor on top of
++    //       Expat (that is splitting tag names by namespace separator into
++    //       2- or 3-tuples (uri-local or uri-local-prefix)) cannot be confused
++    //       by an attacker putting additional namespace separator characters
++    //       into namespace declarations.  That would be ambiguous and not to
++    //       be expected.
++    if (parser->m_ns && (uri[len] == parser->m_namespaceSeparator)) {
++      return XML_ERROR_SYNTAX;
++    }
+   }
+   isXML = isXML && len == xmlLen;
+   isXMLNS = isXMLNS && len == xmlnsLen;
+diff --git a/tests/runtests.c b/tests/runtests.c
+index d07203f2..bc5344b1 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -7220,6 +7220,35 @@ START_TEST(test_ns_double_colon_doctype) {
+ }
+ END_TEST
+ 
++START_TEST(test_ns_separator_in_uri) {
++  struct test_case {
++    enum XML_Status expectedStatus;
++    const char *doc;
++  };
++  struct test_case cases[] = {
++      {XML_STATUS_OK, "<doc xmlns='one_two' />"},
++      {XML_STATUS_ERROR, "<doc xmlns='one&#x0A;two' />"},
++  };
++
++  size_t i = 0;
++  size_t failCount = 0;
++  for (; i < sizeof(cases) / sizeof(cases[0]); i++) {
++    XML_Parser parser = XML_ParserCreateNS(NULL, '\n');
++    XML_SetElementHandler(parser, dummy_start_element, dummy_end_element);
++    if (XML_Parse(parser, cases[i].doc, (int)strlen(cases[i].doc),
++                  /*isFinal*/ XML_TRUE)
++        != cases[i].expectedStatus) {
++      failCount++;
++    }
++    XML_ParserFree(parser);
++  }
++
++  if (failCount) {
++    fail("Namespace separator handling is broken");
++  }
++}
++END_TEST
++
+ /* Control variable; the number of times duff_allocator() will successfully
+  * allocate */
+ #define ALLOC_ALWAYS_SUCCEED (-1)
+@@ -11905,6 +11934,7 @@ make_suite(void) {
+   tcase_add_test(tc_namespace, test_ns_utf16_doctype);
+   tcase_add_test(tc_namespace, test_ns_invalid_doctype);
+   tcase_add_test(tc_namespace, test_ns_double_colon_doctype);
++  tcase_add_test(tc_namespace, test_ns_separator_in_uri);
+ 
+   suite_add_tcase(s, tc_misc);
+   tcase_add_checked_fixture(tc_misc, NULL, basic_teardown);
diff --git a/meta/recipes-core/expat/expat/CVE-2022-25236-2.patch b/meta/recipes-core/expat/expat/CVE-2022-25236-2.patch
new file mode 100644
index 0000000000..0f14c9631b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25236-2.patch
@@ -0,0 +1,232 @@
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/f178826b]
+CVE: CVE-2022-25236
+
+The commit is a merge commit, and this patch is created by:
+
+$ git show -m -p --stat f178826b
+
+Remove changes for expat/Changes and reference.html which fail to be applied.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+commit f178826bb1e9c8ee23202f1be55ad4ac7b649e84 (from c99e0e7f2b15b48848038992ecbb4480f957cfe9)
+Merge: c99e0e7f 9579f7ea
+Author: Sebastian Pipping <sebastian@pipping.org>
+Date:   Fri Mar 4 18:43:39 2022 +0100
+
+    Merge pull request #577 from libexpat/namesep
+    
+    lib: Relax fix to CVE-2022-25236 with regard to RFC 3986 URI characters (fixes #572)
+---
+ expat/Changes            |  16 ++++++
+ expat/doc/reference.html |   8 +++
+ expat/lib/expat.h        |  11 ++++
+ expat/lib/xmlparse.c     | 139 ++++++++++++++++++++++++++++++++++++++++++++---
+ expat/tests/runtests.c   |   8 ++-
+ 5 files changed, 171 insertions(+), 11 deletions(-)
+
+diff --git a/lib/expat.h b/lib/expat.h
+index 5ab493f7..181fc960 100644
+--- a/lib/expat.h
++++ b/lib/expat.h
+@@ -239,6 +239,17 @@ XML_ParserCreate(const XML_Char *encoding);
+    and the local part will be concatenated without any separator.
+    It is a programming error to use the separator '\0' with namespace
+    triplets (see XML_SetReturnNSTriplet).
++   If a namespace separator is chosen that can be part of a URI or
++   part of an XML name, splitting an expanded name back into its
++   1, 2 or 3 original parts on application level in the element handler
++   may end up vulnerable, so these are advised against;  sane choices for
++   a namespace separator are e.g. '\n' (line feed) and '|' (pipe).
++
++   Note that Expat does not validate namespace URIs (beyond encoding)
++   against RFC 3986 today (and is not required to do so with regard to
++   the XML 1.0 namespaces specification) but it may start doing that
++   in future releases.  Before that, an application using Expat must
++   be ready to receive namespace URIs containing non-URI characters.
+ */
+ XMLPARSEAPI(XML_Parser)
+ XML_ParserCreateNS(const XML_Char *encoding, XML_Char namespaceSeparator);
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 59da19c8..6fe2cf1e 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3705,6 +3705,117 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+   return XML_ERROR_NONE;
+ }
+ 
++static XML_Bool
++is_rfc3986_uri_char(XML_Char candidate) {
++  // For the RFC 3986 ANBF grammar see
++  // https://datatracker.ietf.org/doc/html/rfc3986#appendix-A
++
++  switch (candidate) {
++  // From rule "ALPHA" (uppercase half)
++  case 'A':
++  case 'B':
++  case 'C':
++  case 'D':
++  case 'E':
++  case 'F':
++  case 'G':
++  case 'H':
++  case 'I':
++  case 'J':
++  case 'K':
++  case 'L':
++  case 'M':
++  case 'N':
++  case 'O':
++  case 'P':
++  case 'Q':
++  case 'R':
++  case 'S':
++  case 'T':
++  case 'U':
++  case 'V':
++  case 'W':
++  case 'X':
++  case 'Y':
++  case 'Z':
++
++  // From rule "ALPHA" (lowercase half)
++  case 'a':
++  case 'b':
++  case 'c':
++  case 'd':
++  case 'e':
++  case 'f':
++  case 'g':
++  case 'h':
++  case 'i':
++  case 'j':
++  case 'k':
++  case 'l':
++  case 'm':
++  case 'n':
++  case 'o':
++  case 'p':
++  case 'q':
++  case 'r':
++  case 's':
++  case 't':
++  case 'u':
++  case 'v':
++  case 'w':
++  case 'x':
++  case 'y':
++  case 'z':
++
++  // From rule "DIGIT"
++  case '0':
++  case '1':
++  case '2':
++  case '3':
++  case '4':
++  case '5':
++  case '6':
++  case '7':
++  case '8':
++  case '9':
++
++  // From rule "pct-encoded"
++  case '%':
++
++  // From rule "unreserved"
++  case '-':
++  case '.':
++  case '_':
++  case '~':
++
++  // From rule "gen-delims"
++  case ':':
++  case '/':
++  case '?':
++  case '#':
++  case '[':
++  case ']':
++  case '@':
++
++  // From rule "sub-delims"
++  case '!':
++  case '$':
++  case '&':
++  case '\'':
++  case '(':
++  case ')':
++  case '*':
++  case '+':
++  case ',':
++  case ';':
++  case '=':
++    return XML_TRUE;
++
++  default:
++    return XML_FALSE;
++  }
++}
++
+ /* addBinding() overwrites the value of prefix->binding without checking.
+    Therefore one must keep track of the old value outside of addBinding().
+ */
+@@ -3763,14 +3874,26 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+         && (len > xmlnsLen || uri[len] != xmlnsNamespace[len]))
+       isXMLNS = XML_FALSE;
+ 
+-    // NOTE: While Expat does not validate namespace URIs against RFC 3986,
+-    //       we have to at least make sure that the XML processor on top of
+-    //       Expat (that is splitting tag names by namespace separator into
+-    //       2- or 3-tuples (uri-local or uri-local-prefix)) cannot be confused
+-    //       by an attacker putting additional namespace separator characters
+-    //       into namespace declarations.  That would be ambiguous and not to
+-    //       be expected.
+-    if (parser->m_ns && (uri[len] == parser->m_namespaceSeparator)) {
++    // NOTE: While Expat does not validate namespace URIs against RFC 3986
++    //       today (and is not REQUIRED to do so with regard to the XML 1.0
++    //       namespaces specification) we have to at least make sure, that
++    //       the application on top of Expat (that is likely splitting expanded
++    //       element names ("qualified names") of form
++    //       "[uri sep] local [sep prefix] '\0'" back into 1, 2 or 3 pieces
++    //       in its element handler code) cannot be confused by an attacker
++    //       putting additional namespace separator characters into namespace
++    //       declarations.  That would be ambiguous and not to be expected.
++    //
++    //       While the HTML API docs of function XML_ParserCreateNS have been
++    //       advising against use of a namespace separator character that can
++    //       appear in a URI for >20 years now, some widespread applications
++    //       are using URI characters (':' (colon) in particular) for a
++    //       namespace separator, in practice.  To keep these applications
++    //       functional, we only reject namespaces URIs containing the
++    //       application-chosen namespace separator if the chosen separator
++    //       is a non-URI character with regard to RFC 3986.
++    if (parser->m_ns && (uri[len] == parser->m_namespaceSeparator)
++        && ! is_rfc3986_uri_char(uri[len])) {
+       return XML_ERROR_SYNTAX;
+     }
+   }
+diff --git a/tests/runtests.c b/tests/runtests.c
+index 60da868e..712706c4 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -7406,16 +7406,18 @@ START_TEST(test_ns_separator_in_uri) {
+   struct test_case {
+     enum XML_Status expectedStatus;
+     const char *doc;
++    XML_Char namesep;
+   };
+   struct test_case cases[] = {
+-      {XML_STATUS_OK, "<doc xmlns='one_two' />"},
+-      {XML_STATUS_ERROR, "<doc xmlns='one&#x0A;two' />"},
++      {XML_STATUS_OK, "<doc xmlns='one_two' />", XCS('\n')},
++      {XML_STATUS_ERROR, "<doc xmlns='one&#x0A;two' />", XCS('\n')},
++      {XML_STATUS_OK, "<doc xmlns='one:two' />", XCS(':')},
+   };
+ 
+   size_t i = 0;
+   size_t failCount = 0;
+   for (; i < sizeof(cases) / sizeof(cases[0]); i++) {
+-    XML_Parser parser = XML_ParserCreateNS(NULL, '\n');
++    XML_Parser parser = XML_ParserCreateNS(NULL, cases[i].namesep);
+     XML_SetElementHandler(parser, dummy_start_element, dummy_end_element);
+     if (XML_Parse(parser, cases[i].doc, (int)strlen(cases[i].doc),
+                   /*isFinal*/ XML_TRUE)
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
index 0b3331981c..f99fa7edb6 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -18,6 +18,8 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
            file://CVE-2022-23852.patch \
            file://CVE-2022-23990.patch \
            file://CVE-2022-25235.patch \
+           file://CVE-2022-25236-1.patch \
+           file://CVE-2022-25236-2.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.17.1


