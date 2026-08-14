Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A818C5CFDB
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:48:58 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7616.1786690129338237407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ra2HwJta;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so2136728e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 23:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786690127; x=1787294927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BSvwv/gBiEKEo4b4uJIOca+umxSHBeNN6dAalyJKOfE=;
        b=ra2HwJtaqvtJ8VhYque3Gjgd6y0x9KaWZEY1Gha073Best70qvP2NoFFy2Z5raD6ZX
         YyDIP/yWSQ/pKcu/DHt29tZ4k+CaZNigbrP4FFwH8rqRUWdSQdBdBWoCd15cywVSmdOO
         755fzVHgLWilPiKysiKEZAbi16M2ll4gK0YD9ftquA/WLEHbSZ+9PKg85EQtV7Qvf5Qq
         DQFYbPc6emDnkpC6Ok+vjXn4kYHwZlesLYlVRUvTAJO0ciPPp3OhubvKwFeYMzg3c+sU
         bAk8s09j8fsbBFGIk7Xxg8XqcQyG9hQ9uqRcQZkLhgUD+eonCt8jN/AO1flBJqsmib9L
         lH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786690127; x=1787294927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BSvwv/gBiEKEo4b4uJIOca+umxSHBeNN6dAalyJKOfE=;
        b=BQQoDjs+wd3GASrPMAH1hvmIsovmyK1WVBZXiVi0N1D+zk8K1NEnGajBbvCPqCW4yI
         E08EPpQJIIliKpIhJUCQnTVQ8+r7wG1TbExzxzCKtpM9LHOxK4NVRh+rahHZHtW8iZET
         bLbwgRE1sZaZJSFbHSUhN1p6pubrLXfblThXyYOSs4FMJMFQP7t/gcqz7WfKjcPImjxL
         y4ZyNsyi3mhgD94KtGBYUdO1CDIHFlVIt5SI8nMExbWGxL9+e8usZ374uEq4R31RR29o
         vN53wq7otXnCESi7B3ugO8Z7Ja5Uj49YhjKLGsKfnVcEFKJZtVVtWm1XIfxgmkn9uR54
         C0qQ==
X-Gm-Message-State: AOJu0YwXrNOqW/ndI18ioPzi7SKZbUsJXWmv5Yz9BHF0n7c4SOmHuLUd
	VxBUIBTJYYqQicULLgPxzJUDIIh2KHK1V7RMS0sg8MGXzQfq0bC/tlQ9ceTi9GtQaPidDgu19z7
	/NINK
X-Gm-Gg: AR+sD12uOLBKA+fHrutK9J6O85lnK8sGivoCdP+0evuGap/YEmUQoUCXJrZlQf0F47y
	sKgHG0QsViyHfMKMK0vdo3MPD9OfwfTG5MPjN06gQsRF6jMeTVRH9kfYhY/lV2nnYrm4phQcZBN
	RXDCe0popEI2G47meHsSpvNbBqANaz8i6gt9Q9qQcSunDwBVhwg5FdHMlgVZmjfuekKMldh8rq0
	cqsDagowWR21GTaxOvleBLQriuSwgqD/iMHpe8q/rVzqj9cYTiMaiJ6cNEn2+CwHwEYgCkvEUpT
	OINN2g51jh2kXJ6dfC3xPYZt2y9Qv5Zw060p7wDABZQFt8R5DEXIayL9Tw99w2KFRLPJLGKQOcE
	Vk+cI0ZiK0C19zInJnfs7nq59x2P9grCk9/HIvj6qbYUDaGGUdhSPgUG1ItGXXcBKsxYlE9C1BY
	0sbZkf5RRmnuGXopNGjYiXqVLDw8pHv+oBYpdglLUG5cxCR8lSJ9lU8p087wmOx5sM9Qlj/WdtB
	I9HRaNkpf+D5ubsA0cV/Gty8A==
X-Received: by 2002:a05:6512:620c:b0:5b4:5a41:a8e6 with SMTP id 2adb3069b0e04-5b45a41ad31mr232001e87.12.1786690127295;
        Thu, 13 Aug 2026 23:48:47 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458c0e9dasm349285e87.78.2026.08.13.23.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 23:48:47 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH 2/4] testexport.bbclass: capture meta/lib/oe
Date: Fri, 14 Aug 2026 09:48:10 +0300
Message-ID: <20260814064812.1071873-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
References: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243420

oeqa runtime tests like stap.py depend oe library so capture
it to testexport tar ball so that test environments can run the
test too. Fixes:

2026-08-13 06:44:37,419 - runtime - INFO - ERROR: test_stap (stap.StapTest.test_stap)
2026-08-13 06:44:37,420 - runtime - INFO - ----------------------------------------------------------------------
2026-08-13 06:44:37,420 - runtime - INFO - Traceback (most recent call last):
  File "/lava-downloads/core-image-sato-sdk/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/lava-downloads/core-image-sato-sdk/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/lava-downloads/core-image-sato-sdk/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  [Previous line repeated 1 more time]
  File "/lava-downloads/core-image-sato-sdk/meta/lib/oeqa/runtime/cases/stap.py", line 19, in test_stap
    from oe.utils import parallel_make_value
ModuleNotFoundError: No module named 'oe'

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testexport.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index 12b7e17112..adcc36c062 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -117,9 +117,10 @@ def copy_needed_files(d, tc):
             shutil.copy2(src, dst)
 
     # layer specific files/dirs
-    layer_files_to_copy = [ os.path.join('lib', 'oeqa', 'core'),
-                      os.path.join('lib', 'oeqa', 'runtime'),
+    layer_files_to_copy = [ os.path.join('lib', 'oe'),
+                      os.path.join('lib', 'oeqa', 'core'),
                       os.path.join('lib', 'oeqa', 'files'),
+                      os.path.join('lib', 'oeqa', 'runtime'),
                       os.path.join('lib', 'oeqa', 'utils'),]
     for layer in bblayers:
         meta = os.path.basename(layer)
-- 
2.55.0


