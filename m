Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1540BE77197
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:46:17 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.18196.1735998371828643538
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S048vJsI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so14841505a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998371; x=1736603171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4exacje6IZjQDbF/WBpyxY/wYEzdubLFJxQpUobFvGg=;
        b=S048vJsIfKlkPOMexFdcDl751oaZaarVU8LzDTVtcNt1rmyV+SuPNq/ezGTmGQ639t
         ETKoRI45ryzGx7wwyPfOKMDnQNiix2K7qnpXPdDHN20yivuQhQgpk5oWZvjgpnfNQ60h
         fsH/39gZkFLFES53GZcrCHaF02ttI2yn8qg2wSCE+jkrLhxOOG4tuNOyEnQiSty4U6hq
         16AcCfk3T2/wGICVHbaEwdtTr6QUctANelorYp5DjmGYitL8xfK55pSFu+Rw620fss5i
         YzNFY+Gc3gZfhsroCAm5BocghTnlGvgtrcopf7YBtGy8h+3KXT6WSKZB+VhIm3oLJhYP
         6o/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998371; x=1736603171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4exacje6IZjQDbF/WBpyxY/wYEzdubLFJxQpUobFvGg=;
        b=bTrafL3u35G3bqbQ1UZFXfoW0L4pG1QJkUUylYnZEE7cSs5/g1/maMJdYqrklXzSaB
         3cv6PxPIFagVjYYlbbq1P17U9TrYbgf796gMGZBu3iDxxaLoX2ckWO9/7N2tceY1pyOc
         TlVN34PelatldMQsxSVD18ItbpKmVmGF0KNzB35DGsGPf1uEdXiWk3kFtcWu6NxKt1mj
         iBdRH7JMIXg/eNGexj3I/pqOIH4aTF7sMU5+Jch1M4vZJKmqPnIyy0wnhs7n+XN8oiI2
         4xeySDf53Mgy7ewoQJiEjHJfVMHPpePuX0ymorQ00RMe3TtCdbyMjkzVoEI+Ah6AU2Zv
         WeuQ==
X-Gm-Message-State: AOJu0YwCzFXe1Nk6d4OpEUko/Ngt1w6dOwRFeZYBSE1Og/l8vy9MxZsy
	eNOZgjVjY995DUgsn7Jy6OLn511QalM1wLDrZdnSS2IqRessd/gMQXWYRzwdGcooy9OHD20uBz1
	p
X-Gm-Gg: ASbGncs/iB33oufsUoh3Yh3NXflC6l15tnU2yY5tVE4l0JZSurdz3WcNLOV9u9tKhve
	P58RAU9w9qitKxIoKMbqgQq7QuiLAxfNNd9OL5TQ6mJ2e4PwDxKXdrQKZzSfjKOQByTjuQWprwF
	/o5S7JQLCdEuWRJK6dWs3xn/kTYQ1kpeJUQYSpAqCKuDcT2pmfCi+PcW4LQQFKhDXy89Fji5n4/
	9orjzGpS282N3fw+gCaBl/W57yamyF9FPLH+o7cbwjXWw==
X-Google-Smtp-Source: AGHT+IFZE8fB+43P/kK+Bn5uvKtwqfjcCq7C+XU5QOB6v1dYh0j4fds5pI9/L8WOg+26SFRcOmduxg==
X-Received: by 2002:a17:90b:3d45:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-2f452dfcd01mr75706759a91.1.1735998371029;
        Sat, 04 Jan 2025 05:46:11 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447882b09sm33498230a91.41.2025.01.04.05.46.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:46:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 01/10] binutils: Fix CVE-2024-53589
Date: Sat,  4 Jan 2025 05:45:53 -0800
Message-ID: <8c3bb13e6dc75bf16c5da4b452206b2b6de2dd9e.1735998221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735998221.git.steve@sakoman.com>
References: <cover.1735998221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209396

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
 .../binutils/binutils-2.43.1.inc              |  1 +
 .../binutils/0015-CVE-2024-53589.patch        | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.43.1.inc b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
index 1ce19fbdc6..94e7d7f7e6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.43.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://0015-CVE-2024-53589.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch
new file mode 100644
index 0000000000..380112a3ba
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch
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
2.43.0


