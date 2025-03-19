Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2085DC36002
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:39 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.2959.1742372196162109906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fD7C2rTE;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223fb0f619dso110732955ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372195; x=1742976995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax+aVWiUr1vKokyCy6KsuxLt8SS/aV0dFC7ojI1gB0M=;
        b=fD7C2rTECtzHbX0Q72FsAWJWdjK/s0JL7wMnNIMN6jA9hUI7l57Ru+B9eMJdYQICHS
         p4RHLLlf8cqRVDoMuIE9CZFLFFDRfxUTiPo0Jyf6iPx9jofvzViVubEsBOBJjIc453zJ
         2z7MaNb2HmdY07UxOLtaegEdwKT6SSioX15Uwj6whGNIMnSKqFNi0ARJez+yJ8J38WuD
         QpJ6rnQnuCHdHtQ4kDLYs4jHIwaot6qffFH4q9iQec7yIJnwd+rUJmNzO/CMNVgFKJNs
         oTLQjGSc0HGj1tMavI8SctDZdTIINxYfUQlQ24zQyvBlZqMTXpMxi3ecrVTZmYzl5+7Y
         sDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372195; x=1742976995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ax+aVWiUr1vKokyCy6KsuxLt8SS/aV0dFC7ojI1gB0M=;
        b=Cy/Uyx9glURyqNCKs/wC2NYVyZLfT+gN6+Z4NWVwS7pcI0wIEh1/T60Qg/WIMLVTT9
         WX8TvkGO4RCO1jNm+mykjuT5U1ZeEMbHtnLmBy9Km92MRAk7mOHcWKhHMe845bHid7eU
         rRvV+E+1oedj4bfZ9UQcwfrZPrZ9XeR3kuy1+vleCin1Yp4aPP1pZHEyLsJwsf8WGybp
         yYt79LOxyK64vZ+VZLVVNdvf5o4CQGKOIxPQ2pYl+AljNGuZXAA+6pl4s4Rtw8BS+Cy3
         pEWsqj6SF12H/3FhnXIeVsLzUygp0f2R+iCXD5Wp4I0Y3NhyM0zyBV0g2D23anWk3Tly
         samw==
X-Gm-Message-State: AOJu0YwPYaW8DqAC6lXcvGX8OQ1a7YnmAKx9emfCL7IAnPP+SVZVB4Lu
	WhNlYDccWH/UtL9650Yf5FWeb6Z+quwbV21yvkRocAVcjlWFm5fibQ7yk7Ut
X-Gm-Gg: ASbGncvbaYc4tjifprrEn1g5qgn+JTFg1+oJ7o7q5vub4eUpSEwhi5hg8CCrX2WrD1F
	ABbetOw81RNspRaFPnQsI9fC7WSUcfz90Ndhss02ixLxfqojg38n5/znxOT2Jp01DCW08I8wcao
	QTMe5Or31M4z2ALAB4YBRy07scbWWY5HfdSC08mqLcUCkzcI0bzfwo+vC44qoHSijw0SBz3oK13
	7D90eJoE26/yecpPtf+Foe/qQXRMncjT2QOGNHD9J+pbsN3j01QOh1RLn+SXVjB58+FjV5UcYi5
	q/YUXRkjzYwdUTlq5L5qSVEWkxfYUyP/HfDVi23YkEd/Rd8=
X-Google-Smtp-Source: AGHT+IG9jHwH0W5u3+iyGCtXY5b0VzFpb7so7UgJpCy5AtYsYI8fr1UnosxErsj9krJlZ4W/eX17KQ==
X-Received: by 2002:a05:6a20:c908:b0:1f5:8a1d:38fd with SMTP id adf61e73a8af0-1fbeb3911c3mr3521986637.2.1742372195328;
        Wed, 19 Mar 2025 01:16:35 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 19/27] cronie: Resolve build failure with GCC15
Date: Wed, 19 Mar 2025 01:15:54 -0700
Message-ID: <20250319081610.3536475-26-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213292

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

