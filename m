Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2179CC87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:44:47 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.26735.1753469081305708909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EUDRTIME;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234b9dfb842so22456935ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469080; x=1754073880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEdhDyCEzwkYtCrlPMFujykdyfexG7Fc6uPHi2MwqIo=;
        b=EUDRTIMEKrYbXkpz2YG4gw5QG9Gjc38u4880La+OS0t+W6R8aqfXJTQaj9v0YGFL4L
         G0/Y5ZrRf8HGjR5BXbvGkCNxJS56XU3WvcTLbAWgVBMVSa0xlX2H1PwOU5ukuqC9d7Q0
         f3YBtHXKBbhx30wNUWKb6KUeyH33hlTBp64em7P0fjabQ/vTa3F7N38ZHld0kvlLMspd
         B1/wnei9+o3upjmIIONitgr1rm3YP97SpwMak/PPxrC0SrWsqmyckwtyGaShElbvmLWj
         kpIhzCHOkLILj5JWcQ93Pdb8uHpPMFXzRbCzEYv4exQtHDUHhGesSgsUr/6miQf85CLu
         2VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469080; x=1754073880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEdhDyCEzwkYtCrlPMFujykdyfexG7Fc6uPHi2MwqIo=;
        b=itiNAdxPQKA+GvX9iIvmZ1fU/w8VH2DBDSoRzUdKJNvI6tRWUz19yf/allHP2vyfFb
         o/XLjEBE6Nz7i+5RKzJHnsnpGR6zvZKXPh3UZZJV4mgUq1/1Upj8jQtwFb++5S/lQnpB
         eDdgC4Zacm7RrEHt94X+hPW4gpcP0pN0sNMUE3HHI32/yBD3u+bOZ7MVGoU1r2oq4RGj
         pv6hVCK6/c2bw2tVSCzcsBxHmPGidBxrj4DMIs0FIWWQY4fe+JWk9JsMP2C540DNfPYs
         Q/crNFWym1Z19XsmRxTPuh4jxxOlWP9OrB2eE4UnIRLS12VAESpF2OTSMBf/bc6EOeQD
         hCZg==
X-Gm-Message-State: AOJu0YyPK/d/9DDj0DY/uJMkAwNiTIcvvcvW7pYifRkSUGW47ncQn3z3
	UgEUsF8XgskQc7gMbsvwRzAgtVb5l758wyHeh4MQdcQr+PDpnmSbcZyQXR8RWz240N9pJQZIKh8
	uqoU5
X-Gm-Gg: ASbGncs9ujKaMnNPOW4PkEXRnRRIA1HaN3k9Cy9K6W8Ac8Xjq7ZhVY3TzYE5woCvDml
	vtzP52L5P+vSuqXW90TXEXgyCUUxeXpVMrQuLSfLudq3H1ObAiHWFIqTmAL4UJq/UXmoCRKsGQu
	Vouc3tpK63rb/Mc7QyO2vjfGwCkb6vDK/IiqV09rDnUe97QS9fJQiWCtgVfmZpY5jfdhwR0Vyo1
	bdQ7vcCR/weiECU/n7ne9n6+jnpEO9bjsZmbCdetDmSPLaNxwbBRZTQk4IN7y4nwC434aDjpA5/
	pEYs1qoL4eIwGFdn2YyyiXBCAwDHnsebj7fqD4jmva9Nk6ZfoOY2pfniMyVbuVXtQTc0cSw5jKZ
	822BbyBVVkYQ8tw==
X-Google-Smtp-Source: AGHT+IE/PpHohKGi39Ssr7V/yXqlNJS7+Y0sCIm+B27kfkX6GOsV8HQa0ktiySRliGKvAuJq5GDeJA==
X-Received: by 2002:a17:902:ccce:b0:234:c5c1:9b63 with SMTP id d9443c01a7336-23fb30ab826mr41461625ad.18.1753469080507;
        Fri, 25 Jul 2025 11:44:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 02/16] binutils: Fix CVE-2025-7546
Date: Fri, 25 Jul 2025 11:44:16 -0700
Message-ID: <3a54f11b9462905e103e13161a77ef681f14dc92.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220918

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


