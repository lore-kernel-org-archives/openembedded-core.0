Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353AFD25B4A
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 12:08:02 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11753.1769602071863105864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 04:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b8415TgF;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c6d8751c88so699169185a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 04:07:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769602071; cv=none;
        d=google.com; s=arc-20240605;
        b=Qojal0qSgxoOqg27cQ3jDl4W9DzTKCeFSx/mLOrSKowBeUEvPVmamd1L7lbjOj5Pk5
         fxFaMcmyU9KaSxwncbdBEWVeLx7KwyyY2vHqnXEV1ohJW5mnc8GeitF2ecHbT5FCVqO3
         K9S4W+VdFL9Kqwc4/izL5jDNt9NDpdHxfabXFOoypsq2qwkO5zlQdPE4auOzsM3lIt0c
         xy5Tb9hOK8rZJSV8HR79boxypJtESPrispcaJVDjPbN78b5rGUpA/kWB3H1xCPaJC8sK
         p6CqLUwDNdKQ6RLvK9/p0ayQmX2Ew1s4ctaSj52mBoInm29nr6HD3gf74luee2Wd1uid
         ikHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z55n84SBjnvWl9JHeAGmKsZlUotk+ngP+4bRIa1+QC4=;
        fh=QG0/1kl/iNDCWfShgAIKRpbEE7JIBRGbrVXnRZODZk4=;
        b=gq/5xcUdTce+uTEdwiKHFSNB8iaGEnlNkQYSwgRbAD2UK2ystQZbXpGDo7V4DVsuRc
         bBCyGj2BI0aUy2lSCWwj4pCe4R8Tsvab5fvpBFpphvhDEo70axhVmbGzhPAgQ+fkLGAi
         gPR2gop79efMXmVZ8dve5WYsNeLnGeB45fzjKMwY9ebxvBfGJUJvYtZLB/lWAD4+rne+
         eQuQ36lRHeRgAcnLiWE13BtBpqr0OIROpP9OkkObrvO+jJqgakyVd2C6aoAkOMy08rVw
         JFhVdmxvP2LJyh87kjIY7pBCBacTGDmIR57aui4wOyCS5+bnLOuAStp3D4i4w61p1hqB
         VDfg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769602071; x=1770206871; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z55n84SBjnvWl9JHeAGmKsZlUotk+ngP+4bRIa1+QC4=;
        b=b8415TgF+ZgvGBbd+VugFTET8DhqH2hAbMLo2ioe0kHswndc85MdJV+vNuav0vu+09
         6IzHA6BrPiQoSQ8PeYMOTwwCp9wqAhLg3wgVPePLqHnjFv0oI+jZhmJJOd2PDFCHlzMX
         k0gB5GbTEP1ecGym7wGIH3sIhkdUAEffB0MPVROnbiiXIuZuGssHrYsud6UcVQDfw1z1
         wz9mZabn+iNozB7ISJa2H3j6w0Zj6YBEQ/X944k/NxtI7C7vqIT1Ao6rbenh3rNDmLCY
         8UZNU0watFQ1YwYn4kETjqEw3WgptN2440HpWPA//nWFhLhjjjXN/8Fujv/t/UQkkxce
         crVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769602071; x=1770206871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z55n84SBjnvWl9JHeAGmKsZlUotk+ngP+4bRIa1+QC4=;
        b=vUGYA2r6X73mWeDomHW0R87NtcPtXnlJ50I2lfzneH78gBiq9NxdYybQC1VtuSYB2A
         o0m5ylPwaNBCDwQNIsE1Fp0yrZYi6sBTIu+o9Ny4nr938WqfecYt2OUBiuENhO41x0bo
         bHD2+x+ioGu3sAKjhF4SgYgBq2nqfLNiFfbLe5NkgR7tBKdYL8GFTKiORbAHgOhco+4R
         4dsTd0B5H4ueLoho8ogdDSEgqyjS863bo1Z2fUTwq4CLC4Xy4wraH8Kfk/MciL3eovJH
         oclcdEnPeyC0A2SFX4wmYfm7+Nf1AhPPgTGmxmIrh/RdLCC+ANADMBMOXX7BvGLBTOs9
         XmeQ==
X-Gm-Message-State: AOJu0YwQVbHLbOUzPup/ieR8HuI6oW7cMkbA+kuNemMxZK3bER1Q7KSe
	VjWWALea3WyD2ml9ndf43LaDP6oBBpkOk9VHAk5b+u48njr/svuOZEoxSbH3OmGEN1falfUut/M
	AEbN1/SICil75kugnVa5lRH14crHkYY0=
X-Gm-Gg: AZuq6aLgCfT4ouZ0j7X9KPmpLAyuVV1sIxg3dTYfvWe8acHNn98Kdmar4VLcHBH3igq
	h4/2SrWXe169ZHDzxlv0CNmqEi+VBiW+bdtV46yo9xD4Zc1YQCn6HdKVEL7/lFtfwv2FR9eViFa
	LrY7DuWWBMQVQmlaAxQslnyIWJJaqhG/6JnZ4kNJcaH6M6qaYTCcSSMbJitExfSdiuwbia14OFA
	5s41sPNwZ9OBsTHPm7fwwcqJWDiHnmw/BiWCjukFsD7NzuxJZjmY1mcoghQCGV/ri7egHrBUsg1
	TrBljRQ8Fz64E+pPFcuOIzC5aoNH1A==
X-Received: by 2002:a05:620a:7112:b0:8c6:edcc:3f80 with SMTP id
 af79cd13be357-8c70b840e70mr560938285a.13.1769602070602; Wed, 28 Jan 2026
 04:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20260128035521.6671-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260128035521.6671-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Jan 2026 13:07:39 +0100
X-Gm-Features: AZwV_QjvlRWq_jncm8RT-h5IvKUGg8ZWBMiPhSdRxjKTpb22PJ-zLcEv8JAVbEY
Message-ID: <CANNYZj8rG=Tibsqn0SyUEH3b-tWhTdipP+0ASkqXSghsyOaLmw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] hotdoc : Add new recipe
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 12:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230090

This needs a maintainer.inc entry, and also it does need a some recipe
that actually uses it.

Alex

On Wed, 28 Jan 2026 at 04:55, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
>
> 1. Backport following patch to solve build and runtime issue
>   0001-c_comment_scanner-fix-function-prototypes.patch
>   0002-avoid-third-party-backports-dependency-on-sufficient.patch
>   0003-CMake-4-compatibility.patch
>
> 2. Add do_configure:prepend() to solve buildpaths QA check
>   do_package_qa: QA Issue: File /usr/lib/python3.14/site-packages/hotdoc/parsers/cmark.cpython-314-x86_64-linux-gnu.so in package hotdoc contains reference to TMPDIR [buildpaths]
>
> 3. Add 0004-Make-path-to-relative-in-FlexExtension.patch to solve buildpaths QA check
>   do_package_qa:QA Issue: File /usr/src/debug/hotdoc/0.17.4/hotdoc/parsers/c_comment_scanner/scanner.c in package hotdoc-src contains reference to TMPDIR [buildpaths]
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...ment_scanner-fix-function-prototypes.patch | 32 +++++++++
>  ...y-backports-dependency-on-sufficient.patch | 72 +++++++++++++++++++
>  .../hotdoc/0003-CMake-4-compatibility.patch   | 44 ++++++++++++
>  ...ke-path-to-relative-in-FlexExtension.patch | 34 +++++++++
>  meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb | 27 +++++++
>  5 files changed, 209 insertions(+)
>  create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
>  create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
>  create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
>  create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
>  create mode 100644 meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
>
> diff --git a/meta/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch b/meta/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
> new file mode 100644
> index 0000000000..c26dde93b3
> --- /dev/null
> +++ b/meta/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
> @@ -0,0 +1,32 @@
> +Subject: [PATCH 1/2] c_comment_scanner: fix function prototypes
> +
> +scanner.l: Fix compile error as the following:
> +
> +python3-hotdoc/0.17.4/sources/hotdoc-0.17.4/hotdoc/parsers/c_comment_scanner/scanner.l:126:1: error: conflicting types for 'parse_comment'; have 'int(PyObject *)' {aka 'int(struct _object *)'}
> +|   126 | parse_comment (PyObject *comments)
> +
> +Upstream-Status: Backport [https://github.com/hotdoc/hotdoc/commit/adf8518431fafb78c9b47862a0a9a58824b6a421]
> +
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + hotdoc/parsers/c_comment_scanner/scanner.l | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/hotdoc/parsers/c_comment_scanner/scanner.l b/hotdoc/parsers/c_comment_scanner/scanner.l
> +index 0408601..7bccd64 100644
> +--- a/hotdoc/parsers/c_comment_scanner/scanner.l
> ++++ b/hotdoc/parsers/c_comment_scanner/scanner.l
> +@@ -34,8 +34,8 @@
> + extern int yylex (PyObject *comments);
> + #define YY_DECL int yylex (PyObject *comments)
> + static int yywrap (void);
> +-static int parse_comment ();
> +-static int parse_define ();
> ++static int parse_comment (PyObject *);
> ++static int parse_define (PyObject *);
> + %}
> +
> + %option nounput
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch b/meta/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
> new file mode 100644
> index 0000000000..560d1257f0
> --- /dev/null
> +++ b/meta/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
> @@ -0,0 +1,72 @@
> +Subject: [PATCH 2/2] avoid third-party backports dependency on sufficiently
> + new python
> +
> +`backports.entry_points_selectable` backports functionality from python
> +3.10 to older versions of python.
> +
> +Backport this patch to solve runtime backports import problem as following:
> +  File "/usr/lib/python3.14/site-packages/hotdoc/utils/utils.py", line 38, in <module>
> +  from backports.entry_points_selectable import entry_points
> +ModuleNotFoundError: No module named 'backports'
> +
> +Upstream-Status: Backport [https://github.com/hotdoc/hotdoc/commit/51043c3ef889e36c8232280581598b875073ded7]
> +
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + hotdoc/extensions/gi/utils.py | 6 +++++-
> + hotdoc/utils/utils.py         | 6 +++++-
> + setup.py                      | 2 +-
> + 3 files changed, 11 insertions(+), 3 deletions(-)
> +
> +diff --git a/hotdoc/extensions/gi/utils.py b/hotdoc/extensions/gi/utils.py
> +index 159c2b6..91902cb 100644
> +--- a/hotdoc/extensions/gi/utils.py
> ++++ b/hotdoc/extensions/gi/utils.py
> +@@ -1,9 +1,13 @@
> + import os
> + from collections import namedtuple
> + import pathlib
> ++import sys
> + import traceback
> +
> +-from backports.entry_points_selectable import entry_points
> ++if sys.version_info >= (3, 10):
> ++    from importlib.metadata import entry_points
> ++else:
> ++    from backports.entry_points_selectable import entry_points
> +
> + from hotdoc.core.links import Link
> + from hotdoc.utils.loggable import info, debug
> +diff --git a/hotdoc/utils/utils.py b/hotdoc/utils/utils.py
> +index 518d308..aef657a 100644
> +--- a/hotdoc/utils/utils.py
> ++++ b/hotdoc/utils/utils.py
> +@@ -35,7 +35,11 @@ import importlib.util
> + from urllib.request import urlretrieve
> + from pathlib import Path
> +
> +-from backports.entry_points_selectable import entry_points
> ++if sys.version_info >= (3, 10):
> ++    from importlib.metadata import entry_points
> ++else:
> ++    from backports.entry_points_selectable import entry_points
> ++
> + try:
> +     import importlib.metadata as meta
> + except ImportError:
> +diff --git a/setup.py b/setup.py
> +index 5d7f131..9ee504d 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -300,7 +300,7 @@ INSTALL_REQUIRES = [
> +     'wheezy.template',
> +     'toposort>=1.4',
> +     'importlib_metadata; python_version<"3.10"',
> +-    'backports.entry_points_selectable',
> ++    'backports.entry_points_selectable; python_version<"3.10"',
> + ]
> +
> + # dbus-deviation requires sphinx, which requires python 3.5
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch b/meta/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
> new file mode 100644
> index 0000000000..cb243176ae
> --- /dev/null
> +++ b/meta/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
> @@ -0,0 +1,44 @@
> +Subject: [PATCH] CMake 4 compatibility
> +
> +All CMake versions older than 3.10 are deprecated.
> +
> +Upstream-Status: Backport [https://github.com/MathieuDuponchelle/cmark/commit/bd78193dbff98c3860e77629b5c7bfee6169d1da]
> +
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + cmark/CMakeLists.txt            | 11 ++---------
> + cmark/extensions/CMakeLists.txt |  2 +-
> + 2 files changed, 3 insertions(+), 10 deletions(-)
> +
> +diff --git a/cmark/CMakeLists.txt b/cmark/CMakeLists.txt
> +index ff97419..45fdf6c 100755
> +--- a/cmark/CMakeLists.txt
> ++++ b/cmark/CMakeLists.txt
> +@@ -1,12 +1,5 @@
> +-cmake_minimum_required(VERSION 2.8.9)
> +-
> +-# prevent ugly developer warnings because version is set directly, not through project()
> +-# it should be redone properly by using VERSION in project() if on CMake 3.x
> +-if(CMAKE_MAJOR_VERSION GREATER 2)
> +-    cmake_policy(SET CMP0048 OLD)
> +-endif()
> +-
> +-project(cmark)
> ++cmake_minimum_required(VERSION 3.10)
> ++project(cmark VERSION 0.28.3)
> +
> + include("FindAsan.cmake")
> +
> +diff --git a/cmark/extensions/CMakeLists.txt b/cmark/extensions/CMakeLists.txt
> +index e62d155..b6a1556 100644
> +--- a/cmark/extensions/CMakeLists.txt
> ++++ b/cmark/extensions/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.8)
> ++cmake_minimum_required(VERSION 3.10)
> + set(LIBRARY "cmarkextensions")
> + set(LIBRARY_SOURCES
> +     core-extensions.c
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch b/meta/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
> new file mode 100644
> index 0000000000..ae8c2ef3e7
> --- /dev/null
> +++ b/meta/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
> @@ -0,0 +1,34 @@
> +Subject: [PATCH] Make path to relative in FlexExtension
> +
> +To fix following do_package QA Issue:
> +
> +do_package_qa:QA Issue: File /usr/src/debug/hotdoc/0.17.4/hotdoc/parsers/c_comment_scanner/scanner.c in package hotdoc-src contains reference to TMPDIR [buildpaths]
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + setup.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 9ee504d..fc03c57 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -357,11 +357,11 @@ build_c_extension = os.environ.get('HOTDOC_BUILD_C_EXTENSION', 'auto')
> + class FlexExtension (Extension):
> +     def __init__(self, flex_sources, *args, **kwargs):
> +         Extension.__init__(self, *args, **kwargs)
> +-        self.__flex_sources = [src(s) for s in flex_sources]
> ++        self.__flex_sources = list(flex_sources)
> +
> +     def __build_flex(self):
> +         src_dir = os.path.dirname(self.__flex_sources[0])
> +-        built_scanner_path = src(os.path.join(src_dir, 'scanner.c'))
> ++        built_scanner_path = os.path.join(src_dir, 'scanner.c')
> +
> +         self.sources.append(built_scanner_path)
> +         if newer_group(self.__flex_sources, built_scanner_path):
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb b/meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
> new file mode 100644
> index 0000000000..6236f03df8
> --- /dev/null
> +++ b/meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "Hotdoc is a documentation framework"
> +DESCRIPTION = "Hotdoc is a documentation micro-framework. It provides an interface for extensions to plug upon, along with some base objects (formatters, ...)"
> +HOMEPAGE = "https://github.com/hotdoc/hotdoc"
> +
> +LICENSE = "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=90263a49bc1d9a204656fec4d5616c66"
> +
> +SRC_URI[sha256sum] = "c4d5dff647f03aa87a1d2d06035d2819edd099b91635e3b2ee390829357ae9fc"
> +
> +SRC_URI = "file://0001-c_comment_scanner-fix-function-prototypes.patch \
> +           file://0002-avoid-third-party-backports-dependency-on-sufficient.patch \
> +           file://0003-CMake-4-compatibility.patch \
> +           file://0004-Make-path-to-relative-in-FlexExtension.patch \
> +          "
> +
> +DEPENDS += "libxml2 glib-2.0 json-glib"
> +
> +inherit pypi python_setuptools_build_meta pkgconfig
> +
> +#Fix LIBDIR path to fix buildpaths QA check of hotdoc/parsers/cmark.cpython-314-x86_64-linux-gnu.so
> +do_configure:prepend() {
> +    sed -i -e "s#'\"%s\"' % CMARK_BUILD_DIR#'\"${PYTHON_SITEPACKAGES_DIR}/${PN}\"'#" ${S}/setup.py
> +}
> +
> +RDEPENDS:${PN} += "python3-appdirs python3-lxml python3-pyyaml python3-schema python3-toposort python3-wheezy-template"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230074): https://lists.openembedded.org/g/openembedded-core/message/230074
> Mute This Topic: https://lists.openembedded.org/mt/117502927/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

