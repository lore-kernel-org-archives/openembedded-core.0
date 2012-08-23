Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T4bSU-0000wR-TI
	for openembedded-core@openembedded.org; Thu, 23 Aug 2012 19:44:43 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 9B2EB1F45A;
	Thu, 23 Aug 2012 10:32:37 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@openembedded.org
Date: Thu, 23 Aug 2012 10:32:31 -0700
Message-Id: <1345743151-2065-3-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <1345743151-2065-2-git-send-email-andy.ross@windriver.com>
References: <1345743151-2065-1-git-send-email-andy.ross@windriver.com>
	<1345743151-2065-2-git-send-email-andy.ross@windriver.com>
Subject: [PATCH 2/2] ld: -rpath must search under sysroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2012 17:44:43 -0000

The -rpath argument would search the host filesystem for libraries,
even when a sysroot was defined.  For cross toolchains with targets
compatible with the host architecture this can find incorrect
libraries.  Leave -rpath-link unmodified, as build systems in the wild
are already using this to point to host directories.

[YOCTO #2965]

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.22.inc   |  3 +-
 .../binutils/binutils/rpath-sysroot.patch          | 38 ++++++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/rpath-sysroot.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.22.inc b/meta/recipes-devtools/binutils/binutils-2.22.inc
index 17950a2..821cc55 100644
--- a/meta/recipes-devtools/binutils/binutils-2.22.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.22.inc
@@ -1,4 +1,4 @@
-PR = "r14"
+PR = "r15"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
@@ -31,6 +31,7 @@ SRC_URI = "\
      file://binutils-armv5e.patch \
      file://mips64-default-ld-emulation.patch \
      file://0001-PR-ld-13470.patch \
+     file://rpath-sysroot.patch \
      "
 
 SRC_URI[md5sum] = "ee0f10756c84979622b992a4a61ea3f5"
diff --git a/meta/recipes-devtools/binutils/binutils/rpath-sysroot.patch b/meta/recipes-devtools/binutils/binutils/rpath-sysroot.patch
new file mode 100644
index 0000000..955699e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/rpath-sysroot.patch
@@ -0,0 +1,38 @@
+ld: -rpath must search under sysroot
+
+The -rpath argument would search the host filesystem for libraries,
+even when a sysroot was defined.  For cross toolchains with targets
+compatible with the host architecture this can find incorrect
+libraries.  Leave -rpath-link unmodified, as build systems in the wild
+are already using this to point to host directories.
+
+Signed-off-by: Andy Ross <andy.ross@windriver.com>
+Upstream-Status: submitted (binutils@sourceware.org 2012-08-22)
+---
+ ld/emultempl/elf32.em | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
+index de51050..35e0e7e 100644
+--- a/ld/emultempl/elf32.em
++++ b/ld/emultempl/elf32.em
+@@ -1263,9 +1263,13 @@ fragment <<EOF
+ EOF
+ if [ "x${USE_LIBPATH}" = xyes ] ; then
+ fragment <<EOF
+-	  if (gld${EMULATION_NAME}_search_needed (command_line.rpath,
+-						  &n, force))
+-	    break;
++	  if (command_line.rpath) {
++	    char *tmprp = gld${EMULATION_NAME}_add_sysroot (command_line.rpath);
++	    found = gld${EMULATION_NAME}_search_needed (tmprp, &n, force);
++	    free(tmprp);
++	    if (found)
++	      break;
++	  }
+ EOF
+ fi
+ if [ "x${NATIVE}" = xyes ] ; then
+-- 
+1.7.11.2
+
-- 
1.7.11.4



