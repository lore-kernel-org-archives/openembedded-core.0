Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE27C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:23 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.82423.1752510198361288467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tidvBHeq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4911467b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510197; x=1753114997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqTMffA6VXTd+AyTkFDnnVtr3ujR6Q646wlvs6bXNhA=;
        b=tidvBHeqG7iS1vDHW2I8OaL402p1ZYpGjA60wVjykk1F5Dkj6v/ohblGGjKzj60gtk
         S+z0V9SGL+/NfVLJThfALVkRHRyncYwP8ZuF0bve/bxjbIbIKXODPAh2/Jzzr6EDx/4W
         4IYx972MJSmdN0SeNgPbKdKpuzMQmEuIwGlEM6DcOslO90hU/2LijTm3CEw2gZIrDZnH
         cx5sK45/Ul3fi4gYoc/OttchdnCbvAi2RJ7uo3K79myeze1OlNMMTQmfOfv6mRE5WqFt
         NyJVjGKUXTO4MNgGAdJpGPvyripzNYcHcl/Z5NV8eotWUjprfQnkpeUCAk7LRwwRp1//
         i90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510197; x=1753114997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqTMffA6VXTd+AyTkFDnnVtr3ujR6Q646wlvs6bXNhA=;
        b=SwgWLl2zgD+wHEdFu4lWRW0NWVteVMdU62uCHbx05RYAdzcz/8DAlyp2JlUGbPtVoz
         I/6BvDkLrMs4S2EkeXkJJozT2cmp7/refgd5MYCToCtcSnMlcdE9EyHzF0tycThI3oyB
         jOO62qFPVnGD6mrb5O0d/CVZBJ/cEBg1oqG+LOVz8HLqF+7Ccd4883EXL7hjKlqs2l0K
         sRoqeviJ4GP87YPadb5tSe41Xrib9wxJObhgLapqiIhBMVSP2hLOTJO8hDHQJ/74uPxl
         InX/5jt/E9jSBIPhNrIyuXLdisb549S7iPajPBDyMdHcCxVSyCsEtSdZebmKyuQnHo3B
         rOiQ==
X-Gm-Message-State: AOJu0YzfDqGC2T5VZxpgLt7sCYj7Jm9wYMjB5JyfiaKv3Vjb5POalFev
	8T6UH3SFbWQgldFme4CYNR/gjEoeaF8bSMvE4kVaFRaXLZbbAOET0CtItc6qpPL+NerPb8I5vwv
	69jbr
X-Gm-Gg: ASbGncsGyW+CpSzK776PXTzMFeM5RzucXF3UyZfMTzZmbbfKHSEc+rZLb4CwNG5Vs7x
	K51l+GTfQVEAUbm4TNJVazZxrRiaNw0RnY3R6P7e4VqNOYAH/LGLnBX7Y9hzoxQ9iSNvXjI3XSW
	eZxz8d1Il2VqtTZrXR9YfPoTYvFka6sQdHtODVnGXxs12hTWXYTWxfoz62wzFnCBK2iRk5BPbub
	k3hBNpDfox11nulPsFm+fH3u/SqF+PTGh+QscZsPL7SfMmCepxPM99lU6TVd9k+ZzFuaW4Ry1Us
	Gywwzki2VHlnf5Akd9Dl52IlMeR8wPS+D0ep9Dh1q1EqxZOfMLzW36XAZ0+9NLWDRqJNVf/5kt9
	+yf+iIfymPzcj
X-Google-Smtp-Source: AGHT+IHiloSNtELZ2tOzncmbuAB9TRWOpQkmcvRgg3FIROj72baHe86Obe6l2LZVfs+mfW2g0Gbw1g==
X-Received: by 2002:a05:6a00:178c:b0:748:2f4e:ab4e with SMTP id d2e1a72fcca58-74ee284c884mr19687703b3a.11.1752510197386;
        Mon, 14 Jul 2025 09:23:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 01/15] icu: fix CVE-2025-5222
Date: Mon, 14 Jul 2025 09:22:55 -0700
Message-ID: <674a3780bb76f4c8adf92d4f91cc9146d32787aa.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220239

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
 meta/recipes-support/icu/icu_76-1.bb          |   1 +
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
diff --git a/meta/recipes-support/icu/icu_76-1.bb b/meta/recipes-support/icu/icu_76-1.bb
index f11e72d356..24470ec330 100644
--- a/meta/recipes-support/icu/icu_76-1.bb
+++ b/meta/recipes-support/icu/icu_76-1.bb
@@ -119,6 +119,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            ${DATA_SRC_URI};name=data \
            file://filter.json \
            file://0001-icu-Added-armeb-support.patch \
+           file://CVE-2025-5222.patch \
            "
 
 SRC_URI:append:class-target = "\
-- 
2.43.0


