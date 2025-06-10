Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C56C71136
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:40 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.96525.1749584311896289107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HtJgJTix;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso4812158b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584311; x=1750189111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkBBiS+lB+k62SBufSTZAVUcqwzbwTi8K4OUxwNV83c=;
        b=HtJgJTixhSNA7W/o1kI8OfQULgjZwqLSypGrChywykPg51JlJgMCkf71j9FCC4S+dn
         nBT3nn+aCVXKOrBW9H4WvSBHJLbgSCXTH3wvYHQR/ey1qIR62a5RHN2Wzl77t9ZfSc1w
         r3rPCzhOkdwiw1ffZ1NPOolenVMtJpMTklevspraGYopDcVHUW6Y40sh4X+//j+nl+mX
         F1Vio2lXpX1Bo0nBHysMmYsHpgFAdycPDbjMyzs5OkrpnEQIRyOBt0CIL3kT4/Ov/hMj
         2xD2HqGcox60kYOEi7nbWxawkz7WIZwkFXb7dVC+4ulxCCtsCaMVBmB6SMCM+rO26KPC
         ZqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584311; x=1750189111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkBBiS+lB+k62SBufSTZAVUcqwzbwTi8K4OUxwNV83c=;
        b=P2Vf2DWJKCawep1B/oaNnkbruBPbCsPlWVn7fBhkLm1t4eNdJWWRov6BayIauqzXf7
         ++bFzJNPUIw09GuRVhJ8HxGQvMJSTaoOjiVoUu3By07Q0pdKuQe3TuOZ6eVp6Bo5e+25
         1Z79PNmNoYoyIv19X1crvWUbqG/ASboj1wZzlIshg8Q9rf+Kfgy5as5sVWXlD91bYUdq
         hEuUWLPxrnMm568MLE7Q/j2jlED0Imv4PHId7+vsw/fjU5dGyqAQxSy+TSz5NF0utqOa
         5fSF/jAqvkWyV5nDRVRgepU0IDBq6exzoAf2YQAr1IX/Lg+zRhHYsLbr31W53HJh0xUE
         J+tQ==
X-Gm-Message-State: AOJu0Ywq5Etpkp1PaFxypLvGUr3GOvLZoAScGLlv7YTAW9LJV0aGG4jP
	BkFwhSu88ss/30xnhgwsK+BmTD6IMCY5rhh0ado2cfOrb9NPEKH2hTA/pZRpLhIKsCgu6oEdt9w
	+kzgB
X-Gm-Gg: ASbGncss6bRRAKLrUf5stSR0qFitEidARPbibvD1bepJeWeDJ5s0mi9PFYcZCwt/hnr
	UAl082wRHP3s0R7LR0eUQmQ24sndEjOSgFsUjioqKtH5xhAzwaz98Pj80F0WvjCKNgT7niSJ/JZ
	OAbGfq9JAJZ4bsvJKkJZJEBIlYNsNFrse4GNEH+8jwM2i/K0xQ6foRDO2e4stV3G+6v/alJvLRF
	QT7Y2YYGVelk4ID+vfd0Zfv63TG3qdIRURdTBw54HNPUNBOUgph/K2FQxaQ51OV6IELaijeVo5M
	rDrx7yIkc9HYfROqt/5QhN0XkvB7qH5eX/Uq2wWDKoI85XpQhjb2+AGihufKY/e1
X-Google-Smtp-Source: AGHT+IGR1ohmgs+TO8b/wY6/SWZ+Fx4vEQlsHe56tOPg4pDqKJ4HQYJkhfa3tmTe8rwsytugJVD5oQ==
X-Received: by 2002:a05:6a21:7a43:b0:1f5:8678:1820 with SMTP id adf61e73a8af0-21f8660e5c3mr1156874637.12.1749584311077;
        Tue, 10 Jun 2025 12:38:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/15] icu: fix CVE-2025-5222
Date: Tue, 10 Jun 2025 12:38:08 -0700
Message-ID: <a7a82be3b409d496f7a0813055f77212a3b0ef12.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218424

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/unicode-org/icu/commit/2c667e31cfd0b6bb1923627a932fd3453a5bac77

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../icu/icu/CVE-2025-5222.patch               | 164 ++++++++++++++++++
 meta/recipes-support/icu/icu_70.1.bb          |   1 +
 2 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/CVE-2025-5222.patch

diff --git a/meta/recipes-support/icu/icu/CVE-2025-5222.patch b/meta/recipes-support/icu/icu/CVE-2025-5222.patch
new file mode 100644
index 0000000000..f71287c935
--- /dev/null
+++ b/meta/recipes-support/icu/icu/CVE-2025-5222.patch
@@ -0,0 +1,164 @@
+From 2c667e31cfd0b6bb1923627a932fd3453a5bac77 Mon Sep 17 00:00:00 2001
+From: Frank Tang <ftang@chromium.org>
+Date: Wed, 22 Jan 2025 11:50:59 -0800
+Subject: [PATCH] ICU-22973 Fix buffer overflow by using CharString
+
+Upstream-Status: Backport [https://github.com/unicode-org/icu/commit/2c667e31cfd0b6bb1923627a932fd3453a5bac77]
+CVE: CVE-2025-5222
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/genrb/parse.cpp | 47 +++++++++++++++++++++---------------
+ 1 file changed, 28 insertions(+), 19 deletions(-)
+
+diff --git a/tools/genrb/parse.cpp b/tools/genrb/parse.cpp
+index 7d5ffe1..175def0 100644
+--- a/tools/genrb/parse.cpp
++++ b/tools/genrb/parse.cpp
+@@ -818,7 +818,7 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+     struct UString    *tokenValue;
+     struct UString     comment;
+     enum   ETokenType  token;
+-    char               subtag[1024];
++    CharString         subtag;
+     UnicodeString      rules;
+     UBool              haveRules = FALSE;
+     UVersionInfo       version;
+@@ -854,7 +854,8 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+             return NULL;
+         }
+ 
+-        u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
++        subtag.clear();
++        subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
+ 
+         if (U_FAILURE(*status))
+         {
+@@ -862,7 +863,7 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+             return NULL;
+         }
+ 
+-        member = parseResource(state, subtag, NULL, status);
++        member = parseResource(state, subtag.data(), NULL, status);
+ 
+         if (U_FAILURE(*status))
+         {
+@@ -873,7 +874,7 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+         {
+             // Ignore the parsed resources, continue parsing.
+         }
+-        else if (uprv_strcmp(subtag, "Version") == 0 && member->isString())
++        else if (uprv_strcmp(subtag.data(), "Version") == 0 && member->isString())
+         {
+             StringResource *sr = static_cast<StringResource *>(member);
+             char     ver[40];
+@@ -890,11 +891,11 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+             result->add(member, line, *status);
+             member = NULL;
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
+@@ -1047,7 +1048,7 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+     struct UString    *tokenValue;
+     struct UString     comment;
+     enum   ETokenType  token;
+-    char               subtag[1024], typeKeyword[1024];
++    CharString         subtag, typeKeyword;
+     uint32_t           line;
+ 
+     result = table_open(state->bundle, tag, NULL, status);
+@@ -1089,7 +1090,8 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+                 return NULL;
+             }
+ 
+-            u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
++            subtag.clear();
++            subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
+ 
+             if (U_FAILURE(*status))
+             {
+@@ -1097,9 +1099,9 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+                 return NULL;
+             }
+ 
+-            if (uprv_strcmp(subtag, "default") == 0)
++            if (uprv_strcmp(subtag.data(), "default") == 0)
+             {
+-                member = parseResource(state, subtag, NULL, status);
++                member = parseResource(state, subtag.data(), NULL, status);
+ 
+                 if (U_FAILURE(*status))
+                 {
+@@ -1118,22 +1120,28 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+                 if(token == TOK_OPEN_BRACE) {
+                     token = getToken(state, &tokenValue, &comment, &line, status);
+                     TableResource *collationRes;
+-                    if (keepCollationType(subtag)) {
+-                        collationRes = table_open(state->bundle, subtag, NULL, status);
++		    if (keepCollationType(subtag.data())) {
++                        collationRes = table_open(state->bundle, subtag.data(), NULL, status);
+                     } else {
+                         collationRes = NULL;
+                     }
+                     // need to parse the collation data regardless
+-                    collationRes = addCollation(state, collationRes, subtag, startline, status);
++                    collationRes = addCollation(state, collationRes, subtag.data(), startline, status);
+                     if (collationRes != NULL) {
+                         result->add(collationRes, startline, *status);
+                     }
+                 } else if(token == TOK_COLON) { /* right now, we'll just try to see if we have aliases */
+                     /* we could have a table too */
+                     token = peekToken(state, 1, &tokenValue, &line, &comment, status);
+-                    u_UCharsToChars(tokenValue->fChars, typeKeyword, u_strlen(tokenValue->fChars) + 1);
+-                    if(uprv_strcmp(typeKeyword, "alias") == 0) {
+-                        member = parseResource(state, subtag, NULL, status);
++		    typeKeyword.clear();
++                    typeKeyword.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
++                    if (U_FAILURE(*status))
++                    {
++                        res_close(result);
++                        return nullptr;
++                    }
++                    if(uprv_strcmp(typeKeyword.data(), "alias") == 0) {
++                        member = parseResource(state, subtag.data(), NULL, status);
+                         if (U_FAILURE(*status))
+                         {
+                             res_close(result);
+@@ -1175,7 +1183,7 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
+     struct UString    *tokenValue=NULL;
+     struct UString    comment;
+     enum   ETokenType token;
+-    char              subtag[1024];
++    CharString        subtag;
+     uint32_t          line;
+     UBool             readToken = FALSE;
+ 
+@@ -1214,7 +1222,8 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
+         }
+ 
+         if(uprv_isInvariantUString(tokenValue->fChars, -1)) {
+-            u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
++            subtag.clear();
++            subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
+         } else {
+             *status = U_INVALID_FORMAT_ERROR;
+             error(line, "invariant characters required for table keys");
+@@ -1227,7 +1236,7 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
+             return NULL;
+         }
+ 
+-        member = parseResource(state, subtag, &comment, status);
++        member = parseResource(state, subtag.data(), &comment, status);
+ 
+         if (member == NULL || U_FAILURE(*status))
+         {
+-- 
+2.49.0
+
diff --git a/meta/recipes-support/icu/icu_70.1.bb b/meta/recipes-support/icu/icu_70.1.bb
index dd684fe5b9..0a4e7f90f6 100644
--- a/meta/recipes-support/icu/icu_70.1.bb
+++ b/meta/recipes-support/icu/icu_70.1.bb
@@ -107,6 +107,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://filter.json \
            file://fix-install-manx.patch \
            file://0001-icu-Added-armeb-support.patch \
+           file://CVE-2025-5222.patch \
            "
 
 SRC_URI:append:class-target = "\
-- 
2.43.0


