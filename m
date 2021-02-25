Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.4636.1614211597344688544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 16:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gbQDp/Te;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id d2so2448666pjs.4
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 16:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBoeh2yC20c/juE+PZPoNnuEqqJBB0aaVZ5aUL/u9gc=;
        b=gbQDp/Te9GVNF44K4HYVIcSsWvkbnJxOT5B0BvNqGk3jF4JLXZrC6H3P+JOh9/HOXH
         wu+5cxktMLh3vERtgBKX3O9EKMDCAkr98eIV84LFCD/phTAOWRh457CuqHB7sn5rG8oL
         yLGRTW/Z2XH3il3X18t72WqR9XCZiUb0c68snXtXtnTZVIw2OVa91SEXVfqXsVqFQ6hT
         vEe79SsaVFXXizf3H1YB/8D8+I6vmNXf9erZNJMfvAIWJfgd3MIIjrxjgy8RalE41GgD
         7Zs7slz7HwW1HbUD+dO2NCHsEuJpcNesVUGrHW9ETJ7/xHPDVGETov/wFKyEGdCYcaTt
         O0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBoeh2yC20c/juE+PZPoNnuEqqJBB0aaVZ5aUL/u9gc=;
        b=qA7vh74JNxfP+uJx8isgu0fDa+XyLlfX+mXb7Cg4TDHPKDalIbVw8QypW7bf1he3iD
         gGFfKMHuNZ6jR7fq9di55WG7+h+M/LLinKLTWi50CCmCHcNB0bwb9nceUADydRI4+I07
         azqVQMPW09zWrohLv0kCySfFOV+h3/Yaf7lrN/kKYFPlLOkN7vN8qSB/bPp1zc9E+EFQ
         jm8udYNvJ8C5NECfSHxW5jCB6n02gafH0wf4V3nXbTaGjnusNm8mBd86JYdjS6j651G3
         vB1LleXdF3wfdgPiedJ0RBm+VvyTbV1Bfr//eU6NvEUYaU3m92rC5sZZP/2810xPUlxP
         FYvg==
X-Gm-Message-State: AOAM5325Fbs45Ya4+jsPEV5sQpdkOpcFlYGZLmeadE3l6fyEsntIG2Gg
	tF1WGYLp1dgmYFd1xm/OXtqkbxkEpPTF3g==
X-Google-Smtp-Source: ABdhPJwZYbVRJjOz4na0V9tRlGWhblA9HIlCI5gwXlFgDQkTMyTmEbVy1cVDwlDyn0oqTgrfzGoycA==
X-Received: by 2002:a17:902:bccc:b029:de:8483:506d with SMTP id o12-20020a170902bcccb02900de8483506dmr298933pls.53.1614211596300;
        Wed, 24 Feb 2021 16:06:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id z10sm3772634pjn.11.2021.02.24.16.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 16:06:35 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] goarch: Use softfloat instead of 387 for 386 goarch
Date: Wed, 24 Feb 2021 16:06:33 -0800
Message-Id: <20210225000633.12644-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

387 has been removed from go 1.16 see [1]

[1] https://github.com/golang/go/issues/40255

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/goarch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 73e13c0afe..e4e0ca37be 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -98,7 +98,7 @@ def go_map_386(a, f, d):
         if ('core2' in f) or ('corei7' in f):
             return 'sse2'
         else:
-            return '387'
+            return 'softfloat'
     return ''
 
 def go_map_mips(a, f, d):
-- 
2.30.1

