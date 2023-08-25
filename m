Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C776C6FA8F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:47:52 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.5800.1692931670685763022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gBwTlBKX;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a85b9deeb3so333275b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931669; x=1693536469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esMLEuBYAx9uk6rOQBdXnCr3v5xRNnpSTdxvYjzDyzc=;
        b=gBwTlBKX4v/Yy24+2WgrwGFwKu31TN7qydAh2qFyAMF26SZbcrhYTbP+ciMNavM//N
         9pb5u9D/rW0IvdnFHs8HaX5eGQSKyzzWGF3pDCyjyXF7yn6lPNksny/9QqP6CIJFMPTL
         262Zaq3B3ggtIZMjh/SJjIACwQBexT9OO6AIUUBGickv7qm+12jL6yFUW36CysEnJJVQ
         R/QTtU4J7MvxDtZhe5lguFqnsQdCJKCcGGFp8M5Nws4gKv2/2xIqD4IOuSjnlEd8BiC8
         M7Tw5EGfPvdD7VwUTcZQER4OlqFvf+KX6k6hhfUBHn+DTqcP+FSEkZHJnxG6TgdxbSZY
         nV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931669; x=1693536469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esMLEuBYAx9uk6rOQBdXnCr3v5xRNnpSTdxvYjzDyzc=;
        b=C95Cc7goHXZy4SYGVQJGfcpZVtiTqpZ+1E7QXp3lzGnFYqmfHb2tJqGMgR8tyczUAx
         ah1C4EcPFrBlzwh1ZldmYJgI/JN7fd/eu0XRJawx0SzxlaghhV4FKN63TELwRFuzkh7+
         LIt++SI2xcIaqCDFw1LitXYXIIr56RT4HVfVvHAEdObpdAlvbT9Z4qz56srZoEcLDf33
         u6SY0KISYI9ist+nLpmx7iAkPv7X/J1UAizQDEVXuvk9YnbjCF7gqWdh1Y0QKa27Eyqj
         o1Hfn3oOAPquU/8kAGjh99kYIIkiA3N8FNO0tqcnx0Bhv50jcegx6YkHkWK1kV2fYrgT
         AUOQ==
X-Gm-Message-State: AOJu0Yzi7I+hAq1XBHVnPSEe9/MkPEvVMiIX4LIES8pqmeOO94wMaGk7
	7WwTTDD24SOxEYwBvs75ndIXze0teMGjI2SA3MI=
X-Google-Smtp-Source: AGHT+IHTq8p++NAA/4TNjc/whQcS1Mo+N0bvZCFZb+nF/zwxsLPOkf2HbwDuOVK+VG4tDxQwWLgvJA==
X-Received: by 2002:a05:6808:144d:b0:3a4:894a:9f3d with SMTP id x13-20020a056808144d00b003a4894a9f3dmr1996211oiv.41.1692931669684;
        Thu, 24 Aug 2023 19:47:49 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.47.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:47:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/14] elfutils: Backport fix for CVE-2021-33294
Date: Thu, 24 Aug 2023 16:47:26 -1000
Message-Id: <9cd6fea32edf8e4da0c33547e1df6d1ec81b350d.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186675

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://sourceware.org/git/?p=elfutils.git;a=commit;h=480b6fa3662ba8ffeee274bf0d37423413c01e55

Reference
https://nvd.nist.gov/vuln/detail/CVE-2021-33294
https://sourceware.org/bugzilla/show_bug.cgi?id=27501

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


