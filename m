Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 1E86D783A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:27:00 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v5EFR1SE006073
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 17:27:01 +0200
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v5EFR0dj024763;
	Wed, 14 Jun 2017 17:27:00 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 214C910A598;
	Wed, 14 Jun 2017 17:27:01 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 17:26:43 +0200
Message-Id: <1497454006-13902-5-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1497454006-13902-1-git-send-email-andrej.valek@siemens.com>
References: <1497454006-13902-1-git-send-email-andrej.valek@siemens.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] libxml2: Fix CVE-2017-9049 and CVE-2017-9050
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
X-List-Received-Date: Wed, 14 Jun 2017 15:27:01 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Fix handling of parameter-entity references

There were two bugs where parameter-entity references could lead to an
unexpected change of the input buffer in xmlParseNameComplex and
xmlDictLookup being called with an invalid pointer.

Fixes bug 781205 and bug 781361

CVE: CVE-2017-9049 CVE-2017-9050
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../libxml2-CVE-2017-9049_CVE-2017-9050.patch      | 291 +++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |   1 +
 2 files changed, 292 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch
new file mode 100644
index 0000000..3d7ebc4
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch
@@ -0,0 +1,291 @@
+libxml2-2.9.4: Fix CVE-2017-9049 and CVE-2017-9050
+
+[No upstream tracking] -- https://bugzilla.gnome.org/show_bug.cgi?id=781205
+ -- https://bugzilla.gnome.org/show_bug.cgi?id=781361
+
+parser: Fix handling of parameter-entity references
+
+There were two bugs where parameter-entity references could lead to an
+unexpected change of the input buffer in xmlParseNameComplex and
+xmlDictLookup being called with an invalid pointer.
+
+Percent sign in DTD Names
+=========================
+
+The NEXTL macro used to call xmlParserHandlePEReference. When parsing
+"complex" names inside the DTD, this could result in entity expansion
+which created a new input buffer. The fix is to simply remove the call
+to xmlParserHandlePEReference from the NEXTL macro. This is safe because
+no users of the macro require expansion of parameter entities.
+
+- xmlParseNameComplex
+- xmlParseNCNameComplex
+- xmlParseNmtoken
+
+The percent sign is not allowed in names, which are grammatical tokens.
+
+- xmlParseEntityValue
+
+Parameter-entity references in entity values are expanded but this
+happens in a separate step in this function.
+
+- xmlParseSystemLiteral
+
+Parameter-entity references are ignored in the system literal.
+
+- xmlParseAttValueComplex
+- xmlParseCharDataComplex
+- xmlParseCommentComplex
+- xmlParsePI
+- xmlParseCDSect
+
+Parameter-entity references are ignored outside the DTD.
+
+- xmlLoadEntityContent
+
+This function is only called from xmlStringLenDecodeEntities and
+entities are replaced in a separate step immediately after the function
+call.
+
+This bug could also be triggered with an internal subset and double
+entity expansion.
+
+This fixes bug 766956 initially reported by Wei Lei and independently by
+Chromium's ClusterFuzz, Hanno Böck, and Marco Grassi. Thanks to everyone
+involved.
+
+xmlParseNameComplex with XML_PARSE_OLD10
+========================================
+
+When parsing Names inside an expanded parameter entity with the
+XML_PARSE_OLD10 option, xmlParseNameComplex would call xmlGROW via the
+GROW macro if the input buffer was exhausted. At the end of the
+parameter entity's replacement text, this function would then call
+xmlPopInput which invalidated the input buffer.
+
+There should be no need to invoke GROW in this situation because the
+buffer is grown periodically every XML_PARSER_CHUNK_SIZE characters and,
+at least for UTF-8, in xmlCurrentChar. This also matches the code path
+executed when XML_PARSE_OLD10 is not set.
+
+This fixes bugs 781205 (CVE-2017-9049) and 781361 (CVE-2017-9050).
+Thanks to Marcel Böhme and Thuan Pham for the report.
+
+Additional hardening
+====================
+
+A separate check was added in xmlParseNameComplex to validate the
+buffer size.
+
+Fixes bug 781205 and bug 781361
+
+Upstream-Status: Backported [https://git.gnome.org/browse/libxml2/commit/?id=932cc9896ab41475d4aa429c27d9afd175959d74]
+CVE: CVE-2017-9049 CVE-2017-9050
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/Makefile.am b/Makefile.am
+index 9f988b0..dab15a4 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -422,6 +422,24 @@ Errtests : xmllint$(EXEEXT)
+ 	      if [ -n "$$log" ] ; then echo $$name result ; echo $$log ; fi ; \
+ 	      rm result.$$name error.$$name ; \
+ 	  fi ; fi ; done)
++	@echo "## Error cases regression tests (old 1.0)"
++	-@(for i in $(srcdir)/test/errors10/*.xml ; do \
++	  name=`basename $$i`; \
++	  if [ ! -d $$i ] ; then \
++	  if [ ! -f $(srcdir)/result/errors10/$$name ] ; then \
++	      echo New test file $$name ; \
++	      $(CHECKER) $(top_builddir)/xmllint --oldxml10 $$i \
++	         2> $(srcdir)/result/errors10/$$name.err \
++		 > $(srcdir)/result/errors10/$$name ; \
++	      grep "MORY ALLO" .memdump  | grep -v "MEMORY ALLOCATED : 0"; \
++	  else \
++	      log=`$(CHECKER) $(top_builddir)/xmllint --oldxml10 $$i 2> error.$$name > result.$$name ; \
++	      grep "MORY ALLO" .memdump  | grep -v "MEMORY ALLOCATED : 0"; \
++	      diff $(srcdir)/result/errors10/$$name result.$$name ; \
++	      diff $(srcdir)/result/errors10/$$name.err error.$$name` ; \
++	      if [ -n "$$log" ] ; then echo $$name result ; echo "$$log" ; fi ; \
++	      rm result.$$name error.$$name ; \
++	  fi ; fi ; done)
+ 	@echo "## Error cases stream regression tests"
+ 	-@(for i in $(srcdir)/test/errors/*.xml ; do \
+ 	  name=`basename $$i`; \
+diff --git a/parser.c b/parser.c
+index 609a270..8e11c12 100644
+--- a/parser.c
++++ b/parser.c
+@@ -2115,7 +2115,6 @@ static void xmlGROW (xmlParserCtxtPtr ctxt) {
+ 	ctxt->input->line++; ctxt->input->col = 1;			\
+     } else ctxt->input->col++;						\
+     ctxt->input->cur += l;				\
+-    if (*ctxt->input->cur == '%') xmlParserHandlePEReference(ctxt);	\
+   } while (0)
+ 
+ #define CUR_CHAR(l) xmlCurrentChar(ctxt, &l)
+@@ -3406,13 +3405,6 @@ xmlParseNameComplex(xmlParserCtxtPtr ctxt) {
+ 	    len += l;
+ 	    NEXTL(l);
+ 	    c = CUR_CHAR(l);
+-	    if (c == 0) {
+-		count = 0;
+-		GROW;
+-                if (ctxt->instate == XML_PARSER_EOF)
+-                    return(NULL);
+-		c = CUR_CHAR(l);
+-	    }
+ 	}
+     }
+     if ((len > XML_MAX_NAME_LENGTH) &&
+@@ -3420,6 +3412,16 @@ xmlParseNameComplex(xmlParserCtxtPtr ctxt) {
+         xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "Name");
+         return(NULL);
+     }
++    if (ctxt->input->cur - ctxt->input->base < len) {
++        /*
++         * There were a couple of bugs where PERefs lead to to a change
++         * of the buffer. Check the buffer size to avoid passing an invalid
++         * pointer to xmlDictLookup.
++         */
++        xmlFatalErr(ctxt, XML_ERR_INTERNAL_ERROR,
++                    "unexpected change of input buffer");
++        return (NULL);
++    }
+     if ((*ctxt->input->cur == '\n') && (ctxt->input->cur[-1] == '\r'))
+         return(xmlDictLookup(ctxt->dict, ctxt->input->cur - (len + 1), len));
+     return(xmlDictLookup(ctxt->dict, ctxt->input->cur - len, len));
+diff --git a/result/errors10/781205.xml b/result/errors10/781205.xml
+new file mode 100644
+index 0000000..e69de29
+diff --git a/result/errors10/781205.xml.err b/result/errors10/781205.xml.err
+new file mode 100644
+index 0000000..da15c3f
+--- /dev/null
++++ b/result/errors10/781205.xml.err
+@@ -0,0 +1,21 @@
++Entity: line 1: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
++
++ %a; 
++    ^
++Entity: line 1: 
++<:0000
++^
++Entity: line 1: parser error : DOCTYPE improperly terminated
++ %a; 
++    ^
++Entity: line 1: 
++<:0000
++^
++namespace error : Failed to parse QName ':0000'
++ %a; 
++    ^
++<:0000
++      ^
++./test/errors10/781205.xml:4: parser error : Couldn't find end of Start Tag :0000 line 1
++
++^
+diff --git a/result/errors10/781361.xml b/result/errors10/781361.xml
+new file mode 100644
+index 0000000..e69de29
+diff --git a/result/errors10/781361.xml.err b/result/errors10/781361.xml.err
+new file mode 100644
+index 0000000..655f41a
+--- /dev/null
++++ b/result/errors10/781361.xml.err
+@@ -0,0 +1,13 @@
++./test/errors10/781361.xml:4: parser error : xmlParseElementDecl: 'EMPTY', 'ANY' or '(' expected
++
++^
++./test/errors10/781361.xml:4: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
++
++
++^
++./test/errors10/781361.xml:4: parser error : DOCTYPE improperly terminated
++
++^
++./test/errors10/781361.xml:4: parser error : Start tag expected, '<' not found
++
++^
+diff --git a/result/valid/766956.xml b/result/valid/766956.xml
+new file mode 100644
+index 0000000..e69de29
+diff --git a/result/valid/766956.xml.err b/result/valid/766956.xml.err
+new file mode 100644
+index 0000000..34b1dae
+--- /dev/null
++++ b/result/valid/766956.xml.err
+@@ -0,0 +1,9 @@
++test/valid/dtds/766956.dtd:2: parser error : PEReference: expecting ';'
++%ä%ent;
++   ^
++Entity: line 1: parser error : Content error in the external subset
++ %ent; 
++      ^
++Entity: line 1: 
++value
++^
+diff --git a/result/valid/766956.xml.err.rdr b/result/valid/766956.xml.err.rdr
+new file mode 100644
+index 0000000..7760346
+--- /dev/null
++++ b/result/valid/766956.xml.err.rdr
+@@ -0,0 +1,10 @@
++test/valid/dtds/766956.dtd:2: parser error : PEReference: expecting ';'
++%ä%ent;
++   ^
++Entity: line 1: parser error : Content error in the external subset
++ %ent; 
++      ^
++Entity: line 1: 
++value
++^
++./test/valid/766956.xml : failed to parse
+diff --git a/runtest.c b/runtest.c
+index bb74d2a..63e8c20 100644
+--- a/runtest.c
++++ b/runtest.c
+@@ -4202,6 +4202,9 @@ testDesc testDescriptions[] = {
+     { "Error cases regression tests",
+       errParseTest, "./test/errors/*.xml", "result/errors/", "", ".err",
+       0 },
++    { "Error cases regression tests (old 1.0)",
++      errParseTest, "./test/errors10/*.xml", "result/errors10/", "", ".err",
++      XML_PARSE_OLD10 },
+ #ifdef LIBXML_READER_ENABLED
+     { "Error cases stream regression tests",
+       streamParseTest, "./test/errors/*.xml", "result/errors/", NULL, ".str",
+diff --git a/test/errors10/781205.xml b/test/errors10/781205.xml
+new file mode 100644
+index 0000000..d9e9e83
+--- /dev/null
++++ b/test/errors10/781205.xml
+@@ -0,0 +1,3 @@
++<!DOCTYPE D [
++  <!ENTITY % a "<:0000">
++  %a;
+diff --git a/test/errors10/781361.xml b/test/errors10/781361.xml
+new file mode 100644
+index 0000000..67476bc
+--- /dev/null
++++ b/test/errors10/781361.xml
+@@ -0,0 +1,3 @@
++<!DOCTYPE doc [
++  <!ENTITY % elem "<!ELEMENT e0000000000">
++  %elem;
+diff --git a/test/valid/766956.xml b/test/valid/766956.xml
+new file mode 100644
+index 0000000..19a95a0
+--- /dev/null
++++ b/test/valid/766956.xml
+@@ -0,0 +1,2 @@
++<!DOCTYPE test SYSTEM "dtds/766956.dtd">
++<test/>
+diff --git a/test/valid/dtds/766956.dtd b/test/valid/dtds/766956.dtd
+new file mode 100644
+index 0000000..dddde68
+--- /dev/null
++++ b/test/valid/dtds/766956.dtd
+@@ -0,0 +1,2 @@
++<!ENTITY % ent "value">
++%ä%ent;
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index dd2e034..3f78c2d 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -25,6 +25,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml2-fix_NULL_pointer_derefs.patch \
            file://libxml2-fix_and_simplify_xmlParseStartTag2.patch \
            file://libxml2-CVE-2017-9047_CVE-2017-9048.patch \
+           file://libxml2-CVE-2017-9049_CVE-2017-9050.patch \
            file://CVE-2016-9318.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            "
-- 
2.1.4


