Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8FBC19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 19:37:55 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.17053.1659901065238380493
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 12:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hP8xrVMZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso7280123pjl.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 12:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=DUZqTwUuIhBVkC1HKH6n+5SDQnnqMct0M1g7GTascYU=;
        b=hP8xrVMZYIC7pUkUepNuvyaHjoKSo2VRlepcimkWOM1gdwnDj0TUUE99nTlK5HxX1a
         dHVIlFycrXGkQv7T3McZSIaVDPevFYxUeYRIF7ShPZ8MzqGCcLtwSLMIXMf37QbXUFic
         zou/4FfPR6nAosrCLbQhmOZbcGC2ok+yNggJkM01WR33yVmrr7XXjYM8oJlD7fdHg74P
         jBLCAXrNaBmAxKf+YdrZZ32l1S1DukYJi0iXvR/RtN2wjjgzYwAPpSIZQGnCquJNYpij
         rhw6JyWNmVHJhXCihENRTwRfwqOkMbnopECbZFZm8eLuIgFWsdHKdGfP8qkcgyQj9Awa
         pphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=DUZqTwUuIhBVkC1HKH6n+5SDQnnqMct0M1g7GTascYU=;
        b=5H65GfvDoWYpa8USnR3HNwDiPvb0HLnBVDzG0XvVxBn2kYUGQ/e5lEwadG3OEhtag+
         3EsY3TL0m9V5KqNQvRc6zi3V6sdoL5lEKfyXt6mog/lh2RLWjA2GndK9L9Zb0vsVXONN
         +saQNbEGwOc97C/o4RAvPFQmRbGq1dIvN+aqVVAy3lkcGNIrLYSm++Hi7MddzeWgL0SB
         X8QshNdVV/utpFmf8M8tryeCNe4B/VhlKZqo+FK2iNiOYlJWOLBcu5vOi9aS7z2wy5XG
         uEtViBtQumz3ZsAesCsGp7rPioP5XYXeaK5nwkm0ySgTX6m4N7VMwZGPiho6N01xIWzR
         JhDA==
X-Gm-Message-State: ACgBeo2vgFVEAafU31QaVpISkgO3DQImeghzMKyx51bxplYAhsBUOjkN
	O6uWUSCEiC+zjWk0ZF0A+/mjl/AKEmk=
X-Google-Smtp-Source: 
 AA6agR4f88w/xG4bJbJzHl14IaoJRPK8bN1zkTarAWJEvtccEML8858vhSD0bJvyr4drrzfKhSKkXA==
X-Received: by 2002:a17:90b:152:b0:1f3:2b02:90fe with SMTP id
 em18-20020a17090b015200b001f32b0290femr17546561pjb.198.1659901063999;
        Sun, 07 Aug 2022 12:37:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a170902ecc800b0016c5306917fsm7098718plh.53.2022.08.07.12.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 12:37:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] cracklib: Drop using register keyword
Date: Sun,  7 Aug 2022 12:37:40 -0700
Message-Id: <20220807193740.481373-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 19:37:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169005

Fixes
incompatible integer to pointer conversion passing

These errors are found with newer compilers e.g. clang-15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-rules-Drop-using-register-keyword.patch | 278 ++++++++++++++++++
 ...rrect-parameter-types-to-Debug-calls.patch |  40 +++
 .../cracklib/cracklib_2.9.7.bb                |   5 +-
 3 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch b/meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch
new file mode 100644
index 00000000000..a8446653eb8
--- /dev/null
+++ b/meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch
@@ -0,0 +1,278 @@
+From fe49471cfa7fe0618615c065f4c0ad04e888bf92 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Aug 2022 12:24:39 -0700
+Subject: [PATCH 1/2] rules: Drop using register keyword
+
+This is a deprecated keyword
+
+Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/48]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/rules.c | 94 ++++++++++++++++++++++++-------------------------
+ 1 file changed, 47 insertions(+), 47 deletions(-)
+
+diff --git a/lib/rules.c b/lib/rules.c
+index 3a2aa46..6e7a12a 100644
+--- a/lib/rules.c
++++ b/lib/rules.c
+@@ -67,8 +67,8 @@ Suffix(myword, suffix)
+     char *myword;
+     char *suffix;
+ {
+-    register int i;
+-    register int j;
++    int i;
++    int j;
+     i = strlen(myword);
+     j = strlen(suffix);
+ 
+@@ -83,10 +83,10 @@ Suffix(myword, suffix)
+ 
+ char *
+ Reverse(str)			/* return a pointer to a reversal */
+-    register char *str;
++    char *str;
+ {
+-    register int i;
+-    register int j;
++    int i;
++    int j;
+     static char area[STRINGSIZE];
+     j = i = strlen(str);
+     while (*str)
+@@ -99,9 +99,9 @@ Reverse(str)			/* return a pointer to a reversal */
+ 
+ char *
+ Uppercase(str)			/* return a pointer to an uppercase */
+-    register char *str;
++    char *str;
+ {
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE];
+     ptr = area;
+     while (*str)
+@@ -116,9 +116,9 @@ Uppercase(str)			/* return a pointer to an uppercase */
+ 
+ char *
+ Lowercase(str)			/* return a pointer to an lowercase */
+-    register char *str;
++    char *str;
+ {
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE];
+     ptr = area;
+     while (*str)
+@@ -133,9 +133,9 @@ Lowercase(str)			/* return a pointer to an lowercase */
+ 
+ char *
+ Capitalise(str)			/* return a pointer to an capitalised */
+-    register char *str;
++    char *str;
+ {
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE];
+     ptr = area;
+ 
+@@ -152,9 +152,9 @@ Capitalise(str)			/* return a pointer to an capitalised */
+ 
+ char *
+ Pluralise(string)		/* returns a pointer to a plural */
+-    register char *string;
++    char *string;
+ {
+-    register int length;
++    int length;
+     static char area[STRINGSIZE];
+     length = strlen(string);
+     strcpy(area, string);
+@@ -193,11 +193,11 @@ Pluralise(string)		/* returns a pointer to a plural */
+ 
+ char *
+ Substitute(string, old, new)	/* returns pointer to a swapped about copy */
+-    register char *string;
+-    register char old;
+-    register char new;
++    char *string;
++    char old;
++    char new;
+ {
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE];
+     ptr = area;
+     while (*string)
+@@ -211,11 +211,11 @@ Substitute(string, old, new)	/* returns pointer to a swapped about copy */
+ 
+ char *
+ Purge(string, target)		/* returns pointer to a purged copy */
+-    register char *string;
+-    register char target;
++    char *string;
++    char target;
+ {
+-    register char *ptr;
+-    static char area[STRINGSIZE];
++    char *ptr;
++    char area[STRINGSIZE];
+     ptr = area;
+     while (*string)
+     {
+@@ -238,11 +238,11 @@ Purge(string, target)		/* returns pointer to a purged copy */
+ 
+ int
+ MatchClass(class, input)
+-    register char class;
+-    register char input;
++    char class;
++    char input;
+ {
+-    register char c;
+-    register int retval;
++    char c;
++    int retval;
+     retval = 0;
+ 
+     switch (class)
+@@ -357,8 +357,8 @@ MatchClass(class, input)
+ 
+ char *
+ PolyStrchr(string, class)
+-    register char *string;
+-    register char class;
++    char *string;
++    char class;
+ {
+     while (*string)
+     {
+@@ -373,11 +373,11 @@ PolyStrchr(string, class)
+ 
+ char *
+ PolySubst(string, class, new)	/* returns pointer to a swapped about copy */
+-    register char *string;
+-    register char class;
+-    register char new;
++    char *string;
++    char class;
++    char new;
+ {
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE];
+     ptr = area;
+     while (*string)
+@@ -391,10 +391,10 @@ PolySubst(string, class, new)	/* returns pointer to a swapped about copy */
+ 
+ char *
+ PolyPurge(string, class)	/* returns pointer to a purged copy */
+-    register char *string;
+-    register char class;
++    char *string;
++    char class;
+ {
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE];
+     ptr = area;
+     while (*string)
+@@ -433,7 +433,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+     char *control;
+ {
+     int limit;
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE * 2] = {0};
+     char area2[STRINGSIZE * 2] = {0};
+     strcpy(area, input);
+@@ -523,7 +523,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 		return NULL;
+ 	    } else
+ 	    {
+-		register char *string;
++		char *string;
+ 		string = area;
+ 		while (*(string++));
+ 		string[-1] = *(++ptr);
+@@ -537,7 +537,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 		return NULL;
+ 	    } else
+ 	    {
+-		register int i;
++		int i;
+ 		int start;
+ 		int length;
+ 		start = Char2Int(*(++ptr));
+@@ -563,7 +563,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 		return NULL;
+ 	    } else
+ 	    {
+-		register int i;
++		int i;
+ 		i = Char2Int(*(++ptr));
+ 		if (i < 0)
+ 		{
+@@ -587,9 +587,9 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 		return NULL;
+ 	    } else
+ 	    {
+-		register int i;
+-		register char *p1;
+-		register char *p2;
++		int i;
++		char *p1;
++		char *p2;
+ 		i = Char2Int(*(++ptr));
+ 		if (i < 0)
+ 		{
+@@ -696,7 +696,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 		return NULL;
+ 	    } else
+ 	    {
+-		register int i;
++		int i;
+ 		if ((i = Char2Int(ptr[1])) < 0)
+ 		{
+ 		    Debug(1, "Mangle: '=' weird argument in '%s'\n", control);
+@@ -723,7 +723,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 	case RULE_DFIRST:
+ 	    if (area[0])
+ 	    {
+-		register int i;
++		int i;
+ 		for (i = 1; area[i]; i++)
+ 		{
+ 		    area[i - 1] = area[i];
+@@ -735,7 +735,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 	case RULE_DLAST:
+ 	    if (area[0])
+ 	    {
+-		register int i;
++		int i;
+ 		for (i = 1; area[i]; i++);
+ 		area[i - 1] = '\0';
+ 	    }
+@@ -771,7 +771,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 		return NULL;
+ 	    } else
+ 	    {
+-		register int i;
++		int i;
+ 
+ 		for (i = 0; area[i]; i++);
+ 
+@@ -815,8 +815,8 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 
+ int
+ PMatch(control, string)
+-register char *control;
+-register char *string;
++char *control;
++char *string;
+ {
+     while (*string && *control)
+     {
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch b/meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch
new file mode 100644
index 00000000000..a8692b0ccab
--- /dev/null
+++ b/meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch
@@ -0,0 +1,40 @@
+From 793921a8ee4ae7f20e1fd2bbec5196bc83176b01 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Aug 2022 12:25:24 -0700
+Subject: [PATCH 2/2] rules: Correct parameter types to Debug() calls
+
+Fixes
+src/lib/rules.c:346:45: error: incompatible integer to pointer conversion passing 'char' to parameter of type 'char *'; take the address with & [-Wint-conversion]
+src/lib/rules.c:804:53: error: incompatible integer to pointer conversion passing 'char' to parameter of type 'char *'; remove * [-Wint-conversion]                                           Debug(1, "Mangle: unknown command %c in %s\n", *ptr, control);
+                                                           ^~~~
+Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/48]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/rules.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/rules.c b/lib/rules.c
+index 6e7a12a..4a34f91 100644
+--- a/lib/rules.c
++++ b/lib/rules.c
+@@ -343,7 +343,7 @@ MatchClass(class, input)
+ 	break;
+ 
+     default:
+-	Debug(1, "MatchClass: unknown class %c\n", class);
++	Debug(1, "MatchClass: unknown class %c\n", &class);
+ 	return (0);
+ 	break;
+     }
+@@ -801,7 +801,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 	    }
+ 
+ 	default:
+-	    Debug(1, "Mangle: unknown command %c in %s\n", *ptr, control);
++	    Debug(1, "Mangle: unknown command %c in %s\n", ptr, control);
+ 	    return NULL;
+ 	    break;
+ 	}
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.7.bb b/meta/recipes-extended/cracklib/cracklib_2.9.7.bb
index 629069e8440..ffed88ed016 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.7.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.7.bb
@@ -11,7 +11,10 @@ EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 
 SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=master \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
-           file://0002-craklib-fix-testnum-and-teststr-failed.patch"
+           file://0002-craklib-fix-testnum-and-teststr-failed.patch \
+           file://0001-rules-Drop-using-register-keyword.patch \
+           file://0002-rules-Correct-parameter-types-to-Debug-calls.patch \
+           "
 
 SRCREV = "f83934cf3cced0c9600c7d81332f4169f122a2cf"
 S = "${WORKDIR}/git/src"
-- 
2.37.1


