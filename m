Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC50FC352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 16:58:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21056.1670432278450252997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 08:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6C8523A;
	Wed,  7 Dec 2022 08:58:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56F203F73B;
	Wed,  7 Dec 2022 08:57:57 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libxml2: upgrade 2.9.14 -> 2.10.3
Date: Wed,  7 Dec 2022 16:57:55 +0000
Message-Id: <20221207165755.3562318-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 16:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174364

Change ptest away from using the upstream Makefiles to manually running
the tests: they're not actually integrated with automake anyway so this
didn't gain us anything apart from patches we can't send upstream. Drops
the following patches:
- 0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
- 0001-Port-gentest.py-to-Python-3.patch
- fix-execution-of-ptests.patch
- remove-fuzz-from-ptests.patch
- runtest.patch

Add a simple patch to install the test binaries via the Makefile:
- install-tests.patch

The Python module is built differently and a number of patches no longer
apply and appear to be redundant, remove:
- python-sitepackages-dir.patch

libxml-m4-use-pkgconfig.patch has been sent upstream now, mark as
backport.

Remove obsolete --without-docbook option.

Remove obsolete xml2Conf.sh packaging.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...he-python-tests-if-python-is-enabled.patch |  86 --
 .../0001-Port-gentest.py-to-Python-3.patch    | 814 -----------------
 .../libxml2/fix-execution-of-ptests.patch     |  33 -
 .../libxml/libxml2/install-tests.patch        |  38 +
 .../libxml2/libxml-m4-use-pkgconfig.patch     |  24 +-
 .../libxml2/python-sitepackages-dir.patch     |  35 -
 .../libxml2/remove-fuzz-from-ptests.patch     |  44 -
 meta/recipes-core/libxml/libxml2/run-ptest    |  18 +-
 .../recipes-core/libxml/libxml2/runtest.patch | 849 ------------------
 .../{libxml2_2.9.14.bb =3D> libxml2_2.10.3.bb}  |  61 +-
 10 files changed, 72 insertions(+), 1930 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-=
the-python-tests-if-python-is-enabled.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-Port-gentest.py=
-to-Python-3.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/fix-execution-of-pte=
sts.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/install-tests.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/python-sitepackages-=
dir.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/remove-fuzz-from-pte=
sts.patch
 mode change 100644 =3D> 100755 meta/recipes-core/libxml/libxml2/run-ptes=
t
 delete mode 100644 meta/recipes-core/libxml/libxml2/runtest.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.14.bb =3D> libxml2_2.10.3.b=
b} (60%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-pyt=
hon-tests-if-python-is-enabled.patch b/meta/recipes-core/libxml/libxml2/0=
001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
deleted file mode 100644
index 6d9ede61941..00000000000
--- a/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tes=
ts-if-python-is-enabled.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From ea1993d1d9a18c5e61b9cb271892b0a48f508d32 Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Fri, 9 Jun 2017 17:50:46 +0200
-Subject: [PATCH] Make ptest run the python tests if python is enabled
-
-One of the tests (tstLastError.py) needed a minor correction. It might
-be due to the fact that the tests are forced to run with Python 3.
-
-Upstream-Status: Inappropriate [OE specific]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- Makefile.am              |  2 +-
- python/Makefile.am       |  9 +++++++++
- python/tests/Makefile.am | 10 ++++++++++
- 3 files changed, 20 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index b428452b..dc18d6dd 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -203,9 +203,9 @@ install-ptest:
- 	install $(check_PROGRAMS) $(DESTDIR))
- 	cp -r $(srcdir)/test $(DESTDIR)
- 	cp -r $(srcdir)/result $(DESTDIR)
--	cp -r $(srcdir)/python $(DESTDIR)
- 	cp Makefile $(DESTDIR)
- 	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
-+	$(MAKE) -C python install-ptest
-=20
- runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
-           testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 34aed96c..ba3ec6a4 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -48,7 +48,16 @@ GENERATED =3D libxml2class.py libxml2class.txt $(BUIL=
T_SOURCES)
-=20
- $(GENERATED): $(srcdir)/generator.py $(API_DESC)
- 	$(PYTHON) $(srcdir)/generator.py $(srcdir)
-+
-+install-ptest:
-+	cp -r $(srcdir) $(DESTDIR)
-+	sed -e 's|^Makefile:|_Makefile:|' \
-+	    -e 's|^\(tests test:\) all|\1|' Makefile >$(DESTDIR)/python/Makefi=
le
-+	$(MAKE) -C tests install-ptest
-+else
-+install-ptest:
- endif
-=20
-+.PHONY: tests test
- tests test: all
- 	cd tests && $(MAKE) tests
-diff --git a/python/tests/Makefile.am b/python/tests/Makefile.am
-index 227e24df..3568c2d2 100644
---- a/python/tests/Makefile.am
-+++ b/python/tests/Makefile.am
-@@ -59,6 +59,11 @@ XMLS=3D		\
- CLEANFILES =3D core tmp.xml *.pyc
-=20
- if WITH_PYTHON
-+install-ptest:
-+	cp -r $(srcdir) $(DESTDIR)/python
-+	sed -e 's|^Makefile:|_Makefile:|' \
-+	    -e 's|^\(srcdir =3D \).*|\1.|' Makefile >$(DESTDIR)/python/tests/M=
akefile
-+
- tests: $(PYTESTS)
- 	@for f in $(XMLS) ; do test -f $$f || $(LN_S) $(srcdir)/$$f . ; done
- 	@echo "## running Python regression tests"
-@@ -70,9 +75,14 @@ tests: $(PYTESTS)
- 	    if [ "$$?" -ne 0 ] ; then \
- 	      echo "-- $$test" ; \
- 	      echo "$$log" ; \
-+              echo "FAIL: $$test"; \
- 	      exit 1 ; \
-+            else \
-+              echo "PASS: $$test"; \
- 	    fi ; \
- 	  done)
- else
-+install-ptest:
-+
- tests:
- endif
---
-2.25.1
-
diff --git a/meta/recipes-core/libxml/libxml2/0001-Port-gentest.py-to-Pyt=
hon-3.patch b/meta/recipes-core/libxml/libxml2/0001-Port-gentest.py-to-Py=
thon-3.patch
deleted file mode 100644
index c6567ac8788..00000000000
--- a/meta/recipes-core/libxml/libxml2/0001-Port-gentest.py-to-Python-3.p=
atch
+++ /dev/null
@@ -1,814 +0,0 @@
-From 2c20198b1ddb1bfb47269b8caf929ffb83748f78 Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Thu, 21 Apr 2022 00:45:58 +0200
-Subject: [PATCH] Port gentest.py to Python 3
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/comm=
it/343fc1421cdae097fa6c4cffeb1a065a40be6bbb]
-
-* fixes:
-
-make[1]: 'testReader' is up to date.
-  File "../libxml2-2.9.10/gentest.py", line 11
-    print "libxml2 python bindings not available, skipping testapi.c gen=
eration"
-          ^
-SyntaxError: Missing parentheses in call to 'print'. Did you mean print(=
"libxml2 python bindings not available, skipping testapi.c generation")?
-make[1]: [Makefile:2078: testapi.c] Error 1 (ignored)
-
-...
-
-make[1]: 'testReader' is up to date.
-  File "../libxml2-2.9.10/gentest.py", line 271
-    return 1
-           ^
-TabError: inconsistent use of tabs and spaces in indentation
-make[1]: [Makefile:2078: testapi.c] Error 1 (ignored)
-
-...
-
-aarch64-oe-linux-gcc: error: testapi.c: No such file or directory
-aarch64-oe-linux-gcc: fatal error: no input files
-compilation terminated.
-make[1]: *** [Makefile:1275: testapi.o] Error 1
-
-But there is still a bit mystery why it worked before, because check-am
-calls gentest.py with $(PYTHON), so it ignores the shebang in the script
-and libxml2 is using python3native (through python3targetconfig.bbclass)
-so something like:
-
-libxml2/2.9.10-r0/recipe-sysroot-native/usr/bin/python3-native/python3 g=
entest.py
-
-But that still fails (now without SyntaxError) with:
-libxml2 python bindings not available, skipping testapi.c generation
-
-because we don't have dependency on libxml2-native (to provide libxml2
-python bindings form python3native) and exported PYTHON_SITE_PACKAGES
-might be useless (e.g. /usr/lib/python3.8/site-packages on Ubuntu-22.10
-which uses python 3.10 and there is no site-packages with libxml2)
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
- gentest.py | 421 ++++++++++++++++++++++++++---------------------------
- 1 file changed, 209 insertions(+), 212 deletions(-)
-
-diff --git a/gentest.py b/gentest.py
-index b6cd866..af15a4f 100755
---- a/gentest.py
-+++ b/gentest.py
-@@ -8,7 +8,7 @@ import string
- try:
-     import libxml2
- except:
--    print "libxml2 python bindings not available, skipping testapi.c ge=
neration"
-+    print("libxml2 python bindings not available, skipping testapi.c ge=
neration")
-     sys.exit(0)
-=20
- if len(sys.argv) > 1:
-@@ -227,7 +227,7 @@ extra_post_call =3D {
-           if (old !=3D NULL) {
-               xmlUnlinkNode(old);
-               xmlFreeNode(old) ; old =3D NULL ; }
--	  ret_val =3D NULL;""",
-+\t  ret_val =3D NULL;""",
-    "xmlTextMerge":=20
-        """if ((first !=3D NULL) && (first->type !=3D XML_TEXT_NODE)) {
-               xmlUnlinkNode(second);
-@@ -236,7 +236,7 @@ extra_post_call =3D {
-        """if ((ret_val !=3D NULL) && (ret_val !=3D ncname) &&
-               (ret_val !=3D prefix) && (ret_val !=3D memory))
-               xmlFree(ret_val);
--	  ret_val =3D NULL;""",
-+\t  ret_val =3D NULL;""",
-    "xmlNewDocElementContent":
-        """xmlFreeDocElementContent(doc, ret_val); ret_val =3D NULL;""",
-    "xmlDictReference": "xmlDictFree(dict);",
-@@ -268,29 +268,29 @@ modules =3D []
- def is_skipped_module(name):
-     for mod in skipped_modules:
-         if mod =3D=3D name:
--	    return 1
-+            return 1
-     return 0
-=20
- def is_skipped_function(name):
-     for fun in skipped_functions:
-         if fun =3D=3D name:
--	    return 1
-+            return 1
-     # Do not test destructors
--    if string.find(name, 'Free') !=3D -1:
-+    if name.find('Free') !=3D -1:
-         return 1
-     return 0
-=20
- def is_skipped_memcheck(name):
-     for fun in skipped_memcheck:
-         if fun =3D=3D name:
--	    return 1
-+            return 1
-     return 0
-=20
- missing_types =3D {}
- def add_missing_type(name, func):
-     try:
-         list =3D missing_types[name]
--	list.append(func)
-+        list.append(func)
-     except:
-         missing_types[name] =3D [func]
-=20
-@@ -310,7 +310,7 @@ def add_missing_functions(name, module):
-     missing_functions_nr =3D missing_functions_nr + 1
-     try:
-         list =3D missing_functions[module]
--	list.append(name)
-+        list.append(name)
-     except:
-         missing_functions[module] =3D [name]
-=20
-@@ -319,45 +319,45 @@ def add_missing_functions(name, module):
- #
-=20
- def type_convert(str, name, info, module, function, pos):
--#    res =3D string.replace(str, "    ", " ")
--#    res =3D string.replace(str, "   ", " ")
--#    res =3D string.replace(str, "  ", " ")
--    res =3D string.replace(str, " *", "_ptr")
--#    res =3D string.replace(str, "*", "_ptr")
--    res =3D string.replace(res, " ", "_")
-+#    res =3D str.replace("    ", " ")
-+#    res =3D str.replace("   ", " ")
-+#    res =3D str.replace("  ", " ")
-+    res =3D str.replace(" *", "_ptr")
-+#    res =3D str.replace("*", "_ptr")
-+    res =3D res.replace(" ", "_")
-     if res =3D=3D 'const_char_ptr':
--        if string.find(name, "file") !=3D -1 or \
--           string.find(name, "uri") !=3D -1 or \
--           string.find(name, "URI") !=3D -1 or \
--           string.find(info, "filename") !=3D -1 or \
--           string.find(info, "URI") !=3D -1 or \
--           string.find(info, "URL") !=3D -1:
--	    if string.find(function, "Save") !=3D -1 or \
--	       string.find(function, "Create") !=3D -1 or \
--	       string.find(function, "Write") !=3D -1 or \
--	       string.find(function, "Fetch") !=3D -1:
--	        return('fileoutput')
--	    return('filepath')
-+        if name.find("file") !=3D -1 or \
-+           name.find("uri") !=3D -1 or \
-+           name.find("URI") !=3D -1 or \
-+           info.find("filename") !=3D -1 or \
-+           info.find("URI") !=3D -1 or \
-+           info.find("URL") !=3D -1:
-+            if function.find("Save") !=3D -1 or \
-+               function.find("Create") !=3D -1 or \
-+               function.find("Write") !=3D -1 or \
-+               function.find("Fetch") !=3D -1:
-+                return('fileoutput')
-+            return('filepath')
-     if res =3D=3D 'void_ptr':
-         if module =3D=3D 'nanoftp' and name =3D=3D 'ctx':
--	    return('xmlNanoFTPCtxtPtr')
-+            return('xmlNanoFTPCtxtPtr')
-         if function =3D=3D 'xmlNanoFTPNewCtxt' or \
--	   function =3D=3D 'xmlNanoFTPConnectTo' or \
--	   function =3D=3D 'xmlNanoFTPOpen':
--	    return('xmlNanoFTPCtxtPtr')
-+           function =3D=3D 'xmlNanoFTPConnectTo' or \
-+           function =3D=3D 'xmlNanoFTPOpen':
-+            return('xmlNanoFTPCtxtPtr')
-         if module =3D=3D 'nanohttp' and name =3D=3D 'ctx':
--	    return('xmlNanoHTTPCtxtPtr')
--	if function =3D=3D 'xmlNanoHTTPMethod' or \
--	   function =3D=3D 'xmlNanoHTTPMethodRedir' or \
--	   function =3D=3D 'xmlNanoHTTPOpen' or \
--	   function =3D=3D 'xmlNanoHTTPOpenRedir':
--	    return('xmlNanoHTTPCtxtPtr');
-+            return('xmlNanoHTTPCtxtPtr')
-+        if function =3D=3D 'xmlNanoHTTPMethod' or \
-+           function =3D=3D 'xmlNanoHTTPMethodRedir' or \
-+           function =3D=3D 'xmlNanoHTTPOpen' or \
-+           function =3D=3D 'xmlNanoHTTPOpenRedir':
-+            return('xmlNanoHTTPCtxtPtr');
-         if function =3D=3D 'xmlIOHTTPOpen':
--	    return('xmlNanoHTTPCtxtPtr')
--	if string.find(name, "data") !=3D -1:
--	    return('userdata')
--	if string.find(name, "user") !=3D -1:
--	    return('userdata')
-+            return('xmlNanoHTTPCtxtPtr')
-+        if name.find("data") !=3D -1:
-+            return('userdata')
-+        if name.find("user") !=3D -1:
-+            return('userdata')
-     if res =3D=3D 'xmlDoc_ptr':
-         res =3D 'xmlDocPtr'
-     if res =3D=3D 'xmlNode_ptr':
-@@ -366,18 +366,18 @@ def type_convert(str, name, info, module, function=
, pos):
-         res =3D 'xmlDictPtr'
-     if res =3D=3D 'xmlNodePtr' and pos !=3D 0:
-         if (function =3D=3D 'xmlAddChild' and pos =3D=3D 2) or \
--	   (function =3D=3D 'xmlAddChildList' and pos =3D=3D 2) or \
-+           (function =3D=3D 'xmlAddChildList' and pos =3D=3D 2) or \
-            (function =3D=3D 'xmlAddNextSibling' and pos =3D=3D 2) or \
-            (function =3D=3D 'xmlAddSibling' and pos =3D=3D 2) or \
-            (function =3D=3D 'xmlDocSetRootElement' and pos =3D=3D 2) or=
 \
-            (function =3D=3D 'xmlReplaceNode' and pos =3D=3D 2) or \
-            (function =3D=3D 'xmlTextMerge') or \
--	   (function =3D=3D 'xmlAddPrevSibling' and pos =3D=3D 2):
--	    return('xmlNodePtr_in');
-+           (function =3D=3D 'xmlAddPrevSibling' and pos =3D=3D 2):
-+            return('xmlNodePtr_in');
-     if res =3D=3D 'const xmlBufferPtr':
-         res =3D 'xmlBufferPtr'
-     if res =3D=3D 'xmlChar_ptr' and name =3D=3D 'name' and \
--       string.find(function, "EatName") !=3D -1:
-+       function.find("EatName") !=3D -1:
-         return('eaten_name')
-     if res =3D=3D 'void_ptr*':
-         res =3D 'void_ptr_ptr'
-@@ -393,7 +393,7 @@ def type_convert(str, name, info, module, function, =
pos):
-         res =3D 'debug_FILE_ptr';
-     if res =3D=3D 'int' and name =3D=3D 'options':
-         if module =3D=3D 'parser' or module =3D=3D 'xmlreader':
--	    res =3D 'parseroptions'
-+            res =3D 'parseroptions'
-=20
-     return res
-=20
-@@ -402,28 +402,28 @@ known_param_types =3D []
- def is_known_param_type(name):
-     for type in known_param_types:
-         if type =3D=3D name:
--	    return 1
-+            return 1
-     return name[-3:] =3D=3D 'Ptr' or name[-4:] =3D=3D '_ptr'
-=20
- def generate_param_type(name, rtype):
-     global test
-     for type in known_param_types:
-         if type =3D=3D name:
--	    return
-+            return
-     for type in generated_param_types:
-         if type =3D=3D name:
--	    return
-+            return
-=20
-     if name[-3:] =3D=3D 'Ptr' or name[-4:] =3D=3D '_ptr':
-         if rtype[0:6] =3D=3D 'const ':
--	    crtype =3D rtype[6:]
--	else:
--	    crtype =3D rtype
-+            crtype =3D rtype[6:]
-+        else:
-+            crtype =3D rtype
-=20
-         define =3D 0
--	if modules_defines.has_key(module):
--	    test.write("#ifdef %s\n" % (modules_defines[module]))
--	    define =3D 1
-+        if module in modules_defines:
-+            test.write("#ifdef %s\n" % (modules_defines[module]))
-+            define =3D 1
-         test.write("""
- #define gen_nb_%s 1
- static %s gen_%s(int no ATTRIBUTE_UNUSED, int nr ATTRIBUTE_UNUSED) {
-@@ -433,7 +433,7 @@ static void des_%s(int no ATTRIBUTE_UNUSED, %s val A=
TTRIBUTE_UNUSED, int nr ATTR
- }
- """ % (name, crtype, name, name, rtype))
-         if define =3D=3D 1:
--	    test.write("#endif\n\n")
-+            test.write("#endif\n\n")
-         add_generated_param_type(name)
-=20
- #
-@@ -445,7 +445,7 @@ known_return_types =3D []
- def is_known_return_type(name):
-     for type in known_return_types:
-         if type =3D=3D name:
--	    return 1
-+            return 1
-     return 0
-=20
- #
-@@ -471,7 +471,7 @@ def compare_and_save():
-         try:
-             os.system("rm testapi.c; mv testapi.c.new testapi.c")
-         except:
--	    os.system("mv testapi.c.new testapi.c")
-+            os.system("mv testapi.c.new testapi.c")
-         print("Updated testapi.c")
-     else:
-         print("Generated testapi.c is identical")
-@@ -481,17 +481,17 @@ while line !=3D "":
-     if line =3D=3D "/* CUT HERE: everything below that line is generate=
d */\n":
-         break;
-     if line[0:15] =3D=3D "#define gen_nb_":
--        type =3D string.split(line[15:])[0]
--	known_param_types.append(type)
-+        type =3D line[15:].split()[0]
-+        known_param_types.append(type)
-     if line[0:19] =3D=3D "static void desret_":
--        type =3D string.split(line[19:], '(')[0]
--	known_return_types.append(type)
-+        type =3D line[19:].split('(')[0]
-+        known_return_types.append(type)
-     test.write(line)
-     line =3D input.readline()
- input.close()
-=20
- if line =3D=3D "":
--    print "Could not find the CUT marker in testapi.c skipping generati=
on"
-+    print("Could not find the CUT marker in testapi.c skipping generati=
on")
-     test.close()
-     sys.exit(0)
-=20
-@@ -505,7 +505,7 @@ test.write("/* CUT HERE: everything below that line =
is generated */\n")
- #
- doc =3D libxml2.readFile(srcPref + 'doc/libxml2-api.xml', None, 0)
- if doc =3D=3D None:
--    print "Failed to load doc/libxml2-api.xml"
-+    print("Failed to load doc/libxml2-api.xml")
-     sys.exit(1)
- ctxt =3D doc.xpathNewContext()
-=20
-@@ -519,9 +519,9 @@ for arg in args:
-     mod =3D arg.xpathEval('string(../@file)')
-     func =3D arg.xpathEval('string(../@name)')
-     if (mod not in skipped_modules) and (func not in skipped_functions)=
:
--	type =3D arg.xpathEval('string(@type)')
--	if not argtypes.has_key(type):
--	    argtypes[type] =3D func
-+        type =3D arg.xpathEval('string(@type)')
-+        if type not in argtypes:
-+            argtypes[type] =3D func
-=20
- # similarly for return types
- rettypes =3D {}
-@@ -531,8 +531,8 @@ for ret in rets:
-     func =3D ret.xpathEval('string(../@name)')
-     if (mod not in skipped_modules) and (func not in skipped_functions)=
:
-         type =3D ret.xpathEval('string(@type)')
--	if not rettypes.has_key(type):
--	    rettypes[type] =3D func
-+        if type not in rettypes:
-+            rettypes[type] =3D func
-=20
- #
- # Generate constructors and return type handling for all enums
-@@ -549,49 +549,49 @@ for enum in enums:
-         continue;
-     define =3D 0
-=20
--    if argtypes.has_key(name) and is_known_param_type(name) =3D=3D 0:
--	values =3D ctxt.xpathEval("/api/symbols/enum[@type=3D'%s']" % name)
--	i =3D 0
--	vals =3D []
--	for value in values:
--	    vname =3D value.xpathEval('string(@name)')
--	    if vname =3D=3D None:
--		continue;
--	    i =3D i + 1
--	    if i >=3D 5:
--		break;
--	    vals.append(vname)
--	if vals =3D=3D []:
--	    print "Didn't find any value for enum %s" % (name)
--	    continue
--	if modules_defines.has_key(module):
--	    test.write("#ifdef %s\n" % (modules_defines[module]))
--	    define =3D 1
--	test.write("#define gen_nb_%s %d\n" % (name, len(vals)))
--	test.write("""static %s gen_%s(int no, int nr ATTRIBUTE_UNUSED) {\n"""=
 %
--	           (name, name))
--	i =3D 1
--	for value in vals:
--	    test.write("    if (no =3D=3D %d) return(%s);\n" % (i, value))
--	    i =3D i + 1
--	test.write("""    return(0);
-+    if (name in argtypes) and is_known_param_type(name) =3D=3D 0:
-+        values =3D ctxt.xpathEval("/api/symbols/enum[@type=3D'%s']" % n=
ame)
-+        i =3D 0
-+        vals =3D []
-+        for value in values:
-+            vname =3D value.xpathEval('string(@name)')
-+            if vname =3D=3D None:
-+                continue;
-+            i =3D i + 1
-+            if i >=3D 5:
-+                break;
-+            vals.append(vname)
-+        if vals =3D=3D []:
-+            print("Didn't find any value for enum %s" % (name))
-+            continue
-+        if module in modules_defines:
-+            test.write("#ifdef %s\n" % (modules_defines[module]))
-+            define =3D 1
-+        test.write("#define gen_nb_%s %d\n" % (name, len(vals)))
-+        test.write("""static %s gen_%s(int no, int nr ATTRIBUTE_UNUSED)=
 {\n""" %
-+                   (name, name))
-+        i =3D 1
-+        for value in vals:
-+            test.write("    if (no =3D=3D %d) return(%s);\n" % (i, valu=
e))
-+            i =3D i + 1
-+        test.write("""    return(0);
- }
-=20
- static void des_%s(int no ATTRIBUTE_UNUSED, %s val ATTRIBUTE_UNUSED, in=
t nr ATTRIBUTE_UNUSED) {
- }
-=20
- """ % (name, name));
--	known_param_types.append(name)
-+        known_param_types.append(name)
-=20
-     if (is_known_return_type(name) =3D=3D 0) and (name in rettypes):
--	if define =3D=3D 0 and modules_defines.has_key(module):
--	    test.write("#ifdef %s\n" % (modules_defines[module]))
--	    define =3D 1
-+        if define =3D=3D 0 and (module in modules_defines):
-+            test.write("#ifdef %s\n" % (modules_defines[module]))
-+            define =3D 1
-         test.write("""static void desret_%s(%s val ATTRIBUTE_UNUSED) {
- }
-=20
- """ % (name, name))
--	known_return_types.append(name)
-+        known_return_types.append(name)
-     if define =3D=3D 1:
-         test.write("#endif\n\n")
-=20
-@@ -615,9 +615,9 @@ for file in headers:
-     # do not test deprecated APIs
-     #
-     desc =3D file.xpathEval('string(description)')
--    if string.find(desc, 'DEPRECATED') !=3D -1:
--        print "Skipping deprecated interface %s" % name
--	continue;
-+    if desc.find('DEPRECATED') !=3D -1:
-+        print("Skipping deprecated interface %s" % name)
-+        continue;
-=20
-     test.write("#include <libxml/%s.h>\n" % name)
-     modules.append(name)
-@@ -679,7 +679,7 @@ def generate_test(module, node):
-     # and store the information for the generation
-     #
-     try:
--	args =3D node.xpathEval("arg")
-+        args =3D node.xpathEval("arg")
-     except:
-         args =3D []
-     t_args =3D []
-@@ -687,37 +687,37 @@ def generate_test(module, node):
-     for arg in args:
-         n =3D n + 1
-         rtype =3D arg.xpathEval("string(@type)")
--	if rtype =3D=3D 'void':
--	    break;
--	info =3D arg.xpathEval("string(@info)")
--	nam =3D arg.xpathEval("string(@name)")
-+        if rtype =3D=3D 'void':
-+            break;
-+        info =3D arg.xpathEval("string(@info)")
-+        nam =3D arg.xpathEval("string(@name)")
-         type =3D type_convert(rtype, nam, info, module, name, n)
--	if is_known_param_type(type) =3D=3D 0:
--	    add_missing_type(type, name);
--	    no_gen =3D 1
-+        if is_known_param_type(type) =3D=3D 0:
-+            add_missing_type(type, name);
-+            no_gen =3D 1
-         if (type[-3:] =3D=3D 'Ptr' or type[-4:] =3D=3D '_ptr') and \
--	    rtype[0:6] =3D=3D 'const ':
--	    crtype =3D rtype[6:]
--	else:
--	    crtype =3D rtype
--	t_args.append((nam, type, rtype, crtype, info))
-+            rtype[0:6] =3D=3D 'const ':
-+            crtype =3D rtype[6:]
-+        else:
-+            crtype =3D rtype
-+        t_args.append((nam, type, rtype, crtype, info))
-    =20
-     try:
--	rets =3D node.xpathEval("return")
-+        rets =3D node.xpathEval("return")
-     except:
-         rets =3D []
-     t_ret =3D None
-     for ret in rets:
-         rtype =3D ret.xpathEval("string(@type)")
--	info =3D ret.xpathEval("string(@info)")
-+        info =3D ret.xpathEval("string(@info)")
-         type =3D type_convert(rtype, 'return', info, module, name, 0)
--	if rtype =3D=3D 'void':
--	    break
--	if is_known_return_type(type) =3D=3D 0:
--	    add_missing_type(type, name);
--	    no_gen =3D 1
--	t_ret =3D (type, rtype, info)
--	break
-+        if rtype =3D=3D 'void':
-+            break
-+        if is_known_return_type(type) =3D=3D 0:
-+            add_missing_type(type, name);
-+            no_gen =3D 1
-+        t_ret =3D (type, rtype, info)
-+        break
-=20
-     if no_gen =3D=3D 0:
-         for t_arg in t_args:
-@@ -733,7 +733,7 @@ test_%s(void) {
-=20
-     if no_gen =3D=3D 1:
-         add_missing_functions(name, module)
--	test.write("""
-+        test.write("""
-     /* missing type support */
-     return(test_ret);
- }
-@@ -742,22 +742,22 @@ test_%s(void) {
-         return
-=20
-     try:
--	conds =3D node.xpathEval("cond")
--	for cond in conds:
--	    test.write("#if %s\n" % (cond.get_content()))
--	    nb_cond =3D nb_cond + 1
-+        conds =3D node.xpathEval("cond")
-+        for cond in conds:
-+            test.write("#if %s\n" % (cond.get_content()))
-+            nb_cond =3D nb_cond + 1
-     except:
-         pass
-=20
-     define =3D 0
--    if function_defines.has_key(name):
-+    if name in function_defines:
-         test.write("#ifdef %s\n" % (function_defines[name]))
--	define =3D 1
-+        define =3D 1
-    =20
-     # Declare the memory usage counter
-     no_mem =3D is_skipped_memcheck(name)
-     if no_mem =3D=3D 0:
--	test.write("    int mem_base;\n");
-+        test.write("    int mem_base;\n");
-=20
-     # Declare the return value
-     if t_ret !=3D None:
-@@ -766,29 +766,29 @@ test_%s(void) {
-     # Declare the arguments
-     for arg in t_args:
-         (nam, type, rtype, crtype, info) =3D arg;
--	# add declaration
--	test.write("    %s %s; /* %s */\n" % (crtype, nam, info))
--	test.write("    int n_%s;\n" % (nam))
-+        # add declaration
-+        test.write("    %s %s; /* %s */\n" % (crtype, nam, info))
-+        test.write("    int n_%s;\n" % (nam))
-     test.write("\n")
-=20
-     # Cascade loop on of each argument list of values
-     for arg in t_args:
-         (nam, type, rtype, crtype, info) =3D arg;
--	#
--	test.write("    for (n_%s =3D 0;n_%s < gen_nb_%s;n_%s++) {\n" % (
--	           nam, nam, type, nam))
-+        #
-+        test.write("    for (n_%s =3D 0;n_%s < gen_nb_%s;n_%s++) {\n" %=
 (
-+                   nam, nam, type, nam))
-    =20
-     # log the memory usage
-     if no_mem =3D=3D 0:
--	test.write("        mem_base =3D xmlMemBlocks();\n");
-+        test.write("        mem_base =3D xmlMemBlocks();\n");
-=20
-     # prepare the call
-     i =3D 0;
-     for arg in t_args:
-         (nam, type, rtype, crtype, info) =3D arg;
--	#
--	test.write("        %s =3D gen_%s(n_%s, %d);\n" % (nam, type, nam, i))
--	i =3D i + 1;
-+        #
-+        test.write("        %s =3D gen_%s(n_%s, %d);\n" % (nam, type, n=
am, i))
-+        i =3D i + 1;
-=20
-     # add checks to avoid out-of-bounds array access
-     i =3D 0;
-@@ -797,7 +797,7 @@ test_%s(void) {
-         # assume that "size", "len", and "start" parameters apply to ei=
ther
-         # the nearest preceding or following char pointer
-         if type =3D=3D "int" and (nam =3D=3D "size" or nam =3D=3D "len"=
 or nam =3D=3D "start"):
--            for j in range(i - 1, -1, -1) + range(i + 1, len(t_args)):
-+            for j in (*range(i - 1, -1, -1), *range(i + 1, len(t_args))=
):
-                 (bnam, btype) =3D t_args[j][:2]
-                 if btype =3D=3D "const_char_ptr" or btype =3D=3D "const=
_xmlChar_ptr":
-                     test.write(
-@@ -806,42 +806,42 @@ test_%s(void) {
-                         "            continue;\n"
-                         % (bnam, nam, bnam))
-                     break
--	i =3D i + 1;
-+        i =3D i + 1;
-=20
-     # do the call, and clanup the result
--    if extra_pre_call.has_key(name):
--	test.write("        %s\n"% (extra_pre_call[name]))
-+    if name in extra_pre_call:
-+        test.write("        %s\n"% (extra_pre_call[name]))
-     if t_ret !=3D None:
--	test.write("\n        ret_val =3D %s(" % (name))
--	need =3D 0
--	for arg in t_args:
--	    (nam, type, rtype, crtype, info) =3D arg
--	    if need:
--	        test.write(", ")
--	    else:
--	        need =3D 1
--	    if rtype !=3D crtype:
--	        test.write("(%s)" % rtype)
--	    test.write("%s" % nam);
--	test.write(");\n")
--	if extra_post_call.has_key(name):
--	    test.write("        %s\n"% (extra_post_call[name]))
--	test.write("        desret_%s(ret_val);\n" % t_ret[0])
-+        test.write("\n        ret_val =3D %s(" % (name))
-+        need =3D 0
-+        for arg in t_args:
-+            (nam, type, rtype, crtype, info) =3D arg
-+            if need:
-+                test.write(", ")
-+            else:
-+                need =3D 1
-+            if rtype !=3D crtype:
-+                test.write("(%s)" % rtype)
-+            test.write("%s" % nam);
-+        test.write(");\n")
-+        if name in extra_post_call:
-+            test.write("        %s\n"% (extra_post_call[name]))
-+        test.write("        desret_%s(ret_val);\n" % t_ret[0])
-     else:
--	test.write("\n        %s(" % (name));
--	need =3D 0;
--	for arg in t_args:
--	    (nam, type, rtype, crtype, info) =3D arg;
--	    if need:
--	        test.write(", ")
--	    else:
--	        need =3D 1
--	    if rtype !=3D crtype:
--	        test.write("(%s)" % rtype)
--	    test.write("%s" % nam)
--	test.write(");\n")
--	if extra_post_call.has_key(name):
--	    test.write("        %s\n"% (extra_post_call[name]))
-+        test.write("\n        %s(" % (name));
-+        need =3D 0;
-+        for arg in t_args:
-+            (nam, type, rtype, crtype, info) =3D arg;
-+            if need:
-+                test.write(", ")
-+            else:
-+                need =3D 1
-+            if rtype !=3D crtype:
-+                test.write("(%s)" % rtype)
-+            test.write("%s" % nam)
-+        test.write(");\n")
-+        if name in extra_post_call:
-+            test.write("        %s\n"% (extra_post_call[name]))
-=20
-     test.write("        call_tests++;\n");
-=20
-@@ -849,32 +849,32 @@ test_%s(void) {
-     i =3D 0;
-     for arg in t_args:
-         (nam, type, rtype, crtype, info) =3D arg;
--	# This is a hack to prevent generating a destructor for the
--	# 'input' argument in xmlTextReaderSetup.  There should be
--	# a better, more generic way to do this!
--	if string.find(info, 'destroy') =3D=3D -1:
--	    test.write("        des_%s(n_%s, " % (type, nam))
--	    if rtype !=3D crtype:
--	        test.write("(%s)" % rtype)
--	    test.write("%s, %d);\n" % (nam, i))
--	i =3D i + 1;
-+        # This is a hack to prevent generating a destructor for the
-+        # 'input' argument in xmlTextReaderSetup.  There should be
-+        # a better, more generic way to do this!
-+        if info.find('destroy') =3D=3D -1:
-+            test.write("        des_%s(n_%s, " % (type, nam))
-+            if rtype !=3D crtype:
-+                test.write("(%s)" % rtype)
-+            test.write("%s, %d);\n" % (nam, i))
-+        i =3D i + 1;
-=20
-     test.write("        xmlResetLastError();\n");
-     # Check the memory usage
-     if no_mem =3D=3D 0:
--	test.write("""        if (mem_base !=3D xmlMemBlocks()) {
-+        test.write("""        if (mem_base !=3D xmlMemBlocks()) {
-             printf("Leak of %%d blocks found in %s",
--	           xmlMemBlocks() - mem_base);
--	    test_ret++;
-+\t           xmlMemBlocks() - mem_base);
-+\t    test_ret++;
- """ % (name));
--	for arg in t_args:
--	    (nam, type, rtype, crtype, info) =3D arg;
--	    test.write("""            printf(" %%d", n_%s);\n""" % (nam))
--	test.write("""            printf("\\n");\n""")
--	test.write("        }\n")
-+        for arg in t_args:
-+            (nam, type, rtype, crtype, info) =3D arg;
-+            test.write("""            printf(" %%d", n_%s);\n""" % (nam=
))
-+        test.write("""            printf("\\n");\n""")
-+        test.write("        }\n")
-=20
-     for arg in t_args:
--	test.write("    }\n")
-+        test.write("    }\n")
-=20
-     test.write("    function_tests++;\n")
-     #
-@@ -882,7 +882,7 @@ test_%s(void) {
-     #
-     while nb_cond > 0:
-         test.write("#endif\n")
--	nb_cond =3D nb_cond -1
-+        nb_cond =3D nb_cond -1
-     if define =3D=3D 1:
-         test.write("#endif\n")
-=20
-@@ -900,10 +900,10 @@ test_%s(void) {
- for module in modules:
-     # gather all the functions exported by that module
-     try:
--	functions =3D ctxt.xpathEval("/api/symbols/function[@file=3D'%s']" % (=
module))
-+        functions =3D ctxt.xpathEval("/api/symbols/function[@file=3D'%s=
']" % (module))
-     except:
--        print "Failed to gather functions from module %s" % (module)
--	continue;
-+        print("Failed to gather functions from module %s" % (module))
-+        continue;
-=20
-     # iterate over all functions in the module generating the test
-     i =3D 0
-@@ -923,14 +923,14 @@ test_%s(void) {
-     # iterate over all functions in the module generating the call
-     for function in functions:
-         name =3D function.xpathEval('string(@name)')
--	if is_skipped_function(name):
--	    continue
--	test.write("    test_ret +=3D test_%s();\n" % (name))
-+        if is_skipped_function(name):
-+            continue
-+        test.write("    test_ret +=3D test_%s();\n" % (name))
-=20
-     # footer
-     test.write("""
-     if (test_ret !=3D 0)
--	printf("Module %s: %%d errors\\n", test_ret);
-+\tprintf("Module %s: %%d errors\\n", test_ret);
-     return(test_ret);
- }
- """ % (module))
-@@ -948,7 +948,7 @@ test.write("""    return(0);
- }
- """);
-=20
--print "Generated test for %d modules and %d functions" %(len(modules), =
nb_tests)
-+print("Generated test for %d modules and %d functions" %(len(modules), =
nb_tests))
-=20
- compare_and_save()
-=20
-@@ -960,11 +960,8 @@ for missing in missing_types.keys():
-     n =3D len(missing_types[missing])
-     missing_list.append((n, missing))
-=20
--def compare_missing(a, b):
--    return b[0] - a[0]
--
--missing_list.sort(compare_missing)
--print "Missing support for %d functions and %d types see missing.lst" %=
 (missing_functions_nr, len(missing_list))
-+missing_list.sort(key=3Dlambda a: a[0])
-+print("Missing support for %d functions and %d types see missing.lst" %=
 (missing_functions_nr, len(missing_list)))
- lst =3D open("missing.lst", "w")
- lst.write("Missing support for %d types" % (len(missing_list)))
- lst.write("\n")
-@@ -974,9 +971,9 @@ for miss in missing_list:
-     for n in missing_types[miss[1]]:
-         i =3D i + 1
-         if i > 5:
--	    lst.write(" ...")
--	    break
--	lst.write(" %s" % (n))
-+            lst.write(" ...")
-+            break
-+        lst.write(" %s" % (n))
-     lst.write("\n")
- lst.write("\n")
- lst.write("\n")
diff --git a/meta/recipes-core/libxml/libxml2/fix-execution-of-ptests.pat=
ch b/meta/recipes-core/libxml/libxml2/fix-execution-of-ptests.patch
deleted file mode 100644
index ad719d4f5f9..00000000000
--- a/meta/recipes-core/libxml/libxml2/fix-execution-of-ptests.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 395c0f53ec226aaabedb166e6b3a7f8590b95a5f Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 11 May 2019 20:39:15 +0800
-Subject: [PATCH] Make sure that Makefile doesn't try to compile these te=
sts
- again on the target where the source dependencies won't be available.
-
-Upstream-Status: Inappropriate [cross-compile specific]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
-Rebase to 2.9.9
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile.am | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 8f4e43d..5edb930 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -211,8 +211,7 @@ install-ptest:
- 	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
- 	$(MAKE) -C python install-ptest
-=20
--runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
--          testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
-+runtests:
- 	[ -d test   ] || $(LN_S) $(srcdir)/test   .
- 	[ -d result ] || $(LN_S) $(srcdir)/result .
- 	$(CHECKER) ./runtest$(EXEEXT) && \
---=20
-2.7.4
-
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/=
recipes-core/libxml/libxml2/install-tests.patch
new file mode 100644
index 00000000000..b770afbeb49
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -0,0 +1,38 @@
+Add a target to install the test suite.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From c7809dc6947324ea506a0c2bf132ecd37156f211 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 5 Dec 2022 17:02:32 +0000
+Subject: [PATCH] add yocto-specific install-ptest target
+
+---
+ Makefile.am | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 316109b1..15e100be 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -26,6 +26,16 @@ check_PROGRAMS =3D \
+ 	testlimits \
+ 	testrecurse
+=20
++ptestdir=3D$(libexecdir)
++install-test-data: $(check_PROGRAMS)
++	install -d $(DESTDIR)$(ptestdir) $(DESTDIR)$(ptestdir)/python/
++	for T in $(check_PROGRAMS); do \
++		$(LIBTOOL) --mode=3Dinstall $(INSTALL_PROGRAM) $$T $(DESTDIR)$(ptestd=
ir) ;\
++	done
++	cp -r $(srcdir)/test $(DESTDIR)$(ptestdir)
++	cp -r $(srcdir)/result $(DESTDIR)$(ptestdir)
++	cp -r $(srcdir)/python/tests $(DESTDIR)$(ptestdir)/python
++
+ bin_PROGRAMS =3D xmllint xmlcatalog
+=20
+ nodist_bin_SCRIPTS =3D xml2-config
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.pat=
ch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
index cc9da88a29a..639c80bd6ce 100644
--- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
@@ -1,26 +1,8 @@
-From 7196bce35954c4b46391cb0139aeb15ed628fa54 Mon Sep 17 00:00:00 2001
-From: Tony Tascioglu <tony.tascioglu@windriver.com>
-Date: Fri, 14 May 2021 11:50:35 -0400
-Subject: [PATCH] AM_PATH_XML2 uses xml-config which we disable through
+Change the AM_PATH_XML2 macros to use pkg-config instead of xml2-config.
=20
-binconfig-disabled.bbclass, so port it to use pkg-config instead.
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/comm=
it/d598d8af0913b6e3d4e61ffa62397a275b669dca]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
-This cannot be upstreamed, as the original macro supports various
-optional arguments which cannot be supported with a direct call
-to pkg-config.
-
-Upstream-Status: Inappropriate [oe-core specific; see above]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Rebase to 2.9.9
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Updated to apply cleanly to v2.9.12
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
-
-Rebase to 2.9.14
-Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
----
  libxml.m4 | 189 ++----------------------------------------------------
  1 file changed, 5 insertions(+), 184 deletions(-)
=20
diff --git a/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.pat=
ch b/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch
deleted file mode 100644
index 956ff3f33e6..00000000000
--- a/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b038c3452667ed17ddb0e791cd7bdc7f8774ac29 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 11 May 2019 20:35:20 +0800
-Subject: [PATCH] Allow us to pass in PYTHON_SITE_PACKAGES
-
-The python binary used when building for nativesdk doesn't give us the
-correct path here so we need to be able to specify it ourselves.
-
-Upstream-Status: Inappropriate [config]
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-Rebase to 2.9.9
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index ca911f3..3bbd654 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -808,7 +808,8 @@ dnl
-=20
- PYTHON_VERSION=3D
- PYTHON_INCLUDES=3D
--PYTHON_SITE_PACKAGES=3D
-+# Allow this to be set externally
-+#PYTHON_SITE_PACKAGES=3D
- PYTHON_TESTS=3D
- pythondir=3D
- if test "$with_python" !=3D "no" ; then
---=20
-2.7.4
-
diff --git a/meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.pat=
ch b/meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch
deleted file mode 100644
index 66694af3886..00000000000
--- a/meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e49a0d4a8f3f725d6f683854e1cad36a3cd02962 Mon Sep 17 00:00:00 2001
-From: Tony Tascioglu <tony.tascioglu@windriver.com>
-Date: Wed, 19 May 2021 19:43:56 -0400
-Subject: [PATCH] Remove fuzz testing from executing with ptests.
-
-Upstream version 2.9.12 introduced new fuzz-testing and a corresponding
-folder fuzz. These tests are not required for ptests of this package.
-
-This patch removes the fuzz testing targets from the Makefile.
-Otherwise, running the ptests will fail due to the invalid directory.
-
-Upstream-Status: Inappropriate [oe specific]
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
----
- Makefile.am | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index a9284b95..3d7b344d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,9 +2,9 @@
-
- ACLOCAL_AMFLAGS =3D -I m4
-
--SUBDIRS =3D include . doc example fuzz xstc $(PYTHON_SUBDIR)
-+SUBDIRS =3D include . doc example xstc $(PYTHON_SUBDIR)
-
--DIST_SUBDIRS =3D include . doc example fuzz python xstc
-+DIST_SUBDIRS =3D include . doc example python xstc
-
- AM_CPPFLAGS =3D -I$(top_builddir)/include -I$(srcdir)/include
-
-@@ -210,7 +210,6 @@ runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) test=
api$(EXEEXT) \
- 	    $(CHECKER) ./runxmlconf$(EXEEXT)
- 	@(if [ "$(PYTHON_SUBDIR)" !=3D "" ] ; then cd python ; \
- 	    $(MAKE) tests ; fi)
--	@cd fuzz; $(MAKE) tests
-
- check: all runtests
-
---
-2.25.1
-
diff --git a/meta/recipes-core/libxml/libxml2/run-ptest b/meta/recipes-co=
re/libxml/libxml2/run-ptest
old mode 100644
new mode 100755
index c313d83263a..d5c7bb5b02f
--- a/meta/recipes-core/libxml/libxml2/run-ptest
+++ b/meta/recipes-core/libxml/libxml2/run-ptest
@@ -1,4 +1,20 @@
 #!/bin/sh
=20
+set -e
+
 export LC_ALL=3Den_US.UTF-8
-make -k runtests
+
+# testModule isn't that useful and hard-codes buildtree, so we don't run=
 that
+TESTS=3D"runtest testrecurse testchar testdict testThreads runxmlconf te=
stapi"
+
+for T in $TESTS; do
+    echo Running $T
+    ./$T && echo PASS: $T || echo FAIL: $T
+done
+
+if test -d python/tests; then
+    cd python/tests
+    for T in *.py; do
+        python3 ./$T && echo PASS: $T || echo FAIL: $T
+    done
+fi
diff --git a/meta/recipes-core/libxml/libxml2/runtest.patch b/meta/recipe=
s-core/libxml/libxml2/runtest.patch
deleted file mode 100644
index 42bb22cfd48..00000000000
--- a/meta/recipes-core/libxml/libxml2/runtest.patch
+++ /dev/null
@@ -1,849 +0,0 @@
-From 6172ccd1e74bc181f5298f19e240234e12876abe Mon Sep 17 00:00:00 2001
-From: Tony Tascioglu <tony.tascioglu@windriver.com>
-Date: Tue, 11 May 2021 11:57:46 -0400
-Subject: [PATCH] Add 'install-ptest' rule.
-
-Print a standard result line for each test.
-
-The patch needs a rework according to comments in the merge request.
-
-Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Upstream-Status: Inappropriate [https://gitlab.gnome.org/GNOME/libxml2/-=
/merge_requests/137]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
----
- Makefile.am   |   9 +++
- runsuite.c    |   1 +
- runtest.c     |   2 +
- runxmlconf.c  |   1 +
- testapi.c     | 122 ++++++++++++++++++++++++++-------------
- testchar.c    | 156 +++++++++++++++++++++++++++++++++++---------------
- testdict.c    |   1 +
- testlimits.c  |   1 +
- testrecurse.c |   2 +
- 9 files changed, 210 insertions(+), 85 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 05d1671f..ae622745 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -198,6 +198,15 @@ runxmlconf_LDADD=3D $(LDADDS)
- #testOOM_DEPENDENCIES =3D $(DEPS)
- #testOOM_LDADD=3D $(LDADDS)
-=20
-+install-ptest:
-+	@(if [ -d .libs ] ; then cd .libs; fi; \
-+	install $(check_PROGRAMS) $(DESTDIR))
-+	cp -r $(srcdir)/test $(DESTDIR)
-+	cp -r $(srcdir)/result $(DESTDIR)
-+	cp -r $(srcdir)/python $(DESTDIR)
-+	cp Makefile $(DESTDIR)
-+	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
-+
- runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
-           testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
- 	[ -d test   ] || $(LN_S) $(srcdir)/test   .
-diff --git a/runsuite.c b/runsuite.c
-index d24b5ec3..f7ff2521 100644
---- a/runsuite.c
-+++ b/runsuite.c
-@@ -1147,6 +1147,7 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIB=
UTE_UNUSED) {
-=20
-     if (logfile !=3D NULL)
-         fclose(logfile);
-+    printf("%s: runsuite\n\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-     return(ret);
- }
- #else /* !SCHEMAS */
-diff --git a/runtest.c b/runtest.c
-index ffa98d04..470f95cb 100644
---- a/runtest.c
-+++ b/runtest.c
-@@ -4508,6 +4508,7 @@ launchTests(testDescPtr tst) {
-     xmlCharEncCloseFunc(ebcdicHandler);
-     xmlCharEncCloseFunc(eucJpHandler);
-=20
-+    printf("%s: %s\n", (err =3D=3D 0) ? "PASS" : "FAIL", tst->desc);
-     return(err);
- }
-=20
-@@ -4588,6 +4589,7 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIB=
UTE_UNUSED) {
-     xmlCleanupParser();
-     xmlMemoryDump();
-=20
-+    printf("%s: runtest\n\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-     return(ret);
- }
-=20
-diff --git a/runxmlconf.c b/runxmlconf.c
-index 70f61017..e882b3a1 100644
---- a/runxmlconf.c
-+++ b/runxmlconf.c
-@@ -595,6 +595,7 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUT=
E_UNUSED) {
-=20
-     if (logfile !=3D NULL)
-         fclose(logfile);
-+    printf("%s: runxmlconf\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-     return(ret);
- }
-=20
-diff --git a/testapi.c b/testapi.c
-index ff8b470d..52b51d78 100644
---- a/testapi.c
-+++ b/testapi.c
-@@ -1246,49 +1246,91 @@ static int
- testlibxml2(void)
- {
-     int test_ret =3D 0;
--
--    test_ret +=3D test_HTMLparser();
--    test_ret +=3D test_HTMLtree();
--    test_ret +=3D test_SAX2();
--    test_ret +=3D test_c14n();
--    test_ret +=3D test_catalog();
--    test_ret +=3D test_chvalid();
--    test_ret +=3D test_debugXML();
--    test_ret +=3D test_dict();
--    test_ret +=3D test_encoding();
--    test_ret +=3D test_entities();
--    test_ret +=3D test_hash();
--    test_ret +=3D test_list();
--    test_ret +=3D test_nanoftp();
--    test_ret +=3D test_nanohttp();
--    test_ret +=3D test_parser();
--    test_ret +=3D test_parserInternals();
--    test_ret +=3D test_pattern();
--    test_ret +=3D test_relaxng();
--    test_ret +=3D test_schemasInternals();
--    test_ret +=3D test_schematron();
--    test_ret +=3D test_tree();
--    test_ret +=3D test_uri();
--    test_ret +=3D test_valid();
--    test_ret +=3D test_xinclude();
--    test_ret +=3D test_xmlIO();
--    test_ret +=3D test_xmlautomata();
--    test_ret +=3D test_xmlerror();
--    test_ret +=3D test_xmlmodule();
--    test_ret +=3D test_xmlreader();
--    test_ret +=3D test_xmlregexp();
--    test_ret +=3D test_xmlsave();
--    test_ret +=3D test_xmlschemas();
--    test_ret +=3D test_xmlschemastypes();
--    test_ret +=3D test_xmlstring();
--    test_ret +=3D test_xmlunicode();
--    test_ret +=3D test_xmlwriter();
--    test_ret +=3D test_xpath();
--    test_ret +=3D test_xpathInternals();
--    test_ret +=3D test_xpointer();
-+    int ret =3D 0;
-+
-+    test_ret +=3D (ret =3D test_HTMLparser());
-+    printf("%s: HTMLparser\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_HTMLtree());
-+    printf("%s: HTMLtree\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_SAX2());
-+    printf("%s: SAX2\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_c14n());
-+    printf("%s: c14n\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_catalog());
-+    printf("%s: catalog\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_chvalid());
-+    printf("%s: chvalid\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_debugXML());
-+    printf("%s: debugXML\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_dict());
-+    printf("%s: dict\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_encoding());
-+    printf("%s: encoding\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_entities());
-+    printf("%s: entities\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_hash());
-+    printf("%s: hash\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_list());
-+    printf("%s: list\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_nanoftp());
-+    printf("%s: nanoftp\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_nanohttp());
-+    printf("%s: nanohttp\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_parser());
-+    printf("%s: parser\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_parserInternals());
-+    printf("%s: parserInternals\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_pattern());
-+    printf("%s: pattern\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_relaxng());
-+    printf("%s: relaxng\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_schemasInternals());
-+    printf("%s: schemasInternals\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_schematron());
-+    printf("%s: schematron\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_tree());
-+    printf("%s: tree\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_uri());
-+    printf("%s: uri\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_valid());
-+    printf("%s: valid\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xinclude());
-+    printf("%s: xinclude\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xmlIO());
-+    printf("%s: xmlIO\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xmlautomata());
-+    printf("%s: xmlautomata\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xmlerror());
-+    printf("%s: xmlerror\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xmlmodule());
-+    printf("%s: xmlmodule\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xmlreader());
-+    printf("%s: xmlreader\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xmlregexp());
-+    printf("%s: xmlregexp\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xmlsave());
-+    printf("%s: xmlsave\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xmlschemas());
-+    printf("%s: xmlschemas\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xmlschemastypes());
-+    printf("%s: xmlschemastypes\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xmlstring());
-+    printf("%s: xmlstring\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xmlunicode());
-+    printf("%s: xmlunicode\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xmlwriter());
-+    printf("%s: xmlwriter\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xpath());
-+    printf("%s: xpath\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xpathInternals());
-+    printf("%s: xpathInternals\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-+    test_ret +=3D (ret =3D test_xpointer());
-+    printf("%s: xpointer\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-=20
-     printf("Total: %d functions, %d tests, %d errors\n",
-            function_tests, call_tests, test_ret);
-+
-+    printf("%s: testapi\n\n", (test_ret =3D=3D 0) ? "PASS" : "FAIL");
-     return(test_ret);
- }
-=20
-diff --git a/testchar.c b/testchar.c
-index 6866a175..7bce0132 100644
---- a/testchar.c
-+++ b/testchar.c
-@@ -23,7 +23,7 @@ static void errorHandler(void *unused, xmlErrorPtr err=
) {
- char document1[100] =3D "<doc>XXXX</doc>";
- char document2[100] =3D "<doc foo=3D'XXXX'/>";
-=20
--static void testDocumentRangeByte1(xmlParserCtxtPtr ctxt, char *documen=
t,
-+static int testDocumentRangeByte1(xmlParserCtxtPtr ctxt, char *document=
,
-                   int len,  char *data, int forbid1, int forbid2) {
-     int i;
-     xmlDocPtr res;
-@@ -37,33 +37,41 @@ static void testDocumentRangeByte1(xmlParserCtxtPtr =
ctxt, char *document,
- 	res =3D xmlReadMemory(document, len, "test", NULL, 0);
-=20
- 	if ((i =3D=3D forbid1) || (i =3D=3D forbid2)) {
--	    if ((lastError =3D=3D 0) || (res !=3D NULL))
-+	    if ((lastError =3D=3D 0) || (res !=3D NULL)) {
- 	        fprintf(stderr,
- 		    "Failed to detect invalid char for Byte 0x%02X: %c\n",
- 		        i, i);
-+		return(1);
-+	    }
- 	}
-=20
- 	else if ((i =3D=3D '<') || (i =3D=3D '&')) {
--	    if ((lastError =3D=3D 0) || (res !=3D NULL))
-+	    if ((lastError =3D=3D 0) || (res !=3D NULL)) {
- 	        fprintf(stderr,
- 		    "Failed to detect illegal char %c for Byte 0x%02X\n", i, i);
-+		return(1);
-+	    }
- 	}
- 	else if (((i < 0x20) || (i >=3D 0x80)) &&
- 	    (i !=3D 0x9) && (i !=3D 0xA) && (i !=3D 0xD)) {
--	    if ((lastError !=3D XML_ERR_INVALID_CHAR) && (res !=3D NULL))
-+	    if ((lastError !=3D XML_ERR_INVALID_CHAR) && (res !=3D NULL)) {
- 	        fprintf(stderr,
- 		    "Failed to detect invalid char for Byte 0x%02X\n", i);
-+		return(1);
-+	    }
- 	}
- 	else if (res =3D=3D NULL) {
- 	    fprintf(stderr,
- 		"Failed to parse valid char for Byte 0x%02X : %c\n", i, i);
-+		return(1);
- 	}
- 	if (res !=3D NULL)
- 	    xmlFreeDoc(res);
-     }
-+    return(0);
- }
-=20
--static void testDocumentRangeByte2(xmlParserCtxtPtr ctxt, char *documen=
t,
-+static int testDocumentRangeByte2(xmlParserCtxtPtr ctxt, char *document=
,
-                   int len,  char *data) {
-     int i, j;
-     xmlDocPtr res;
-@@ -80,10 +88,12 @@ static void testDocumentRangeByte2(xmlParserCtxtPtr =
ctxt, char *document,
-=20
- 	/* if first bit of first char is set, then second bit must too */
- 	if ((i & 0x80) && ((i & 0x40) =3D=3D 0)) {
--	    if ((lastError =3D=3D 0) || (res !=3D NULL))
-+	    if ((lastError =3D=3D 0) || (res !=3D NULL)) {
- 		fprintf(stderr,
- 		"Failed to detect invalid char for Bytes 0x%02X 0x%02X\n",
- 			i, j);
-+		return(1);
-+	    }
- 	}
-=20
- 	/*
-@@ -91,10 +101,12 @@ static void testDocumentRangeByte2(xmlParserCtxtPtr=
 ctxt, char *document,
- 	 * bits must be 10
- 	 */
- 	else if ((i & 0x80) && ((j & 0xC0) !=3D 0x80)) {
--	    if ((lastError =3D=3D 0) || (res !=3D NULL))
-+	    if ((lastError =3D=3D 0) || (res !=3D NULL)) {
- 		fprintf(stderr,
- 	    "Failed to detect invalid char for Bytes 0x%02X 0x%02X\n",
- 			i, j);
-+		return(1);
-+	    }
- 	}
-=20
- 	/*
-@@ -102,10 +114,12 @@ static void testDocumentRangeByte2(xmlParserCtxtPt=
r ctxt, char *document,
- 	 * than 0x80, i.e. one of bits 5 to 1 of i must be set
- 	 */
- 	else if ((i & 0x80) && ((i & 0x1E) =3D=3D 0)) {
--	    if ((lastError =3D=3D 0) || (res !=3D NULL))
-+	    if ((lastError =3D=3D 0) || (res !=3D NULL)) {
- 		fprintf(stderr,
- 	    "Failed to detect invalid char for Bytes 0x%02X 0x%02X\n",
- 			i, j);
-+		return(1);
-+	    }
- 	}
-=20
- 	/*
-@@ -113,10 +127,12 @@ static void testDocumentRangeByte2(xmlParserCtxtPt=
r ctxt, char *document,
- 	 * at least 3 bytes, but we give only 2 !
- 	 */
- 	else if ((i & 0xE0) =3D=3D 0xE0) {
--	    if ((lastError =3D=3D 0) || (res !=3D NULL))
-+	    if ((lastError =3D=3D 0) || (res !=3D NULL)) {
- 		fprintf(stderr,
- 	    "Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x00\n",
- 			i, j);
-+		return(1);
-+	    }
- 	}
-=20
- 	/*
-@@ -125,11 +141,13 @@ static void testDocumentRangeByte2(xmlParserCtxtPt=
r ctxt, char *document,
- 	else if ((lastError !=3D 0) || (res =3D=3D NULL)) {
- 	    fprintf(stderr,
- 		"Failed to parse document for Bytes 0x%02X 0x%02X\n", i, j);
-+	    return(1);
- 	}
- 	if (res !=3D NULL)
- 	    xmlFreeDoc(res);
-     }
-     }
-+    return(0);
- }
-=20
- /**
-@@ -141,9 +159,10 @@ static void testDocumentRangeByte2(xmlParserCtxtPtr=
 ctxt, char *document,
-  * CDATA in text or in attribute values.
-  */
-=20
--static void testDocumentRanges(void) {
-+static int testDocumentRanges(void) {
-     xmlParserCtxtPtr ctxt;
-     char *data;
-+    int test_ret =3D 0;
-=20
-     /*
-      * Set up a parsing context using the first document as
-@@ -152,7 +171,7 @@ static void testDocumentRanges(void) {
-     ctxt =3D xmlNewParserCtxt();
-     if (ctxt =3D=3D NULL) {
-         fprintf(stderr, "Failed to allocate parser context\n");
--	return;
-+	return(1);
-     }
-=20
-     printf("testing 1 byte char in document: 1");
-@@ -163,7 +182,7 @@ static void testDocumentRanges(void) {
-     data[2] =3D ' ';
-     data[3] =3D ' ';
-     /* test 1 byte injection at beginning of area */
--    testDocumentRangeByte1(ctxt, &document1[0], strlen(document1),
-+    test_ret +=3D testDocumentRangeByte1(ctxt, &document1[0], strlen(do=
cument1),
-                            data, -1, -1);
-     printf(" 2");
-     fflush(stdout);
-@@ -172,7 +191,7 @@ static void testDocumentRanges(void) {
-     data[2] =3D ' ';
-     data[3] =3D ' ';
-     /* test 1 byte injection at end of area */
--    testDocumentRangeByte1(ctxt, &document1[0], strlen(document1),
-+    test_ret +=3D testDocumentRangeByte1(ctxt, &document1[0], strlen(do=
cument1),
-                            data + 3, -1, -1);
-=20
-     printf(" 3");
-@@ -183,7 +202,7 @@ static void testDocumentRanges(void) {
-     data[2] =3D ' ';
-     data[3] =3D ' ';
-     /* test 1 byte injection at beginning of area */
--    testDocumentRangeByte1(ctxt, &document2[0], strlen(document2),
-+    test_ret +=3D testDocumentRangeByte1(ctxt, &document2[0], strlen(do=
cument2),
-                            data, '\'', -1);
-     printf(" 4");
-     fflush(stdout);
-@@ -192,7 +211,7 @@ static void testDocumentRanges(void) {
-     data[2] =3D ' ';
-     data[3] =3D ' ';
-     /* test 1 byte injection at end of area */
--    testDocumentRangeByte1(ctxt, &document2[0], strlen(document2),
-+    test_ret +=3D testDocumentRangeByte1(ctxt, &document2[0], strlen(do=
cument2),
-                            data + 3, '\'', -1);
-     printf(" done\n");
-=20
-@@ -204,7 +223,7 @@ static void testDocumentRanges(void) {
-     data[2] =3D ' ';
-     data[3] =3D ' ';
-     /* test 2 byte injection at beginning of area */
--    testDocumentRangeByte2(ctxt, &document1[0], strlen(document1),
-+    test_ret +=3D testDocumentRangeByte2(ctxt, &document1[0], strlen(do=
cument1),
-                            data);
-     printf(" 2");
-     fflush(stdout);
-@@ -213,7 +232,7 @@ static void testDocumentRanges(void) {
-     data[2] =3D ' ';
-     data[3] =3D ' ';
-     /* test 2 byte injection at end of area */
--    testDocumentRangeByte2(ctxt, &document1[0], strlen(document1),
-+    test_ret +=3D testDocumentRangeByte2(ctxt, &document1[0], strlen(do=
cument1),
-                            data + 2);
-=20
-     printf(" 3");
-@@ -224,7 +243,7 @@ static void testDocumentRanges(void) {
-     data[2] =3D ' ';
-     data[3] =3D ' ';
-     /* test 2 byte injection at beginning of area */
--    testDocumentRangeByte2(ctxt, &document2[0], strlen(document2),
-+    test_ret +=3D testDocumentRangeByte2(ctxt, &document2[0], strlen(do=
cument2),
-                            data);
-     printf(" 4");
-     fflush(stdout);
-@@ -233,14 +252,15 @@ static void testDocumentRanges(void) {
-     data[2] =3D ' ';
-     data[3] =3D ' ';
-     /* test 2 byte injection at end of area */
--    testDocumentRangeByte2(ctxt, &document2[0], strlen(document2),
-+    test_ret +=3D testDocumentRangeByte2(ctxt, &document2[0], strlen(do=
cument2),
-                            data + 2);
-     printf(" done\n");
-=20
-     xmlFreeParserCtxt(ctxt);
-+    return(test_ret);
- }
-=20
--static void testCharRangeByte1(xmlParserCtxtPtr ctxt, char *data) {
-+static int testCharRangeByte1(xmlParserCtxtPtr ctxt, char *data) {
-     int i =3D 0;
-     int len, c;
-=20
-@@ -255,19 +275,25 @@ static void testCharRangeByte1(xmlParserCtxtPtr ct=
xt, char *data) {
-         c =3D xmlCurrentChar(ctxt, &len);
- 	if ((i =3D=3D 0) || (i >=3D 0x80)) {
- 	    /* we must see an error there */
--	    if (lastError !=3D XML_ERR_INVALID_CHAR)
-+	    if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 	        fprintf(stderr,
- 		    "Failed to detect invalid char for Byte 0x%02X\n", i);
-+		return(1);
-+	    }
- 	} else if (i =3D=3D 0xD) {
--	    if ((c !=3D 0xA) || (len !=3D 1))
-+	    if ((c !=3D 0xA) || (len !=3D 1)) {
- 		fprintf(stderr, "Failed to convert char for Byte 0x%02X\n", i);
-+		return(1);
-+	    }
- 	} else if ((c !=3D i) || (len !=3D 1)) {
- 	    fprintf(stderr, "Failed to parse char for Byte 0x%02X\n", i);
-+	    return(1);
- 	}
-     }
-+    return(0);
- }
-=20
--static void testCharRangeByte2(xmlParserCtxtPtr ctxt, char *data) {
-+static int testCharRangeByte2(xmlParserCtxtPtr ctxt, char *data) {
-     int i, j;
-     int len, c;
-=20
-@@ -284,10 +310,12 @@ static void testCharRangeByte2(xmlParserCtxtPtr ct=
xt, char *data) {
-=20
- 	    /* if first bit of first char is set, then second bit must too */
- 	    if ((i & 0x80) && ((i & 0x40) =3D=3D 0)) {
--		if (lastError !=3D XML_ERR_INVALID_CHAR)
-+		if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 		    fprintf(stderr,
- 		    "Failed to detect invalid char for Bytes 0x%02X 0x%02X\n",
- 		            i, j);
-+		    return(1);
-+		}
- 	    }
-=20
- 	    /*
-@@ -295,10 +323,12 @@ static void testCharRangeByte2(xmlParserCtxtPtr ct=
xt, char *data) {
- 	     * bits must be 10
- 	     */
- 	    else if ((i & 0x80) && ((j & 0xC0) !=3D 0x80)) {
--		if (lastError !=3D XML_ERR_INVALID_CHAR)
-+		if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 		    fprintf(stderr,
- 		"Failed to detect invalid char for Bytes 0x%02X 0x%02X: %d\n",
- 		            i, j, c);
-+		    return(1);
-+		}
- 	    }
-=20
- 	    /*
-@@ -306,10 +336,12 @@ static void testCharRangeByte2(xmlParserCtxtPtr ct=
xt, char *data) {
- 	     * than 0x80, i.e. one of bits 5 to 1 of i must be set
- 	     */
- 	    else if ((i & 0x80) && ((i & 0x1E) =3D=3D 0)) {
--		if (lastError !=3D XML_ERR_INVALID_CHAR)
-+		if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 		    fprintf(stderr,
- 		"Failed to detect invalid char for Bytes 0x%02X 0x%02X: %d\n",
- 		            i, j, c);
-+		    return(1);
-+		}
- 	    }
-=20
- 	    /*
-@@ -317,10 +349,12 @@ static void testCharRangeByte2(xmlParserCtxtPtr ct=
xt, char *data) {
- 	     * at least 3 bytes, but we give only 2 !
- 	     */
- 	    else if ((i & 0xE0) =3D=3D 0xE0) {
--		if (lastError !=3D XML_ERR_INVALID_CHAR)
-+		if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 		    fprintf(stderr,
- 		"Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x00\n",
- 		            i, j);
-+		    return(1);
-+		}
- 	    }
-=20
-             /*
-@@ -329,6 +363,7 @@ static void testCharRangeByte2(xmlParserCtxtPtr ctxt=
, char *data) {
- 	    else if ((lastError !=3D 0) || (len !=3D 2)) {
- 		fprintf(stderr,
- 		    "Failed to parse char for Bytes 0x%02X 0x%02X\n", i, j);
-+		return(1);
- 	    }
-=20
-             /*
-@@ -338,12 +373,14 @@ static void testCharRangeByte2(xmlParserCtxtPtr ct=
xt, char *data) {
- 		fprintf(stderr,
- 	"Failed to parse char for Bytes 0x%02X 0x%02X: expect %d got %d\n",
- 	                i, j, ((j & 0x3F) + ((i & 0x1F) << 6)), c);
-+		return(1);
- 	    }
-         }
-     }
-+    return(0);
- }
-=20
--static void testCharRangeByte3(xmlParserCtxtPtr ctxt, char *data) {
-+static int testCharRangeByte3(xmlParserCtxtPtr ctxt, char *data) {
-     int i, j, k, K;
-     int len, c;
-     unsigned char lows[6] =3D {0, 0x80, 0x81, 0xC1, 0xFF, 0xBF};
-@@ -368,20 +405,24 @@ static void testCharRangeByte3(xmlParserCtxtPtr ct=
xt, char *data) {
- 	 * at least 4 bytes, but we give only 3 !
- 	 */
- 	if ((i & 0xF0) =3D=3D 0xF0) {
--	    if (lastError !=3D XML_ERR_INVALID_CHAR)
-+	    if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 		fprintf(stderr,
- 	"Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x%02X 0x%02X\n=
",
- 			i, j, K, data[3]);
-+		return(1);
-+	    }
- 	}
-=20
-         /*
- 	 * The second and the third bytes must start with 10
- 	 */
- 	else if (((j & 0xC0) !=3D 0x80) || ((K & 0xC0) !=3D 0x80)) {
--	    if (lastError !=3D XML_ERR_INVALID_CHAR)
-+	    if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 		fprintf(stderr,
- 	"Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x%02X\n",
- 			i, j, K);
-+		return(1);
-+	    }
- 	}
-=20
- 	/*
-@@ -390,10 +431,12 @@ static void testCharRangeByte3(xmlParserCtxtPtr ct=
xt, char *data) {
- 	 * the 6th byte of data[1] must be set
- 	 */
- 	else if (((i & 0xF) =3D=3D 0) && ((j & 0x20) =3D=3D 0)) {
--	    if (lastError !=3D XML_ERR_INVALID_CHAR)
-+	    if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 		fprintf(stderr,
- 	    "Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x%02X\n",
- 			i, j, K);
-+		return(1);
-+	    }
- 	}
-=20
-         /*
-@@ -401,10 +444,12 @@ static void testCharRangeByte3(xmlParserCtxtPtr ct=
xt, char *data) {
- 	 */
- 	else if (((value > 0xD7FF) && (value <0xE000)) ||
- 	         ((value > 0xFFFD) && (value <0x10000))) {
--	    if (lastError !=3D XML_ERR_INVALID_CHAR)
-+	    if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 		fprintf(stderr,
- 	"Failed to detect invalid char 0x%04X for Bytes 0x%02X 0x%02X 0x%02X\n=
",
- 			value, i, j, K);
-+		return(1);
-+	    }
- 	}
-=20
- 	/*
-@@ -414,6 +459,7 @@ static void testCharRangeByte3(xmlParserCtxtPtr ctxt=
, char *data) {
- 	    fprintf(stderr,
- 		"Failed to parse char for Bytes 0x%02X 0x%02X 0x%02X\n",
- 		    i, j, K);
-+	    return(1);
- 	}
-=20
- 	/*
-@@ -423,13 +469,15 @@ static void testCharRangeByte3(xmlParserCtxtPtr ct=
xt, char *data) {
- 	    fprintf(stderr,
-     "Failed to parse char for Bytes 0x%02X 0x%02X 0x%02X: expect %d got=
 %d\n",
- 		i, j, data[2], value, c);
-+	    return(1);
- 	}
-     }
-     }
-     }
-+    return(0);
- }
-=20
--static void testCharRangeByte4(xmlParserCtxtPtr ctxt, char *data) {
-+static int testCharRangeByte4(xmlParserCtxtPtr ctxt, char *data) {
-     int i, j, k, K, l, L;
-     int len, c;
-     unsigned char lows[6] =3D {0, 0x80, 0x81, 0xC1, 0xFF, 0xBF};
-@@ -458,10 +506,12 @@ static void testCharRangeByte4(xmlParserCtxtPtr ct=
xt, char *data) {
- 	 * at least 5 bytes, but we give only 4 !
- 	 */
- 	if ((i & 0xF8) =3D=3D 0xF8) {
--	    if (lastError !=3D XML_ERR_INVALID_CHAR)
-+	    if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 		fprintf(stderr,
-   "Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x%02X 0x%02X\=
n",
- 			i, j, K, data[3]);
-+		return(1);
-+	    }
- 	}
-=20
-         /*
-@@ -469,10 +519,12 @@ static void testCharRangeByte4(xmlParserCtxtPtr ct=
xt, char *data) {
- 	 */
- 	else if (((j & 0xC0) !=3D 0x80) || ((K & 0xC0) !=3D 0x80) ||
- 	         ((L & 0xC0) !=3D 0x80)) {
--	    if (lastError !=3D XML_ERR_INVALID_CHAR)
-+	    if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 		fprintf(stderr,
- 	"Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x%02X 0x%02X\n=
",
- 			i, j, K, L);
-+		return(1);
-+	    }
- 	}
-=20
- 	/*
-@@ -481,10 +533,12 @@ static void testCharRangeByte4(xmlParserCtxtPtr ct=
xt, char *data) {
- 	 * the 6 or 5th byte of j must be set
- 	 */
- 	else if (((i & 0x7) =3D=3D 0) && ((j & 0x30) =3D=3D 0)) {
--	    if (lastError !=3D XML_ERR_INVALID_CHAR)
-+	    if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 		fprintf(stderr,
- 	"Failed to detect invalid char for Bytes 0x%02X 0x%02X 0x%02X 0x%02X\n=
",
- 			i, j, K, L);
-+		return(1);
-+	    }
- 	}
-=20
-         /*
-@@ -493,10 +547,12 @@ static void testCharRangeByte4(xmlParserCtxtPtr ct=
xt, char *data) {
- 	else if (((value > 0xD7FF) && (value <0xE000)) ||
- 	         ((value > 0xFFFD) && (value <0x10000)) ||
- 		 (value > 0x10FFFF)) {
--	    if (lastError !=3D XML_ERR_INVALID_CHAR)
-+	    if (lastError !=3D XML_ERR_INVALID_CHAR) {
- 		fprintf(stderr,
- "Failed to detect invalid char 0x%04X for Bytes 0x%02X 0x%02X 0x%02X 0x=
%02X\n",
- 			value, i, j, K, L);
-+		return(1);
-+	    }
- 	}
-=20
- 	/*
-@@ -506,6 +562,7 @@ static void testCharRangeByte4(xmlParserCtxtPtr ctxt=
, char *data) {
- 	    fprintf(stderr,
- 		"Failed to parse char for Bytes 0x%02X 0x%02X 0x%02X\n",
- 		    i, j, K);
-+	    return(1);
- 	}
-=20
- 	/*
-@@ -515,11 +572,13 @@ static void testCharRangeByte4(xmlParserCtxtPtr ct=
xt, char *data) {
- 	    fprintf(stderr,
-     "Failed to parse char for Bytes 0x%02X 0x%02X 0x%02X: expect %d got=
 %d\n",
- 		i, j, data[2], value, c);
-+	    return(1);
- 	}
-     }
-     }
-     }
-     }
-+    return(0);
- }
-=20
- /**
-@@ -530,11 +589,12 @@ static void testCharRangeByte4(xmlParserCtxtPtr ct=
xt, char *data) {
-  * cover the full range of UTF-8 chars accepted by XML-1.0
-  */
-=20
--static void testCharRanges(void) {
-+static int testCharRanges(void) {
-     char data[5];
-     xmlParserCtxtPtr ctxt;
-     xmlParserInputBufferPtr buf;
-     xmlParserInputPtr input;
-+    int test_ret =3D 0;
-=20
-     memset(data, 0, 5);
-=20
-@@ -545,17 +605,19 @@ static void testCharRanges(void) {
-     ctxt =3D xmlNewParserCtxt();
-     if (ctxt =3D=3D NULL) {
-         fprintf(stderr, "Failed to allocate parser context\n");
--	return;
-+	return(1);
-     }
-     buf =3D xmlParserInputBufferCreateStatic(data, sizeof(data),
-                                            XML_CHAR_ENCODING_NONE);
-     if (buf =3D=3D NULL) {
-         fprintf(stderr, "Failed to allocate input buffer\n");
-+	test_ret =3D 1;
- 	goto error;
-     }
-     input =3D xmlNewInputStream(ctxt);
-     if (input =3D=3D NULL) {
-         xmlFreeParserInputBuffer(buf);
-+	test_ret =3D 1;
- 	goto error;
-     }
-     input->filename =3D NULL;
-@@ -567,25 +629,28 @@ static void testCharRanges(void) {
-=20
-     printf("testing char range: 1");
-     fflush(stdout);
--    testCharRangeByte1(ctxt, data);
-+    test_ret +=3D testCharRangeByte1(ctxt, data);
-     printf(" 2");
-     fflush(stdout);
--    testCharRangeByte2(ctxt, data);
-+    test_ret +=3D testCharRangeByte2(ctxt, data);
-     printf(" 3");
-     fflush(stdout);
--    testCharRangeByte3(ctxt, data);
-+    test_ret +=3D testCharRangeByte3(ctxt, data);
-     printf(" 4");
-     fflush(stdout);
--    testCharRangeByte4(ctxt, data);
-+    test_ret +=3D testCharRangeByte4(ctxt, data);
-     printf(" done\n");
-     fflush(stdout);
-=20
- error:
-     xmlFreeParserCtxt(ctxt);
-+    return(test_ret);
- }
-=20
- int main(void) {
-=20
-+    int ret =3D 0;
-+
-     /*
-      * this initialize the library and check potential ABI mismatches
-      * between the version it was compiled for and the actual shared
-@@ -602,8 +667,9 @@ int main(void) {
-     /*
-      * Run the tests
-      */
--    testCharRanges();
--    testDocumentRanges();
-+    ret +=3D testCharRanges();
-+    ret +=3D testDocumentRanges();
-+    printf("%s: testchar\n\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-=20
-     /*
-      * Cleanup function for the XML library.
-diff --git a/testdict.c b/testdict.c
-index 40bebd05..114b9347 100644
---- a/testdict.c
-+++ b/testdict.c
-@@ -440,5 +440,6 @@ int main(void)
-     clean_strings();
-     xmlCleanupParser();
-     xmlMemoryDump();
-+    printf("%s: testdict\n\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-     return(ret);
- }
-diff --git a/testlimits.c b/testlimits.c
-index 059116a6..f0bee68d 100644
---- a/testlimits.c
-+++ b/testlimits.c
-@@ -1634,5 +1634,6 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIB=
UTE_UNUSED) {
-     xmlCleanupParser();
-     xmlMemoryDump();
-=20
-+    printf("%s: testlimits\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-     return(ret);
- }
-diff --git a/testrecurse.c b/testrecurse.c
-index 0cbe25a6..3ecadb40 100644
---- a/testrecurse.c
-+++ b/testrecurse.c
-@@ -892,6 +892,7 @@ launchTests(testDescPtr tst) {
- 	    err++;
- 	}
-     }
-+    printf("%s: %s\n", (err =3D=3D 0) ? "PASS" : "FAIL", tst->desc);
-     return(err);
- }
-=20
-@@ -961,5 +962,6 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUT=
E_UNUSED) {
-     xmlCleanupParser();
-     xmlMemoryDump();
-=20
-+    printf("%s: testrecurse\n\n", (ret =3D=3D 0) ? "PASS" : "FAIL");
-     return(ret);
- }
---=20
-2.25.1
-
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-co=
re/libxml/libxml2_2.10.3.bb
similarity index 60%
rename from meta/recipes-core/libxml/libxml2_2.9.14.bb
rename to meta/recipes-core/libxml/libxml2_2.10.3.bb
index a2ed8d71bc1..32b37aacdb5 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.10.3.bb
@@ -14,18 +14,13 @@ DEPENDS =3D "zlib virtual/libiconv"
 inherit gnomebase
=20
 SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=3D$=
{BP};name=3Dtesttar \
-           file://libxml-64bit.patch \
-           file://runtest.patch \
            file://run-ptest \
-           file://python-sitepackages-dir.patch \
-           file://0001-Make-ptest-run-the-python-tests-if-python-is-enab=
led.patch \
-           file://fix-execution-of-ptests.patch \
-           file://remove-fuzz-from-ptests.patch \
+           file://libxml-64bit.patch \
+           file://install-tests.patch \
            file://libxml-m4-use-pkgconfig.patch \
-           file://0001-Port-gentest.py-to-Python-3.patch \
            "
=20
-SRC_URI[archive.sha256sum] =3D "60d74a257d1ccec0475e749cba2f21559e48139e=
fba6ff28224357c7c798dfee"
+SRC_URI[archive.sha256sum] =3D "5d2cc3d78bec3dbe212a9d7fa629ada25a7da928=
af432c93060ff5c17ee28a9c"
 SRC_URI[testtar.sha256sum] =3D "96151685cec997e1f9f3387e3626d61e6284d4d6=
e66e0e440c209286c03e9cc7"
=20
 BINCONFIG =3D "${bindir}/xml2-config"
@@ -44,7 +39,7 @@ inherit autotools pkgconfig binconfig-disabled ptest
=20
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetco=
nfig', '', d)}
=20
-RDEPENDS:${PN}-ptest +=3D "bash make ${@bb.utils.contains('PACKAGECONFIG=
', 'python', 'libgcc python3-core python3-logging python3-shell  python3-=
stringold python3-threading python3-unittest ${PN}-python', '', d)}"
+RDEPENDS:${PN}-ptest +=3D "bash make ${@bb.utils.contains('PACKAGECONFIG=
', 'python', 'libgcc python3-core python3-logging python3-shell python3-s=
tringold python3-threading python3-unittest ${PN}-python', '', d)}"
=20
 RDEPENDS:${PN}-python +=3D "${@bb.utils.contains('PACKAGECONFIG', 'pytho=
n', 'python3-core', '', d)}"
=20
@@ -55,13 +50,11 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D " glibc-gc=
onv-ebcdic-us \
                                            locale-base-en-us \
                                          "
=20
-export PYTHON_SITE_PACKAGES=3D"${PYTHON_SITEPACKAGES_DIR}"
-
 # WARNING: zlib is required for RPM use
-EXTRA_OECONF =3D "--without-debug --without-legacy --with-catalog --with=
out-docbook --with-c14n --without-lzma --with-fexceptions"
-EXTRA_OECONF:class-native =3D "--without-legacy --without-docbook --with=
-c14n --without-lzma --with-zlib"
-EXTRA_OECONF:class-nativesdk =3D "--without-legacy --without-docbook --w=
ith-c14n --without-lzma --with-zlib"
-EXTRA_OECONF:linuxstdbase =3D "--with-debug --with-legacy --with-docbook=
 --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF =3D "--without-debug --without-legacy --with-catalog --with=
-c14n --without-lzma --with-fexceptions"
+EXTRA_OECONF:class-native =3D "--without-legacy --with-c14n --without-lz=
ma --with-zlib"
+EXTRA_OECONF:class-nativesdk =3D "--without-legacy --with-c14n --without=
-lzma --with-zlib"
+EXTRA_OECONF:linuxstdbase =3D "--with-debug --with-legacy --with-c14n --=
without-lzma --with-zlib"
=20
 python populate_packages:prepend () {
     # autonamer would call this libxml2-2, but we don't want that
@@ -73,7 +66,6 @@ PACKAGE_BEFORE_PN +=3D "${PN}-utils"
 PACKAGES +=3D "${PN}-python"
=20
 FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.a"
-FILES:${PN}-dev +=3D "${libdir}/xml2Conf.sh"
 FILES:${PN}-utils =3D "${bindir}/*"
 FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
=20
@@ -82,39 +74,14 @@ do_configure:prepend () {
 	find ${S}/xmlconf/ -type f -exec chmod -x {} \+
 }
=20
-do_compile_ptest() {
-        # Make sure that testapi.c is newer than gentests.py, because
-        # with reproducible builds, they will both get e.g. Jan  1  1970
-        # modification time from SOURCE_DATE_EPOCH and then check-am
-        # might try to rebuild_testapi, which will fail even with
-        # 0001-Port-gentest.py-to-Python-3.patch, because it needs
-        # libxml2 module (libxml2-native dependency and correctly
-        # set PYTHON_SITE_PACKAGES), it's easier to
-        # just rely on pre-generated testapi.c from the release
-        touch ${S}/testapi.c
-
-	oe_runmake check-am
-}
-
 do_install_ptest () {
+    oe_runmake DESTDIR=3D${D} ptestdir=3D${PTEST_PATH} install-test-data
+
 	cp -r ${S}/xmlconf ${D}${PTEST_PATH}
-	if [ "${@bb.utils.filter('PACKAGECONFIG', 'python', d)}" ]; then
-		sed -i -e 's|^\(PYTHON =3D \).*|\1${USRBINPATH}/${PYTHON_PN}|' \
-		    ${D}${PTEST_PATH}/python/tests/Makefile
-		grep -lrZ '#!/usr/bin/python' ${D}${PTEST_PATH}/python |
-			xargs -0 sed -i -e 's|/usr/bin/python|${USRBINPATH}/${PYTHON_PN}|'
-	fi
-	#Remove build host references from various Makefiles
-	find "${D}${PTEST_PATH}" -name Makefile -type f -exec \
-	    sed -i \
-	    -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
-	    -e 's|${DEBUG_PREFIX_MAP}||g' \
-	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-	    -e 's:${RECIPE_SYSROOT}::g' \
-	    -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-	    -e '/^RELDATE/d' \
-	    {} +
+
+    if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false'=
, d)}; then
+        rm -rf ${D}${PTEST_DIR}/python
+    fi
 }
=20
 do_install:append:class-native () {
--=20
2.34.1


