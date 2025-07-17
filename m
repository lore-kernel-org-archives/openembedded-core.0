Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A25BC83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:56:01 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.40458.1752720960631927552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oeqzYuLg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so433625a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720960; x=1753325760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yn7B+ipUVVRHb4W/hSV3THQ3JZ0KcrS1yG32M/2QnA=;
        b=oeqzYuLgWoru6oQfNljQg4UXTzN7xmfMNhvK++O1A6wvH5T91MRzuzKL/SK/1JsOcD
         lFeV6k8BH7HWSGIWo7oE/amCLrmr6huO46/i1F3O2VvDNCmSwrq1t0AUNQDSgewC0DsS
         XNfFylCMH+jjx6XaOjBks1gDw1Vs1a1+KVFYp7YevgiI0MYbzv7EhOQyLeOZd79YweJl
         /GmEy4Bo9nm2eMlMT2WbElJEmmJDelbxA2NlZf5clMlaJ5d7f/V5XJFqLzM2JrUgloer
         yr/yxL5aoNlxdtH2aBl6rFyhPO1L9Hch2YU+lVcqByuJEeF+LokaT6b2lTiqtUsU7kOr
         mPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720960; x=1753325760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yn7B+ipUVVRHb4W/hSV3THQ3JZ0KcrS1yG32M/2QnA=;
        b=AX4Gal5+KucVDcEEYbeV+rPzHgQueeSUfYzyf9Wxk0/oEK+odMbG12ySPCEU57u7jK
         xDAf7ANJbvjjgY0IvdhvLqz/mNQ7baWA43TM024c/0PWH1dRMtmPVjU/iE7dRBTN++z8
         wJ11sa2+yiUK5dk3HDlD+ArgEcK9vowdf+arHrRu5bACNOh18CM65relEOVWP1EGkmfQ
         8017Kq7/MNpRHXjoZ+SO6me1kElXYNdzgFtLmBeifarF/SoRzYLvfRECtk114wOB3Ea3
         3wJEcIrH0Za0NtTCvpZ7WZofJwO0eNtzk3NM4wp8QZpm2v68R6RCiZRGFwA1Mtc3WjZZ
         uHuQ==
X-Gm-Message-State: AOJu0YwqAk38B/2pyCCxij3D+xs/htt81chTtvI+FpyLELvPj/4e0p7Q
	nDjGIzvChVO4KYBgg4ch26JHyjwKeeDzyOD3tJfwMaYfCC3QJm38kMRuxNrCcw7khCyrQmq+oqH
	zdT5V
X-Gm-Gg: ASbGncs+HTO7PQZnVYIn2Hzy0v7VrXSLzAyG98tfx+P33BcBV2U/Y5bvi9m7VeVWKPK
	ccdHKTGnkJLZqw3NibP4ckScrHeNHgWYMiOyFPnniydLrW+4Od+52CPLq+5pc0CyYwSPnskk19q
	nRwD113d8gFbJaFXxkn7Zu495ogvtvkOF5ycP8hErwR6ZBcOex7qh8jV33OhSWbRox99Ug46ocb
	Ntrdmf2PVA6kML5sioPUPv6BjCT3cJj6uAQRngcjDp6Wtt6yewLPF5fRQfxCCb+NvHsb2hBd48G
	dibWxqF9fL2xaaQNqS50AOtqJgOrlEN0CGyIxLZZdrKTej8Vezg/1yXNyDesWMNAw/dccQ2vLcM
	eslySTCdhX7/cew==
X-Google-Smtp-Source: AGHT+IHaTGU27ruUiVjMK3C0Is7HSCFjPd+zmP02jLwDBZP2kfW9xKvmYZ3qfV3l4gqneo+BrxL7/w==
X-Received: by 2002:a17:90b:2684:b0:311:ff18:b84b with SMTP id 98e67ed59e1d1-31c9f47c7d7mr6363531a91.25.1752720959711;
        Wed, 16 Jul 2025 19:55:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.55.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:55:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/13] binutils: Fix CVE-2025-7546
Date: Wed, 16 Jul 2025 19:55:34 -0700
Message-ID: <2eea0b0132fd4bd4d66551a8cc6549480d8a29eb.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752720827.git.steve@sakoman.com>
References: <cover.1752720827.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220497

From: Yash Shinde <Yash.Shinde@windriver.com>

Report corrupted group section instead of trying to recover.

CVE: CVE-2025-7546
Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b]
PR  33050 [https://sourceware.org/bugzilla/show_bug.cgi?id=33050]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0018-CVE-2025-7546.patch         | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-7546.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 8a26fe76f1..32928ee167 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -44,5 +44,6 @@ SRC_URI = "\
      file://0016-CVE-2025-3198.patch \
      file://0018-CVE-2025-5245.patch \
      file://0019-CVE-2025-7545.patch \
+     file://0018-CVE-2025-7546.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-7546.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-7546.patch
new file mode 100644
index 0000000000..23c38091a2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-7546.patch
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


