Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02D9C4829D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:47:27 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.24764.1707234439521107393
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 07:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dRWzdGnt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d7393de183so45040135ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 07:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707234438; x=1707839238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vffioXRN6sE1YLkQBRieWyIB1GOPQuRaQqdfa2ek+qY=;
        b=dRWzdGntTy/ByHcKFpiD703ihRWrxdUsuA+ewndhv2rtlE3yr7IoDk8PNJqrJm8qWU
         /wk3K0XZy0XmVgXQaQhKAi0n1rb9B8BNzzlR+hfI/8+WZtFS/sUUWBg0lDArtozPoUTG
         ZptrMQMPn0dcmmLzsCuiXjIT1gsmqmyR18/kAgTVofDybMFp9sN9KISELxTlYOnREpHR
         Z24E+VBmYUqg8rl/6MrwpU3Tt/wEIhozqMjFNX9a7mgJsh7qEwJIBb5+N7XMqjunMeVs
         EBRfAPlw+Gs6ZrRnfNG55qc72D0X4iU3rr7eMPsZs28sqPcsN76LLntK5c3XAoVRyYzc
         sL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707234438; x=1707839238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vffioXRN6sE1YLkQBRieWyIB1GOPQuRaQqdfa2ek+qY=;
        b=i3z0fH4beUidXZEBGyaPAyxQdlAtnBgTZ3D7r9mx0pk9tlEs6eZ/jORsOHo8JtYoy9
         UIpZSO0D0aDOQytMuoIVWl3XlysDE/GrlDQyyVquGEaBnWh26uGxt9yR5viJILh4fFvI
         r3DT7hIo7HsuhlzY6dzH0isiPsn7Yo0vR9AUgDjxOahn+s4XxVRBUuHp/53w3iyn83RI
         UCz8BZCRMe4heBQaiXLNzdJPznfwPjqJHWSNiGwAUvyrL/QfCd2ZaRtPqIM0LdrcRBpm
         piwQ2VRLDluW/Gk1vFVMaVF4HuMWv3ybgQ0nYMGgTy+jrmjpRbFn18maKJlb4HwZzePP
         RTtw==
X-Gm-Message-State: AOJu0YxvydPomp1O/qyNajADaFsbxgI2hUHaK42SlYgmTxYpBi/m8Bkw
	BsAdYgs/pVxkluz9O/Z7gH6fc5EhYLJPrRdzuwSLrIn7F3r8bfQxMBWBNszqnssfIYdzcFs+MWg
	NXes=
X-Google-Smtp-Source: AGHT+IEbqQ/GryApCQsS7g2bMbWZkTx+F6dzuVKVfc3/mzTRNrwEhXT+TEbiQskWTM1npT44Ba+N3Q==
X-Received: by 2002:a17:90b:4394:b0:295:1e7d:bc14 with SMTP id in20-20020a17090b439400b002951e7dbc14mr2844143pjb.20.1707234438546;
        Tue, 06 Feb 2024 07:47:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id kx18-20020a17090b229200b0029454cca5c3sm1811452pjb.39.2024.02.06.07.47.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:47:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] binutils: internal gdb: Fix CVE-2023-39129
Date: Tue,  6 Feb 2024 05:45:20 -1000
Message-Id: <fd3f20e1e8bcd63b75e8800fe60d6194a4fd6bd4.1707234215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707234215.git.steve@sakoman.com>
References: <cover.1707234215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 15:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195001

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

CVE: CVE-2023-39129
Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0035-CVE-2023-39129.patch        | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 3787063cba..83dff20855 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -69,5 +69,6 @@ SRC_URI = "\
      file://0032-CVE-2022-47010.patch \
      file://0033-CVE-2022-47007.patch \
      file://0034-CVE-2022-48064.patch \
+     file://0035-CVE-2023-39129.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch b/meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch
new file mode 100644
index 0000000000..63fb44d59a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch
@@ -0,0 +1,50 @@
+From: Keith Seitz <keiths@...>
+Date: Wed, 2 Aug 2023 15:35:11 +0000 (-0700)
+Subject: Verify COFF symbol stringtab offset
+X-Git-Tag: gdb-14-branchpoint~473
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=58abdf887821a5da09ba184c6e400a3bc5cccd5a
+
+Verify COFF symbol stringtab offset
+
+This patch addresses an issue with malformed/fuzzed debug information that
+was recently reported in gdb/30639. That bug specifically deals with
+an ASAN issue, but the reproducer provided by the reporter causes a
+another failure outside of ASAN:
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=58abdf887821a5da09ba184c6e400a3bc5cccd5a]
+
+CVE: CVE-2023-39129
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+diff --git a/gdb/coffread.c b/gdb/coffread.c
+--- a/gdb/coffread.c
++++ b/gdb/coffread.c
+@@ -159,6 +160,7 @@ static file_ptr linetab_offset;
+ static file_ptr linetab_size;
+ 
+ static char *stringtab = NULL;
++static long stringtab_length = 0;
+ 
+ extern void stabsread_clear_cache (void);
+ 
+@@ -1303,6 +1298,7 @@ init_stringtab (bfd *abfd, file_ptr offset, gdb::unique_xmalloc_ptr<char> *stora
+   /* This is in target format (probably not very useful, and not
+      currently used), not host format.  */
+   memcpy (stringtab, lengthbuf, sizeof lengthbuf);
++  stringtab_length = length;
+   if (length == sizeof length)	/* Empty table -- just the count.  */
+     return 0;
+ 
+@@ -1322,8 +1318,9 @@ getsymname (struct internal_syment *symbol_entry)
+ 
+   if (symbol_entry->_n._n_n._n_zeroes == 0)
+     {
+-      /* FIXME: Probably should be detecting corrupt symbol files by
+-	 seeing whether offset points to within the stringtab.  */
++      if (symbol_entry->_n._n_n._n_offset > stringtab_length)
++	error (_("COFF Error: string table offset (%ld) outside string table (length %ld)"),
++	       symbol_entry->_n._n_n._n_offset, stringtab_length);
+       result = stringtab + symbol_entry->_n._n_n._n_offset;
+     }
+   else
-- 
2.34.1


