Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAxgC-00037i-Oq
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 08:13:35 +0100
Received: by mail-pb0-f43.google.com with SMTP id md12so900906pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 22:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=2i/c/WGLzmhdxwyEscHOr5mCg7T5vcl2Tvzur8+2MIU=;
	b=XkJ0Y2jJE6elRwGHqw+guweAcAs9HfDGVfBJZgyDz8xXcbwYARrwJE0QzJjb79pU7J
	gli/vrFd+Hfkm7rYaURXsD33NAOU2TNnjDsKMq/gdvGJHvTQs96DWBE/UcMjMZAGbtDO
	aHB80BJ+OUdyim6M4HrPXLg8bTBziIrfxagaoU1cH7aQzEzeOF4N1fRwONDcjVKb4gZ0
	i2uygwcF8lGT6hTGLpK++Rq6dxxqH8LKMSWTCVqiHYweGks6pJEDUcNKp8dwn8IWbkG4
	oIFWqiAEE8Z3oBZignpjDqkCIhKjT+EPuVvZMgxZfKQfUaP8S5jZ7MQuiM8VyImU6XX6
	2WoQ==
X-Received: by 10.66.163.228 with SMTP id yl4mr11689228pab.96.1362034617288;
	Wed, 27 Feb 2013 22:56:57 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id xr3sm7337912pbc.46.2013.02.27.22.56.55
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 22:56:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 22:56:42 -0800
Message-Id: <1362034602-30163-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gcc-4.7: Fix build with texinfo 5.0+
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
X-List-Received-Date: Thu, 28 Feb 2013 07:13:35 -0000

[YOCTO #3947]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    3 +-
 .../gcc-4.7/texinfo-5.0-PR-bootstrap-56258.patch   |   86 ++++++++++++++++++++
 2 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/texinfo-5.0-PR-bootstrap-56258.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 8735e48..615499e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r18"
+PR = "r19"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
@@ -75,6 +75,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch \
 	   file://0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch \
 	   file://use-ml-conf-files-from-B.patch \
+	   file://texinfo-5.0-PR-bootstrap-56258.patch \
 	  "
 SRC_URI[md5sum] = "cc308a0891e778cfda7a151ab8a6e762"
 SRC_URI[sha256sum] = "8a9283d7010fb9fe5ece3ca507e0af5c19412626384f8a5e9434251ae100b084"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/texinfo-5.0-PR-bootstrap-56258.patch b/meta/recipes-devtools/gcc/gcc-4.7/texinfo-5.0-PR-bootstrap-56258.patch
new file mode 100644
index 0000000..f72e689
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/texinfo-5.0-PR-bootstrap-56258.patch
@@ -0,0 +1,86 @@
+Fix build when using texinfo 5.0+
+
+Upstream version of this patch is posted here
+
+http://patchwork.ozlabs.org/patch/222190/
+
+Upstream-Status: Backport
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4.7.2/gcc/ada/gnat-style.texi
+===================================================================
+--- gcc-4.7.2.orig/gcc/ada/gnat-style.texi	2011-08-02 00:42:46.000000000 -0700
++++ gcc-4.7.2/gcc/ada/gnat-style.texi	2013-02-27 22:31:04.385167878 -0800
+@@ -42,7 +42,7 @@
+ @titlepage
+ @titlefont{GNAT Coding Style:}
+ @sp 1
+-@title @hfill A Guide for GNAT Developers
++@title A Guide for GNAT Developers
+ @subtitle GNAT, The GNU Ada Compiler
+ @versionsubtitle
+ @author Ada Core Technologies, Inc.
+Index: gcc-4.7.2/gcc/ada/projects.texi
+===================================================================
+--- gcc-4.7.2.orig/gcc/ada/projects.texi	2012-02-22 06:03:25.000000000 -0800
++++ gcc-4.7.2/gcc/ada/projects.texi	2013-02-27 22:31:04.389167881 -0800
+@@ -48,8 +48,7 @@
+ @item Source file naming conventions; you can specify these either globally or for
+   individual compilation units (@pxref{Naming Schemes}).
+ @item Change any of the above settings depending on external values, thus enabling
+-  the reuse of the projects in various @b{scenarios} (@pxref{Scenarios
+-  in Projects}).
++  the reuse of the projects in various @b{scenarios} (@pxref{Scenarios in Projects}).
+ @item Automatically build libraries as part of the build process
+   (@pxref{Library Projects}).
+ 
+@@ -353,8 +352,8 @@
+ 
+ @item For various reasons, it is sometimes useful to have a project with no
+   sources (most of the time because the attributes defined in the project
+-  file will be reused in other projects, as explained in @pxref{Organizing
+-  Projects into Subsystems}. To do this, the attribute
++  file will be reused in other projects, as explained in
++  @pxref{Organizing Projects into Subsystems}. To do this, the attribute
+   @emph{Source_Files} is set to the empty list, i.e. @code{()}. Alternatively,
+   @emph{Source_Dirs} can be set to the empty list, with the same
+   result.
+@@ -381,8 +380,9 @@
+   This can be done thanks to the attribute @b{Excluded_Source_Files}
+   (or its synonym @b{Locally_Removed_Files}).
+   Its value is the list of file names that should not be taken into account.
+-  This attribute is often used when extending a project, @xref{Project
+-  Extension}. A similar attribute @b{Excluded_Source_List_File} plays the same
++  This attribute is often used when extending a project,
++  @xref{Project Extension}. A similar attribute
++  @b{Excluded_Source_List_File} plays the same
+   role but takes the name of file containing file names similarly to
+   @code{Source_List_File}.
+ 
+Index: gcc-4.7.2/gcc/doc/invoke.texi
+===================================================================
+--- gcc-4.7.2.orig/gcc/doc/invoke.texi	2013-02-27 22:27:14.757163582 -0800
++++ gcc-4.7.2/gcc/doc/invoke.texi	2013-02-27 22:51:34.649190971 -0800
+@@ -5442,7 +5442,7 @@
+ @opindex fdump-rtl-postreload
+ Dump after post-reload optimizations.
+ 
+-@itemx -fdump-rtl-pro_and_epilogue
++@item -fdump-rtl-pro_and_epilogue
+ @opindex fdump-rtl-pro_and_epilogue
+ Dump after generating the function prologues and epilogues.
+ 
+Index: gcc-4.7.2/libjava/classpath/doc/cp-tools.texinfo
+===================================================================
+--- gcc-4.7.2.orig/libjava/classpath/doc/cp-tools.texinfo	2012-08-06 07:34:27.000000000 -0700
++++ gcc-4.7.2/libjava/classpath/doc/cp-tools.texinfo	2013-02-27 22:31:04.389167881 -0800
+@@ -2022,7 +2022,7 @@
+ 
+ @item Virtual Machine Options
+ @xref{Virtual Machine Options,,Options Controlling Gjdoc Behavior}.
+-@gccoptlist{-classpath}  @gccoptlist{-bootclasspath}  @gccoptlist{-J}@var{vmopt}
++@gccoptlist{-classpath  -bootclasspath  -J @var{vmopt}}
+ 
+ @end table
+ 
-- 
1.7.9.5



