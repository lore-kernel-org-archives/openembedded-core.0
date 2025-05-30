Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7CEC5B555
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:39:09 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.1257.1748626747749684577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 10:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xEgArpq+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-745fe311741so2578778b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748626747; x=1749231547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9uA3q3WLAaOTA+82R6mO5LtlnncWzS0sbTejfPW4ao=;
        b=xEgArpq++cFuNB5jrYhTavbwvCQXI/9Uvo9ZC+rx/LsXhcakn/P18Aa3gB4Z8vOM5C
         Vv5TWDD0uA+STvxsrHAKae1y8pXKUHMJVphmrQV0DRGWEoN6PqQXLUWiQcVyrGfFI/RD
         dLwwpNMkP15f6tIDk6QBjZnjBh2elYD9tLx5PyVAITtHoyS4YhrGgLrp3fj9gq9Pwyur
         zHOI6W13+jupzzutLgaZfP32By/8ZaGzYTVglch1jHMuGXVDQNHAvBiCo2CaMRm1O9Uo
         ieZecMw7xvIDsnsAVGfNWUkXR9L0RIoe9wc/FLX6GArxaZObb3TDHBbdXqltjwHxEb6Z
         /hLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626747; x=1749231547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9uA3q3WLAaOTA+82R6mO5LtlnncWzS0sbTejfPW4ao=;
        b=SjbauS/xI+kglwHfQcWgepWT1TSSBB/YiyvzNPUzfiILll/MNS9dc0iWBrHCOe5mYz
         p3JrxY6JmcJhgFJRz6PRDSMZ+rayUqqg+SLgs8wDkj+gTByr76PdvwuvMwxEVGfcrrWb
         rRSvIJGhw86zd6AvkVgTtCEVQlGpRsTu4orzWLvPwIgvC9rgCjAak0g/UxD0pYo++vI6
         3+IWB49GXIH+xF5sgBepwLexr/txz7gNhEBMuGiskLCeQioicL0HEmUfqFqHrydOo0Kx
         NlJqvqrD/h13VDC1DkBSQDdfK17Krv9+7p+goIecVrIqCjb04VWjzexuQkzOX1fET/a4
         +LaQ==
X-Gm-Message-State: AOJu0YxTD0mWsbLNNzffK+uBsJFhUimJ4NpSI3wWOwK03k5VtcwREivQ
	u/D2vzV9cqtmi5BwZYyHQnihs28BMQRN8/61cv9xw+YdnxRdq3mUsqFNtrMmqQS9Jyx2wLHDaFv
	1IRV4
X-Gm-Gg: ASbGncsOvjBTkpqC+TD2/t/aA/XfSrdOUuKWyu8Ngtnsc3Ybn+8lOIIIntGyEqMbh03
	7oBVkfRiguSKHbbNf/nJSB/lxLW1fAmE9lRtuIQqCN0EcFucknJVQclgLLdoAfV4Ro6bl27TRji
	hoMjLu4nparLslJ3tZNn82pb3ZsUn0/8/e9ilrTjS2tphZd2SHwd1IxA881vuyeM61VLMe5R4c7
	zEHi/uSWyGfIo8XfgjSh0gXd9CtEYUleQTuNFL32I9wbPydQxAzHTaE+DsSUclBIXi0+FS9ZL4z
	gl9Fm+gwkwZ+w0OAApOkl6LfiNpYhd60Crob7s4fLmIHhGorWsWjA9r10hMMgO0O
X-Google-Smtp-Source: AGHT+IFgbn/xuSY9mh/zLgPJP/28I/00p5eVzO5yHQMiUg10YrxKvvMVEY1y7wf7VWFf9sQ+HlZsrg==
X-Received: by 2002:a05:6a20:d045:b0:1f5:70d8:6a98 with SMTP id adf61e73a8af0-21ad9276080mr6543152637.0.1748626746952;
        Fri, 30 May 2025 10:39:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb5f40sm1554314a12.67.2025.05.30.10.39.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:39:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 01/12] binutils: Fix CVE-2025-1182
Date: Fri, 30 May 2025 10:38:48 -0700
Message-ID: <50ee37e89a04a3dd6b652831977171973791f6de.1748626640.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748626640.git.steve@sakoman.com>
References: <cover.1748626640.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 17:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217524

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141415.html]
CVE: CVE-2025-1182

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/binutils/CVE-2025-1182.patch     | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 6906ab3efb..ae9ec9efa4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -37,5 +37,6 @@ SRC_URI = "\
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-CVE-2025-1178.patch \
      file://CVE-2025-1180.patch \
+     file://CVE-2025-1182.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
new file mode 100644
index 0000000000..b02b9fd1d2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
@@ -0,0 +1,36 @@
+From 92bcd04fcd97f261ff40e9248e00a1dbebf3a536 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 27 May 2025 03:37:50 -0700
+Subject: [PATCH] Backport fix for PR 32644(CVE-2025-1182)
+
+Fix another illegal memory access triggered by corrupt ELF input files.
+
+PR 32644
+
+(cherry picked from commit:b425859021d17adf62f06fb904797cf8642986ad)
+Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141415.html]
+CVE: CVE-2025-1182
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elflink.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 6346d7e2b4b..a0b237b2224 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -15084,6 +15084,10 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+ 	}
+       else
+ 	{
++	  if (r_symndx >= rcookie->locsymcount)
++	    /* This can happen with corrupt input.  */
++	    return false;
++
+ 	  /* It's not a relocation against a global symbol,
+ 	     but it could be a relocation against a local
+ 	     symbol for a discarded section.  */
+-- 
+2.49.0
+
-- 
2.43.0


