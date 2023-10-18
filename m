Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F734C41513
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:57 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.284619.1697644127537593178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rbwPqFhD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6b201a93c9cso4598618b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697644127; x=1698248927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uU2Njdw3QTJt2bUQtrF7f9H+4t+dK5Cb8GXTBigKejc=;
        b=rbwPqFhDLoTt+743gh2qE+xmi7unwkuhqUbzZGgO2jGIgSDTB8uHtNjGfucxJn391w
         jDZ03qC/KaQaDR1y7h4SHqcEG9UiYTgLiz6RhlqW1wc5xZRfLu7SJiWTuHdfrIUXeB1P
         TPu554ydIgbAdpctxvA162Vmn5mDtrbGL3JMGc2Cm4R0GbyTJ1ExRFbWXbHhMoYaGOzd
         j2BPrA5JfqMBkt6AwEXzzQtCPOAxBD4hc4vk3u533uWq0FszJWJswC1Crm02+JHhkrUG
         epxp/NzrszZHJRwxlPFqDSlHZB2nxNulp+vsiK904rT1eqJ9mgIxzqcyOXFIhO0P188q
         Ky7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697644127; x=1698248927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uU2Njdw3QTJt2bUQtrF7f9H+4t+dK5Cb8GXTBigKejc=;
        b=YkblVSpHwUrkRxpsz+t3AkhgmH5l1fCmP/ppZuOPBJ1GpSOn7zsnVx24YtiPcDZrj+
         YUjh6n17Zw8+S5W0iBktXBCPEB1kTJoYrshYlemCQBr3hRkVUM36o4GOHj6WuI8cXccW
         CDMV+cTQ990sIrt0eeNnXJOMEyWc5D8KRzPe+PYGYzOIy+hsywZhsjj3ludJSwxJuDLG
         n6oFIfmNEC92cSM39uOw0uez7PUBtgCBeAb9vFXR43WFf6FtBUD+uy+nFG7pDnGKvOIN
         3Xrnss5MPdx/WGqfwQI7jNLdiDOJ2yg2UE0YkTSi3KD0OQn5t3BCToxpS93SA/fxFc7e
         Gsnw==
X-Gm-Message-State: AOJu0Yx+/lwfs/GiWTIw82m5GZxZwNYtUdUyA7y27xvTU+iC8gmURYK6
	SZ1TYVs1uhGpy+WTB828h5F8BHWKJ4Xl9/5N5XU=
X-Google-Smtp-Source: AGHT+IGItZp8ShiPpr+SEKrtAD0HYHM4V+S6Q6ED42bIXI7wDq5H4kINRjFLVIFsHjIl9lbXkurjfw==
X-Received: by 2002:a05:6a20:72a5:b0:17b:1f75:e3f2 with SMTP id o37-20020a056a2072a500b0017b1f75e3f2mr4056119pzk.39.1697644126612;
        Wed, 18 Oct 2023 08:48:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o14-20020a17090ab88e00b002636dfcc6f5sm43268pjr.3.2023.10.18.08.48.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:48:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/10] binutils: CVE-2022-48063
Date: Wed, 18 Oct 2023 05:48:25 -1000
Message-Id: <80a8d16a4038868469b4583404b6f73e12bae0f1.1697642997.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697642997.git.steve@sakoman.com>
References: <cover.1697642997.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189405

From: Armin Kuster <akuster@mvista.com>

Source: Binutils
MR: 128800
Type: Security Fix
Disposition: Backport from https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=75393a2d54bcc40053e5262a3de9d70c5ebfbbfd
ChangeID: ab04e4ec62d054c90d94f82230adb2342ce1ee1b
Description:

Affects binutils < 2.40

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/binutils/CVE-2022-48063.patch    | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-48063.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index c25b49f8b0..60a0c04412 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -65,5 +65,6 @@ SRC_URI = "\
      file://0031-CVE-2022-45703-1.patch \
      file://0031-CVE-2022-45703-2.patch \
      file://0031-CVE-2022-47695.patch \
+     file://CVE-2022-48063.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-48063.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-48063.patch
new file mode 100644
index 0000000000..ea2e030503
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-48063.patch
@@ -0,0 +1,48 @@
+From 75393a2d54bcc40053e5262a3de9d70c5ebfbbfd Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 21 Dec 2022 11:51:23 +0000
+Subject: [PATCH] Fix an attempt to allocate an unreasonably large amount of
+ memory when parsing a corrupt ELF file.
+
+	PR  29924
+	* objdump.c (load_specific_debug_section): Check for excessively
+	large sections.
+
+Upstream-Status: Backport
+CVE: CVE-2022-48063
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog | 6 ++++++
+ binutils/objdump.c | 4 +++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+Index: git/binutils/objdump.c
+===================================================================
+--- git.orig/binutils/objdump.c
++++ git/binutils/objdump.c
+@@ -3768,7 +3768,9 @@ load_specific_debug_section (enum dwarf_
+   section->size = bfd_section_size (sec);
+   /* PR 24360: On 32-bit hosts sizeof (size_t) < sizeof (bfd_size_type). */
+   alloced = amt = section->size + 1;
+-  if (alloced != amt || alloced == 0)
++  if (alloced != amt
++      || alloced == 0
++      || (bfd_get_size (abfd) != 0 && alloced >= bfd_get_size (abfd)))
+     {
+       section->start = NULL;
+       free_debug_section (debug);
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,9 @@
++2022-12-21  Nick Clifton  <nickc@redhat.com>
++
++       PR  29924
++       * objdump.c (load_specific_debug_section): Check for excessively
++       large sections.
++
+ 2022-03-23  Nick Clifton  <nickc@redhat.com>
+ 
+ 	Import patch from mainline:
-- 
2.34.1


