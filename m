Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8716CCD1A4
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:33 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.3118.1760733567544738528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ztQIqbCL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7841da939deso2317373b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733567; x=1761338367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPnhGdIeed6Hid9C/l/2PgDD2UEUdsKRY+8zz6veVOA=;
        b=ztQIqbCLj/LWWWxjpqPnyGWhq5eNzbEOmj3ldXqTk1ENeheMOM2MWEgiVdtrloO7nR
         0tfsLCE4Y44DvxmJ5NRldRh6c+cgEEvt0lSGSpdDBz4shfjq1Ve71e7NPKmA28ov/lC1
         YHBC6d41clqMQAcse1tscSlqfSYRtXxkzW23tjIeHpj12MvouEvvgR6DaIgJ3M3NcOWp
         lSo1jcwS0Ak9aqhSwH+PEDtpuNFwD8SvP9XK4v5shPfpEtOHlV0+AaEPS+eiWsNFY5N3
         3bTwoa3Fx/Pw5Wv76i6caJnU2silzTUSf/KNJqPSbeQHQjyUs8NodGkVtF+XNnB+OdCG
         GItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733567; x=1761338367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPnhGdIeed6Hid9C/l/2PgDD2UEUdsKRY+8zz6veVOA=;
        b=BLxhaAmmH4vR+nChPuSEIkRZZPpdXIXaC6nl0PFV3YPUXodFT1HkEAL9fFT0TxWKZu
         dYxlNy8akXXHnfv8rQRzztiV7Gp76XcTmNSYaC3k09/JT4uI9dlQXJFWtbdLZRiWrgNh
         3UwLlZrfkUP8r6QxQBCDWOLLJ1zdamSjVYOfYxH2EFaN+QIMaahR30xMEa9UcpIblUSW
         kYkbMd7xN7ClyT+bM/+0okZf8yHl+bo9lesfhrbHb9NUSZ0sLbTDU7x3pWODKtMRxEOp
         hrD8jqKd6gsAhPDehgq05yA5a+oModapTx9M09YfXPWv9X8aPmKkepnItl255R4ytaDZ
         coqA==
X-Gm-Message-State: AOJu0YwSxTQQm9nQqujMsSuYJG6ahu54zkMVHdpLhIRerII/UPc1h3hU
	3d+acZ/RJZszr/qfUedf3fQqY/XSZ7VsAs+X0SeMrDKCSHIcHTOIELfm5j+V2ihcURxPt0JoS7P
	F4AHyHIw=
X-Gm-Gg: ASbGnct5HkgODlRn4+heMKRzf9khwiukfdRBhkzAlbp/9JoXpPwqPoWw/npwzze+Ms7
	ukjl3Sr/UMEyB+sqWK95kSsZ0XdjSkzVZzYQmkuhEgUX8cqdQJD8KOHbT7o8gsrk4u9RZXN3Qxb
	5VN0UGuDTjFf0u8jr0BZoYpFdJHDphC0iV+L44vb9SSLdRdHII59YKqqX9gA/pefB63I02zT1nj
	PA3E5zcUS2owKYJY0yTL5eIdC3C/70jvGNNdp2dJyhMfoQ+Z0IahGlb1/rLakjFo8mLQ3u+zYl9
	igP9qpdUvSYI5BCec9NLkphUD1i26UdOkyw7GiKmn84Q4PEG7u0l0edZuwUkZqEpYQAtxPTDi8V
	Lfc5cW0Gt+WAaMRBlg7OeBoaLt180ySiz3Vtttk9E1Y05A0pafiMY3YqS+1vU3+c5faW5WYZt+p
	gf
X-Google-Smtp-Source: AGHT+IGu9JHupYBaNITdc9TKKMXwbmoHW87WzwUno6TboTKb+SxH1uAItk5ETHoShAOuXeVJlKiQdw==
X-Received: by 2002:a05:6a00:9518:b0:782:ec0f:d273 with SMTP id d2e1a72fcca58-7a2208fe6bfmr6148612b3a.1.1760733566781;
        Fri, 17 Oct 2025 13:39:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/26] binutils: patch CVE-2025-11083
Date: Fri, 17 Oct 2025 13:38:47 -0700
Message-ID: <155a93a0e0ea52316567b0eaea37b8da4c80d7be.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225038

From: Peter Marko <peter.marko@siemens.com>

Pick patch per link in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0025-CVE-2025-11083.patch        | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0025-CVE-2025-11083.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index a879a1b501..3e180b6018 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -60,5 +60,6 @@ SRC_URI = "\
      file://0023-CVE-2025-7546.patch \
      file://0023-CVE-2025-7545.patch \
      file://0024-CVE-2025-11082.patch \
+     file://0025-CVE-2025-11083.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0025-CVE-2025-11083.patch b/meta/recipes-devtools/binutils/binutils/0025-CVE-2025-11083.patch
new file mode 100644
index 0000000000..b51bb5a19d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0025-CVE-2025-11083.patch
@@ -0,0 +1,77 @@
+From 9ca499644a21ceb3f946d1c179c38a83be084490 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Thu, 18 Sep 2025 16:59:25 -0700
+Subject: [PATCH] elf: Don't match corrupt section header in linker input
+
+Don't swap in nor match corrupt section header in linker input to avoid
+linker crash later.
+
+	PR ld/33457
+	* elfcode.h (elf_swap_shdr_in): Changed to return bool.  Return
+	false for corrupt section header in linker input.
+	(elf_object_p): Reject if elf_swap_shdr_in returns false.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2025-11083
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=9ca499644a21ceb3f946d1c179c38a83be084490]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elfcode.h | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elfcode.h b/bfd/elfcode.h
+index 9c65852e103..5224a1abee6 100644
+--- a/bfd/elfcode.h
++++ b/bfd/elfcode.h
+@@ -311,7 +311,7 @@ elf_swap_ehdr_out (bfd *abfd,
+ /* Translate an ELF section header table entry in external format into an
+    ELF section header table entry in internal format.  */
+ 
+-static void
++static bool
+ elf_swap_shdr_in (bfd *abfd,
+ 		  const Elf_External_Shdr *src,
+ 		  Elf_Internal_Shdr *dst)
+@@ -341,6 +341,9 @@ elf_swap_shdr_in (bfd *abfd,
+ 	{
+ 	  _bfd_error_handler (_("warning: %pB has a section "
+ 				"extending past end of file"), abfd);
++	  /* PR ld/33457: Don't match corrupt section header.  */
++	  if (abfd->is_linker_input)
++	    return false;
+ 	  abfd->read_only = 1;
+ 	}
+     }
+@@ -350,6 +353,7 @@ elf_swap_shdr_in (bfd *abfd,
+   dst->sh_entsize = H_GET_WORD (abfd, src->sh_entsize);
+   dst->bfd_section = NULL;
+   dst->contents = NULL;
++  return true;
+ }
+ 
+ /* Translate an ELF section header table entry in internal format into an
+@@ -642,9 +646,9 @@ elf_object_p (bfd *abfd)
+ 
+       /* Read the first section header at index 0, and convert to internal
+ 	 form.  */
+-      if (bfd_read (&x_shdr, sizeof x_shdr, abfd) != sizeof (x_shdr))
++      if (bfd_read (&x_shdr, sizeof x_shdr, abfd) != sizeof (x_shdr)
++	  || !elf_swap_shdr_in (abfd, &x_shdr, &i_shdr))
+ 	goto got_no_match;
+-      elf_swap_shdr_in (abfd, &x_shdr, &i_shdr);
+ 
+       /* If the section count is zero, the actual count is in the first
+ 	 section header.  */
+@@ -730,9 +734,9 @@ elf_object_p (bfd *abfd)
+ 	 to internal form.  */
+       for (shindex = 1; shindex < i_ehdrp->e_shnum; shindex++)
+ 	{
+-	  if (bfd_read (&x_shdr, sizeof x_shdr, abfd) != sizeof (x_shdr))
++	  if (bfd_read (&x_shdr, sizeof x_shdr, abfd) != sizeof (x_shdr)
++	      || !elf_swap_shdr_in (abfd, &x_shdr, i_shdrp + shindex))
+ 	    goto got_no_match;
+-	  elf_swap_shdr_in (abfd, &x_shdr, i_shdrp + shindex);
+ 
+ 	  /* Sanity check sh_link and sh_info.  */
+ 	  if (i_shdrp[shindex].sh_link >= num_sec)
-- 
2.43.0


