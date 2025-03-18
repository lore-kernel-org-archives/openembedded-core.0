Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61945C35FF8
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:11 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.4314.1742272749129359108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L3DGysuH;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22548a28d0cso141197235ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272748; x=1742877548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax+aVWiUr1vKokyCy6KsuxLt8SS/aV0dFC7ojI1gB0M=;
        b=L3DGysuHHH/xFcVblG28fVQxoiGleAlC72UK6eIVQRhV0TxEAqwEe6tKhSNEGSzjWa
         2a2wMLIzT2dKnZ0l/tWk611cDbBB7VLNo1P4ikQc+yBHnzN5RkMvkFiGMgw/U/3n3W1C
         KLftmERVY7YQSl/W0RQDLpt/9YmD4NACYuXXLsntltovymGbSwX40XrF+KnZWx0q49sf
         byJE3NBQvBe926DQZ526pATymcFc2yAEyZQTpFm0q4nxmhXyikX2vzAecK1CjAtu8Ava
         hvzwvim+3jhRkEiLvTeTpYz2IQ5sru251hX2rbGgcuA/UDmv4lHej5Bj0fXIN/Hve/3f
         Dqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272748; x=1742877548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ax+aVWiUr1vKokyCy6KsuxLt8SS/aV0dFC7ojI1gB0M=;
        b=NqxyN4KKGEIUyxGOsavChwKya4WiSPrI93uWiDPy6PXxkk6GgJnTSRv+nHy1tFpteQ
         oFEWfnqRu+Svw65RsNpU1zYSWIuVVxPTrmT0ClEN7+VzTumtlRyX7cOvJwXLTUzal+1R
         ObEcfMReu3UpSC35qKWp3y7J51l9ZFN4aWqD9WCk98tpQ8cuLiyl1xUY9oWCnwKolBac
         h1QYZmDZpTHGrcFv4F4t6QES/56/bI8mj+g1EyUofRX2WIVVQEnk2Xlglja4+h564UjD
         WQl0i/ejHcK28Ka4RM1o75326X8F3KKlITAzzAtCsaX5rbTExsCYFM6fe+bSt5I0zIL5
         3htQ==
X-Gm-Message-State: AOJu0YzT3nUXPNM/W752rP0lDSZSyX81S9MnsysTaLEnsp2MoZqjdYon
	hZPNJdCBlElSoV7gVL9l4T9Z2KBOZwHtMKA7flmJCoCWEVYeBj31h4A543Qw
X-Gm-Gg: ASbGnct2jHDbQlsl5h9fxXoJPTurLcTRPVSBo3QemS0mv/knMkpbHHJS0tZcVL1uoSI
	4uGUUCUcOJgFRUOmxWVpCauL8ddXD3afTC/044rb3Wyj7CwUPNxSzLesAkh8RtQ7LleRZCF8mHs
	KlPAhcwTLOyT93MssxV5wOnd/Wjj9CDnqZSa4Z8GbSRkz9DnsObYBgReoq+Ppcd/FtgwYHLONpV
	D8RoSc4B4k2ekdY9YFJpzZYj9uNcjUKlcJQ11MsM2WFR5ntqo0dyakVI2kuSeVLqca9M56hlrR0
	RjhelwX1mKdqMlFNNVoCRnvKUFoQkOWocHNE
X-Google-Smtp-Source: AGHT+IGOf7zwoBHRRxucO4K8Q28rPA390V31NgSSMLo50rIHE8929gowreBT016QioQMdcnw76WV1Q==
X-Received: by 2002:a17:902:eccf:b0:224:f12:3734 with SMTP id d9443c01a7336-225e0a7b300mr193137645ad.30.1742272748311;
        Mon, 17 Mar 2025 21:39:08 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 21/24] cronie: Resolve build failure with GCC15
Date: Mon, 17 Mar 2025 21:38:41 -0700
Message-ID: <20250318043846.2422141-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213155

Fix function prototypes for C23 to work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../make_error_func_prototype_complete.patch  | 41 +++++++++++++++++++
 meta/recipes-extended/cronie/cronie_1.7.2.bb  |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/cronie/cronie/make_error_func_prototype_complete.patch

diff --git a/meta/recipes-extended/cronie/cronie/make_error_func_prototype_complete.patch b/meta/recipes-extended/cronie/cronie/make_error_func_prototype_complete.patch
new file mode 100644
index 00000000000..71f0153ec6f
--- /dev/null
+++ b/meta/recipes-extended/cronie/cronie/make_error_func_prototype_complete.patch
@@ -0,0 +1,41 @@
+From 09c630c654b2aeff06a90a412cce0a60ab4955a4 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tmraz@fedoraproject.org>
+Date: Mon, 18 Nov 2024 21:02:30 +0100
+Subject: [PATCH] load_entry(): Make error_func prototype complete
+
+Fixes #193
+
+Upstream-Status: Backport [https://github.com/cronie-crond/cronie/commit/09c630c654b2aeff06a90a412cce0a60ab4955a4]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/entry.c | 2 +-
+ src/funcs.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/entry.c b/src/entry.c
+index 586eb9d..a2077e8 100644
+--- a/src/entry.c
++++ b/src/entry.c
+@@ -90,7 +90,7 @@ void free_entry(entry * e) {
+ /* return NULL if eof or syntax error occurs;
+  * otherwise return a pointer to a new entry.
+  */
+-entry *load_entry(FILE * file, void (*error_func) (), struct passwd *pw,
++entry *load_entry(FILE * file, void (*error_func) (const char *), struct passwd *pw,
+ 	char **envp) {
+ 	/* this function reads one crontab entry -- the next -- from a file.
+ 	 * it skips any leading blank lines, ignores comments, and returns
+diff --git a/src/funcs.h b/src/funcs.h
+index 427e027..f28d634 100644
+--- a/src/funcs.h
++++ b/src/funcs.h
+@@ -89,7 +89,7 @@ char		*env_get(const char *, char **),
+ user		*load_user(int, struct passwd *, const char *, const char *, const char *),
+ 		*find_user(cron_db *, const char *, const char *);
+ 
+-entry		*load_entry(FILE *, void (*)(), struct passwd *, char **);
++entry		*load_entry(FILE *, void (*)(const char *), struct passwd *, char **);
+ 
+ FILE		*cron_popen(char *, const char *, struct passwd *, char **);
+ 
diff --git a/meta/recipes-extended/cronie/cronie_1.7.2.bb b/meta/recipes-extended/cronie/cronie_1.7.2.bb
index 496ca39fd71..b250717ab81 100644
--- a/meta/recipes-extended/cronie/cronie_1.7.2.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.2.bb
@@ -17,6 +17,7 @@ SECTION = "utils"
 GITHUB_BASE_URI = "https://github.com/cronie-crond/${BPN}/releases/"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/cronie-${PV}/cronie-${PV}.tar.gz \
+           file://make_error_func_prototype_complete.patch \
            file://crond.init \
            file://crontab \
            file://crond.service \

