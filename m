Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.7121.1626958025391200796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 05:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ejstVEIg;
 spf=pass (domain: linaro.org, ip: 209.85.128.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f42.google.com with SMTP id f10-20020a05600c4e8ab029023e8d74d693so2894813wmq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JeRYgt4f87jo+aZW1JT5IlDXViMzawA4hLNyCssLtiQ=;
        b=ejstVEIgLJeJbf0Djgcqq2dODW1Pegf30Y7ODuWndO6ef6CNz/qyqgtf3DVUBo0X0w
         Pt1GZnFeijZIT5q1kR544Cp++e4X6FTpb7o9KaPLOFUD8iY3J5oOJBDxvtg+mZSgRSbv
         GHSHTe3CxL+RLYMs9fUjOzZIqMsVC/hUXjqBAfnJFL7uupV1d+0pPnhxRRo2WVjbruoD
         E3EZwN7bc9v9pRrjiIvOeUDIYXF08ZL3InqTsOnypnhcUh/ryYJhRr/pr5jqpMALNOTy
         4cTPf5sGRAM4+DkzW5LBRZCqsVu0f7TuhV+nhWY+PJoOzrtaTfLimh/QasHljmBL+KAh
         vL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JeRYgt4f87jo+aZW1JT5IlDXViMzawA4hLNyCssLtiQ=;
        b=m4NAbO+eEeXVgFfKKSN01LRqY5JvhZCZ7n4qSqKkq42MnW9ZV8rrFy6Ia3X5wusIim
         08WoAdJ3jj3ZNVlA5UyV8JNNEqPHH3VD+PcKJLtt6XPmUUe/QbMELJd0cHr2o91FTk5C
         r+ic0Vog3/o76+21zwK356HOeRPl5UzFKd0SD7epis379k/0UdxC+jyI1fWQIfmUad5/
         SYE3xxLGrPq6MEzY47BNfDxa3dqh3jNZ/1w2gvpECfTFpTgxfB2ZC45iRiKfaEGdkQP5
         66XIv+J+lIbCvPmFXCS+UmyB67i93HTbkfXugd7mkuXdI6U2LRNmTOLPeErWbxUy6t+f
         eXhQ==
X-Gm-Message-State: AOAM532uHxGMHPdiNkMecNg6IU2tztle7xZ72HfYrlWYQcVCibQerJp7
	5SPHPFUYtAYzcrgX18Fx1Zl28Ek6+CWoSw==
X-Google-Smtp-Source: ABdhPJzWwjFFe8fWm3XvTjU1aVwjE3rsvc2iPnooEpHjyrYe5Jb/ybsvEwE/aimQHZYnq/J04jFpYw==
X-Received: by 2002:a7b:c40c:: with SMTP id k12mr9199826wmi.166.1626958023669;
        Thu, 22 Jul 2021 05:47:03 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id p18sm2468610wmg.46.2021.07.22.05.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 05:47:02 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 0/4] yocto-check-layer: add support to check for dependencies
Date: Thu, 22 Jul 2021 14:46:40 +0200
Message-Id: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has been recentely mentioned to me by the YP TSC that a layer must
not only pass the yocto-check-layer script, but also all its
dependencies. These patches add support for testing dependencies
automatically.

Patch #1 and #3 are not much related, but improvements I made along
the lines. 

Patch #2 split the internal function into 2 parts, so that we can get
the list of dependencies from the main script. 

Patch #4 is where the processing of the dependencies is done. I chose
to enable checking the dependencies by default, and use
'--no-auto-dependency' to disable it, we could decide the other way
around. For any dependency of the 'layers under test' we will simply
add them to the list of layers to test unless they are already there.

Here is a sample output with these changes:

$ yocto-check-layer /work/oe/sources/meta-aws \ 
                    --dependency /work/oe/sources/meta-openembedded/ 

INFO: Summary of results:
INFO:
INFO: meta-aws ... PASS
INFO: meta-python ... PASS
INFO: meta-oe ... PASS
INFO: meta-networking ... PASS

Nicolas Dechesne (4):
  yocto-check-layer: improve missed dependencies
  checklayer: new function get_layer_dependencies()
  checklayer: rename _find_layer_depends
  yocto-check-layer: ensure that all layer dependencies are tested too

 scripts/lib/checklayer/__init__.py | 11 ++++++++---
 scripts/yocto-check-layer          | 23 +++++++++++++++++++----
 2 files changed, 27 insertions(+), 7 deletions(-)

-- 
2.29.2

