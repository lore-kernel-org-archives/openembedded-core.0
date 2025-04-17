Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63394C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 16:30:49 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.13355.1744907447660809369
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 09:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JN3NqQgW;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7376dd56f60so803321b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744907447; x=1745512247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=erxnziMqkLx2rZndENnprJ/Csk950zprEAUUkk9YQM4=;
        b=JN3NqQgWBfpfmK0r4T0pXo4bBvXbEv53/dW9yesyRCUqqj/6p+V8l0FxiE8gKsZF9C
         C0CjY0VEPvwSk50HQP9LAJ5OWKzcAHD078rrZQo3oQVoiMH2QzNibpJoa6xpYRLVX21a
         jbYjB5HdVtg5Hz9cMq74yV2fHEs2PPFZitEmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744907447; x=1745512247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erxnziMqkLx2rZndENnprJ/Csk950zprEAUUkk9YQM4=;
        b=wyGHc9JbTELWAZlCeh9WW9KpQzjDuuC+VBfBRYVxANN8wc2QxHlCWyPXlbgF8VHjgU
         rVTh7aL/H7z710EpVEnaXqMA0uyqWYu7cvzjuOPjZXLWI1u0Fdc1m40mKYWUnbm3DaOo
         ci03hwCjs2Q8fLwgPwZV8lIkxudIprpku82hs4dYWuPVjMNO9fxMqCxcWTHM8SPpZzw1
         8DPw7PYZVvJk3mMkKM3bjWlfrMqBVfJJ6+OvkiPmIbSB1xVeo94Q0ER8bshdy33jNHD+
         E8t8wiXGt7CgcNDeSGFTE8KVEKClSkPjZYYbEp617Fd5Kt0srs+vptT9+LXjnAGLRX1M
         6Kfg==
X-Gm-Message-State: AOJu0Yyk30scIJMMTJGaR9LmAH4RMLA2w1p5raVfc7ETKq0MkxPwsikh
	6p/WURRaBWeVwe13RudNCrtSuclVTwZTyAx+NUmyeu4uSWnIM6amg78jO91OsBp6M1JAT4OGGTF
	2KLY=
X-Gm-Gg: ASbGncu58FQfRmJMb911xI4A/hhtxCXy24+CoLQCEfuZ3m4zmXRUT5d5nPLuDj1qnHe
	PipS1liN7cSNY6cdNhyI9G0aPTIFy+4cXlTYWBs0zqW21a1kck8o1qoJOs+Pulzsd38L5dqDJZr
	ZaphIRIlTnGfWN49xgRwsORsus7vz6L6FjZfcI4P1ztoQqh0c9QO0vkgusvNoe7dAT3/LUyHOqy
	naFRkjKcGRm++p0Ot3UAuhVPuPg3p08sKN/kYrHFe1wohBzt3X5CV/qbR8j54PDV7ELOyFp4W+S
	+mDQKlBe7O5teHrGWmNpAlXL1lyziDYjuOU+jw==
X-Google-Smtp-Source: AGHT+IGXrumpba/Vao64iZ4WmugGF1wZkTP932V+vcdEGTWNDbqVJBgPkKV5QWQQh4XroFQYVvRRJw==
X-Received: by 2002:a05:6a00:8d8d:b0:736:3954:d78c with SMTP id d2e1a72fcca58-73c266de2d0mr9113847b3a.6.1744907446508;
        Thu, 17 Apr 2025 09:30:46 -0700 (PDT)
Received: from MVIN00043 ([2401:4900:1c69:30e4:bffd:be2:ee10:7170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e3d34sm45222b3a.53.2025.04.17.09.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:30:46 -0700 (PDT)
Received: by MVIN00043 (sSMTP sendmail emulation); Thu, 17 Apr 2025 22:00:41 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] binutils: patch CVE-2025-1182
Date: Thu, 17 Apr 2025 22:00:40 +0530
Message-Id: <20250417163040.3731354-1-asharma@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 16:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215105

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b425859021d17adf62f06fb904797cf8642986ad]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-1182.patch     | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 758bd8dcce..9fc29301f0 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -44,5 +44,6 @@ SRC_URI = "\
      file://CVE-2024-57360.patch \
      file://CVE-2025-1181-pre.patch \
      file://CVE-2025-1181.patch \
+     file://CVE-2025-1182.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
new file mode 100644
index 0000000000..15b40fddb6
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
@@ -0,0 +1,33 @@
+From b425859021d17adf62f06fb904797cf8642986ad Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 16:27:38 +0000
+Subject: [PATCH] Fix another illegal memory access triggered by corrupt ELF
+ input files.
+
+PR 32644
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b425859021d17adf62f06fb904797cf8642986ad]
+CVE: CVE-2025-1182
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ bfd/elflink.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index bf940942ec3..df6eb250961 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -15116,6 +15116,10 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
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
+2.43.5
+
-- 
2.34.1


