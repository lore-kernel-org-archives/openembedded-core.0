Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2566ACF58EE
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:42:41 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17324.1763584944264759569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TrXgyWHQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so114333b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763584943; x=1764189743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZPHcZpLT6luHOe/6zG9Ndja3o9gYyrPcIIGwcbjloc=;
        b=TrXgyWHQq9Z1qGueCgvysmvNkT6IToKZaR5cFFj9s6cUQb1nBxOKExnrtTTQKjLkjb
         +imS33s9xWZc+Psz2itdZuppwtdRcHytnOrjBt87YenX61vzYnyWU6mnoOYM+1is6ok0
         VCAi+PuAcYxCRF+KmeilSKw5WedUMYMfhJyoCfA0hB/nTpUWJM7GQ5Lic4NTj2HzQGB1
         jIblk7KFJMYipMxrdDiyTMAvyShTmCImdQJvpWA3+x5RVd8bIA1Kn04EXIeOQvS+XMtL
         XVIBqEHaOS2/N6k1uFGFSF90grle5ZfNSc0urAXnSWENTxdvk+OnlAvE5+xfiw4O2SpG
         c6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763584943; x=1764189743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EZPHcZpLT6luHOe/6zG9Ndja3o9gYyrPcIIGwcbjloc=;
        b=WJ+/OEW+6LFpoTfKNCqyunEPqp4GbtplNNtlr3Fq1rcwrtHBLjFBIjITWeGAXwkGB9
         1aPdPJbCyw0kz+DJURJtpouiP7CsXljN6tuecHyxT4/w0b1RBbR+rfmmVtetL0RzMLy0
         mYOZo7F8LY42HmgezGSc8Jo/8ReZp6C+Nlo0GABbSEd3w1ej6CODd9NQtkteLKrzC/1k
         gLKnXwkTs/whSiXb+RriUGEQPqYIfcH1bXZHTPG56exlSAxM0ehWanoc9ChJFkL5L21p
         G2KHMi2uCPGXOUwbUK0bU5TyefGRWHP+SptyQl7yLo6DX9W42MrIJQZLr7oAtVaFAeAw
         Nt/g==
X-Gm-Message-State: AOJu0YwKeM4/KJjmp4mQB+VTFVKIwKKtO9FN6oiyyw8TvOW8k8pc95b6
	/8UzkcBPyoyko1YaAOtTqdl1MQlBALT9Y7zQBKewuI7XzR3v9/Z7JIwPMORzprF35HY0mdjBkop
	e9vVm
X-Gm-Gg: ASbGncspbQCtrcshxOSzP/6qzMdNzOqa+0b0sOfXjSrUlb6RsUzarPI6eSY5tDHgsR3
	b872TfigYNrmWodbUgPIqqMFdSq9EuvEBADh9g2yL1YTjAOxDebGgK4mHnsMKahsNrtForWfzXh
	gl8rMcJPuufAhwJQLUQquiwDvWi/9yq6dBENNOByvMhGbMtSonqwu7g8sKygMCkcicrUHfA/sO3
	CRQtNEOJg7ce8QsU53Z6JW9wzi38ZHP2IfqFvgxB2KW08Gtrog7gZum1bC6+9KnFyvw298I5d1O
	9chhG4bVIiw6FNANjfWJZoWppIUVVSFHVZPBGy3GfMeRSKK00cbtiLphyS9WsdRTC5KveRc9X4y
	wH5h37vCHnZA6o7eAYk+n7Im9YMLzbD5mj1RYe9vbVs5Ay4kJ9g0yup6TuBda+mvnBR0jZgCojc
	nW+8Iur9sbDq4y7u0+2/zP6yY=
X-Google-Smtp-Source: AGHT+IGOIGknt+XJfDRRLVrBKJeSJYqtqCHYBcHRBSTXJGNIOK2c/pgtUGqZgzzS0zw/tKy84UKqSA==
X-Received: by 2002:a05:6a00:1789:b0:7a2:882b:61b7 with SMTP id d2e1a72fcca58-7c3f12638f1mr501976b3a.32.1763584943445;
        Wed, 19 Nov 2025 12:42:23 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:95e8:2651:d6f9:404e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf7d5adsm269866b3a.11.2025.11.19.12.42.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:42:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/7] elfutils: Fix CVE-2025-1376
Date: Wed, 19 Nov 2025 12:42:09 -0800
Message-ID: <1126e5c1e63b876499c78ac403d1327645edf1c7.1763584791.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763584791.git.steve@sakoman.com>
References: <cover.1763584791.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226591

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability classified as problematic was found in GNU elfutils 0.192. This
vulnerability affects the function elf_strptr in the library /libelf/elf_strptr.c
of the component eu-strip. The manipulation leads to denial of service. It is
possible to launch the attack on the local host. The complexity of an attack is
rather high. The exploitation appears to be difficult. The exploit has been
disclosed to the public and may be used. The name of the patch is
b16f441cca0a4841050e3215a9f120a6d8aea918. It is recommended to apply a patch to
fix this issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-1376

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=commit;h=b16f441cca0a4841050e3215a9f120a6d8aea918

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.186.bb                |  1 +
 .../elfutils/files/CVE-2025-1376.patch        | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.186.bb b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
index b945766b75..9f0fb43d50 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.186.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch \
            file://CVE-2025-1352.patch \
            file://CVE-2025-1372.patch \
+           file://CVE-2025-1376.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch
new file mode 100644
index 0000000000..1f40add305
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch
@@ -0,0 +1,58 @@
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
+        * libelf/elf_strptr.c (elf_strptr): Check strscn->rawdata_base
+        is not NULL.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32672
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+CVE: CVE-2025-1376
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=b16f441cca0a4841050e3215a9f120a6d8aea918]
+
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
+2.40.0
+
-- 
2.43.0


