Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07738C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 14:39:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27047.1647268767467165826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49572D6E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:39:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECA133F7D7
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:39:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH v2 1/2] python3-installer: add installer module
Date: Mon, 14 Mar 2022 14:39:22 +0000
Message-Id: <20220314143923.939188-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 14:39:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163150

Add a recipe for Installer, a minimal library/tool to install Python
Wheels.  Unlike PIP, it explicitly only installs wheels and does nothing
else.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python3-installer/interpreter.patch       | 61 +++++++++++++++++++
 .../python/python3-installer_0.5.1.bb         | 22 +++++++
 3 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-installer/interp=
reter.patch
 create mode 100644 meta/recipes-devtools/python/python3-installer_0.5.1.=
bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 3fceb6701b..1c605b0ecb 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -607,6 +607,7 @@ RECIPE_MAINTAINER:pn-python3-idna =3D "Bruce Ashfield=
 <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-importlib-metadata =3D "Tim Orling <tim.orl=
ing@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-iniconfig =3D "Tim Orling <tim.orling@konsu=
lko.com>"
 RECIPE_MAINTAINER:pn-python3-iniparse =3D "Oleksandr Kravchuk <open.sour=
ce@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-installer =3D "Ross Burton <ross.burton@arm=
.com>"
 RECIPE_MAINTAINER:pn-python3-jinja2 =3D "Richard Purdie <richard.purdie@=
linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-jsonpointer =3D "Bruce Ashfield <bruce.ashf=
ield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-jsonschema =3D "Bruce Ashfield <bruce.ashfi=
eld@gmail.com>"
diff --git a/meta/recipes-devtools/python/python3-installer/interpreter.p=
atch b/meta/recipes-devtools/python/python3-installer/interpreter.patch
new file mode 100644
index 0000000000..ef10ef1b45
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-installer/interpreter.patch
@@ -0,0 +1,61 @@
+Let us override the hashbang directly (possibly upstreamable), and don't
+play games with hashbangs: for now assume that even hashbangs with space=
s
+are simple (assume the spaces are only used to separate arguments) and
+we don't have long hashbangs.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/src/installer/__main__.py b/src/installer/__main__.py
+index 3357ec5..d2fd8d2 100644
+--- a/src/installer/__main__.py
++++ b/src/installer/__main__.py
+@@ -23,6 +23,13 @@ def _get_main_parser() -> argparse.ArgumentParser:
+         type=3Dstr,
+         help=3D"destination directory (prefix to prepend to each file)"=
,
+     )
++    parser.add_argument(
++        "--interpreter",
++        "-i",
++        type=3Dstr,
++        default=3Dsys.executable,
++        help=3Df"interpreter (defaults to {sys.executable})",
++    )
+     parser.add_argument(
+         "--compile-bytecode",
+         action=3D"append",
+@@ -73,7 +80,7 @@ def _main(cli_args: Sequence[str], program: Optional[s=
tr] =3D None) -> None:
+     with WheelFile.open(args.wheel) as source:
+         destination =3D SchemeDictionaryDestination(
+             scheme_dict=3D_get_scheme_dict(source.distribution),
+-            interpreter=3Dsys.executable,
++            interpreter=3Dargs.interpreter,
+             script_kind=3Dget_launcher_kind(),
+             bytecode_optimization_levels=3Dbytecode_levels,
+             destdir=3Dargs.destdir,
+diff --git a/src/installer/scripts.py b/src/installer/scripts.py
+index 7e3c8fc..ba6ed5a 100644
+--- a/src/installer/scripts.py
++++ b/src/installer/scripts.py
+@@ -59,20 +59,7 @@ def _build_shebang(executable: str, forlauncher: bool=
) -> bytes:
+     https://bitbucket.org/pypa/distlib/src/58cd5c6/distlib/scripts.py#l=
ines-124
+     """
+     executable_bytes =3D executable.encode("utf-8")
+-    if forlauncher:  # The launcher can just use the command as-is.
+-        return b"#!" + executable_bytes
+-    if _is_executable_simple(executable_bytes):
+-        return b"#!" + executable_bytes
+-
+-    # Shebang support for an executable with a space in it is under-spe=
cified
+-    # and platform-dependent, so we use a clever hack to generate a scr=
ipt to
+-    # run in ``/bin/sh`` that should work on all reasonably modern plat=
forms.
+-    # Read the following message to understand how the hack works:
+-    # https://github.com/pradyunsg/installer/pull/4#issuecomment-623668=
717
+-
+-    quoted =3D shlex.quote(executable).encode("utf-8")
+-    # I don't understand a lick what this is trying to do.
+-    return b"#!/bin/sh\n'''exec' " + quoted + b' "$0" "$@"\n' + b"' '''=
"
++    return b"#!" + executable_bytes
+
+
+ class InvalidScript(ValueError):
diff --git a/meta/recipes-devtools/python/python3-installer_0.5.1.bb b/me=
ta/recipes-devtools/python/python3-installer_0.5.1.bb
new file mode 100644
index 0000000000..12d9fce249
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-installer_0.5.1.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Library and tool for installing Python wheels"
+DESCRIPTION =3D "A low-level library for installing a Python package fro=
m a wheel distribution."
+HOMEPAGE =3D "https://installer.readthedocs.io/"
+BUGTRACKER =3D "https://github.com/pypa/installer/issues"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5038641aec7a77451e31da828ebfa=
e00"
+
+SRC_URI +=3D "file://interpreter.patch"
+
+SRC_URI[sha256sum] =3D "f970995ec2bb815e2fdaf7977b26b2091e1e386f0f42eafd=
5ac811953dc5d445"
+
+inherit pypi flit_core
+
+DEPENDS:remove:class-native =3D "python3-installer-native"
+DEPENDS:append:class-native =3D " unzip-native"
+
+do_install:class-native () {
+    python_pep517_do_bootstrap_install
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


