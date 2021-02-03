Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.3048.1612316200365358903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 17:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mPfzZwxE;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id t29so15594164pfg.11
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 17:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f4mj/b9dMKsN8Texwdd28yiW/S4N1nuY27Ul3BNmWz4=;
        b=mPfzZwxEGTNbztfzlrxCIDKYPG5+IaDRb+wufVoNc5pprVIekESRt0yDhaFeSd+VQ+
         6oVfpTYPUEEA0fc8+/hNIyuDKLGFJbsiayNT0bf9PARXQDSgbCHuG5c7XV7XQUaibIBj
         iQ+OMHEXfRWHIqDwLSqMahcmBpk80UvWtTDtUpLDSBH5w/b3yeoC4UicaAY9VaoWH6Yi
         Hzdl8F3jyOyrzcGU03xtDTydZYd+3o345AcUGPM9ANjnZa699+4j7NNnwo0u9LbFvE0v
         BbPrwDFHbc+e9+TarKrQMBdEIjaDMd7wZxpif5KeF6NFGg1JQO5ozyi3R2l+z7dI8FIk
         TyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f4mj/b9dMKsN8Texwdd28yiW/S4N1nuY27Ul3BNmWz4=;
        b=CN0oYbWdLmXelxRUSvDfpsnSyOo4QCaVZEz5JMcWVip5KyzirslzNXVE3EM/WZRhm5
         5L+7r5x4Fquq4FXrvIUMDwoefO0Rl+PvSZViDaJSvZwxsfUguKrdTIgecHfQhnkh0STy
         TnSMWfXoyMouBFcktVqZHE4ZSNTWuyVWptlJRLBTS3R3ISuSba2jxjellAswuWHECFkq
         3UdaPxtxE5lFKrawMRuolNI80Ai38wFUZ10aR9HBHIICfsUzUeV453ijDOkhrsGBblpl
         BGYpVpadcga+wHZLOxaOileYAe183vMPX37MfTGiDJSuWDXYpkX1th3a3wkWFFbLYOUx
         O+FQ==
X-Gm-Message-State: AOAM532uzHR9I2LeuGwSX0Kxm7iIMcxDShGYa6y1U153bXeDEYQaNVvL
	Gfq9jDcC7myugZu608LBI14nMS+xuT6skA==
X-Google-Smtp-Source: ABdhPJzGudiAp2DLIU6oUscGiYLuEqwHHKdFx9t9PR7nokbpYcaDlP4A5kEwt0lvYX2Eu6M5Vwmxhg==
X-Received: by 2002:a63:a312:: with SMTP id s18mr929740pge.229.1612316199542;
        Tue, 02 Feb 2021 17:36:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id d14sm214013pfo.156.2021.02.02.17.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 17:36:38 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [v2 2/5] binutils: Disable parallel install for target/nativesdk binutils
Date: Tue,  2 Feb 2021 17:36:32 -0800
Message-Id: <20210203013635.2512741-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210203013635.2512741-1-raj.khem@gmail.com>
References: <20210203013635.2512741-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

2.36 has a build race between libctf and libbfd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.36.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.36.bb b/meta/recipes-devtools/binutils/binutils_2.36.bb
index 976e49765a..f316eb8d1c 100644
--- a/meta/recipes-devtools/binutils/binutils_2.36.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.36.bb
@@ -52,6 +52,10 @@ do_install_class-native () {
 	rmdir ${D}/${libdir}64 || :
 }
 
+# libctf races with libbfd
+PARALLEL_MAKEINST_class-target = ""
+PARALLEL_MAKEINST_class-nativesdk = ""
+
 # Split out libbfd-*.so and libopcodes-*.so so including perf doesn't include
 # extra stuff
 PACKAGE_BEFORE_PN += "libbfd libopcodes"
-- 
2.30.0

