Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.2169.1619669449765775130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 21:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JDQcsWER;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id v13so20454124ple.9
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 21:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmrTFTKxVQkXslwJjvrXwqrD1HSJKT9JJVGDkBa4qMU=;
        b=JDQcsWERQRyTXd8Kq7m/E2D3ptVQyPfmxxo+UCdTZLxNIGYCnMj7Cte5ZXZWbS4Q9W
         69DtEc6RCLwjavK51WCPmSvdmLzP8Jh850SvGesV72oOAs7eGU6hfc+OUv/LA4qRc+7D
         YxqRoGIvzXgTrOQGaEtnN7wiAyBZwr5Fbz+Alupq+6kkTEavZ9FwCfG0E/DEBpp179b3
         NvuXdqaM0wseoVJCYIfSH3+8CgrsukWtO4zNUlvk0gbVkq9uS5K2T2iuIXGg+W8YdjMw
         w5dnAZBIikhubk3mQU6+fTN1rvusSEvZuBV6ve9vNXNN9xMEyZrsd7CV/EifETN64H/W
         9K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmrTFTKxVQkXslwJjvrXwqrD1HSJKT9JJVGDkBa4qMU=;
        b=afSsK1FMwLIZ8sdhRk9SPmOzhaLydOV4yX0Ce4DeFwsjDsdTr7AdA5dDGjX1z1+Lxj
         weX7w5+Txqz8UQ5qOKFC7cDnQWWpjLRRAhCpICMhhvFt7cT7+dR15XKw/wPh8YaliSUE
         QC84iLhZjs4Gvw/U0YdobACrrpnV9/w3ZJ1BVo+Lk7mB1wHaSZXW+ijQB7r2LustEiz4
         IOavZzLTk0+vQV5WW27FY9BG3YBkwxDMNsYqpf1UkDWtnhGQkcJJdYLuGfQy8dS2Kkal
         +SwwRhUPeU0KUjMOzalAlHSgZbpwplkduKgF7vdZisEukY/7VYhuemrwU1VhUDL4xZnS
         dwjg==
X-Gm-Message-State: AOAM530+LPKRwQNlxhc0uvsU4H6ieXVFf31yc/Shz6rugWf5qdVd5b0V
	v7SKnQ8+Qpmy7ArPTezKHDnH62Z1251crg==
X-Google-Smtp-Source: ABdhPJx6xkY1svOOxxu+V04+isjp5eq4Y8woIeSnPpcXWAhwP+iJgoA1DK5VewR7Khk/Zb/mroRhZQ==
X-Received: by 2002:a17:90b:4ac1:: with SMTP id mh1mr7380643pjb.95.1619669448868;
        Wed, 28 Apr 2021 21:10:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id y8sm1033521pgr.48.2021.04.28.21.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 21:10:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] bitbake.conf: Use -ffile-prefix-map option in DEBUG_PREFIX_MAP
Date: Wed, 28 Apr 2021 21:10:46 -0700
Message-Id: <20210429041046.2573804-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace -fdebug-prefix-map/-fmacro-prefix-map with -ffile-prefix-map which is
superset of all -f*-prefix-map options

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a0e0c77fe6..37a1a4383e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -609,8 +609,7 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
 # Optimization flags.
 ##################################################################
 # Beware: applied last to first
-DEBUG_PREFIX_MAP ?= "-fmacro-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
-                     -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+DEBUG_PREFIX_MAP ?= "-ffile-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
                      -fdebug-prefix-map=${STAGING_DIR_HOST}= \
                      -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
 "
-- 
2.31.1

