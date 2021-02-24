Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.2910.1614204529586447946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 14:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d0GDRXLW;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id b145so2252936pfb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 14:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/N50YuXOvZBq0BNga2G+oA+yUAA4vNoCipK7qQseiU=;
        b=d0GDRXLWPB2vaGaBUrz3tN85oJ5FENQkKhViEF8N49qiq5nXmhGBE/d2a1YUEqGOyD
         puZ/KKbaspoa/q3Owgnr4L2BJwFSA+p207Bi0PGM3Qlcu4ypLEgrokVgS/jEgdRdNa8e
         HoUTeqwV4rZY9Qf3xTe1ciU15gc5RoASDiitvTWGBLL1vESfBb6TmI10P7SRrctgAvJM
         cObywDQzpwChi1/iBHZibkPiDl4kqrlTNOm0VdFKZPGstUj3UQgN8ycvp1Jakr4ao2Q0
         cny7d68t5LibP0oj3m2VXzjoxrjWyNueWRgzQJAMgl4ny/XwHbYoG2RwW7bmkewo3fkM
         8rlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/N50YuXOvZBq0BNga2G+oA+yUAA4vNoCipK7qQseiU=;
        b=qnO3yQPMbvnAjOSvBKjdhX4pz5vomKs/fcmKF79zHKLbOh3M8lxDYy6wXtgUe0va9k
         VJ0mNxxjWI1zVqoUCmz1PCJLQJfYny6RMTHDqSPfD86jxhbfqO/L/OQDSm7YNBqbv8J1
         Ohu+OFfHKTdCLIutP/SWM2HHc0yA/qWLiA3hVag0bEoCLLE1oOOUYJWHRhClJvcVhLub
         KSh/a/0RMo4kTqex1nuCvGtElhOvvUr1wno58OytamuVOqpbmOMgSGfqqDaCIduGSqg9
         JdqwT8cqKQ38c+b0i4i+tnjWWAFcjCcJPcj8QXEXgiiLGbMBhE+pyW4w6NeMZBt4GLD/
         1aqg==
X-Gm-Message-State: AOAM532Cpw01gOWVmUUNjNqSThHRJTUws3mfrqIFWwaGsnYMTSW8w2Og
	aufYDHkrw4C+X/bDvYraP7M+RKRqctjwnw==
X-Google-Smtp-Source: ABdhPJyMHpvnDyItqzmJTHXJOZKDHZfx18wljLb5UeXT/EjUJFI8LpHjOYl23DQ6OUnIdhpCWnCZ6A==
X-Received: by 2002:a63:5c63:: with SMTP id n35mr53646pgm.26.1614204528601;
        Wed, 24 Feb 2021 14:08:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id c6sm3934438pfc.94.2021.02.24.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 14:08:48 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] selftest: Replace building dep tool with direnv
Date: Wed, 24 Feb 2021 14:08:46 -0800
Message-Id: <20210224220846.3211585-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dep tool is now deprecated and its replaced with go modules so using
this as sample for testing is also getting arcane. Replace it with
another project direnv[1] which is quite active and uptodate

[1] https://github.com/direnv/direnv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/selftest/cases/gotoolchain.py | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/selftest/cases/gotoolchain.py
index 3119520f0d..4fc3605f42 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -46,26 +46,25 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
         shutil.rmtree(cls.tmpdir_SDKQA, ignore_errors=True)
         super(oeGoToolchainSelfTest, cls).tearDownClass()
 
-    def run_sdk_go_command(self, gocmd):
-        cmd = "cd %s; " % self.tmpdir_SDKQA
+    def run_sdk_go_command(self, gocmd, proj, name):
+        cmd = "cd %s/src/%s/%s; " % (self.go_path, proj, name)
         cmd = cmd + ". %s; " % self.env_SDK
         cmd = cmd + "export GOPATH=%s; " % self.go_path
         cmd = cmd + "${CROSS_COMPILE}go %s" % gocmd
         return runCmd(cmd).status
 
     def test_go_dep_build(self):
-        proj = "github.com/golang"
-        name = "dep"
-        ver = "v0.3.1"
+        proj = "github.com/direnv"
+        name = "direnv"
+        ver = "v2.27.0"
         archive = ".tar.gz"
         url = "https://%s/%s/archive/%s%s" % (proj, name, ver, archive)
 
         runCmd("cd %s; wget %s" % (self.tmpdir_SDKQA, url))
         runCmd("cd %s; tar -xf %s" % (self.tmpdir_SDKQA, ver+archive))
         runCmd("mkdir -p %s/src/%s" % (self.go_path, proj))
-        runCmd("mv %s/dep-0.3.1 %s/src/%s/%s"
+        runCmd("mv %s/direnv-2.27.0 %s/src/%s/%s"
                % (self.tmpdir_SDKQA, self.go_path, proj, name))
-        retv = self.run_sdk_go_command('build  %s/%s/cmd/dep'
-                                       % (proj, name))
+        retv = self.run_sdk_go_command('build', proj, name)
         self.assertEqual(retv, 0,
                          msg="Running go build failed for %s" % name)
-- 
2.30.1

