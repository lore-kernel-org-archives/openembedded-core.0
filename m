Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.93.1631035956505290687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 10:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QTmVF6qx;
 spf=pass (domain: linaro.org, ip: 209.85.128.49, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f49.google.com with SMTP id u26-20020a05600c441a00b002f66b2d8603so2449124wmn.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 10:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tEmmsHeI1Ro7PFuSDgVxjLkddltwzKr/1rWyF9YzT6k=;
        b=QTmVF6qxKzQb9TgZpKvPw7NzMth4EeHfg1vXiLIYEcXCMqnRboL1ce8qz4QrvUOCmn
         ElnqvBoLbz10V2JbvJFV3cgRKcceMfkNn9TUNJT/8FDUG6FJZuO/IgH/SWVNM61KKsOY
         xBMBuJRMRTIgT/NCyDtAtZAoEOt0zGZbL+5fhrJdWu5g+77hp2+JX9KdUrmEy/3eNJrL
         GFB7kSd5amKKYc2fxDgbYCOIbm9QmoS/0y0J2Jm1W2Dy37JRup4eHr5+D44RBHjvIJpI
         q4HrUbIwFqlY64YDpQWxFtHVQ8tmlpkLK+4KrtVNTttSKGkuhcm7H3TdVPGBdOGS3BlJ
         V8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tEmmsHeI1Ro7PFuSDgVxjLkddltwzKr/1rWyF9YzT6k=;
        b=la1iy+8cWxGirsfn0eaWYdU4keZFRgvjXJ2/22HXAa+cFjnCqvRkazJMuvYg3aeFUm
         hJAG+52mDD5OnbpJGA9Uh9cN+mx0ITsNNBCnqIp0u8B5f+DfdzV0Zwc5Tm2jFblxQ5if
         FDf60SjIl3YBEC2Z7DtOh16l0kILo0uHVO5xinkxXSQn0V0U9Ou1xvh87B5jifGiZdCl
         FjwusyCmTl2iI/obn2vgIt8KtmrAw4Zr7ojUz83Gn1C+5LojiahN0jkTdfQdRa83RoTB
         OUq3kfRqfYjYszc5mX95rAb/g4hmCP9ErIzpMdHjmpw8ngI8pQTZ48myvXlVG1NRNO/m
         fd5g==
X-Gm-Message-State: AOAM530bZJndqkls0Z44pTIaSzqp2RN+lOl5JEDYw8TX6IQGj/Qld38g
	Zp7Ew7xIuOfSG1jGSybEx0njwg==
X-Google-Smtp-Source: ABdhPJwjyvWhqCT7UZoDOzTodd4x2M9hfAwIPe+Di3FL5DhmzoyJI1dc/NSQFxDxHNDEbDWsDo+2cQ==
X-Received: by 2002:a05:600c:1912:: with SMTP id j18mr5094782wmq.29.1631035954964;
        Tue, 07 Sep 2021 10:32:34 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id g11sm11362317wrx.30.2021.09.07.10.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 10:32:34 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [dunfell][PATCH] rt-tests: set branch name in SRC_URI
Date: Tue,  7 Sep 2021 19:32:15 +0200
Message-Id: <20210907173215.7330-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream repo no longer has 'master' branch, and switched to
'main'. To avoid issue such as:

ERROR: rt-tests-1_1.1-r0 do_fetch: Fetcher failure: Unable to find
revision dff174f994f547a5785d32454865f140daacb0f5 in branch master
even from upstream

we need to set the default branch name to 'main' in the recipe.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 3ac39d90c3..29ebe2d361 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -2,7 +2,7 @@
 SRCREV = "dff174f994f547a5785d32454865f140daacb0f5"
 PE = "1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
 # 1.2 to 1.5 seem to be development versions
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!1\.[2-6])(\d+(\.\d+)+))"
 
-- 
2.30.2

