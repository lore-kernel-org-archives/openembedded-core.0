Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D41CD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 10:36:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5674.1779100586891283324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 03:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=YMMYVu+n;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 465054617
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:36:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 051833F85F
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779100586; bh=I3SGgE0bE420M+ihWe1X30kRNhpwPAJ7GjW8Nxjbtqg=;
	h=From:To:Subject:Date:From;
	b=YMMYVu+nYQriTdAxt+1VNX+lPb7CEvu8KvYa0PnM48gkTIhtQezyhy4lgpBGP4IcU
	 DHl9xPTiY5Esv0ZM6Ek0wve+kCnmyYD7IJTSR8Z5NNYJLRbkras+bAGNGHiJ9f9j8q
	 z6karZEs5G9GbIMaYZyI7UikMoLtIaHafB9FuLuI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-installer: upgrade 0.7.0 -> 1.0.1
Date: Mon, 18 May 2026 11:36:24 +0100
Message-ID: <20260518103624.598829-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 10:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237218

v1.0.1 (May 11, 2026)
- Include docs and tests in sdist again (#322)
- Fix long path issue on Windows (#321)
- Fix date in changelog (#324)
- Use `os.path.abspath()` instead of `Path.resolve()` for performance (#3=
26)

v1.0.0 (Mar 28, 2026)

- Drop support for Python 3.9, 3.8, and 3.7 (#305, #242, #206)
- Add support and Python 3.13 and 3.14 (#201, #282)
- Add `--overwrite-existing` CLI option (#216)
- Add `--validate-record` CLI option (#161)
- Support installing multiple wheels (#203)
- Handle invalid hash algorithms (#179)
- Stream-based validation instead of in-memory (#98)
- Add validate_stream methods (#99)
- Consolidate and refine validation APIs (#108, #111)
- Sort entries before writing RECORD (#245)
- Do not install __pycache__ from wheels (#307)
- Fix a path traversal bug (#317)
- Update launcher scripts and Windows behavior (#212, #181)
- Fix Windows relpath bug (#286)
- Migrate to dataclasses (#200)
- Use cached_property for memoization (#243)
- Refactor installer.scripts (#239)
- Decouple test modules (#104)
- Avoid cross-module imports from .utils (#102)
- Lazy imports for performance (#226)
- Complete type annotations and enforce strict mypy (#173)
- Deprecate RecordEntry.validate (#186)
- Fix documentation typos and grammar (#309, #210)
- Improve docstrings and internal documentation (#100)

Remove an upstreamed patch, and rewrite the patch adding an --interpreter
option.

Verified that building everything in oe-core that uses the pep517 class
is identical before and after the upgrade.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ils.py-sort-entries-before-writing-o.patch | 27 ------
 .../python3-installer/interpreter.patch       | 85 ++++++++++---------
 ...er_0.7.0.bb =3D> python3-installer_1.0.1.bb} |  5 +-
 3 files changed, 45 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-installer/0001-s=
rc-installer-utils.py-sort-entries-before-writing-o.patch
 rename meta/recipes-devtools/python/{python3-installer_0.7.0.bb =3D> pyt=
hon3-installer_1.0.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-installer/0001-src-inst=
aller-utils.py-sort-entries-before-writing-o.patch b/meta/recipes-devtool=
s/python/python3-installer/0001-src-installer-utils.py-sort-entries-befor=
e-writing-o.patch
deleted file mode 100644
index a6715ed457d..00000000000
--- a/meta/recipes-devtools/python/python3-installer/0001-src-installer-u=
tils.py-sort-entries-before-writing-o.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 760ddf50ce559abd67bbdd31797267d00bcddfb3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 1 Oct 2024 19:22:11 +0200
-Subject: [PATCH] src/installer/utils.py: sort entries before writing out
- RECORD file
-
-This helps build reproducibility.
-
-Upstream-Status: Submitted [https://github.com/pypa/installer/pull/245]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/installer/utils.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/installer/utils.py b/src/installer/utils.py
-index 3e601d6..073297c 100644
---- a/src/installer/utils.py
-+++ b/src/installer/utils.py
-@@ -207,7 +207,7 @@ def construct_record_file(
-         io.BytesIO(), encoding=3D"utf-8", write_through=3DTrue, newline=
=3D""
-     )
-     writer =3D csv.writer(stream, delimiter=3D",", quotechar=3D'"', lin=
eterminator=3D"\n")
--    for scheme, record in records:
-+    for scheme, record in sorted(records, key=3Dlambda x: x[1].path):
-         writer.writerow(record.to_row(prefix_for_scheme(scheme)))
-     stream.seek(0)
-     return stream.detach()
diff --git a/meta/recipes-devtools/python/python3-installer/interpreter.p=
atch b/meta/recipes-devtools/python/python3-installer/interpreter.patch
index 7906769b901..0a5d34a349a 100644
--- a/meta/recipes-devtools/python/python3-installer/interpreter.patch
+++ b/meta/recipes-devtools/python/python3-installer/interpreter.patch
@@ -1,23 +1,24 @@
-From 74fe171fa4a25c120607e9f8450cbdfee675c959 Mon Sep 17 00:00:00 2001
+From 22fa800b4cbcfddd57fa262fd7f2aeb06a15a711 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 14 Mar 2022 14:39:22 +0000
-Subject: [PATCH] python3-installer: add installer module
+Subject: [PATCH 1/2] installer: add --interpreter option
=20
-Let us override the hashbang directly (possibly upstreamable), and don't
-play games with hashbangs: for now assume that even hashbangs with space=
s
-are simple (assume the spaces are only used to separate arguments) and
-we don't have long hashbangs.
+The currently running Python might not be the right one for the installe=
d
+wheels, so add an option to allow the interpreter to be overridden.
=20
-Upstream-Status: Inappropriate
+This is essential in cross/distro builds where we want to install a
+wheel into a working directory to build a distro package (eg a rpm or
+deb) with pypa/installer, but the currently running python on the build
+host might not be the right path for the scripts to use on the target.
+
+Upstream-Status: Submitted [https://github.com/pypa/installer/pull/332]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
- src/installer/__main__.py |  9 ++++++++-
- src/installer/scripts.py  | 15 +--------------
- 2 files changed, 9 insertions(+), 15 deletions(-)
+ src/installer/__main__.py | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
=20
 diff --git a/src/installer/__main__.py b/src/installer/__main__.py
-index 51014b9..38de286 100644
+index b7a7445..25415ea 100644
 --- a/src/installer/__main__.py
 +++ b/src/installer/__main__.py
 @@ -30,6 +30,13 @@ def _get_main_parser() -> argparse.ArgumentParser:
@@ -34,38 +35,38 @@ index 51014b9..38de286 100644
      parser.add_argument(
          "--compile-bytecode",
          action=3D"append",
-@@ -86,7 +93,7 @@ def _main(cli_args: Sequence[str], program: Optional[s=
tr] =3D None) -> None:
-     with WheelFile.open(args.wheel) as source:
-         destination =3D SchemeDictionaryDestination(
-             scheme_dict=3D_get_scheme_dict(source.distribution, prefix=3D=
args.prefix),
--            interpreter=3Dsys.executable,
-+            interpreter=3Dargs.interpreter,
-             script_kind=3Dget_launcher_kind(),
-             bytecode_optimization_levels=3Dbytecode_levels,
-             destdir=3Dargs.destdir,
+@@ -102,7 +109,7 @@ def _main(cli_args: Sequence[str], program: str | No=
ne =3D None) -> None:
+                 source.validate_record(validate_contents=3Dargs.validat=
e_record =3D=3D "all")
+             destination =3D SchemeDictionaryDestination(
+                 scheme_dict=3D_get_scheme_dict(source.distribution, pre=
fix=3Dargs.prefix),
+-                interpreter=3Dsys.executable,
++                interpreter=3Dargs.interpreter,
+                 script_kind=3Dget_launcher_kind(),
+                 bytecode_optimization_levels=3Dbytecode_levels,
+                 destdir=3Dargs.destdir,
 diff --git a/src/installer/scripts.py b/src/installer/scripts.py
-index 7e3c8fc..ba6ed5a 100644
+index b21a72e..551941f 100644
 --- a/src/installer/scripts.py
 +++ b/src/installer/scripts.py
-@@ -59,20 +59,7 @@ def _build_shebang(executable: str, forlauncher: bool=
) -> bytes:
-     https://bitbucket.org/pypa/distlib/src/58cd5c6/distlib/scripts.py#l=
ines-124
-     """
-     executable_bytes =3D executable.encode("utf-8")
--    if forlauncher:  # The launcher can just use the command as-is.
--        return b"#!" + executable_bytes
--    if _is_executable_simple(executable_bytes):
--        return b"#!" + executable_bytes
+@@ -138,17 +138,4 @@ class Script:
+         https://bitbucket.org/pypa/distlib/src/58cd5c6/distlib/scripts.=
py#lines-124
+         """
+         executable_bytes =3D executable.encode("utf-8")
+-        if forlauncher:  # The launcher can just use the command as-is.
+-            return b"#!" + executable_bytes
+-        if self._is_executable_simple(executable_bytes):
+-            return b"#!" + executable_bytes
 -
--    # Shebang support for an executable with a space in it is under-spe=
cified
--    # and platform-dependent, so we use a clever hack to generate a scr=
ipt to
--    # run in ``/bin/sh`` that should work on all reasonably modern plat=
forms.
--    # Read the following message to understand how the hack works:
--    # https://github.com/pradyunsg/installer/pull/4#issuecomment-623668=
717
+-        # Shebang support for an executable with a space in it is under=
-specified
+-        # and platform-dependent, so we use a clever hack to generate a=
 script to
+-        # run in ``/bin/sh`` that should work on all reasonably modern =
platforms.
+-        # Read the following message to understand how the hack works:
+-        # https://github.com/pypa/installer/pull/4#issuecomment-6236687=
17
 -
--    quoted =3D shlex.quote(executable).encode("utf-8")
--    # I don't understand a lick what this is trying to do.
--    return b"#!/bin/sh\n'''exec' " + quoted + b' "$0" "$@"\n' + b"' '''=
"
-+    return b"#!" + executable_bytes
-=20
-=20
- class InvalidScript(ValueError):
+-        quoted =3D shlex.quote(executable).encode("utf-8")
+-        # I don't understand a lick what this is trying to do.
+-        return b"#!/bin/sh\n'''exec' " + quoted + b' "$0" "$@"\n' + b"'=
 '''"
++        return b"#!" + executable_bytes
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-installer_0.7.0.bb b/me=
ta/recipes-devtools/python/python3-installer_1.0.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-installer_0.7.0.bb
rename to meta/recipes-devtools/python/python3-installer_1.0.1.bb
index 6aaf1b3a379..6727f8e21e8 100644
--- a/meta/recipes-devtools/python/python3-installer_0.7.0.bb
+++ b/meta/recipes-devtools/python/python3-installer_1.0.1.bb
@@ -6,10 +6,9 @@ BUGTRACKER =3D "https://github.com/pypa/installer/issues=
"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5038641aec7a77451e31da828ebfa=
e00"
=20
-SRC_URI +=3D "file://interpreter.patch \
-            file://0001-src-installer-utils.py-sort-entries-before-writi=
ng-o.patch"
+SRC_URI +=3D "file://interpreter.patch"
=20
-SRC_URI[sha256sum] =3D "a26d3e3116289bb08216e0d0f7d925fcef0b0194eedfa0c9=
44bcaaa106c4b631"
+SRC_URI[sha256sum] =3D "052c7fc3721d54c696e2dea019be67539d7b144e924f559f=
54beb3121831c364"
=20
 inherit pypi python_flit_core
=20
--=20
2.43.0


