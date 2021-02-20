Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.10961.1613848170557398945
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 11:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eBa+NNGz;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id m6so4088071pfk.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 11:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ymMhyYC55H17m8vpKi/3DPmmAY+qV17yAtdnEIsxrAk=;
        b=eBa+NNGzNqTd5Qbldu0iAx/LzFFgaD60h5walNn5beLxmv/8AHAkt9B9AB5BRcykzn
         NIFozxZMb1mW0FxV9CgnCW/h5R86OCT+XEl06U/IxOanbHsH7otoX8yvV4uykdOqT36Q
         PRuT4pAkNxkFY7iEyPgf47CubmmPBx6QcvR6aGRkw2FeG2DzQNhuYYoaTvzxRkMir+rC
         +l5jgoG73zPGhfVAFnrrNbgLAHGz2Ho2BT9twDEIL3QGaNprBJLo3JDaDQ9pgldV1ZOG
         4N9GmJRUhPqHIEv3QYHgxax5YwEA3ja+cvxaa5FWvtG0uNc4aEIvuuYWW9I4R8AiCCye
         dRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ymMhyYC55H17m8vpKi/3DPmmAY+qV17yAtdnEIsxrAk=;
        b=sJ/pmY3YFyBPPPnALm9auH0XmqSzc+UqiQw7H9W+YCOxVZ618Qo2GR3su00Z0Pohtg
         NhjVB+htuxugcwlgeanzFWSdpB1ElWf/dKvmVEek5ZFtlPUDemTKpt8myUyxhbdkUYRZ
         UEezQTe2Sm8F4d1zpd4fkO5bPWYwi58e9cp4iaLOH3RTuF4EiusILpoR2ZBCee2I4fhQ
         hElzXLqP5WuxIgvpt18dE35FLaO/uDz0DBB2zkdb7c4cn+xOMgZk8CEToqsXtI9MLoPt
         rTx3EFpYh/nWQYy/3cYXvhTTcgYH67Yocz8YBTdsGAZvhqIXekBU11Lyg1aubAqYTrv5
         U22Q==
X-Gm-Message-State: AOAM530PHMmMjDtmi0v6U3+s/NOvaBNviWxonHfBVfz79s8M2lO4YYBS
	MHMNeAZ84Wx7+4e0wzFTb+5yf1aqck0SLA==
X-Google-Smtp-Source: ABdhPJyc48ifqQHLirJ5FMgan9SiOrTQh4SZ1++Sil/bNlkdqofSEKx7dQGQSRcsL3AvBUd2YJ+yUA==
X-Received: by 2002:a63:c90a:: with SMTP id o10mr13657354pgg.172.1613848169935;
        Sat, 20 Feb 2021 11:09:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id x190sm13632307pfx.60.2021.02.20.11.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 11:09:29 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] goarch.bbclass: Fix ppc64le detection
Date: Sat, 20 Feb 2021 11:09:24 -0800
Message-Id: <20210220190924.3153040-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210220190924.3153040-1-raj.khem@gmail.com>
References: <20210220190924.3153040-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ppc64le should go above ppc64 in checks otherwise it gets subsumed
wrongly with ppc64 check

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/goarch.bbclass | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 1099b95769..73e13c0afe 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -47,7 +47,6 @@ COMPATIBLE_HOST_linux-gnux32 = "null"
 COMPATIBLE_HOST_linux-muslx32 = "null"
 COMPATIBLE_HOST_powerpc = "null"
 COMPATIBLE_HOST_powerpc64 = "null"
-COMPATIBLE_HOST_powerpc64le = "null"
 COMPATIBLE_HOST_mipsarchn32 = "null"
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
@@ -79,10 +78,10 @@ def go_map_arch(a, d):
         return 'mips'
     elif a == 'mipsel':
         return 'mipsle'
+    elif re.match('p(pc|owerpc)(64le)', a):
+        return 'ppc64le'
     elif re.match('p(pc|owerpc)(64)', a):
         return 'ppc64'
-    elif re.match('p(pc|owerpc)(64el)', a):
-        return 'ppc64le'
     elif a == 'riscv64':
         return 'riscv64'
     else:
@@ -115,5 +114,3 @@ def go_map_os(o, d):
     if o.startswith('linux'):
         return 'linux'
     return o
-
-
-- 
2.30.1

