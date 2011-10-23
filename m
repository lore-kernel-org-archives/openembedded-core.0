Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RI2rT-0005ru-2q
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:33:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2011 11:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="66250243"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.219])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2011 11:27:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 11:26:56 -0700
Message-Id: <4dcb11eca8e12bd76ba92781c05f14e91fc76abe.1319394187.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/27] gcc-4.6: Backport fix for PR32219
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
X-List-Received-Date: Sun, 23 Oct 2011 18:33:31 -0000

From: Khem Raj <raj.khem@gmail.com>

This fix is needed for gold to work. Otherwise
connman fails to build since it used hidden weak
symbols.

See

http://gcc.gnu.org/bugzilla/PR32219
http://www.cygwin.com/ml/binutils/2008-02/msg00239.html

The fix proposed to gcc had reviews which were not addressed hence the
patch is not yet
applied to gcc upstream.

connman can also have workaround by changing the visibility of these
symbols to be default
 __attribute__ ((weak, visibility("hidden")))

to

 __attribute__ ((weak, visibility("default")))

in include/plugin.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc           |    3 +-
 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch |   71 +++++++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index fbc90ea..469457c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r15"
+PR = "r16"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -70,6 +70,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
            file://fix-for-ice-50099.patch \
 	   file://gcc-with-linker-hash-style.patch \
 	   file://pr46934.patch \
+	   file://pr32219.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch b/meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch
new file mode 100644
index 0000000..e310080
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch
@@ -0,0 +1,71 @@
+Hi,
+
+As suggested by richi.
+regtested on i686-linux-gnu with all default languages and no regressions.
+Ok for trunk?
+
+gcc/ChangeLog
+2010-03-15  Bernhard Reutner-Fischer  <aldot@gcc.gnu.org>
+
+	PR target/32219
+	* varasm.c (default_binds_local_p_1): Weak data is not local.
+
+gcc/testsuite/ChangeLog
+2010-03-15  Bernhard Reutner-Fischer  <aldot@gcc.gnu.org>
+
+	PR target/32219
+	* gcc.dg/visibility-21.c: New test.
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ gcc/testsuite/gcc.dg/visibility-21.c |   14 ++++++++++++++
+ gcc/varasm.c                         |    8 ++++----
+ 2 files changed, 18 insertions(+), 4 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.dg/visibility-21.c
+
+Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/visibility-21.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_6-branch/gcc/testsuite/gcc.dg/visibility-21.c	2011-10-18 17:11:33.224827436 -0700
+@@ -0,0 +1,14 @@
++/* PR target/32219 */
++/* { dg-do run } */
++/* { dg-require-visibility "" } */
++/* { dg-options "-fPIC" { target fpic } } */
++
++extern void f() __attribute__((weak,visibility("hidden")));
++extern int puts( char const* );
++int main()
++{
++	if (f)
++		f();
++	return 0;
++}
++
+Index: gcc-4_6-branch/gcc/varasm.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/varasm.c	2011-09-16 19:58:21.000000000 -0700
++++ gcc-4_6-branch/gcc/varasm.c	2011-10-18 17:19:06.431074788 -0700
+@@ -6760,6 +6760,10 @@
+   /* Static variables are always local.  */
+   else if (! TREE_PUBLIC (exp))
+     local_p = true;
++  /* hidden weak can't be overridden by something non-local, all
++     that is possible is that it is not defined at all. */
++  else if (DECL_WEAK (exp))
++    local_p = false;
+   /* A variable is local if the user has said explicitly that it will
+      be.  */
+   else if ((DECL_VISIBILITY_SPECIFIED (exp)
+@@ -6773,11 +6777,6 @@
+      local.  */
+   else if (DECL_VISIBILITY (exp) != VISIBILITY_DEFAULT)
+     local_p = true;
+-  /* Default visibility weak data can be overridden by a strong symbol
+-     in another module and so are not local.  */
+-  else if (DECL_WEAK (exp)
+-	   && !resolved_locally)
+-    local_p = false;
+   /* If PIC, then assume that any global name can be overridden by
+      symbols resolved from other modules.  */
+   else if (shlib)
-- 
1.7.6.4



