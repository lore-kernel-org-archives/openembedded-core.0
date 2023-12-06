Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F79C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:56:07 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.32044.1701870963577433173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lX42ICgW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2868605fa4aso2580061a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701870962; x=1702475762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ky6qEPTNRO5Po6hgZeN5yORxT9lvbxUJR/76M1ao7oo=;
        b=lX42ICgWCDBzFM8hIHpUJvQsDLDE/unlANYIqYtr9duvGVb9WDn0F4zyCnCiMWwp8I
         XNnQ0xffM6YX5h8E2ap9QzhzO65/MPwFvWpsZHgycD9GH1JmQZKlhayDPXFNj5VsHJtn
         3qwcdWrm9IYudr7EDqslzl2Po5RZ5aVq//TfT/tAmkqUyUcLaPzNgdU8dAfR640BkAjJ
         EJUJ9WjQmHMa5IkG9wd8qaYt6vMyzJ5nja2aFI1+Yc2F6F8C7Eikm6wFOZdUM3eqbxLA
         7YdnAYr70NIv2i2G45vdzFzrX+RzqMH1eY+rgAuvKTypStk6OP7YfOazigwd6ye4UJ4r
         knFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870962; x=1702475762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ky6qEPTNRO5Po6hgZeN5yORxT9lvbxUJR/76M1ao7oo=;
        b=X/2vPK0H1hCnvPJ9SuKuu8REOf5vBsl001Mw1Z8mriqsjIkyZqVTH6pvIndHUPVOrP
         VqEMMaq/NtVE4M+AMxGeuEbDBEER7EqwUY/8JqGV4Aq3AclE76C6yLKHg8reO2fV8cBN
         10tSC7UOsN4F/Qb0CxUGKjNyIa/GmerI4H+TZhp3ktIMRjr0VYuN2kePwYDMtnh34D7j
         0pPEPJyOVTaAc7sq7o9ODPOdScOvWRBzojn6I75IoQDeHcs6cTZiE6nm2RFjKTfekn5K
         60+dYAesqk4HdWb2cpExRlxM+l3n4px+exxVgPDHbuH359WGQReB9I7Ec+279/espMgA
         4xCg==
X-Gm-Message-State: AOJu0YwK/wnBaZHnCme1X6g8WZFoPKrwZlJxiyATD8OtZfEeGkk9ibi8
	20xmdKE6LVu5Apn/0D6KCe/EDhEmERgw7NcFxm0=
X-Google-Smtp-Source: AGHT+IGk05BjJa9JTG3amKPJBwA1jLloxL5UEw0B1Ex7M6XestyCcrsRPpFQopPBWzSZuzLalZ6L8A==
X-Received: by 2002:a17:90b:1b45:b0:286:a734:be6a with SMTP id nv5-20020a17090b1b4500b00286a734be6amr551624pjb.17.1701870962145;
        Wed, 06 Dec 2023 05:56:02 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902680e00b001d07b659f91sm7887650plk.6.2023.12.06.05.56.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:56:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/11] binutils 2.34: Fix CVE-2021-46174
Date: Wed,  6 Dec 2023 03:55:44 -1000
Message-Id: <94f2468de191f8c1dd236efb91f3094a76ddffc9.1701870718.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701870718.git.steve@sakoman.com>
References: <cover.1701870718.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 13:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191887

From: poojitha adireddy <pooadire@cisco.com>

Upstream Repository: https://sourceware.org/git/binutils-gdb.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2021-46174
Type: Security Fix
CVE: CVE-2021-46174
Score: 7.5
Patch: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=cad4d6b91e97

Signed-off-by: poojitha adireddy <pooadire@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 .../binutils/binutils/CVE-2021-46174.patch    | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-46174.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index a9a2bf332f..371e8e9fa4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -54,5 +54,6 @@ SRC_URI = "\
      file://0001-CVE-2021-45078.patch \
      file://CVE-2022-38533.patch \
      file://CVE-2023-25588.patch \
+     file://CVE-2021-46174.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2021-46174.patch b/meta/recipes-devtools/binutils/binutils/CVE-2021-46174.patch
new file mode 100644
index 0000000000..2addf5139e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2021-46174.patch
@@ -0,0 +1,35 @@
+From 46322722ad40ac1a75672ae0f62f4969195f1368 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 20 Jan 2022 13:58:38 +1030
+Subject: [PATCH] PR28753, buffer overflow in read_section_stabs_debugging_info
+
+	PR 28753
+	* rddbg.c (read_section_stabs_debugging_info): Don't read past
+	end of section when concatentating stab strings.
+
+CVE: CVE-2021-46174
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=cad4d6b91e97]
+
+(cherry picked from commit 085b299b71721e15f5c5c5344dc3e4e4536dadba)
+(cherry picked from commit cad4d6b91e97b6962807d33c04ed7e7797788438)
+Signed-off-by: poojitha adireddy <pooadire@cisco.com>
+---
+ binutils/rddbg.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/binutils/rddbg.c b/binutils/rddbg.c
+index 72e934055b5..5e76d94a3c4 100644
+--- a/binutils/rddbg.c
++++ b/binutils/rddbg.c
+@@ -207,7 +207,7 @@ read_section_stabs_debugging_info (bfd *abfd, asymbol **syms, long symcount,
+ 		     an attempt to read the byte before 'strings' would occur.  */
+ 		  while ((len = strlen (s)) > 0
+ 			 && s[len  - 1] == '\\'
+-			 && stab + 12 < stabs + stabsize)
++			 && stab + 16 <= stabs + stabsize)
+ 		    {
+ 		      char *p;
+ 
+-- 
+2.23.1
+
-- 
2.34.1


