Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.27276.1584877195384467272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2020 04:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vHNurqdU;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id c187so11156124wme.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2020 04:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BkO+2TnTHIrxXxQOZY4eiiIdBo8iWQg3iNU4Oe5vbIM=;
        b=vHNurqdUOXBguomAl8QRPlFSGdsOLWJ5mHk0MsS64B8iBLOnX0qJDfDnjIcSvpa/Mg
         jmOrqMJxwAu9akfL0D1YxBr4AOGQ6Y1sw3rlAE9cIOve2zQm44Q5AeFY6LFO7+0AIqyw
         4DS+2pRlp+NV5DnjcCoYQPbhO6/s2c1D+3F+JR9jqdJ2YDDWMzACplB6iyOExQlGWzl4
         VWRz5Iz7SGXmUiNPhzchP33T3UAbBGNFB7IYy+qHUnmJ0oNC33mZc6FBeZ/0W4L8d2O1
         HwcwXgpjHGFacj3OfH7ibr+auZaMvFxIxpaZsjc1/ndIdRezfioE6AAPfVcrPghmt8nq
         1SGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BkO+2TnTHIrxXxQOZY4eiiIdBo8iWQg3iNU4Oe5vbIM=;
        b=O3na8KsMZCZye6PqTue7Rt+MapQe5O2QK37bvD8RTN/4+EsOJrEZ3c+7uSKjjct6kp
         lWPzIoIk//t2qE3xANGgIXmxQ5kB5dVrkppNvNkfBZgukqiVE/Vl1OUQUL+29ZbFOfSI
         0EKpflNTZtK3zOtWzJ2LviNZJ1vGrN/9jZMJVRpdWIMhq4jsqhE2f7KZNGYZoEECvRrG
         KG86pIR7oCOYQTgTRzMx5FIJL/nvw+ekRDmistfatXkHHvQoMCyIKFNqqrXeesHmO7Pn
         hXaSqNdDMvsWgY4q72DII+3WqRIKsVKUPOmVy0iKdkfMa2GGSVislGTjw10CEktfMWX1
         rjQA==
X-Gm-Message-State: ANhLgQ0rYfHl5N/6JhMYgWyqYi2Bkb+hWQSM+s6Byyc4n9KEEofeuWl/
	G0NoW8klRTyNlr4A7Ye/ct63FBM6Xwg=
X-Google-Smtp-Source: ADFU+vusq3ydSXgIQegsjm6fsTl/09TEZUF+L2jw0EyKPgxnjjtKeAOmKAUbNM5RMEAoEK20tV0s5A==
X-Received: by 2002:a1c:7ec9:: with SMTP id z192mr21199976wmc.100.1584877193534;
        Sun, 22 Mar 2020 04:39:53 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id i12sm18533740wro.46.2020.03.22.04.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2020 04:39:53 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] core-image-sato-ptest-fast: don't hard fail in ptests
Date: Sun, 22 Mar 2020 12:39:00 +0100
Message-Id: <20200322113900.7302-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unfortunately, a couple of tests sporadically fail still;
bugs have been filed, but they will take time to resolve.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-ptest-fast.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
index b794a7dc9e..3641217306 100644
--- a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
+++ b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
@@ -14,3 +14,6 @@ IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
 
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
+
+# Sadly at the moment the fast set of ptests is not robust enough and sporadically fails in a couple of places
+PTEST_EXPECT_FAILURE = "1"
-- 
2.25.1

