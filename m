Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SCSzp-00026H-7w
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 11:47:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2R9cJ3g024512
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 02:38:19 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 27 Mar 2012 02:38:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Mar 2012 17:37:17 +0800
Message-ID: <969c0273ef32f21f663a1a57e976a439c53d3398.1332839233.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1332839233.git.liezhi.yang@windriver.com>
References: <cover.1332839233.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nspr 4.8.9: failed to build on x86_64 board
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2012 09:47:21 -0000
Content-Type: text/plain

nspr failed to build on x86_64 board(e.g., qemux86-64):

x86_64-poky-linux-gcc    -m64 ... -m32 ...
...
fatal error: gnu/stubs-32.h: No such file or directory

This is because there are both '-m64' and '-m32' in gcc's options, and
the later one is used, but what we need is '-m64' since it is x86_64,
this is caused by an incorrect logic in configure.in, we should assume
that the pkg uses 64bit when target_cpu is x86_64 (it has two options:
--enable-n32 and --enable-64bit, both of them are not set by default),
we only can assume that the pkg uses 32bit when USE_N32 is set. But
what it did was that assumed 32bit when target_cpu was x86_64 unless
--enable-64bit was set, this seems unreasonable and caused the "gcc -m64
-m32" error.

Some had noticed this error before:
https://lists.yoctoproject.org/pipermail/poky/2011-May/005799.html

NOTE:
* Both fix configure and configure.in since we can't run the
  "autoreconf" for nsrp, please see more explanation in
  trickly-fix-build-on-x86_64.patch.

* Also fixed powerpc64, this is just fixed by conclusion since we don't
  suport ppc64.

[YOCTO #2179]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../nspr/files/fix-build-on-x86_64.patch           |   51 ++++++++++++++++
 .../nspr/files/trickly-fix-build-on-x86_64.patch   |   62 ++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.8.9.bb            |    4 +-
 3 files changed, 116 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/nspr/files/fix-build-on-x86_64.patch
 create mode 100644 meta/recipes-support/nspr/files/trickly-fix-build-on-x86_64.patch

diff --git a/meta/recipes-support/nspr/files/fix-build-on-x86_64.patch b/meta/recipes-support/nspr/files/fix-build-on-x86_64.patch
new file mode 100644
index 0000000..a6fa1ea
--- /dev/null
+++ b/meta/recipes-support/nspr/files/fix-build-on-x86_64.patch
@@ -0,0 +1,51 @@
+Fix build failure on x86_64
+
+When the target_cpu is x86_64, we should assume that the pkg uses 64bit,
+only if USE_N32 is set, we can assume that the pkg uses 32bit. It used a
+opposite logic before.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Pending
+---
+ configure.in |   12 ++++++------
+ 1 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 39c96a3..99a03ac 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1778,24 +1778,24 @@ tools are selected during the Xcode/Developer Tools installation.])
+         PR_MD_ASFILES=os_Linux_ia64.s
+         ;;
+     x86_64)
+-        if test -n "$USE_64"; then
+-            PR_MD_ASFILES=os_Linux_x86_64.s
+-        else
++        if test -n "$USE_N32"; then
+             AC_DEFINE(i386)
+             PR_MD_ASFILES=os_Linux_x86.s
+             CC="$CC -m32"
+             CXX="$CXX -m32"
++        else
++            PR_MD_ASFILES=os_Linux_x86_64.s
+         fi
+         ;;
+     ppc|powerpc)
+         PR_MD_ASFILES=os_Linux_ppc.s
+         ;;
+     powerpc64)
+-        if test -n "$USE_64"; then
++        if test -n "$USE_N32"; then
++            PR_MD_ASFILES=os_Linux_ppc.s
++        else
+             CC="$CC -m64"
+             CXX="$CXX -m64"
+-        else
+-            PR_MD_ASFILES=os_Linux_ppc.s
+         fi
+         ;;
+     m68k)
+-- 
+1.7.1
+
diff --git a/meta/recipes-support/nspr/files/trickly-fix-build-on-x86_64.patch b/meta/recipes-support/nspr/files/trickly-fix-build-on-x86_64.patch
new file mode 100644
index 0000000..8ca51e4
--- /dev/null
+++ b/meta/recipes-support/nspr/files/trickly-fix-build-on-x86_64.patch
@@ -0,0 +1,62 @@
+trickily fix build failure on x86_64
+
+It seems that we can not run the 'autoreconf -f -i' for the nspr, I met
+several strange problems while trying to do that, and the previous
+author seemed had noticed this, so he wrote:
+
+do_configure() {
+       oe_runconf
+}
+
+to avoid running the "autoreconf". But we must modify configure.in to
+fix the build failure on x86_64, so both modify configure and
+configure.in, once the "autoreconf" can work correctly, we can remove
+this patch.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Inappropriate [configuration]
+---
+ configure |   12 ++++++------
+ 1 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure b/configure
+--- a/configure
++++ b/configure
+@@ -4366,9 +4366,7 @@ EOF
+         PR_MD_ASFILES=os_Linux_ia64.s
+         ;;
+     x86_64)
+-        if test -n "$USE_64"; then
+-            PR_MD_ASFILES=os_Linux_x86_64.s
+-        else
++        if test -n "$USE_N32"; then
+             cat >> confdefs.h <<\EOF
+ #define i386 1
+ EOF
+@@ -4376,17 +4374,19 @@ EOF
+             PR_MD_ASFILES=os_Linux_x86.s
+             CC="$CC -m32"
+             CXX="$CXX -m32"
++        else
++            PR_MD_ASFILES=os_Linux_x86_64.s
+         fi
+         ;;
+     ppc|powerpc)
+         PR_MD_ASFILES=os_Linux_ppc.s
+         ;;
+     powerpc64)
+-        if test -n "$USE_64"; then
++        if test -n "$USE_N32"; then
++            PR_MD_ASFILES=os_Linux_ppc.s
++        else
+             CC="$CC -m64"
+             CXX="$CXX -m64"
+-        else
+-            PR_MD_ASFILES=os_Linux_ppc.s
+         fi
+         ;;
+     m68k)
+-- 
+1.7.1
+
diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bb b/meta/recipes-support/nspr/nspr_4.8.9.bb
index 8b840d9..f70c2c1 100644
--- a/meta/recipes-support/nspr/nspr_4.8.9.bb
+++ b/meta/recipes-support/nspr/nspr_4.8.9.bb
@@ -5,10 +5,12 @@ LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=40;md5=99d4d7d68bbc4
                     file://Makefile.in;beginline=4;endline=38;md5=c2b512182a334e1bfa1edc4d1c84a298 "
 SECTION = "libs/network"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
            file://remove-rpath-from-tests.patch \
+           file://fix-build-on-x86_64.patch \
+           file://trickly-fix-build-on-x86_64.patch \
           "
 
 SRC_URI += "file://nspr.pc.in"
-- 
1.7.1



