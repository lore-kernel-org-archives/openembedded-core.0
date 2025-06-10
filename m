Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600CBC71130
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:38 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.91299.1749571776542856220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cShrr3z3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2350fc2591dso46564505ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571776; x=1750176576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HayCgZf4sNMo7NJKVEia12br6manhwGtRwY37WDqDNc=;
        b=cShrr3z3FJeLoev2w1KDekUCyrfupKHs9KD4shbTpzx4op3vpukxKt2HKrK6At/fqU
         f/iORzHHC3Wm53MVkwn9hM7fFcL3Q3Fma3vKX/Ls6dXGz+nLbrRiyv/JYfvrz+8HvQd9
         Fof2APw2MsdKThEyROMuFcOHwSB3UVm4NinlrPilsUPvlz2fLdhP7px6//wyB+UxMpUs
         +JgiLhWGBYti9jCoXfxHcb9tpwYg5xV0HHWvWSM71LYKaVrTf8DCJJVEerH4S7ge4SBH
         ZSVi3bckpjVYPgG1lqNkYB2v3vGuxnq8xD9+ZUOd0D/pPY7VAOx2dHa8pWRnpvhk7MOL
         m1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571776; x=1750176576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HayCgZf4sNMo7NJKVEia12br6manhwGtRwY37WDqDNc=;
        b=WqI4CHOVW/ptTQ8W2xM6RThRbh1YsiupqHCMtUkrtO+VTbfa5MMQPi5b+dJrYwfb9Q
         btqPbe8ZrJDiYpTU1iYmfTf7sPvUFEGBiXlUmPtlKfcHNgwOUaI1H8PJNRZ4lD6pDnbQ
         Ud1BcFKi5LmEERb9FPn+FNozR4asDKyn3lxYKFo8ajKzYIIjgdGDvI9Mg+m+FkXWinMb
         eUIwXIozRiRADh4zO+28ye7en2NkJNPYJDtOsGp5jTeU/XAEi0YoiJn78JC7vmCd1gkc
         ZwWLLmB36Gq6DH97MRuu/OStVUoEj6YzrofnlJWEkGBY/QPNtvSOl9+iKtZd7gz2I1XF
         Dvuw==
X-Gm-Message-State: AOJu0YyP5iL/8Ql8298CXhatluXBe3Y/w0T3JSCqhn+MosVQqLcuOOx5
	/RJ9tb+2xyjMSGiDCeknoB6f6ZMH1UmICo530Krx2RPMU95RLccOTCH7LzUbDvVvntPHCbF/CmE
	TRb5/
X-Gm-Gg: ASbGncuwpxFTjOclKw6ZzrHAkDFbYLlqYLIKumHV+z78rTU5KhN0y6UfVYcRYCCTzgH
	vUEIVn8Q/GDQ2AsD6UAInoYN+viV46ElMjCxmpoRg+rRTL+lD18FZgKMBsaWiUUaPzW2Y6A4OPj
	f7eLWQaI8AYA9lvoUbfi6Ps1+vZZHCSb/Wyv9RiqmnCNulpYYGxEQ3FCuEBLTXOKBZB634X1adi
	VEq7zRqiSs1k96nq4KXYR2+t3miJWYeHEq1weUR41xeoLP2Ch3UDgv9TnD8T5JpvdU7lagRGpwY
	5DrCRGmIAl1cznjN16GY+DWNOJ3Dkqp4/jgplcFdGvNaxPSaoZEtrw==
X-Google-Smtp-Source: AGHT+IE+/oFPJGDP+BPKVtVbddD7IRSL6YmQ6TQDBsIV2Tp3qdXObyLlJte/aB3woqLqIyGjwmVq0g==
X-Received: by 2002:a17:902:c407:b0:232:59b:5923 with SMTP id d9443c01a7336-23635c648aemr73096195ad.23.1749571775696;
        Tue, 10 Jun 2025 09:09:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 27/32] binutils: Fix CVE-2025-5244
Date: Tue, 10 Jun 2025 09:08:40 -0700
Message-ID: <81e5831ea48e9d1e4b37e4ef6af11d382d7f1df8.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218396

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32858 ld segfault on fuzzed object
We missed one place where it is necessary to check for empty groups.

Backport a patch from upstream to fix CVE-2025-5244
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0016-CVE-2025-5244.patch         | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index f3085ce2ef..0b8a298be0 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -40,5 +40,6 @@ SRC_URI = "\
      file://CVE-2025-1182.patch \
      file://0016-CVE-2025-1181-1.patch \
      file://0017-CVE-2025-1181-2.patch \
+     file://0016-CVE-2025-5244.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch
new file mode 100644
index 0000000000..e8855a4b4b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch
@@ -0,0 +1,25 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 10 Apr 2025 19:41:49 +0930
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]
+CVE: CVE-2025-5244
+
+PR32858 ld segfault on fuzzed object
+We missed one place where it is necessary to check for empty groups.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index a76e8e38da7..549b7b7dd92 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14408,7 +14408,8 @@ elf_gc_sweep (bfd *abfd, struct bfd_link_info *info)
+ 	  if (o->flags & SEC_GROUP)
+ 	    {
+ 	      asection *first = elf_next_in_group (o);
+-	      o->gc_mark = first->gc_mark;
++	      if (first != NULL)
++		o->gc_mark = first->gc_mark;
+ 	    }
+ 
+ 	  if (o->gc_mark)
-- 
2.43.0


