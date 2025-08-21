Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E34CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:07 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.713.1755790806680727506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JmWtdVN3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b472fd93ad1so813657a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790806; x=1756395606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shsIpKcmewMoqGJgOrMRSXF89ur9LEnXG7BBVrT/INI=;
        b=JmWtdVN3Nrp6du9josCj+pwLI7KcSgNuaGxSnGUlNb5SldcHNHhDKnaWA7AV229w6/
         HbdI37GJUyCDDs0hvGwrV6XRSyvhjv/AooRx3BoYlTqkeeVaRq+Jw6DZQThBgYyxnhyB
         ssiCb4NB/tWhNX0VZ41S8IjHjd0eNepFgr2beX0oQfnsVkrUk/gP5LpuNA+2Hm3XTQ26
         /leYw6Lh+La+43aByCGPDaC2cMuFilVcYYaTHeWucFQCZQpcQC4i7D7y0oq+JaR/mJay
         KRdvswzyNH4hgQOp+Mt7AJh2EtP2xS6oixkhfcN3QUR+joFNwXCkeLRodS9Y/gTyjyzk
         WOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790806; x=1756395606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shsIpKcmewMoqGJgOrMRSXF89ur9LEnXG7BBVrT/INI=;
        b=MglOi5HWhJbd5f0pGjc/pq8lAgMe4gzLx+BdifNz5NqGDaNWuSM+0OKJ3ZkrONUeU3
         zkzu+I0hfRxkaM38+FoYJzaoTN9f50+FYtBiZWsXYMKmTcJ3Eicg7eM9tvxIxoZMppDe
         B0XFRFEOzw62Ufj7IR8VMQnwzKDINS5GDB96pI9zFfeSMoRGPaNxUgelodoYJEDZIyuP
         4z10XGfX9b9vkbsR2jUz4livRK7fRvO/8QszQAZa8Ikroa55iWhRfgtYqp1iL114nGZY
         DqIjuHKw7Mz10cJdARzjEDvKqkTNXg25Q/JecJU2e0/bKAGrQqi2zCGQSy7D4VtYmY4F
         +lLg==
X-Gm-Message-State: AOJu0YwnOcJ+KkK4O8xspFF92kOM11uK5F6qtHht7bTMEy+fiPts26wZ
	WZG7/ifTMMSyyS+iA2WY2/4xgRgv0zAoTGdxo1Rmp14jPLYhudSJSCBDxcQ9l/FN5GtHozqN9H0
	mAopt
X-Gm-Gg: ASbGncsSw2td3bmVJ9hgB+EqjDJ+i7UImB3TR5lgVxgzyEBRPFXfxVSEqYh2IXklcpg
	Yq70TTiBzW9PWHNfqerP1sor+ISBBQM3wBlQLbcw74M/ND90U0umNKbziWQnz3PbWkvRRn9Tzhn
	Nh2gBJCqqpMI5j19iiPw3Ns1kue8LPUFf+kOdPjOMgLQQedSq0EY8eDcWiJcV1N4bsAy2PeBgsc
	BnLsDjmAXoTCiDjrcOYgVASYdTmdLrf1MKdBI+ZmORJ2skwPWeFbKUWG2rr+hPpCvsIM9ikRZm8
	zNvwU/OoCcksYovGpSVq4O3LX9nP+KhOmO1qBcCTkEmg6lDSf55+/6cYlUli/NO2VPP+CWDCYzD
	x8j0jVvQEWEhHAA==
X-Google-Smtp-Source: AGHT+IHKNb+A7v6AszSs9PLMbcRH53wF1diDfGZwoTFkRvwmgwKIfdujgqILw3P8fziPwbF+fw0bfQ==
X-Received: by 2002:a17:903:240b:b0:234:aa9a:9e0f with SMTP id d9443c01a7336-245fec13c70mr46107875ad.23.1755790805733;
        Thu, 21 Aug 2025 08:40:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 02/15] elfutils: Fix CVE-2025-1365
Date: Thu, 21 Aug 2025 08:39:43 -0700
Message-ID: <deb03581745a0722e1a52a8d4ee63cdc863ad014.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222251

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability, which was classified as critical, was found in GNU elfutils
0.192. This affects the function process_symtab of the file readelf.c of the
component eu-readelf. The manipulation of the argument D/a leads to buffer
overflow. Local access is required to approach this attack. The exploit has
been disclosed to the public and may be used. The identifier of the patch is
5e5c0394d82c53e97750fe7b18023e6f84157b81. It is recommended to apply a patch
to fix this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-1365
https://ubuntu.com/security/CVE-2025-1365

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=commit;h=5e5c0394d82c53e97750fe7b18023e6f84157b81

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.192.bb                |   1 +
 .../elfutils/files/CVE-2025-1365.patch        | 152 ++++++++++++++++++
 2 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index 829d9bf94f..ff40ba64ec 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-config-eu.am-do-not-force-Werror.patch \
            file://0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch \
            file://CVE-2025-1352.patch \
+           file://CVE-2025-1365.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch
new file mode 100644
index 0000000000..b779685efd
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch
@@ -0,0 +1,152 @@
+From 5e5c0394d82c53e97750fe7b18023e6f84157b81 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sat, 8 Feb 2025 21:44:56 +0100
+Subject: [PATCH] libelf, readelf: Use validate_str also to check dynamic
+ symstr data
+
+When dynsym/str was read through eu-readelf --dynamic by readelf
+process_symtab the string data was not validated, possibly printing
+unallocated memory past the end of the symstr data. Fix this by
+turning the elf_strptr validate_str function into a generic
+lib/system.h helper function and use it in readelf to validate the
+strings before use.
+
+	* libelf/elf_strptr.c (validate_str): Remove to...
+	* lib/system.h (validate_str): ... here. Make inline, simplify
+	check and document.
+	* src/readelf.c (process_symtab): Use validate_str on symstr_data.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32654
+
+CVE: CVE-2025-1365
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=5e5c0394d82c53e97750fe7b18023e6f84157b81]
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ lib/system.h        | 27 +++++++++++++++++++++++++++
+ libelf/elf_strptr.c | 18 ------------------
+ src/readelf.c       | 18 +++++++++++++++---
+ 3 files changed, 42 insertions(+), 21 deletions(-)
+
+diff --git a/lib/system.h b/lib/system.h
+index 0db12d9..0698e5f 100644
+--- a/lib/system.h
++++ b/lib/system.h
+@@ -34,6 +34,7 @@
+ #include <config.h>
+ 
+ #include <errno.h>
++#include <stdbool.h>
+ #include <stddef.h>
+ #include <stdint.h>
+ #include <string.h>
+@@ -117,6 +118,32 @@ startswith (const char *str, const char *prefix)
+   return strncmp (str, prefix, strlen (prefix)) == 0;
+ }
+ 
++/* Return TRUE if STR[FROM] is a valid string with a zero terminator
++   at or before STR[TO - 1].  Note FROM is an index into the STR
++   array, while TO is the maximum size of the STR array.  This
++   function returns FALSE when TO is zero or FROM >= TO.  */
++static inline bool
++validate_str (const char *str, size_t from, size_t to)
++{
++#if HAVE_DECL_MEMRCHR
++  // Check end first, which is likely a zero terminator,
++  // to prevent function call
++  return (to > 0
++	  && (str[to - 1] == '\0'
++	      || (to > from
++		  && memrchr (&str[from], '\0', to - from - 1) != NULL)));
++#else
++  do {
++    if (to <= from)
++      return false;
++
++    to--;
++  } while (str[to]);
++
++  return true;
++#endif
++}
++
+ /* A special gettext function we use if the strings are too short.  */
+ #define sgettext(Str) \
+   ({ const char *__res = strrchr (_(Str), '|');			      \
+diff --git a/libelf/elf_strptr.c b/libelf/elf_strptr.c
+index 79a24d2..c5a94f8 100644
+--- a/libelf/elf_strptr.c
++++ b/libelf/elf_strptr.c
+@@ -53,24 +53,6 @@ get_zdata (Elf_Scn *strscn)
+   return zdata;
+ }
+ 
+-static bool validate_str (const char *str, size_t from, size_t to)
+-{
+-#if HAVE_DECL_MEMRCHR
+-  // Check end first, which is likely a zero terminator, to prevent function call
+-  return ((to > 0 && str[to - 1]  == '\0')
+-	  || (to - from > 0 && memrchr (&str[from], '\0', to - from - 1) != NULL));
+-#else
+-  do {
+-    if (to <= from)
+-      return false;
+-
+-    to--;
+-  } while (str[to]);
+-
+-  return true;
+-#endif
+-}
+-
+ char *
+ elf_strptr (Elf *elf, size_t idx, size_t offset)
+ {
+diff --git a/src/readelf.c b/src/readelf.c
+index 3e97b64..105cddf 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -2639,6 +2639,7 @@ process_symtab (Ebl *ebl, unsigned int nsyms, Elf64_Word idx,
+       char typebuf[64];
+       char bindbuf[64];
+       char scnbuf[64];
++      const char *sym_name;
+       Elf32_Word xndx;
+       GElf_Sym sym_mem;
+       GElf_Sym *sym
+@@ -2650,6 +2651,19 @@ process_symtab (Ebl *ebl, unsigned int nsyms, Elf64_Word idx,
+       /* Determine the real section index.  */
+       if (likely (sym->st_shndx != SHN_XINDEX))
+         xndx = sym->st_shndx;
++      if (use_dynamic_segment == true)
++	{
++	  if (validate_str (symstr_data->d_buf, sym->st_name,
++			    symstr_data->d_size))
++	    sym_name = (char *)symstr_data->d_buf + sym->st_name;
++	  else
++	    sym_name = NULL;
++	}
++      else
++	sym_name = elf_strptr (ebl->elf, idx, sym->st_name);
++
++      if (sym_name == NULL)
++	sym_name = "???";
+ 
+       printf (_ ("\
+ %5u: %0*" PRIx64 " %6" PRId64 " %-7s %-6s %-9s %6s %s"),
+@@ -2662,9 +2676,7 @@ process_symtab (Ebl *ebl, unsigned int nsyms, Elf64_Word idx,
+               get_visibility_type (GELF_ST_VISIBILITY (sym->st_other)),
+               ebl_section_name (ebl, sym->st_shndx, xndx, scnbuf,
+                                 sizeof (scnbuf), NULL, shnum),
+-              use_dynamic_segment == true
+-                  ? (char *)symstr_data->d_buf + sym->st_name
+-                  : elf_strptr (ebl->elf, idx, sym->st_name));
++              sym_name);
+ 
+       if (versym_data != NULL)
+         {
+-- 
+2.43.2
+
-- 
2.43.0


