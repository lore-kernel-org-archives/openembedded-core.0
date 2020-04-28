Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web11.1335.1588108693555723488
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 14:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fWbMWpVH;
 spf=pass (domain: linaro.org, ip: 209.85.210.68, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f68.google.com with SMTP id e26so35454521otr.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 14:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X7CLRgi3kEUN9bDv3Mn4gxPTptqw8dcC8PQM4FcputE=;
        b=fWbMWpVHR2llGj9tPqz/MXIp7kqPrhjVGjv96a1qHDEdhFDPxa41X+szfkfF/qgo/E
         nKi3l2jUfuOOQxFkTgVUE79xeHUEeTuNQFOuuTjcswhwW4nV/+YHLa4iS7dJFnULp3+O
         7rfPnbR5bVchx0kIr7nhZbDDB8njwxNomOHxFxqVb0QczM02v+yJ48NkldRQEaZts6nf
         9Dk1IWT/VA+dK0eCpmWASELHLCHnM8hNTGx0sBcRTQ95hPbKB8TaTVglhofMHw8zkta/
         bSPKfRVNP/ZEHBDHVZ8/0cTnmR0XBQf6f6kkgbA7oqqUqaPpuWRJxgSdnI3dgs7H3njR
         dZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X7CLRgi3kEUN9bDv3Mn4gxPTptqw8dcC8PQM4FcputE=;
        b=N6rCrun+wnJKchqdwc/ZskJuL6UNzII900e7emB5MWsfTjqg2OGmDMg0SdpmTT4DKK
         807dWu7lCK0EhICjxy1rStGp4/ffygDwHfmVPXvFh86/3itzQ8ho5eZIFuXKqxvVW3+/
         wCrQGkwkout1uNzm5s1x4V75Z4iWHqGvNLniIQe40fIYDKYvmv+dBGLkaEeQZm8HT1Jm
         LMf3KcnSiI/ahqP7vYaMvH7e7ogmjbGoE9bFJVzpufuzWRYdzgIE8ABOMXmmkTCZmsLi
         +rhYu5Ou05DYwgbmnybfwWlWZj3DDdDvhPajyufjC5sluX9TMVG9sMvqptdsFTLbhPDI
         x/Kg==
X-Gm-Message-State: AGi0Puacj7H1ayVLABpOkRzXiP6vDpSezpJ6JyHy5lFd6Ul6BD/BtWf0
	R6c0SR9dGkEfhn4wTL84LKBECuiJTYo=
X-Google-Smtp-Source: APiQypLkRYaLgk222AJhwOvOTMcuWlmt7Eu9+6SI+F4zHWmeyMUGwGRVxL8c08FmGQ1OzQyP5XETlg==
X-Received: by 2002:aca:5651:: with SMTP id k78mr4337025oib.32.1588108689993;
        Tue, 28 Apr 2020 14:18:09 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:3295:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id 76sm5123987otg.68.2020.04.28.14.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 14:18:09 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: bkylerussell@gmail.com,
	nicolas.dechesne@linaro.org,
	ross@burtonini.com,
	randy.macleod@windriver.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH 2/2] oeqa/runtime: Use libdir to run ptest-runner
Date: Tue, 28 Apr 2020 16:18:05 -0500
Message-Id: <20200428211805.233163-2-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200428211805.233163-1-anibal.limon@linaro.org>
References: <20200428211805.233163-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In multilib build configs libs can be installed in /usr/lib{32,64,x32}
so use libdir to specify the correct ptest directory along with default
/usr/lib.

[YOCTO #12604]

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 99a44f0767..1b1474adcf 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -49,7 +49,11 @@ class PtestRunnerTest(OERuntimeTestCase):
         ptest_log_dir = '%s.%s' % (ptest_log_dir_link, timestamp)
         ptest_runner_log = os.path.join(ptest_log_dir, 'ptest-runner.log')
 
-        status, output = self.target.run('ptest-runner', 0)
+        libdir = self.td.get('libdir', '')
+        ptest_dirs = [ '/usr/lib' ]
+        if not libdir in ptest_dirs:
+            ptest_dirs.append(libdir)
+        status, output = self.target.run('ptest-runner -d \"{}\"'.format(' '.join(ptest_dirs)), 0)
         os.makedirs(ptest_log_dir)
         with open(ptest_runner_log, 'w') as f:
             f.write(output)
-- 
2.26.2

