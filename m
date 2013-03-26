Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKNWw-0002pQ-6R
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 07:38:46 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb1so1448698pad.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 23:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=LfPxsMUDx97gHRunE6SgGRZhWZ/P0CIrqIcFtcl8F1Y=;
	b=qojBfYugvTrDgL2jwjh19BFMjDYO5U1TQltBVUrXA2fWFFvvVdXDOOZnlU361OCA4e
	LGcHwTPAy9OvRcwEJcJF4MUOH/X8HASoSLAgm2/RrnwGCPAXDt/zhB3pQ6YtLrGyjDxB
	Aw6U42x1KBImO3LnUwgFs5hQRXBW8ZedHjoYv5XbXhxjVGAnJR7QMg7kUQrEoTILqEVF
	eI383fsRgSzc/yOmFoyzzSebaYXRa9XrIWc/+gynFarNkmGdzgPIApsXa+19B1M6rGAW
	srksFqS4G+13DULKcYgVvPlQTH7OhQi5v3yU77PwS7KQoZ0eJk8qPHGCcDgkT1pFEvsE
	6zgQ==
X-Received: by 10.68.235.36 with SMTP id uj4mr21507573pbc.54.1364278904361;
	Mon, 25 Mar 2013 23:21:44 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id f4sm16287016pbc.6.2013.03.25.23.21.43
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 23:21:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2013 23:21:16 -0700
Message-Id: <1364278876-11154-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] binutils: Don't generate .PPC.EMB.apuinfo sections for 64-bit output
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
X-List-Received-Date: Tue, 26 Mar 2013 06:38:48 -0000

This can cause issues building ppc64/eabi kernel. For details
see the patch header

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.23.1.inc |    1 +
 ...pc.c-md_assemble-Do-not-generate-APUinfo-.patch |   46 ++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1.inc b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
index 4523407..667ad0b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.23.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
@@ -47,6 +47,7 @@ BACKPORT = "\
      file://backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch \
      file://backport/binutils-fix-ineffectual-zero-of-cache.patch \
      file://backport/binutils-replace-strncat-with-strcat.patch  \
+     file://backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch  \
 "
 SRC_URI[md5sum] = "33adb18c3048d057ac58d07a3f1adb38"
 SRC_URI[sha256sum] = "2ab2e5b03e086d12c6295f831adad46b3e1410a3a234933a2e8fac66cb2e7a19"
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch b/meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch
new file mode 100644
index 0000000..55bbc6a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch
@@ -0,0 +1,46 @@
+The powerpc assembler can generate .PPC.EMB.apuinfo sections in some 
+circumstances.  These originate, I think, from the old e500 ABI; in 
+any case, they are only defined for 32-bit ABIs, and there is a 
+significant amount of code in bfd/elf32-ppc.c to handle them 
+appropriately, none of which is in elf64-ppc.c.  However, the 
+assembler can generate them when building 64-bit code for processors 
+such as e5500 (which uses PPC_OPCODE_E500MC).  In such circumstances, 
+they get generated as PROGBITS rather than NOTE sections, which 
+reportedly can cause problems in a Linux kernel build. 
+
+Since these sections are only defined in 32-bit ABIs, I think it's 
+most appropriate to avoid generating them for 64-bit output, which 
+this patch does.
+
+Upstream-Status: Backport
+
+-Khem 2013/03/25
+
+From d77411f56a85225e3f7b674e7172c712f6cd61cb Mon Sep 17 00:00:00 2001
+From: Joseph Myers <joseph@codesourcery.com>
+Date: Fri, 25 Jan 2013 02:02:20 +0000
+Subject: [PATCH] 	* config/tc-ppc.c (md_assemble): Do not generate
+ APUinfo sections 	for 64-bit output.
+
+---
+ gas/ChangeLog       |    5 +++++
+ gas/config/tc-ppc.c |    3 ++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/gas/config/tc-ppc.c b/gas/config/tc-ppc.c
+index fd15bea..0929e52 100644
+--- a/gas/config/tc-ppc.c
++++ b/gas/config/tc-ppc.c
+@@ -3249,7 +3249,8 @@ md_assemble (char *str)
+ 
+ #ifdef OBJ_ELF
+   /* Do we need/want an APUinfo section? */
+-  if ((ppc_cpu & (PPC_OPCODE_E500 | PPC_OPCODE_E500MC | PPC_OPCODE_VLE)) != 0)
++  if ((ppc_cpu & (PPC_OPCODE_E500 | PPC_OPCODE_E500MC | PPC_OPCODE_VLE)) != 0
++      && !ppc_obj64)
+     {
+       /* These are all version "1".  */
+       if (opcode->flags & PPC_OPCODE_SPE)
+-- 
+1.7.9.5
+
-- 
1.7.9.5



