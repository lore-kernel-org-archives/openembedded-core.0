Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409D0E85392
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 18:36:15 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2203.1775241369720208901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 11:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dNPaxQjG;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8a56ca653ceso21984206d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 11:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775241368; x=1775846168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlxxQAHOMDqJtiydHBuCxI8RgC3MZOWtf/xQ/joiAxg=;
        b=dNPaxQjGEO9XNDWoMoSZerjPCgfHKIqE/Ujw3C6Dh4YFM0tGUzCLp4Lt343CyWuauZ
         03zdHhgcBQOOHz/BuIEF4z5mCfxQJO9NYix95t+x9DDlQSd479TZhWGuRKdwXxkOulJ9
         tNjHBXKAqsWkozM00TwFHQafVMNLokff5EBdzogyPKrWwDXopW4Yy+rVjUherNLdGLVl
         RQ+CKctWf7PsxVPCWi7GWBycbwWquE6BEvgjzrz5zeDZg1sTg5TKsY4ua8c5Z++tqZ18
         +kSe4xoYuihiyU6BMYsXNzGWyu/n7F53oL2LlSQ0G94KGFjHWjzL3pa5tiJteYCKfCVd
         bDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775241368; x=1775846168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AlxxQAHOMDqJtiydHBuCxI8RgC3MZOWtf/xQ/joiAxg=;
        b=S9SR1ZavNNgG9G5XK9UBv0LR+ExE/DLFb3A/9Dnsqgw7q0Zrft2dQfnJIvj4s+/KFV
         h0EbMWIl1sYJssMrofvP4+EZPCVzvUGpcB33WUZXNZb0OeNn4BQRq3+QqB+3/y+xY3wn
         WZk47TaT6/cFrGjAbRxc4m6lQ716WkszxBm+e5pBUm+d/oVDLeHOPKG7UM6fX9fA3ILN
         /7gPLhk3vyTL2xkiNVxFnxBe7rnaDsgBzlmUpC0TdMi8TmEIuev/AxjXFGsDTnDD43YC
         TLE7e8v+Z1VxBaYNcyvi3NvWzop771jnyR6ETCVfoF44myxdoPwCXeHsyaNpSZKBX+OZ
         MpHQ==
X-Gm-Message-State: AOJu0YySaFqfvJYCv8EDZdxbZ6CVlttqx4W/kRTm0AhFyo74RHMWKIGf
	LwKQwvte2fEJaYcatD4yLhK9eUg9DCHeLTBNQXCnVJgRVRnQmREZgIX69gQs7U6P
X-Gm-Gg: AeBDievgTa+5xeV/WtUkPecWXE9LYwPWA7RfIv0SmFkyLHbmh41o4TRc26Pm8Pondu+
	+9hedSMGPzAezQbJARX6YWR5KXYmLDHecKOa6zrnEtdtNAS1k+Tk6yUkLyQGl+/XzS3dCCLFFEj
	+tPpnD6kF5PGrgg/TIPSW/EJy1LAoY4mzyePA7procnLiI14GHbbYQpoP0pzggReiFbxSlTRdl1
	/4iOoMkqwTte8GaI0nVUYufZLnO2PWhhlSoYiEbwwtj1DzU6t6s2gwb7wxgRgLbSyoIJd+6pvH7
	Du1rFfAVrIqRN+4L9rzGsqdKKPW82CDJ8eefBSzZszHksYUtAStr3cRPBttwrRJe7UL5ID8+6jJ
	r1FPg5QnsX3nRQoo9a+TmEFY6/PVRCUmdfkRG4npZjdsN34hCiLNyNNNs5rBFsnGwgXqzd8Oc8R
	I7wT/aRB41rV24bT1Fz1hSfC6ItCqnPHWkZd+eFppWZMJloCCHweHQylmhFab+loS3yw==
X-Received: by 2002:a05:6214:3bc5:b0:89c:e270:c8ed with SMTP id 6a1803df08f44-8a701ecf22amr63540846d6.12.1775241367709;
        Fri, 03 Apr 2026 11:36:07 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593ee25c9sm64627916d6.22.2026.04.03.11.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 11:36:06 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [PATCH v9 2/5] oe-selftest/cases/wic.py: update WicTestCase
Date: Fri,  3 Apr 2026 14:35:38 -0400
Message-ID: <20260403183541.2631883-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260403183541.2631883-1-twoerner@gmail.com>
References: <20260403183541.2631883-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 18:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234594

The wic oe-selftest defines its own class (WicTestCase) for handling
setup, teardown, and various other pieces needed to run the individual
wic oe-selftests. As part of oe-core, the wic.CLITests do not need
setup and teardown. However, once wic is no longer part of oe-core, the
oe-selftests will need to know where to find wic that comes from a
recipe. Update PATH so wic will be available.

NOTE: this patch is in preparation for removing wic from oe-core
      the wic oe-selftests work fine with this patch being added now

AI-Generated: codex/gpt-5.4 (high)
Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Reviewed-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v9:
- provide a smaller change to the wic test bbclass in order to allow
  the oe-selftests to work, this patch only updates the PATH

changes in v8:
- (skipped, sector-size cmdline arg upstreamed)

changes in v7:
- (none)

changes in v6:
- (none)

changes in v5:
- rebase with master
- split patch set back out into smaller patches

changes in v4:
- (skipped)

changes in v3:
- squashed into one large patch

changes in v2:
- (none)
---
 meta/lib/oeqa/selftest/cases/wic.py | 36 ++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index f627f7099641..791d265a5ee7 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -57,10 +57,12 @@ class WicTestCase(OESelftestTestCase):
 
     image_is_ready = False
     wicenv_cache = {}
+    wic_bindir = None
 
     def setUpLocal(self):
         """This code is executed before each test method."""
         self.resultdir = os.path.join(self.builddir, "wic-tmp")
+        self._old_path = os.environ.get('PATH')
         super(WicTestCase, self).setUpLocal()
 
         # Do this here instead of in setUpClass as the base setUp does some
@@ -72,13 +74,45 @@ class WicTestCase(OESelftestTestCase):
 
             bitbake('wic-tools core-image-minimal core-image-minimal-mtdutils')
             WicTestCase.image_is_ready = True
+
+        os.environ['PATH'] = self._get_wic_path()
         rmtree(self.resultdir, ignore_errors=True)
 
     def tearDownLocal(self):
         """Remove resultdir as it may contain images."""
+        if self._old_path is None:
+            os.environ.pop('PATH', None)
+        else:
+            os.environ['PATH'] = self._old_path
         rmtree(self.resultdir, ignore_errors=True)
         super(WicTestCase, self).tearDownLocal()
 
+    def _get_wic_path(self):
+        if WicTestCase.wic_bindir is None:
+            search_paths = [
+                os.path.join(self.td['COREBASE'], 'scripts'),
+                os.path.join(get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools'), 'usr', 'bin'),
+            ]
+
+            for bindir in search_paths:
+                if os.path.exists(os.path.join(bindir, 'wic')):
+                    WicTestCase.wic_bindir = bindir
+                    break
+
+            if WicTestCase.wic_bindir is None:
+                self.fail("Unable to find the wic binary in %s" % ', '.join(search_paths))
+
+        path_entries = []
+        for path_group in (
+                [WicTestCase.wic_bindir],
+                (get_bb_var("PATH", "wic-tools") or '').split(':'),
+                (self._old_path or '').split(':')):
+            for entry in path_group:
+                if entry and entry not in path_entries:
+                    path_entries.append(entry)
+
+        return ':'.join(path_entries)
+
     def _get_image_env_path(self, image):
         """Generate and obtain the path to <image>.env"""
         if image not in WicTestCase.wicenv_cache:
@@ -88,7 +122,7 @@ class WicTestCase(OESelftestTestCase):
             WicTestCase.wicenv_cache[image] = os.path.join(stdir, machine, 'imgdata')
         return WicTestCase.wicenv_cache[image]
 
-class CLITests(OESelftestTestCase):
+class CLITests(WicTestCase):
     def test_version(self):
         """Test wic --version"""
         runCmd('wic --version')
-- 
2.51.0


