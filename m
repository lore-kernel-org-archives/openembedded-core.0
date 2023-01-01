Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014F5C53210
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:16 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.16449.1672594693053250279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6qLco68l;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id 124so17461394pfy.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRUqTguLuLsvICkIUj4xuq/JD76kSBgqJtiVYUzDZqE=;
        b=6qLco68lC3wdM8NhvSs6TpA8iOi01+KTJep/CI0/lThyQ6hK9oE0IiWIIRQY43WfHq
         68u7Yy5fECPhpBOz9A8SlXFPWn+Q4xsb2VVXm3cUOZAX5FHE3CJtVIYvwL4wgmw0yjSI
         8RNGtEEY4NB8Beqscj8L5agLzhfe5/+MTx0ycV/UccKtptBkl9xKm9cmP0psotrFmeIp
         vr7RToUQhNmnNGs2nFPXEbqFi5fRIpr3S+P8xQXn1twj887rg1ZNqbQgkJ3Yl6LvXa4Z
         ceYEQHKNveYseze8z+EHkHcfZr4jKNlYKSa3Hn4Tv+IEcwvNj7GSp11HiuJRv2CN5nAX
         LoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRUqTguLuLsvICkIUj4xuq/JD76kSBgqJtiVYUzDZqE=;
        b=Svf6Q39nPjnR3BsETo9yUAuRh4+/An4KFyJYTaqQofXaAd7r9ksyAjOQErYxlsBahu
         L45YbmUfY4KM/s5+hXFnxTLwUDp6nD9XsUHBFc9IrdbCgnhz97NK9BjoPkq4t60bx1k7
         cbSqwXOAnmeA7aIfVFQkNKHXfau9IDgWgYAd3uPBQsTx2mbMaUtkCj9a4JMpKc/7u87e
         0E40bZuV4wtEJhHlwc+AcALlvFSg2yVWKqMDxYp9EqMui/3pFpSVIDoXqGN77+Ifo6n8
         h7eaKkBAz5ZPOo2NLRzf7eXzxXiJxBdfwWs+1Frf1q4QU0GRv4mqZVNbKIasxXRwQJDb
         WgWw==
X-Gm-Message-State: AFqh2kqO622ZanGb0oIQit5erJ6teHqe8ICmwPqqSVBjcU2EOxChL213
	WFXp/hpy3aoF48nbCWhm6+l07ZDq1fO2bNdVmnI=
X-Google-Smtp-Source: AMrXdXs3zdcAmrhnFtV462N54NKsO3bLESLEGoBYpyOyf6Uff5L0jFzurXbN4wJWZ5BJewaQ9lHuLA==
X-Received: by 2002:a62:1b42:0:b0:581:eca3:fd05 with SMTP id b63-20020a621b42000000b00581eca3fd05mr10639096pfb.16.1672594692079;
        Sun, 01 Jan 2023 09:38:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/29] binutils : Fix CVE-2022-4285
Date: Sun,  1 Jan 2023 07:37:30 -1000
Message-Id: <9ea43146f9e6076833ac66027ed22bf36f8505b4.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175196

From: "Yash.Shinde@windriver.com" <Yash.Shinde@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0019-CVE-2022-4285.patch         | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index c1904768dc..0a4a0d7bc1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -42,5 +42,6 @@ SRC_URI = "\
      file://0018-CVE-2022-38128-1.patch \
      file://0018-CVE-2022-38128-2.patch \
      file://0018-CVE-2022-38128-3.patch \
+     file://0019-CVE-2022-4285.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
new file mode 100644
index 0000000000..e5e404982e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
@@ -0,0 +1,37 @@
+From 5c831a3c7f3ca98d6aba1200353311e1a1f84c70 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 19 Oct 2022 15:09:12 +0100
+Subject: [PATCH] Fix an illegal memory access when parsing an ELF file
+ containing corrupt symbol version information.
+
+	PR 29699
+	* elf.c (_bfd_elf_slurp_version_tables): Fail if the sh_info field
+	of the section header is zero.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
+CVE: CVE-2022-4285
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/elf.c     | 4 +++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index fe00e0f9189..7cd7febcf95 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -8918,7 +8918,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
+ 	  bfd_set_error (bfd_error_file_too_big);
+ 	  goto error_return_verref;
+ 	}
+-      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_alloc (abfd, amt);
++      if (amt == 0)
++	goto error_return_verref;
++      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_zalloc (abfd, amt);
+       if (elf_tdata (abfd)->verref == NULL)
+ 	goto error_return_verref;
+ 
+-- 
+2.31.1
+
-- 
2.25.1


