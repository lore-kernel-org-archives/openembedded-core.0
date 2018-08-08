Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id BB83378E49
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:28 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id b90-v6so1206391plb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=D1Mzt0/Ze6ae/dTc5wfOX0yTsNl04IAintIIr6gn+UM=;
	b=Lw6YEGB+jqIhJ0GM/wS5Jm3v2L7doz+VKxH1kGFgk1w627e3f8nWCuyySqbd1AcZCc
	8/FgCQouTxUKHzWdCEyONbZm+2ot71RZcG34r/btaYjeSQZrFvyXKKrIL+yumFriqHQ7
	SP0DRDQH/0am7rkEjNZerybG7wdnJMhwMXIo7LiwquNjTa/GjxRB7rbyAS8sgyiVbe+Q
	N3qnnq+mMgVD0+FNgu86vyMv3yGKMt3/Aw4FwSokOGauRF3YEwM+/wIIgWCuFYmwHe8d
	pSjIX4pXvj62xNzSs0KRQ+4ob/iAXW2K1iuYxtcwT6X391ApssaLos2diU/F4qiS+RCB
	SQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=D1Mzt0/Ze6ae/dTc5wfOX0yTsNl04IAintIIr6gn+UM=;
	b=WRfw5HrDqcZK6KpmtdhjTnCVcBiyFGXDn2Pglpp9Z7nhIWKekQ9SWG+J15EgFXt2Wd
	P1fhirtA5hQXmsaVJxBi+pJ1kEF1OyTQPOQb9BfUWIrVRs1wyLUky4liRzvuLvRK0n4A
	M2t6prTOeNn7EL86z3YZTi9W+Y9C5gRwlCdi87hQQ1fgMXSGOwfseuv/Ehvvjx/qi8e7
	NcFgsKRHbO36V1sVQscWuk3GeknzWbdaDl8vWwqxPja/5AhbUWtesEvielpNfA7RQ5Ji
	y03Me1Ca8P5754VaEzlLzkS1qE2RlFk1lcudiTK7/UbOS3XQyVOPtltAk/wXJepE6QWX
	JaJQ==
X-Gm-Message-State: AOUpUlHnMbQpyuCk+Lb1093v+KWaZfjnwuS551tnrc4wx2qK3vo7moqT
	Rpd/aEH8ShjwTaGXlc4jCxs=
X-Google-Smtp-Source: AA+uWPym2zHQRpewIxEUFouIV0eXgl4JX0EnZAYyo1hqdll8CV3p73JKmELGsh5jXnhENjBOLgo9YQ==
X-Received: by 2002:a17:902:8f93:: with SMTP id
	z19-v6mr3015665plo.241.1533742530024; 
	Wed, 08 Aug 2018 08:35:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:01 -0700
Message-Id: <1533742522-24357-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 06/27] binutls: Security fix for CVE-2017-14938
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 15:35:29 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-14938.patch         | 64 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-14938.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 765813d..8e92b92 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -41,6 +41,7 @@ SRC_URI = "\
      file://CVE-2017-14933_p1.patch \
      file://CVE-2017-14933_p2.patch \
      file://CVE-2017-14934.patch \
+     file://CVE-2017-14938.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-14938.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-14938.patch
new file mode 100644
index 0000000..e62c73c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-14938.patch
@@ -0,0 +1,64 @@
+From bd61e135492ecf624880e6b78e5fcde3c9716df6 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 24 Sep 2017 14:34:57 +0930
+Subject: [PATCH] PR22166, SHT_GNU_verneed memory allocation
+
+The sanity check covers the previous minimim size, plus that the size
+is at least enough for sh_info verneed entries.
+
+Also, since we write all verneed fields or exit with an error, there
+isn't any need to zero the memory allocated for verneed entries.
+
+	PR 22166
+	* elf.c (_bfd_elf_slurp_version_tables): Test sh_info on
+	SHT_GNU_verneed section for sanity.  Don't zalloc memory for
+	verref.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-14938
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 7 +++++++
+ bfd/elf.c     | 5 +++--
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+Index: git/bfd/elf.c
+===================================================================
+--- git.orig/bfd/elf.c
++++ git/bfd/elf.c
+@@ -8198,7 +8198,8 @@ _bfd_elf_slurp_version_tables (bfd *abfd
+ 
+       hdr = &elf_tdata (abfd)->dynverref_hdr;
+ 
+-      if (hdr->sh_info == 0 || hdr->sh_size < sizeof (Elf_External_Verneed))
++      if (hdr->sh_info == 0
++	  || hdr->sh_info > hdr->sh_size / sizeof (Elf_External_Verneed))
+ 	{
+ error_return_bad_verref:
+ 	  _bfd_error_handler
+@@ -8219,7 +8220,7 @@ error_return_verref:
+ 	goto error_return_verref;
+ 
+       elf_tdata (abfd)->verref = (Elf_Internal_Verneed *)
+-	bfd_zalloc2 (abfd, hdr->sh_info, sizeof (Elf_Internal_Verneed));
++	bfd_alloc2 (abfd, hdr->sh_info, sizeof (Elf_Internal_Verneed));
+ 
+       if (elf_tdata (abfd)->verref == NULL)
+ 	goto error_return_verref;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,10 @@
++2017-09-24  Alan Modra  <amodra@gmail.com>
++
++       PR 22166
++       * elf.c (_bfd_elf_slurp_version_tables): Test sh_info on
++       SHT_GNU_verneed section for sanity.  Don't zalloc memory for
++       verref.
++
+ 2017-09-26  Alan Modra  <amodra@gmail.com>
+ 
+ 	PR 22210
-- 
2.7.4


