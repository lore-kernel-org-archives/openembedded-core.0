Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CD8C87FCF
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 20:04:52 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.66581.1753646690772737396
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 13:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AieK7Pez;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234b9dfb842so32796195ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 13:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753646690; x=1754251490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfTCVFmfKzMEkK8CF7HDZKVAXy/I6Eq9c+CC2uq2XZU=;
        b=AieK7PezBo+LUsgzdqEWqWTH6QkYx14SHmjOJwCr9KRD6oWozAUj61Zshe5r9Qpq5T
         ims/xuAFdbykA7uvuM2QNg6rpcxb66qF6e9qcrRR69p3OMUVbg49JDew+DFe43J0T3Ix
         Yy93XTfv/WtN4c4jtX7J05gupKXEFQqZtjyPjM7NwzEuCwv0EK5f7UB9wmLFS70IvA1/
         Mvon44n28kFM6vr9/HXR5fNjcPHmyBkYM46x93t/M40YiAeyTfju4ksK8eNvd8rVSXS2
         t1SfoNp8e0HpSeLJTikf4u+ZwRW+qk6gfW5PXpZfSUmlYNB+/2ed5NT8P+km05lrR5uh
         p7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753646690; x=1754251490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfTCVFmfKzMEkK8CF7HDZKVAXy/I6Eq9c+CC2uq2XZU=;
        b=JYpK8VvRV7SMyB+pM8Pq42tNNDaSYHO4KHCZXBertj0wKMPRgrZG4y29wMR7ClvN2E
         ZTtaYO0Y+cXzDFhXGt+9hZ6Y+m2bZ01j7Rxu1ii5WvlkBwHb80F3uTgKmxZ1B0Efj+LS
         tMn23rJxvtmxNTI7cYFcmYF8jTyWjepWp59dKDkl0qJSYHFjbDaGalcd5exrkvcNSoQQ
         uMZhmllWnMNomn4wY6Ry/geG9ve0EkEnHZsl0w+MuEM8xPUgAEcZmyAvJRPB/We+IcW/
         EuKBG96EqXDKBRMeThPChwpKIw9qtBidMkwOtQE7PtepEOmH8lHQrlzVmDqkFBM1aEW+
         UN/A==
X-Gm-Message-State: AOJu0YxMsdoYe1Twq62agD1EZ52NkWuLsLP6In15/muDdhL8A9Yoe6/S
	O4MPY0sZydfrLAU0BeZGPViScwreeRuEXIKe6l/X3aoH70nyfFI7sQehb6KPUXa6nLi2YONQOPX
	ww/gq/b8=
X-Gm-Gg: ASbGncsBmHtvMH9GjY7NiXmE234pTC7GwZSiXn5pe+x6XxpOv+psXtCYBCewddEIk2i
	gYjxphJ4gWE0B1BECXum4L8ZPKYVjVZ+MT0jPLmcxtSksM2MKpwGIekpmPKwaAZWcWh5MVjt/+a
	rSP+2KqmQ6iEogokkmFejXxc+8vyCA9qP6aZKw1BPAZSqJRlj87iFgsE/WC413X1KzWVQLpw2RG
	YEx2jhUvijGCY13xlX8ob91Isi0fQbFJ4HE58Xif2sYpnGq/94lI8IzanewD72noc9tzGlNLhKH
	lkjlTdZMMX+tLmgoj3tcX31aCIhTQq6Y/2dtPbA3GL7eH3kdZlA8lb7lwdpxhKgtnE9VetvYyH8
	ugwaHdMwSRgd1fw==
X-Google-Smtp-Source: AGHT+IGpPYQZMObz/N7+DSZ6W/Br0hdiXegDKVpcoWVWdn1u8Z6aCKGYqw9Uk+5n4X30T4S4lJPhBQ==
X-Received: by 2002:a17:902:ce12:b0:236:94ac:cc11 with SMTP id d9443c01a7336-23fb307c167mr139558435ad.7.1753646689757;
        Sun, 27 Jul 2025 13:04:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:22e3:7abf:ace0:e5ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe512ef7sm38905665ad.131.2025.07.27.13.04.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 13:04:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/10] binutils: Fix CVE-2025-7546
Date: Sun, 27 Jul 2025 13:04:33 -0700
Message-ID: <5860b954681c37ac6685631cce439fd349093689.1753646578.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753646578.git.steve@sakoman.com>
References: <cover.1753646578.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220972

From: Yash Shinde <Yash.Shinde@windriver.com>

Report corrupted group section instead of trying to recover.

CVE: CVE-2025-7546
Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b]
PR  33050 [https://sourceware.org/bugzilla/show_bug.cgi?id=33050]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0043-CVE-2025-7546.patch         | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7546.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index e25f52e171..4a460eb8d9 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -78,5 +78,6 @@ SRC_URI = "\
      file://0040-CVE-2025-1182.patch \
      file://0041-CVE-2025-5244.patch \
      file://0042-CVE-2025-5245.patch \
+     file://0043-CVE-2025-7546.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7546.patch b/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7546.patch
new file mode 100644
index 0000000000..da4dc3fb39
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7546.patch
@@ -0,0 +1,44 @@
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
+@@ -3611,8 +3611,18 @@
+ 	break;
+     }
+ 
++  /* We should always get here with loc == sec->contents + 4.  Return
++     an error for bogus SHT_GROUP sections.  */
+   loc -= 4;
+-  BFD_ASSERT (loc == sec->contents);
++  if (loc != sec->contents)
++    {
++     /* xgettext:c-format */
++      _bfd_error_handler (_("%pB: corrupted group section: `%pA'"),
++                         abfd, sec);
++      bfd_set_error (bfd_error_bad_value);
++      *failedptr = true;
++      return;
++    }
+ 
+   H_PUT_32 (abfd, sec->flags & SEC_LINK_ONCE ? GRP_COMDAT : 0, loc);
+ }
-- 
2.43.0


