Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B90F73354
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 09:07:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1C97fJM007556
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 01:07:41 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Feb 2015 01:07:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Feb 2015 01:07:34 -0800
Message-ID: <17fb00a70d2ad57cd7ef56d73a1f5aa6570ff07f.1423732000.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423732000.git.liezhi.yang@windriver.com>
References: <cover.1423732000.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] Revert "libtool: avoid running automake/autoconf --version"
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
X-List-Received-Date: Thu, 12 Feb 2015 09:07:43 -0000
Content-Type: text/plain

This reverts commit 1f53edeaf9ea59dd55459a6d5a93829fb4983839.

There is a better fix on upstream, will backport it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.5.inc    |    1 -
 .../avoid-running-automake-autoconf-version.patch  |   54 --------------------
 2 files changed, 55 deletions(-)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/avoid-running-automake-autoconf-version.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.5.inc b/meta/recipes-devtools/libtool/libtool-2.4.5.inc
index 909c7da..88e281f 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.5.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.5.inc
@@ -18,7 +18,6 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            file://fix-resolve-lt-sysroot.patch \
            file://nohardcodepaths.patch \
-           file://avoid-running-automake-autoconf-version.patch \
            file://unwind-opt-parsing.patch \
           "
 
diff --git a/meta/recipes-devtools/libtool/libtool/avoid-running-automake-autoconf-version.patch b/meta/recipes-devtools/libtool/libtool/avoid-running-automake-autoconf-version.patch
deleted file mode 100644
index ac2d370..0000000
--- a/meta/recipes-devtools/libtool/libtool/avoid-running-automake-autoconf-version.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 7d3b0331d91a9f80bc4bcddea929a93b07b8ef91 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 4 Feb 2015 17:14:46 -0800
-Subject: [PATCH] avoid running automake/autoconf --version
-
-The libtool would be very slow if run "automake/autoconf --version", for
-example, when compile xz (make -j1):
-
-before patched: 19s
-after patched:  11s
-
-Use plain text to instead of running them.
-
-Upstream-Status: Pending [Report to libtool community]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- build-aux/ltmain.in |    4 ++--
- libtoolize.in       |    4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
-index 0441e48..49cd39a 100644
---- a/build-aux/ltmain.in
-+++ b/build-aux/ltmain.in
-@@ -152,8 +152,8 @@ include the following information:
-        compiler flags: $LTCFLAGS
-        linker:         $LD (gnu? $with_gnu_ld)
-        version:        $progname (GNU @PACKAGE@) @VERSION@
--       automake:       `($AUTOMAKE --version) 2>/dev/null |$SED 1q`
--       autoconf:       `($AUTOCONF --version) 2>/dev/null |$SED 1q`
-+       automake:       run $AUTOMAKE --version
-+       autoconf:       run $AUTOCONF --version
- 
- Report bugs to <@PACKAGE_BUGREPORT@>.
- GNU @PACKAGE@ home page: <@PACKAGE_URL@>.
-diff --git a/libtoolize.in b/libtoolize.in
-index 684d799..e57c89b 100644
---- a/libtoolize.in
-+++ b/libtoolize.in
-@@ -115,8 +115,8 @@ include the following information:
- 
-        host-triplet:   @host_triplet@
-        version:        $progname (GNU @PACKAGE@) @VERSION@
--       automake:       `($AUTOMAKE --version) 2>/dev/null |$SED 1q`
--       autoconf:       `($AUTOCONF --version) 2>/dev/null |$SED 1q`
-+       automake:       run $AUTOMAKE --version
-+       autoconf:       run $AUTOCONF --version
- 
- Report bugs to <@PACKAGE_BUGREPORT@>.
- GNU @PACKAGE@ home page: <@PACKAGE_URL@>.
--- 
-1.7.9.5
-
-- 
1.7.9.5


