Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5B9C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 06:26:55 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5021.1748932011814240377
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 23:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Uie032Go;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2352e3db62cso34655295ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 23:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1748932011; x=1749536811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OtfqV7tr/qj3UeHQ1TaZdeyr8iUiUgOhBmRyOKycAQk=;
        b=Uie032Go1gMKA+2CUCy5fU66rWjZm6OjtQnYaSjfsbKztCS8fc9+SE4yOIEfAIf9bh
         R0/gICBseVwDKmm3aPijm4wYHsSMz/nbP0QCCBBHMRupJVCuaqlbgeCuKFKs4RkJU++B
         jisTgPK5awSURYjJA8iX3c5Vj/EUWZM5Qv+c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748932011; x=1749536811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtfqV7tr/qj3UeHQ1TaZdeyr8iUiUgOhBmRyOKycAQk=;
        b=Iaf8FbWE0CBUwgdR0UCyyDx/DKAaxLlgH01JLG1Tf+qf0vfIwiWEpPHvrmTe/VDtji
         Xw07QqbAMbt09NfRD4lzsZUh5PLHGN4gDcPNx3/WB6l6SytHea2DCC+8d/zAl7ZpVgSO
         Y3z8FCTxDAyyqRJ3S549uzh8DKeY0rTNqA2gaikTxmls16aG7ixVqBRNdKYUTOzq/+RG
         iyaQhSD5u07/ZjLAAFFOx5eiwh1YgM3nK3yrde1Dg0mXlYcn3UM+BhIBuomMgX/eZMrE
         LbUtNOLp3Dh37ZUtn5DkbAd4NUUtwwLadrb+tsaDEJRoPq6HTsh3i9plRT0xil0PKZ9q
         Q7IA==
X-Gm-Message-State: AOJu0YyGn5alUZnPPVMPPywxvZ9RklZqAGqNOYASspnEc04zlU/jBwSb
	hbAR8zvpqD36gZhLYQjLvHANWGIs512a9V3w5Ub4LF72qfNYYX4Z9TXfd81hz84hhulJZ4ZMTV0
	Eemn9
X-Gm-Gg: ASbGncsEKPeBQAY7AxSvGYQLouw5uVhwwSCd6XIOhzcfzl5SII4kkzYFlx9/fnkmr/Z
	8kRltBjXyCbfqS5yQa74nwMHeE7sdDynyZSMpvzEuq7Fn4ggHeGNHpJJiV+fRCKdqpSwuTAN+H3
	hY/7RQtIzm0c4XhK7Zuwxzah8g8gsGDhkatdYeb6Ko/ywurQ5Il3fLuaC45tg3QXwtJeJQjrZxT
	rw9jq1RPHZKSkRGc8tnUQqhiA9LQVru/4UOvXulPll9cwndC0e7IiRDk1tuYuDYJX0gJc8ly3lY
	brmaR0thI618Rzg1bHbJUYueIMzWY2SXubPnegdgCaVeTPXL9zDACA1vCeSWjFmQJP+hznOrkls
	=
X-Google-Smtp-Source: AGHT+IE0hES+piVT4eivhHL8ojonxfkk5w3nXFHyXMsq7TNQJ1aJLcMAEiziLIiSuEsMiK1EUjQpTQ==
X-Received: by 2002:a17:903:3bc6:b0:234:a66d:cce5 with SMTP id d9443c01a7336-23529a0a3c5mr240318325ad.46.1748932011011;
        Mon, 02 Jun 2025 23:26:51 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bf330dsm80804625ad.105.2025.06.02.23.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 23:26:50 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] icu: fix CVE-2025-5222
Date: Tue,  3 Jun 2025 11:56:20 +0530
Message-ID: <20250603062620.46351-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 06:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217760

Upstream-Status: Backport from https://github.com/unicode-org/icu/commit/2c667e31cfd0b6bb1923627a932fd3453a5bac77

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.49.0


