Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A17CCFA12
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 14:48:13 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19540.1762267687371722921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ohG2Hv9R;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso2936218a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 06:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762267687; x=1762872487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awJnc3/WY55g22miGPj1opYVHLrtlVYZ1r9lwo6/4bk=;
        b=ohG2Hv9RMC2kaEpaVuthhthWx1WuiYO0NS6+3DXZIYeenNTyDrgN4BHFLegT7uTxZM
         EqAcgV0cgxZdUbXdgFbLi8+UVbypNZb8PFX5j1hTBMRlwXlxd+RZ/WfomJt4k4t6tmdw
         kyUNyHzAg2NOADaoCyz73ZRN80SdLmDPLVmjgJMcBsb5kq74oQhLZBZwRtT19YT8kyZi
         LMXAjbRZB/eM3fo1Oep90UkEONpMyXMfoGw5rJZVoJnVpGjqumihJvNmlP42OcmhKVbI
         Lr/2OkZFMYFml6VMEy721JL4Fbh5qxUGgMdn1VpkLBNHVc/rlSeutaYlacnpgdyMO4O8
         4AMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762267687; x=1762872487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awJnc3/WY55g22miGPj1opYVHLrtlVYZ1r9lwo6/4bk=;
        b=YUy3GQ0quVZpj0toYa/LKGoWyxDZHjZ37p4Q+IXIWUK+mdkCYJMgyTWqmSsimJKRIH
         rQdTAAmiR9RaanynyOOwxluj90Xjy5UblBfvhvNS5hLQGWeobGRagz9s4Mql49NTOGlE
         nkl7+BkJu3rjpvr1tn+ZXGW29ieFziHm5nLrf5GDcqJsH5K7XgThqLgy4ac5/zk4xVc5
         n45thKhtrTsMz4q1FqpWUiVzQFDMKhawBxcgfaME6TIGr8Ut1ooPLFqYMbyTA4MKSWdm
         tKE+dEu6UNvIyC8CA2D9FxbshDD9GlfkdszXX91Gb3W/Op0AFnWi5mYIDq5ow76NVpw6
         avTg==
X-Gm-Message-State: AOJu0YwmVEYB2XnU2OUChLxCcYXBqPvUd/4/wosDxhfxsoPbF2zSLVi4
	EfCBCcmO1RSbbmHKELN9hmsBEPiKJeryOqypYzZ8qdZM+zKC0AZe3UVNmy3RazAK2R2BxoRO654
	Q0WqlxQE=
X-Gm-Gg: ASbGncvZNojkQ6ofZOH9oT5QaIkjyc+5AYjyleClcnOVpH6nZMrILTkWkR+8OP3xZFK
	meN3HhIw5I2oDOgR4mX80ylvfnIZcOfK4xB+Ccz566uLHukQyEPeMvgU5nnLalXoTC532JmMJiQ
	x5ty4YSw/U8RFxxl0O353m0ZELhfAA1a+j3ekCIUdeHxiEiYRPPC3Z06AAZS3MrDnnq1Az9RHbD
	p+8QuyMgzQidq3sXSwiemGcrtHvCqkGm9IosllobV9WZz4OZOgYR59M6JeFAR4JSxBMB92xCc26
	yCfAYJnUArOZqgy9dVd94azo0p4nUqDq5f6MDC7FzdplluSUFqPchI8rc1PBDxEVuGTxii25tRc
	/sEGkn6oBTKPDQoOUG806h+rnx/SaqX3TXUi5aU1eIkdnBi/vLktvMfWD7ba04jjqa0k=
X-Google-Smtp-Source: AGHT+IE35VcOUchfYRtVdrQzZTjDIkji3A3Bsk/ZeXV4etelt0NkuznWSkUnb/HsoIXGCp5ooawD2w==
X-Received: by 2002:a17:90b:1801:b0:330:6d5e:f17b with SMTP id 98e67ed59e1d1-34083074dddmr19975828a91.21.1762267686576;
        Tue, 04 Nov 2025 06:48:06 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1f4f:a6d3:d9bf:780d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417d40da83sm1341481a91.14.2025.11.04.06.48.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:48:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/7] binutils: patch CVE-2025-11414
Date: Tue,  4 Nov 2025 06:47:53 -0800
Message-ID: <ddb6453a751efb2c07b0866a1aace9d4adb55089.1762267481.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762267481.git.steve@sakoman.com>
References: <cover.1762267481.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 14:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225728

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD CVE report.

(From OE-Core rev: cd7ce80fa1a99916aa2f93c4d9591c5496c3ef71)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-11414.patch    | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index dcd3325ecc..21f0f7e3a7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -63,5 +63,6 @@ SRC_URI = "\
      file://0025-CVE-2025-11083.patch \
      file://0026-CVE-2025-11081.patch \
      file://0027-CVE-2025-8225.patch \
+     file://CVE-2025-11414.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch
new file mode 100644
index 0000000000..c6e45c3091
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch
@@ -0,0 +1,84 @@
+From aeaaa9af6359c8e394ce9cf24911fec4f4d23703 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 23 Sep 2025 08:52:26 +0800
+Subject: [PATCH] elf: Return error on unsorted symbol table if not allowed
+
+Normally ELF symbol table should be sorted, i.e., local symbols precede
+global symbols.  Irix 6 is an exception and its elf_bad_symtab is set
+to true.  Issue an error if elf_bad_symtab is false and symbol table is
+unsorted.
+
+	PR ld/33450
+	* elflink.c (set_symbol_value): Change return type to bool and
+	return false on error.  Issue an error on unsorted symbol table
+	if not allowed.
+	(elf_link_input_bfd): Return false if set_symbol_value reurns
+	false.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2025-11414
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=aeaaa9af6359c8e394ce9cf24911fec4f4d23703]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elflink.c | 21 +++++++++++++++------
+ 1 file changed, 15 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 66982f82b94..54f0d6e957e 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -8914,7 +8914,7 @@ struct elf_outext_info
+    <binary-operator> := as in C
+    <unary-operator> := as in C, plus "0-" for unambiguous negation.  */
+ 
+-static void
++static bool
+ set_symbol_value (bfd *bfd_with_globals,
+ 		  Elf_Internal_Sym *isymbuf,
+ 		  size_t locsymcount,
+@@ -8935,9 +8935,15 @@ set_symbol_value (bfd *bfd_with_globals,
+ 	     "absolute" section and give it a value.  */
+ 	  sym->st_shndx = SHN_ABS;
+ 	  sym->st_value = val;
+-	  return;
++	  return true;
++	}
++      if (!elf_bad_symtab (bfd_with_globals))
++	{
++	  _bfd_error_handler (_("%pB: corrupt symbol table"),
++			      bfd_with_globals);
++	  bfd_set_error (bfd_error_bad_value);
++	  return false;
+ 	}
+-      BFD_ASSERT (elf_bad_symtab (bfd_with_globals));
+       extsymoff = 0;
+     }
+ 
+@@ -8947,11 +8953,12 @@ set_symbol_value (bfd *bfd_with_globals,
+   if (h == NULL)
+     {
+       /* FIXMEL What should we do ?  */
+-      return;
++      return false;
+     }
+   h->root.type = bfd_link_hash_defined;
+   h->root.u.def.value = val;
+   h->root.u.def.section = bfd_abs_section_ptr;
++  return true;
+ }
+ 
+ static bool
+@@ -11641,8 +11648,10 @@ elf_link_input_bfd (struct elf_final_link_info *flinfo, bfd *input_bfd)
+ 		    return false;
+ 
+ 		  /* Symbol evaluated OK.  Update to absolute value.  */
+-		  set_symbol_value (input_bfd, isymbuf, locsymcount,
+-				    r_symndx, val);
++		  if (!set_symbol_value (input_bfd, isymbuf, locsymcount, r_symndx,
++					 val))
++		    return false;
++
+ 		  continue;
+ 		}
+ 
-- 
2.43.0


