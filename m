Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506B7E6FE34
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:22:56 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108976.1766524973043116350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:22:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CBcmfXSR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0c09bb78cso38810195ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524972; x=1767129772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsq+EzRZGSmNAGUVwySFY3ruMDiJp4QKGFFlb0O1wjc=;
        b=CBcmfXSRmSn1enjFoeZZdZSDBfEyuz4N64EYF3vJJ8sdkGKoUNnqw6zvUJgwFd0aBj
         KLmP7JH/4WVxDpJn+FySoCRn4ZOxQd00yS6iZGJDrYMcE6BZVKomz2sR4VKjAh1AaPIT
         l3g9sG4rP9+uf5ExEuqT/JULz9RpsnxOBanUKSWZBvvTH89h1u3ll0I/ayoA0/t5EFSe
         Wm20R8Mye1EQzesDpIFjG2Dgnuqrb4USWeLrRwRkI9Y7yngaEOxwZxIeyvAh5f8/3VnC
         4/FvOaXzoxFBGIRcWrtq7itQBlF0cihHiOIchPtWtGEprxMinNRnkbpsGNbZFxB+HHGt
         9YoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524972; x=1767129772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hsq+EzRZGSmNAGUVwySFY3ruMDiJp4QKGFFlb0O1wjc=;
        b=KZWFICb5ctXFBCkWwtj/lLjM3m7rJqumIPoIIBcuCY58M8V6Nq/FBHbIEnceSohlLo
         8zsgQq7gTkFNTVn0uvY6OsanMKE6bp08uFD7W1I/QrxIdliXobuJuiZHrTCsvceMOIMn
         1VWnPd/00Jt88af61ZzV924P4zWRvefYy5P8gGHti6lSaxiBGcOYi3LJB1yVDOhzfgu9
         v8s30Ytl0jFuQCQdvLjnTXi5sZhD/oaFKIGRJWi0yBFYggMLOV+xR7gjP2cYiMXnFsom
         aHgjwJIBpO6hFr7ts2vWp20cFx/G6w2/qdvN5p0f1+QlE8WvwGhQzLDfYT4TM21JNtpj
         i1ng==
X-Gm-Message-State: AOJu0YzdgHWuUuAvJBPRtX6RoFgCSy8YHdywCQRruoVGCqOcXd1dQxXR
	EevwNH1mxFeneNXl1cEWwtbIBb3qOtpTFBU7hRknatvN16BfndhgiuBPOqHFpyDxEpgUpuaysrX
	QHSpi
X-Gm-Gg: AY/fxX79QLZK573mRe5/bPe6Cv+Wb+kGZGJdEIsqZvkgeGm8tbjfvYeYhfRscCLcmbb
	mgCg47pjiHqKsHviQcdFg6/WZTq3qaoQY3dujmLGDtXFwU9orsrlZT7d7m2uROISzn5yICmuvcM
	pvX+tmhNXKpLLrZpP2wBGn+EhRxgLxbyuawB1q/UIVza6r96x/owrjGJ91XZRUXNs96D3YZ+uZ/
	Rf8+59I0/G1U0oBPb+Pp9fI4EIfnlIRzjSuvn7pakE34gqUbjkHCT2pnQW2kzJPGra29H0LflKv
	vVqYL8kRt8D2rrVcUoXIxVue/5rKe5vT+M2wYHXoP0ZYU3xvZBDg8cxkM8BFNqWmrXs9x3yGWYD
	KI3m1VLfKVCzH/0yrOZlTuA3YjY5/OKMt87HXgA8OWUdVKejLmHq2AHbZza7j9nzuSAeIFqGCN6
	lk/Q==
X-Google-Smtp-Source: AGHT+IHy5v3H2mbTJ2mLw1LpNLLeSzedhT9UGqmm1jOl4CmrSbYGsXWIWP2OcxoPtdyAHYjJoo8gQQ==
X-Received: by 2002:a17:903:1984:b0:29f:cb81:8be2 with SMTP id d9443c01a7336-2a2cab31208mr137504555ad.20.1766524972292;
        Tue, 23 Dec 2025 13:22:52 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.22.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:22:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/18] binutils: Fix CVE-2025-11494
Date: Tue, 23 Dec 2025 13:22:13 -0800
Message-ID: <e087881bece2884f8d1a3c6d0dd7d69b40eb6732.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228481

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
.eh_frame section is non-empty.

Backport a patch from upstream to fix CVE-2025-11494
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0028-CVE-2025-11494.patch        | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0028-CVE-2025-11494.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 60b0d03ccd..69c5eddefb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -66,5 +66,6 @@ SRC_URI = "\
      file://CVE-2025-11414.patch \
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
+     file://0028-CVE-2025-11494.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0028-CVE-2025-11494.patch b/meta/recipes-devtools/binutils/binutils/0028-CVE-2025-11494.patch
new file mode 100644
index 0000000000..dc4b413658
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0028-CVE-2025-11494.patch
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


