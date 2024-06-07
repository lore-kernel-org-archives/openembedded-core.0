Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68244C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 07:22:58 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.36273.1717744974970411933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 00:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=k6rVQBKd;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b7c82e39eso2007259e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 00:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717744973; x=1718349773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qpUI7yOj0geGpoHOmm7gy9aeO8gTqLL+WoIbVOaBgBw=;
        b=k6rVQBKdLVB9122ZymTmmGrlTXn5yCXKL5vyVFcT/YdXKpZ7yH/hBkkdjPYmRYT3UT
         t2k3H9/3eJdwbxxFNVcGohmPqYB+rUHszo8n2MIgCvZORgnke47uic6umqs4MZlbvkvF
         6hEuE9//FjW9nNUbJKFZ2blCzndR+1csD+VHLs8q/WgxJBL93WfxuJaUDOhIIvoS6pyT
         eEJ+EHyWMIm9pHNFmRSU38mor6SqAL6bAU12vMN5MXGEhWjENRqG3wDjgioICbp51din
         7I+4FNFGTQRoNuY16Ufx4UFnJd9OU3AbHL8mEnKSXUl4qgnOVA5OxdKNgK+SzyVZtR3k
         dQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717744973; x=1718349773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpUI7yOj0geGpoHOmm7gy9aeO8gTqLL+WoIbVOaBgBw=;
        b=Jlps0kQOC9EmDMzyDjNedNp0sUvwatZNSgOFvWKkbW/rVGTCb9ltivjlLigx1Gk4EH
         gIAjLKXj2afj5K1Zvmij2oJV8jmOEbcHO7RovchYt/PsqMRVuO4q1Dgn0xoK04MeDHbm
         7w9ofmlueUIXBijbbYZLau+FK9PSk94nGGRC7/BiJIkRUrk15m5i/3b6YSLOQ6RMgnfq
         6V0mFpxaOl3m5agqCgq5r6H4Cft9uX8w7xZuWCaTrNIb2YpfwpLYHSdv17TSOR1sVQpb
         bNOwMImyDl9X79lCBlcVpeXtXI9alivrygSZ9l9ve4d6f0cgmmxMdzRP7HQZdg10kKn/
         I38w==
X-Gm-Message-State: AOJu0YwIJykILvt5LX69iYZrVDpMVnGtYQrzUzzwWlkdu4sZhBGgZ1oi
	c0ab3FfYp2t9DkkyKjB1KOa2a5VwzhZtQeqGBqHtw9D9O2jmO7U83NLb3QRL7d2XUTwc/2wEc4d
	Z
X-Google-Smtp-Source: AGHT+IHl0X9dAeqrfXDFAo2hlFYPHAaPGhCJ/W9LEihyconkBC8PHYvaYSvlcQt8jZeKov+rgEXSYg==
X-Received: by 2002:ac2:5a01:0:b0:52b:c09e:407a with SMTP id 2adb3069b0e04-52bc09e414amr334535e87.47.1717744972864;
        Fri, 07 Jun 2024 00:22:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bbc664476sm110454e87.36.2024.06.07.00.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 00:22:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] site/riscv*-linux: add ac_cv_func_fnmatch_works
Date: Fri,  7 Jun 2024 10:22:52 +0300
Message-Id: <20240607072252.1732005-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 07:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200424

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Other arch-specific caches have ac_cv_func_fnmatch_works. Add it to
riscv32 and riscv64 caches too, otherwise cabextract fails to build ([1])

[1] https://errors.yoctoproject.org/Errors/Details/785949/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/site/riscv32-linux | 3 +++
 meta/site/riscv64-linux | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
index 2cc26f3b93f4..4956639f5566 100644
--- a/meta/site/riscv32-linux
+++ b/meta/site/riscv32-linux
@@ -5,3 +5,6 @@ ac_cv_alignof_unsigned_long=4
 
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# cabextract
+ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
index 384d3bd87747..cbfebf5e3bd7 100644
--- a/meta/site/riscv64-linux
+++ b/meta/site/riscv64-linux
@@ -5,3 +5,6 @@ ac_cv_alignof_unsigned_long=8
 
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# cabextract
+ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-- 
2.39.2


