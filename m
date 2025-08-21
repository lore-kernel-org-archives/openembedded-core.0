Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CB5CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:17 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.700.1755790808038719549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Z4cyMK20;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-245f19a324bso10536705ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790807; x=1756395607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpLoQERGQlcUcqptf5MZaWgAJRlYAzHSizP+Dn8o3B4=;
        b=Z4cyMK20YQFBAXuzmFdZBY1Sy8vlAZl7LPqlfy1C8HAElXDiIkXfpcZLu2h9Edp9B8
         go+JDBqSl/9tUxcCBI+xOydh/3RGowCgUUeOrD58xJHxNz/oFRmuW1I78d2kqf/bkkOD
         d4RDc6QrHQl+5qD3DacqoMmg5m0Cd09AMan60vraDOxKwJVAdcc1U/j1t6Zly+OaA79v
         bS9XDoSSa8cZWb0EBaLEmcs5+6wM7xafzYSKi2L3e6/86bKmt5sAeeZXbFq7PdTlTjn1
         IlNa5iQ932kPdigfAjS44hwiqPMJ2QI/m4OykHGp1vowjpqYfsyMwGg9XoE90KTVPThE
         0cJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790807; x=1756395607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpLoQERGQlcUcqptf5MZaWgAJRlYAzHSizP+Dn8o3B4=;
        b=llB0Ylq3U9sMaLZD6PhwUudZwRltEZyLonjpIEo2Mq1O4JxwoUMgH2xD7hv/WVqeWY
         Sqz0K4PdWHauwTb3zlgOgdmNl7Z2fYJimbgfMCzNanZVe7p9m+a4unccf/DBzP+NFcGt
         g3zyexPniOi2EdsTjbUGOE1aFeQt+fw7UVZACa7OI+AtdcSazZQePMxcKQHunvV4i4CM
         pa8Grf3hcN8kAYsApv+3s7r7zoXyvdVoP6kOrtsjyVAHkjXPBIwLDF1mWAjbcUq5qPgb
         1i6uXu3AGHO0ajCcDXhrot1wvw1VhPOlJYfMHEhPoRuqFUeLUz2f0XwPoflgLB9A60JM
         bl1A==
X-Gm-Message-State: AOJu0YyjR0Hx0Q36ZDQ/jPBLMhdOMp2lmGbsSNZRM/VHqERnKM0NQr/C
	BnY8Ec2a7XCVqSo71EoqI8/1K60ybgwx72WJw0hWmkJ4cRXcFqk/85Q/PpBAPDZ1YAl8echcrvi
	rCbv9
X-Gm-Gg: ASbGncv0NRiELCU4tIlwX3cfCMQwRntFhGP5zte88+M9cwAIZ0kkpGHWvCVXiCqbVPb
	sQvp62E8norrCzEZKtK5UmCyWQJF0rISRz3iiM6NfVGbipn33YXpwb8giyazsFiN9d07XmsJT6y
	RC4N3ttNK1gvSnjhY7HIkSLB7lUwjM7rQB6zlVA24z0NAOrGg3bYhtzQ3Fio147t7SwrELXw4Ti
	mSeCqHxzZbOah7Uoo7rY/bJJ04UQ66jvoM4fNNlt9Zq3dLdVrM5TK3FxNZRnjrMpdtwpSy780vN
	BLY9uDuhKsgca21lQIenBH1S7gAG7Fxa51f57PmrZqXTjpTYo8FVMmny1RdF/uNrZKT3KiC4f82
	SOzmdFOkp78/b7g==
X-Google-Smtp-Source: AGHT+IGvrOxBHQ0V0C0Kc9BLiu7FygWOM80aLhYu/A0ODHyT7tsbM2sjtpNdwntePuT3GvmmxPEYxw==
X-Received: by 2002:a17:902:dac8:b0:242:9d61:2b60 with SMTP id d9443c01a7336-245febea52bmr49454205ad.6.1755790807214;
        Thu, 21 Aug 2025 08:40:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 03/15] elfutils: Fix CVE-2025-1371
Date: Thu, 21 Aug 2025 08:39:44 -0700
Message-ID: <36a322934f6f7dc8d0890c531d68c0f7de69be13.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222252

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability has been found in GNU elfutils 0.192 and classified as problematic.
This vulnerability affects the function handle_dynamic_symtab of the file readelf.c
of the component eu-read. The manipulation leads to null pointer dereference.
Attacking locally is a requirement. The exploit has been disclosed to the public and
may be used. The patch is identified as b38e562a4c907e08171c76b8b2def8464d5a104a. It
is recommended to apply a patch to fix this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-1371
https://ubuntu.com/security/CVE-2025-1371

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=commit;h=b38e562a4c907e08171c76b8b2def8464d5a104a

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.192.bb                |  1 +
 .../elfutils/files/CVE-2025-1371.patch        | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index ff40ba64ec..2f34bfeebb 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch \
            file://CVE-2025-1352.patch \
            file://CVE-2025-1365.patch \
+           file://CVE-2025-1371.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch
new file mode 100644
index 0000000000..9ecb045f82
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch
@@ -0,0 +1,41 @@
+From b38e562a4c907e08171c76b8b2def8464d5a104a Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sun, 9 Feb 2025 00:07:13 +0100
+Subject: [PATCH] readelf: Handle NULL phdr in handle_dynamic_symtab
+
+A corrupt ELF file can have broken program headers, in which case
+gelf_getphdr returns NULL. This could crash handle_dynamic_symtab
+while searching for the PT_DYNAMIC phdr. Fix this by checking whether
+gelf_phdr returns NULL.
+
+	  * src/readelf.c (handle_dynamic_symtab): Check whether
+          gelf_getphdr returns NULL.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32655
+
+CVE: CVE-2025-1371
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=b38e562a4c907e08171c76b8b2def8464d5a104a]
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/readelf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/readelf.c b/src/readelf.c
+index 105cddf..a526fa8 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -2912,7 +2912,7 @@ handle_dynamic_symtab (Ebl *ebl)
+   for (size_t i = 0; i < phnum; ++i)
+     {
+       phdr = gelf_getphdr (ebl->elf, i, &phdr_mem);
+-      if (phdr->p_type == PT_DYNAMIC)
++      if (phdr == NULL || phdr->p_type == PT_DYNAMIC)
+ 	break;
+     }
+   if (phdr == NULL)
+-- 
+2.43.2
+
-- 
2.43.0


