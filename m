Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.88.1616174071817677553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eJ90GqOG;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id h20so3262156plr.4
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 10:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/N/Og1mIbnLrcjhu7Pe+j/p/Tn7o/wUiXjHFNXViVM=;
        b=eJ90GqOGxf5Tw4TCZVuMkcXgjhjLnCi0Ce5TCDv0mzQFypwO6W9zfpYFfmAe97Kw3M
         YqzZ1InOp8AqUXKevSkF7OTexsy/CuToEO1wD+5a8rAzNfEoRVMIfY93hkdKv9HASQCk
         DUI1vVoY4ut6gt37mQ/DbznVTYc9gHte1AVfGnyRdclVbMLpCdvR/VbhdXiS6YglEMn8
         YZBKHWpqNxvKWx25xERtn0hWN7rlC80sVZfz+yVqZzQI3HRap87dGNOVDGjHSAuAG/R7
         TIsnCwGLf13GxyjxvtZCVAA798TUsuxXzg57d1AIUr2if/Owtzzpo0WMV9ZnW8GepBQB
         pVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/N/Og1mIbnLrcjhu7Pe+j/p/Tn7o/wUiXjHFNXViVM=;
        b=LLW2QVamPyYXgFKj2U1bS6GliKXBanyUBsUGvZV+KuviNTGbyr7mLclzJEubRFm3YG
         rK7gLNEuuf3zbuSXiqG5f0wsblouRbCeKowAX/AyQRimqDjUDMs4I+cgaWllRsFc04Iv
         ESsYDE3UHMDq0AlSMWinnAuH74lWbks/UDhElEsRB3moXKkP8hfDlTgxrOhqXjOhlRMN
         7PJ9iSegXADoYkLg38+SBCR5BX238ZP7OwW7tjKFe17M4q/p/RKW4rY7CcsQoCd2k+Kd
         mq1nslDyNMZk5jxAdoI2GL+XhKyVN5cIAQFNBzg5bLapXas4ZbHroulb6/tF8qKjKTAt
         DPng==
X-Gm-Message-State: AOAM533YjE+uLIkE7xrvvvBxbCULzxrq8cWHjBfIhI8W976dyOosdnqb
	MP7QiHgppL4/ArdPODSkfpGm+opaYPtSwg==
X-Google-Smtp-Source: ABdhPJyGwAs1Va7rFyxtJC9yMPuEAOlEhIoqngLDUtFQWrZeeppGuob9wLO8ozIWRd33qzgg6X+UFg==
X-Received: by 2002:a17:902:b210:b029:e6:5f:62e with SMTP id t16-20020a170902b210b02900e6005f062emr15083225plr.48.1616174070940;
        Fri, 19 Mar 2021 10:14:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id q25sm6084235pfh.34.2021.03.19.10.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:14:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc-sanitizers: Package up hwasan files
Date: Fri, 19 Mar 2021 10:14:26 -0700
Message-Id: <20210319171426.3591499-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is introduced in GCC-11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 9e643ee277..d0348c4817 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -83,10 +83,11 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64).*-linux'
 # musl is currently broken entirely
 COMPATIBLE_HOST_libc-musl = 'null'
 
-FILES_libasan += "${libdir}/libasan.so.*"
+FILES_libasan += "${libdir}/libasan.so.* ${libdir}/libhwasan.so.*"
 FILES_libasan-dev += "\
     ${libdir}/libasan_preinit.o \
     ${libdir}/libasan.so \
+    ${libdir}/libhwasan.so \
     ${libdir}/libasan.la \
 "
 FILES_libasan-staticdev += "${libdir}/libasan.a"
-- 
2.31.0

