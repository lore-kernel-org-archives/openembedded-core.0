Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FEECCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 13:46:38 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.12195.1761659191751676720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 06:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OZJ56b3s;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so74195615ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 06:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761659191; x=1762263991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1rMHSk4Ma1+JajQNBZTOLetMgu49V0nmrUIl005LEI=;
        b=OZJ56b3s8RrbiIPNnpZO/nNGrW6n8nuCTlYiWDJdqlp3Kn5nMX6r5Se+BABh3KdqsR
         sg7k0mRwjA844GCsGiRxUMe6/IWZ1rdGCWCVAe4W6+a0NY9uUpONqQ4BKGC/iq89OBuY
         73xHqnQ7Kn08bV2hz3c3LXp/5dAKpy32Kdt+iC4O1lSebpAFX1Uazqyq4eZ1AuQtR2+7
         +Gwrp5VyOauqW8UQROJy2py8Q8dtKp7+PtloJNHYCPnPb30lOZUBag0lM2SIvZrQ9Mb5
         kKofN425eLfbPoHFtJsHmItyyWwG7bH8PpBujMnPRe6m4aCwUWsia4lpHr0TT3gIjBeZ
         dinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761659191; x=1762263991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1rMHSk4Ma1+JajQNBZTOLetMgu49V0nmrUIl005LEI=;
        b=ZyuALGszo2R5bnxnzR1IKlQoxHmKzUigLoKda429UNdq13TjKUdWOFwoLUkdnIwu2q
         EaB2JZE2dYfCSrkOtahETepN49DylEC9zCje4Iv9a3Zo7LdX0XjKcR6e3P4I1iRrrPmk
         gEtuabX7qyQo1iX33xwGv6J4SdOoqeTmczs6J2iMnQertqLKNFkKOJcrx/a1A2h+e87M
         yYULyIQ6rwGf988FzG9TkK/CpbDIAy5/tJoO7KTxFrYmTdaZQbLvSOGI1Ezfp7iI7kgf
         sEI1Xfzn/0b+DAB1LJ1nC06wm9NhMhdsgFNc7mCP5QQqZ1S+lIIsb+0J2dpDcwaLJO4I
         qrRA==
X-Gm-Message-State: AOJu0Yxe2TOExTMHLVzop7U3TjYhp9YGsiptyGAnv2TqzHMBdQ3RHkTG
	x2LerWpJCneUuf4QN0s4pwW4MifSjPab4/iFITIvPA8cNLNQjwup62/jzbna6xZw3uT2yFsn2nd
	acwoT3NU=
X-Gm-Gg: ASbGncvy+iAB0tU9LaaqErtthyqoq23jMS02lMvnVa5/ZO5Sg5dHM2Cw72ghkyI7oAr
	Phu8TL4QfHtPKrxAFZSFy6gLzTUs6lWd60uA6Q5osWEu8ay9BWc8d/wERHu66WGB8sWvBU+NQOh
	/FXeEohOWK+v/G3Hd2LoCB+JVQyvFlgKvFokioakjPaxj0J9zBSHNUHy7GSuKlWT4xb2dMKxf4/
	nq3T6Rw/TV6qOOiUxE70HNaW1qFq9IRE0mwjeCXfmX+q1K2upkwsf1+IJzxc+6IMiUuD9f50Gok
	rnFuwZO4iJjIJfJAA0i5/LyOsoiiEBH6tULNCcH+6wfSqjEdHOCdni4/eTah4jzu2u5bK+tnuyM
	q3VOIGN5ZQn5G0Y14vkj3BWFkfWJTrzbLvlZjYCXuRAe1JnhJOkkRE0NPdz0EEtNCe9g=
X-Google-Smtp-Source: AGHT+IHG9VSALHQDEzwG9ldyMN2mbBY7CA5tpqaS+j/FKUGsojpjvxJ0ByFzhKIafDk6NMmvrImHkQ==
X-Received: by 2002:a17:903:1c8:b0:25b:a5fc:8664 with SMTP id d9443c01a7336-294cb687028mr44321815ad.51.1761659190732;
        Tue, 28 Oct 2025 06:46:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a7esm119894605ad.70.2025.10.28.06.46.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 06:46:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/8] elfutils: Fix CVE-2025-1376
Date: Tue, 28 Oct 2025 06:46:13 -0700
Message-ID: <06e3cd0891f553b0ed036d9247dfa7c5ed814d78.1761596406.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761596406.git.steve@sakoman.com>
References: <cover.1761596406.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 13:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225402

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
 .../elfutils/elfutils_0.191.bb                |  1 +
 .../elfutils/files/CVE-2025-1376.patch        | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index fcb91e41aa..c5f357eb93 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1372.patch \
            file://CVE-2025-1371.patch \
            file://0007-Fix-build-with-gcc-15.patch \
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


