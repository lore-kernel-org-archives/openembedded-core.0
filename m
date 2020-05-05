Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.296.1588721637647227768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 16:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FX80HBxl;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id y6so39506pjc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 16:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gzX45F5fDcZYfS4rtFK9tDYb2TSaMTrhnxi6FmXzAio=;
        b=FX80HBxlbPEPGlfI2FSz9HWqRowSWlbgNRJSTUpkgGKyMatA6ZV36aNpP//T1Y0DMH
         9Fkki+xjpKQNahwoe/VuKZV/5GU33J6RzYndyNUD4w3t3AzDlI+zJ7OzsGmyV4sQnY7c
         xGCfUVPljUa5sNnuouwUqsmy1iGPf4f1zcab0no56iGJw4fs0Iwcfu36YHxmAoMpP6PQ
         FaTNFRL5k3kfbhMPVajBBJromngaiiLUMk1dhFeCShdsdGW2l9m2ucLT0ACkIgtsGilN
         wytD3U7a5pak618+o3e6qkhVwjG9CemvQlqcfLXJpeNZ2w1ivbt+oZqV45bschipAINQ
         yt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gzX45F5fDcZYfS4rtFK9tDYb2TSaMTrhnxi6FmXzAio=;
        b=jY9f9unhDUH76RYveAFms+XZ9qEV8kjkGyK/pNN0e6TShJJ/71OQosssrrhljVmTLX
         uF8BWSGavtUdmKz20+xNbBNfcstYifnBPlPqDRXtAx1Ar2Z9X/4qUfA9hehr+EBUSatd
         nPy4DOCQkEaiYXvCoZ+5QrGO72kQMenNDjggMCsqTDEnZI7VhfuGYWMJbAZ/9/dG83i7
         fFWttkRK7Pu/sJ+T1C7vaX/KCZXlZ+4EpZ6NmR3MelL0XAfht1GetnUpVclgLG9drXDD
         7xeaJh2c6PNEi6YI4/natX4h80K2FFjMK/gHpDn5FSIdyhN449jxSNYwEZgnpO/aDI03
         jyFA==
X-Gm-Message-State: AGi0PubgzQoxlzkiK+9oCIqZv41/BGW6F6niMVlRcukqBxJOzY65onyi
	GvYRhkQOM3smSLWE3FcBE4O1U73PJ6g=
X-Google-Smtp-Source: APiQypIMmVLFbjgs5A0tCi6qm4CR5EojQK3a41Yyv51ZdRK9KqVWYj8Rn35vcvzn13I+Ghj3DRARbA==
X-Received: by 2002:a17:90a:cb88:: with SMTP id a8mr5947860pju.82.1588721636524;
        Tue, 05 May 2020 16:33:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b962])
        by smtp.gmail.com with ESMTPSA id 185sm7050pfv.9.2020.05.05.16.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 16:33:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gcc-runtime: Avoid march conflicts with newer cortex-a55 CPUs
Date: Tue,  5 May 2020 16:33:53 -0700
Message-Id: <20200505233353.1836668-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505233353.1836668-1-raj.khem@gmail.com>
References: <20200505233353.1836668-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc-runtime/libatomic explicitly add -march=armv8-a+lse for all arch64
but cortex-a55 is armv8.2-a, which essentially conflicts, so let gcc
override it by not forcing the -mcpu option from TUNE_CCARGS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index ace706dbf4..547644572a 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -18,6 +18,10 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
 EXTRA_OECONF_append_libc-newlib = " --with-newlib"
 
+# A55 is ARMv82.1 based but libatomic explicitly asks for -march=armv8.1a
+# which caused march conflicts in gcc
+TUNE_CCARGS_remove = "-mcpu=cortex-a55+crc cortex-a55 -mcpu=cortex-a55+crc+crypto"
+
 # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
 EXTRA_OECONF_append_armeb = " libat_cv_have_ifunc=no "
-- 
2.26.2

