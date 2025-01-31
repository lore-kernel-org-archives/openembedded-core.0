Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4472C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 14:15:51 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.20049.1738332942830634005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 06:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H/pKcmu3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2164b1f05caso36199225ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 06:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738332942; x=1738937742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PB0aLuZTAig0yGpMIBSrxjLLyxu/a/ni7/QPJGwWvlQ=;
        b=H/pKcmu3F1NXb7Ks0Mc9BHpoapwhNiEqUxeNmF9tc7mPKW5Cx5nPXkTA19zPLVN4wE
         srM5lTbSn6IbHmbnYzt49l8+XTv4HSWaqBVucXg/IbBMFGWI12RG2i4CcO95a+bZ1wKT
         mu2mOvyfztG2CH8NoJUeyGgN3ZoEnkuhO40rsjGAG3hk6lCbg3vQQME1c996mnqT65iV
         2YBLjxgHfn0uNcVk9RllH6LNrAK5F9KyrYG1ANrew61i1acldGONoKt4/WJhOPWmcuPT
         xjktfdiquHWJsdvBpf6h/HJpop/wI+MV8oco70yn3KAWpwA0rVDHZgv6C68E7L8BFOKt
         P1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738332942; x=1738937742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PB0aLuZTAig0yGpMIBSrxjLLyxu/a/ni7/QPJGwWvlQ=;
        b=Oqfg10CmIlcrtPhQ14KeebijSp/qgdgTqRL9M8S33tQF1ONvsJlvBbemkXhrlTWXFr
         SJBK7WA7AmOvvYjOc+5OCjxwZnUM6IWZX3vXApBIC3gXJHYGHjF3kz9KTZOgChnf/E1u
         k0peQ4H5Idl56ew0B2Yjr/tfKM0eiDUGWXOzvOSjD1ysaiKX12ZfZNNLZzYGM8ND0eAb
         GdDgtW2KQs6DONkzTE2+/uZU+KTIgWlYIjRpnrTs7QIahYjQgZZk81UiljweiR8fdGVp
         M/h1W+gL2UOsDqxwiAHWqkz6K7kdE9HMq01LisNhBSrmJ8XVHo3PkMzlkQmo+myDaHuD
         U2AA==
X-Gm-Message-State: AOJu0YwvHF0F6CIW/gVRfGXODv1T3QdW1CgoZbhgQk6NAPpJ6q1yDJwE
	RGO3t9PngnrnE0zhXXGUoUCw35CJ7cDrfMcZw1w1OgZ7L3pjuZGWA4uVab+W/zff7BJY0vi3P33
	64ns=
X-Gm-Gg: ASbGncuwRw4dv1OTAglsygoq9BjCB/i6MTU9ow2We5At/OXoxR4LSjmRrqMJUd+/4kt
	48TRcbh8A0kpDaPNG50egLeFD1K47wg6y2dhnh0oSGO2mHSmcB/401U9R6vqRv9dN5/jaHc4Nob
	zGE6v2r7QhdPsuMRl/eTt69EUuM8ikSMDqmB2ELIIsqkAia4lkMYpnUi4ggiuMq4FeleSt3Fp5B
	jWINV60HZeL1C9mWY8/jIB2Kda8dfw0ciQ9z99j/j0p2ly7EFs03CgZTb0WpylxIvoumGe4N/S4
	sXya
X-Google-Smtp-Source: AGHT+IGP1J64S6+QDhB4XvCBX4x76xPkUxupnujOwXxnwyVOp2bvKPLHAFsDBmQwIKFW7DPzXY9A1A==
X-Received: by 2002:a05:6a20:1596:b0:1e1:b12e:edb8 with SMTP id adf61e73a8af0-1ed7a6b168cmr21244217637.30.1738332942013;
        Fri, 31 Jan 2025 06:15:42 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a958sm3412644b3a.172.2025.01.31.06.15.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 06:15:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/4] gdb: Fix CVE-2024-53589
Date: Fri, 31 Jan 2025 06:15:29 -0800
Message-ID: <4ddd1e5aea1c4b84a6c4e1db5ded4938c4a35393.1738332771.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738332771.git.steve@sakoman.com>
References: <cover.1738332771.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 14:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210485

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2024-53589

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 .../gdb/gdb/0014-CVE-2024-53589.patch         | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0014-CVE-2024-53589.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 6c9fe60cab..84cc65f79b 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -17,5 +17,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0011-CVE-2023-39128.patch \
 	   file://0012-CVE-2023-39129.patch \
 	   file://0013-CVE-2023-39130.patch \
+           file://0014-CVE-2024-53589.patch \
            "
 SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
diff --git a/meta/recipes-devtools/gdb/gdb/0014-CVE-2024-53589.patch b/meta/recipes-devtools/gdb/gdb/0014-CVE-2024-53589.patch
new file mode 100644
index 0000000000..380112a3ba
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0014-CVE-2024-53589.patch
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


