Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E9506FFD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 06:19:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2T6J8HK021165
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 23:19:09 -0700 (PDT)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 28 Mar 2018 23:19:08 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2018 14:19:06 +0800
Message-ID: <1522304346-13958-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH] scripts/oe-setup-rpmrepo: remove the script
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
X-List-Received-Date: Thu, 29 Mar 2018 06:19:08 -0000
Content-Type: text/plain

After we switched to RSS, this script was not working for a long time.
'bitbake package-index' can do the same thing and works well. So remove
this script.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 scripts/oe-setup-rpmrepo | 103 -----------------------------------------------
 1 file changed, 103 deletions(-)
 delete mode 100755 scripts/oe-setup-rpmrepo

diff --git a/scripts/oe-setup-rpmrepo b/scripts/oe-setup-rpmrepo
deleted file mode 100755
index df1c614..0000000
--- a/scripts/oe-setup-rpmrepo
+++ /dev/null
@@ -1,103 +0,0 @@
-#!/bin/bash
-#
-# This utility setup the necessary metadata for an rpm repo
-#
-# Copyright (c) 2011 Intel Corp.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-
-# Don't use TMPDIR from the external environment, it may be a distro
-# variable pointing to /tmp (e.g. within X on OpenSUSE)
-# Instead, use OE_TMPDIR for passing this in externally.
-TMPDIR="$OE_TMPDIR"
-
-setup_tmpdir() {
-    if [ -z "$TMPDIR" ]; then
-        # Try to get TMPDIR from bitbake
-        type -P bitbake &>/dev/null || {
-            echo "In order for this script to dynamically infer paths";
-            echo "to kernels or filesystem images, you either need";
-            echo "bitbake in your PATH or to source oe-init-build-env";
-            echo "before running this script" >&2;
-            exit 1; }
-
-        # We have bitbake in PATH, get TMPDIR from bitbake
-        TMPDIR=`bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
-        if [ -z "$TMPDIR" ]; then
-            echo "Error: this script needs to be run from your build directory,"
-            echo "or you need to explicitly set TMPDIR in your environment"
-            exit 1
-        fi
-    fi
-}
-
-setup_tmpdir
-
-function usage() {
-    echo 'Usage: oe-setup-rpmrepo rpm-dir'
-    echo ''
-    echo 'OpenEmbedded setup-rpmrepo - setup rpm repository'
-    echo ''
-    echo 'arguments:'
-    echo "  rpm-dir               rpm repo directory, default is $TMPDIR/deploy/rpm"
-    echo ''
-}
-
-if [ $# -gt 1 -o "$1" = '--help' -o "$1" = '-h' ]; then
-    usage
-    exit 2
-fi
-
-setup_sysroot() {
-	# Toolchain installs set up $OECORE_NATIVE_SYSROOT in their
-	# environment script. If that variable isn't set, we're
-	# either in an in-tree poky scenario or the environment
-	# script wasn't source'd.
-	if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
-		setup_tmpdir
-		BUILD_ARCH=`uname -m`
-		BUILD_OS=`uname | tr '[A-Z]' '[a-z]'`
-		BUILD_SYS="$BUILD_ARCH-$BUILD_OS"
-
-		OECORE_NATIVE_SYSROOT=$TMPDIR/sysroots/$BUILD_SYS
-	fi 
-}
-
-setup_sysroot
-
-
-if [ -n "$1" ]; then
-	RPM_DIR="$1"
-else
-	RPM_DIR="$TMPDIR/deploy/rpm"
-fi
-
-if [ ! -d "$RPM_DIR" ]; then
-   	echo "Error: rpm dir $RPM_DIR doesn't exist"
-	exit 1
-fi
-
-CREATEREPO=$OECORE_NATIVE_SYSROOT/usr/bin/createrepo_c
-if [ ! -e "$CREATEREPO" ]; then
-   	echo "Error: can't find createrepo binary"
-	echo "please run bitbake createrepo-native first"
-	exit 1
-fi
-
-export PATH=${PATH}:${OECORE_NATIVE_SYSROOT}/usr/bin
-
-$CREATEREPO "$RPM_DIR"
-
-exit 0
-- 
2.7.4


