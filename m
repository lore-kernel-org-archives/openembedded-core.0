Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE63CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:45:07 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.2570.1760481902255393641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oyMPuMbP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-26c209802c0so58265655ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760481901; x=1761086701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i94l+Z0mdlVS95ZG+k9X9IIZwi05KN1TW+zwu8b9H/w=;
        b=oyMPuMbP/a45eRU7BVJcsWCJi+0AuKhsBykM5srfedzRHVkR+WfOfQIxkb4qxf/9Kn
         O0BTEf/o2WXLeavVAh60vf0fklu3djTAxWP2ACOJKiwEFPy/wu9r7C8TmqH1VbdXhw7d
         qRwOUfO3VjuXJTg0bQvMOej7PoewHFyxJmDPBSN0ScGD8vLXy2pg4C4YQ7JibvrWBm7h
         2rBtkBReb3tHQtpk1plmkwG1SLmv8GqfE2zKDpfaXzxNUewXWttAdCvv7WXyDSBZ/TAc
         EUyycURdT9GHjUVYHaFhHNHwzg3QIMzkSId+hQfVGc3SdnEtbrkIybm4SBnWPQ4PGuls
         bZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481901; x=1761086701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i94l+Z0mdlVS95ZG+k9X9IIZwi05KN1TW+zwu8b9H/w=;
        b=XeImU+hL0oQNFq/bNFg3m5DUVTzqZsBVaeuKHsWqrVQLt1XvyNUXojdZfgQKujb7br
         wtc+of2gG5x4HkjUrElLCIwhOa8IS3oDBwYRlTSCojS6jJLyrNspg2z9nht25lNNtCiK
         KcDn25lWWPQ7ZwrXf7wx6KEZPw5tkzlD55YrQEipTYE/l472asdJoJGogM8M0dOQi7Oh
         t/pidsAGYS/oLIMU4duL6Ge+FgvY4BiNIfWLCfQgULRxlNEwyW2ZHTrF56bQ99Rt70kC
         9qJlyWMjQfcPqfaxsa0iW+AScI+AaDpOZr7Udb+9IVqHxWKAtp6x6qC6rE4aulLyBl4r
         lr/A==
X-Gm-Message-State: AOJu0Yz3uhiVFn3to5CXyMPEUBzLq4yFZJEO+9F5n1kYpmNB9nMEipqF
	HVdTS+rL/TxQf3wf4lwHp3lpyclAEzsEaqS/WvN3vb6+4YVvS3UE6k03XrpCOHPYMEWUToCZsuW
	kbloc
X-Gm-Gg: ASbGncs9b/ZEg0YSGNBVyTlsM0X5pqGo9k7B/KkKEAb66ws2SJmroeorDHqDpMDESdy
	Zsr+nuqHnvyu1gsIUZPne1SPGq4lhbXKdemwPw5QLmnaDICFjKeeHL03W7qiao3l+K3nPwPF6vD
	xhKQlFELU74Shhzzk7JroQ+snTg4H3I/wxT93mn59xeyl0Djzex2YTAhT0Mkfb2qAKRDcrXeWCn
	U5H2Kg8dQR5D+2SUYy/OOKswNzm/Ak/ewz5MNlJviKRRKkpyu2WWLuJEc4L4SamP41rmKyOu7Tl
	BedIDFa0U9iOaZUHEqPKd69FL47740LHRCyOu+5F2g9hPEEhWMO5HNHMoZ1Y6zgO66S4WMP2ZcL
	h1BTdG+rYkErJEE2uEvWwym8LPOLlMePLWmy9fnntoDA=
X-Google-Smtp-Source: AGHT+IH+ehg5qDPIwthHOWf0ypvz5Q7J1IZOwALYXlPW57LrIoz48cdpQ2/FbmovRCuZ8NsqgHgm/Q==
X-Received: by 2002:a17:902:f641:b0:27e:edd9:576e with SMTP id d9443c01a7336-290273ef199mr302361045ad.30.1760481901462;
        Tue, 14 Oct 2025 15:45:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ebea:520a:7699:bba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20479sm174847365ad.47.2025.10.14.15.45.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:45:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/14] binutils: patch CVE-2025-11083
Date: Tue, 14 Oct 2025 15:44:40 -0700
Message-ID: <99879f41af7272e597c9a8c4c0260d1b690f9051.1760481775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760481775.git.steve@sakoman.com>
References: <cover.1760481775.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224857

From: Peter Marko <peter.marko@siemens.com>

Pick patch per link in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0045-CVE-2025-11083.patch        | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0045-CVE-2025-11083.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 0fd950e694..2e978edc6f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -81,5 +81,6 @@ SRC_URI = "\
      file://0043-CVE-2025-7546.patch \
      file://0043-CVE-2025-7545.patch \
      file://0044-CVE-2025-11082.patch \
+     file://0045-CVE-2025-11083.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0045-CVE-2025-11083.patch b/meta/recipes-devtools/binutils/binutils/0045-CVE-2025-11083.patch
new file mode 100644
index 0000000000..d303f651b8
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0045-CVE-2025-11083.patch
@@ -0,0 +1,77 @@
+From 9ca499644a21ceb3f946d1c179c38a83be084490 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Thu, 18 Sep 2025 16:59:25 -0700
+Subject: [PATCH] elf: Don't match corrupt section header in linker input
+
+Don't swap in nor match corrupt section header in linker input to avoid
+linker crash later.
+
+	PR ld/33457
+	* elfcode.h (elf_swap_shdr_in): Changed to return bool.  Return
+	false for corrupt section header in linker input.
+	(elf_object_p): Reject if elf_swap_shdr_in returns false.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2025-11083
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=9ca499644a21ceb3f946d1c179c38a83be084490]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elfcode.h | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elfcode.h b/bfd/elfcode.h
+index 9c65852e103..5224a1abee6 100644
+--- a/bfd/elfcode.h
++++ b/bfd/elfcode.h
+@@ -298,7 +298,7 @@ elf_swap_ehdr_out (bfd *abfd,
+ /* Translate an ELF section header table entry in external format into an
+    ELF section header table entry in internal format.  */
+ 
+-static void
++static bool
+ elf_swap_shdr_in (bfd *abfd,
+ 		  const Elf_External_Shdr *src,
+ 		  Elf_Internal_Shdr *dst)
+@@ -328,6 +328,9 @@ elf_swap_shdr_in (bfd *abfd,
+ 	  if (!abfd->read_only)
+ 	    _bfd_error_handler (_("warning: %pB has a section "
+ 				  "extending past end of file"), abfd);
++	  /* PR ld/33457: Don't match corrupt section header.  */
++	  if (abfd->is_linker_input)
++	    return false;
+ 	  abfd->read_only = 1;
+ 	}
+     }
+@@ -337,6 +340,7 @@ elf_swap_shdr_in (bfd *abfd,
+   dst->sh_entsize = H_GET_WORD (abfd, src->sh_entsize);
+   dst->bfd_section = NULL;
+   dst->contents = NULL;
++  return true;
+ }
+ 
+ /* Translate an ELF section header table entry in internal format into an
+@@ -629,9 +633,9 @@ elf_object_p (bfd *abfd)
+ 
+       /* Read the first section header at index 0, and convert to internal
+ 	 form.  */
+-      if (bfd_bread (&x_shdr, sizeof x_shdr, abfd) != sizeof (x_shdr))
++      if (bfd_bread (&x_shdr, sizeof x_shdr, abfd) != sizeof (x_shdr)
++	  || !elf_swap_shdr_in (abfd, &x_shdr, &i_shdr))
+ 	goto got_no_match;
+-      elf_swap_shdr_in (abfd, &x_shdr, &i_shdr);
+ 
+       /* If the section count is zero, the actual count is in the first
+ 	 section header.  */
+@@ -717,9 +721,9 @@ elf_object_p (bfd *abfd)
+ 	 to internal form.  */
+       for (shindex = 1; shindex < i_ehdrp->e_shnum; shindex++)
+ 	{
+-	  if (bfd_bread (&x_shdr, sizeof x_shdr, abfd) != sizeof (x_shdr))
++	  if (bfd_bread (&x_shdr, sizeof x_shdr, abfd) != sizeof (x_shdr)
++	      || !elf_swap_shdr_in (abfd, &x_shdr, i_shdrp + shindex))
+ 	    goto got_no_match;
+-	  elf_swap_shdr_in (abfd, &x_shdr, i_shdrp + shindex);
+ 
+ 	  /* Sanity check sh_link and sh_info.  */
+ 	  if (i_shdrp[shindex].sh_link >= num_sec)
-- 
2.43.0


