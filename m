Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.1160.1590530253485080543
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 14:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nks/7fn2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id i15so21985937wrx.10
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 14:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kwP6sxBj0D6pHYSxVX8kLJZWdMKm5dclDK3FrmaX+ZE=;
        b=Nks/7fn2xvb7KwUDRDznXZQvpYmkYVHhnkx+8rZHBDq1iMbS3RBhgB0iOrwlHv+Qmz
         qyvkahWaQDRP0oUygbpbqDve09bfqdbEQ6/kim6g4bXPEZDM/EBAUJFvqxxRxRxGzF/b
         lsXvKtm+1+LTkAY0zgkZNi7jamCJ0ZqFnYq6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kwP6sxBj0D6pHYSxVX8kLJZWdMKm5dclDK3FrmaX+ZE=;
        b=XGpfRPUyUilg1SLUZENunqn9p1VhDh3jEg/j7cVGySsktMuK7T4HdhkgWmPZwy+O0w
         iLROOBad5UKQWZ9rDUeh6UNDd9UOmDVzueeMs2lab68rAF1W9nX4GcA7Put7OI3GSx0k
         ZUoyuODrffZk5LvoZz+ZFl5N0IsL1YKpcLlwtsslm7d11LVzEF+2Vhi9LgL/pPIDLvnW
         otWsrVUcZ9fFHvDb9YeZ8m4DcLiJy9aQFi48v/KFEBx2bgYHiaxzizJHc5z7LNQjFIh/
         F3rJY3qeqWzXjsn5FkcXHPOLvPGMmPQ6PsjhrYUXVCV0Uk8nG6gP8wNL3H5lvEVNDUBW
         bISA==
X-Gm-Message-State: AOAM532HYsTHtmvelrY9F9Fub/Ri018VWJ9oyEtKXKl2xsbhRjxMGY1b
	aEGiYLMvgzl7vvovtyuO3YJGy9m4Z13law==
X-Google-Smtp-Source: ABdhPJy/RcAPPPVKj23CgcnpfXuxxUQbd5lCflrquqlvymFuTTI9beGVlW99FtV0R+upLQEDn/zCyQ==
X-Received: by 2002:adf:92c1:: with SMTP id 59mr7304818wrn.401.1590530251841;
        Tue, 26 May 2020 14:57:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z132sm901291wmc.29.2020.05.26.14.57.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 14:57:31 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] ltp: Exclude the memcg_stress tests due to timeout problems
Date: Tue, 26 May 2020 22:57:25 +0100
Message-Id: <20200526215725.992258-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526215725.992258-1-richard.purdie@linuxfoundation.org>
References: <20200526215725.992258-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This test runs for 900s, we often see tests killed after 300s without
output which makes the test results unreliable and inconsistent. The
easiest solution for now is to skip this long running test, patching
it out wth sed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/ltp/ltp_20200515.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb b/meta/recipes-extended/ltp/ltp_20200515.bb
index 0304a40185b..67c75903204 100644
--- a/meta/recipes-extended/ltp/ltp_20200515.bb
+++ b/meta/recipes-extended/ltp/ltp_20200515.bb
@@ -72,6 +72,10 @@ do_install(){
          -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
          -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
          -e 's@[^ ]*--sysroot=[^ "]*@@g' 
+
+    # The controllers memcg_stree test seems to cause us hangs and takes 900s
+    # (maybe we expect more regular output?), anyhow, skip it
+    sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
 }
 
 RDEPENDS_${PN} = "\
-- 
2.25.1

