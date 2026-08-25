Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46316C61DC3
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:07:23 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18282.1787652438925131696
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 03:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZPvSohQQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso44591665e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 03:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787652437; x=1788257237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TAEuWjiSCgjMzI0WVyKJJmQ+FjRXIbjRBwYvwH0EKuQ=;
        b=ZPvSohQQrQF4xvkn3M60q2mBaL5JFdrZBsAoheAwDps3Py36jvXZc9sy+zkYpTybja
         y0pn+W647fefKULAQlB0XeKriyMvp4gW97KEga0DRs2n7Q6icQ0P/cK0YRLkukgnkca+
         WicOk2Knd84ASCGL6Iohrp763b3KdfwBYDGdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652437; x=1788257237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TAEuWjiSCgjMzI0WVyKJJmQ+FjRXIbjRBwYvwH0EKuQ=;
        b=i1OHhAjOo6EfpqohgdQrbLACSgMRzoniRl8xTVbe1+tFg2rehQPw4JTNaEgejNB4tO
         kcr0Na5UIPt9jRkmZC4OOdpPgv/8Noul5P6nnjw24j3J2OYRWLqNqR3jGU8zL2JxPeK5
         KrBuTH4WtXySHY9N+cj0/g7voFVtNweY/qTvbqD0N/dNlJpVPSauUArNI4erLBLqk0OB
         mh5+//qVxX6QhJaXzCyzA7gqZKeMu/mu+cQgG9cJcuVLGN4ftaH0lsNJe9xPDRwwl4kg
         qt8HZw0tHjm9FpZWKhz7kpq4vPS8WdI9rQtpcRSoF6Tx+o2yTvZapAya8xOru+Gsyc/B
         z37w==
X-Gm-Message-State: AFuF++m1HU75wkF6JKrI+bbB/j0S4KTwfm3H3F4bGUORIe0GJvAqBOln
	ZLUX4ZPmBOvy2mVQi2YK9TkPq08PrjL23967oh46SK/TD5DUXxFRYzR0dzsmZOL472Le272ezYl
	GGOi//GQ=
X-Gm-Gg: AR+sD13/V4NCYBvpV+wxfq5hVf0jlmhVhdFISGuzDjleeO9HeSexPd+szqNqrNcr2Mj
	DEYnZyGp1nefByXREgG/banTYlLGOik4Y7U2uO/YHvRTJnWvEVQgYmrzdYcd2VR5wDEH+KMhqQH
	x2iKdnrWneDX6OcuJgdgWs9KK6yH8x6esZt6vyyszqGYcOCVjQz0BVCXSox2UmhJBtqw6h4KFrI
	4uvPg6gHqKWuYr5zk8efe3uSDyqbV8QWXAmDQPDiCLmMKvqCwEMiP6nzW+vOe7W6dwlsWRrISG8
	vwQvOnqnbshgdaFAlVnt59FmvyJaZu5OxU6WIybqat+1j6czGW23aodw2KJ9JVWo3tw1js9nUPE
	kqByQXakAZTD98SswPjAJrkDiV4BczKTvuC3rWAMeWF8W1rKEYZON7WW9+gDDOTBaVuKDIYCxj0
	xV4K+SXCdREsr+3+r18pvhGukwMfHn8ihZvyF0tE5ovKn3iApo7bzIi/fGh3QAiPM59nWE+lk7Y
	bRghhoXv/Hk9R64UTbEwiJyaaiOzFh2+WqSy5QrHwjVhORboLHslTnm6VHJeaKBoQfMlF0=
X-Received: by 2002:a05:600c:46d1:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-499c19dcc4fmr296386615e9.15.1787652436933;
        Tue, 25 Aug 2026 03:07:16 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm10847901f8f.22.2026.08.25.03.07.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:07:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/11] binutils: fix CVE-2026-18220
Date: Tue, 25 Aug 2026 12:06:43 +0200
Message-ID: <c9f3a2e7641af10ef9c43359a805191356fe0d67.1787652331.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787652331.git.yoann.congal@smile.fr>
References: <cover.1787652331.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 10:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244219

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-18220
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=114e3aae2b7e34057c8909301eaf78c15687e8e5

Test results:
  binutils-cross-testsuite 2.42 (x86_64-oe-linux):

  Before:
  binutils: 302 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unresolved, 20 untested, 99 unsupported

  After:
  binutils: 304 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unresolved, 20 untested, 99 unsupported

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=114e3aae2b7e34057c8909301eaf78c15687e8e5]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2026-18220.patch    | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 447529ffa95..d395ae1b1e0 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -81,5 +81,6 @@ SRC_URI = "\
      file://CVE-2025-1147.patch \
      file://CVE-2025-8224.patch \
      file://CVE-2026-15003.patch \
+     file://CVE-2026-18220.patch \
 "
 S  = "${WORKDIR}/git"
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

