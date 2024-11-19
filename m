Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1145DD4417E
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 16:10:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25279.1732032614205080727
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 08:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6749820E3
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 08:10:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 11BF23F66E
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 08:10:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cython: swap prefix-mapping patch for an upstream commit
Date: Tue, 19 Nov 2024 16:10:07 +0000
Message-Id: <20241119161007.2700429-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 16:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207393

Upstream has solved the absolute path problem differently by taking
paths relative to the top of the module.  This appears to solve the
problem, at least I've not found any cases where it breaks.

Drop my patch, and backport the relevant commit from upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cython.bbclass            |   3 -
 ...lative-paths-in-generated-C-code.-GH.patch |  73 +++++++++
 .../python3-cython/0001-WIP-prefix-map.patch  | 148 ------------------
 .../python/python3-cython_3.0.11.bb           |   2 +-
 4 files changed, 74 insertions(+), 152 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-cython/0001-Outp=
ut-import-relative-paths-in-generated-C-code.-GH.patch
 delete mode 100644 meta/recipes-devtools/python/python3-cython/0001-WIP-=
prefix-map.patch

diff --git a/meta/classes-recipe/cython.bbclass b/meta/classes-recipe/cyt=
hon.bbclass
index 53b84f5f5eb..dd9fc732bcb 100644
--- a/meta/classes-recipe/cython.bbclass
+++ b/meta/classes-recipe/cython.bbclass
@@ -1,8 +1,5 @@
 DEPENDS:append =3D " python3-cython-native"
=20
-# Remap the build paths that appear in generated .c code
-export CYTHON_PREFIX_MAP =3D "${S}=3D${TARGET_DBGSRC_DIR} ${B}=3D${TARGE=
T_DBGSRC_DIR}"
-
 do_compile[postfuncs] =3D "strip_cython_metadata"
 strip_cython_metadata() {
     # Remove the Cython Metadata headers that we don't need after the bu=
ild, and
diff --git a/meta/recipes-devtools/python/python3-cython/0001-Output-impo=
rt-relative-paths-in-generated-C-code.-GH.patch b/meta/recipes-devtools/p=
ython/python3-cython/0001-Output-import-relative-paths-in-generated-C-cod=
e.-GH.patch
new file mode 100644
index 00000000000..bbafc294163
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cython/0001-Output-import-rela=
tive-paths-in-generated-C-code.-GH.patch
@@ -0,0 +1,73 @@
+From 9b5f3b09f76899eba510c2d8f3ed2b0f752a4d1b Mon Sep 17 00:00:00 2001
+From: Oscar Benjamin <oscar.j.benjamin@gmail.com>
+Date: Sat, 24 Aug 2024 08:30:31 +0100
+Subject: [PATCH] Output import-relative paths in generated C code. (GH-6=
341)
+
+When cython is run on a file that is not in the current working director=
y,
+it outputs filepaths that are either absolute or are basenames.
+It is not good to output absolute paths in the generated C code and
+basenames mess up coverage measurement.
+
+Upstream-Status: Backport [20bceea6b19ffc2f65b9fba2e4f737f09e5a2b20]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Cython/Compiler/ExprNodes.py  | 8 +++++++-
+ Cython/Compiler/ModuleNode.py | 9 ++++++---
+ 2 files changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/Cython/Compiler/ExprNodes.py b/Cython/Compiler/ExprNodes.py
+index a6bb1688e..0fbb15368 100644
+--- a/Cython/Compiler/ExprNodes.py
++++ b/Cython/Compiler/ExprNodes.py
+@@ -21,6 +21,7 @@ import re
+ import sys
+ import copy
+ import os.path
++import pathlib
+ import operator
+=20
+ from .Errors import (
+@@ -10072,7 +10073,12 @@ class CodeObjectNode(ExprNode):
+         func_name =3D code.get_py_string_const(
+             func.name, identifier=3DTrue, is_str=3DFalse, unicode_value=
=3Dfunc.name)
+         # FIXME: better way to get the module file path at module init =
time? Encoding to use?
+-        file_path =3D StringEncoding.bytes_literal(func.pos[0].get_file=
nametable_entry().encode('utf8'), 'utf8')
++        file_path =3D func.pos[0].get_filenametable_entry()
++        if os.path.isabs(file_path):
++            file_path =3D func.pos[0].get_description()
++        # Always use / as separator
++        file_path =3D pathlib.Path(file_path).as_posix()
++        file_path =3D StringEncoding.bytes_literal(file_path.encode('ut=
f-8'), 'utf8')
+         file_path_const =3D code.get_py_string_const(file_path, identif=
ier=3DFalse, is_str=3DTrue)
+=20
+         # This combination makes CPython create a new dict for "frame.f=
_locals" (see GH #1836).
+diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.=
py
+index 43c6b5f07..8c29d6db7 100644
+--- a/Cython/Compiler/ModuleNode.py
++++ b/Cython/Compiler/ModuleNode.py
+@@ -13,6 +13,7 @@ from collections import defaultdict
+ import json
+ import operator
+ import os
++import pathlib
+ import re
+ import sys
+=20
+@@ -944,9 +945,11 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
+             for source_desc in code.globalstate.filename_list:
+                 file_path =3D source_desc.get_filenametable_entry()
+                 if isabs(file_path):
+-                    file_path =3D basename(file_path)  # never include =
absolute paths
+-                escaped_filename =3D file_path.replace("\\", "\\\\").re=
place('"', r'\"')
+-                escaped_filename =3D as_encoded_filename(escaped_filena=
me)
++                    # never include absolute paths
++                    file_path =3D source_desc.get_description()
++                # Always use / as separator
++                file_path =3D pathlib.Path(file_path).as_posix()
++                escaped_filename =3D as_encoded_filename(file_path)
+                 code.putln('%s,' % escaped_filename.as_c_string_literal=
())
+         else:
+             # Some C compilers don't like an empty array
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-cython/0001-WIP-prefix-=
map.patch b/meta/recipes-devtools/python/python3-cython/0001-WIP-prefix-m=
ap.patch
deleted file mode 100644
index adc9463ffa7..00000000000
--- a/meta/recipes-devtools/python/python3-cython/0001-WIP-prefix-map.pat=
ch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 4d1b7911372561b22e03c7f2b4ec807502b5b9c1 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 4 Nov 2024 15:36:39 +0000
-Subject: [PATCH] WIP prefix map
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- Cython/Compiler/CmdLine.py  | 9 ++++++++-
- Cython/Compiler/Main.py     | 9 +++++----
- Cython/Compiler/Options.py  | 1 +
- Cython/Compiler/Parsing.py  | 1 +
- Cython/Compiler/Scanning.py | 9 +++++++--
- 5 files changed, 22 insertions(+), 7 deletions(-)
-
-diff --git a/Cython/Compiler/CmdLine.py b/Cython/Compiler/CmdLine.py
-index 776636c..f5a7c79 100644
---- a/Cython/Compiler/CmdLine.py
-+++ b/Cython/Compiler/CmdLine.py
-@@ -74,6 +74,12 @@ class SetAnnotateCoverageAction(Action):
-         namespace.annotate =3D True
-         namespace.annotate_coverage_xml =3D values
-=20
-+class SetPrefixMapAction(Action):
-+    def __call__(self, parser, namespace, values, option_string=3DNone)=
:
-+        mappings =3D getattr(namespace, self.dest, {})
-+        k, v =3D values.split("=3D", 1)
-+        mappings[k] =3D v
-+        setattr(namespace, self.dest, mappings)
-=20
- def create_cython_argparser():
-     description =3D "Cython (https://cython.org/) is a compiler for cod=
e written in the "\
-@@ -157,9 +163,10 @@ def create_cython_argparser():
-                            'deduced from the import path if source file=
 is in '
-                            'a package, or equals the filename otherwise=
.')
-     parser.add_argument('-M', '--depfile', action=3D'store_true', help=3D=
'produce depfiles for the sources')
-+    # TODO: add help
-+    parser.add_argument("--prefix-map", action=3DSetPrefixMapAction)
-     parser.add_argument('sources', nargs=3D'*', default=3D[])
-=20
--    # TODO: add help
-     parser.add_argument("-z", "--pre-import", dest=3D'pre_import', acti=
on=3D'store', type=3Dstr, help=3DSUPPRESS)
-     parser.add_argument("--convert-range", dest=3D'convert_range', acti=
on=3D'store_true', help=3DSUPPRESS)
-     parser.add_argument("--no-c-in-traceback", dest=3D'c_line_in_traceb=
ack', action=3D'store_false', help=3DSUPPRESS)
-diff --git a/Cython/Compiler/Main.py b/Cython/Compiler/Main.py
-index 80946c0..28cfe68 100644
---- a/Cython/Compiler/Main.py
-+++ b/Cython/Compiler/Main.py
-@@ -70,7 +70,7 @@ class Context(object):
-     language_level =3D None  # warn when not set but default to Py2
-=20
-     def __init__(self, include_directories, compiler_directives, cpp=3D=
False,
--                 language_level=3DNone, options=3DNone):
-+                 language_level=3DNone, prefix_map=3DNone, options=3DNo=
ne):
-         # cython_scope is a hack, set to False by subclasses, in order =
to break
-         # an infinite loop.
-         # Better code organization would fix it.
-@@ -83,6 +83,7 @@ class Context(object):
-         self.future_directives =3D set()
-         self.compiler_directives =3D compiler_directives
-         self.cpp =3D cpp
-+        self.prefix_map =3D prefix_map or {}
-         self.options =3D options
-=20
-         self.pxds =3D {}  # full name -> node tree
-@@ -98,7 +99,7 @@ class Context(object):
-     @classmethod
-     def from_options(cls, options):
-         return cls(options.include_path, options.compiler_directives,
--                   options.cplus, options.language_level, options=3Dopt=
ions)
-+                   options.cplus, options.language_level, prefix_map=3D=
options.prefix_map, options=3Doptions)
-=20
-     def set_language_level(self, level):
-         from .Future import print_function, unicode_literals, absolute_=
import, division, generator_stop
-@@ -259,7 +260,7 @@ class Context(object):
-                     rel_path =3D module_name.replace('.', os.sep) + os.=
path.splitext(pxd_pathname)[1]
-                     if not pxd_pathname.endswith(rel_path):
-                         rel_path =3D pxd_pathname  # safety measure to =
prevent printing incorrect paths
--                    source_desc =3D FileSourceDescriptor(pxd_pathname, =
rel_path)
-+                    source_desc =3D FileSourceDescriptor(pxd_pathname, =
rel_path, prefix_map=3Dself.prefix_map)
-                     err, result =3D self.process_pxd(source_desc, scope=
, qualified_name)
-                     if err:
-                         raise err
-@@ -509,7 +510,7 @@ def run_pipeline(source, options, full_module_name=3D=
None, context=3DNone):
-             rel_path =3D source  # safety measure to prevent printing i=
ncorrect paths
-     else:
-         rel_path =3D abs_path
--    source_desc =3D FileSourceDescriptor(abs_path, rel_path)
-+    source_desc =3D FileSourceDescriptor(abs_path, rel_path, prefix_map=
=3Dcontext.prefix_map)
-     source =3D CompilationSource(source_desc, full_module_name, cwd)
-=20
-     # Set up result object
-diff --git a/Cython/Compiler/Options.py b/Cython/Compiler/Options.py
-index 61950a7..cc52732 100644
---- a/Cython/Compiler/Options.py
-+++ b/Cython/Compiler/Options.py
-@@ -796,4 +796,5 @@ default_options =3D dict(
-     create_extension=3DNone,
-     np_pythran=3DFalse,
-     legacy_implicit_noexcept=3DNone,
-+    prefix_map=3Ddict(pair.split("=3D", 1) for pair in os.environ.get("=
CYTHON_PREFIX_MAP", "").split()),
- )
-diff --git a/Cython/Compiler/Parsing.py b/Cython/Compiler/Parsing.py
-index 25c0de9..6c0eccf 100644
---- a/Cython/Compiler/Parsing.py
-+++ b/Cython/Compiler/Parsing.py
-@@ -2106,6 +2106,7 @@ def p_include_statement(s, ctx):
-             s.included_files.append(include_file_name)
-             with Utils.open_source_file(include_file_path) as f:
-                 source_desc =3D FileSourceDescriptor(include_file_path)
-+                print(f"TODO Cannot use prefix map on {include_file_pat=
h}")
-                 s2 =3D PyrexScanner(f, source_desc, s, source_encoding=3D=
f.encoding, parse_comments=3Ds.parse_comments)
-                 tree =3D p_statement_list(s2, ctx)
-             return tree
-diff --git a/Cython/Compiler/Scanning.py b/Cython/Compiler/Scanning.py
-index 372392b..0fa3b30 100644
---- a/Cython/Compiler/Scanning.py
-+++ b/Cython/Compiler/Scanning.py
-@@ -195,7 +195,7 @@ class FileSourceDescriptor(SourceDescriptor):
-     optional name argument and will be passed back when asking for
-     the position()-tuple.
-     """
--    def __init__(self, filename, path_description=3DNone):
-+    def __init__(self, filename, path_description=3DNone, prefix_map=3D=
{}):
-         filename =3D Utils.decode_filename(filename)
-         self.path_description =3D path_description or filename
-         self.filename =3D filename
-@@ -205,6 +205,7 @@ class FileSourceDescriptor(SourceDescriptor):
-         self.set_file_type_from_name(filename)
-         self._cmp_name =3D filename
-         self._lines =3D {}
-+        self.prefix_map =3D prefix_map
-=20
-     def get_lines(self, encoding=3DNone, error_handling=3DNone):
-         # we cache the lines only the second time this is called, in
-@@ -243,7 +244,11 @@ class FileSourceDescriptor(SourceDescriptor):
-         return path
-=20
-     def get_filenametable_entry(self):
--        return self.file_path
-+        entry =3D self.file_path
-+        for k, v in self.prefix_map.items():
-+            # TODO: should just replace the prefix
-+            entry =3D entry.replace(k, v)
-+        return entry
-=20
-     def __eq__(self, other):
-         return isinstance(other, FileSourceDescriptor) and self.filenam=
e =3D=3D other.filename
diff --git a/meta/recipes-devtools/python/python3-cython_3.0.11.bb b/meta=
/recipes-devtools/python/python3-cython_3.0.11.bb
index 020a8e7205c..2501e6ed232 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.11.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
@@ -7,7 +7,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D61c3ee8961575861fa86c7e62=
bc9f69c"
=20
-SRC_URI +=3D "file://0001-WIP-prefix-map.patch"
+SRC_URI +=3D "file://0001-Output-import-relative-paths-in-generated-C-co=
de.-GH.patch"
 SRC_URI[sha256sum] =3D "7146dd2af8682b4ca61331851e6aebce9fe5158e75300343=
f80c07ca80b1faff"
=20
 inherit pypi setuptools3 cython
--=20
2.34.1


