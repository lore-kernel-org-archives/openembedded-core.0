Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJZr-0005c2-GO
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:35 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so5415613dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=I9jN/3dzJArfgzaPUFbLUpDaLmEga+kGALkxKrOgeXM=;
	b=uHZa2L8Z0q2ZhwxDdl+9flXKUU/XYZtNp+BQqAgKVDM8b7w4ukY9UghER2Sp2jOTBw
	323cvMuMTNuZDTXtB44Hvziukl1+oe0ub5g/tPLb6bCB/ZVULstFclH/IsMMlJgp6pQJ
	Qmm7EczCYAPF7YViAaYQVW9nFjI3wK4Uvo+xD9cZeEkBMHWzCTPWogoj7fYsXTi5p4eo
	lk5uIpUErIkoKCaM7TO17xn+I6pQtiT7bQOmNcM5gI4cGuO0PNf5MQwhKNe+UytsKU1O
	hJDFutq1kJGcarknuZay+SQa/+XYOweLkeOlSVgKtV2dhWyiTzeqnu3yJDYR9LeXv5If
	qZSg==
Received: by 10.68.234.73 with SMTP id uc9mr45045206pbc.65.1337571390451;
	Sun, 20 May 2012 20:36:30 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:39 -0700
Message-Id: <99f859612e16d636702f9bb11825259d90e468f2.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 04/14] binutils: Default to n64 when configured for mips64
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
X-List-Received-Date: Mon, 21 May 2012 03:46:35 -0000

Default ABI for mips64 is n64 so make it default in binutils

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/mips64-default-ld-emulation.patch     |   49 ++++++++++++++++++++
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    3 +-
 2 files changed, 51 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch

diff --git a/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch b/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch
new file mode 100644
index 0000000..ab01859
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch
@@ -0,0 +1,49 @@
+for mips64*-*-linux we change the default emulations to be
+N64 instead of N32
+
+Upstream-Status: Inappropriate [ OE configuration Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: binutils-2.22/bfd/config.bfd
+===================================================================
+--- binutils-2.22.orig/bfd/config.bfd	2011-07-28 15:35:13.000000000 -0700
++++ binutils-2.22/bfd/config.bfd	2012-04-23 21:07:44.151578222 -0700
+@@ -970,13 +970,13 @@
+     ;;
+ #ifdef BFD64
+   mips64*el-*-linux*)
+-    targ_defvec=bfd_elf32_ntradlittlemips_vec
+-    targ_selvecs="bfd_elf32_ntradbigmips_vec bfd_elf32_tradlittlemips_vec bfd_elf32_tradbigmips_vec bfd_elf64_tradlittlemips_vec bfd_elf64_tradbigmips_vec"
++    targ_defvec=bfd_elf64_tradlittlemips_vec
++    targ_selvecs="bfd_elf32_ntradbigmips_vec bfd_elf32_ntradlittlemips_vec bfd_elf32_tradlittlemips_vec bfd_elf32_tradbigmips_vec bfd_elf64_tradbigmips_vec"
+     want64=true
+     ;;
+   mips64*-*-linux*)
+-    targ_defvec=bfd_elf32_ntradbigmips_vec
+-    targ_selvecs="bfd_elf32_ntradlittlemips_vec bfd_elf32_tradbigmips_vec bfd_elf32_tradlittlemips_vec bfd_elf64_tradbigmips_vec bfd_elf64_tradlittlemips_vec"
++    targ_defvec=bfd_elf64_tradbigmips_vec
++    targ_selvecs="bfd_elf32_ntradbigmips_vec bfd_elf32_ntradlittlemips_vec bfd_elf32_tradbigmips_vec bfd_elf32_tradlittlemips_vec bfd_elf64_tradlittlemips_vec"
+     want64=true
+     ;;
+ #endif
+Index: binutils-2.22/ld/configure.tgt
+===================================================================
+--- binutils-2.22.orig/ld/configure.tgt	2011-11-21 01:29:37.000000000 -0800
++++ binutils-2.22/ld/configure.tgt	2012-04-23 21:05:34.183571931 -0700
+@@ -395,11 +395,11 @@
+ mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
+ 		        targ_extra_emuls="elf32elmipvxworks" ;;
+ mips*-*-windiss)	targ_emul=elf32mipswindiss ;;
+-mips64*el-*-linux-*)	targ_emul=elf32ltsmipn32
+-			targ_extra_emuls="elf32btsmipn32 elf32ltsmip elf32btsmip elf64ltsmip elf64btsmip"
++mips64*el-*-linux-*)	targ_emul=elf64ltsmip
++			targ_extra_emuls="elf32btsmipn32 elf32ltsmipn32 elf32ltsmip elf32btsmip elf64btsmip"
+ 			targ_extra_libpath=$targ_extra_emuls ;;
+-mips64*-*-linux-*)	targ_emul=elf32btsmipn32
+-			targ_extra_emuls="elf32ltsmipn32 elf32btsmip elf32ltsmip elf64btsmip elf64ltsmip"
++mips64*-*-linux-*)	targ_emul=elf64btsmip
++			targ_extra_emuls="elf32btsmipn32 elf32ltsmipn32 elf32btsmip elf32ltsmip elf64ltsmip"
+ 			targ_extra_libpath=$targ_extra_emuls ;;
+ mips*el-*-linux-*)	targ_emul=elf32ltsmip
+ 			targ_extra_emuls="elf32btsmip elf32ltsmipn32 elf64ltsmip elf32btsmipn32 elf64btsmip"
diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recipes-devtools/binutils/binutils_2.22.bb
index d6d19a1..ae15e82 100644
--- a/meta/recipes-devtools/binutils/binutils_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r6"
+PR = "r7"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
@@ -31,6 +31,7 @@ SRC_URI = "\
      file://clone-shadow.patch \
      file://binutils-powerpc-e5500.patch \
      file://binutils-armv5e.patch \
+     file://mips64-default-ld-emulation.patch \
      "
 
 SRC_URI[md5sum] = "ee0f10756c84979622b992a4a61ea3f5"
-- 
1.7.5.4



