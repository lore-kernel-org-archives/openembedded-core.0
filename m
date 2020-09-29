Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.2031.1601418330735716181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 15:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=feCOTO1H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id g4so7180796wrs.5
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 15:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CSN50BxN5WmYMLvOlleHQagJkIYhGAje3m+jQJOohdk=;
        b=feCOTO1HEnNowqGTk8mp0voWkyY+AZYP/O9+4uDo3RAKK2MvD+P+td4KN7AcvMf3Ag
         z8YgW4gArc0T+FARFYqVm8vdsTvLlN71hKqzF3bJ/ih3lTV/0/FA2Z4Jwl6w5X4bEtMy
         LzitNv1pRYUpTQTg6RQhA4EpsBpVXayu3eaVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CSN50BxN5WmYMLvOlleHQagJkIYhGAje3m+jQJOohdk=;
        b=R0HiZKYr0XKZpyqHGdmyT4ZHezYDwMqc1G3gDN8XSdHvu/suM/ffqbKx31nrBjwCwp
         Nafye+e6Deri87qX0HPCB9bdYXcsmqrmquJ53tALY1wJ6G5ya2r/hmU7kOH+FGIk3PR7
         Aj5J7k0reOJZao0wC+AziLJOLZK2Tpf5VMXgk6E2YSYHCYPF7oRhJdMAYlUb6pdY6qTX
         5/gakDHm+8B3TPmKGMZrAui3UAF56rENzEyXeVudxJ+TNa5xri/ycde9Y/7o2ihmCUrE
         WkKN9G5AI4PrsfyvMFdtv084tvJhctjEqbGu21ZzbqWJzMYdOugEJT3GEm7bo6jdkj3A
         K0mA==
X-Gm-Message-State: AOAM530yEJoYw10vujEYbcNB8CI56H7I7ptIGuBKXCQXECtqhbysGtss
	3vEWUPy2Uk8Xk4yDKglzwasfDcrF/fB15Q==
X-Google-Smtp-Source: ABdhPJy3t/2ceLf5+gGRj5g5El1PdJXTDZq6HDbrHkVrFVG1tijZ76Y6XzXgqq+MIoODR65J6bux8w==
X-Received: by 2002:adf:ec4d:: with SMTP id w13mr6873007wrn.334.1601418328473;
        Tue, 29 Sep 2020 15:25:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9c3e:7322:3204:3cf7])
        by smtp.gmail.com with ESMTPSA id x16sm7914572wrq.62.2020.09.29.15.25.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:25:22 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/devtool: Add sync call to test teardown
Date: Tue, 29 Sep 2020 23:25:22 +0100
Message-Id: <20200929222522.2796655-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devtool tests are heavy on IO and if bitbake can't write out its caches, we see
timeouts. Call "sync" around the tests to ensure the IO queue doesn't get too
large, taking any IO hit here rather than in bitbake shutdown.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a3d2e9ea7cc..4a791ff40e0 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -107,6 +107,13 @@ class DevtoolBase(OESelftestTestCase):
                         'under the build directory')
         self.append_config(self.sstate_conf)
 
+    def tearDown(self):
+        # devtools tests are heavy on IO and if bitbake can't write out its caches, we see timeouts.
+        # call sync around the tests to ensure the IO queue doesn't get too large, taking any IO
+        # hit here rather than in bitbake shutdown.
+        super().tearDown()
+        os.system("sync")
+
     def _check_src_repo(self, repo_dir):
         """Check srctree git repository"""
         self.assertTrue(os.path.isdir(os.path.join(repo_dir, '.git')),
-- 
2.25.1

