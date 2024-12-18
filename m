Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7619AE7718A
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 22:02:38 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.116956.1734559355362783121
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 14:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nUF4V+Tg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-725ee27e905so200552b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 14:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734559354; x=1735164154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BabJGshN89sx2HzxGcfH4DAznMTdlCgQDOtFwvTdriA=;
        b=nUF4V+TgGNb2Z1YAQBhXYOkrcWn/ObxNs6uIQLZ4yuoPADbuqfEDLJCnzIppw7nx1O
         p6BlnI4ObAjLeCAEsv0OUOyOcSz4H8D2G1USgI1RkqMan3OWWNe4pJ4yGL/rxgELvjo8
         LhsIHV+WhPoSygL9CcwAovN15bRXWR/JdjzcfbxZbHV6/Mzz4iu2v57WhtzrW3rNqo6t
         1DicbL2wesNZu3BNteFm2GZsQXndgoZaV6XlWLRhUERTLjBCTuOYxzWdhwpVfl574F5t
         12//G3gpca6aN0OXaI6KbptorI8b6ZoQlfjECu3d+fRA3GmzxEkQYtNp4WNcxkeZn5tS
         Nbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559354; x=1735164154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BabJGshN89sx2HzxGcfH4DAznMTdlCgQDOtFwvTdriA=;
        b=RCywNfqDUuvFXsxSqRD5q1MD8yrKQw0WDLLonxNh9Hwcys0Z1r0p4gQ46Qaxhgl/lS
         2ehenEacRHN2SyBDySNotCR4fvbL2+fh3QUecwnEBuNR2sYD0Xlx+8HiHr7JLIdhYWHO
         FvnNiOSfaf+/7a3/FpejCELGd2+Vs/JSUB+56K7KSW0hr8cwVNX9otExr6EPkGVVTlL3
         ClA/xkA3ZabJs3xRBh1Q8WxIlQZoIIjJ7L9ncl4mvln0wvwFDGTNsUCfSXmGK0OwZpeI
         Gm94YnLdimbN/SpSsEC2ct702Hor1S1F5DtNhk8uXWazi6ZfuOFyn1UplooHPzeA/SB1
         /PkA==
X-Gm-Message-State: AOJu0YysH8rdWQSdYBIHh8vTtx/L52Os3AYCdd4n8ibcq2z/utL/3glK
	zpdt4XDpdYHSAXOV8KYN5/V4LYJFNwsF+RHqRMmqM52xA4imuoakfGvx2TG1URFQJEFzlpK1yP7
	H
X-Gm-Gg: ASbGncuX9lFzav9wYp29o0jXKXO0QIz6QOvIo5MTw5MtdTgXLfB8lp3rSH7uiMbrlJp
	2JHFbLtrr7gv6S/m2Fja12Q27Mk+A2MHtwWIA1aMWzYk38mu3JsPZs0U4WJv9hkWe5DkXJtfoae
	k1lqakIUdlNBxyRE31jlkySNGwspFHloYYQQ494i0naXTMADPBricoCMHwHUU/LbzprK+dwxA9n
	OUajPtcUUiLERsMHbLEhlxARFh2BwLXb977OpOd6wb3lg==
X-Google-Smtp-Source: AGHT+IEl/hySfVi9QylyfDW4HMmYY3OGiLXeUd2AJ+1H0xGLXH8wWLf1v30cdUw4q2Io/l8R2AadaQ==
X-Received: by 2002:a05:6a00:ad2:b0:727:4e5e:881c with SMTP id d2e1a72fcca58-72a8d23f76cmr5695996b3a.15.1734559354505;
        Wed, 18 Dec 2024 14:02:34 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5aa4b92sm7965116a12.13.2024.12.18.14.02.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 14:02:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/10] binutils: Fix CVE-2024-53589
Date: Wed, 18 Dec 2024 14:02:05 -0800
Message-Id: <15635eb807ea1cbf0fd04e0cbe9cf169df107a05.1734553652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734553652.git.steve@sakoman.com>
References: <cover.1734553652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 22:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208881

From: Yash Shinde <Yash.Shinde@windriver.com>

A buffer overflow vulnerability exists in GNU Binutils’ objdump utility
when processing tekhex format files. The vulnerability occurs in the
Binary File Descriptor (BFD) library’s tekhex parser during format identification.
Specifically, the issue manifests when attempting to read 8 bytes at an address
that precedes the global variable ‘_bfd_std_section’, resulting in an out-of-bounds read.

Backport a patch from upstream to fix CVE-2024-53589.
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=e0323071916878e0634a6e24d8250e4faff67e88]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0016-CVE-2024-53589.patch        | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2024-53589.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index bff97b50c3..41ed39632d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -36,5 +36,6 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-gprofng-change-use-of-bignum-to-bigint.patch \
+     file://0016-CVE-2024-53589.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2024-53589.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2024-53589.patch
new file mode 100644
index 0000000000..380112a3ba
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2024-53589.patch
@@ -0,0 +1,92 @@
+Author: Alan Modra <amodra@gmail.com>
+Date:   Mon Nov 11 10:24:09 2024 +1030
+
+    Re: tekhex object file output fixes
+
+    Commit 8b5a212495 supported *ABS* symbols by allowing "section" to be
+    bfd_abs_section, but bfd_abs_section needs to be treated specially.
+    In particular, bfd_get_next_section_by_name (.., bfd_abs_section_ptr)
+    is invalid.
+
+            PR 32347
+            * tekhex.c (first_phase): Guard against modification of
+            _bfd_std_section[] entries.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=e0323071916878e0634a6e24d8250e4faff67e88]
+CVE: CVE-2024-53589
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/tekhex.c b/bfd/tekhex.c
+index aea2ebb23df..b305c1f96f1 100644
+--- a/bfd/tekhex.c
++++ b/bfd/tekhex.c
+@@ -361,6 +361,7 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+ {
+   asection *section, *alt_section;
+   unsigned int len;
++  bfd_vma addr;
+   bfd_vma val;
+   char sym[17];			/* A symbol can only be 16chars long.  */
+
+@@ -368,20 +369,16 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+     {
+     case '6':
+       /* Data record - read it and store it.  */
+-      {
+-	bfd_vma addr;
+-
+-	if (!getvalue (&src, &addr, src_end))
+-	  return false;
+-
+-	while (*src && src < src_end - 1)
+-	  {
+-	    insert_byte (abfd, HEX (src), addr);
+-	    src += 2;
+-	    addr++;
+-	  }
+-	return true;
+-      }
++      if (!getvalue (&src, &addr, src_end))
++       return false;
++
++      while (*src && src < src_end - 1)
++       {
++         insert_byte (abfd, HEX (src), addr);
++         src += 2;
++         addr++;
++       }
++      return true;
+
+     case '3':
+       /* Symbol record, read the segment.  */
+@@ -406,13 +403,16 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+	    {
+	    case '1':		/* Section range.  */
+	      src++;
+-	      if (!getvalue (&src, &section->vma, src_end))
++             if (!getvalue (&src, &addr, src_end))
+		return false;
+	      if (!getvalue (&src, &val, src_end))
+		return false;
+-	      if (val < section->vma)
+-		val = section->vma;
+-	      section->size = val - section->vma;
++             if (bfd_is_const_section (section))
++               break;
++             section->vma = addr;
++             if (val < addr)
++               val = addr;
++             section->size = val - addr;
+	      /* PR 17512: file: objdump-s-endless-loop.tekhex.
+		 Check for overlarge section sizes.  */
+	      if (section->size & 0x80000000)
+@@ -455,6 +455,8 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+		  new_symbol->symbol.flags = BSF_LOCAL;
+		if (stype == '2' || stype == '6')
+		  new_symbol->symbol.section = bfd_abs_section_ptr;
++               else if (bfd_is_const_section (section))
++                 ;
+		else if (stype == '3' || stype == '7')
+		  {
+		    if ((section->flags & SEC_DATA) == 0)
-- 
2.34.1


