Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D5CC3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:14:15 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.78804.1746544454617168988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LQtr9lsg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fd89d036so64959205ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746544454; x=1747149254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUlSGxOxMLTBL3kZF1WAAVFRRwAiElvEiQI9tJ/oaMI=;
        b=LQtr9lsgvoDSMLj6/5pDoFI+wNW8+i8f8oG1VFl8xTrE+7olT/RehY/hQ+ssBkPPYC
         fionGMDg2t2I+OTyUOXEzM9sNkWQfK+5NP8Y3vImf1qCEPtReScHsW3/gQtIpIMgWGRJ
         u9ol1nSJgO77rP2CV3G6OVwLmkMtTNuYGSRgjk9YjXx8ziQP3qpGs2J1VhKxrOqXh31N
         WRWeW/muUtMdOhjzkREJc+r6isLLYsNNNMlN/S6m/qNiDV36yNf7iqhcIeMNLQs64JXQ
         8c5Zn9JUdccxlv8D6eYO672hq4zP5OQQ/L4olv1EqE2Qcq60xh0h4JmBT0a6FqPU9Ya2
         VhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544454; x=1747149254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUlSGxOxMLTBL3kZF1WAAVFRRwAiElvEiQI9tJ/oaMI=;
        b=KtJQZfURVOoBz0Jhl1PtLZeBM6X3cYEyMNXxmfwfgqCsOH0hpEUVxQhh2OK/wXqJGu
         oeh2qdQy5Lh63Yj+vFA+MRZiqVySCOVVSGsaaRi0lkjOkArcLT96vk4gjq3tnKf5bwUe
         S7Ad3VbdH3WL4+e/A9prnwcvgjQekhd3D6xqC1mojfkIp8R6lxIi9Nf9ApAc2q+gCK1N
         fww/wBSOcbKw5suU70ehxqbm58oVGboIVmolbRw9GIqWKxwf7gqCVABFBBtleSUdMn6P
         KZfzMmzGWMxTLuhgTlo6n+JiSBukjEkHImiwwceb91dMx7M829fhHtswIuvP8E8QIQNC
         9ZgA==
X-Gm-Message-State: AOJu0Yy+w8xbQGijPyJlV4pcpclKCbHnCzyP/O+L0LZ3cM3STpYa4HLi
	O9C+srJI4KKokhe0zCgwHlradqL9VzzpSFyLHTzFFvE4htGOqoAyUVqmN3whcWePUkN4r/pnxJf
	B
X-Gm-Gg: ASbGncu8tJO69nioGNY3VhjjaWYQWzia7TVklBS3N4ZCybTngpb0q6DkcfJDFtZKfxS
	ouBtjoGp/9MBSMOttDp37G6rc+Us5b8jlvx5BGiA5O83p6cUv4aKb8kba7gRDM5y4EjdsGQPZ0D
	ulU/JUkcTSPHxXk40yHAmoVVL2SKCrhERpfrjczp0hoc1+MgaXkGa1MClOPP/YLfyQe4kzrUSdp
	90VtLpI39DYp8InrNfXFa7hsA8FPIE0X1wxxaqwjuzTY3qbsw6sYZLWd2i6hOoME1eFdwXfD84/
	sf72hgSUsLM7LCx2pgb8uJf+QnB8Y/oK
X-Google-Smtp-Source: AGHT+IE2Rua/gBZi9muM/c6JCar4gDju77pSsxGCnkK5bEZ1vlrZwnesOahUmKqd+rYxcc5sjs5Chg==
X-Received: by 2002:a17:902:d4ca:b0:224:1221:1ab4 with SMTP id d9443c01a7336-22e32aa1bb0mr54538945ad.22.1746544453895;
        Tue, 06 May 2025 08:14:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:8d37:c5d1:328a:ee43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fa58sm75222545ad.150.2025.05.06.08.14.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:14:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/7] elfutils: Fix CVE-2025-1371
Date: Tue,  6 May 2025 08:13:54 -0700
Message-ID: <11c44bde4f3d9e63506ece2f9b27114914aacc4b.1746544207.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746544207.git.steve@sakoman.com>
References: <cover.1746544207.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216059

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
https://sourceware.org/cgit/elfutils/commit/?id=b38e562a4c907e08171c76b8b2def8464d5a104a

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.191.bb                |  1 +
 .../elfutils/files/CVE-2025-1371.patch        | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index 85e024179b..bab3d94d12 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1352.patch \
            file://CVE-2025-1365.patch \
            file://CVE-2025-1372.patch \
+           file://CVE-2025-1371.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch
new file mode 100644
index 0000000000..ebb57bd4e5
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
+          * src/readelf.c (handle_dynamic_symtab): Check whether
+          gelf_getphdr returns NULL.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32655
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+CVE: CVE-2025-1371
+
+Upstream-Status: Backport [https://sourceware.org/cgit/elfutils/commit/?id=b38e562a4c907e08171c76b8b2def8464d5a104a]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/readelf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/readelf.c b/src/readelf.c
+index fc04556..13344bf 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -2912,7 +2912,7 @@ handle_dynamic_symtab (Ebl *ebl)
+   for (size_t i = 0; i < phnum; ++i)
+     {
+       phdr = gelf_getphdr (ebl->elf, i, &phdr_mem);
+-      if (phdr->p_type == PT_DYNAMIC)
++      if (phdr == NULL || phdr->p_type == PT_DYNAMIC)
+	break;
+     }
+   if (phdr == NULL)
+--
+2.40.0
-- 
2.43.0


