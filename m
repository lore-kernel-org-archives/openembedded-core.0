Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D09CC61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:39:00 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.96546.1749584336140845357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ur/tFpKS;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.47, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso59500896d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584335; x=1750189135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j25uhpM+ozHWS7bBQiXm2G1PecwmdEFSnLdjkldDgX8=;
        b=ur/tFpKSCz6s8J255Oe9u4objQds01PfBWH1SZVs2di74m5DdP8U8yrKaUepHDlTuY
         tDHu1RmZsjukMy4qHYw7quXLKtlJmlseh5qcSHmUiZc57RNc/LFbXQ98wjOvqMEV7D4/
         N4V5TQaA/68OA1j7f1ELZNlKna9NeoZx944bB62E5kxiRp5IzntJOB/+hWnAhbhiXdRC
         zCaGNYzjDw2uN8cQuxO+hXs8qpVUvilaTShic3OHfGRj1V2YZToBtQO52GfRQhR9A/6k
         g56Blbs2HvtTAd26vDL77RxYpf4qut6kmhC8casUMWkDcQhbFzihdNROLz9PB9CUMXwF
         fk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584335; x=1750189135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j25uhpM+ozHWS7bBQiXm2G1PecwmdEFSnLdjkldDgX8=;
        b=G7CmK4xanskq/j52aeE0gUWW+oe5rg7+36N2A0WerrHGmyPecs42Wi7yJsMqltiGqo
         6KyZzTO/pK6WWyCLvBfCO+0sXE/P/B8ouB+gQDxGFtnfEQPnLlXB+LI81oTZcEgxQ1+g
         93EnKZhMZY4ladlZW940w5t+WKXwXBMqVxk7ke2VB+eRo1inSNjjBihArZyTukmpsQNN
         tKO3x/G2EHhr0+H7bq38YtIg1z1TAZ7JJXSgGoSXC+Cc6ncVur3D8g/lpMnId2PUGUN2
         eLHIrQLGIGpdYhy+IlPX8JgyysT4HdEXHS4nTj6ZfvH8cSC9XYIvunWSCFRZK53Mr6tC
         jjSQ==
X-Gm-Message-State: AOJu0YydWioK/I1MuOmgKbaysWPB7LOvWknLGZQoNLDgyn3TNUzK/Hzj
	AAPRtrJTy/1jfaHIiPw+2m5zETmX1HOxIOTFHUtvL9t6gHiO5owS0tuN1EP+Ba6ZRHBytTpvIxs
	xiv3H
X-Gm-Gg: ASbGnctAx9k/Kkusqy3xR+nRA2CiNFGjSZ/jiDJntGo65KT1mc2ud/Pxr8/5CLcrS2c
	bco1Lm5Tz/QaK+ji+/u5RDimt7gTj28GXNMqn7uKILusXz4wgoRvjhBBwKJNJxEn1BbIeSTuuwt
	yj3x1AzcZi1AbYuf6Aa1hp5Ix7gGSeyyKGkJsb9L0d7VDjeG+RN/9L9V+x96K6djCaYDOACl+Vx
	Dv+7ypSreL2Hae0YGyUUJJUf9cuXyfVp8cIqVYd1YY9Txpnnn7CFtFyIe4L3DVszPkeo9S1GVcY
	81r9PL9CDq8qGDViXCFRFtgIoEI/btv6ssT62Cjk+E0PAA9Yl0nvJw==
X-Google-Smtp-Source: AGHT+IH/+Q0/HnYYciOROmbG//ORkgSPgK/mvAYDZH2uYmYIVIbXNoqM5uYZ0f6lHWAi0dIQasJfwg==
X-Received: by 2002:a05:6a20:12c6:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-21f867441e9mr1153299637.35.1749584323728;
        Tue, 10 Jun 2025 12:38:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/15] binutils: Fix CVE-2025-5244 & CVE-2025-5245
Date: Tue, 10 Jun 2025 12:38:16 -0700
Message-ID: <7eb29f802b272dec19c5bfdce93155d99bac918d.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218437

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32858 ld segfault on fuzzed object
We missed one place where it is necessary to check for empty groups.

PR32829, SEGV on objdump function debug_type_samep
u.kenum is always non-NULL, see debug_make_enum_type.

Upstream-Status: Backport
[https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]
&& [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  2 +
 .../binutils/0041-CVE-2025-5244.patch         | 25 ++++++++++++
 .../binutils/0042-CVE-2025-5245.patch         | 38 +++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0042-CVE-2025-5245.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 085ca2301e..f1c29015bc 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -76,5 +76,7 @@ SRC_URI = "\
      file://0039-CVE-2025-1178.patch \
      file://0040-CVE-2025-1180.patch \
      file://0040-CVE-2025-1182.patch \
+     file://0041-CVE-2025-5244.patch \
+     file://0042-CVE-2025-5245.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch b/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch
new file mode 100644
index 0000000000..e8855a4b4b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch
@@ -0,0 +1,25 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 10 Apr 2025 19:41:49 +0930
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]
+CVE: CVE-2025-5244
+
+PR32858 ld segfault on fuzzed object
+We missed one place where it is necessary to check for empty groups.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index a76e8e38da7..549b7b7dd92 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14408,7 +14408,8 @@ elf_gc_sweep (bfd *abfd, struct bfd_link_info *info)
+ 	  if (o->flags & SEC_GROUP)
+ 	    {
+ 	      asection *first = elf_next_in_group (o);
+-	      o->gc_mark = first->gc_mark;
++	      if (first != NULL)
++		o->gc_mark = first->gc_mark;
+ 	    }
+ 
+ 	  if (o->gc_mark)
diff --git a/meta/recipes-devtools/binutils/binutils/0042-CVE-2025-5245.patch b/meta/recipes-devtools/binutils/binutils/0042-CVE-2025-5245.patch
new file mode 100644
index 0000000000..2de6abbe93
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0042-CVE-2025-5245.patch
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
+@@ -3098,9 +3095,9 @@ debug_type_samep (struct debug_handle *info, struct debug_type_s *t1,
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


