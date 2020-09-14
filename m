Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.62230.1600092750082677085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vGyZqYlO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id t14so11633704pgl.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7e9zECzJJUtNJ5U5ug9tGH2bGLLKNHHoKCDf7fSpW4Q=;
        b=vGyZqYlO2Xlr1jMtF33X8jABB1VEet35oVeOBq6mHokDdlAEm24mpI6djLWcapTqu+
         UoHws5ihaQGWKAGtYNb4U5a2KrUb8wSGNM9dEhhk7kUUsMLTYPrdGscResII4b7RdO0A
         Mvg4vlV1zCOofRpw/4lKVgRvfrR5NXmYLSVrRWT3wCQMsKZHUvLYpQHhRh+TlthLp1wS
         ANMwjJokDSWLLqYH/9JBLMh1TcgNecQA9BTEDEPO0dLwo3+PoI+EaTkaoYNBKmxQ/MG4
         OsxLymOt3nG4kUf+0JY07S831bd6hNrtv8+23VIevFejFT1gjcilV32AAcoXEGbSRCGf
         pHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7e9zECzJJUtNJ5U5ug9tGH2bGLLKNHHoKCDf7fSpW4Q=;
        b=gLFLJIUw3I0WmEbYcPZSQO/zbBozAVd0cABEkJKL4oXIpJg39R7OG5NvtZZ9jzXgRt
         iHB/UfLn4unJ4KtlXb7GSl8HMHz2x2AYLTfM2mp/C5DU51Divz8rPEKHkqEx2JQV8b9a
         JlpvuhYZkBOhQ36P3gsfQEhPwHIo2aahDn9PALbR/7qouRCQLkgMaVWVVRd85Ck1z/8F
         dBqsEtomlc3g3Nr6C0GkMp5dYffX3OdYseKQrlx52Xa0YNZWZlmkIKFmqnqII6Y5W26w
         vaGTgCd3fRW81QgAi0ZwoAayX9zRnUk6Ko1DR1jdRccvEL7KWoHqtWpfDHDptQjfOra6
         z2UQ==
X-Gm-Message-State: AOAM531SwyLBvcreojZkZO2yBGuGD8v72x/h78Awy10+RISeYZvMAz0w
	DYsQZKoGqCmPewc8QUMzUUeI4/YI4rmvUdNHI5E=
X-Google-Smtp-Source: ABdhPJyVZaj2dX1cWH4s3xdJYRuyOcku2xSPaluUohcNQmZzXY6scuzsTJ6Mi4Dd1sdoOJ0YgYFwgA==
X-Received: by 2002:a17:902:7788:: with SMTP id o8mr3465791pll.20.1600092749197;
        Mon, 14 Sep 2020 07:12:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/24] oe-publish-sdk: fix layers init via ssh
Date: Mon, 14 Sep 2020 04:11:29 -1000
Message-Id: <cdbc9bf63b3e1354800032d0dd530949bafb7032.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Escaping does not work in my use case. It must be escaped for
python, ssh and shell as well as for different versions of echo.
Let's try it a little less elegant, but hopefully more reliable.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5cc1ae332eb6b05d83802c8d64ab2767c7079412)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-publish-sdk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index 4b70f436b1..19a5d69864 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -106,7 +106,7 @@ def publish(args):
     if not is_remote:
         cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; cp .git/hooks/post-update.sample .git/hooks/post-commit; echo "*.pyc\n*.pyo\npyshtables.py" > .gitignore; fi; git add -A .; git config user.email "oe@oe.oe" && git config user.name "OE" && git commit -q -m "init repo" || true' % (destination, destination)
     else:
-        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; cp .git/hooks/post-update.sample .git/hooks/post-commit; echo '*.pyc\n*.pyo\npyshtables.py' > .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true'" % (host, destdir, destdir)
+        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; cp .git/hooks/post-update.sample .git/hooks/post-commit; echo '*.pyc' > .gitignore; echo '*.pyo' >> .gitignore; echo 'pyshtables.py' >> .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true'" % (host, destdir, destdir)
     ret = subprocess.call(cmd, shell=True)
     if ret == 0:
         logger.info('SDK published successfully')
-- 
2.17.1

