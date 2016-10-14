Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 798D371A7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 12:04:14 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id qn10so6041832pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BO/iv5ZHok2K1oPTCubLJXj5DyVARekyWRBDqYod6/w=;
	b=OYrEbkj5hT/wBk8hLL0lxI79dW6HISU+u4tFVoVEQ6lE2H2ic2forbWD7ytg1pBJvo
	PnW9IhSZNQfYoFzXO6p0IZ70P//Q2jh2YrZ6k2ZPbix2b3Ec411p1jcuVmNxJMJcO5Yt
	o2SAn+ViZASDz82JwbhPVM5SftfiYeBMM9mepJAJMwEXEgWcxoTYsBp6f1JXvI3Ld+OZ
	sIE3lezqdI5GzNr95zI/uTc+SQHtBDYER+8vJnvMEbiAhRmT7OGVZ4vj9BgZo0JMzm7+
	qbn9FwR096MmR+Ag9xyn6y8bU5hGpRbPwFwyj0gIJiL58m/6Z1c8k2BNjSo7GY2FmPMy
	ybjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BO/iv5ZHok2K1oPTCubLJXj5DyVARekyWRBDqYod6/w=;
	b=mVv7Rr1biS65/HKqxQ/P5TUMXvGKDHm3yazq7zVlmBx/3hf1tnb6ldPaYn5weXcpO0
	znmUSB+oOIqyqi4YcBORDwP/1YWBtbsoO59uRAfWMGJF5qQeeGWP89/iuuG7x9s0adeJ
	mvMfrLmNbYiGVr5wxBVU34m6o+rhC/9DwEAMQhiYpgciRyQVOmXEoXT1a3hWWmZkJHCk
	CCYyl196/RFJ3fn9N4NcppXV1mbbaZSqgVp3ThTzcei6Vbl2k37+HzYZ413q/f4v77JZ
	DNcX19JPRxpezPcScYR6XMrDphoMe6rEwmDEGkG0TzODGZZf7mHB4GO7XBpfo9SV4Edv
	pNlQ==
X-Gm-Message-State: AA6/9RkuyzUMrYL0t6QPrAknzpmpCVdGMhay9Gczqqpy5ddQhNzNpPpHGuXzD4S+MK+DDA==
X-Received: by 10.66.168.42 with SMTP id zt10mr14579814pab.63.1476446655901;
	Fri, 14 Oct 2016 05:04:15 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	74sm27073103pfp.77.2016.10.14.05.04.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Oct 2016 05:04:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 05:04:07 -0700
Message-Id: <20161014120407.22128-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [PATCH] binutils: Fix gas error with cfi_section inconsistencies
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
X-List-Received-Date: Fri, 14 Oct 2016 12:04:15 -0000

This error is visible when using clang but not when using gcc
this has been reported and fixed upstream.

llvm bug https://llvm.org/bugs/show_bug.cgi?id=29017
binutils bug https://sourceware.org/bugzilla/show_bug.cgi?id=20648

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.27.inc   |  1 +
 ..._sections-check-to-only-consider-compact-.patch | 97 ++++++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
index 03b7bed..3dc2739 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
@@ -34,6 +34,7 @@ SRC_URI = "\
      file://0012-Add-support-for-Netlogic-XLP.patch \
      file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
      file://0014-libtool-remove-rpath.patch \
+     file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch b/meta/recipes-devtools/binutils/binutils/0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch
new file mode 100644
index 0000000..f3e3a11
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch
@@ -0,0 +1,97 @@
+From 3d3424e9a8d6ad56160b98bf6e223c0346164468 Mon Sep 17 00:00:00 2001
+From: Matthew Fortune <matthew.fortune@imgtec.com>
+Date: Thu, 29 Sep 2016 11:13:46 +0100
+Subject: [PATCH] Refine .cfi_sections check to only consider compact eh_frame
+
+The .cfi_sections directive can be safely used multiple times
+with different sections named at any time unless the compact form
+of exception handling is requested after CFI information has
+been emitted.  Only the compact form of CFI information changes
+the way in which CFI is generated and therefore cannot be
+retrospectively requested after generating CFI information.
+
+gas/
+
+	PR gas/20648
+	* dw2gencfi.c (dot_cfi_sections): Refine the check for
+	inconsistent .cfi_sections to only consider compact vs non
+	compact forms.
+	* testsuite/gas/cfi/cfi-common-9.d: New file.
+	* testsuite/gas/cfi/cfi-common-9.s: New file.
+	* testsuite/gas/cfi/cfi.exp: Run new test.
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com
+
+ gas/ChangeLog                        | 10 ++++++++++
+ gas/dw2gencfi.c                      |  5 ++++-
+ gas/testsuite/gas/cfi/cfi-common-9.d | 23 +++++++++++++++++++++++
+ gas/testsuite/gas/cfi/cfi-common-9.s |  4 ++++
+ gas/testsuite/gas/cfi/cfi.exp        |  1 +
+ 5 files changed, 42 insertions(+), 1 deletion(-)
+ create mode 100644 gas/testsuite/gas/cfi/cfi-common-9.d
+ create mode 100644 gas/testsuite/gas/cfi/cfi-common-9.s
+
+Index: git/gas/dw2gencfi.c
+===================================================================
+--- git.orig/gas/dw2gencfi.c
++++ git/gas/dw2gencfi.c
+@@ -1244,7 +1244,10 @@ dot_cfi_sections (int ignored ATTRIBUTE_
+       }
+ 
+   demand_empty_rest_of_line ();
+-  if (cfi_sections_set && cfi_sections != sections)
++  if (cfi_sections_set
++      && (sections & (CFI_EMIT_eh_frame | CFI_EMIT_eh_frame_compact))
++      && (cfi_sections & (CFI_EMIT_eh_frame | CFI_EMIT_eh_frame_compact))
++	 != (sections & (CFI_EMIT_eh_frame | CFI_EMIT_eh_frame_compact)))
+     as_bad (_("inconsistent uses of .cfi_sections"));
+   cfi_sections = sections;
+ }
+Index: git/gas/testsuite/gas/cfi/cfi-common-9.d
+===================================================================
+--- /dev/null
++++ git/gas/testsuite/gas/cfi/cfi-common-9.d
+@@ -0,0 +1,23 @@
++#objdump: -Wf
++#name: CFI common 9
++#...
++Contents of the .eh_frame section:
++
++00000000 0+0010 0+0000 CIE
++  Version:               1
++  Augmentation:          "zR"
++  Code alignment factor: .*
++  Data alignment factor: .*
++  Return address column: .*
++  Augmentation data:     [01]b
++
++  DW_CFA_nop
++  DW_CFA_nop
++  DW_CFA_nop
++
++00000014 0+00(10|18|1c|20) 0+0018 FDE cie=0+0000 pc=.*
++
++  DW_CFA_nop
++  DW_CFA_nop
++  DW_CFA_nop
++#...
+Index: git/gas/testsuite/gas/cfi/cfi-common-9.s
+===================================================================
+--- /dev/null
++++ git/gas/testsuite/gas/cfi/cfi-common-9.s
+@@ -0,0 +1,4 @@
++	.cfi_sections .eh_frame
++	.cfi_startproc simple
++	.cfi_sections .debug_frame
++	.cfi_endproc
+Index: git/gas/testsuite/gas/cfi/cfi.exp
+===================================================================
+--- git.orig/gas/testsuite/gas/cfi/cfi.exp
++++ git/gas/testsuite/gas/cfi/cfi.exp
+@@ -135,4 +135,5 @@ if { ![istarget "hppa64*-*"] } then {
+     run_dump_test "cfi-common-6"
+   }
+   run_dump_test "cfi-common-7"
++  run_dump_test "cfi-common-9"
+ }
-- 
2.10.0


