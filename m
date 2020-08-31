Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web12.69.1598910837653551897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2020 14:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lhKvTvLJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id x2so491701ilm.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2020 14:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=627A3GMOeyrTmBpl5mZwGQGNnczMgBtClvo11FRPhAg=;
        b=lhKvTvLJqz49Nsx4tahxpHBNgkYWhreN9IQiTFyynyvwqDlDziwukrLtaDIDWfC7aj
         k66ZesWrl6LLitll59iC/qOioyDFXv59AgS2t/Mgk7TjuOVljtkl0dPow1Vp2p14WBFq
         Q8QDVxw59vz+pC0/CFvmFvpG5SMz4+uXRxy77LJE3S5rEXppbRmpmzO5hntIBjJpqar5
         iw1FzHlKDZQOXluWYYq7xL7GxpGk8vZBmlBWDWtwqOx3/wHUsSdVR+R/kiYstxKHXoEh
         3ofI+29NMATQTZJOim+EiXLQ9jjChRZd4WZZso1Cb04cYArGmRQ181NK9TNUztSay0Dh
         ix7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=627A3GMOeyrTmBpl5mZwGQGNnczMgBtClvo11FRPhAg=;
        b=NmdBtSe61OhIyUVooDrlil1C0eAHC78zBs7wirG6ScFG3e5hsNe3snQOiBZUFjAEvo
         HXL+zXEyIRqVcke74sCIZwhommcql5hbqhAu/IVgYohHthsxNk9H6i8Y+qin1QdK+HgU
         +RNgZibs2mDFVYKAC9qtis1Uy+YDy4N/s0jzdv/p5gcKA28roIoPEuVSBt2cxHOlCUdd
         XBsjfQdDYMM5HTfo5ELekFroSY8+KSNPmJMCuV8/FirQBE+u/vuANMrrdthNlkUtfe/b
         uRZLX6XwDWwGGZHrpMcvp8B+zzKc6UtcoTHs6GmIFyAqw/qUMnyOCIZAIKc3is0selbc
         UtIA==
X-Gm-Message-State: AOAM530mtgRLQswrLcft7R437ukv7yVeEs4nIkaDOjxhC44u3Lz4R+sQ
	c7HPzQL8c0Cdxmt2BoYhxHbxcXEbfEI=
X-Google-Smtp-Source: ABdhPJyIH9hVJ9IwmQQUxZLoCYtDoPza6+mqrv0GK9iftecNI0dFGOaJjJ+IpzNZJIiXIrpop4WtPg==
X-Received: by 2002:a92:d08e:: with SMTP id h14mr3156800ilh.1.1598910836660;
        Mon, 31 Aug 2020 14:53:56 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:7282:816:6ef9:8e8c])
        by smtp.gmail.com with ESMTPSA id s85sm5285352ilk.77.2020.08.31.14.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 14:53:56 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] oeqa: sdk: Capture stderr output
Date: Mon, 31 Aug 2020 16:53:53 -0500
Message-Id: <20200831215353.8783-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Redirect stderr to stdout when running subcommands while doing the SDK
tests. The tests will show stdout when CalledProcessError is raised,
but any output to stderr was lost.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/sdk/case.py                  | 2 +-
 meta/lib/oeqa/sdk/cases/assimp.py          | 2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py       | 2 +-
 meta/lib/oeqa/sdk/cases/buildepoxy.py      | 2 +-
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 2 +-
 meta/lib/oeqa/sdk/cases/buildlzip.py       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index ebb03af9eb..c45882689c 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -26,7 +26,7 @@ class OESDKTestCase(OETestCase):
                 return tarball
 
         tarball = os.path.join(workdir, archive)
-        subprocess.check_output(["wget", "-O", tarball, url])
+        subprocess.check_output(["wget", "-O", tarball, url], stderr=subprocess.STDOUT)
         return tarball
 
     def check_elf(self, path, target_os=None, target_arch=None):
diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index f26b17f2e9..f166758e49 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -30,7 +30,7 @@ class BuildAssimp(OESDKTestCase):
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
-            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index e565826541..e7fc211a47 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -24,7 +24,7 @@ class BuildCpioTest(OESDKTestCase):
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
-            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index 4211955f8d..385f8ccca8 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -28,7 +28,7 @@ class EpoxyTest(OESDKTestCase):
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
-            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 1121ed20ef..eb3c8ddf39 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -31,7 +31,7 @@ class GalculatorTest(OESDKTestCase):
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
-            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index 515acd2891..49ae756bf3 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -20,7 +20,7 @@ class BuildLzipTest(OESDKTestCase):
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
-            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
-- 
2.28.0

