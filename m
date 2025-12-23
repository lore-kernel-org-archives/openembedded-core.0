Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A99E6FE54
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:26:26 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109033.1766525178799863703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EIADj8wy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a07fac8aa1so58178125ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766525178; x=1767129978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvtp9CXAa+mdCgwITsCeWMp0cr4niDMugVgE8v9p3Qk=;
        b=EIADj8wyugcKUFgiaeb+VKSO130HquqxQUUVSbFULsM8sNAKOK3RHrNjuTvltqQ0sH
         12yoH6adWgEkoDr/7G6AVbvku76P2sPeE17DDoRWKc3U2BGwoxdNGjKK9/9N4KuUuM2Z
         m2u/vCVEUJK8PlJ4XZwRo+pRIjT5mg1ztncVA7a71qFSAbNB1UadZIrfZZ2jCkqMswnL
         /lOsm91SfhvNAKfzIQEA5/U2s6YNCCJXQJ8T5820IeP29BB07xYqHHgE04Hb5E+2zIDL
         gvHhzCzznIoMQrp2obuzyKQ2L5A3x+ek4f/es4EBmbOj5dzvWmbyisokJsT6cD2qRyhw
         64Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766525178; x=1767129978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvtp9CXAa+mdCgwITsCeWMp0cr4niDMugVgE8v9p3Qk=;
        b=OI2GUXmO/8NhezCZdimk7Ys6KzceOhfDI24brZGc0nwXZoxAi3UmgQS2wkPeX+dIsi
         yfn2Fh3wFluBw8LmgpQUTaOUbYNwKiod7sMUbGElWze6HzV1U3NFoLBeSEVwq1Q0J025
         vmFPSSV6cHyTvxpE2njqXbjAy6B+KKs2PZjYAzFn7crLhBeUmAFyRZwCbVi2cT+R/ePk
         vo/H0uoRO/PGIQpuSnKuvvLiESILcyYZLfUv5/9HsZNsyeWIoPnD12dCdOr8gxWJ2XUO
         i6+cOpV86qbT5Zz5jFGNb4YWUyesm1No85CZEv6L02KyskFMDahQ2QS+nM5NLVz8thxI
         2EEQ==
X-Gm-Message-State: AOJu0YyTBCvtYZRYwsOuTHP+M7TofsVaAJjPM0eLEzebTwylzuc8plSV
	6dAQsW5W4wy57X4mxtOYYj47OPn6Eg1vnaM2EW2amaVAKKRT7m59s1PWfEKDlUZfXgQgqhiyEAz
	c34za
X-Gm-Gg: AY/fxX7atX5VQjxyRDWISGwqrtyxRSXkDEQYPBjo1UdLfTHfs6Bu0ZXWCb//5e+UOEv
	TggBQe2R5rk75I/PLkVbcJ5lrtQb3AjNY/ZbDc5jPC7qoh9D5krmGJqZuc8HXYbWReQ6SleUBxX
	B+WriUea0KVWRKG/R49SZLJIGZEYYE4t1Nx7+ttIC+Ahrd1hnYHzDu6sds3AC6xGwjl2878pQVc
	sLLxLW4Jo5aD6hS58EAf6DYTyzaHlZxJTCMhD5S8hYJpEtO2tcqHHUVZsIkCKGHBLdsmgQGUduF
	rdroLUOLL+uvf5rWZ3KQq6xRRTtkO0PsivLO6jKfTg+/J/QtttEwybUnga5eA+vWrSI8qh30IiG
	9I3Yil9Fd6uWKKNXcVENdFr1o1bcu9HXQt0c8hnO0NHUDcc7eoHW8vIihD+aRZUDVlsVD5HUrHp
	4Jbw==
X-Google-Smtp-Source: AGHT+IHtD/yOqjLM+rFNdssH+JAF760ZUeiIQDphNcKI3KZh1n+usJPMdg2yJLTZGEngyvMADa9AxA==
X-Received: by 2002:a17:902:e841:b0:2a0:d4e3:7181 with SMTP id d9443c01a7336-2a2f283cb18mr164537475ad.49.1766525177950;
        Tue, 23 Dec 2025 13:26:17 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm133756765ad.8.2025.12.23.13.26.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:26:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/10] binutils: fix CVE-2025-11840
Date: Tue, 23 Dec 2025 13:25:57 -0800
Message-ID: <85e62aad46eb096cf92907288a3eb1b6f76072c4.1766525021.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766525021.git.steve@sakoman.com>
References: <cover.1766525021.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228499

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11840

PR 33455
[BUG] A SEGV in vfinfo at ldmisc.c:527
A reloc howto set up with EMPTY_HOWTO has a NULL name.  More than one
place emitting diagnostics assumes a reloc howto won't have a NULL
name.

https://sourceware.org/bugzilla/show_bug.cgi?id=33455

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6b0f53a36820da91eadfa9f466c22f92e4256e0]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0050-CVE-2025-11840.patch        | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0050-CVE-2025-11840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 426c00ce3f..d268880409 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -88,5 +88,6 @@ SRC_URI = "\
      file://CVE-2025-11413.patch \
      file://0048-CVE-2025-11494.patch \
      file://0049-CVE-2025-11839.patch \
+     file://0050-CVE-2025-11840.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0050-CVE-2025-11840.patch b/meta/recipes-devtools/binutils/binutils/0050-CVE-2025-11840.patch
new file mode 100644
index 0000000000..3fb4db880e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0050-CVE-2025-11840.patch
@@ -0,0 +1,37 @@
+From f6b0f53a36820da91eadfa9f466c22f92e4256e0 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 3 Nov 2025 09:03:37 +1030
+Subject: [PATCH] PR 33455 SEGV in vfinfo at ldmisc.c:527
+
+A reloc howto set up with EMPTY_HOWTO has a NULL name.  More than one
+place emitting diagnostics assumes a reloc howto won't have a NULL
+name.
+
+	PR 33455
+	* coffcode.h (coff_slurp_reloc_table): Don't allow a howto with
+	a NULL name.
+---
+ bfd/coffcode.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6b0f53a36820da91eadfa9f466c22f92e4256e0]
+CVE: CVE-2025-11840
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/coffcode.h b/bfd/coffcode.h
+index 1e5acc0032c..ce1e39131b4 100644
+--- a/bfd/coffcode.h
++++ b/bfd/coffcode.h
+@@ -5345,7 +5345,7 @@ coff_slurp_reloc_table (bfd * abfd, sec_ptr asect, asymbol ** symbols)
+       RTYPE2HOWTO (cache_ptr, &dst);
+ #endif	/* RELOC_PROCESSING */
+ 
+-      if (cache_ptr->howto == NULL)
++      if (cache_ptr->howto == NULL || cache_ptr->howto->name == NULL)
+ 	{
+ 	  _bfd_error_handler
+ 	    /* xgettext:c-format */
+-- 
+2.43.7
+
-- 
2.43.0


