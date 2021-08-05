Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.8108.1628167676405938519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 05:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WSBcbWFT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id l8-20020a05600c1d08b02902b5acf7d8b5so2899633wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 05:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qBZp9JZwN66AE3SZvERKHlYqseJ6QSHyOmtZPPs6lwg=;
        b=WSBcbWFTgUmCTX2hGv3iM5Ew3VvKg++W1x+lpvu8p5H+dL1uOWXrhCWWsgg9CzJ8XN
         KP31ty/WWTfF7tBFOuc+lTgrNXBhX5CrNso4X5MWg9vhwy4Yx8ZsDKQa6+r20FmuyE4h
         KyBaMGJ++2kiY4xraIGJP04cociddxs0kjteQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qBZp9JZwN66AE3SZvERKHlYqseJ6QSHyOmtZPPs6lwg=;
        b=lj5AFzgnPMFX7XCJoyiHR9Hv3tmx5clDPHT6icHd52mNdHBGAj0LSJhuVGYUviGDXY
         zLi3mvJTARDxU6NT5DflYPvpJ9FPGYGTBGnEJW14HwWxtX84/27WJFPLf26ncSuYIN09
         UhTuGbjkir9D20uOyTqi/zd8FEAhKb8yXNuuQYBFmhkX8rHMLXkRdqyNA50JSDGX2Mj7
         K8lEUIIZkqb+laRF5XIJNFFBG8FZveMylU3+48umOgOV9+lVFHeq4bLN5ujsh5WXYn0j
         0mvVoosZ3PTODcVL4Jki8I2ehtkDATmxwynk1U9v/RlUWk+XnDnJGGugmDyMDBmUMTnd
         M+kw==
X-Gm-Message-State: AOAM530cwmAEZK+IrpxuEZSm6CIGhEGGl84Jh1jhleRqiH09NBlXWbNI
	30YPMsuMNySsK0D0ROFC06YhKBQzMGIreA==
X-Google-Smtp-Source: ABdhPJyO9qjzDuN5skQPTJorzM7XWX24BXQ8KRiMrsCkJ1CVndgUJ7k6DFpudARLFbQioiR6ALigiA==
X-Received: by 2002:a7b:cb44:: with SMTP id v4mr4900675wmj.169.1628167674700;
        Thu, 05 Aug 2021 05:47:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ea47:91d3:ba71:9eb4])
        by smtp.gmail.com with ESMTPSA id a12sm8960274wmj.22.2021.08.05.05.47.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 05:47:54 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/cases/ptest: Increase test timeout from 300s to 450s
Date: Thu,  5 Aug 2021 13:47:53 +0100
Message-Id: <20210805124753.3572725-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some tests such as lttng-tools are marginal and timing out on the autobuilder
with the current 300s default. Increase to avoid this noise in the ptest
failures list.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 0800f3c27f2..00742da2b52 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -57,7 +57,7 @@ class PtestRunnerTest(OERuntimeTestCase):
         ptest_dirs = [ '/usr/lib' ]
         if not libdir in ptest_dirs:
             ptest_dirs.append(libdir)
-        status, output = self.target.run('ptest-runner -d \"{}\"'.format(' '.join(ptest_dirs)), 0)
+        status, output = self.target.run('ptest-runner -t 450 -d \"{}\"'.format(' '.join(ptest_dirs)), 0)
         os.makedirs(ptest_log_dir)
         with open(ptest_runner_log, 'w') as f:
             f.write(output)
-- 
2.30.2

