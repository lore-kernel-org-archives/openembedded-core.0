Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.4961.1585253402414533151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 13:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=Gzw8jQwn;
 spf=pass (domain: essensium.com, ip: 209.85.208.49, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-ed1-f49.google.com with SMTP id a20so8479264edj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 13:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t5fpAJ6zc8PFICPUbIjG0tIXmE1I6Xyr7mHSmc4MtEU=;
        b=Gzw8jQwnJYUqhx3XkXi4uUTmgAPQtk13iRZE767qA4LQdRwcxsvg91A4dLPOyltqWq
         AQGnAYVsr94/klN2SvBqfPWJaZ1clcO4kGWOg3XoeKUvmLHx5wuo2UsgRur5Cwvs3mzh
         7qLSnvIZN2PpqX7LYryRfZa9w1Mo5OPeO0Cn5JqWhiPq5+2+0sG5RIQGoRe9mW9C2EIC
         MLhqerB4Q1rs7IdZUZDgeepODafjWhDZFAyr1+PRP2mg3IYHHnUOMafsGujyuBqhwB1A
         Gn9pyhnTCrZIIHLxHD4cmCQZU1rlPKJkF/2eN9hBSmuBVyEMQq3oCWQRLfg/Vp7LXj0w
         I0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t5fpAJ6zc8PFICPUbIjG0tIXmE1I6Xyr7mHSmc4MtEU=;
        b=mlVQQb/SWLAVz2PZZXkzjVs9iktG8++ryoPpGakFrl9tRjvhxDnRPT/XB3+osKKDg2
         Rx91c8Q9W7cwy2aJDDpNVYEsPLNTmVUJTRV8+fA2ed6TucC3rBj91w4A4fwxhZKEqG0O
         pGs65jVmNoavx60SMsqvP71H4GbU0syG/CViC/PEuo/kwfz1OjyFUxhX2jQztQmuG3z1
         HBM73kLqT/HCOWKCMlhSv/lLeKMyqxL4kGOQ99V/iWmZwu0Zn5fsX//GSJIXcZSJNQ3V
         t3qETwKwfMyZayWSA+BveW5nrTLvcQ4pRDGuoxIzRVoeQcTrPxyLtiXvYAtk8Gh1xRhI
         8/vA==
X-Gm-Message-State: ANhLgQ1fJQaBbIgjWAfcR6E2OqOmtW8A7hBpQrbGB0Jb6rmRxj9j12qI
	z5cc3M12DbzRHxFXahDHOZBEipujaVbOEw==
X-Google-Smtp-Source: ADFU+vsK85/fvlt2oUula5rtou9CKNERowo+POsx/fjJ9RWjhK0tNz/Dmnce2RukRmMgMT4IyemDVg==
X-Received: by 2002:a17:906:a387:: with SMTP id k7mr9226525ejz.256.1585253400383;
        Thu, 26 Mar 2020 13:10:00 -0700 (PDT)
Return-Path: <charles-antoine.couret@essensium.com>
Received: from localhost.localdomain ([2a02:a03f:c930:4300:2b1a:3a25:ef77:ee9e])
        by smtp.googlemail.com with ESMTPSA id s4sm514187edw.19.2020.03.26.13.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 13:09:59 -0700 (PDT)
From: "Charles-Antoine Couret" <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCHv2] utils: fix gcc 10 version detection
Date: Thu, 26 Mar 2020 21:09:49 +0100
Message-Id: <20200326200949.149497-1-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utils can not detect GCC 10 correctly due to wrong regex.
It generates this error "ERROR: Can't get compiler version from gcc  --version output"

Sub-version numbers should be 1 or more digits instead of 1 only.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index aee4336482..9042b370f7 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -391,7 +391,7 @@ def host_gcc_version(d, taskcontextonly=False):
     except subprocess.CalledProcessError as e:
         bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
 
-    match = re.match(r".* (\d\.\d)\.\d.*", output.split('\n')[0])
+    match = re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
     if not match:
         bb.fatal("Can't get compiler version from %s --version output" % compiler)
 
-- 
2.26.0

