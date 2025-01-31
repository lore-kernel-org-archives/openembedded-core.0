Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDB5C02192
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 14:15:51 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.19654.1738332941489366425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 06:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iZUTOZ0h;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21c2f1b610dso46501325ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 06:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738332941; x=1738937741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=941Sk92cd9aks85ZHn+IEpAE1zFMbO+RpeqS4DCmU2k=;
        b=iZUTOZ0hQJBNzxEUhgF/r7sJiIhSFplzr+6gG907h3eNgUtIOC+jPYm6wWUIDBQA/X
         UdK/7CPmkd7sTo/j3V+auDbrrvzXWt8cK7H8zSk42fTSPs80HAFS9aaK68bpaBz3tYd/
         /mkG6U6bd1dZSMHQjY6hvQiLC+dsCwtIghLlqcGC54IpTvHVu800/dD1IjCzhB4RQwdI
         NGcD0BjiJ/EYMRkjMFKgjfXwjhQuHSGrruxzQx3565kjFo1/S2GcMQZ+Zx0SiOweIkiC
         HDYm85pBMb5yK/AWLDkYDPSBFHId6YqTJauPZWtnde8JO3tqXmIJdho8GdFXKeNDYNvw
         Gf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738332941; x=1738937741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=941Sk92cd9aks85ZHn+IEpAE1zFMbO+RpeqS4DCmU2k=;
        b=FGwiSvlq0DQ5SBQyjOZBz7SH7ZHVrWIPO4eXFDRbA/UzGXVqOgDPn6mGZI3rlKgtZc
         YLX0FnAU737Tz/jBfv92HPN5b+Htvi1pWgygkUR0GsPEPSyGhzvC/diUP8TK8JyOPJia
         vGiBdNYvU6tQfdybnoS9A8PcwklIgE4tKdjpMFd0xYvRKSBDI+hj5MfZh/44K+4mnoVB
         gkOOcp9RRuBczlkS3BAUV48VbYo4uBVy/IDpNgjbNcRYnbT81gB8phYlld3FyCmRGkEb
         AJmB9t3gVty/t1d6H+CS0zqgUOqFjZjKbw22VwaX8BVGsXvu0Uzuymf4qxUdnV8jQDIO
         hr1Q==
X-Gm-Message-State: AOJu0YzsT75k9oI+dEZMBgyfmAH0bTh3WjjnPFSQitzBrs3ECtbBfyIH
	CYrP0hIoVcyYyBoUyOctQgD1Do2AJkWPbQp3+P7Vu+E7W93P9bWB3L4aAXXl7CRUfs5/CvFaZpA
	Og9k=
X-Gm-Gg: ASbGncvgIjP4tkvZHuYHxu40xkYSusNjVXT+Yk/ZBGp2mTEO9P/4Rqsfd7RG2Z9VhRS
	5to71yjfATNsySYqQWEpSv8VhpjIDoPIGc3YALDKLo+56pKJuiduMw6a30y4o8u+TvP30xoYJ2v
	YsYNmhgK2hbyn/UpMN/RUkZKGVZA9Qr4q61C71Jw0E7IM/Jq40Cl026uIjka//1DQ0PGY2BZdjD
	XZanAiENzBp82srVkiyMk6oh7KHW+GPXwL/w5rkQPuBG9Qd2R0VRUAZPY6qbxMyTGmZRCg6YdyB
	qyGg
X-Google-Smtp-Source: AGHT+IFC7a/RELRMGOT61mHSSrOmJhDSfGooG41UhVepERHzkWbnq3WupbgJclT7S2NXqgL1lRmwpg==
X-Received: by 2002:a05:6a00:4f83:b0:71e:13ac:d835 with SMTP id d2e1a72fcca58-72fd0c14abbmr16290079b3a.11.1738332940586;
        Fri, 31 Jan 2025 06:15:40 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a958sm3412644b3a.172.2025.01.31.06.15.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 06:15:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/4] binutils: internal gdb: Fix CVE-2024-53589
Date: Fri, 31 Jan 2025 06:15:28 -0800
Message-ID: <2d6df18f4a694d6499b337bbbab10ba8bb6e3fe4.1738332771.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738332771.git.steve@sakoman.com>
References: <cover.1738332771.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 14:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210484

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2024-53589

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0037-CVE-2024-53589.patch        | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0037-CVE-2024-53589.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 032e67a213..e577a10cb8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -71,5 +71,6 @@ SRC_URI = "\
      file://0034-CVE-2022-48064.patch \
      file://0035-CVE-2023-39129.patch \
      file://0036-CVE-2023-39130.patch \
+     file://0037-CVE-2024-53589.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0037-CVE-2024-53589.patch b/meta/recipes-devtools/binutils/binutils/0037-CVE-2024-53589.patch
new file mode 100644
index 0000000000..380112a3ba
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0037-CVE-2024-53589.patch
@@ -0,0 +1,92 @@
+Author: Alan Modra <amodra@gmail.com>
+Date:   Mon Nov 11 10:24:09 2024 +1030
+
+    Re: tekhex object file output fixes
+
+    Commit 8b5a212495 supported *ABS* symbols by allowing "section" to be
+    bfd_abs_section, but bfd_abs_section needs to be treated specially.
+    In particular, bfd_get_next_section_by_name (.., bfd_abs_section_ptr)
+    is invalid.
+
+            PR 32347
+            * tekhex.c (first_phase): Guard against modification of
+            _bfd_std_section[] entries.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=e0323071916878e0634a6e24d8250e4faff67e88]
+CVE: CVE-2024-53589
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/tekhex.c b/bfd/tekhex.c
+index aea2ebb23df..b305c1f96f1 100644
+--- a/bfd/tekhex.c
++++ b/bfd/tekhex.c
+@@ -361,6 +361,7 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+ {
+   asection *section, *alt_section;
+   unsigned int len;
++  bfd_vma addr;
+   bfd_vma val;
+   char sym[17];			/* A symbol can only be 16chars long.  */
+
+@@ -368,20 +369,16 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+     {
+     case '6':
+       /* Data record - read it and store it.  */
+-      {
+-	bfd_vma addr;
+-
+-	if (!getvalue (&src, &addr, src_end))
+-	  return false;
+-
+-	while (*src && src < src_end - 1)
+-	  {
+-	    insert_byte (abfd, HEX (src), addr);
+-	    src += 2;
+-	    addr++;
+-	  }
+-	return true;
+-      }
++      if (!getvalue (&src, &addr, src_end))
++       return false;
++
++      while (*src && src < src_end - 1)
++       {
++         insert_byte (abfd, HEX (src), addr);
++         src += 2;
++         addr++;
++       }
++      return true;
+
+     case '3':
+       /* Symbol record, read the segment.  */
+@@ -406,13 +403,16 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+	    {
+	    case '1':		/* Section range.  */
+	      src++;
+-	      if (!getvalue (&src, &section->vma, src_end))
++             if (!getvalue (&src, &addr, src_end))
+		return false;
+	      if (!getvalue (&src, &val, src_end))
+		return false;
+-	      if (val < section->vma)
+-		val = section->vma;
+-	      section->size = val - section->vma;
++             if (bfd_is_const_section (section))
++               break;
++             section->vma = addr;
++             if (val < addr)
++               val = addr;
++             section->size = val - addr;
+	      /* PR 17512: file: objdump-s-endless-loop.tekhex.
+		 Check for overlarge section sizes.  */
+	      if (section->size & 0x80000000)
+@@ -455,6 +455,8 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+		  new_symbol->symbol.flags = BSF_LOCAL;
+		if (stype == '2' || stype == '6')
+		  new_symbol->symbol.section = bfd_abs_section_ptr;
++               else if (bfd_is_const_section (section))
++                 ;
+		else if (stype == '3' || stype == '7')
+		  {
+		    if ((section->flags & SEC_DATA) == 0)
-- 
2.43.0


