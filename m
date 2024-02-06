Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2574DC48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 18:49:55 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.1077.1707245387532520044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 10:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EiiWhD3Q;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-296cca9169bso710026a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 10:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707245387; x=1707850187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMN+euGK44/cCkF/4dfs1f9RygQNhrPFOVIeES0lhr4=;
        b=EiiWhD3QQDJSjPxccHgyMNAehBVeAl4x/EDuv2LHMoKa+aLEvXk8+7Vtvkukvpeyyy
         dExoTUuukHrNkMoYrZ6v0umlGET/NiaSv5WwRjzmvYa6JDEer6eaDNEonwecP82FKALs
         bfRM+EWVnSNaIsX5ghtjM7FK08vfmS47v5DFARoXCKcPQtUMLLq8EujQOB2CWPT+XY2I
         ngBuRsVR/lJoHHLoMxdV9E6G4dkAs3HNVsDd/0H78xRzl74GV5rfq5u0HaExXpDeQPLj
         VksPOLkZEdfp6J4e2LMh3y9ezW9cC7IMzUE5usbvSJKFsTyaaCMAuKjhHaMRa6yCYKgF
         NM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245387; x=1707850187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMN+euGK44/cCkF/4dfs1f9RygQNhrPFOVIeES0lhr4=;
        b=eKfLyyG5eWYHPj7uar1QbD5iQgKHeuYG5qPnrrjNyFUfr6EWJMpfqEEMMtcFBKf8jU
         pI1wQrXuMmDXY9ZpHY+Zre8LdRngtYLnbZG/adGQfAz67iw1/xA2lLKJ9L4JemsjfYMq
         bwbiQan4xozN9EelzWSCXtP856YKklhcGQ8DdLexabCL6tGEzvcHXeagtymdEeSApsHN
         Ej3P7zTGmRGC5gcyYl4X1Ys17ajilI9qLuSIpS3SNQI6awzCzDWO1I4M/bjrXNCl4CKT
         1/rUyIk1QrU9afNTZlTwXRKn7yfw4NbEd1COymq5fzFC8CNtyQDzSfHpckwuAhhcMFMD
         e/sA==
X-Gm-Message-State: AOJu0YyTaKeqG+CiEXXuvDg6XooLnOK0y+W3r248yLiw2WkrnPNWmXBq
	WKWYtka2HHR0G29VpGzdRUNWsqQ/b3eUMi5P7PX5JfWl5h2A6Mj5xPLpmK2mvMQ=
X-Google-Smtp-Source: AGHT+IHZyGDm4lgMxJxSAsXX1bamswJSgj3StipVRJV4wCnlgkrBHgiDSIg/hOIZR1m+c9KvdsxXtA==
X-Received: by 2002:a17:90b:80e:b0:296:3a5:6fb8 with SMTP id bk14-20020a17090b080e00b0029603a56fb8mr448824pjb.25.1707245386538;
        Tue, 06 Feb 2024 10:49:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c29d])
        by smtp.gmail.com with ESMTPSA id s13-20020a17090330cd00b001d70af5be17sm2212712plc.229.2024.02.06.10.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:49:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] buildcpio.py: Switch to using cpio-2.15
Date: Tue,  6 Feb 2024 10:49:39 -0800
Message-ID: <20240206184941.748116-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206184941.748116-1-raj.khem@gmail.com>
References: <20240206184941.748116-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 18:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195017

This helps in getting it building with newer architectures like riscv32
since it has upgraded gnulib over 2.14 which has the needed fixes.

Drop the -fno-common workaround as it is already applied to cpio

drop --disable-maintainer-mode

Fixes
configure: WARNING: unrecognized options: --disable-maintainer-mode

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/buildcpio.py | 8 ++------
 meta/lib/oeqa/sdk/cases/buildcpio.py     | 7 +++----
 meta/lib/oeqa/selftest/cases/meta_ide.py | 4 ++--
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index ce122ebcf98..7be734cb4f4 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -14,7 +14,7 @@ class BuildCpioTest(OERuntimeTestCase):
 
     @classmethod
     def setUpClass(cls):
-        uri = 'https://downloads.yoctoproject.org/mirror/sources/cpio-2.14.tar.gz'
+        uri = 'https://downloads.yoctoproject.org/mirror/sources/cpio-2.15.tar.gz'
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
                                          dl_dir = cls.tc.td['DL_DIR'])
@@ -29,10 +29,6 @@ class BuildCpioTest(OERuntimeTestCase):
     @OEHasPackage(['autoconf'])
     def test_cpio(self):
         self.project.download_archive()
-        self.project.run_configure('--disable-maintainer-mode')
-        # This sed is needed until
-        # https://git.savannah.gnu.org/cgit/cpio.git/commit/src/global.c?id=641d3f489cf6238bb916368d4ba0d9325a235afb
-        # is in a release.
-        self.project._run(r'sed -i -e "/char \*program_name/d" %s/src/global.c' % self.project.targetdir)
+        self.project.run_configure()
         self.project.run_make()
         self.project.run_install()
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index 33b946fc166..51003b19cd0 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -19,10 +19,10 @@ class BuildCpioTest(OESDKTestCase):
     """
     def test_cpio(self):
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
-            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.14.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz")
 
             dirs = {}
-            dirs["source"] = os.path.join(testdir, "cpio-2.14")
+            dirs["source"] = os.path.join(testdir, "cpio-2.15")
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
@@ -30,8 +30,7 @@ class BuildCpioTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
-            self._run("sed -i -e '/char.*program_name/d' {source}/src/global.c".format(**dirs))
-            self._run("cd {build} && {source}/configure --disable-maintainer-mode $CONFIGURE_FLAGS".format(**dirs))
+            self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
             self._run("cd {build} && make -j".format(**dirs))
             self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
 
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index e446d9308d5..ffe0d2604d1 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -44,10 +44,10 @@ class MetaIDE(OESelftestTestCase):
     def test_meta_ide_can_build_cpio_project(self):
         dl_dir = self.td.get('DL_DIR', None)
         self.project = SDKBuildProject(self.tmpdir_metaideQA + "/cpio/", self.environment_script_path,
-                        "https://ftp.gnu.org/gnu/cpio/cpio-2.14.tar.gz",
+                        "https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz",
                         self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
-        self.assertEqual(self.project.run_configure('$CONFIGURE_FLAGS --disable-maintainer-mode','sed -i -e "/char \*program_name/d" src/global.c;'), 0,
+        self.assertEqual(self.project.run_configure('$CONFIGURE_FLAGS'), 0,
                         msg="Running configure failed")
         self.assertEqual(self.project.run_make(), 0,
                         msg="Running make failed")
-- 
2.43.0


