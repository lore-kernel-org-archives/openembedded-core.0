Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52A0B731E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 08:30:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0D8Uax7021951
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Jan 2016 00:30:36 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 13 Jan 2016 00:30:35 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 13 Jan 2016 03:30:29 -0500
Message-ID: <bf3a881847465f2962c81eafc0ee6016c8a5b4fe.1452673538.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452673538.git.hongxu.jia@windriver.com>
References: <cover.1452673538.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/9] pax-utils: 1.0.5 -> 1.1.4
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
X-List-Received-Date: Wed, 13 Jan 2016 08:30:38 -0000
Content-Type: text/plain

- Support autotools:
  *) Touch NEWS/AUTHORS/ChangeLog to workaroud failure
     caused by 'automake --add-missing'
  *) Add patch to fix configure failure caused by missing
     macro definition in m4 directory

- Add PACKAGECONFIG flags for libcap, libseccomp and pyelftools,
  and disable them by default.

- Add PACKAGECONFIG flag for largefile.

- Since we add PACKAGECONFIG flags for pyelftools, we do not need
  python in RDEPENDS.

BTW:
Currently oe-core does not support libseccomp.
(https://github.com/seccomp/libseccomp)

Currently oe-core does not support pyelftools.
(https://github.com/eliben/pyelftools)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../pax-utils/files/fix-configure-failure.patch    | 146 +++++++++++++++++++++
 .../{pax-utils_1.0.5.bb => pax-utils_1.1.4.bb}     |  23 +++-
 2 files changed, 165 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/pax-utils/files/fix-configure-failure.patch
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.0.5.bb => pax-utils_1.1.4.bb} (48%)

diff --git a/meta/recipes-devtools/pax-utils/files/fix-configure-failure.patch b/meta/recipes-devtools/pax-utils/files/fix-configure-failure.patch
new file mode 100644
index 0000000..43bfeb6
--- /dev/null
+++ b/meta/recipes-devtools/pax-utils/files/fix-configure-failure.patch
@@ -0,0 +1,146 @@
+From 70334129f5d849813c2ea5ce6070e6fb433412f7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 13 Jan 2016 01:12:19 -0500
+Subject: [PATCH] autotools/m4: fix unexpected token 'AX_APPEND_FLAG'
+
+Added missing macro definition "ax_require_defined.m4" and "ax_append_flag.m4"
+to the m4 macro directories.
+...
+pax-utils-1.1.4/configure: line 33077: syntax error near unexpected token `AX_APPEND_FLAG'
+pax-utils-1.1.4/configure: line 33077: `AX_REQUIRE_DEFINED(AX_APPEND_FLAG)'
+...
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ autotools/m4/ax_append_flag.m4     | 72 ++++++++++++++++++++++++++++++++++++++
+ autotools/m4/ax_require_defined.m4 | 38 ++++++++++++++++++++
+ 2 files changed, 110 insertions(+)
+ create mode 100644 autotools/m4/ax_append_flag.m4
+ create mode 100644 autotools/m4/ax_require_defined.m4
+
+diff --git a/autotools/m4/ax_append_flag.m4 b/autotools/m4/ax_append_flag.m4
+new file mode 100644
+index 0000000..c98a5c5
+--- /dev/null
++++ b/autotools/m4/ax_append_flag.m4
+@@ -0,0 +1,72 @@
++# ===========================================================================
++#      http://www.gnu.org/software/autoconf-archive/ax_append_flag.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_APPEND_FLAG(FLAG, [FLAGS-VARIABLE])
++#
++# DESCRIPTION
++#
++#   FLAG is appended to the FLAGS-VARIABLE shell variable, with a space
++#   added in between.
++#
++#   If FLAGS-VARIABLE is not specified, the current language's flags (e.g.
++#   CFLAGS) is used.  FLAGS-VARIABLE is not changed if it already contains
++#   FLAG.  If FLAGS-VARIABLE is unset in the shell, it is set to exactly
++#   FLAG.
++#
++#   NOTE: Implementation based on AX_CFLAGS_GCC_OPTION.
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
++#   Copyright (c) 2011 Maarten Bosmans <mkbosmans@gmail.com>
++#
++#   This program is free software: you can redistribute it and/or modify it
++#   under the terms of the GNU General Public License as published by the
++#   Free Software Foundation, either version 3 of the License, or (at your
++#   option) any later version.
++#
++#   This program is distributed in the hope that it will be useful, but
++#   WITHOUT ANY WARRANTY; without even the implied warranty of
++#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
++#   Public License for more details.
++#
++#   You should have received a copy of the GNU General Public License along
++#   with this program. If not, see <http://www.gnu.org/licenses/>.
++#
++#   As a special exception, the respective Autoconf Macro's copyright owner
++#   gives unlimited permission to copy, distribute and modify the configure
++#   scripts that are the output of Autoconf when processing the Macro. You
++#   need not follow the terms of the GNU General Public License when using
++#   or distributing such scripts, even though portions of the text of the
++#   Macro appear in them. The GNU General Public License (GPL) does govern
++#   all other use of the material that constitutes the Autoconf Macro.
++#
++#   This special exception to the GPL applies to versions of the Autoconf
++#   Macro released by the Autoconf Archive. When you make and distribute a
++#   modified version of the Autoconf Macro, you may extend this special
++#   exception to the GPL to apply to your modified version as well.
++
++#serial 6
++
++AC_DEFUN([AX_APPEND_FLAG],
++[dnl
++AC_PREREQ(2.64)dnl for _AC_LANG_PREFIX and AS_VAR_SET_IF
++AS_VAR_PUSHDEF([FLAGS], [m4_default($2,_AC_LANG_PREFIX[FLAGS])])
++AS_VAR_SET_IF(FLAGS,[
++  AS_CASE([" AS_VAR_GET(FLAGS) "],
++    [*" $1 "*], [AC_RUN_LOG([: FLAGS already contains $1])],
++    [
++     AS_VAR_APPEND(FLAGS,[" $1"])
++     AC_RUN_LOG([: FLAGS="$FLAGS"])
++    ])
++  ],
++  [
++  AS_VAR_SET(FLAGS,[$1])
++  AC_RUN_LOG([: FLAGS="$FLAGS"])
++  ])
++AS_VAR_POPDEF([FLAGS])dnl
++])dnl AX_APPEND_FLAG
++
+diff --git a/autotools/m4/ax_require_defined.m4 b/autotools/m4/ax_require_defined.m4
+new file mode 100644
+index 0000000..4cb6f3c
+--- /dev/null
++++ b/autotools/m4/ax_require_defined.m4
+@@ -0,0 +1,38 @@
++# ===========================================================================
++#    http://www.gnu.org/software/autoconf-archive/ax_require_defined.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_REQUIRE_DEFINED(MACRO)
++#
++# DESCRIPTION
++#
++#   AX_REQUIRE_DEFINED is a simple helper for making sure other macros have
++#   been defined and thus are available for use.  This avoids random issues
++#   where a macro isn't expanded.  Instead the configure script emits a
++#   non-fatal:
++#
++#     ./configure: line 1673: AX_CFLAGS_WARN_ALL: command not found
++#
++#   It's like AC_REQUIRE except it doesn't expand the required macro.
++#
++#   Here's an example:
++#
++#     AX_REQUIRE_DEFINED([AX_CHECK_LINK_FLAG])
++#
++# LICENSE
++#
++#   Copyright (c) 2014 Mike Frysinger <vapier@gentoo.org>
++#
++#   Copying and distribution of this file, with or without modification, are
++#   permitted in any medium without royalty provided the copyright notice
++#   and this notice are preserved. This file is offered as-is, without any
++#   warranty.
++
++#serial 1
++
++AC_DEFUN([AX_REQUIRE_DEFINED], [dnl
++  m4_ifndef([$1], [m4_fatal([macro ]$1[ is not defined; is a m4 file missing?])])
++])dnl AX_REQUIRE_DEFINED
++
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
similarity index 48%
rename from meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
rename to meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
index 0716a08..48b342e 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
@@ -7,15 +7,30 @@ HOMEPAGE = "http://www.gentoo.org/proj/en/hardened/pax-utils.xml"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
+SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz \
+           file://fix-configure-failure.patch \
+"
 
-SRC_URI[md5sum] = "d731f5385682a7a62ee2e7b7dacc13a7"
-SRC_URI[sha256sum] = "f69a9938e4af7912d26d585094bc0203e43571a990fdd048319088a8b8ad906f"
+SRC_URI[md5sum] = "1bfbb5237881f0c5e476b2f7ffcc00d5"
+SRC_URI[sha256sum] = "796860fbd48c5f811e699e8492dc1110459bad0a62efa8d346b74a4f6f556414"
 
-RDEPENDS_${PN} += "bash python"
+RDEPENDS_${PN} += "bash"
+
+do_configure_prepend() {
+    touch ${S}/NEWS ${S}/AUTHORS ${S}/ChangeLog
+}
 
 do_install() {
     oe_runmake PREFIX=${D}${prefix} DESTDIR=${D} install
 }
 
 BBCLASSEXTEND = "native"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
+"
+PACKAGECONFIG[libcap] = "--with-caps, --without-caps, libcap"
+PACKAGECONFIG[libseccomp] = "--with-seccomp, --without-seccomp, libseccomp"
+PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
+PACKAGECONFIG[pyelftools] = "--with-python, --without-python,, pyelftools"
-- 
1.9.1


