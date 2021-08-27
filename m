Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.5481.1630053432882471853
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 01:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bvnljv5R;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id i3so3353344wmq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 01:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jLzdgW6QOE3ESEPL63dsLPB46CsbGp3aaIUYFYmNfJI=;
        b=bvnljv5RVpsxqPR6psMRy3gOu8eEZ8fYKu+WmY3H07gFZJ7cNb4T6SYqJ+ISyLwVlK
         bnfu+EuCLM94UwfAys4iBDiT1kitB8XH4b7WhlLSjVsdpjWFg+Bn4tKGS+pY+t/3QXea
         iguyrCgk5ijE5V5yBCz5P1N/PCCtbtSHjHqpVL/pX/s6pXF1Wb5/S5Zhd6vGlarOno9e
         iN62dXowCaXl2MUSwdQky3++pdeHRY1cRNm89aGh7tW0Xg+t1eIoIBOgTXwI15GXudGE
         KClbTU9Ch/Waq1t+EAT6/PdeSVr9EX0ycjHkXHNm4nhcTLXqbD4un9vaT38dlHyJGSMh
         TCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jLzdgW6QOE3ESEPL63dsLPB46CsbGp3aaIUYFYmNfJI=;
        b=bKhUqvJVbq2zCXHg672UmwgK6aZT6QnDb4hfmq3wYK3DI1GxaWLDQX4FF9XXnw9JFJ
         nNw/TKUpiSxvWjVnZ9diUsM+WTs/FweC/AyhhWkxqQACYPB4w/Yau1pF7Mx9d1wfN/jy
         vXDJBv6WN96zRjdNxbPXUnE9ISbAxVTBeqwc+m4Y6IXvgErouq0T+I5WuGjcCfHh4b7u
         givnb2cacN3mA7Y7Sk4UVqTcJMMZsR5+cCjTVFo/VLy/EpDO55wmJ4CsF2L3/5vPUyrA
         JV/xCKD1XO8wnYO1xFeLIqw+7fxsu1CEeL+ndfB15l7lXVEmEAMEXisKUyIrOI6IcTI3
         oYlQ==
X-Gm-Message-State: AOAM531jJn1uiTlxWciRey7ObCyjsLEylLO/SrJ2dRUuqIEKFT6+mI9R
	GATnY+t4jx5oALeomGfqboG7QRbdWwtzqg==
X-Google-Smtp-Source: ABdhPJxf8Ue8Cs1Pwdhob7E3cThv8YA27JxvghzWYC+Kf1nTB6F/fQ+WnN5D2oicBjUoVXrJZSlyAw==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr18522641wmc.39.1630053431394;
        Fri, 27 Aug 2021 01:37:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id r1sm9349407wmn.46.2021.08.27.01.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 01:37:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [dunfell][PATCH] selftest: disable virgl headless test
Date: Fri, 27 Aug 2021 10:37:05 +0200
Message-Id: <20210827083705.835715-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Crashes in mesa when using vgem kernel module (in the absence of real GPU)
have been observed in dunfell (they do not happen in master):

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14527

Let's focus on making host-accelerated virtualized graphics work well in master
and upcoming releases (the issue is not seen there).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
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
2.31.1

