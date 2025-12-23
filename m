Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D360E6FE3A
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:23:06 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109346.1766524976790262380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:22:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NaGRuxpa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a12ed4d205so47457965ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524976; x=1767129776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6Ti996WAmYn96WwFClCs2HcogWnOjRi4gNqfxQ21+4=;
        b=NaGRuxpaEz3ks7DFZkLa4jXrtoHCpaDtFsqx7u2Atwy+biB3yIJop6pvykncGgVfnT
         YudU8U6byhIOIrEOAi1B+6rgLjItlKTnbRHhzbEZRDxmf50nrbCd8XcN9kXGBDpuXc/i
         DmMR7U+CasKG8BFoADCltn6CFOjk8Icckg4a9/k5DzVs20xijpafzCbNGeky0/ut8uIM
         50NyWpBslNNmmYKIy0LWFc7cgrNB/H60oXTeS9caYUP9YtF74G+4B0RZklvSsFIGm+ra
         u3Y4lWCKxabi+um98I/XXtmCCHn2I8ZmTVS8wcb5VXyH8gUlWIx2xnN0IsjcDi5Q2fgH
         N22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524976; x=1767129776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r6Ti996WAmYn96WwFClCs2HcogWnOjRi4gNqfxQ21+4=;
        b=etLCNXzMADQO9DsCiTdDIuaiTV4dksXKsP9lN5kdSO/H0k/DYBH3pv8x27uaI/eAaO
         tLw4Vknn2XPDl69p+qXrV7iW2YElInNsTJasQpeuaB3d8v8Vin74FPW47aGAQwbmfcHu
         nrFIVmSr7mtknDk/TXT4W1SIeATjqi4kv5Y7e89+qUuQIvSqhpygxhpij9OYdW0V4sdm
         hAAQEALU/7rAcPGkDlw8zVoY2Gvz98tK8SzimnXDv9awknTW4mqsFMcLs5oUBRcLGfkO
         c5ds5thuRjlROHcQsD0WBHV2IaNaJPXC7zPRZD4I4ka1DFvt29R0CM3+VHNXARLlpEVh
         mXEg==
X-Gm-Message-State: AOJu0YwW1MtvaXIdZ5j0Zc479/m9dTkHYFM4vhiV9D/6re8jspjf3fx2
	H6/xM7+nIqtEAUulLiSCqnYif5Au0kQR7ZGdM8eWcVaO/+KF1f8iHoXwjnjDD2ngmxqJlkz0bkG
	RJzUe
X-Gm-Gg: AY/fxX4+CXhPQFCym453FOTm6rdWRPM3yGe4VMOr5Nhbbcft2SgQrWOz0Id/TSMwyTz
	lk7fYIUugt9hWQa6HqwQmofE9JFwmH425d4Zs7WfAU7HuVdr7oEecoz8qoFe/NpKgBAMLAX2k13
	DAamd4KqbE9uMYn4VVsOKkTe6HJxjM2fi4bUIjIyGwLNV6SFyblWJ2zyfNGbH/RGibM9AdsAyrb
	Q6sAlenIrr9A2xOD7dwUe+OseQgV9SH0E2BBRFRjs35IMzxyapvDSLCGUvMKnCOoNOA2nhkz9gR
	Gfl0eg9Zl6T/MVTz0QZxPYIqsHJT7HLxEgxoGdbriGflB3jyX433N3oWfdwiNLGyCFbmUY9xDUP
	89bKIbTTkUzrg1Hw/uOGcoQZBrnTicnAD/sw9kydsLD84WOZkJd+ckwqqe5VUQ/Ej7N+dEU/6Cd
	n0BA==
X-Google-Smtp-Source: AGHT+IFEjaFdq01C8poIysM105DePkKpOJcv0FN7MEPsyk+/kRVOHGaYQoqXzAGENOKo2WJ0bxy8Mg==
X-Received: by 2002:a17:903:4b27:b0:2a2:d2e8:9f2d with SMTP id d9443c01a7336-2a2f28408ebmr134018845ad.48.1766524975907;
        Tue, 23 Dec 2025 13:22:55 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.22.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:22:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/18] binutils: fix CVE-2025-11840
Date: Tue, 23 Dec 2025 13:22:15 -0800
Message-ID: <d477a67f623da424c3165bde25d76152636b1f50.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228483

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11840

PR 33455
[BUG] A SEGV in vfinfo at ldmisc.c:527
A reloc howto set up with EMPTY_HOWTO has a NULL name.  More than one
place emitting diagnostics assumes a reloc howto won't have a NULL
name.

https://sourceware.org/bugzilla/show_bug.cgi?id=33455

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6b0f53a36820da91eadfa9f466c22f92e4256e0]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0030-CVE-2025-11840.patch        | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0030-CVE-2025-11840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index e045ccf00d..839d31242e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -68,5 +68,6 @@ SRC_URI = "\
      file://CVE-2025-11413.patch \
      file://0028-CVE-2025-11494.patch \
      file://0029-CVE-2025-11839.patch \
+     file://0030-CVE-2025-11840.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0030-CVE-2025-11840.patch b/meta/recipes-devtools/binutils/binutils/0030-CVE-2025-11840.patch
new file mode 100644
index 0000000000..3fb4db880e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0030-CVE-2025-11840.patch
@@ -0,0 +1,37 @@
+From f6b0f53a36820da91eadfa9f466c22f92e4256e0 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 3 Nov 2025 09:03:37 +1030
+Subject: [PATCH] PR 33455 SEGV in vfinfo at ldmisc.c:527
+
+A reloc howto set up with EMPTY_HOWTO has a NULL name.  More than one
+place emitting diagnostics assumes a reloc howto won't have a NULL
+name.
+
+	PR 33455
+	* coffcode.h (coff_slurp_reloc_table): Don't allow a howto with
+	a NULL name.
+---
+ bfd/coffcode.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6b0f53a36820da91eadfa9f466c22f92e4256e0]
+CVE: CVE-2025-11840
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/coffcode.h b/bfd/coffcode.h
+index 1e5acc0032c..ce1e39131b4 100644
+--- a/bfd/coffcode.h
++++ b/bfd/coffcode.h
+@@ -5345,7 +5345,7 @@ coff_slurp_reloc_table (bfd * abfd, sec_ptr asect, asymbol ** symbols)
+       RTYPE2HOWTO (cache_ptr, &dst);
+ #endif	/* RELOC_PROCESSING */
+ 
+-      if (cache_ptr->howto == NULL)
++      if (cache_ptr->howto == NULL || cache_ptr->howto->name == NULL)
+ 	{
+ 	  _bfd_error_handler
+ 	    /* xgettext:c-format */
+-- 
+2.43.7
+
-- 
2.43.0


