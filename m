Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8889AC4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 16:37:48 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.161788.1672159059340638075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 08:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AYeWZEc1;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: yashinde145@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id y21so6981889pfo.7
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 08:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9RKevrZlipfiIz/51X1o2y40JY5FMvJIUm2B2/Idds=;
        b=AYeWZEc1itrTiXrV+cIbSvPtJmkD/bp/RKR08g1k72MU3gZ9GXiYPWUrQ0TUsullsr
         tgUnQ/phjEsjrxqUemelopn20SdEXFq1LYG59Bwn4Qj2xFr6Xoecz7Hl9JQ2D1cLFCO1
         rUKSazcFXXEDFAZZkvKlEh76vvHEJuoPN3nE+h182zGRBSHE39f4zdb9vVQ68MaILRNN
         JlZn38Y70d5DCZIH2nW5VAYTB7x1IKrlr0XWjoqiwme6vD3EeLTtH+SXf2fUNH1s9T1R
         F8ksIKdfoHmeej4ypj8PszMOugL3R51KQACmPcthpdmbX7zwqZRtTl0D8WC0Lwvqo/E8
         ik5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9RKevrZlipfiIz/51X1o2y40JY5FMvJIUm2B2/Idds=;
        b=h8GJ4WjBqV9h2HU/Fvx3JnIOakwrB5BJvq4QkDaKVepcIKB59dbdA90OS8lNUcUWYU
         7cobpLmhIfibTk8L2Y7iJwXZbhH072RBFbeoAr1B1sjGzEGosv9aLx6aLDCuYdp7ay3R
         VYnovQYU+HKoAbzugcJEI5IRPfWyj4ipe9akAZsLCbMwGXBxey/ihgNBf2s4yG0oU7H1
         YRJa4HcLfVj16NTSEhK7mhP3OrZz/XbxTuORfpxZGvEF+ARY1qinEv8xa8vCaZ5hy9lw
         6oP1js9c1ENdyW2FMYcj0eycB137JzztHVU/didLCaSlaAQQxQuqyx/gQBFilMQAAPmS
         eVJQ==
X-Gm-Message-State: AFqh2krsFtr7WJvelAZh/p1JBR01Qr0DKaxaR1x5IgWlk0ueU9W5BfQU
	oQlDXfr2LoOzsddvjDmZttbp5vwJd1heFg==
X-Google-Smtp-Source: AMrXdXspqn5uj4CjcCNaY+pm0kZmv71qSr7YRePuwWlLHQ8VAbxIVEbVZVExZKDpDTwtOq+ytkFwYQ==
X-Received: by 2002:a05:6a00:1d0a:b0:56e:d7f4:3bf9 with SMTP id a10-20020a056a001d0a00b0056ed7f43bf9mr26775801pfx.7.1672159058483;
        Tue, 27 Dec 2022 08:37:38 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id k6-20020aa79726000000b0057681626495sm9105817pfg.141.2022.12.27.08.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 08:37:37 -0800 (PST)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: [kirkstone] [PATCH v3] binutils : Fix CVE-2022-4285
Date: Tue, 27 Dec 2022 22:06:14 +0530
Message-Id: <20221227163614.3699894-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 16:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175029

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
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


