Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915A5CCD195
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:45:07 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.2505.1760481900812602546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=D1Pt8lhj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b609a32a9b6so3467251a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760481900; x=1761086700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=venjp1TrO88LKkuVPAC55M6sN+lToPRnfzZ22/Z/IoI=;
        b=D1Pt8lhjLSRGnanoe4BjU2Rgorbgufg6I4bhl0hnCN5IVIYu7KfWwb52TCL5XYJ8Zs
         kKOJ6+JVfhSWQnX6/2oCsj/88u5nHRECx3Gc3eLYfnVg48t8uGSXYLiQ82SXn5tKnoGk
         wSaxtDOU5gCe/HurTVD2YIin3uqm7ZIGF5n4P1LbURfCT8eAtCfhafwmOIdUYT35gy/Q
         9F4rrOcBnMLaP90dl8HNyKesgIVEASaHwLDdHV5txZlPISt9F8Ccc7ES6Et+dsk8sVk4
         hpBKObZ1LaDPE8OUTjOBcChvi2NfVUIEAtt/IxFU5QJWKmUg6ct1TuNBXyzq/mjAGIxg
         WwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481900; x=1761086700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=venjp1TrO88LKkuVPAC55M6sN+lToPRnfzZ22/Z/IoI=;
        b=SRkVlo07xzbG9GRrik8AjpyN3k7a5utYlCDE9KbVHcC2mhwIFiklUJZIRSNyeqTd6P
         GxuSzFX1fjcFxO/A0iMPBUUfRe2c4ccYD63IySoT8yFeDRhbRzrF63eKJL/i9fg8vwG1
         z377QZwE192F9fh25AQwma9l+Fj3SoC67n4Chlq8lBkfGbYSK5doay3e6EmzZ5THV3Yd
         LSZ9tn6Wq+Cj5D2WhYfPmlzs/CFOU342NSYk4JrXGwAo/x2ga3VH+KiiCw8dBu//wV15
         YAsWJ0caYugt/qo3Rv0dWGzxdcEyjIx3npkjgYxYQOR85nbNewBDkDjAIV9RKT4BciAu
         J9Lg==
X-Gm-Message-State: AOJu0YxRHgz1vEuzL9jtn8RTiqfKiiJKEE/4Yg7wtJWhIdZ8laQrGzf7
	Blk5sWlwcevt5urx+0hewA/ywGLop7tp2p01uCXIeEyxPqsMVAYVddDG8hqKADtr5rwtJBy4PYo
	mIj5i
X-Gm-Gg: ASbGncuewH3kbuZNJacyDno0HtX1DYpi0ZPOZkGTe+ZU9XaEUujPb9Z/KTA5OSfuwV6
	2ZsMoGDLH72g3Za0uN61W5C6rPm2OQ1wWwPIENQcOcAdMSZkr/JUMRSz38WfPxQpVG35W4NkjCT
	N88MK1kXlIFA11RRaKr9ZlhsYC03t8ENJm7vb0wVtmWXyruar7yGsKlA9ROjS2AUdPp8Xq0tYMA
	R2tdnOAXh4cekJ5GAN+X7koUVOlISaBWvGEgJhPeWtLCWkgJy5vkOb2M8xev516pxIw1zXtWoqW
	XwMfgXIpxlVhG4fQwem4i+g/ut5Cff0zwJP/JcVHtoW1eqG8cgC10FC61LfRjWEFhUeHvAo+YYW
	fh2UnOXU2jls3YVHx0+bnD+r6V/X7pEQ0
X-Google-Smtp-Source: AGHT+IHvjYanZ/RfaIdcKjrhxcj7a7m7gdoKKWkTSocQ6/DIOWtXXXZ/BnmLHGp62xYIkhbvVkikzg==
X-Received: by 2002:a17:903:4b2f:b0:24c:cc32:788b with SMTP id d9443c01a7336-29027216103mr354288685ad.3.1760481900059;
        Tue, 14 Oct 2025 15:45:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ebea:520a:7699:bba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20479sm174847365ad.47.2025.10.14.15.44.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:44:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/14] binutils: patch CVE-2025-11082
Date: Tue, 14 Oct 2025 15:44:39 -0700
Message-ID: <cdc458b5dd21614058aac56de68a272201283141.1760481775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760481775.git.steve@sakoman.com>
References: <cover.1760481775.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224856

From: Peter Marko <peter.marko@siemens.com>

Pick patch per link in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0044-CVE-2025-11082.patch        | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0044-CVE-2025-11082.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 527334ccec..0fd950e694 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -80,5 +80,6 @@ SRC_URI = "\
      file://0042-CVE-2025-5245.patch \
      file://0043-CVE-2025-7546.patch \
      file://0043-CVE-2025-7545.patch \
+     file://0044-CVE-2025-11082.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0044-CVE-2025-11082.patch b/meta/recipes-devtools/binutils/binutils/0044-CVE-2025-11082.patch
new file mode 100644
index 0000000000..83747d4e8b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0044-CVE-2025-11082.patch
@@ -0,0 +1,46 @@
+From ea1a0737c7692737a644af0486b71e4a392cbca8 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 22 Sep 2025 15:20:34 +0800
+Subject: [PATCH] elf: Don't read beyond .eh_frame section size
+
+	PR ld/33464
+	* elf-eh-frame.c (_bfd_elf_parse_eh_frame): Don't read beyond
+	.eh_frame section size.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2025-11082
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ea1a0737c7692737a644af0486b71e4a392cbca8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elf-eh-frame.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/elf-eh-frame.c b/bfd/elf-eh-frame.c
+index dc0d2e097f5..30bb313489c 100644
+--- a/bfd/elf-eh-frame.c
++++ b/bfd/elf-eh-frame.c
+@@ -733,6 +733,7 @@ _bfd_elf_parse_eh_frame (bfd *abfd, struct bfd_link_info *info,
+       if (hdr_id == 0)
+ 	{
+ 	  unsigned int initial_insn_length;
++	  char *null_byte;
+ 
+ 	  /* CIE  */
+ 	  this_inf->cie = 1;
+@@ -749,10 +750,13 @@ _bfd_elf_parse_eh_frame (bfd *abfd, struct bfd_link_info *info,
+ 	  REQUIRE (cie->version == 1
+ 		   || cie->version == 3
+ 		   || cie->version == 4);
+-	  REQUIRE (strlen ((char *) buf) < sizeof (cie->augmentation));
++	  null_byte = memchr ((char *) buf, 0, end - buf);
++	  REQUIRE (null_byte != NULL);
++	  REQUIRE ((size_t) (null_byte - (char *) buf)
++		   < sizeof (cie->augmentation));
+ 
+ 	  strcpy (cie->augmentation, (char *) buf);
+-	  buf = (bfd_byte *) strchr ((char *) buf, '\0') + 1;
++	  buf = (bfd_byte *) null_byte + 1;
+ 	  this_inf->u.cie.aug_str_len = buf - start - 1;
+ 	  ENSURE_NO_RELOCS (buf);
+ 	  if (buf[0] == 'e' && buf[1] == 'h')
-- 
2.43.0


