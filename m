Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A0ED5AE5E
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 11:56:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11171.1731066977286435026
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 03:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD0F2339
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Nov 2024 03:56:46 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 814663F528
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Nov 2024 03:56:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/4] python3-cython: add patch to prefix map source paths in generated files
Date: Fri,  8 Nov 2024 11:55:56 +0000
Message-Id: <20241108115559.770860-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 11:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206864

Cython generates C source code that contains mentions to the original
.py files, which results in build paths being embedded inside the
binaries.

Implement prefix remapping to change these build paths to point at the
target debug directory, so that we don't leak build paths and have
reproducible builds.

This patch is currently not submitted upstream, but will be shortly and
I expect it to evolve before being merged.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-cython/0001-WIP-prefix-map.patch  | 148 ++++++++++++++++++
 .../python/python3-cython_3.0.11.bb           |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cython/0001-WIP-=
prefix-map.patch

diff --git a/meta/recipes-devtools/python/python3-cython/0001-WIP-prefix-=
map.patch b/meta/recipes-devtools/python/python3-cython/0001-WIP-prefix-m=
ap.patch
new file mode 100644
index 00000000000..adc9463ffa7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cython/0001-WIP-prefix-map.pat=
ch
@@ -0,0 +1,148 @@
+From 4d1b7911372561b22e03c7f2b4ec807502b5b9c1 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 4 Nov 2024 15:36:39 +0000
+Subject: [PATCH] WIP prefix map
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Cython/Compiler/CmdLine.py  | 9 ++++++++-
+ Cython/Compiler/Main.py     | 9 +++++----
+ Cython/Compiler/Options.py  | 1 +
+ Cython/Compiler/Parsing.py  | 1 +
+ Cython/Compiler/Scanning.py | 9 +++++++--
+ 5 files changed, 22 insertions(+), 7 deletions(-)
+
+diff --git a/Cython/Compiler/CmdLine.py b/Cython/Compiler/CmdLine.py
+index 776636c..f5a7c79 100644
+--- a/Cython/Compiler/CmdLine.py
++++ b/Cython/Compiler/CmdLine.py
+@@ -74,6 +74,12 @@ class SetAnnotateCoverageAction(Action):
+         namespace.annotate =3D True
+         namespace.annotate_coverage_xml =3D values
+=20
++class SetPrefixMapAction(Action):
++    def __call__(self, parser, namespace, values, option_string=3DNone)=
:
++        mappings =3D getattr(namespace, self.dest, {})
++        k, v =3D values.split("=3D", 1)
++        mappings[k] =3D v
++        setattr(namespace, self.dest, mappings)
+=20
+ def create_cython_argparser():
+     description =3D "Cython (https://cython.org/) is a compiler for cod=
e written in the "\
+@@ -157,9 +163,10 @@ def create_cython_argparser():
+                            'deduced from the import path if source file=
 is in '
+                            'a package, or equals the filename otherwise=
.')
+     parser.add_argument('-M', '--depfile', action=3D'store_true', help=3D=
'produce depfiles for the sources')
++    # TODO: add help
++    parser.add_argument("--prefix-map", action=3DSetPrefixMapAction)
+     parser.add_argument('sources', nargs=3D'*', default=3D[])
+=20
+-    # TODO: add help
+     parser.add_argument("-z", "--pre-import", dest=3D'pre_import', acti=
on=3D'store', type=3Dstr, help=3DSUPPRESS)
+     parser.add_argument("--convert-range", dest=3D'convert_range', acti=
on=3D'store_true', help=3DSUPPRESS)
+     parser.add_argument("--no-c-in-traceback", dest=3D'c_line_in_traceb=
ack', action=3D'store_false', help=3DSUPPRESS)
+diff --git a/Cython/Compiler/Main.py b/Cython/Compiler/Main.py
+index 80946c0..28cfe68 100644
+--- a/Cython/Compiler/Main.py
++++ b/Cython/Compiler/Main.py
+@@ -70,7 +70,7 @@ class Context(object):
+     language_level =3D None  # warn when not set but default to Py2
+=20
+     def __init__(self, include_directories, compiler_directives, cpp=3D=
False,
+-                 language_level=3DNone, options=3DNone):
++                 language_level=3DNone, prefix_map=3DNone, options=3DNo=
ne):
+         # cython_scope is a hack, set to False by subclasses, in order =
to break
+         # an infinite loop.
+         # Better code organization would fix it.
+@@ -83,6 +83,7 @@ class Context(object):
+         self.future_directives =3D set()
+         self.compiler_directives =3D compiler_directives
+         self.cpp =3D cpp
++        self.prefix_map =3D prefix_map or {}
+         self.options =3D options
+=20
+         self.pxds =3D {}  # full name -> node tree
+@@ -98,7 +99,7 @@ class Context(object):
+     @classmethod
+     def from_options(cls, options):
+         return cls(options.include_path, options.compiler_directives,
+-                   options.cplus, options.language_level, options=3Dopt=
ions)
++                   options.cplus, options.language_level, prefix_map=3D=
options.prefix_map, options=3Doptions)
+=20
+     def set_language_level(self, level):
+         from .Future import print_function, unicode_literals, absolute_=
import, division, generator_stop
+@@ -259,7 +260,7 @@ class Context(object):
+                     rel_path =3D module_name.replace('.', os.sep) + os.=
path.splitext(pxd_pathname)[1]
+                     if not pxd_pathname.endswith(rel_path):
+                         rel_path =3D pxd_pathname  # safety measure to =
prevent printing incorrect paths
+-                    source_desc =3D FileSourceDescriptor(pxd_pathname, =
rel_path)
++                    source_desc =3D FileSourceDescriptor(pxd_pathname, =
rel_path, prefix_map=3Dself.prefix_map)
+                     err, result =3D self.process_pxd(source_desc, scope=
, qualified_name)
+                     if err:
+                         raise err
+@@ -509,7 +510,7 @@ def run_pipeline(source, options, full_module_name=3D=
None, context=3DNone):
+             rel_path =3D source  # safety measure to prevent printing i=
ncorrect paths
+     else:
+         rel_path =3D abs_path
+-    source_desc =3D FileSourceDescriptor(abs_path, rel_path)
++    source_desc =3D FileSourceDescriptor(abs_path, rel_path, prefix_map=
=3Dcontext.prefix_map)
+     source =3D CompilationSource(source_desc, full_module_name, cwd)
+=20
+     # Set up result object
+diff --git a/Cython/Compiler/Options.py b/Cython/Compiler/Options.py
+index 61950a7..cc52732 100644
+--- a/Cython/Compiler/Options.py
++++ b/Cython/Compiler/Options.py
+@@ -796,4 +796,5 @@ default_options =3D dict(
+     create_extension=3DNone,
+     np_pythran=3DFalse,
+     legacy_implicit_noexcept=3DNone,
++    prefix_map=3Ddict(pair.split("=3D", 1) for pair in os.environ.get("=
CYTHON_PREFIX_MAP", "").split()),
+ )
+diff --git a/Cython/Compiler/Parsing.py b/Cython/Compiler/Parsing.py
+index 25c0de9..6c0eccf 100644
+--- a/Cython/Compiler/Parsing.py
++++ b/Cython/Compiler/Parsing.py
+@@ -2106,6 +2106,7 @@ def p_include_statement(s, ctx):
+             s.included_files.append(include_file_name)
+             with Utils.open_source_file(include_file_path) as f:
+                 source_desc =3D FileSourceDescriptor(include_file_path)
++                print(f"TODO Cannot use prefix map on {include_file_pat=
h}")
+                 s2 =3D PyrexScanner(f, source_desc, s, source_encoding=3D=
f.encoding, parse_comments=3Ds.parse_comments)
+                 tree =3D p_statement_list(s2, ctx)
+             return tree
+diff --git a/Cython/Compiler/Scanning.py b/Cython/Compiler/Scanning.py
+index 372392b..0fa3b30 100644
+--- a/Cython/Compiler/Scanning.py
++++ b/Cython/Compiler/Scanning.py
+@@ -195,7 +195,7 @@ class FileSourceDescriptor(SourceDescriptor):
+     optional name argument and will be passed back when asking for
+     the position()-tuple.
+     """
+-    def __init__(self, filename, path_description=3DNone):
++    def __init__(self, filename, path_description=3DNone, prefix_map=3D=
{}):
+         filename =3D Utils.decode_filename(filename)
+         self.path_description =3D path_description or filename
+         self.filename =3D filename
+@@ -205,6 +205,7 @@ class FileSourceDescriptor(SourceDescriptor):
+         self.set_file_type_from_name(filename)
+         self._cmp_name =3D filename
+         self._lines =3D {}
++        self.prefix_map =3D prefix_map
+=20
+     def get_lines(self, encoding=3DNone, error_handling=3DNone):
+         # we cache the lines only the second time this is called, in
+@@ -243,7 +244,11 @@ class FileSourceDescriptor(SourceDescriptor):
+         return path
+=20
+     def get_filenametable_entry(self):
+-        return self.file_path
++        entry =3D self.file_path
++        for k, v in self.prefix_map.items():
++            # TODO: should just replace the prefix
++            entry =3D entry.replace(k, v)
++        return entry
+=20
+     def __eq__(self, other):
+         return isinstance(other, FileSourceDescriptor) and self.filenam=
e =3D=3D other.filename
diff --git a/meta/recipes-devtools/python/python3-cython_3.0.11.bb b/meta=
/recipes-devtools/python/python3-cython_3.0.11.bb
index 980cb046365..efce67d0921 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.11.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
@@ -7,6 +7,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D61c3ee8961575861fa86c7e62=
bc9f69c"
=20
+SRC_URI +=3D "file://0001-WIP-prefix-map.patch"
 SRC_URI[sha256sum] =3D "7146dd2af8682b4ca61331851e6aebce9fe5158e75300343=
f80c07ca80b1faff"
=20
 inherit pypi setuptools3
--=20
2.34.1


