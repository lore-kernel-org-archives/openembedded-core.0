Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.11682.1614356514446534445
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 08:21:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VMYdfoG4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id n4so6872318wmq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 08:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WsnL1KaQX5sKm4pXgMu7s9ljN7CUmdzoW4iEsQMsZ8E=;
        b=VMYdfoG4t7GxEKlzJlAC4Fvc9CODaW65L7qL6ELK3G4TYtjKsCXzgUg6cw5b36EVFN
         DL9gcWgS2/D3P8689TmZwo5P99FnSEAjNB457PQEwzqLN6nMST0/zWJEYYYds8h4YTqk
         P1HruyHxJdk+oV0RWt3nTVVWZzMczcvFNNg58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WsnL1KaQX5sKm4pXgMu7s9ljN7CUmdzoW4iEsQMsZ8E=;
        b=hSOrIC496s5LApRYeRrL+W9kwKpVHN/3SkM/vrnkSr1q6zPGae8di6MR7IL19rY/BC
         8AmJvmzjJjSDYCxPdZ9SRloiSfQ8ElAAShoZM/pRXRyeKZ8Vn8Eb/LK/GS+KTk158LiN
         2bq1lXILSTjunoeyOkfwzHr5dJ9JRUZwGI6C6GEvzks3lRwamLHd4FRYHAmJz9Q68uNj
         diZ2ce43UqFzmldlkLUBPnlv5+uf1xtzoPEyZeAMhF188CcEvobhkQ+jKXm1iJWxFuNj
         lHHbUs1NoYniEmiU/2UgK0hFt5yKlqrxFONlbOfOZv+4EfnPs1zNMeK5VoaDx38wenkP
         N+pw==
X-Gm-Message-State: AOAM53396UtGYvsXvoMnBff68HKb7UKIHLa+ztlbtedJ9byLctl2o2Zm
	KQKM2Ojas8E4RTdC8qjlOxzuEolKZkw1CQ==
X-Google-Smtp-Source: ABdhPJwpNynloeUZKwXmaw9GHUBOC8zwuqM4j56B0F//TLhGO3PeKRz49+LQBqe3x6CVzgLBD+/9mg==
X-Received: by 2002:a05:600c:290b:: with SMTP id i11mr3488785wmd.129.1614356512614;
        Fri, 26 Feb 2021 08:21:52 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id b8sm5513010wrq.74.2021.02.26.08.21.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 08:21:52 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/reproducible: Add ability to pull some objects from sstate
Date: Fri, 26 Feb 2021 16:21:51 +0000
Message-Id: <20210226162151.3940257-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When debugging why a single recipe doesn't reproduce, its a pain
to wait for the world to rebuild from scratch. Update the selftest
to allow this to be configured, for example you could set
targets as ['perf'] and sstate_targets as ['virtual/kernel']
and then it should only be rebuilding perf in the test rather than
things like the toolchain (parts of the kernel may be unavoiable
as they're not in sstate).

Can be run as:

OEQA_DEBUGGING_SAVED_OUTPUT=/tmp/perf-diffoscope oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds

to save diffoscope output.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index ce4e8ebe06b..02052eea289 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -159,8 +159,14 @@ class DiffoscopeTests(OESelftestTestCase):
             self.assertTrue(os.path.exists(os.path.join(tmpdir, 'index.html')), "HTML index not found!")
 
 class ReproducibleTests(OESelftestTestCase):
+    # Test the reproducibility of whatever is built between sstate_targets and targets
+
     package_classes = ['deb', 'ipk', 'rpm']
-    images = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'world']
+
+    # targets are the things we want to test the reproducibility of
+    targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'world']
+    # sstate targets are things to pull from sstate to potentially cut build/debugging time
+    sstate_targets = []
     save_results = False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
         save_results = os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
@@ -241,6 +247,11 @@ class ReproducibleTests(OESelftestTestCase):
                         tmpdir=tmpdir)
 
         if not use_sstate:
+            if self.sstate_targets:
+               self.logger.info("Building prebuild for %s (sstate allowed)..." % (name))
+               self.write_config(config)
+               bitbake(' '.join(self.sstate_targets))
+
             # This config fragment will disable using shared and the sstate
             # mirror, forcing a complete build from scratch
             config += textwrap.dedent('''\
@@ -251,7 +262,8 @@ class ReproducibleTests(OESelftestTestCase):
         self.logger.info("Building %s (sstate%s allowed)..." % (name, '' if use_sstate else ' NOT'))
         self.write_config(config)
         d = get_bb_vars(capture_vars)
-        bitbake(' '.join(self.images))
+        # targets used to be called images
+        bitbake(' '.join(getattr(self, 'images', self.targets)))
         return d
 
     def test_reproducible_builds(self):
-- 
2.27.0

