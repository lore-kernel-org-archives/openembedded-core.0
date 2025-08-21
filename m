Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CF7CA0FE2
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:17 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.704.1755790811647906811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EmDhA2uQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4761f281a7so773152a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790811; x=1756395611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nR4h0xtdj+RAZGGvKIh2Q2AxbSK8nv9NR3eq9e1Acfc=;
        b=EmDhA2uQPBYhrAAF/sujJuWtaG3rEIQu0hTkmuGHViydMT4vNkq3lIT6Gav+yJfHAU
         aDYOmel/lzYs1yGhLTRyqmr5aCAlhAG9fybIA50jKr//C3TKKiO0jtSd7jIS/5qxk3Ra
         sQg2jYqcUqZzZ/kbL6T5vtCAqLBp0ywI77sRGRbtp/KCORmVXH9OdmrCKctT2Cq7Jozt
         kynMYnNAnsj2WNy+KLib0FhlFPsHXbPzjjYcoBTfxGeHnfWlW9nR8n60VAhf2xeUSQyi
         jz0WTO2BDhvViGVWqVoqDHkOxMN1Z5sGHNGxYkXVlWd38FtlnSwhDk8xSo7H4QFeHPDC
         3Dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790811; x=1756395611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR4h0xtdj+RAZGGvKIh2Q2AxbSK8nv9NR3eq9e1Acfc=;
        b=T6MZmmmMEkN+J3HaMvlpGKYnUVMc4p1kgm4QcZI2MeP5fbMy84+TYWDNZVdHm0Chlc
         kyuINplNwYnoIfoSuxSAHmsbhNHVVFmBB63GT925jvW1HypnWLuoyesrR8Anh5nDUNo8
         koqnqvBwGcm8OaP+09CL2L0smfzJ/aZc64+1wlL6NoLJItEe/pS/fjxpHx9FWvNqmV3S
         BHNtPqyOuk216AQL7PxeaCtjB1sNrsqVDs4wLe6uhkJh76Zczzmdexkn9X4BkKlWD7Ac
         KuD5dkJRmLbCLxNK/FLBPZKnMaWkqkCY6zshB7vftn3ASUGccNIenOxeA6SRHopegUAH
         QApg==
X-Gm-Message-State: AOJu0YygNTxrt9vWX03jVsMusjqRrkpuDj1gbZ4Slptq1yR3j0w/UYVC
	xTNBchNB9nVhY9oDf+eCNjk2ywWAWwdCZr5rlxnzQU/NvYVbeL5JpkWB/7TaHzAy/ift8cy4fIB
	MV/uD
X-Gm-Gg: ASbGncuMwzkjeZlW8P7gizNX8ihpNoaNrhaVs/+azBEPmzRGle2Y4FhuIMSlgAfwOUZ
	kLRKUiOztoaOwZyO5Bp2gz0WHa5wIRLjGaZogc6GqP7eAhNw13MT7+dljvl2DaLluQXH7cZpaY2
	HdY5eb4sou9Xw3zkHFxf5z79Y7gpaobDevify3ehjEj5tqWM9TnT8k6bQ2o7xmnMi5CunyP4hot
	qj2FO7b2MTjOYD3kPbyBd1zJEqGMky5Q9+xqXGouXa4wy/C3NtQj30TJY8Pajs0WCuJowCnp6iF
	jOSit/POgCD4eVHBAnca+AA+ozvPyQ9I68M6gA6PHlJJP1nLfimtXnlnVzsWtRSbBAJuhh2B90P
	LjJmFHu8h3bVD3Q==
X-Google-Smtp-Source: AGHT+IEEJ+icHe9oSr9XAvPHIctqwboqNadbYimm/5pX8hbFjOxgJkMQ3YY8DIbjWpZ6MWnpP0sLPQ==
X-Received: by 2002:a17:902:d4cd:b0:240:86b2:aeb6 with SMTP id d9443c01a7336-245fed9b4bbmr43164725ad.26.1755790810159;
        Thu, 21 Aug 2025 08:40:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/15] elfutils: Fix CVE-2025-1376
Date: Thu, 21 Aug 2025 08:39:46 -0700
Message-ID: <603881e34e3bbb7435f0ae91553036eef7f1cb06.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222254

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability classified as problematic was found in GNU elfutils 0.192.
This vulnerability affects the function elf_strptr in the library /libelf/elf_strptr.c
of the component eu-strip. The manipulation leads to denial of service. It is possible
to launch the attack on the local host. The complexity of an attack is rather high. The
exploitation appears to be difficult. The exploit has been disclosed to the public and
may be used. The name of the patch is b16f441cca0a4841050e3215a9f120a6d8aea918. It is
recommended to apply a patch to fix this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-1376
https://ubuntu.com/security/CVE-2025-1376

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=commit;h=b16f441cca0a4841050e3215a9f120a6d8aea918

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.192.bb                |  1 +
 .../elfutils/files/CVE-2025-1376.patch        | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index 4dcc774bb9..f8cf083ec6 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1365.patch \
            file://CVE-2025-1371.patch \
            file://CVE-2025-1372.patch \
+           file://CVE-2025-1376.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch
new file mode 100644
index 0000000000..ebffb2bd72
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch
@@ -0,0 +1,57 @@
+From b16f441cca0a4841050e3215a9f120a6d8aea918 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 13 Feb 2025 00:02:32 +0100
+Subject: [PATCH] libelf: Handle elf_strptr on section without any data
+
+In the unlikely situation that elf_strptr was called on a section with
+sh_size already set, but that doesn't have any data yet we could crash
+trying to verify the string to return.
+
+This could happen for example when a new section was created with
+elf_newscn, but no data having been added yet.
+
+	* libelf/elf_strptr.c (elf_strptr): Check strscn->rawdata_base
+	is not NULL.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32672
+
+CVE: CVE-2025-1376
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=b16f441cca0a4841050e3215a9f120a6d8aea918]
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ libelf/elf_strptr.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/libelf/elf_strptr.c b/libelf/elf_strptr.c
+index c5a94f8..7be7f5e 100644
+--- a/libelf/elf_strptr.c
++++ b/libelf/elf_strptr.c
+@@ -1,5 +1,6 @@
+ /* Return string pointer from string section.
+    Copyright (C) 1998-2002, 2004, 2008, 2009, 2015 Red Hat, Inc.
++   Copyright (C) 2025 Mark J. Wielaard <mark@klomp.org>
+    This file is part of elfutils.
+    Contributed by Ulrich Drepper <drepper@redhat.com>, 1998.
+ 
+@@ -183,9 +184,12 @@ elf_strptr (Elf *elf, size_t idx, size_t offset)
+       // initialized yet (when data_read is zero). So we cannot just
+       // look at the rawdata.d.d_size.
+ 
+-      /* Make sure the string is NUL terminated.  Start from the end,
+-	 which very likely is a NUL char.  */
+-      if (likely (validate_str (strscn->rawdata_base, offset, sh_size)))
++      /* First check there actually is any data.  This could be a new
++         section which hasn't had any data set yet.  Then make sure
++         the string is at a valid offset and NUL terminated.  */
++      if (unlikely (strscn->rawdata_base == NULL))
++	__libelf_seterrno (ELF_E_INVALID_SECTION);
++      else if (likely (validate_str (strscn->rawdata_base, offset, sh_size)))
+ 	result = &strscn->rawdata_base[offset];
+       else
+ 	__libelf_seterrno (ELF_E_INVALID_INDEX);
+-- 
+2.43.2
+
-- 
2.43.0


