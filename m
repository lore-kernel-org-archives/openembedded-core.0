Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.2573.1615661521934113193
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sDRmmtCc;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.53, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f53.google.com with SMTP id c13-20020a4ab18d0000b02901b5b67cff5eso2385108ooo.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JVPORBSoGUZ84wjV7ZR2sqxF0alvGwo/g5QY0rqE+lk=;
        b=sDRmmtCcPHyj11H0BEpd75t1GD0qL2x2+4kt9G3ZrORX9rA4mtnCH0ICLMllOUAT4j
         TbP+cYjH6gw6uFhRklmHpYrYq9Qhk1TkY278Mz2ZnBwcdF2ca8gborHeIF5pCzVKVOjM
         b5xQpyUaJ7CslFL07vwTsN/2zHf68gvgD3D8FSleKi+NZGQJmIwlo0SFDM0OLlMa8gXy
         UMsbGBhSwM70YXVLHklIFpVFnpDTUCtwKVqaEDqqhwRBINDeQoYGoL7Df+PGixugONwH
         NT0QkW7kRpBcBiETHP2zwOi9Ia4XjCW8l8r2JovEzXLnonRxJbbI7XAXlegugJHJCwtg
         H72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JVPORBSoGUZ84wjV7ZR2sqxF0alvGwo/g5QY0rqE+lk=;
        b=L6PSie6UObsXuvXowNJD8DsbeFMIcHfWa0n7iVbAGN1rBaG5Enb2dM81nKaCl+w9T6
         N8dIUQvJeo6Ta4pGBhTDMLWl49MzZkZdY9Jg6RtHu41B8o65acO/HT76hPjMGcGhcDKe
         ZSj4dZSE0gI8K2TwHe606YYM4rjF5+K7HSa0jcl63zMBMQoUg3uK7wJI4ArZ8TINrlZp
         Fpi23AwZyjRQV1jX9mk+fPWs7HTZW/xmbhPlE3q07yOlRtZrEDca7IT528KX28I8axaf
         jXo5LnKm9lU2WXYX6b0SeZ2lKkTijvk90Jz1/SASu7ZJOzg4+WnEhPdU1Eiqv8aDtjvf
         Afmw==
X-Gm-Message-State: AOAM530/zRjWJUnJtB7BChP0jbgiIvxKmdXchfuiAdp7OczVRPlHYPrD
	EVM9rbHMznfxpsqGvD/C3jFWNJ1pV2vucwMh
X-Google-Smtp-Source: ABdhPJxNPVihKn3zocojEaK4P0NjzXpigNeEkDwXwh1ongrIQAmZt1DNLR67gQfxytETNw1QCGq9gQ==
X-Received: by 2002:a4a:d05:: with SMTP id 5mr7954345oob.10.1615661520853;
        Sat, 13 Mar 2021 10:52:00 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/38] selftest/reproducible: Add ability to pull some objects from sstate
Date: Sat, 13 Mar 2021 08:49:15 -1000
Message-Id: <8b38cd1b36f3e227a63c0aa3955f3f5ab172c509.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
(cherry picked from commit 132a17d02f29711572e14a2f38a841323fbb6df6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 7f74cec28f..f570958f80 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -78,8 +78,14 @@ def compare_file(reference, test, diffutils_sysroot):
     return result
 
 class ReproducibleTests(OESelftestTestCase):
+    # Test the reproducibility of whatever is built between sstate_targets and targets
+
     package_classes = ['deb', 'ipk']
-    images = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline']
+
+    # targets are the things we want to test the reproducibility of
+    targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline']
+    # sstate targets are things to pull from sstate to potentially cut build/debugging time
+    sstate_targets = []
     save_results = False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
         save_results = os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
@@ -154,6 +160,11 @@ class ReproducibleTests(OESelftestTestCase):
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
@@ -164,7 +175,8 @@ class ReproducibleTests(OESelftestTestCase):
         self.logger.info("Building %s (sstate%s allowed)..." % (name, '' if use_sstate else ' NOT'))
         self.write_config(config)
         d = get_bb_vars(capture_vars)
-        bitbake(' '.join(self.images))
+        # targets used to be called images
+        bitbake(' '.join(getattr(self, 'images', self.targets)))
         return d
 
     def test_reproducible_builds(self):
-- 
2.25.1

