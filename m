Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.267.1588723190937320716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 16:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XNWDWxt8;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id r4so283753pgg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 16:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rpnUy2SqfRejf5i1Dh4mJJgt3oOtaJR0Nswzn2r/WA0=;
        b=XNWDWxt8KKZlbikHD+b4Nj9nfiuf8vbZjISDEUqwRisr5UDG++w1IIzNtY2T5NLjy7
         PzSrumnAlO2soRUfDqEKRvb+Zj936mbZYt6lR58GOY7XHgMxAfXEX/IuCvulYTG3wNMG
         a+rIkWG2IhjOOiyDu56PBPNsTTOIiJd6HLQIaO+AwDcV4/vDfk7XyZSVIwC/o1Ds7w85
         2M2mP89ex7h859EHO2dEQSnPBXwWUm+YZPHI6vXsgWKJbYDCsIv/TT/avY8K/7JczuFw
         799Qk+Qes4XcAPf2LtbQ4sRMSmHL3g+3+xECHTOtE/EGXonCooSPUriX1gL+Wp2hg6PM
         c7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rpnUy2SqfRejf5i1Dh4mJJgt3oOtaJR0Nswzn2r/WA0=;
        b=iS6MevAVx7XfdMfJ38ciX7tZ/a+WwptwsseS9FJZHNeblm+iHp/F+3BZmSGOy1N1Qp
         7YqZnEAOJHH/cRi4mFJyaUWsDQdrRqBDVD4PovMCQW9yRH2lmCF+BqDzLisvKFVvHaIF
         SPhVniUhG/1yMuvkBDq9TjA+pm/5VLSAv/GSSKQ1eVIDkBItE+ddb81q1c3hTtNI/N3O
         WNNfjzMkTGp1Jc9HJKmLdr+MjXxmi/Mm4oiid1zgldFrufirYRPifsyYjvyheoakugbp
         1sB3/9M3dknP2gaAomiY/mOAt7rpzPsPxVboKHCFaYnIQrSLGkawl9zs2cShhreUtXhy
         THCQ==
X-Gm-Message-State: AGi0Pubk0HQ6KfIFBfa/7XtnjMfMJkPbl262qrgpS6oN4hD5yXvkPDBC
	fqLJ/Y2+SoH9P1PbLQ8GTSJyvCJCLjw=
X-Google-Smtp-Source: APiQypI4BABEQQ6UwA8oB8v4UgqrBJ6bTRyL3jcFUUFRH43PeRAD2VfymBJEl7xLgykk6Aliw/KFyQ==
X-Received: by 2002:a62:e211:: with SMTP id a17mr5594064pfi.250.1588723190009;
        Tue, 05 May 2020 16:59:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b962])
        by smtp.gmail.com with ESMTPSA id fu12sm3065567pjb.20.2020.05.05.16.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 16:59:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] gcc-runtime: Avoid march conflicts with newer cortex-a55 CPUs
Date: Tue,  5 May 2020 16:59:47 -0700
Message-Id: <20200505235947.2148278-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc-runtime/libatomic explicitly add -march=armv8-a+lse for all arch64
but cortex-a55 is armv8.2-a, which essentially conflicts, so let gcc
override it by not forcing the -mcpu option from TUNE_CCARGS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix typo and mising -mcpu before cortex-a55

 meta/recipes-devtools/gcc/gcc-runtime.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index ace706dbf4..d9a4e483cc 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -18,6 +18,10 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
 EXTRA_OECONF_append_libc-newlib = " --with-newlib"
 
+# cortex-a55 is ARMv8.2-a based but libatomic explicitly asks for -march=armv8.1-a
+# which caused -march conflicts in gcc
+TUNE_CCARGS_remove = "-mcpu=cortex-a55+crc -mcpu=cortex-a55 -mcpu=cortex-a55+crc+crypto"
+
 # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
 EXTRA_OECONF_append_armeb = " libat_cv_have_ifunc=no "
-- 
2.26.2

