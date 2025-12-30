Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2C8EE499E
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:15 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71898.1767125533533065849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ROoTLCbc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a09d981507so75591805ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125533; x=1767730333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIzAjz/rW/hWzI9zOyQtj7UZYjAOZjXZ+iaD9/WTwrc=;
        b=ROoTLCbcAO9D9UjWSTOlbkwAEBo/foeVdZhyXZ9Po/A9lT6aZPCyYgFYzgTlL3q9ko
         xnejQ9vJz24vyqQMGs+VQIcxP/EbpelTxrgInPWh0TsOca0jCG1ndzg0HgOibZnzHUFJ
         bvRoQAlOVZwPAIDhZD1JZq+DUzkxmzXiBNLHFJGJDx1JzK3yZAEgmy+ylbXqrBOC/GPH
         p2/XWvE6QBtq38HlCdWZQQQtXbFEEc/THziJWYhlLInmIRrkYTZlgngVGtds9TS53HPK
         hW+pjtsoHzU1byEWX4dSb4cwn8+JKHe/q65G5GLQAfAfdPNaKRX8Z2+c7EUY1Jdlwlfi
         RiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125533; x=1767730333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rIzAjz/rW/hWzI9zOyQtj7UZYjAOZjXZ+iaD9/WTwrc=;
        b=Np4doqRK0C1fGcIv5UYLSL8JgAE7398Q9lHCaGcQeyVt/3QfdVPIYDT5Ql2egIDgxG
         U5VGClh8yeKjlCHzXJLlMzk+ERURwN7gquEqvtBPQVPERhafg/2ufM0THabVqQKM28m8
         BMH5CCKYUNeQLG5mHPFRW+eJoTBXZM+CPXsIvSE2YOn6D+ZcSLkLXDIb4B0kLkmpmMPr
         mnjrwsa7DxqBsgyLP8KACje84vdGgQ1LqZIDFhhrt09hBbEyQqUbyTuLCXzb6mH6oJ6y
         kL842OZT4HVxgPfi6LQUo1L92q/Fa3bHNM+9Xm/tzp7BZpAn8J1lHW6nGvHB9xA97WYM
         vKOA==
X-Gm-Message-State: AOJu0YySSZAS5kXyLQQSskknxBycdrnmCK94DkuvmJn5W3jOFS+DL7Wp
	gVSZ73US0wIMrXXdWQ63cIoqBjpUc/kgavRiDQJI4AIE2rgp4RaCnkc2WXzGMy4m02k3EDG9qpc
	d0UCa
X-Gm-Gg: AY/fxX4ERrTlAFsxpMlK/NWtm+5M8lKxAbClj1AIraF19+yL6LMjjt+J9jxv66tPN6n
	HilQLKDJ7MT7Ezb5GYIZdDdI9Q001+0Sl2ZwsP4ttetrU9TQuBbPaGTdB9DULfhWwKOoXCCT3iU
	QtKW3sKU5FPIemQ1IbyZ3cl7GK495+fnVToa0931MPuSz6v83ttvtUS+MB6x9TwqCN8TantW/2e
	8oC/iQ/G5Kct7YQgX2weMzLiU0UrZZ31AB0ol2hx55dNvskM9/hvZ8OrO2fxVU3CMf3m3Fh/wa1
	ZrSkOEumjVEn8WZjjC7w2OxPuVoXe99f35Zlq7spyyHlQGUxYl1KDDCmZuXqfWafwm6zHEiZP2i
	ZNpuH+WN4D3yt35BG48b9sFgxT7/W5si4pXNl5rW1obPlPPFlprj7TNVyzEspAowYnwqRMKlGCw
	Q+Kg==
X-Google-Smtp-Source: AGHT+IEo3WUcWlR2ATpEcNbSz+bgtjryO7RwEJ4urO8b58fXD1hkrydJrQMKXJK8xvw+q4xMCy8IOA==
X-Received: by 2002:a17:902:ef12:b0:29e:e642:95dc with SMTP id d9443c01a7336-2a2caacef70mr372722945ad.12.1767125532741;
        Tue, 30 Dec 2025 12:12:12 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 02/29] binutils: fix CVE-2025-11840
Date: Tue, 30 Dec 2025 12:11:32 -0800
Message-ID: <66cc64a69ab33b8415e1841c9256e572c0ff33c7.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228694

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
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/0020-CVE-2025-11840.patch        | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 9ae0e72e60..16a63cabc5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -45,4 +45,5 @@ SRC_URI = "\
      file://CVE-2025-11495.patch \
      file://0018-CVE-2025-11494.patch \
      file://0019-CVE-2025-11839.patch \
+     file://0020-CVE-2025-11840.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch
new file mode 100644
index 0000000000..3fb4db880e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch
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


