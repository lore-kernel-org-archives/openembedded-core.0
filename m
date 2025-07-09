Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EA4C83F14
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:51:41 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.5625.1752029495732724043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f8mAoBev;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b34ab678931so3708658a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752029495; x=1752634295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGnudlt+U8rAXBOd6hnlQskqRTW15rYb/bXpG1t0+qI=;
        b=f8mAoBevnGx2bXt9kHx7hKkg1+J0hpUS2Lnx5KInBeLI2igjn63TXfj/G7+fzkehaK
         L1v41v4KRzgcHcZYiBU5NVKVbdcQZfj+TMKYo/umsmlkO0pqunTq5r2dv5W6M8GwUu80
         XkN1eOFKeyjgZZVUIMn2EaP3SICswevbyOXDjzdJEpYph/jIbCaswkmZL204MZTJAyDS
         iyZiGdzU5KIuQqoZR3zfrknpCopeCOe01bZf///lpgyPm3n2aXCTqcpFy7b6W5eEeozp
         pfoD/+w6wMo+d4XOmoIGGzmCQDE5ZkqfSO9tHc7GZgPBjpFyTNEiDTvLTW2x/pNh3/Ya
         baSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029495; x=1752634295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGnudlt+U8rAXBOd6hnlQskqRTW15rYb/bXpG1t0+qI=;
        b=WDz14Pn1L4y4wWZKAjXnFxKdGVnUL2nJla8xUikRYFQdh8poYRRR9iF0pibNmlcnwp
         1Zb5ZotqyiGJmj1WOBeXSt75b1GnwRnXgxFIokB83Em9aZumJKGnvav7Q08fJqkdX1BF
         kqZJ8ZnR86Qycwpf1Uh3Q/eiOLcdvrVqRk//XCwaUBL63zKGjzQ/q2Q15cuTs+DD+PeG
         YxxMBV59z9r4gTbYs2epFRxqls89H2IlES0fRf/N3SRn+iN+Ncp6kJiAhFqOnrO6YaGu
         eFxGoUgt5UxRBhMueHBu57/ild8s70zI73jogqWe+bKyGo/WiMO32P79wklh5LHds23o
         iI8g==
X-Gm-Message-State: AOJu0Yyl6jbYS2RUOCvq9NRJLd46Tfg0s9tWbCz13KXW6y+KeVk1jC8C
	VcgY/euPdFwFDWhFliWmbBs13IR6JMcJOdDfeH5Rnaw0AXWv2smv4cmowVdn+i2nykagllmymSv
	6GyGw
X-Gm-Gg: ASbGncvWF8vovh+vbb1ksCwm2Ms0p/z8BuHJ/w6EgYZn+wro5W0F3iHol7XHpz496dU
	ktDAJQLX3/j4PscAdd445Zx7qcAO6rU4OF0CZfJBE4ZjQIAB/qpMG52V22RrwVvSk4MYWS9zVVz
	+LZQilHAhY8pvodhMbqh4vg8G27mdX6L8zX379LkiWxuwsMA2SXcIGAbhD4clj5U1sGGy4KHV/g
	bBjpEES/pq412KTvs6V650cb2WXuQ5PTpOgQxH8s55nATV4QBG5+vkrmUz9qy+iybhukaSBgIR6
	ExUkvU/tSwVRH9TbbGCMXCGqXH8iuhWwoWTHE+oBPr39c7glwzhBiA==
X-Google-Smtp-Source: AGHT+IG73PfPZzKT6jSKS/4Lu2ojH6+RFT3/iLlZhpvwzpl4zTr+peT62fEa/kLcD/gPr2c8L5EuEw==
X-Received: by 2002:a17:903:484:b0:234:8c64:7878 with SMTP id d9443c01a7336-23ddb19ae5dmr8489835ad.11.1752029494891;
        Tue, 08 Jul 2025 19:51:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm121979075ad.199.2025.07.08.19.51.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:51:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/12] icu: fix CVE-2025-5222
Date: Tue,  8 Jul 2025 19:51:14 -0700
Message-ID: <a35ff17a0985389842c89e35f264f1d9f2b6bbae.1752029282.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752029282.git.steve@sakoman.com>
References: <cover.1752029282.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220060

From: Changqing Li <changqing.li@windriver.com>

CVE-2025-5222:
A stack buffer overflow was found in Internationl components for unicode
(ICU ). While running the genrb binary, the 'subtag' struct overflowed
at the SRBRoot::addTag function. This issue may lead to memory
corruption and local arbitrary code execution.

Refer:
https://nvd.nist.gov/vuln/detail/CVE-2025-5222
https://unicode-org.atlassian.net/browse/ICU-22957
https://github.com/unicode-org/icu/commit/2c667e31cfd0b6bb1923627a932fd3453a5bac77

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../icu/icu/CVE-2025-5222.patch               | 166 ++++++++++++++++++
 meta/recipes-support/icu/icu_74-2.bb          |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/CVE-2025-5222.patch

diff --git a/meta/recipes-support/icu/icu/CVE-2025-5222.patch b/meta/recipes-support/icu/icu/CVE-2025-5222.patch
new file mode 100644
index 0000000000..276d9e4f90
--- /dev/null
+++ b/meta/recipes-support/icu/icu/CVE-2025-5222.patch
@@ -0,0 +1,166 @@
+From b5fd1ccf1068140ca9333878f2172a0947986ca8 Mon Sep 17 00:00:00 2001
+From: Frank Tang <ftang@chromium.org>
+Date: Wed, 22 Jan 2025 11:50:59 -0800
+Subject: [PATCH] ICU-22973 Fix buffer overflow by using CharString
+
+CVE: CVE-2025-5222
+Upstream-Status: Backport [https://github.com/unicode-org/icu/commit/2c667e31cfd0b6bb1923627a932fd3453a5bac77]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tools/genrb/parse.cpp | 49 +++++++++++++++++++++---------------
+ 1 file changed, 29 insertions(+), 20 deletions(-)
+
+diff --git a/tools/genrb/parse.cpp b/tools/genrb/parse.cpp
+index f487241..eb85d51 100644
+--- a/tools/genrb/parse.cpp
++++ b/tools/genrb/parse.cpp
+@@ -1153,7 +1153,7 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+     struct UString    *tokenValue;
+     struct UString     comment;
+     enum   ETokenType  token;
+-    char               subtag[1024];
++    CharString         subtag;
+     UnicodeString      rules;
+     UBool              haveRules = false;
+     UVersionInfo       version;
+@@ -1189,15 +1189,15 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+             return nullptr;
+         }
+ 
+-        u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
+-
++        subtag.clear();
++        subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
+         if (U_FAILURE(*status))
+         {
+             res_close(result);
+             return nullptr;
+         }
+ 
+-        member = parseResource(state, subtag, nullptr, status);
++        member = parseResource(state, subtag.data(), nullptr, status);
+ 
+         if (U_FAILURE(*status))
+         {
+@@ -1208,7 +1208,7 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+         {
+             // Ignore the parsed resources, continue parsing.
+         }
+-        else if (uprv_strcmp(subtag, "Version") == 0 && member->isString())
++        else if (uprv_strcmp(subtag.data(), "Version") == 0 && member->isString())
+         {
+             StringResource *sr = static_cast<StringResource *>(member);
+             char     ver[40];
+@@ -1225,11 +1225,11 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+             result->add(member, line, *status);
+             member = nullptr;
+         }
+-        else if(uprv_strcmp(subtag, "%%CollationBin")==0)
++        else if(uprv_strcmp(subtag.data(), "%%CollationBin")==0)
+         {
+             /* discard duplicate %%CollationBin if any*/
+         }
+-        else if (uprv_strcmp(subtag, "Sequence") == 0 && member->isString())
++        else if (uprv_strcmp(subtag.data(), "Sequence") == 0 && member->isString())
+         {
+             StringResource *sr = static_cast<StringResource *>(member);
+             rules = sr->fString;
+@@ -1395,7 +1395,7 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+     struct UString    *tokenValue;
+     struct UString     comment;
+     enum   ETokenType  token;
+-    char               subtag[1024], typeKeyword[1024];
++    CharString         subtag, typeKeyword;
+     uint32_t           line;
+ 
+     result = table_open(state->bundle, tag, nullptr, status);
+@@ -1437,7 +1437,8 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+                 return nullptr;
+             }
+ 
+-            u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
++            subtag.clear();
++            subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
+ 
+             if (U_FAILURE(*status))
+             {
+@@ -1445,9 +1446,9 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+                 return nullptr;
+             }
+ 
+-            if (uprv_strcmp(subtag, "default") == 0)
++            if (uprv_strcmp(subtag.data(), "default") == 0)
+             {
+-                member = parseResource(state, subtag, nullptr, status);
++                member = parseResource(state, subtag.data(), nullptr, status);
+ 
+                 if (U_FAILURE(*status))
+                 {
+@@ -1466,22 +1467,29 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+                 if(token == TOK_OPEN_BRACE) {
+                     token = getToken(state, &tokenValue, &comment, &line, status);
+                     TableResource *collationRes;
+-                    if (keepCollationType(subtag)) {
+-                        collationRes = table_open(state->bundle, subtag, nullptr, status);
++                    if (keepCollationType(subtag.data())) {
++                        collationRes = table_open(state->bundle, subtag.data(), nullptr, status);
+                     } else {
+                         collationRes = nullptr;
+                     }
+                     // need to parse the collation data regardless
+-                    collationRes = addCollation(state, collationRes, subtag, startline, status);
++                    collationRes = addCollation(state, collationRes, subtag.data(), startline, status);
+                     if (collationRes != nullptr) {
+                         result->add(collationRes, startline, *status);
+                     }
+                 } else if(token == TOK_COLON) { /* right now, we'll just try to see if we have aliases */
+                     /* we could have a table too */
+                     token = peekToken(state, 1, &tokenValue, &line, &comment, status);
+-                    u_UCharsToChars(tokenValue->fChars, typeKeyword, u_strlen(tokenValue->fChars) + 1);
+-                    if(uprv_strcmp(typeKeyword, "alias") == 0) {
+-                        member = parseResource(state, subtag, nullptr, status);
++                    typeKeyword.clear();
++                    typeKeyword.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
++                    if (U_FAILURE(*status))
++                    {
++                        res_close(result);
++                        return nullptr;
++                    }
++
++                    if(uprv_strcmp(typeKeyword.data(), "alias") == 0) {
++                        member = parseResource(state, subtag.data(), nullptr, status);
+                         if (U_FAILURE(*status))
+                         {
+                             res_close(result);
+@@ -1523,7 +1531,7 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
+     struct UString    *tokenValue=nullptr;
+     struct UString    comment;
+     enum   ETokenType token;
+-    char              subtag[1024];
++    CharString        subtag;
+     uint32_t          line;
+     UBool             readToken = false;
+ 
+@@ -1562,7 +1570,8 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
+         }
+ 
+         if(uprv_isInvariantUString(tokenValue->fChars, -1)) {
+-            u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
++            subtag.clear();
++            subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
+         } else {
+             *status = U_INVALID_FORMAT_ERROR;
+             error(line, "invariant characters required for table keys");
+@@ -1575,7 +1584,7 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
+             return nullptr;
+         }
+ 
+-        member = parseResource(state, subtag, &comment, status);
++        member = parseResource(state, subtag.data(), &comment, status);
+ 
+         if (member == nullptr || U_FAILURE(*status))
+         {
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/icu/icu_74-2.bb b/meta/recipes-support/icu/icu_74-2.bb
index 3a4e197308..83753a18e5 100644
--- a/meta/recipes-support/icu/icu_74-2.bb
+++ b/meta/recipes-support/icu/icu_74-2.bb
@@ -121,6 +121,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://filter.json \
            file://fix-install-manx.patch \
            file://0001-icu-Added-armeb-support.patch \
+           file://CVE-2025-5222.patch \
            "
 
 SRC_URI:append:class-target = "\
-- 
2.43.0


