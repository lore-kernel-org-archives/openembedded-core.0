Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53DAC83F26
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 19:06:03 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.43868.1753902357303964380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 12:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tNQ/pSHN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76b0724d64bso142931b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 12:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753902356; x=1754507156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZMwTKaJUfPr30V1JXauloML0R8nso2bVJEmgcL/nzI=;
        b=tNQ/pSHNrUszIaQl+t93iVt75ltVREXnKzTH2T/3LrLiAAVlN2IByZuRvtAzL3Z2d7
         uS36y0fbuj/yTzQE+wNDmptoh3cE8mArVvx8xrstRR5xrRZsgvcpfNpPcJFDQInrrBGY
         +84afEWf6z/W2yXa9W59BLEgB7NABMq9HJ/Slees/yKrX5bBJTb2VCi82AiUNabnDliu
         n0jyWHaoMc+XXMWpY/N4gxiYkIu5NluPPXfVHTIHkPOxn4jMHDlZQs88SSPwpwpQbjrt
         nrkId6B/sjT+va6RxyaRzEeXb/qgGzWBEpGT9Ywo3rzJjAS5x1ltj1Ij4aNBp5DtzRuP
         WIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753902356; x=1754507156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZMwTKaJUfPr30V1JXauloML0R8nso2bVJEmgcL/nzI=;
        b=hhkY9RH5iU4UqAxLqLdIJpjlvUNPS16QPJpyajXGJqTICZecTesNb2HRDj4hnJO80H
         nYxVYeEWzOuYYWVGKPpxiptrYJPe+mEcqexVgwRT1DDrpAlbBI+SxtqNY6Ag81rjl4hf
         kCHamyqVnecy8r8J2q4RdXLhuplGlh0Y5wSFphN+E1Gp825zAROW6FJ4DNYbPcrydNBn
         StyILdDjRuYD92FMzKU1PC4K4c4te7gq7pzkTL8p4c7PCcRNc1R4mDJD92iwG7Eyea0m
         uQTLwoWUznc5q0dts4XLmzcGrdgwUebAzfnRprsYqx2qK1XITCvv5enM/X4KuixuvPS0
         AuBQ==
X-Gm-Message-State: AOJu0Ywtq0mLsjbB/pz5Et3cXSW4ZDoRT6+9UR8A48MKxhSE6DmZwYyQ
	fjfa212NuG7RgTAabLUfq6R6WSgjxAq5fSTolh8zh4zPHQI3T/nefrEiQ1EjYwrZHmx0DRu87Ec
	w1g9Y
X-Gm-Gg: ASbGnct9nLy/eqWnlO9L3mab9v3iAp8UcbwK/YjAVDjp9KtESypLirc2iSaaNz/w0dH
	RL4VEPDVM+rxuhRylj9i3NQQWrcpJyZ90vDWsLOiqpSCUJQs3CF/R3D3/Gev1vueq7gh9JwexHw
	jhrCcwXYrN4y6Xe0fMTenCkG/+hgzNu2bun77f9zCU/7SZcYMjuaNfzCVz1mdXLxrqySBKmakrI
	bWhqH9x78YFZ+q50sN0CJ4KmW6aV2+z7gvtRn/hwwuVh1nypESrNQgL9EkmTG97TYmgVwj4XXhD
	LF5t0n+Cr9Fas8Dmm1eU9UUBuVeENY0oc2xi2EAw4e4m7ur2eXSDblatnyhvNm17eboADVntgAV
	lGwZE9fDPdX1cyIHzpL1Faqo=
X-Google-Smtp-Source: AGHT+IHf8Aob6Zxh47oB6jKzIuxebK83zGtE+VCA4CgLDJXgwxyfCRZO+Bnv3R2T/p8bhbPTqaXTdw==
X-Received: by 2002:a17:903:986:b0:240:3584:6174 with SMTP id d9443c01a7336-24096a9da9bmr76293595ad.21.1753902356463;
        Wed, 30 Jul 2025 12:05:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240a48b77d3sm22129025ad.117.2025.07.30.12.05.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:05:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/10] binutils: Fix CVE-2025-7545
Date: Wed, 30 Jul 2025 12:05:33 -0700
Message-ID: <4f461ed46b7694fc4815c7f0504b9cefe5da8e19.1753902181.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753902181.git.steve@sakoman.com>
References: <cover.1753902181.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 19:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221147

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

objcopy: Don't extend the output section size
Since the output section contents are copied from the input, don't
extend the output section size beyond the input section size.

Backport a patch from upstream to fix CVE-2025-7545
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0043-CVE-2025-7545.patch         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7545.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 4a460eb8d9..527334ccec 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -79,5 +79,6 @@ SRC_URI = "\
      file://0041-CVE-2025-5244.patch \
      file://0042-CVE-2025-5245.patch \
      file://0043-CVE-2025-7546.patch \
+     file://0043-CVE-2025-7545.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7545.patch b/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7545.patch
new file mode 100644
index 0000000000..0019ac28de
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7545.patch
@@ -0,0 +1,39 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 21 Jun 2025 06:36:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]
+CVE: CVE-2025-7545
+
+Since the output section contents are copied from the input, don't
+extend the output section size beyond the input section size.
+
+	PR binutils/33049
+	* objcopy.c (copy_section): Don't extend the output section
+	size beyond the input section size.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/objcopy.c b/binutils/objcopy.c
+index d53aa5c6..874f163b 100644
+--- a/binutils/objcopy.c
++++ b/binutils/objcopy.c
+@@ -4444,6 +4444,7 @@ copy_section (bfd *ibfd, sec_ptr isection, void *obfdarg)
+ 	  char *to = (char *) memhunk;
+ 	  char *end = (char *) memhunk + size;
+ 	  int i;
++	  bfd_size_type memhunk_size = size;
+ 
+ 	  /* If the section address is not exactly divisible by the interleave,
+ 	     then we must bias the from address.  If the copy_byte is less than
+@@ -4463,6 +4464,11 @@ copy_section (bfd *ibfd, sec_ptr isection, void *obfdarg)
+ 	      }
+ 
+ 	  size = (size + interleave - 1 - copy_byte) / interleave * copy_width;
++
++	  /* Don't extend the output section size.  */
++	  if (size > memhunk_size)
++           size = memhunk_size;
++
+ 	  osection->lma /= interleave;
+ 	  if (copy_byte < extra)
+ 	    osection->lma++;
-- 
2.43.0


