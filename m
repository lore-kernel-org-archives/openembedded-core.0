Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.206.1630174501137569834
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LIICTpPg;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.182, mailfrom: steve@sakoman.com)
Received: by mail-il1-f182.google.com with SMTP id x5so10899084ill.3
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=muTWKTp0xLDru4sxdV+eM3a20qEsZOzwLRwDR4nIxpY=;
        b=LIICTpPgjBmYKCspc/50J7OoJeT2uwNTsbwjao78OVw5RC40Y/NnoDMFVGFgWcQTA8
         P8QvES0siftfuIvLl5ZR/ChXZcTZL01d+ioaWdX1R8+6g8DeGX/mUZHkaWQE9r9VUtnq
         ny61k8NqwDl7h4SvrEZgE9o88DtPMCFbA7nrJEn31r/F6CQPuAXCThLbxkeE7TfY2zgU
         wnckrPErQd+fUYjwr2vN5U4vEXBtY7Mr49Y+yo9DSpgrM9wmQLcdmQhho8AvvCUMtJxn
         jCvbf0bsGBmBxmKdq6z+rnz9ZScXlNthXloIukeD5rgGic+WZWc6WsdsJifCfAGOH7Qf
         wgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=muTWKTp0xLDru4sxdV+eM3a20qEsZOzwLRwDR4nIxpY=;
        b=Eeem6d3LRSt7mbAqslhx1jvs8DJPWPrwsJiGlKlvYnMNPAvBdW/5H55Wo/xIS+GP4K
         Qvn/7B1WXCm0Ymz+3E/tH0D+k7RdMcOQAg8KwThYFIpusp+9zlp0SLgVe24XgqMkABlw
         OL1TE/GYh0Ickc/gS3G8toRB32q4aUQVH+rIwiQ01/ogLpOJf2JMav4YvCgFXVgeLP5N
         YTgWoj9WOFmxM1p1e/4vt2BH+QrZHPCa2oU02slYf2xph1bS5gO2aGQEmxRhSGxV5hWs
         5aIju3cGENs2g6ou3HPUjD6KDr7A3fh0zMVtVhbY702zArhB/M+Lr3BT953ixvgEFzTW
         WjfA==
X-Gm-Message-State: AOAM5306UPzJ/KMg4h4PMpXWbm7bJoPGpcmaZZavvyl2FXqkQ1aNZdgn
	3JiI4H7xGKeoXPtJ27Psui/es+xHfomB9mLl
X-Google-Smtp-Source: ABdhPJwteljOouiKj7PaGlzPbxoQ/RO7hoXTtof267PLHG+HUlxUFC9196nqkF9Avp6007H5iqsorw==
X-Received: by 2002:a92:d68a:: with SMTP id p10mr10602829iln.179.1630174500159;
        Sat, 28 Aug 2021 11:15:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.14.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:14:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 36/36] selftest: disable virgl headless test
Date: Sat, 28 Aug 2021 08:11:24 -1000
Message-Id: <448e0271ed831582bb5833486fc17b131676fb53.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Crashes in mesa when using vgem kernel module (in the absence of real GPU)
have been observed in dunfell (they do not happen in master):

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14527

Let's focus on making host-accelerated virtualized graphics work well in master
and upcoming releases (the issue is not seen there).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 353d411681..1c935da919 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -216,6 +216,7 @@ class TestImage(OESelftestTestCase):
         Author: Alexander Kanavin <alex.kanavin@gmail.com>
         """
         import subprocess, os
+        self.skipTest("Crashes in mesa observed with this test on dunfell: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14527")
         try:
             content = os.listdir("/dev/dri")
             if len([i for i in content if i.startswith('render')]) == 0:
-- 
2.25.1

