Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B207C4452E
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2891.1784568213942135877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZjlXcdf6;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954dff6536so19614325e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568212; x=1785173012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VGgkXohXiYrebipYU2/cg0oI5VWRYzLm9h4fMotMqVY=;
        b=ZjlXcdf6AiNSOjNwSpdBDtLXjViMIauIxzZ1kYsKEkxkaUv2O0D8nkvNHXlgIWmOSt
         qq6rprquNFvVNJuzrWP/KesvFKA+sFXxRiygCuxmSJLaVK97dPRqSmDAGkMlCtrdQS4M
         SnIssrLr4eCpipPhIWu6Qccg3Zh9ClwIWIwzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568212; x=1785173012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VGgkXohXiYrebipYU2/cg0oI5VWRYzLm9h4fMotMqVY=;
        b=R8OPIOJVRUAPYQIcZ2Ld38EePhwVa/mNxk+jGNTmqYcfbP2Kgoq9FdCtLeGoeQE3bn
         8VQWLEyVTxoIPn2nzjNKO78FWtNA1tXa8RWPXaLJKBtD3DVtyC+lFNISaUrXc/0o7CK8
         RyhbKGas7HB+E3Gi2xOfrjNwtILLaMOq9/bfIhimmb5dUMyOhVVf+RE03qIKPdZSN8ny
         xpdAQtxFHedWZfgTOtGJLCz7T157N6ThFUVVCfTzRA6HlJ6E0EZyN12K8cOo2HsN9192
         Mq050bM+b7Pso1DkQQ+Xd52/FzWbDrbYMDsTsfIR48eIWBnvZ8L4Pv3H6Id8Vzkb5R+y
         u8wQ==
X-Gm-Message-State: AOJu0YyRhPUCo9fqm3IdPBcNJnTHc5Pny04EDlV0iCTETj6IcJnoA0m0
	AlzG58WsFBKWuQO/TxIcSmKaIvXh3M25vlhtmVcdgTXDg5eRYxEurxAN6DtznFh9jA7KrctilEH
	oSAdFpOs=
X-Gm-Gg: AfdE7cmTrEUm77Wi8A3AxynR3/6A+jRGFXGF20KApR0EZEe76j8b/s3QQ0ZimatPrHn
	cmKXHGcFYSW98ARVK3wIfAXLhb3ZndfjQ4K3kHKDf5tUIlAIyFsxpXn9zU/nkgy175GAW6a3TyI
	MM1iHJEkKf1tSd96ffXEb8d5V0wdi3GHgG1Z3WS47Fii3HYtI2GuStFKpWgHNHYmJdHt3eapX8u
	ybk3R0QKgVjxhKI08R8vt4LB5Sw0TNaik7p8r+aZ8UP95qsRrhmYyIiJG/yJI+4fy3p3O7oRfUo
	IoqD0UkLWQXyi7QiDLZJ2iWzWrecGH9WXVH4wdFKitS4Vl1GAnqN8Gy8iRTYFtOXHe6fg4+VFWZ
	SE5xDUoa13kt8oe/HlMYSPN3yuayiN0PoAfRjKya4pYwfT2hPIFNRUnbTxnajjV10qrMyLLndP5
	Wp8eytrBuWMJb3A1UC+zITRp6stSObGM52hND7mPlT+5xzrs+rY2X0vyNBDs/JTc1DHu+t/WCfz
	TzfjHO1
X-Received: by 2002:a05:600c:1c04:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-4954a3cff64mr184467975e9.1.1784568212094;
        Mon, 20 Jul 2026 10:23:32 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/33] python3: fix CVE-2026-11940
Date: Mon, 20 Jul 2026 19:22:41 +0200
Message-ID: <a76513212f1830fbda2dc6a243943a3c1a011239.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241442

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

tarfile.extractall() with the 'data' or 'tar' filter could be bypassed
by a crafted archive where a hardlink references a symlink stored at a
deeper name than the hardlink itself.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2026-11940.patch       | 66 +++++++++++++++++++
 .../python/python3_3.12.13.bb                 |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11940.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11940.patch b/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
new file mode 100644
index 00000000000..0851138ae89
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
@@ -0,0 +1,66 @@
+From 91a9bd79cdbab8f8518c4a5e669b3f19680a2f31 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Tue, 23 Jun 2026 14:31:38 +0100
+Subject: [PATCH] gh-151558: Fix symlink escape via `tarfile`
+ hardlink-extraction fallback (GH-151559)
+
+CVE: CVE-2026-11940
+Upstream-Status: Backport [https://github.com/python/cpython/commit/27dd970bf6b17ebca7c8ed486a40ab043ed7af8f]
+
+Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
+---
+ Lib/tarfile.py           |  3 +++
+ Lib/test/test_tarfile.py | 24 ++++++++++++++++++++++++
+ 2 files changed, 27 insertions(+)
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 59d3f6e5cce1..83226e907e4b 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2650,6 +2650,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
+                     "makelink_with_filter: if filter_function is not None, "
+                     + "extraction_root must also not be None")
+             try:
++                filter_function(
++                    unfiltered.replace(name=tarinfo.name, deep=False),
++                    extraction_root)
+                 filtered = filter_function(unfiltered, extraction_root)
+             except _FILTER_ERRORS as cause:
+                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 759fa03ead70..29719d95b6c1 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4080,6 +4080,30 @@ def test_sneaky_hardlink_fallback(self):
+                     self.expect_file("boom", symlink_to='../../link_here')
+                     self.expect_file("c", symlink_to='b')
+
++    @symlink_test
++    def test_sneaky_hardlink_fallback_deep(self):
++        # (CVE-2026-11940)
++        with ArchiveMaker() as arc:
++            arc.add("a/b/s", symlink_to=os.path.join("..", "escape"))
++            arc.add("s", hardlink_to=os.path.join("a", "b", "s"))
++
++        with self.check_context(arc.open(), 'data'):
++            e = self.expect_exception(
++                tarfile.LinkFallbackError,
++                "link 's' would be extracted as a copy of "
++                + "'a/b/s', which was rejected")
++            self.assertIsInstance(e.__cause__,
++                                  tarfile.LinkOutsideDestinationError)
++
++        for filter in 'tar', 'fully_trusted':
++            with self.subTest(filter), self.check_context(arc.open(), filter):
++                if not os_helper.can_symlink():
++                    self.expect_file("a/")
++                    self.expect_file("a/b/")
++                else:
++                    self.expect_file("a/b/s", symlink_to=os.path.join('..', 'escape'))
++                    self.expect_file("s", symlink_to=os.path.join('..', 'escape'))
++
+     @symlink_test
+     def test_exfiltration_via_symlink(self):
+         # (CVE-2025-4138)
+--
+2.54.0
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index d74bdc158b6..e4907154119 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-6019_p2.patch \
            file://CVE-2025-13462.patch \
            file://CVE-2026-4224.patch \
+           file://CVE-2026-11940.patch \
            "
 
 SRC_URI:append:class-native = " \

