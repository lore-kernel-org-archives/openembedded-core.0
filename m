Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A21C87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:35:50 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.5115.1753392944121161647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H3uYmP8U;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747e41d5469so1672294b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392943; x=1753997743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEdhDyCEzwkYtCrlPMFujykdyfexG7Fc6uPHi2MwqIo=;
        b=H3uYmP8Uc7rRAxQmDbxhkBXCY4aWB6BpRJtFnVHDzYO+HNID/hb1CisKfIiXhKKN43
         6L4pd0UaqKHE3HkPvw7tmtBO0a21ORaB/liAE0KYLXMcK7yvANHT6jMRoOk9wxYK19Mv
         XtWf8tHQLLT7CVJS4SJgqthUZOyKYrgjMet9wBQqLOPj9TOARF/L1zx/MR8v4AqUaDl4
         7P5zT1WZ+mk2VUCcZ1ioNImeB4K7WgRwH3M03ObYK3ldxj7oXz9E6EUdCF5szI7SjrRV
         wmv9wsQJ3+TozF/E4R2E8RfnTiRr5d/hERPy8owpGJuxwU8dO08Fp2dzAL9aFuWs8eBS
         gWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392943; x=1753997743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEdhDyCEzwkYtCrlPMFujykdyfexG7Fc6uPHi2MwqIo=;
        b=nLd3lx5Q4BEaw5X4Za/UDgH1Y4XAfHK13eNuXsmM0LWIE5x0QhweN1yomLsZEIUQpZ
         1oWfluriyGpD3OBrOAikBc4bU0fvSQT097AhONPLV9tbY7lDU3GXUNbyqZTPehn5rQgE
         1jOyXMIyJrH4I8gUEl6wEdXsHPHcn1MVrcRCicLBgFeC7xvqGaTbqEDXyWZktiqfXl+o
         DyGtXCKnqtRw/eDbgPEFqCHjSWMmovdz897P5pYYVEM7rygIJ8P7WT1yovIBMxGRq4vO
         2VhwrPXWA9wAlNdtqkD7CHQ+R5QTyscCaSDhAyQoi3yUfNKn/41bugr8Q/u9u9aYG8jL
         OTgQ==
X-Gm-Message-State: AOJu0YxIU6sKmVc/RLJ0FTAAXUnWmPL2SNH2C33QID0JtIcJhNGN0AHH
	1voMY/Zy+bgbfyVoxWVjv87aoA/AoAFnjSVAG7NLA24i3gmGnpDHyFS5/Q8Tz5ElKafRcjkbuc3
	FLTBb
X-Gm-Gg: ASbGncsbotdL/PSSbgkSTWN1LdN3hAXBZZE3A33q2O3bXLzXmEXHLf/yc1pVZ+bwhYd
	jutUWlxEnPDA6gAPCZW9kMqFtNNIDv4S0aUOC1Wb5ty64p1ko/voMbhBLdn9WqV9AbWymqpK7Wb
	IaeHNWmpNhCTGaAQXmCNc9mRPUk/Qr1mNdoRlnoCXw15B/W5gjAXdwlbt9C/3qKqantrbJ7S8mA
	gZzKr0cffllXa7sOTdI/L22VcSAuz8LTXzOaqN/Prk1Jhco9rNFHLsWFM3XbY2XqsTo0mqwxusu
	ScN2lqj+jJSDBrs3yPz+Eb+sGdvZwlVJtFgdwTVFZ9hD6Krm5o9431edp6ssY8c33xblqrj4aXc
	736ltXZoEmPN9WC4yHJBsCZE=
X-Google-Smtp-Source: AGHT+IEzj1inbqficOeIMtnEqZ+orM0+3rNC58rOiVTbufJMS87L1tLTQRQMPKkcadPPy/Fnooocng==
X-Received: by 2002:a05:6a20:258e:b0:215:efe1:a680 with SMTP id adf61e73a8af0-23d4903fdd5mr11536662637.16.1753392943334;
        Thu, 24 Jul 2025 14:35:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.35.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:35:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/16] binutils: Fix CVE-2025-7546
Date: Thu, 24 Jul 2025 14:35:18 -0700
Message-ID: <3a54f11b9462905e103e13161a77ef681f14dc92.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220875

From: Yash Shinde <Yash.Shinde@windriver.com>

Report corrupted group section instead of trying to recover.

CVE: CVE-2025-7546
Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b]
PR  33050 [https://sourceware.org/bugzilla/show_bug.cgi?id=33050]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0023-CVE-2025-7546.patch         | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7546.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 9471e6accd..a3ad655dbe 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -53,5 +53,6 @@ SRC_URI = "\
      file://CVE-2025-1179.patch \
      file://0022-CVE-2025-5245.patch \
      file://0022-CVE-2025-5244.patch \
+     file://0023-CVE-2025-7546.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7546.patch b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7546.patch
new file mode 100644
index 0000000000..23c38091a2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7546.patch
@@ -0,0 +1,58 @@
+From 41461010eb7c79fee7a9d5f6209accdaac66cc6b Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 21 Jun 2025 06:52:00 +0800
+Subject: [PATCH] elf: Report corrupted group section
+
+Report corrupted group section instead of trying to recover.
+
+	PR binutils/33050
+	* elf.c (bfd_elf_set_group_contents): Report corrupted group
+	section.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b]
+CVE: CVE-2025-7546
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+ bfd/elf.c | 23 ++++++++++-------------
+ 1 file changed, 10 insertions(+), 13 deletions(-)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 14ce15c7254..ee894eb05f2 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -3971,20 +3971,17 @@ bfd_elf_set_group_contents (bfd *abfd, asection *sec, void *failedptrarg)
+ 	break;
+     }
+ 
+-  /* We should always get here with loc == sec->contents + 4, but it is
+-     possible to craft bogus SHT_GROUP sections that will cause segfaults
+-     in objcopy without checking loc here and in the loop above.  */
+-  if (loc == sec->contents)
+-    BFD_ASSERT (0);
+-  else
++  /* We should always get here with loc == sec->contents + 4.  Return
++     an error for bogus SHT_GROUP sections.  */
++  loc -= 4;
++  if (loc != sec->contents)
+     {
+-      loc -= 4;
+-      if (loc != sec->contents)
+-	{
+-	  BFD_ASSERT (0);
+-	  memset (sec->contents + 4, 0, loc - sec->contents);
+-	  loc = sec->contents;
+-	}
++      /* xgettext:c-format */
++      _bfd_error_handler (_("%pB: corrupted group section: `%pA'"),
++			  abfd, sec);
++      bfd_set_error (bfd_error_bad_value);
++      *failedptr = true;
++      return;
+     }
+ 
+   H_PUT_32 (abfd, sec->flags & SEC_LINK_ONCE ? GRP_COMDAT : 0, loc);
+-- 
+2.43.5
+
-- 
2.43.0


