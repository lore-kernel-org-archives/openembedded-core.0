Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F5BC4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 12:10:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11729.1670501442329859308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 04:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6B0723A;
	Thu,  8 Dec 2022 04:10:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59AA73F73B;
	Thu,  8 Dec 2022 04:10:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libxml2: add more testing
Date: Thu,  8 Dec 2022 12:10:39 +0000
Message-Id: <20221208121039.3507174-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 12:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174401

Backport more test cases fixes from upstream, and add runsuite to the
ptests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libxml/libxml2/fix-tests.patch            | 222 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2/run-ptest    |   2 +-
 meta/recipes-core/libxml/libxml2_2.10.3.bb    |   1 +
 3 files changed, 224 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/fix-tests.patch

diff --git a/meta/recipes-core/libxml/libxml2/fix-tests.patch b/meta/reci=
pes-core/libxml/libxml2/fix-tests.patch
new file mode 100644
index 00000000000..80678efcfee
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/fix-tests.patch
@@ -0,0 +1,222 @@
+Backport the following patches to fix the reader2 and runsuite test case=
s:
+
+b92768cd tests: Enable "runsuite" test
+0ac8c15e python/tests/reader2: use absolute paths everywhere
+b9ba5e1d python/tests/reader2: always exit(1) if a test fails
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/python/tests/reader2.py b/python/tests/reader2.py
+index 65cecd47..6e6353b4 100755
+--- a/python/tests/reader2.py
++++ b/python/tests/reader2.py
+@@ -6,7 +6,6 @@
+ import sys
+ import glob
+ import os
+-import string
+ import libxml2
+ try:
+     import StringIO
+@@ -20,103 +19,104 @@ libxml2.debugMemory(1)
+=20
+ err =3D ""
+ basedir =3D os.path.dirname(os.path.realpath(__file__))
+-dir_prefix =3D os.path.join(basedir, "../../test/valid/")
++dir_prefix =3D os.path.realpath(os.path.join(basedir, "..", "..", "test=
", "valid"))
++
+ # This dictionary reflects the contents of the files
+ # ../../test/valid/*.xml.err that are not empty, except that
+ # the file paths in the messages start with ../../test/
+=20
+ expect =3D {
+     '766956':
+-"""../../test/valid/dtds/766956.dtd:2: parser error : PEReference: expe=
cting ';'
++"""{0}/dtds/766956.dtd:2: parser error : PEReference: expecting ';'
+ %=C3=A4%ent;
+    ^
+-../../test/valid/dtds/766956.dtd:2: parser error : Content error in the=
 external subset
++{0}/dtds/766956.dtd:2: parser error : Content error in the external sub=
set
+ %=C3=A4%ent;
+         ^
+ Entity: line 1:=20
+ value
+ ^
+-""",
++""".format(dir_prefix),
+     '781333':
+-"""../../test/valid/781333.xml:4: element a: validity error : Element a=
 content does not follow the DTD, expecting ( ..., got=20
++"""{0}/781333.xml:4: element a: validity error : Element a content does=
 not follow the DTD, expecting ( ..., got=20
+ <a/>
+     ^
+-../../test/valid/781333.xml:5: element a: validity error : Element a co=
ntent does not follow the DTD, Expecting more child
++{0}/781333.xml:5: element a: validity error : Element a content does no=
t follow the DTD, Expecting more child
+=20
+ ^
+-""",
++""".format(dir_prefix),
+     'cond_sect2':
+-"""../../test/valid/dtds/cond_sect2.dtd:15: parser error : All markup o=
f the conditional section is not in the same entity
++"""{0}/dtds/cond_sect2.dtd:15: parser error : All markup of the conditi=
onal section is not in the same entity
+     %ent;
+          ^
+ Entity: line 1:=20
+ ]]>
+ ^
+-../../test/valid/dtds/cond_sect2.dtd:17: parser error : Content error i=
n the external subset
++{0}/dtds/cond_sect2.dtd:17: parser error : Content error in the externa=
l subset
+=20
+ ^
+-""",
++""".format(dir_prefix),
+     'rss':
+-"""../../test/valid/rss.xml:177: element rss: validity error : Element =
rss does not carry attribute version
++"""{0}/rss.xml:177: element rss: validity error : Element rss does not =
carry attribute version
+ </rss>
+       ^
+-""",
++""".format(dir_prefix),
+     't8':
+-"""../../test/valid/t8.xml:6: parser error : internal error: xmlParseIn=
ternalSubset: error detected in Markup declaration
++"""{0}/t8.xml:6: parser error : internal error: xmlParseInternalSubset:=
 error detected in Markup declaration
+=20
+ %defroot; %defmiddle; %deftest;
+          ^
+ Entity: line 1:=20
+ &lt;!ELEMENT root (middle) >
+ ^
+-../../test/valid/t8.xml:6: parser error : internal error: xmlParseInter=
nalSubset: error detected in Markup declaration
++{0}/t8.xml:6: parser error : internal error: xmlParseInternalSubset: er=
ror detected in Markup declaration
+=20
+ %defroot; %defmiddle; %deftest;
+                      ^
+ Entity: line 1:=20
+ &lt;!ELEMENT middle (test) >
+ ^
+-../../test/valid/t8.xml:6: parser error : internal error: xmlParseInter=
nalSubset: error detected in Markup declaration
++{0}/t8.xml:6: parser error : internal error: xmlParseInternalSubset: er=
ror detected in Markup declaration
+=20
+ %defroot; %defmiddle; %deftest;
+                                ^
+ Entity: line 1:=20
+ &lt;!ELEMENT test (#PCDATA) >
+ ^
+-""",
++""".format(dir_prefix),
+     't8a':
+-"""../../test/valid/t8a.xml:6: parser error : internal error: xmlParseI=
nternalSubset: error detected in Markup declaration
++"""{0}/t8a.xml:6: parser error : internal error: xmlParseInternalSubset=
: error detected in Markup declaration
+=20
+ %defroot;%defmiddle;%deftest;
+          ^
+ Entity: line 1:=20
+ &lt;!ELEMENT root (middle) >
+ ^
+-../../test/valid/t8a.xml:6: parser error : internal error: xmlParseInte=
rnalSubset: error detected in Markup declaration
++{0}/t8a.xml:6: parser error : internal error: xmlParseInternalSubset: e=
rror detected in Markup declaration
+=20
+ %defroot;%defmiddle;%deftest;
+                     ^
+ Entity: line 1:=20
+ &lt;!ELEMENT middle (test) >
+ ^
+-../../test/valid/t8a.xml:6: parser error : internal error: xmlParseInte=
rnalSubset: error detected in Markup declaration
++{0}/t8a.xml:6: parser error : internal error: xmlParseInternalSubset: e=
rror detected in Markup declaration
+=20
+ %defroot;%defmiddle;%deftest;
+                              ^
+ Entity: line 1:=20
+ &lt;!ELEMENT test (#PCDATA) >
+ ^
+-""",
++""".format(dir_prefix),
+     'xlink':
+-"""../../test/valid/xlink.xml:450: element termdef: validity error : ID=
 dt-arc already defined
++"""{0}/xlink.xml:450: element termdef: validity error : ID dt-arc alrea=
dy defined
+ 	<p><termdef id=3D"dt-arc" term=3D"Arc">An <ter
+ 	                                  ^
+ validity error : attribute def line 199 references an unknown ID "dt-xl=
g"
+-""",
++""".format(dir_prefix),
+ }
+=20
+ # Add prefix_dir and extension to the keys
+-expect =3D {"{}{}.xml".format(dir_prefix, key): val for key, val in exp=
ect.items()}
++expect =3D {os.path.join(dir_prefix, key + ".xml"): val for key, val in=
 expect.items()}
+=20
+ def callback(ctx, str):
+     global err
+@@ -124,11 +124,12 @@ def callback(ctx, str):
+ libxml2.registerErrorHandler(callback, "")
+=20
+ parsing_error_files =3D ["766956", "cond_sect2", "t8", "t8a"]
+-expect_parsing_error =3D ["{}{}.xml".format(dir_prefix, f) for f in par=
sing_error_files]
++expect_parsing_error =3D [os.path.join(dir_prefix, f + ".xml") for f in=
 parsing_error_files]
+=20
+-valid_files =3D glob.glob(dir_prefix + "*.x*")
++valid_files =3D glob.glob(os.path.join(dir_prefix, "*.x*"))
+ assert valid_files, "found no valid files in '{}'".format(dir_prefix)
+ valid_files.sort()
++failures =3D 0
+ for file in valid_files:
+     err =3D ""
+     reader =3D libxml2.newTextReaderFilename(file)
+@@ -142,9 +143,15 @@ for file in valid_files:
+         #sys.exit(1)
+     if (err):
+         if not(file in expect and err =3D=3D expect[file]):
++            failures +=3D 1
+             print("Error: ", err)
+             if file in expect:
+                 print("Expected: ", expect[file])
++
++if failures:
++    print("Failed %d tests" % failures)
++    sys.exit(1)
++
+ #
+ # another separate test based on Stephane Bidoul one
+ #
+@@ -337,9 +344,11 @@ while reader.Read() =3D=3D 1:
+ if res !=3D expect:
+     print("test5 failed: unexpected output")
+     print(res)
++    sys.exit(1)
+ if err !=3D "":
+     print("test5 failed: validation error found")
+     print(err)
++    sys.exit(1)
+=20
+ #
+ # cleanup
+diff --git a/runsuite.c b/runsuite.c
+index 483490a2..a522d24b 100644
+--- a/runsuite.c
++++ b/runsuite.c
+@@ -1054,13 +1054,18 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTR=
IBUTE_UNUSED) {
+     old_tests =3D nb_tests;
+     old_leaks =3D nb_leaks;
+     xsdTest();
+-    if ((nb_errors =3D=3D old_errors) && (nb_leaks =3D=3D old_leaks))
+-	printf("Ran %d tests, no errors\n", nb_tests - old_tests);
+-    else
+-	printf("Ran %d tests, %d errors, %d leaks\n",
+-	       nb_tests - old_tests,
+-	       nb_errors - old_errors,
+-	       nb_leaks - old_leaks);
++    printf("Ran %d tests, %d errors, %d leaks\n",
++           nb_tests - old_tests,
++           nb_errors - old_errors,
++           nb_leaks - old_leaks);
++    if (nb_errors - old_errors =3D=3D 10) {
++        printf("10 errors were expected\n");
++        nb_errors =3D old_errors;
++    } else {
++        printf("10 errors were expected, got %d errors\n",
++               nb_errors - old_errors);
++        nb_errors =3D old_errors + 1;
++    }
+     old_errors =3D nb_errors;
+     old_tests =3D nb_tests;
+     old_leaks =3D nb_leaks;
diff --git a/meta/recipes-core/libxml/libxml2/run-ptest b/meta/recipes-co=
re/libxml/libxml2/run-ptest
index d5c7bb5b02f..f252a78f179 100755
--- a/meta/recipes-core/libxml/libxml2/run-ptest
+++ b/meta/recipes-core/libxml/libxml2/run-ptest
@@ -5,7 +5,7 @@ set -e
 export LC_ALL=3Den_US.UTF-8
=20
 # testModule isn't that useful and hard-codes buildtree, so we don't run=
 that
-TESTS=3D"runtest testrecurse testchar testdict testThreads runxmlconf te=
stapi"
+TESTS=3D"runtest runsuite testrecurse testchar testdict testThreads runx=
mlconf testapi"
=20
 for T in $TESTS; do
     echo Running $T
diff --git a/meta/recipes-core/libxml/libxml2_2.10.3.bb b/meta/recipes-co=
re/libxml/libxml2_2.10.3.bb
index 32b37aacdb5..645d102e785 100644
--- a/meta/recipes-core/libxml/libxml2_2.10.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.10.3.bb
@@ -16,6 +16,7 @@ inherit gnomebase
 SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=3D$=
{BP};name=3Dtesttar \
            file://run-ptest \
            file://libxml-64bit.patch \
+           file://fix-tests.patch \
            file://install-tests.patch \
            file://libxml-m4-use-pkgconfig.patch \
            "
--=20
2.34.1


