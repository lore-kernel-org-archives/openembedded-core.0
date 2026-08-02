Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3194C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21330.1785666543328398713
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K9tDUSSc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so10840095e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666541; x=1786271341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mnMZ+r7I15cuzdS0AONnpIr99tLQpFNqv5IBe+yzhwk=;
        b=K9tDUSScLzit1FHvKFF5zNZvvepFxInI8sLFh5UEOYcprBwHj77pCO4lbg0h2f0LaO
         iFSTwVlIoFaF798hKkcPmPOzflvDvMYdcs3qy4eHXgOsGPqRg9WrqDcYl8jribaiTfqL
         FF059IPTxSuih/BAWquQErgEmwa0FhWaSmAbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666541; x=1786271341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mnMZ+r7I15cuzdS0AONnpIr99tLQpFNqv5IBe+yzhwk=;
        b=VwDo7e/050xkq0D2mcBlmBSWuJC0seMcWlLlOpFES1wInSKWY1pye/IBKBMGEweoO7
         OBGCgnJTXMagRi6q5qtCdINcPbxWo0W3APxbRjyp2FYGBOuFQdIpONVZNmzQZSuf+1ej
         T7J9rb2duuOt/HMxc+rXCjIs/HILbmyVlyU1C0IqroqQXuTXQpxVgy2V9mLllCdGZcPC
         1hBHIUZQ+biJc+KChNWix7EdBS7UbfjEbBKL/6gBM1L7Ixp1N2f0XUbuFHgcQkomHxja
         C3w8uNRh8gntqAwY/mjxxLzw9ZitExMAttUaaTTJtvHpaFwzEZFxUnJ9ew2VTaRUbKZ1
         tyAA==
X-Gm-Message-State: AOJu0Yw8nqGl2tG5UNIRFOiYmeyzFLJjnmCwN4x23W9MvWLe0hs7NW1k
	w+Jt16DvOg8vYQsVTyAh6WANTKwnreX3QvKKDxbGUDrDQPrRJayq0gE4f7l1CpEs08hsr6qgZwC
	XqZ8e4Eg=
X-Gm-Gg: AR+sD10xMoZPQndNRqFV/qN4QUAIgO7W2eUC2RVHwFd6X/K60KSdn0xQVOSAB0FH/a3
	fNm6MvA3R9zv0w/a9K7VU+eqJ1HrSwXOVYOP4gqgYQr5FwVWL8g6aonFpmhQdUP4ygTCJbIgbuN
	KPg+/+nxOO4LI37F5LRKo6HMjmK2feCfEqghvcsdp/NmaHz++pI7BLkm6jNISae82+JDt9pRadg
	S6Iybfu79Q9ixXrei7jK8fhU8KsdsQq1NoXQthsm8hhZf3HPdHFEosBMRij0g1m1kn4TCeAaJq8
	mw6YnvEaoMreSO8DtkQsrGOb0lqnGK6Hm0enGdlCJ42EUCpaO7J+Q3jxK7iuSCxlw7bKPNfCz38
	kx5ekjNzbBVQQ5ZSzIkbCT4XQXq4rotPVyoFBSOxunmxmU1dnb+2as2j7lOZAL+abtxY4j+CjgV
	w+BJCIe70O37OGcH6HS0Y1OeWXBe5f6D5L4dAAZepfBouBH8Z5LP88+YmWGIqTWnFx9cIXuay3c
	Dvh/yTrunScwlAM1w==
X-Received: by 2002:a05:600c:840f:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-4980c6071c5mr104407645e9.0.1785666541419;
        Sun, 02 Aug 2026 03:29:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/25] kernel-arch: Move kernel and uboot arch functions to lib/oe/kernel.py
Date: Sun,  2 Aug 2026 11:28:34 +0100
Message-ID: <20260802102854.3952760-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242530

Move the ARCH and UBOOT_ARCH python functions to the python library code.

The ability to alter valid_archs is removed as:
 - the values should be long since established by now
 - non-linux targets have an escape in the code
 - the lower case variable name is not normal convention and should be
   replaced if we were to retain it

By removing it we'll find out if anyone does actually need that (and we
can probably fix the entries in the file if there is anything missing).

The code itself is full of redundant codepaths but that is for another
patch if we try and improve it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-arch.bbclass | 54 +------------------------
 meta/lib/oe/kernel.py                   | 39 ++++++++++++++++++
 2 files changed, 41 insertions(+), 52 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 5f8dbacc0c0..b00341c2180 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -4,61 +4,11 @@
 # SPDX-License-Identifier: MIT
 #
 
-#
 # set the ARCH environment variable for kernel compilation (including
 # modules). return value must match one of the architecture directories
 # in the kernel source "arch" directory
-#
-
-valid_archs = "alpha cris ia64 \
-               i386 x86 \
-               m68knommu m68k ppc powerpc powerpc64 ppc64  \
-               sparc sparc64 \
-               arm aarch64 \
-               m32r mips \
-               sh sh64 um h8300   \
-               parisc s390  v850 \
-               avr32 blackfin \
-               loongarch64 \
-               microblaze \
-               nios2 arc riscv xtensa"
-
-def map_kernel_arch(a, d):
-    import re
-
-    valid_archs = d.getVar('valid_archs').split()
-
-    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
-    elif re.match('arceb$', a):                 return 'arc'
-    elif re.match('armeb$', a):                 return 'arm'
-    elif re.match('aarch64$', a):               return 'arm64'
-    elif re.match('aarch64_be$', a):            return 'arm64'
-    elif re.match('aarch64_ilp32$', a):         return 'arm64'
-    elif re.match('aarch64_be_ilp32$', a):      return 'arm64'
-    elif re.match('loongarch(32|64|)$', a):     return 'loongarch'
-    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a):      return 'mips'
-    elif re.match('mcf', a):                    return 'm68k'
-    elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
-    elif re.match('p(pc|owerpc)(|64)', a):      return 'powerpc'
-    elif re.match('sh(3|4)$', a):               return 'sh'
-    elif re.match('bfin', a):                   return 'blackfin'
-    elif re.match('microblazee[bl]', a):        return 'microblaze'
-    elif a in valid_archs:                      return a
-    else:
-        if not d.getVar("TARGET_OS").startswith("linux"):
-            return a
-        bb.error("cannot map '%s' to a linux kernel architecture" % a)
-
-export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
-
-def map_uboot_arch(a, d):
-    import re
-
-    if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
-    elif re.match('i.86$', a): return 'x86'
-    return a
-
-export UBOOT_ARCH = "${@map_uboot_arch(d.getVar('ARCH'), d)}"
+export ARCH = "${@oe.kernel.map_kernel_arch(d)}"
+export UBOOT_ARCH = "${@oe.kernel.map_uboot_arch(d)}"
 
 # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
 # specific options necessary for building the kernel and modules.
diff --git a/meta/lib/oe/kernel.py b/meta/lib/oe/kernel.py
index 421debed9af..bab375c37ae 100644
--- a/meta/lib/oe/kernel.py
+++ b/meta/lib/oe/kernel.py
@@ -6,6 +6,45 @@
 
 import re
 
+# Return a value for the ARCH environment variable for kernel compilation (including
+# modules). return value must match one of the architecture directories
+# in the kernel source "arch" directory
+def map_kernel_arch(d):
+    a = d.getVar('TARGET_ARCH')
+
+    valid_archs = ["alpha", "cris", "ia64", "i386", "x86", "m68knommu", "m68k", "ppc", "powerpc",
+                   "powerpc64", "ppc64", "sparc", "sparc64", "arm", "aarch64", "m32r", "mips",
+                   "sh", "sh64", "um", "h8300", "parisc", "s390", "v850", "avr32", "blackfin",
+                   "loongarch64", "microblaze", "nios2", "arc", "riscv", "xtensa"]
+
+    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
+    elif re.match('arceb$', a):                 return 'arc'
+    elif re.match('armeb$', a):                 return 'arm'
+    elif re.match('aarch64$', a):               return 'arm64'
+    elif re.match('aarch64_be$', a):            return 'arm64'
+    elif re.match('aarch64_ilp32$', a):         return 'arm64'
+    elif re.match('aarch64_be_ilp32$', a):      return 'arm64'
+    elif re.match('loongarch(32|64|)$', a):     return 'loongarch'
+    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a):      return 'mips'
+    elif re.match('mcf', a):                    return 'm68k'
+    elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
+    elif re.match('p(pc|owerpc)(|64)', a):      return 'powerpc'
+    elif re.match('sh(3|4)$', a):               return 'sh'
+    elif re.match('bfin', a):                   return 'blackfin'
+    elif re.match('microblazee[bl]', a):        return 'microblaze'
+    elif a in valid_archs:                      return a
+    else:
+        if not d.getVar("TARGET_OS").startswith("linux"):
+            return a
+        bb.error("cannot map '%s' to a linux kernel architecture" % a)
+
+def map_uboot_arch(d):
+    a = map_kernel_arch(d)
+
+    if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
+    elif re.match('i.86$', a): return 'x86'
+    return a
+
 # parse kernel ABI version out of <linux/version.h>
 def get_version_headers(p):
     fn = p + '/include/linux/utsrelease.h'

