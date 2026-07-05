Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DC8C44502
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:56 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139212.1783291372119780336
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rY6Xs3Zc;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1395777f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291370; x=1783896170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pNW5DYaAlsLD4OkOmOEHjoHHuF6rPu6WOW9FOeBUtI=;
        b=rY6Xs3ZcdqbEdfOK2YCkeBozBvGRh06rHVaUZGrYtvmfC0iF6Mb4S6Q8R7Bncn9F4b
         jRnYgc58AIl9AYnEUFEMIqmwiyPRps6nfb8xp1CKJIbu7bLLTVe9nQMIjzy95LJ0zic3
         ld4oHGpT1IjRxj4oA9Y/HQBp1OvxopLteTCAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291370; x=1783896170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+pNW5DYaAlsLD4OkOmOEHjoHHuF6rPu6WOW9FOeBUtI=;
        b=LzFYwvQhM0jBiIa7YdyvCDxg5eMpkr3mtsCohF78KT669n9+sRTLUkDkeYqb94dro+
         hh0VS0jkTwxDyxoSveQtKuFmQConHSm/DpNjJ9/T3ehhiqCcp+FCbkBn+e2+/7DLzfSI
         E1vhzu+jY50niVyBFoUU0GspRoPOU6P4LRn8qxWF2eGNRun3gA2grl7he99zBWitoeXd
         yILqzmk5WDcuCPwD6iwMZbM3RxaFnoLy8iksd/FUBSBbfqMHOBGTpUxsp0jZl7sSCsTE
         lgxCCCrFW7CRm1jrLOhXgyzKC6CKzTgEkzVRDTW24wYv82nxfB0TJwjCqcD8navFumL6
         pAXQ==
X-Gm-Message-State: AOJu0Yw6NOWtb4MGtiCZHNK6pUP6dxSAFYh0NienruGYybZIEjU/w3mq
	SgIQ2e6GUnIQHP1FUV+ZJChRhkNhSHYoN6Mz43vfoaf+TOZwf4V1vPtgGdR2c0k+QJHqOcYOViR
	dE0Xfvfs=
X-Gm-Gg: AfdE7cmvs8tR8xjfyKVe8W3KqFapQolZfLBU8p/FY29bEuCzYQUJdnyevdWtDSilMd0
	DjQ7Pua9DmCUoGuX0RP3hfPHAcvavKa+uFXCRnSCVih6BmMORdwJvdIJI999MosY53ssqGriq0+
	ZAbDeA6bjyozcQdoaBLSB6Znftt4+oo2uVbpz1kHUs743zFOTH/0fU1JD3PVbJMgT4CHUZlL30x
	QVXVf+2ie6pv3zXHC4caPhYhb79uq/LdMeUzF2/OP0fgFTVWB/1STifAt1Ue5gQnsh9aHFutwvI
	A+Nkd7KR7DzyZbIYjQlpyIKe1hPm51OddUTLoYP9O+7zJ1afR5m+Yyf8UhQFPa/XeC1mcBUrzxw
	5VJqxlzzJRnost4kbsMb9yDhtKY/I5VIfQkhMfxvvJowKCopWj7Scienk8+Sp9rJVqNc8C/BJSW
	b1Mw8P1ZK4ZI0i47qpwo/GJ8Kn9oXKDG423Bak
X-Received: by 2002:a05:6000:718:b0:474:4525:eb32 with SMTP id ffacd0b85a97d-47aaa60dea9mr8374993f8f.11.1783291370271;
        Sun, 05 Jul 2026 15:42:50 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/55] binutils: Fix CVE-2026-6846
Date: Mon,  6 Jul 2026 00:41:05 +0200
Message-ID: <5c66730fa2a54d991cb744b38a32c8ef370fa437.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240169

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=7a089e0302382f4d4e077941156e1eaa68d01393
[2] https://security-tracker.debian.org/tracker/CVE-2026-6846

Tested with binutils-testsuite (bitbake binutils-testsuite -c check):
  binutils: PASSED: 327, FAILED: 0, SKIPPED: 5
  gas:      PASSED: 2091, FAILED: 0, SKIPPED: 4
  ld:       PASSED: 1899, FAILED: 0, SKIPPED: 129

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
(cherry picked from commit 48a578533a584cc550f308490e9ff6443192c79c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.46.inc                |  1 +
 .../binutils/binutils/CVE-2026-6846.patch     | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index 13d2a02108a..cab270cea5d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -39,4 +39,5 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://CVE-2026-4647.patch \
+     file://CVE-2026-6846.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
new file mode 100644
index 00000000000..e7d1c3aa007
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
@@ -0,0 +1,59 @@
+From 7a089e0302382f4d4e077941156e1eaa68d01393 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 6 Apr 2026 22:58:22 +0930
+Subject: [PATCH] PR 34049 buffer overflow in xcoff_link_add_symbols
+
+The fact that coffcode.h:coff_set_alignment_hook for rs6000 removes
+sections can result in target_index > section_count.  Thus any array
+indexed by target_index must not be sized by section_count.
+
+	PR ld/34049
+	* xcofflink.c (xcoff_link_add_symbols): Size reloc_info array
+	using max target_index.
+
+CVE: CVE-2026-6846
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7a089e0302382f4d4e077941156e1eaa68d01393]
+
+Signed-off-by: Alan Modra <amodra@gmail.com>
+(cherry picked from commit 7a089e0302382f4d4e077941156e1eaa68d01393)
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/xcofflink.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 1781182fa6a..7f1c0df760f 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -1335,6 +1335,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+   } *reloc_info = NULL;
+   bfd_size_type amt;
+   unsigned short visibility;
++  unsigned int max_target_index;
+ 
+   keep_syms = obj_coff_keep_syms (abfd);
+ 
+@@ -1398,7 +1399,19 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+      order by VMA within a given section, so we handle this by
+      scanning along the relocs as we process the csects.  We index
+      into reloc_info using the section target_index.  */
+-  amt = abfd->section_count + 1;
++  max_target_index = 0;
++  for (o = abfd->section_last; o != NULL; o = o->prev)
++    if (o->target_index != 0)
++      {
++	/* The last section added from the object file will have the
++	   highest target_index.  See coffgen.c coff_real_object_p and
++	   make_a_section_from_file.  Sections added by
++	   xcoff_link_create_extra_sections will have a zero
++	   target_index.  */
++	max_target_index = o->target_index;
++	break;
++      }
++  amt = max_target_index + 1;
+   amt *= sizeof (struct reloc_info_struct);
+   reloc_info = bfd_zmalloc (amt);
+   if (reloc_info == NULL)
+-- 
+2.43.7
+

