Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FD9C61DB6
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:00:56 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16157.1787576448508675333
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hj88WEcY;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so31729315e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576447; x=1788181247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/lGyfyePXPpNcntmQnLriUuLFv974ZDyD47uzIlKg8A=;
        b=hj88WEcYaxgpYBx2n9YRv6dzcluyV0+vpB6yU1JWeL2IRMHIBV5bTlVDBaktqfznzJ
         E45guXOAEZ7ZKnay46TdzEH7rimyR9CEQXUrAMVOw1ihm+GcmDD79L2H3+nAJk3dFIsB
         XdCYH1kQLRwnGveKiLEk0YAXI5B6j08LwW7tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576447; x=1788181247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/lGyfyePXPpNcntmQnLriUuLFv974ZDyD47uzIlKg8A=;
        b=eXGCVv+zFvYIEIccWXXJ49fPVfjoHBgsUeU/iZ1Pl23c4lUxRo5xHy8CcAcqNaZn7v
         iGQafFvGetLqeYAvs3AaXqSqLDKPdTHjOR33xv0AwHGe1EwWtJ2MKvyOcJteJ5/2Z4J3
         0zIuMj0JjBiD+Ato2WdWL5HbjYWHMqPzQSuIK/OncjJllQ7n0M5Yr+U7QTX1THSfBiKd
         iads1pQulC4rt258dfY9R/hlu2JnDAE1pReDDd1+pzIcM+6NORDJ89ceP9LN5EMKIlED
         kWtFLfPhdw3kn7HCESPagHdIHuTXC4oT/M1zFuvNFPydpQ1Ri7O+hAyVxRCG0k+t4jQc
         ONmw==
X-Gm-Message-State: AFuF++kzZGV1RSdNoWNvgUMUWz+Og4ZMBUFJqWMScrLgoDVBpMuNS3oh
	I5hdq1RlLzXBWayrC0sgefth8Vr101s1FAqaHKI2W0+xgB45Wn8SFjid8Tkr940j5jzHjgGpEod
	0Iy7/nHk=
X-Gm-Gg: AR+sD12jxgq+tUB+o47Gol8mUUR5Wq5WOOGEIAaXHKpBylWoJIMnJYcpN8PLW8pRWxz
	ArncJWUdCsxlPNVbXeDt4QlJOVW5yLuztlBz3s+NoAD05c+d8+nQVdahnE8CcXMOgUomQjLEOfq
	khI1cy3R1KbHIT5INKLta/jRbXLDXCKNzWI0YvARmXAUwl1Fq3sMSBmc8imuz2JrskKOkWRVWvF
	pry4zLhE9It53C0riOo0ceRdsTf76syLQuYVubSTKzfdKxjZW0Ga0Yms8fGpL1YTwS4UU4rdzCw
	0W7ZZ0e1V4VP0s27L6ArXXQMgcQkvZb6z4Ewwli7n6PlIWkv5Re9ln/ug5n71ZThvecK10rdChm
	dVUn6NAZ9VN/lE6KiQPzRlerCBQx2OFIP8ldHshRZQnjwOh2m0+tGncebvT4mtkhmRetSQ25AYX
	Se2cx4Oc3qkH0wFCJ7We/ngaqxnfBY4C3Ghd9LT/8az2aE4bNUpeSIxcOWCHkx/L7wpqAr7mOfy
	bpmPainFincszULcbGXNmdhem4PK2ZAwDasnfjhUEp2I7T9PeAyec31dNPSa6ydii7tm04=
X-Received: by 2002:a05:600c:4f81:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-499b8466bf5mr280477195e9.14.1787576446599;
        Mon, 24 Aug 2026 06:00:46 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/19] binutils: fix CVE-2026-18220
Date: Mon, 24 Aug 2026 14:59:52 +0200
Message-ID: <189e4711da216e970e4fb73cc7ba825e015371ba.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244104

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-18220
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=114e3aae2b7e34057c8909301eaf78c15687e8e5

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=114e3aae2b7e34057c8909301eaf78c15687e8e5]

Test results:
  binutils-testsuite 2.46.1 (x86_64-oe-linux) - All tests PASSED

  binutils: 327 passed, 5 untested, 9 unsupported
  gas:      2091 passed, 4 unsupported
  ld:       1899 passed, 7 expected failures, 20 untested, 109 unsupported

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../binutils/binutils-2.46.inc                |  1 +
 .../binutils/binutils/CVE-2026-18220.patch    | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index 177ae04ee3f..f8d926b22e2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -41,4 +41,5 @@ SRC_URI = "\
      file://CVE-2026-4647.patch \
      file://CVE-2026-6846.patch \
      file://CVE-2026-15003.patch \
+     file://CVE-2026-18220.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch
new file mode 100644
index 00000000000..e915fb223a1
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch
@@ -0,0 +1,65 @@
+From 114e3aae2b7e34057c8909301eaf78c15687e8e5 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 28 Jun 2026 09:11:46 +0930
+Subject: [PATCH] asan: buffer overflow in elf32_dlx_relocate26
+
+	* elf32-dlx.c (elf32_dlx_relocate26): Sanity check reloc offset.
+	(elf32_dlx_relocate16): Likewise.
+	(_bfd_dlx_elf_hi16_reloc): Likewise, and remove ineffective
+	existing check.
+
+CVE: CVE-2026-18220
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=114e3aae2b7e34057c8909301eaf78c15687e8e5]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf32-dlx.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/bfd/elf32-dlx.c b/bfd/elf32-dlx.c
+index 2dfeb4d7390..0f9a49695d7 100644
+--- a/bfd/elf32-dlx.c
++++ b/bfd/elf32-dlx.c
+@@ -77,6 +77,10 @@ _bfd_dlx_elf_hi16_reloc (bfd *abfd,
+       return bfd_reloc_ok;
+     }
+ 
++  if (!bfd_reloc_offset_in_range (reloc_entry->howto, abfd,
++				  input_section, reloc_entry->address))
++    return bfd_reloc_outofrange;
++
+   ret = bfd_reloc_ok;
+ 
+   if (bfd_is_und_section (symbol->section)
+@@ -89,9 +93,6 @@ _bfd_dlx_elf_hi16_reloc (bfd *abfd,
+   relocation += reloc_entry->addend;
+   relocation += bfd_get_16 (abfd, (bfd_byte *)data + reloc_entry->address);
+ 
+-  if (reloc_entry->address > bfd_get_section_limit (abfd, input_section))
+-    return bfd_reloc_outofrange;
+-
+   bfd_put_16 (abfd, (short)((relocation >> 16) & 0xFFFF),
+ 	      (bfd_byte *)data + reloc_entry->address);
+ 
+@@ -143,6 +144,10 @@ elf32_dlx_relocate16 (bfd *abfd,
+       return bfd_reloc_undefined;
+     }
+ 
++  if (!bfd_reloc_offset_in_range (reloc_entry->howto, abfd,
++				  input_section, reloc_entry->address))
++    return bfd_reloc_outofrange;
++
+   insn  = bfd_get_32 (abfd, (bfd_byte *)data + reloc_entry->address);
+   allignment = 1 << (input_section->output_section->alignment_power - 1);
+   vallo = insn & 0x0000FFFF;
+@@ -206,6 +211,10 @@ elf32_dlx_relocate26 (bfd *abfd,
+       return bfd_reloc_undefined;
+     }
+ 
++  if (!bfd_reloc_offset_in_range (reloc_entry->howto, abfd,
++				  input_section, reloc_entry->address))
++    return bfd_reloc_outofrange;
++
+   insn  = bfd_get_32 (abfd, (bfd_byte *)data + reloc_entry->address);
+   allignment = 1 << (input_section->output_section->alignment_power - 1);
+   vallo = insn & 0x03FFFFFF;

