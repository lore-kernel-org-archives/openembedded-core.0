Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.13567.1601353975256286249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 21:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gER3VpoR;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id m34so2818529pgl.9
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 21:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dGgk/lxltE8+fltUyHOhyrRe5VPoJk+FWG/0VGN42EM=;
        b=gER3VpoRBFc/xcl9//sqvsv95anJUMNM0I3FU3WByzzf3FxJtUwsbgrGlZ8ol+WUO3
         0GA3Jb09jvgdPSr798cgsPiqbtpJRF8wxV07UohY3eYGRMgdLfcC4bVJh8Egmh2jAo7G
         IcpDjGPXdMRnnXrF+xQYJXMk1rkiFcIVGlvyijjOfk9Bvl8xJTz9/KeOPScGBLCSz0ay
         uBLV5fFCY0HG1dMIVKOEtyOluv1y3O+MIUEi5RBwJNvp6A91qxoJPqDfgKjNV7IdqTbz
         4Le/AF/h0Qem5ChzhdVn4e5aO6s7Hu8tRxXMy4o1+Hj9hzllgiUH85xBqrBI94MRYQvP
         Htcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dGgk/lxltE8+fltUyHOhyrRe5VPoJk+FWG/0VGN42EM=;
        b=mv9+RkYbpYPxpAlu6I4pUxXOWqVm/bEimLOXidGKujwmyuUPfj4iLzNZL/dG3gsSZv
         JswfNQDZzTCPAwAa2zRzdvPJE23CXmqNNJeXZx8MKQtXrKK8UnyCJFEVqB6o/ce/z89l
         RNAUzsjT7XxbhJ4eHnU+thldoyDd7z3XAOmZaZiy0fvexNKg5/Ri1GqhMqz9HEql6Ess
         DHyhZCEzbrBqg2XDnED7jza6oP3mE1tpKcdTvqKy4q9J4b3XYiLjxfK84Fea6Oy1i+Cl
         6pXBW3vf8LmDXD9b3GfasHqE4LJUdvp1QRo8+CaNb9y01eiPS90g8mUf96BcOOl0Xq87
         NcuQ==
X-Gm-Message-State: AOAM530pwfD4SlNgiEMmXWHYbhSj6YodzAjWc2jR8N6qL/EnRz2eNW0I
	5nPoiGnGBWvmRa3Z1i94fpj8FF+UJhCPWg==
X-Google-Smtp-Source: ABdhPJzoNVAdsQsjdhf+tQ03jdpXyG22z2k0GJob0GVtYmPq/81dLheipCKCan89trbW83bOYA14+Q==
X-Received: by 2002:a63:4945:: with SMTP id y5mr1796503pgk.181.1601353974445;
        Mon, 28 Sep 2020 21:32:54 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:a8fc:f8ce:30c1:8849])
        by smtp.gmail.com with ESMTPSA id v10sm3034329pjf.34.2020.09.28.21.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 21:32:53 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH] oeqa/selftest/cases/devtool.py: avoid .pyc race
Date: Mon, 28 Sep 2020 21:32:46 -0700
Message-Id: <20200929043246.11195-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

In certain conditions, most likely under heavy load on the
AutoBuiler, the prebuilt .pyc files are attempting to be
executed before they have been completely copied. Avoid
this by not copying the .pyc files (nor the __pycache__
directory). The impact of python3-native recreating the .pyc
files should hopefully be negligible.

YOCTO#13421
YOCTO#13803

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b383ed9c50b..a3d2e9ea7cc 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -56,7 +56,8 @@ def setUpModule():
                     if pth.startswith(canonical_layerpath):
                         if relpth.endswith('/'):
                             destdir = os.path.join(corecopydir, relpth)
-                            shutil.copytree(pth, destdir)
+                            # avoid race condition by not copying .pyc files YPBZ#13421,13803
+                            shutil.copytree(pth, destdir, ignore=ignore_patterns('*.pyc', '__pycache__'))
                         else:
                             destdir = os.path.join(corecopydir, os.path.dirname(relpth))
                             bb.utils.mkdirhier(destdir)
-- 
2.25.0

