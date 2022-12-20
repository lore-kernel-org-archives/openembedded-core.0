Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D33C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 13:12:53 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.49603.1671541967174019441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 05:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OQI0toWr;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: yashinde145@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d15so12215240pls.6
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 05:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3jU9wRpbF3pPyc9LZMPFKhXRWUHAPYsoQni+Oro64BI=;
        b=OQI0toWrnXPsYMbfEdi4PJlfTPuf1rNOKWESNut834LlqPVJufB+8QSyKo/FL+HaTJ
         0Maj0KqT1oe++mtBBXmz4CxiNEwIiHYK5IviN5O8uxx1FPyKJuez6P5tosYeMjts+rG2
         iZ/aYBSzTSWlWNwK+Ppz7DM7nN1b455LZ+eYNXd2jJNxpBgeUTzAhRsfAiMF59uPk82I
         afzxlYS1S5E33qgi6pD5R2NRUzaZSbua1oThGcDXplIXIDuh3dkn/FpNfoz3wgpGapdn
         lagF32ddJ2Xgq44057wkO9jo0pw6Iu3APYlhBt3spWkHj3BrmVNDlBq3pdHD/4Gu/OFO
         HwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jU9wRpbF3pPyc9LZMPFKhXRWUHAPYsoQni+Oro64BI=;
        b=WfPR1WV1WxRCghVDJZrcijT5Bkoqov21ZXxf/bSVXXgJeyCMBwfDYTmtrF5x6Qkm3Z
         xh0nsjLQ4JB2H5jatQmQi0IuhZ+pO/ZIfGbe7el0GwM9sy5cNK5IoDVO61LGliuigY5s
         VlSX6KnQjtBYB1+8F+bx8iLN+yBju2Ypp4uatUe5RYlpLkK3vchxiaNoIQB5v0Nbyb+H
         DrkTSYXby7zR66d/3SPWSB+E76x30g5KCRQjOKFCGgg9xI0khx+l8oONKgI1N17Gy0Za
         bShS7wu2wk62FHLRfcmpngsR8kp1PPQ9R18RlKSPWeyLtwLY1gmeQS+bPY7ubbW3aWu6
         PgKw==
X-Gm-Message-State: AFqh2krCBCVazP1AOqa6FBSIj9aKI0zjFKJOK+ZfmGHHZqjkR4IwoN+v
	mNK3EK/g7gURQkH5XNRL724+RYohas6Dmw==
X-Google-Smtp-Source: AMrXdXu8D90K5tFT/wae5620Vu3afs8BlrQyGualfYHDTX0zDW9Op/2XD4NweSiBrRAp95kGIf76Sw==
X-Received: by 2002:a05:6a20:b92f:b0:ac:4ae1:3ccb with SMTP id fe47-20020a056a20b92f00b000ac4ae13ccbmr15822834pzb.16.1671541966292;
        Tue, 20 Dec 2022 05:12:46 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id s6-20020a625e06000000b0053e62b6fd22sm8653855pfb.126.2022.12.20.05.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 05:12:45 -0800 (PST)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	sundeep.kokkonda@gmail.com,
	shivams@gmail.com,
	Yash Shinde <yashinde145@gmail.com>
Subject: [kirkstone] [PATCH] binutils : Fix CVE-2022-4285
Date: Tue, 20 Dec 2022 18:42:19 +0530
Message-Id: <20221220131219.3300062-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 13:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174849

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]

Signed-off-by: Yash Shinde <yashinde145@gmail.com>
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
index 0000000000..dc114de2bb
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
+Upstream-Status: Backport
+CVE: CVE-2022-4285
+
+[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
+
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
-- 
2.25.1


