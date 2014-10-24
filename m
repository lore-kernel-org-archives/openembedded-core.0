Return-Path: <Shan.Hai@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD5656AC19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 06:05:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9O65oYO008517
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 23:05:50 -0700 (PDT)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 23 Oct 2014 23:05:50 -0700
From: Shan Hai <shan.hai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Oct 2014 14:05:36 +0800
Message-ID: <1414130736-1700-2-git-send-email-shan.hai@windriver.com>
X-Mailer: git-send-email 1.7.0.5
In-Reply-To: <1414130736-1700-1-git-send-email-shan.hai@windriver.com>
References: <1414130736-1700-1-git-send-email-shan.hai@windriver.com>
MIME-Version: 1.0
Cc: par.olsson@windriver.com
Subject: [PATCH 1/1] ldconfig-native: fix a endian-ness bug
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
X-List-Received-Date: Fri, 24 Oct 2014 06:05:49 -0000
Content-Type: text/plain

Some header fields of ELF were read with wrong size on 64bit
big-endian machine, fix it by reading the fields with read64
instead of read32.

Signed-off-by: Par Olsson <Par.Olsson@windriver.com>
Signed-off-by: Shan Hai <shan.hai@windriver.com>
---
 .../endian-ness_handling_fix.patch                 | 47 ++++++++++++++++++++++
 meta/recipes-core/glibc/ldconfig-native_2.12.1.bb  |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/endian-ness_handling_fix.patch

diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/endian-ness_handling_fix.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/endian-ness_handling_fix.patch
new file mode 100644
index 0000000..6aecfe5
--- /dev/null
+++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/endian-ness_handling_fix.patch
@@ -0,0 +1,47 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Fix problem during parsing of ELF headers for 64bit on big-endian.
+Some header fields were read with wrong size.
+
+2014/10/24
+Par Olsson <Par.Olsson@windriver.com>
+Shan Hai <shan.hai@windriver.com>
+
+diff --git a/readelflib.c b/readelflib.c
+index 3f5b25b..0bf0de3 100644
+--- a/readelflib.c
++++ b/readelflib.c
+@@ -261,8 +261,8 @@ process_elf_file64 (const char *file_name, const char *lib, int *flag,
+   int i;
+   unsigned int j;
+   Elf64_Addr loadaddr;
+-  unsigned int dynamic_addr;
+-  size_t dynamic_size;
++  Elf64_Addr dynamic_addr;
++  Elf64_Xword dynamic_size;
+   char *program_interpreter;
+ 
+   Elf64_Ehdr *elf_header;
+@@ -311,7 +311,7 @@ process_elf_file64 (const char *file_name, const char *lib, int *flag,
+ 	    error (0, 0, _("more than one dynamic segment\n"));
+ 
+ 	  dynamic_addr = read64(segment->p_offset, be);
+-	  dynamic_size = read32(segment->p_filesz, be);
++	  dynamic_size = read64(segment->p_filesz, be);
+ 	  break;
+ 
+ 	case PT_INTERP:
+@@ -329,11 +329,11 @@ process_elf_file64 (const char *file_name, const char *lib, int *flag,
+ 	  break;
+ 
+ 	case PT_NOTE:
+-	  if (!*osversion && read32(segment->p_filesz, be) >= 32 && read32(segment->p_align, be) >= 4)
++	  if (!*osversion && read64(segment->p_filesz, be) >= 32 && read64(segment->p_align, be) >= 4)
+ 	    {
+ 	      Elf64_Word *abi_note = (Elf64_Word *) (file_contents
+ 						     + read64(segment->p_offset, be));
+-	      Elf64_Addr size = read32(segment->p_filesz, be);
++	      Elf64_Xword size = read64(segment->p_filesz, be);
+ 
+ 	      while (read32(abi_note [0], be) != 4 || read32(abi_note [1], be) != 16
+ 		     || read32(abi_note [2], be) != 1
diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
index 7c34635..1debf8e 100644
--- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
            file://flag_fix.patch \
            file://endianess-header.patch \
            file://ldconfig-default-to-all-multilib-dirs.patch \
+           file://endian-ness_handling_fix.patch \
 "
 
 PR = "r2"
-- 
1.8.5.2.233.g932f7e4


