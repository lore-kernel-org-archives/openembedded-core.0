Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1C754731A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 07:19:22 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id x140so4281794oif.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8hQPWl2QTYEFoW3Ilckp/H33bE6fp9KU5j4rbfgudNU=;
	b=AdGYN/Owm2DS5TBprQbyH0pMrIaLqE5CK24UWzwylxIxV2pfx/TPyaEhCMZjr3unx8
	l7DNAETrP0uhxkEMPJBB9CJNZmR59l1pmIQjA+TOLPNrqZJPEnhMRM3/vaNkwzceRHwz
	eDU4Th253mxKa0zrWzFvUzxzNRQzjPD0f61Y3L15SiE/OlRD3EUPIxIy+TrMyg5VGoMp
	b/TGTDS+bCYryDsAE/yrRMJV0hwtijuu8rY4VcSY5JUvb23+J3EtN+w1+eXxvzrh80l3
	ZOiL4mwQkF2DkhELVehf+GOJUKvYEmKawBo19UuoljbvyVdCn3JXg4rXNKdYPC85n6d3
	2kWQ==
X-Received: by 10.202.199.82 with SMTP id x79mr89426779oif.139.1452583163464; 
	Mon, 11 Jan 2016 23:19:23 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	d2sm49992973oic.12.2016.01.11.23.19.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jan 2016 23:19:22 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 23:18:35 -0800
Message-Id: <1452583117-812-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
References: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/5] strace: remove need for git-version-gen script
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
X-List-Received-Date: Tue, 12 Jan 2016 07:19:27 -0000

The git-version-gen isn't really needed in order to determine the
version of tarball releases, so avoid the need to provide our own
copy.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../strace/strace/disable-git-version-gen.patch    |  20 ++
 .../recipes-devtools/strace/strace/git-version-gen | 225 ---------------------
 meta/recipes-devtools/strace/strace_4.10.bb        |   6 +-
 3 files changed, 21 insertions(+), 230 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
 delete mode 100755 meta/recipes-devtools/strace/strace/git-version-gen

diff --git a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
new file mode 100644
index 0000000..7bc1436
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
@@ -0,0 +1,20 @@
+The git-version-gen script is not included in tarball releases,
+so we need to avoid attempts to call it when running autoreconf.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+Index: strace-4.10/configure.ac
+===================================================================
+--- strace-4.10.orig/configure.ac
++++ strace-4.10/configure.ac
+@@ -1,7 +1,7 @@
+ dnl Process this file with autoconf to create configure.  Use autoreconf.
+ AC_PREREQ(2.57)
+ AC_INIT([strace],
+-	m4_esyscmd([./git-version-gen .tarball-version]),
++	m4_esyscmd_s([cat .tarball-version]),
+ 	[strace-devel@lists.sourceforge.net])
+ AC_CONFIG_SRCDIR([strace.c])
+ AC_CONFIG_AUX_DIR([.])
diff --git a/meta/recipes-devtools/strace/strace/git-version-gen b/meta/recipes-devtools/strace/strace/git-version-gen
deleted file mode 100755
index 8fee74e..0000000
--- a/meta/recipes-devtools/strace/strace/git-version-gen
+++ /dev/null
@@ -1,225 +0,0 @@
-#!/bin/sh
-# Print a version string.
-scriptversion=2012-12-31.23; # UTC
-
-# Copyright (C) 2007-2013 Free Software Foundation, Inc.
-#
-# This program is free software: you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 3 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program.  If not, see <http://www.gnu.org/licenses/>.
-
-# This script is derived from GIT-VERSION-GEN from GIT: http://git.or.cz/.
-# It may be run two ways:
-# - from a git repository in which the "git describe" command below
-#   produces useful output (thus requiring at least one signed tag)
-# - from a non-git-repo directory containing a .tarball-version file, which
-#   presumes this script is invoked like "./git-version-gen .tarball-version".
-
-# In order to use intra-version strings in your project, you will need two
-# separate generated version string files:
-#
-# .tarball-version - present only in a distribution tarball, and not in
-#   a checked-out repository.  Created with contents that were learned at
-#   the last time autoconf was run, and used by git-version-gen.  Must not
-#   be present in either $(srcdir) or $(builddir) for git-version-gen to
-#   give accurate answers during normal development with a checked out tree,
-#   but must be present in a tarball when there is no version control system.
-#   Therefore, it cannot be used in any dependencies.  GNUmakefile has
-#   hooks to force a reconfigure at distribution time to get the value
-#   correct, without penalizing normal development with extra reconfigures.
-#
-# .version - present in a checked-out repository and in a distribution
-#   tarball.  Usable in dependencies, particularly for files that don't
-#   want to depend on config.h but do want to track version changes.
-#   Delete this file prior to any autoconf run where you want to rebuild
-#   files to pick up a version string change; and leave it stale to
-#   minimize rebuild time after unrelated changes to configure sources.
-#
-# As with any generated file in a VC'd directory, you should add
-# /.version to .gitignore, so that you don't accidentally commit it.
-# .tarball-version is never generated in a VC'd directory, so needn't
-# be listed there.
-#
-# Use the following line in your configure.ac, so that $(VERSION) will
-# automatically be up-to-date each time configure is run (and note that
-# since configure.ac no longer includes a version string, Makefile rules
-# should not depend on configure.ac for version updates).
-#
-# AC_INIT([GNU project],
-#         m4_esyscmd([build-aux/git-version-gen .tarball-version]),
-#         [bug-project@example])
-#
-# Then use the following lines in your Makefile.am, so that .version
-# will be present for dependencies, and so that .version and
-# .tarball-version will exist in distribution tarballs.
-#
-# EXTRA_DIST = $(top_srcdir)/.version
-# BUILT_SOURCES = $(top_srcdir)/.version
-# $(top_srcdir)/.version:
-#	echo $(VERSION) > $@-t && mv $@-t $@
-# dist-hook:
-#	echo $(VERSION) > $(distdir)/.tarball-version
-
-
-me=$0
-
-version="git-version-gen $scriptversion
-
-Copyright 2011 Free Software Foundation, Inc.
-There is NO warranty.  You may redistribute this software
-under the terms of the GNU General Public License.
-For more information about these matters, see the files named COPYING."
-
-usage="\
-Usage: $me [OPTION]... \$srcdir/.tarball-version [TAG-NORMALIZATION-SED-SCRIPT]
-Print a version string.
-
-Options:
-
-   --prefix           prefix of git tags (default 'v')
-   --fallback         fallback version to use if \"git --version\" fails
-
-   --help             display this help and exit
-   --version          output version information and exit
-
-Running without arguments will suffice in most cases."
-
-prefix=v
-fallback=
-
-while test $# -gt 0; do
-  case $1 in
-    --help) echo "$usage"; exit 0;;
-    --version) echo "$version"; exit 0;;
-    --prefix) shift; prefix="$1";;
-    --fallback) shift; fallback="$1";;
-    -*)
-      echo "$0: Unknown option '$1'." >&2
-      echo "$0: Try '--help' for more information." >&2
-      exit 1;;
-    *)
-      if test "x$tarball_version_file" = x; then
-        tarball_version_file="$1"
-      elif test "x$tag_sed_script" = x; then
-        tag_sed_script="$1"
-      else
-        echo "$0: extra non-option argument '$1'." >&2
-        exit 1
-      fi;;
-  esac
-  shift
-done
-
-if test "x$tarball_version_file" = x; then
-    echo "$usage"
-    exit 1
-fi
-
-tag_sed_script="${tag_sed_script:-s/x/x/}"
-
-nl='
-'
-
-# Avoid meddling by environment variable of the same name.
-v=
-v_from_git=
-
-# First see if there is a tarball-only version file.
-# then try "git describe", then default.
-if test -f $tarball_version_file
-then
-    v=`cat $tarball_version_file` || v=
-    case $v in
-        *$nl*) v= ;; # reject multi-line output
-        [0-9]*) ;;
-        *) v= ;;
-    esac
-    test "x$v" = x \
-        && echo "$0: WARNING: $tarball_version_file is missing or damaged" 1>&2
-fi
-
-if test "x$v" != x
-then
-    : # use $v
-# Otherwise, if there is at least one git commit involving the working
-# directory, and "git describe" output looks sensible, use that to
-# derive a version string.
-elif test "`git log -1 --pretty=format:x . 2>&1`" = x \
-    && v=`git describe --abbrev=4 --match="$prefix*" HEAD 2>/dev/null \
-          || git describe --abbrev=4 HEAD 2>/dev/null` \
-    && v=`printf '%s\n' "$v" | sed "$tag_sed_script"` \
-    && case $v in
-         $prefix[0-9]*) ;;
-         *) (exit 1) ;;
-       esac
-then
-    # Is this a new git that lists number of commits since the last
-    # tag or the previous older version that did not?
-    #   Newer: v6.10-77-g0f8faeb
-    #   Older: v6.10-g0f8faeb
-    case $v in
-        *-*-*) : git describe is okay three part flavor ;;
-        *-*)
-            : git describe is older two part flavor
-            # Recreate the number of commits and rewrite such that the
-            # result is the same as if we were using the newer version
-            # of git describe.
-            vtag=`echo "$v" | sed 's/-.*//'`
-            commit_list=`git rev-list "$vtag"..HEAD 2>/dev/null` \
-                || { commit_list=failed;
-                     echo "$0: WARNING: git rev-list failed" 1>&2; }
-            numcommits=`echo "$commit_list" | wc -l`
-            v=`echo "$v" | sed "s/\(.*\)-\(.*\)/\1-$numcommits-\2/"`;
-            test "$commit_list" = failed && v=UNKNOWN
-            ;;
-    esac
-
-    # Change the first '-' to a '.', so version-comparing tools work properly.
-    # Remove the "g" in git describe's output string, to save a byte.
-    v=`echo "$v" | sed 's/-/.0./;s/\(.*\)-g/\1-/'`;
-    v_from_git=1
-elif test "x$fallback" = x || git --version >/dev/null 2>&1; then
-    v=UNKNOWN
-else
-    v=$fallback
-fi
-
-v=`echo "$v" |sed "s/^$prefix//"`
-
-# Test whether to append the "-dirty" suffix only if the version
-# string we're using came from git.  I.e., skip the test if it's "UNKNOWN"
-# or if it came from .tarball-version.
-if test "x$v_from_git" != x; then
-  # Don't declare a version "dirty" merely because a time stamp has changed.
-  git update-index --refresh > /dev/null 2>&1
-
-  dirty=`exec 2>/dev/null;git diff-index --name-only HEAD` || dirty=
-  case "$dirty" in
-      '') ;;
-      *) # Append the suffix only if there isn't one already.
-          case $v in
-            *-dirty) ;;
-            *) v="$v-dirty" ;;
-          esac ;;
-  esac
-fi
-
-# Omit the trailing newline, so that m4_esyscmd can use the result directly.
-echo "$v" | tr -d "$nl"
-
-# Local variables:
-# eval: (add-hook 'write-file-hooks 'time-stamp)
-# time-stamp-start: "scriptversion="
-# time-stamp-format: "%:y-%02m-%02d.%02H"
-# time-stamp-time-zone: "UTC"
-# time-stamp-end: "; # UTC"
-# End:
diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
index fe250b7..0b2316b 100644
--- a/meta/recipes-devtools/strace/strace_4.10.bb
+++ b/meta/recipes-devtools/strace/strace_4.10.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://0001-Add-linux-aarch64-arch_regs.h.patch \
-           file://git-version-gen \
+           file://disable-git-version-gen.patch \
            file://strace-add-configure-options.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
@@ -31,10 +31,6 @@ PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_blue
 
 TESTDIR = "tests"
 
-do_configure_prepend() {
-	cp ${WORKDIR}/git-version-gen ${S}
-}
-
 do_install_append() {
 	# We don't ship strace-graph here because it needs perl
 	rm ${D}${bindir}/strace-graph
-- 
1.9.1


