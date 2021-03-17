Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.488.1616012706380839954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 13:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kNlg+SVP;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id ha17so1744582pjb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 13:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GLneyPtSpJ4hrMn9uk7jr3GazRvqMCNQ+4UW4L0ONaw=;
        b=kNlg+SVPfwfTbE09HD5HECg2E1E/+Tx1GZdrkjVKgoyAI+oTsy83S3voW7DYZ1aENk
         61l+9n3HGBzAv77pvGhyS6rv8xPx7rfJj0sqiE4VMzWdA3UiME/yk2Iss5JRI1bim5oZ
         JN+a+eL+CVHeK3rvqkUM6oO2D3dtnvCNBh/QH+2i0jZ0Sd7KrwjpBbaP9zAAk7QkI54W
         wCfvkDPJpd7/8cDFqPKxpXFNdHiW37ikBmOxrEOJMOcc5xHnpXjWlwDjF66eFDqaju1R
         aPZ2utcn90uL0beIbcpR4VNNQ7lgAji388Ljysrq87OdgmhNS+7YPd7b15H2egCaGUh8
         1G+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GLneyPtSpJ4hrMn9uk7jr3GazRvqMCNQ+4UW4L0ONaw=;
        b=QV/TyYwA/zhvJvlvk76bZ7rLb9x3c37ZEw9jiI3ybo4kulfefsRvUmT3DDX9GecBJK
         XXVMb9OolQBQaa+bczxa95imLKnzxRXKPNnYlzlhH3jh/GD3ALYbhG3KjQvtxSEJH9Zt
         ke2kgA7IM1l1t1yXdpARlOvPaYircNS+jCkhD//4djqjfocfSUvUB5gvKJ8qgivsL5ij
         M5N8ibvQBaE0PQ9zqtriQpMB0nR+BjCTRhI1VqJpPDnBtbZJnvx9hFl99ythRYaEvdDk
         TkRiWqA8tOKhKhqKZxlT8eLDzZ05E3pcDJbJSolkRrAA0SNdELwn0yzycD0OW2sA6K4N
         2h1Q==
X-Gm-Message-State: AOAM530l7MBGJfjLUZL1nrKQb5R/A6/dG2Si7aozWrzcBrZbYIHYlNp5
	chGheX+JZj2AhQi/Tajik7+HznlhYvCIKQ==
X-Google-Smtp-Source: ABdhPJzOj2nGl43+DPSrcLZ5YLDXoAwRIq74YThgGE6+Uxy/Lm8oQUqzQAWPMReBoSdpYPiinf+Jpw==
X-Received: by 2002:a17:902:b68b:b029:e6:cda9:39d with SMTP id c11-20020a170902b68bb02900e6cda9039dmr2131838pls.63.1616012705570;
        Wed, 17 Mar 2021 13:25:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id m7sm3922045pjc.54.2021.03.17.13.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 13:25:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] webkitgtk: enable strlen and stpcpy on musl/linux too
Date: Wed, 17 Mar 2021 13:24:59 -0700
Message-Id: <20210317202459.213685-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210317202459.213685-1-raj.khem@gmail.com>
References: <20210317202459.213685-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk/0001-Fix-build-with-musl.patch  | 36 +++++++++++++------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
index 6dcb52956c..a13b394fd9 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
@@ -11,11 +11,9 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  Source/WTF/wtf/PlatformHave.h                  |  2 +-
  2 files changed, 6 insertions(+), 6 deletions(-)
 
-diff --git a/Source/JavaScriptCore/runtime/MachineContext.h b/Source/JavaScriptCore/runtime/MachineContext.h
-index c5052527..95ef98b5 100644
 --- a/Source/JavaScriptCore/runtime/MachineContext.h
 +++ b/Source/JavaScriptCore/runtime/MachineContext.h
-@@ -196,7 +196,7 @@ static inline void*& stackPointerImpl(mcontext_t& machineContext)
+@@ -196,7 +196,7 @@ static inline void*& stackPointerImpl(mc
  #error Unknown Architecture
  #endif
  
@@ -24,7 +22,7 @@ index c5052527..95ef98b5 100644
  
  #if CPU(X86)
      return reinterpret_cast<void*&>((uintptr_t&) machineContext.gregs[REG_ESP]);
-@@ -347,7 +347,7 @@ static inline void*& framePointerImpl(mcontext_t& machineContext)
+@@ -347,7 +347,7 @@ static inline void*& framePointerImpl(mc
  #error Unknown Architecture
  #endif
  
@@ -33,7 +31,7 @@ index c5052527..95ef98b5 100644
  
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
-@@ -498,7 +498,7 @@ static inline void*& instructionPointerImpl(mcontext_t& machineContext)
+@@ -498,7 +498,7 @@ static inline void*& instructionPointerI
  #error Unknown Architecture
  #endif
  
@@ -42,7 +40,7 @@ index c5052527..95ef98b5 100644
  
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
-@@ -656,7 +656,7 @@ inline void*& argumentPointer<1>(mcontext_t& machineContext)
+@@ -656,7 +656,7 @@ inline void*& argumentPointer<1>(mcontex
  #error Unknown Architecture
  #endif
  
@@ -51,7 +49,7 @@ index c5052527..95ef98b5 100644
  
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
-@@ -773,7 +773,7 @@ inline void*& llintInstructionPointer(mcontext_t& machineContext)
+@@ -773,7 +773,7 @@ inline void*& llintInstructionPointer(mc
  #error Unknown Architecture
  #endif
  
@@ -60,11 +58,9 @@ index c5052527..95ef98b5 100644
  
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
-diff --git a/Source/WTF/wtf/PlatformHave.h b/Source/WTF/wtf/PlatformHave.h
-index daca20fe..53eae6ba 100644
 --- a/Source/WTF/wtf/PlatformHave.h
 +++ b/Source/WTF/wtf/PlatformHave.h
-@@ -222,7 +222,7 @@
+@@ -202,7 +202,7 @@
  #define HAVE_HOSTED_CORE_ANIMATION 1
  #endif
  
@@ -73,3 +69,23 @@ index daca20fe..53eae6ba 100644
  #define HAVE_MACHINE_CONTEXT 1
  #endif
  
+--- a/Source/WebCore/xml/XPathGrammar.cpp
++++ b/Source/WebCore/xml/XPathGrammar.cpp
+@@ -966,7 +966,7 @@ int yydebug;
+ #if YYERROR_VERBOSE
+ 
+ # ifndef yystrlen
+-#  if defined __GLIBC__ && defined _STRING_H
++#  if defined __linux__ && defined _STRING_H
+ #   define yystrlen strlen
+ #  else
+ /* Return the length of YYSTR.  */
+@@ -989,7 +989,7 @@ yystrlen (yystr)
+ # endif
+ 
+ # ifndef yystpcpy
+-#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
++#  if defined __linux__ && defined _STRING_H && defined _GNU_SOURCE
+ #   define yystpcpy stpcpy
+ #  else
+ /* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
-- 
2.31.0

