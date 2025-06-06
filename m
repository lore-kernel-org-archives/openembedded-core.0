Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BEFC71132
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:33 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.37093.1749225631580983730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TBcNOEgW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74264d1832eso2611548b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225631; x=1749830431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9OCYToRw7fBWToI9kTtJW5HVk0ZpFGx9WoUIuxXf4c=;
        b=TBcNOEgWKZdV7umwdPesLcOW0zzdf02jzYGjEgVhL8coiSUpObTDPU+uiK0+xNboNV
         T+rEdrHhJfwHs7R2S23dAojOpfxpiq+ZBR9UvOLSKDzopkdkGshqDJqORzfGNpS1RlIw
         fKrFjxudqgE7zaKAOjWpQoQ8ru/qmOOi8iJ/JQzzaUHEhv1SrYDe1PzsxcZqlN8B58Ac
         WVFL4ZdVdNuFzTfjhGWf1FvOevkr5tm0982c8rzrAX04wx2VUZG/CdDAZFWSXHuSxYFS
         DU5bSp3hR6owR14Zor24VQ/3vP276Dj/gwTahUd1hD7OhTOXkz2oN4gciu4T0C1U1pOJ
         iUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225631; x=1749830431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9OCYToRw7fBWToI9kTtJW5HVk0ZpFGx9WoUIuxXf4c=;
        b=CadWcPCjRXraxzgyDrSaX42vCkxlUDDX7wDis4npMaFq7wxuqrepR7E+6yuM5j0N8+
         nwXPrL+7YI5bqwHT7Xy+O/nWyntdT1g8a0u80hJibE32uS08KdWMe1eWMFWG07OcjEKc
         T5vmU22fTkOv7GbSKV4Qi7AkayqLECybG/3MvnvoZA9d3vkn0DFIb8xwf1cMS77lVzhN
         agho1xIIQUlpdkdZ5c5MSO2xA3U5jlMKJqlTnYME1sMiMyzC9NFH8K+EuPUui9+/gujN
         bUxtqUPQihuxlE2q8qkZrLn6eIydvn1QfM7ucQ68GOa42Lh3XGvoxJg+Xu2ZuF0Dlxj8
         +G/g==
X-Gm-Message-State: AOJu0YxpUjZM/bTglYrekkveHtMKv87XQG334hGINemwYS0PeLud8XFN
	Iwnt/FmJsCpW5c8hdstYgn+JsrCExTtMv9pE25aHAAS/dAIAEJzmCcgrU1BXB5nQiztxKwDDGtb
	ZDHfB
X-Gm-Gg: ASbGncuIXhErZdd37K6rPpndg1PVYW8h+HYhrPP4skA7DvfJ5WB6yooFY0ADpqrVZYq
	GJcTqQoLV7B8RHHnelS5i+8S91Glt7suiXpgKktqpSAhfTau7WQivjQTF1iYiSmJn4FJ3cgLbFQ
	fHA4WJ79DoptsWdJiyufBZXebrwbSw5py7kWX78w69yj+usnuL5ZL36iXcsdwHhUudCwSIb8BTP
	1BhY+kTrnOG8pUGw4lrepHA8jU/rK59W/tLhIcOk8oMY+bfuF8J50kiC9VxEZPl9+e6hQYmdA0e
	aeG/HNyz9Vbx0zi9La1K27KkoiZJM9iVpVElrqDQ2ja5k0VjHei2Tw==
X-Google-Smtp-Source: AGHT+IFrVt3/vHTKE6J3PetM1p6i4YTvDru7FuEo/du5YSp32DvSBqdYgGB/QItDBX3g0yYnUE81dg==
X-Received: by 2002:a05:6a00:2e9a:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-74827e7384dmr5565353b3a.6.1749225630515;
        Fri, 06 Jun 2025 09:00:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/12] binutils: Fix CVE-2025-5245
Date: Fri,  6 Jun 2025 09:00:01 -0700
Message-ID: <8202e66670327b02ec3de18b5af4a8b09abdc50d.1749225418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749225417.git.steve@sakoman.com>
References: <cover.1749225417.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218170

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32829, SEGV on objdump function debug_type_samep
u.kenum is always non-NULL, see debug_make_enum_type.

Backport a patch from upstream to fix CVE-2025-5245
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0022-CVE-2025-5245.patch         | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5245.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 16db8bc05e..c6fec579ae 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -51,5 +51,6 @@ SRC_URI = "\
      file://0021-CVE-2025-1153-3.patch \
      file://CVE-2025-1179-pre.patch \
      file://CVE-2025-1179.patch \
+     file://0022-CVE-2025-5245.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5245.patch b/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5245.patch
new file mode 100644
index 0000000000..d4b7d55966
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5245.patch
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


