Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE8A6D8E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:36:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2PAaEaC028012 for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:36:42 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FY1qRyEoKgJL
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:36:42 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2PAaew2028029
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:36:41 GMT
Message-ID: <1395743793.24890.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Mar 2014 10:36:33 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] binutils: Add fixes for binutils issue 16428
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
X-List-Received-Date: Tue, 25 Mar 2014 10:36:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

"ld:i386 crashes with -static -fPIE -pie"
https://bugs.launchpad.net/ubuntu/+source/binutils/+bug/1266492

This adds in two upstream binutils fixes to avoid the internal error
triggered by the combination of -static with -pie on x86 builds. This
triggers a backtrace which then triggers a bug in glibc where the process
ends up hanging on some systems with broken libcs.

We can't fix the libc but we can stop the internal error and hence
avoid the hanging builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/binutils/binutils-2.24.inc b/meta/recipes-devtools/binutils/binutils-2.24.inc
index 42d4ede..6415a6f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.24.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.24.inc
@@ -28,6 +28,8 @@ SRC_URI = "\
      file://fix-pr15815.patch \
      file://fix-pr2404.patch \
      file://fix-pr16476.patch \
+     file://fix-pr16428a.patch \
+     file://fix-pr16428b.patch \
      "
 
 SRC_URI[md5sum] = "e0f71a7b2ddab0f8612336ac81d9636b"
diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr16428a.patch b/meta/recipes-devtools/binutils/binutils/fix-pr16428a.patch
new file mode 100644
index 0000000..9ab2b56
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/fix-pr16428a.patch
@@ -0,0 +1,73 @@
+From d1ec1e40b5b457c92aaa23f7af40e026e4596a99 Mon Sep 17 00:00:00 2001
+From: H.J. Lu <hjl.tools@gmail.com>
+Date: Tue, 14 Jan 2014 10:48:39 -0800
+Subject: [PATCH 1/1] Don't update reloc count if there are any non pc-relative relocs
+
+	PR ld/16428
+	* elf32-i386.c (elf_i386_allocate_dynrelocs): Don't update reloc
+	count if there are any non pc-relative relocs.
+	* elf64-x86-64.c (elf_x86_64_allocate_dynrelocs): Likewise.
+---
+ bfd/ChangeLog      |    7 +++++++
+ bfd/elf32-i386.c   |    9 +++++++--
+ bfd/elf64-x86-64.c |    9 +++++++--
+ 3 files changed, 21 insertions(+), 4 deletions(-)
+
+#diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+#index a8f1f94..7a49fd1 100644
+#--- a/bfd/ChangeLog
+#+++ b/bfd/ChangeLog
+#@@ -1,3 +1,10 @@
+#+2014-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+#+
+#+	PR ld/16428
+#+	* elf32-i386.c (elf_i386_allocate_dynrelocs): Don't update reloc
+#+	count if there are any non pc-relative relocs.
+#+	* elf64-x86-64.c (elf_x86_64_allocate_dynrelocs): Likewise.
+#+
+# 2014-01-14  Michael Hudson-Doyle  <michael.hudson@linaro.org>
+# 	    Kugan Vivekanandarajah  <kugan.vivekanandarajah@linaro.org>
+# 
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index 4d391e1..d7f59e5 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -2368,8 +2368,13 @@ elf_i386_allocate_dynrelocs (struct elf_link_hash_entry *h, void *inf)
+ 
+ 	  for (pp = &eh->dyn_relocs; (p = *pp) != NULL; )
+ 	    {
+-	      p->count -= p->pc_count;
+-	      p->pc_count = 0;
++	      /* Don't update reloc count if there are any non
++		 pc-relative relocs.  */
++	      if (!h->pointer_equality_needed)
++		{
++		  p->count -= p->pc_count;
++		  p->pc_count = 0;
++		}
+ 	      if (p->count == 0)
+ 		*pp = p->next;
+ 	      else
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index edee8ec..999011b 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -2463,8 +2463,13 @@ elf_x86_64_allocate_dynrelocs (struct elf_link_hash_entry *h, void * inf)
+ 
+ 	  for (pp = &eh->dyn_relocs; (p = *pp) != NULL; )
+ 	    {
+-	      p->count -= p->pc_count;
+-	      p->pc_count = 0;
++	      /* Don't update reloc count if there are any non
++		 pc-relative relocs.  */
++	      if (!h->pointer_equality_needed)
++		{
++		  p->count -= p->pc_count;
++		  p->pc_count = 0;
++		}
+ 	      if (p->count == 0)
+ 		*pp = p->next;
+ 	      else
+-- 
+1.7.1
+
diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr16428b.patch b/meta/recipes-devtools/binutils/binutils/fix-pr16428b.patch
new file mode 100644
index 0000000..79bf9eb
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/fix-pr16428b.patch
@@ -0,0 +1,73 @@
+From 818d220a6fe3d0512a226188e9164245a02c9185 Mon Sep 17 00:00:00 2001
+From: H.J. Lu <hjl.tools@gmail.com>
+Date: Tue, 14 Jan 2014 16:42:35 -0800
+Subject: [PATCH] Don't discard relocs against __ehdr_start
+
+__ehdr_start will be defined by assign_file_positions_for_non_load_sections
+later.
+
+	PR ld/16428
+	* elf32-i386.c (elf_i386_allocate_dynrelocs): Don't discard relocs
+	against __ehdr_start.
+	* elf64-x86-64.c (elf_x86_64_allocate_dynrelocs): Likewise.
+---
+ bfd/ChangeLog      |    7 +++++++
+ bfd/elf32-i386.c   |    7 +++++--
+ bfd/elf64-x86-64.c |    7 +++++--
+ 3 files changed, 17 insertions(+), 4 deletions(-)
+
+#diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+#index 7d13a35..f4acda0 100644
+#--- a/bfd/ChangeLog
+#+++ b/bfd/ChangeLog
+#@@ -1,5 +1,12 @@
+# 2014-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+# 
+#+	PR ld/16428
+#+	* elf32-i386.c (elf_i386_allocate_dynrelocs): Don't discard relocs
+#+	against __ehdr_start.
+#+	* elf64-x86-64.c (elf_x86_64_allocate_dynrelocs): Likewise.
+#+
+#+2014-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+#+
+# 	* elf32-i386.c (elf_i386_allocate_dynrelocs): Revert the last
+# 	change.
+# 	* elf64-x86-64.c (elf_x86_64_allocate_dynrelocs): Likewise.
+Index: binutils-2.24/bfd/elf32-i386.c
+===================================================================
+--- binutils-2.24.orig/bfd/elf32-i386.c	2014-03-25 10:26:54.818385608 +0000
++++ binutils-2.24/bfd/elf32-i386.c	2014-03-25 10:26:54.814385607 +0000
+@@ -2395,9 +2395,12 @@
+ 	}
+ 
+       /* Also discard relocs on undefined weak syms with non-default
+-    	 visibility.  */
++    	 visibility.   Don't discard relocs against __ehdr_start which
++	 will be defined by assign_file_positions_for_non_load_sections
++	 later.  */
+       if (eh->dyn_relocs != NULL
+-	  && h->root.type == bfd_link_hash_undefweak)
++	  && h->root.type == bfd_link_hash_undefweak
++	  && strcmp (h->root.root.string, "__ehdr_start") != 0)
+ 	{
+ 	  if (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT)
+ 	    eh->dyn_relocs = NULL;
+Index: binutils-2.24/bfd/elf64-x86-64.c
+===================================================================
+--- binutils-2.24.orig/bfd/elf64-x86-64.c	2014-03-25 10:26:54.818385608 +0000
++++ binutils-2.24/bfd/elf64-x86-64.c	2014-03-25 10:26:54.814385607 +0000
+@@ -2478,9 +2478,12 @@
+ 	}
+ 
+       /* Also discard relocs on undefined weak syms with non-default
+-	 visibility.  */
++    	 visibility.   Don't discard relocs against __ehdr_start which
++	 will be defined by assign_file_positions_for_non_load_sections
++	 later.  */
+       if (eh->dyn_relocs != NULL
+-	  && h->root.type == bfd_link_hash_undefweak)
++	  && h->root.type == bfd_link_hash_undefweak
++	  && strcmp (h->root.root.string, "__ehdr_start") != 0)
+ 	{
+ 	  if (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT)
+ 	    eh->dyn_relocs = NULL;



