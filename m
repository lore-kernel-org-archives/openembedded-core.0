Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.7391.1589644730649136382
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 08:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N2gYRD39;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id a13so657117pls.8
        for <openembedded-core@lists.openembedded.org>; Sat, 16 May 2020 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7xTazVtQmiQnr29KATCiOsbgPBRnjQmSTalA5PrXhk4=;
        b=N2gYRD39PByLjUmt6KJfXlTY7gszeytqZ54Q0y/mw7BK1wTRzS4AqRWGaTNSRu7C2/
         BfdkEvMDdendNu7t6K8cDL8lnyBFWsHEJpkRO+ZEc516K4hhWhWpru8zIR8OHu/kXjyB
         0tEcq22MOzff02kHQfZvJFmcKG6hdfsLHV6/pULETo2lyRGoBHBMA1qdEbZkOVFbBV5h
         /l8+tiGFWJyMF4pgG1d4XbYeexc/tEtJZzX2qEkxSPOhs33LC4PyryFPu7txLRi4649C
         Z6JNNlEf5ywsgBevnIB3hXoaJeCi3xkkfvnMKT1yNFlsDkM8fHfEsbia2IrRuRDDtwqH
         ziwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7xTazVtQmiQnr29KATCiOsbgPBRnjQmSTalA5PrXhk4=;
        b=Vy+tcxIpioGu3V1+kMPgudCmMOEBLBCFqYF4STsEN883/Yst3u9fDkDAXCVttG/eHi
         xBkX7z995/R7u7rqFctSTpIwdYXm+X5ILFuMg+8IzBGtiAbtQ+XAs5yzTkdAEe7UVdZo
         r+jAamOUwfjXN2Vm8I8nvkDdtaD7z+vTEWJ21qeaPrC8fP0BWyHtPjTuQx2iBzWAoSLo
         4v6T2h1r9TdOrnxm1N667MwU3bp0vYpVY/nX2L6kU/iESQoSZS2HlnqIfb+OAiil6coX
         2RDgE9u0l2XiynYlStNMHEFIWmUVc7ae7y419FFrNZ0I+aJq1WPlvL23G8o2Ie82/vrH
         GKvg==
X-Gm-Message-State: AOAM5302a05zEoQFWYwoCJXUbKnQqUMY33tqDD5fm3zg7MdIxH8wxAsq
	8jyu3VZWL4AUwCUgI23/OBRaYXuR2Ic=
X-Google-Smtp-Source: ABdhPJxwB5iS69cgGQP27EH9pdxTMuuiJKErTsTY+4o5gbVCaoPyXpjlF6ZJzPD0avIxGNjObCsghg==
X-Received: by 2002:a17:902:103:: with SMTP id 3mr8694668plb.325.1589644729861;
        Sat, 16 May 2020 08:58:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id jz3sm4202003pjb.40.2020.05.16.08.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2020 08:58:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/6] multilib_header_wrapper: Drop using __MHWORDSIZE
Date: Sat, 16 May 2020 08:58:42 -0700
Message-Id: <20200516155843.1811017-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200516155843.1811017-1-raj.khem@gmail.com>
References: <20200516155843.1811017-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is not needed as __WORDSIZE already represents same value and is
directly defined in wordsize.h, this simplifies the multlib headers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/multilib_header_wrapper.h | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index df01b56a72..88f3193812 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -5,22 +5,9 @@
  * 
  */
 
-#if defined (__arm__)
-#define __MHWORDSIZE			32
-#elif defined (__aarch64__) && defined ( __LP64__)
-#define __MHWORDSIZE			64
-#elif defined (__aarch64__)
-#define __MHWORDSIZE			32
-#else
 #include <bits/wordsize.h>
-#if defined (__WORDSIZE)
-#define __MHWORDSIZE			__WORDSIZE
-#else
-#error "__WORDSIZE is not defined"
-#endif
-#endif
 
-#if __MHWORDSIZE == 32
+#if __WORDSIZE == 32
 
 #ifdef _MIPS_SIM
 
@@ -36,7 +23,7 @@
 #include <ENTER_HEADER_FILENAME_HERE-32.h>
 #endif
 
-#elif __MHWORDSIZE == 64
+#elif __WORDSIZE == 64
 #include <ENTER_HEADER_FILENAME_HERE-64.h>
 #else
 #error "Unknown __WORDSIZE detected"
-- 
2.26.2

