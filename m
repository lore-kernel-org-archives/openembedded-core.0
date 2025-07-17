Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AF8C83F39
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:56:01 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.40204.1752720956479655954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bA7Xy/DW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso488756a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720956; x=1753325756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pT+W0otcHeJNjxjuBelL5w7QFHljY/9EyqXFp4mOGG0=;
        b=bA7Xy/DWWq6rTkRbdr/3MoDjXkATieHTprOPr5nwVVg+PlwNI+h82LPqVQj3zTKldz
         77z45MFXFmLeL0BzqdY0Ss2Qp4SBPgg6Ce7gyrvoFMiRq0BsmtG4ZzihsgY+644WXRu6
         mbVkvboVLcB0+wREkE6CQM6uD81We8F5VkirCFIibMI3oH5+q5lODOu7ny/PzLgURL9Y
         I7R5I6zoKXpyBrr0OGZYeu2d2YTMgSPZBODiffDJ54wMPTkE5jvAgSI1vELiLxPAFYNA
         AmKDzphJUnJcSMSrvi7DvQA60gPa6oz+wYjhQ1hv8HEFJNzp7/tsxEG0Seo4ChrccASo
         QOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720956; x=1753325756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT+W0otcHeJNjxjuBelL5w7QFHljY/9EyqXFp4mOGG0=;
        b=DVFioIqNpiPazkiMfgz8Wub6d1LXCPaQJxBLhJnzlmD7xv9PZ9qIseNv6jtPJN2xVz
         lPWhe5QTiX7ZhWIyMKsWvj+pdYbZ+g7yhbBJoWI3Rh1RbcX7cm9ret2WA4z7Bfq6Z4qA
         Tbq0Tt4XCPXLACMptJ2wMXnOq6ZvOsIydq5wAmhnSH5zLMb16FhyUx4yXi1MzdK/6TY6
         uHgRYSJ1cHAXRd4hcvtOiGs38FrqaX4pB6PQ+ApZlB7u3DRcnosBd6CKBR09tpRINeaJ
         CcP7h/CZYQRdwi43O2Tc5YArS7WniTTtRHpOvsQDRPdd4zcQS8VUSRGsGTuWoYsmzc3X
         zW/Q==
X-Gm-Message-State: AOJu0Yytp1yQGGuRI5Grl2dwhpSorfH9hsLmCsIhps9fTX9BDMgT8Xdg
	hLEJCZEIdylOddjSnK6SPLKbKBoj5Z5zXtmWfcnVjjlBTIWBSb7X6O+uNRaPlnoWWdI8rsgsWXU
	mFTQI
X-Gm-Gg: ASbGncscpjT7x7hpruB9WhZwtIdXFehdWbmP1GgwO/76yH8DT2hyBZFNoX+E17PhqRk
	VBF2fRZR3JxA0l5UZ2c5AHWekyU8HoAjOXWgnqZQNN5vYZufktKpgqi+CfExpi6cCFWjRUcMAQW
	cmxhQp4bnoyp73BEthwe9Jm057qzGxfR/vM361GuZIbM8Z2bbvbdpUO2aiqR/sCD4bmqIUOhdxo
	5l6pHUf8gJqz4aE7FVGW59wPCMHckZxcwRwrZtBnx+mtATs4UAhG9y33R3c0XxgFUsXGGBq1fFy
	bexcOMKUxfV0dgm6VkqkMRKQ/Fh/OM3UHY1qkKiEydpnMimDzZ956Q1ASsTxpNvhn/PswLEtVFK
	p2e2ylHr8rNzcfw==
X-Google-Smtp-Source: AGHT+IEwvZY/UWyahlr6ZeXHUKFAR5aAqClrF25hE6TOS5hyggO5uy0QzzUjWcHq3pBH+xLLo0T7UQ==
X-Received: by 2002:a17:90b:4985:b0:312:25dd:1c99 with SMTP id 98e67ed59e1d1-31c9f45e1d0mr6767733a91.19.1752720955688;
        Wed, 16 Jul 2025 19:55:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.55.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:55:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 09/13] binutils: Fix CVE-2025-5245
Date: Wed, 16 Jul 2025 19:55:32 -0700
Message-ID: <ad946d34d1a4536b0431cb74ce29b47a0367b0ae.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752720827.git.steve@sakoman.com>
References: <cover.1752720827.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220495

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32829, SEGV on objdump function debug_type_samep
u.kenum is always non-NULL, see debug_make_enum_type.

Backport a patch from upstream to fix CVE-2025-5245
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0018-CVE-2025-5245.patch         | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 8855fa709a..0f0befe30e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -42,5 +42,6 @@ SRC_URI = "\
      file://0017-CVE-2025-1181-2.patch \
      file://0016-CVE-2025-5244.patch \
      file://0016-CVE-2025-3198.patch \
+     file://0018-CVE-2025-5245.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch
new file mode 100644
index 0000000000..d4b7d55966
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch
@@ -0,0 +1,38 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 1 Apr 2025 22:36:54 +1030
+
+PR32829, SEGV on objdump function debug_type_samep
+u.kenum is always non-NULL, see debug_make_enum_type.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]
+CVE: CVE-2025-5245
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/debug.c b/binutils/debug.c
+index dcc8ccde..465b18e7 100644
+--- a/binutils/debug.c
++++ b/binutils/debug.c
+@@ -2554,9 +2554,6 @@ debug_write_type (struct debug_handle *info,
+     case DEBUG_KIND_UNION_CLASS:
+       return debug_write_class_type (info, fns, fhandle, type, tag);
+     case DEBUG_KIND_ENUM:
+-      if (type->u.kenum == NULL)
+-	return (*fns->enum_type) (fhandle, tag, (const char **) NULL,
+-				  (bfd_signed_vma *) NULL);
+       return (*fns->enum_type) (fhandle, tag, type->u.kenum->names,
+ 				type->u.kenum->values);
+     case DEBUG_KIND_POINTER:
+@@ -3097,9 +3094,9 @@ debug_type_samep (struct debug_handle *info, struct debug_type_s *t1,
+       break;
+ 
+     case DEBUG_KIND_ENUM:
+-      if (t1->u.kenum == NULL)
+-	ret = t2->u.kenum == NULL;
+-      else if (t2->u.kenum == NULL)
++      if (t1->u.kenum->names == NULL)
++	ret = t2->u.kenum->names == NULL;
++      else if (t2->u.kenum->names == NULL)
+ 	ret = false;
+       else
+ 	{
-- 
2.43.0


