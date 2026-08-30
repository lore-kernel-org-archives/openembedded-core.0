Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63866C61DB9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 18:36:27 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13802.1788114986706550132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 11:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PYWzFTJB;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-902e4af2d9dso34729026d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 11:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114986; x=1788719786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SU/9msWST4oSeQiy7ZRtuQD+MrG4v1oqoD8qrB3mmEE=;
        b=PYWzFTJB7Uj3SJV8TzTYCsoDYCaxej6ZSb9HbRSrCjaBtewpFOjLVHaC5DnSCXWvVG
         YlNQiEwgpbD1Zz96tM5RfCFLShiAzF+BEXvmsXySV7/Y1FLhxG/pv9T4N4rDUz6E9RVZ
         AKqKPro+9S36yYCMqf9EnMz5bIOdnZC2TIO8KFA4B6Suc12t60QR3Gnd+55B+hsvwmFo
         Wi3fBRSce4Nm4GHaCgvCYoa5rXrYw6LwsJF42E2BGGvKU9NssBOg20hGBm8nrm5vOBir
         uQGMu5XwRhjRX2Ozer8I9LSbnDe01nt1HxDRrd+4vsOOxM2SmhY6u9U+9jLJv+Zt0qZF
         KjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114986; x=1788719786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SU/9msWST4oSeQiy7ZRtuQD+MrG4v1oqoD8qrB3mmEE=;
        b=Ve9h+hGE/BfaXvmshL4KTgR6YS6Gg5B479v6X9AjKYTS6BrgXrZq0Umb34TPhh3y49
         oKogagjs6IWmeymKNBamvi3b0aG12ouxXDogf7O395J20Kh5pbFDy1oXfuqBHYK/D54j
         uaTiiY8I6UEcSrwYOEsUdpy4R8vaXrxRlgyqNvvX0RNtLkhVq/2ylKM5eVmVBKTxRUri
         99Uyi+sWmUPJJUavwbvgWqDdUtdnsfyadn7j/wDw0XcJOAxyKun+vQGK8eygEV4hEmWi
         tpl9ICy8VbccE0EiZ+5GuIXDOP86XT2wJQB0TSFtuOM+SpIrpUw2sF55WhmjsGYTLZSF
         LsOw==
X-Gm-Message-State: AFuF++n9wHXyN3YJOzMOPFWCmlN+sKFvI2tUxPP/FD9I2ArWNgv/qpe4
	LrpYZK8AMnnj3CAlvQKN92AxiJYJ7VFaBlNVuYA836uKfBFfIqQDBzWdbwJNIOvJ
X-Gm-Gg: AYBFou2xvutOMXCYP71Mz0kvV0VlsZ6i1gdu0d7+86s/L9u7pqeS3yxo3V1UQrAAOyo
	tw3fvp4oHgH2z+8cNA8eNHK9Xj+vZmwhmMwGS1DG90kvFKEWSHS1SmvPHPkx5nWwLBam5BNPW0j
	QVIpl0FMW+tN1HCCvXys+rYykTKks+6BdYMl+PZvxfL/nLVRZeqKoE48NbbdS4zgrukFqnfgaUn
	HbiLZBeW2e6cHk7QNqMShTGmqQBkUqBN0S4hmaTqZfe3fBbN9Zgvn8U5N2wN0uRAeLInuD0UJ1v
	DiYTGFAwF/BKPph9cxxKgg1Q2zI2y5pZuLvzo62YfeCShA5dxQfp1w3GfD252EVKCSZk3Q242q6
	MYQ/fRFp9wvNF5T6RaVCljrzPUJVU3bVZHB7UyJUCuBeVT+BBXvw3IligEWt6knNOFz+8oojAhe
	sJYyhCTrznoxGXatPLDOv2Px/+d5VYAQ0fWs/E+3OBqidRWmb5cuF1HH0CyVww75+NmsDmlkgSP
	cGHcQ1ljGrlFBqxoH2UPs+etubzWo4=
X-Received: by 2002:a05:6214:20e3:b0:90c:df17:14c8 with SMTP id 6a1803df08f44-90e871c2cfemr44507186d6.17.1788114985557;
        Sun, 30 Aug 2026 11:36:25 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce444dae0sm67267116d6.4.2026.08.30.11.36.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:36:24 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] oeqa/sdk: run the Go driver the SDK installs
Date: Sun, 30 Aug 2026 14:36:16 -0400
Message-ID: <20260830183616.4026354-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260830183616.4026354-1-twoerner@gmail.com>
References: <20260830183616.4026354-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 18:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244692

The Go cases confirm go-cross-canadian is in the SDK and then guard on
"which go", which cannot succeed: the recipe installs ${TARGET_PREFIX}go
and leaves the unprefixed binary in its own libdir, off PATH. So the
cases skip on an SDK that does contain Go. Ask for either name and
run what the SDK provides.

Running them for the first time shows the module cases also need
-buildvcs=false, as they build inside a git tree and Go fails stamping
VCS information into the binary.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/sdk/cases/go.py | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/cases/go.py
index 693be89e1df7..dfbbc4723cbe 100644
--- a/meta/lib/oeqa/sdk/cases/go.py
+++ b/meta/lib/oeqa/sdk/cases/go.py
@@ -30,21 +30,17 @@ class GoCompileTest(OESDKTestCase):
         if not self.tc.hasHostPackage("go-cross-canadian-%s" % translated_target_arch):
             raise unittest.SkipTest("GoCompileTest class: SDK doesn't contain a Go cross-canadian toolchain")
 
-        # Additional runtime check for go command availability
-        try:
-            self._run('which go')
-        except Exception as e:
-            raise unittest.SkipTest("GoCompileTest class: go command not available: %s" % str(e))
+        self.go = self.ensure_sdk_binary(("go", "${TARGET_PREFIX}go"))
 
     def test_go_build(self):
         """Test Go build command (native compilation)"""
-        self._run('cd %s; go build -o test test.go' % self.tc.sdk_dir)
+        self._run('cd %s; %s build -o test test.go' % (self.tc.sdk_dir, self.go))
 
     def test_go_module(self):
         """Test Go module creation and building"""
         # Create a simple Go module
-        self._run('cd %s; go mod init hello-go' % self.tc.sdk_dir)
-        self._run('cd %s; go build -o hello-go' % self.tc.sdk_dir)
+        self._run('cd %s; %s mod init hello-go' % (self.tc.sdk_dir, self.go))
+        self._run('cd %s; %s build -buildvcs=false -o hello-go' % (self.tc.sdk_dir, self.go))
 
     @classmethod
     def tearDownClass(self):
@@ -68,11 +64,7 @@ class GoHostCompileTest(OESDKTestCase):
         if not self.tc.hasHostPackage("go-cross-canadian-%s" % translated_target_arch):
             raise unittest.SkipTest("GoHostCompileTest class: SDK doesn't contain a Go cross-canadian toolchain")
 
-        # Additional runtime check for go command availability
-        try:
-            self._run('which go')
-        except Exception as e:
-            raise unittest.SkipTest("GoHostCompileTest class: go command not available: %s" % str(e))
+        self.go = self.ensure_sdk_binary(("go", "${TARGET_PREFIX}go"))
 
     def _get_go_arch(self):
         """Get Go architecture from SDK_SYS"""
@@ -85,13 +77,13 @@ class GoHostCompileTest(OESDKTestCase):
     def test_go_cross_compile(self):
         """Test Go cross-compilation for target"""
         goarch = self._get_go_arch()
-        self._run('cd %s; GOOS=linux GOARCH=%s go build -o test-%s test.go' % (self.tc.sdk_dir, goarch, goarch))
+        self._run('cd %s; GOOS=linux GOARCH=%s %s build -o test-%s test.go' % (self.tc.sdk_dir, goarch, self.go, goarch))
 
     def test_go_module_cross_compile(self):
         """Test Go module cross-compilation"""
         goarch = self._get_go_arch()
-        self._run('cd %s; go mod init hello-go' % self.tc.sdk_dir)
-        self._run('cd %s; GOOS=linux GOARCH=%s go build -o hello-go-%s' % (self.tc.sdk_dir, goarch, goarch))
+        self._run('cd %s; %s mod init hello-go' % (self.tc.sdk_dir, self.go))
+        self._run('cd %s; GOOS=linux GOARCH=%s %s build -buildvcs=false -o hello-go-%s' % (self.tc.sdk_dir, goarch, self.go, goarch))
 
     @classmethod
     def tearDownClass(self):

