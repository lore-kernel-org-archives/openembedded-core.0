Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3875E67499
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:26 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68775.1766353038493439033
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NmaZFfe9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so4067574b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353038; x=1766957838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzsyUCD2P0hL1tUE8avFtrAtlvJTdCuwToQVyT9fmUU=;
        b=NmaZFfe95ukNbwB7Lm3ZEPBShT7sF4zmeQxRD2ob4m7IAjimII0Uc1UVG2lqaODfBZ
         y4ArySI2RaaiRpd+JRNmO7sm2dkxpwWKJMsEUIETvqEy93Q2y+L/Xx+nLnjX4swof+hE
         +YMV5yNyyYTBGk2MBbvnJsjkxcYut9VyWg+yIf63QFsU5dZ5bcYkVqLm3HPAdQrA3Xio
         bmJc8/+JGwHDjLwJSkLYIt0yGhTc6WcDOlUrOU4703W91lJko6V99HWmOJFmpIwmCncZ
         zcBXFs/0Hr/GrET8fPzHrmI9xIK2GN21p3DWaNx3GENIFrm1pt3VmIaUvUBRS/EwMuH3
         kPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353038; x=1766957838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SzsyUCD2P0hL1tUE8avFtrAtlvJTdCuwToQVyT9fmUU=;
        b=XeWJpeTI2cey6x6JFA6GNdjpIWeg73fVZk4908NXTu1B3UDPwkqo5bCrcglq1VOkIL
         dkMPXhtsgFljiD6XZmOIQZOPM3BEk0pZeZC/VIG1gGWEtTxf7RnUyY+SGPho4xUW8NWH
         7CFkSWFo1vhs/eEUnwSW+CLDJY9oaK50zIscDI9rR6XLYlcDZMwYymM/amwVWKkX3iwy
         /GIP4ToSDx6F8xoNYDPrnxtnZCT5uxJlO+UFiuYLMpK4OdcR6LTEbOhKjo0wMLp8LC5n
         yRL6nRT4Wq81cYPT84mHpHST6FNEW6gmM7J+jVptGauBpdjDNzfOBrbpNKcvzg34gaO0
         d+hg==
X-Gm-Message-State: AOJu0YwIl7qbDJhExWCVgJ6M6Bbg3uLFsB4PPMLThoZjENm4hllwOKzL
	6oTlPB1sQZSfEn+gwR9/0BjuJEUcGeJSPI4CSvCxxEf2rvUn3BpIrmjvG4b4PGvY5sO5siWhZEh
	5LyzJhJI=
X-Gm-Gg: AY/fxX66qra9JQOxfzLyEAwnowO++6GjONVGyXiWsy1TpWWSbDtwXq8sqZFy6CfBO3V
	i2SlxOEkxBqumXgnnAt/lpQXKuE/kBXvXaGUA3I8L6OivJLSFHeK35HR9jmBLnTSGWhuLsJZozt
	hf+c3Z+y+nls9QZ9xW4+KBrvWQm7DoWCgIARvQ1jeSeXVwsThf/jYKDXnUl2CtQwA6cwm+7LEQG
	2xzL/2TRBHFG0MMQvTf+fhR2tOIYaP7HDnqB3aV913i0vsc/TrRxW2XfmFCaz86R+YWNtmRu+fC
	Lppk/0zJyjIXnftzmCydCBkVLHM+n72ets/3aTkuDqzSpQbBqlEveGtrufmOWSDpFSGitc5PvA3
	P8dBbGofblwTWdQNdPIPUO/NhDc+RiyFjuVB5ahfM2Dol8UWDYHP3Rjt5tlTw046U4kc/4mJpwx
	MvuI9b7a70wCc=
X-Google-Smtp-Source: AGHT+IHRm+dAbz1OG4FHQe+76mr6ZExk/T1y8qC+A7ylqAEUcY7FoJPikW6Gar7PbqqyReaf4okbsA==
X-Received: by 2002:a05:6a00:6ca6:b0:7a9:b9e0:551c with SMTP id d2e1a72fcca58-7ff657a3789mr8258769b3a.21.1766353037713;
        Sun, 21 Dec 2025 13:37:17 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 01/18] binutils: Fix CVE-2025-11494
Date: Sun, 21 Dec 2025 13:36:54 -0800
Message-ID: <86c4805296c235bd6989cc3964a9d119ddbebdc4.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228259

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
.eh_frame section is non-empty.

Backport a patch from upstream to fix CVE-2025-11494
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/0018-CVE-2025-11494.patch        | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 288475ac39..58964a6cfb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -43,4 +43,5 @@ SRC_URI = "\
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
      file://CVE-2025-11495.patch \
+     file://0018-CVE-2025-11494.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch
new file mode 100644
index 0000000000..dc4b413658
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch
@@ -0,0 +1,43 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 30 Sep 2025 08:13:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]
+CVE: CVE-2025-11494
+
+Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
+_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
+.eh_frame section is non-empty.
+
+	PR ld/33499
+	* elfxx-x86.c (_bfd_x86_elf_late_size_sections): Keep
+	_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the
+	output .eh_frame section is non-empty.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index c054f7cd..ddc15945 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2447,6 +2447,8 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 
+   if (htab->elf.sgotplt)
+     {
++      asection *eh_frame;
++
+       /* Don't allocate .got.plt section if there are no GOT nor PLT
+ 	 entries and there is no reference to _GLOBAL_OFFSET_TABLE_.  */
+       if ((htab->elf.hgot == NULL
+@@ -2459,7 +2461,11 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 	  && (htab->elf.iplt == NULL
+ 	      || htab->elf.iplt->size == 0)
+ 	  && (htab->elf.igotplt == NULL
+-	      || htab->elf.igotplt->size == 0))
++             || htab->elf.igotplt->size == 0)
++         && (!htab->elf.dynamic_sections_created
++             || (eh_frame = bfd_get_section_by_name (output_bfd,
++                                                     ".eh_frame")) == NULL
++             || eh_frame->rawsize == 0))
+ 	{
+ 	  htab->elf.sgotplt->size = 0;
+ 	  /* Solaris requires to keep _GLOBAL_OFFSET_TABLE_ even if it
-- 
2.43.0


