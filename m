Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B069DE6FE4C
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:26:16 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109409.1766525170776180982
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HZuOfVv0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0c09bb78cso38823185ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766525170; x=1767129970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYgOCC7RAmd0godwDxQavU0TEVc8cs16Kgro1EYLo1c=;
        b=HZuOfVv04S+BpjpkJ4aTQlolKAu8c76aloBK+lWLlkqnvVZ2z7wpVQ/2PV7UyNFNCo
         eY31KBobTyl+DX+NG2nzyThSdZL4hS8mgT0Wu154t1Q0UFYKY/+EGkKtP4sWXaHqpETe
         +b2D5kerADST8Fr6q3D4pACYB591CKUY7t7lYvVMY6R8KwHdyJZ+xeOzpPyrx52hkgiS
         66pR80a7AakZiSQzwyZHz41KSA67eGdu5Jmz6/XVgh92yhweftWI+cmvnfPcySvB/ll1
         m1CItpQfCbivXPvw6aCRjxOVnXYwEoIzUF34p+e27IR65MgKBkudxYFKOgV1SpR7kQ4B
         GCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766525170; x=1767129970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DYgOCC7RAmd0godwDxQavU0TEVc8cs16Kgro1EYLo1c=;
        b=o6JBrYdVJgWwkfNvtPvOPkhhDpj0tl1g6wI87WXKuO5UriIph44Pp3TdmNoZS80CXG
         QaEPsz6n/WfI7SKdNnhoalD3Lsh0jAi8tsEQlTgIzs1pHmHbP6UUn1uLGxjco1pvUgYa
         hr6qvHww9fKGlJTMiCJqAEoqtoCjueS1EUZKbdKEDkA7HYFaQm3VshE4COfP0SthsC36
         A4C2CdX0FU/+V5BBTzDsozXS/Mmc8WGjm8RqCWEwfPhPc5mTxz4DGqT7+dxkifmGM5uK
         ZV99rsRxFZsZ+LXSM8ln5J2k72DSgrSfpWIwhLspIPrZb9MkPYq5sk0RRomLvW6jSGei
         f0Fw==
X-Gm-Message-State: AOJu0YxJkk3rIC+3PCZAuJEi686wzLfTQd4MJEMGIFuI0kRRRndfTpco
	vBLAXQSckgWqiI30H8dxv99jUUgECzTuEh4L6yL2f/d4e4sQ5d+qJn/E5beC/yd9Kodd50HmJOO
	W6vC3
X-Gm-Gg: AY/fxX45/C31AOCRgrppqiFHqZAAqfqvJvK9XDDFmndxL2hpUZt9NN1Gd2Lq2DFOPMk
	tIUrnx/REdtbEJ4ZtFPI1Cn6/jXP1/ktOf2gyy99Jx3gyzAHR3exohDNcADv2ZjPukKywddJlzC
	8O1gUmITFyvETX0XeZnKKNS2PUnV5+6bvz9GmTr58aWPdr6pJpbFbn/rU8/NQ2nmbEk/VMq+H69
	ojAKgVD6sGX3jPBLenCqDG1X+8pDyMooxTGD4Es4dfSiihUDtCsk+ynPgWvk4K/N6v0gF3X0cBt
	HZ559tPApKHMDesXqFuRRlV469sXuKz5xlDVGP0heIFJBzd9kxweYoDnQOltzVOu1O8TcXurvFr
	SCWz9PlnAq5FnXqU8tOv+Xq73U+I8dOC7HyezRaVFiLeB+yhaI8jjP8ga40FSx4pXtX6zOqCebH
	SK6w==
X-Google-Smtp-Source: AGHT+IG5QF43W6bbQynwYpndrhlMCxC+pJGLP9VfT6BsaoNXFBqlEe7k0qq/yqIaXNivrKPx8xyxRQ==
X-Received: by 2002:a17:902:ce92:b0:295:99f0:6c65 with SMTP id d9443c01a7336-2a2cac808c8mr201609275ad.30.1766525169955;
        Tue, 23 Dec 2025 13:26:09 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm133756765ad.8.2025.12.23.13.26.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:26:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/10] binutils: Fix CVE-2025-11494
Date: Tue, 23 Dec 2025 13:25:52 -0800
Message-ID: <aa67c21a07dc180a0582be46e239dafd40017ba0.1766525021.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766525021.git.steve@sakoman.com>
References: <cover.1766525021.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228494

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
.eh_frame section is non-empty.

Backport a patch from upstream to fix CVE-2025-11494
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0048-CVE-2025-11494.patch        | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0048-CVE-2025-11494.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index d5ad3c0ecb..2fe4a17e0d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -86,5 +86,6 @@ SRC_URI = "\
      file://0047-CVE-2025-8225.patch \
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
+     file://0048-CVE-2025-11494.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0048-CVE-2025-11494.patch b/meta/recipes-devtools/binutils/binutils/0048-CVE-2025-11494.patch
new file mode 100644
index 0000000000..dc4b413658
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0048-CVE-2025-11494.patch
@@ -0,0 +1,43 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 30 Sep 2025 08:13:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]
+CVE: CVE-2025-11494
+
+Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
+_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
+.eh_frame section is non-empty.
+
+	PR ld/33499
+	* elfxx-x86.c (_bfd_x86_elf_late_size_sections): Keep
+	_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the
+	output .eh_frame section is non-empty.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index c054f7cd..ddc15945 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2447,6 +2447,8 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 
+   if (htab->elf.sgotplt)
+     {
++      asection *eh_frame;
++
+       /* Don't allocate .got.plt section if there are no GOT nor PLT
+ 	 entries and there is no reference to _GLOBAL_OFFSET_TABLE_.  */
+       if ((htab->elf.hgot == NULL
+@@ -2459,7 +2461,11 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 	  && (htab->elf.iplt == NULL
+ 	      || htab->elf.iplt->size == 0)
+ 	  && (htab->elf.igotplt == NULL
+-	      || htab->elf.igotplt->size == 0))
++             || htab->elf.igotplt->size == 0)
++         && (!htab->elf.dynamic_sections_created
++             || (eh_frame = bfd_get_section_by_name (output_bfd,
++                                                     ".eh_frame")) == NULL
++             || eh_frame->rawsize == 0))
+ 	{
+ 	  htab->elf.sgotplt->size = 0;
+ 	  /* Solaris requires to keep _GLOBAL_OFFSET_TABLE_ even if it
-- 
2.43.0


