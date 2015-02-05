Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A3E0A605F1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 09:31:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t159VU1Z006482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Feb 2015 01:31:30 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 5 Feb 2015 01:31:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Feb 2015 01:31:28 -0800
Message-ID: <665a6802603b730e0dc8d46fd08169b8ce558fa3.1423128496.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423128496.git.liezhi.yang@windriver.com>
References: <cover.1423128496.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libtool: avoid running automake/autoconf --version
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
X-List-Received-Date: Thu, 05 Feb 2015 09:31:35 -0000
Content-Type: text/plain

The libtool would be very slow if run "automake/autoconf --version", for
example, when compile xz-native (make -j1, only compile, no confiure or
install):

before patched: 19s
after patched:  11s

Use plain text to instead of running them.

NOTE: it is still a little slower than libtool 2.4.2 when compile
xz-native because of other parts:
make -j1: about 2s slower
make -j32: about 0.4s slower

If we run to do_install:
(PARALLEL_MAKE = "-j32")
libtool 2.4.2:
$ bitbake xz-native -cinstall && bitbake xz-native -ccleansstate && time bitbake xz-native -cinstall
real    0m21.092s
user    0m28.292s
sys     0m3.932s

libtool 2.4.5:
$ bitbake xz-native -cinstall && bitbake xz-native -ccleansstate && time bitbake xz-native -cinstall
real    0m21.380s
user    0m31.140s
sys     0m4.068s

About 0.3s, slightly different.

But when using /bin/bash as CONFIG_SHELL, the new libtool would be much slower:
real    0m23.106s
user    0m44.044s
sys     0m4.280s

About 2s slower, for the big package like cairo, it is more slower (about 6s),
unfortunately, /bin/bash is most default CONFIG_SHELL for the recipes since
configure checks first check bash.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.5.inc    |    1 +
 .../avoid-running-automake-autoconf-version.patch  |   54 ++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/avoid-running-automake-autoconf-version.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.5.inc b/meta/recipes-devtools/libtool/libtool-2.4.5.inc
index 5b22250..5ac6a78 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.5.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.5.inc
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            file://fix-resolve-lt-sysroot.patch \
            file://nohardcodepaths.patch \
+           file://avoid-running-automake-autoconf-version.patch \
           "
 
 SRC_URI[md5sum] = "7d30ed9fa6bb11270ebb31639a37bd54"
diff --git a/meta/recipes-devtools/libtool/libtool/avoid-running-automake-autoconf-version.patch b/meta/recipes-devtools/libtool/libtool/avoid-running-automake-autoconf-version.patch
new file mode 100644
index 0000000..ac2d370
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/avoid-running-automake-autoconf-version.patch
@@ -0,0 +1,54 @@
+From 7d3b0331d91a9f80bc4bcddea929a93b07b8ef91 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 4 Feb 2015 17:14:46 -0800
+Subject: [PATCH] avoid running automake/autoconf --version
+
+The libtool would be very slow if run "automake/autoconf --version", for
+example, when compile xz (make -j1):
+
+before patched: 19s
+after patched:  11s
+
+Use plain text to instead of running them.
+
+Upstream-Status: Pending [Report to libtool community]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ build-aux/ltmain.in |    4 ++--
+ libtoolize.in       |    4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+index 0441e48..49cd39a 100644
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -152,8 +152,8 @@ include the following information:
+        compiler flags: $LTCFLAGS
+        linker:         $LD (gnu? $with_gnu_ld)
+        version:        $progname (GNU @PACKAGE@) @VERSION@
+-       automake:       `($AUTOMAKE --version) 2>/dev/null |$SED 1q`
+-       autoconf:       `($AUTOCONF --version) 2>/dev/null |$SED 1q`
++       automake:       run $AUTOMAKE --version
++       autoconf:       run $AUTOCONF --version
+ 
+ Report bugs to <@PACKAGE_BUGREPORT@>.
+ GNU @PACKAGE@ home page: <@PACKAGE_URL@>.
+diff --git a/libtoolize.in b/libtoolize.in
+index 684d799..e57c89b 100644
+--- a/libtoolize.in
++++ b/libtoolize.in
+@@ -115,8 +115,8 @@ include the following information:
+ 
+        host-triplet:   @host_triplet@
+        version:        $progname (GNU @PACKAGE@) @VERSION@
+-       automake:       `($AUTOMAKE --version) 2>/dev/null |$SED 1q`
+-       autoconf:       `($AUTOCONF --version) 2>/dev/null |$SED 1q`
++       automake:       run $AUTOMAKE --version
++       autoconf:       run $AUTOCONF --version
+ 
+ Report bugs to <@PACKAGE_BUGREPORT@>.
+ GNU @PACKAGE@ home page: <@PACKAGE_URL@>.
+-- 
+1.7.9.5
+
-- 
1.7.9.5


