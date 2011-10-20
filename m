Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGyVE-0005Bn-A4
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 21:42:08 +0200
Received: by iafi7 with SMTP id i7so3669416iaf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 12:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+9hNOoBIH1r+b6PYn7QgqBMcpO7ZHixl3fAFR6Ml8ks=;
	b=F3TqXBynjhfhv0rOdODnOUZbSBcaoQMI4S8eMSX47mmHGsRMSU6Z+DJ/lbzk0hO+6B
	PHKz80ayKCV8T/ohdS5aRNrDYiCF5qxyaVJxAHtg1KOVMYpDVYPe5dE2qBfgHmz0K2qC
	vvHDANFVoe5MiynMqgvcUw8RzByZ/ypGI+11M=
Received: by 10.43.49.131 with SMTP id va3mr19996170icb.51.1319139374790;
	Thu, 20 Oct 2011 12:36:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id c2sm26057020iba.7.2011.10.20.12.36.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 12:36:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 12:36:02 -0700
Message-Id: <712afcc9d364613d5f81e8f9b6f7cbbfc21e80ba.1319139126.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <15763124703d12326c8ba4d296a2b2680528c2da.1319139126.git.raj.khem@gmail.com>
References: <15763124703d12326c8ba4d296a2b2680528c2da.1319139126.git.raj.khem@gmail.com>
In-Reply-To: <cover.1319139126.git.raj.khem@gmail.com>
References: <cover.1319139126.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] gcc-4.6: Backport fix for PR32219
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
X-List-Received-Date: Thu, 20 Oct 2011 19:42:09 -0000

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
1.7.5.4



