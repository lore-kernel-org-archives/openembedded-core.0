Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6590ECDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 17:39:00 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.226962.1697564337023561180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 10:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VbtRMeTs;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a8ada42c2aso7371327b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 10:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697564336; x=1698169136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNHfs1geFwRnBlKDrtSJLQU6EX8rJoaVGr1uhiezH0o=;
        b=VbtRMeTsGBhxh8J8TIV63ZtRZkjylJx/PJPOxap2YNSUHJcbF/QRDEC79a6+larrO5
         XSTGqX6wWWKQPn9PtfDIEFuY+f/gVeOdjphUx3Du8ODb7MMGBUGWQ31szQeBocwVwutW
         ofZua1vSSm13r1NIcsPz+PIliajG9TB5/A8+I2rDJOrgkSdD6mGLC4uZZzjoZkuYWGBT
         da4vi5MBp7TbmLtyagEteDxEfeCHebSpon9VnVXXSykt+h5AkvS3HFXIuUdky/3Gr++q
         XB69auITClLiahufzHzZnJDGr/Ga349vdgUhsYQ5w+HPt33EfGFW/1Ba7/ByUVDTF1xf
         S/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697564336; x=1698169136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNHfs1geFwRnBlKDrtSJLQU6EX8rJoaVGr1uhiezH0o=;
        b=MX5xUzw6nKQlS2Zitfd4Ri0w5IPtaevyxRFxJo839ChG5xaNh51+mwe/r4VPVj3GbO
         /vDP7Dmi3oVYTFW97HukxXd0I6pTNu8O4XvmOsGxC8XnBnweLevUVNVSGT0/5aNzLMVh
         Xi0LXRHm+6GqVkjR94DnjHgdfq9aFKt/6AyRlTQszybX6OEMUsLghoAQsRIF6jzbyMWc
         v/NNgEAKz+vXydZn328RVM/zwyIgh0Ry+kPHql6C69nsu7SzTkhUVYqz2SMH3SrKPgtO
         1V9NmVPWHIJYtdutRRIVkmVOS8YtddVVkU5q5JOqiFR8MNHQSDCBHVsqJ+tILRCtFeBR
         TQkQ==
X-Gm-Message-State: AOJu0Yzo3Lmrk5ovqGVh4VJxP7K76v4Py+XwQkRcagugr9zeC8u70UJV
	MISzyeZTKbiYlFHXguY0aHFNSMj7ZSA=
X-Google-Smtp-Source: AGHT+IE1Mo/K0jBH0X6DmgHfw6Ympk3kpn2FeLVG1yB9k6CziN8hVPSayQVvqwr2x4vW2n+pEaJ5Pw==
X-Received: by 2002:a0d:d50a:0:b0:5a7:be9f:bd19 with SMTP id x10-20020a0dd50a000000b005a7be9fbd19mr2948869ywd.44.1697564335983;
        Tue, 17 Oct 2023 10:38:55 -0700 (PDT)
Received: from mvwork.mvista.com (99-157-111-72.lightspeed.tukrga.sbcglobal.net. [99.157.111.72])
        by smtp.gmail.com with ESMTPSA id w20-20020a81a214000000b005925c896bc3sm784067ywg.53.2023.10.17.10.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 10:38:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [kirkstone][PATCH] binutils: CVE-2022-48063
Date: Tue, 17 Oct 2023 13:36:54 -0400
Message-Id: <20231017173654.2539710-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 17:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189348

From: Armin Kuster <akuster@mvista.com>

Source: Binutils
MR: 128800
Type: Security Fix
Disposition: Backport from https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=75393a2d54bcc40053e5262a3de9d70c5ebfbbfd
ChangeID: ab04e4ec62d054c90d94f82230adb2342ce1ee1b
Description:

Affects binutils < 2.40

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/binutils/CVE-2022-48063.patch    | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-48063.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 638b1ba93d..2944972267 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -59,5 +59,6 @@ SRC_URI = "\
      file://0029-CVE-2022-48065-1.patch \
      file://0029-CVE-2022-48065-2.patch \
      file://0029-CVE-2022-48065-3.patch \
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
2.39.3


