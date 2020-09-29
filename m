Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.13578.1601354950677866034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 21:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tkw2K+OH;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id d13so2857858pgl.6
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 21:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I+6UrPX24yTp5mbUeoct5cEzTepgae+eQgJ+pCdgeNY=;
        b=Tkw2K+OH1uKHRIMZM2a2wQKAE53clL9DKY/VWN3zFvMqBMBUJRVszgh+4QxVcVJt1+
         t3Zp1ac3Qw79v0ecB0pRKeh0ULrK6NeJuXVxOtt0dE4CVVV1lU/aC4crCSbcI2J7FjLD
         xOGHNIUWx6u2yWlLDNJ4YVlEE9HsNjgqWtVQujnIm2tumnCeTbTo3kyU0HvRFJBfcBdF
         k8BreZWL93Sr+NuLnwCabzHhVCxipcjSkKCMd2MrDoJ9W6SG8UnKDKM5aRZjg3HN6gd+
         dzI3BKdmTRdf/uiKMuloURBAgLMjGdqyUcAKI3igWOZYk3ZWM9Rlb6MZUMeVLTKyPm1d
         4xhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I+6UrPX24yTp5mbUeoct5cEzTepgae+eQgJ+pCdgeNY=;
        b=ERwxKea4SCzOT05RSOj0hK1IGzGLUnt3291TxRRzCRtW0gRRmDSIumzv4MVqbN/59b
         odrHiydpwPybqR2QUqckZP151VxwWCMFwnHAf5Llfmi2DDScwk8Bw9CcjSKQ4CWeap/s
         NxEGcm9MgBgApsSs+T2lPcVFi0OoL4yVXEPRHGMUGFaOxrAnAc4f0cQW0WN7bVXd2uJL
         KOfPk5KoKrDd9UJNH5nZkwJaxXvjJrQp2ezTNmgLbOtGHombbXGIRoSOxf63Cx2lhZpa
         eSMgv+T0MIaBMJBH4HeDtAOyZuy7Kcw5K6Zf9usfhq6ngWlNhJZmM6qLUKwYuKCUYu7H
         XDPw==
X-Gm-Message-State: AOAM533gdsvIj2QaDsxtOk5GLpbvqBFNLCBK5zkcQGNREtcqJe1RYYEV
	RWOBYWIPxeoXC2bDn/gjRQH71ns0OjePxA==
X-Google-Smtp-Source: ABdhPJzer8BLavSY3CW5bZqXR/avf2BjT6XZP47TMnziCRZ/+Z2vcIjUtDVaL9adJ3KiyZWXW1eREw==
X-Received: by 2002:a63:c806:: with SMTP id z6mr1943994pgg.333.1601354950002;
        Mon, 28 Sep 2020 21:49:10 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:a8fc:f8ce:30c1:8849])
        by smtp.gmail.com with ESMTPSA id s22sm3714379pfd.90.2020.09.28.21.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 21:49:09 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH v2] oeqa/selftest/cases/devtool.py: avoid .pyc race
Date: Mon, 28 Sep 2020 21:49:05 -0700
Message-Id: <20200929044905.16683-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

In certain conditions, most likely under heavy load on the
AutoBuilder, the prebuilt .pyc files are attempting to be
executed before they have been completely copied. Avoid
this by not copying the .pyc files (nor the __pycache__
directory). The impact of python3-native recreating the .pyc
files should hopefully be negligible.

YOCTO#13421
YOCTO#13803

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---

v2:
Fix typo in AutoBuiler

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

