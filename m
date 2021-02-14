Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.21187.1613329980850065282
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 11:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b/NLDC94;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id l19so5682710oih.6
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 11:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7MEd0gS4f7Xya7jGBVneZfD6c4A7zprBb4RscReNZQ=;
        b=b/NLDC94osWxb2A6nWYUO/aCcVTYxBrgPIxFYKxujyd3d8m+4mPV9th3+GZxwupwN5
         eH88lKMNFxJswkhTThhlTQC1+60+YyZZovWtt4XderUyEPoZOulpHa8m1zJ4kfie8U9a
         4p3MuoC0bVPc+GK85kHzelD/RcrwfKXfi3MCl+PVlajc7tzUW6wvYkjU1MZ2vIUt2AaQ
         yhIJQaFITTudCxtpwBmicWPguIb6H9qPb7FUlV0/x3Yq8+v9zXig1th+gPbCJM4TaIjB
         lTH8QUdCH4WQ+pO6kkOg8Y3wcaVzOclyyiw4BUxWt2gy97dzINpc6jHC9vziWXFJ0rI3
         3QoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7MEd0gS4f7Xya7jGBVneZfD6c4A7zprBb4RscReNZQ=;
        b=kUUFW5J9sl7hJ5PDVw8j6kHdL6BSTrcD1FsDP5T4EQCiemnuJut81jD6P7teLCed2Z
         ZA7tMggsHpISddLj5DK0dzam8cWa/JbpEjAzzlP3HT6xdJy9p1Sy3npFiwEGYcX3KSgk
         8DZZoJtNOWgMYbyQHpVBjlEXKSAg8+9icQLRhYp8YHcppkUVkvHIyC0u7w7xNXZGB1WS
         +Cb99wS2fpsrHK4FOxfEjZ3rSJE0zZU0IoDEaiv2ljyO2TiiVdW4aRQcwIpvs9JyLiMy
         Br8QbUMdPysNAXINpUN9x+GrkqZIugeQnGumRh9q66JOJviJpHo2A75wZGDuFLJLWVHu
         pvCw==
X-Gm-Message-State: AOAM530/eiK7eiUL6xJ5liDHoWKae4M8ktwrQ2YqmBSqs5c/PIiFluR5
	BWGPLXp++35IZxIyB49vk3GB6SausMQ=
X-Google-Smtp-Source: ABdhPJwMNvVzPylfQX6wHMExeEaK4GhKw+l4uBnt6H66JMN/NNshECnXDMasD117qJFmcA1Yxcrf4w==
X-Received: by 2002:aca:3354:: with SMTP id z81mr6058939oiz.2.1613329980037;
        Sun, 14 Feb 2021 11:13:00 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id s49sm3079854otb.39.2021.02.14.11.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 11:12:59 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] oeqa: reproducible: Add more logging
Date: Sun, 14 Feb 2021 13:12:58 -0600
Message-Id: <20210214191258.19940-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reproducible build tests can take a long time, so having more
logging messages at various points in the build can help debug where the
build is taking a long time.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 7bc578a20f..99497522d2 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -261,6 +261,7 @@ class ReproducibleTests(OESelftestTestCase):
                 SSTATE_MIRRORS = ""
                 ''')
 
+        self.logger.info("Building %s (sstate%s allowed)..." % (name, '' if use_sstate else ' NOT'))
         self.write_config(config)
         d = get_bb_vars(capture_vars)
         bitbake(' '.join(self.images))
@@ -287,6 +288,7 @@ class ReproducibleTests(OESelftestTestCase):
             self.logger.info('Non-reproducible packages will be copied to %s', save_dir)
 
         vars_A = self.do_test_build('reproducibleA', self.build_from_sstate)
+
         vars_B = self.do_test_build('reproducibleB', False)
 
         # NOTE: The temp directories from the reproducible build are purposely
@@ -301,6 +303,7 @@ class ReproducibleTests(OESelftestTestCase):
                 deploy_A = vars_A['DEPLOY_DIR_' + c.upper()]
                 deploy_B = vars_B['DEPLOY_DIR_' + c.upper()]
 
+                self.logger.info('Checking %s packages for differences...' % c)
                 result = self.compare_packages(deploy_A, deploy_B, diffutils_sysroot)
 
                 self.logger.info('Reproducibility summary for %s: %s' % (c, result))
-- 
2.30.0

