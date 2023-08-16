Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BFEC04A6A
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 03:24:56 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.153471.1692156295002056357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 20:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iAvXPqaM;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-687ca37628eso5769189b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 20:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1692156294; x=1692761094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i7Zq0za4ebe8U4gwGqDw9yHCGE2CC5L03Ad1hnjk+K8=;
        b=iAvXPqaMKoZCwJEcBNWk+Dp/ExsvNjWZEqWOBvplMRV56JrEpCMi3r2GPvPYvW8HL9
         +seV3bTM+0JIgqTxsQdVyKGcuKgahfkNlxLwgwwUbvtUEeYVSHsfr1DLtD1F42XQEy0Z
         SPz0s522sjHufEm92ncJlgJ+S849bBA0W5Bd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692156294; x=1692761094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7Zq0za4ebe8U4gwGqDw9yHCGE2CC5L03Ad1hnjk+K8=;
        b=PIPmGCMAVFmC7Zm+1IhjpIS7rDgTJ045jIZQylZBr1g1wDyeSUId1kV4k2lAmoL650
         1L+KkDTrcArJS2fzHiFGSzkkmXc5ium3cST5o9A+wi/ZhcFg6WsnKZEXUxlV/sA41ORZ
         jWhqDC+fUpPuoU/n0bTpN7kNyEZsExPIwuCOXh5jftXTnuwbTmLoZHclcbvzOuVYrnVk
         zWrPidjz2Rk+aQSbxUbcYck15eLQR6NST4khB8wnw+3jBKAjYoZl2gr4ccFJN7YS9VA4
         FKEwry8Q33QK8JbQe045aWRC9dTStFfUMaYboPzAATJZwHclc3g22UZ9B237fbrhhvMt
         HYlw==
X-Gm-Message-State: AOJu0YyZVgJ9YHKtqHTmmkPRzFm5xsogZFGzywsOOACQCh0bRNhizgKo
	mskmIlkjtqxBVdu9bJ8BUqaAHV72yMQPcqOomeg=
X-Google-Smtp-Source: AGHT+IG3hGLywtLAP/2aKwx50uta8/zjNJG31PSnGVVrxKk2O94vsrVwXXGEh8qi5TPXHnoeQKK0mw==
X-Received: by 2002:a05:6a00:1a16:b0:682:4c1c:a0fc with SMTP id g22-20020a056a001a1600b006824c1ca0fcmr739074pfv.19.1692156293938;
        Tue, 15 Aug 2023 20:24:53 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c01c:78b1:5f87:9483:7810:2f3a])
        by smtp.gmail.com with ESMTPSA id k4-20020aa792c4000000b0065438394fa4sm10320994pfa.90.2023.08.15.20.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 20:24:53 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] elfutils: Backport fix for CVE-2021-33294
Date: Wed, 16 Aug 2023 08:54:34 +0530
Message-Id: <20230816032434.261051-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 03:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186107

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://sourceware.org/git/?p=elfutils.git;a=commit;h=480b6fa3662ba8ffeee274bf0d37423413c01e55

Reference
https://nvd.nist.gov/vuln/detail/CVE-2021-33294
https://sourceware.org/bugzilla/show_bug.cgi?id=27501

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../elfutils/elfutils_0.178.bb                |  1 +
 .../elfutils/files/CVE-2021-33294.patch       | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2021-33294.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.178.bb b/meta/recipes-devtools/elfutils/elfutils_0.178.bb
index 97d033e356..29a3bbfffb 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.178.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.178.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch \
            file://run-ptest \
            file://ptest.patch \
+           file://CVE-2021-33294.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0001-musl-obstack-fts.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2021-33294.patch b/meta/recipes-devtools/elfutils/files/CVE-2021-33294.patch
new file mode 100644
index 0000000000..0500a4cf83
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2021-33294.patch
@@ -0,0 +1,72 @@
+From 480b6fa3662ba8ffeee274bf0d37423413c01e55 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Wed, 3 Mar 2021 21:40:53 +0100
+Subject: [PATCH] readelf: Sanity check verneed and verdef offsets in handle_symtab.
+
+We are going through vna_next, vn_next and vd_next in a while loop.
+Make sure that all offsets are sane. We don't want things to wrap
+around so we go in cycles.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=27501
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=480b6fa3662ba8ffeee274bf0d37423413c01e55]
+CVE: CVE-2021-33294
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/ChangeLog |  5 +++++
+ src/readelf.c | 10 +++++++++-
+ 2 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/src/ChangeLog b/src/ChangeLog
+index 6af977e..f0d9e39 100644
+--- a/src/ChangeLog
++++ b/src/ChangeLog
+@@ -1,3 +1,8 @@
++2021-03-03  Mark Wielaard  <mark@klomp.org>
++
++	* readelf.c (handle_symtab): Sanity check verneed vna_next,
++	vn_next and verdef vd_next offsets.
++
+ 2019-11-26  Mark Wielaard  <mark@klomp.org>
+ 
+ 	* Makefile.am (BUILD_STATIC): Add libraries needed for libdw.
+diff --git a/src/readelf.c b/src/readelf.c
+index 5994615..ab7a1c1 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -2550,7 +2550,9 @@ handle_symtab (Ebl *ebl, Elf_Scn *scn, GElf_Shdr *shdr)
+ 						 &vernaux_mem);
+ 		      while (vernaux != NULL
+ 			     && vernaux->vna_other != *versym
+-			     && vernaux->vna_next != 0)
++			     && vernaux->vna_next != 0
++			     && (verneed_data->d_size - vna_offset
++				 >= vernaux->vna_next))
+ 			{
+ 			  /* Update the offset.  */
+ 			  vna_offset += vernaux->vna_next;
+@@ -2567,6 +2569,9 @@ handle_symtab (Ebl *ebl, Elf_Scn *scn, GElf_Shdr *shdr)
+ 			/* Found it.  */
+ 			break;
+ 
++		      if (verneed_data->d_size - vn_offset < verneed->vn_next)
++			break;
++
+ 		      vn_offset += verneed->vn_next;
+ 		      verneed = (verneed->vn_next == 0
+ 				 ? NULL
+@@ -2602,6 +2607,9 @@ handle_symtab (Ebl *ebl, Elf_Scn *scn, GElf_Shdr *shdr)
+ 			/* Found the definition.  */
+ 			break;
+ 
++		      if (verdef_data->d_size - vd_offset < verdef->vd_next)
++			break;
++
+ 		      vd_offset += verdef->vd_next;
+ 		      verdef = (verdef->vd_next == 0
+ 				? NULL
+-- 
+2.25.1
+
-- 
2.25.1


