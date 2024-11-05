Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A62D3E77B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:42:49 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.33189.1730846558630101250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 14:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hABLEXXx;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so51234755e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 14:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1730846556; x=1731451356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GfxHCmeenOU5/D3IHu17NqGvkLMpH4MrVDIWQJu6P+0=;
        b=hABLEXXxpI31Ar9FEo1U0SFCadGqiCE5TksVundk901aIZd5eGbbgxP7l20PHwMLpT
         bTlrCNp924JZRH09caN422eWTGkYRXUygDEhQMSXHfX5ksTKIx4QCYVAUGnOm0AfftJW
         OGjcp7rZQeVkmMkFTihMpIm4dU6R1xOxQTnmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730846556; x=1731451356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfxHCmeenOU5/D3IHu17NqGvkLMpH4MrVDIWQJu6P+0=;
        b=lBbp+aJvz5GWE9caD4Sv3UGGrZVKj8eSwlMnoaV3V2LTx7mLqTFX9Ppk1dumWWATyt
         5nM+SZqApaIZXaQYbzJKGTpMvpzx64H8vaiBSIVoAxr8jWZ1mnE1sFrY9oC6dtD0SwkO
         lr6PYRTbeQi9n5OUmRkpEKQbKBN9WanYg1RYzOPPbfZmgrTws4N2aFmQiXvQIaFoIl/z
         dkYKhlawnN5t59a6fXsKpKMSA0MGg1gKNlXlyF1fnnNTT/YM62VjqbujEkUD/0EItdIe
         jbxPC4RGGrw93l0DeIG02YzkwBkbW84L4v2ietirIMxo5/nX6nNPIZDPYpLJeu/He46s
         VXNg==
X-Gm-Message-State: AOJu0Yxk1Yr/cR9q83Kv+bu8zH6IQgS206/Be/9v7v6q5XQMKKltGS3W
	VQxi6BK+x1Anz1qaizLt3+X/DewlzHUPI8uPaLrGAe0f1mvxII9jU6J6RlogAW13m8b9qCGpMVL
	B
X-Google-Smtp-Source: AGHT+IEKm3IpoHoDS03iXVryvKHTY7QcU4CkwR+5bHXT1//tnA+xy+fvVNCw9O1DtAlXvAAt62hV6Q==
X-Received: by 2002:a05:600c:3b9c:b0:42c:bb10:7292 with SMTP id 5b1f17b1804b1-4319ac70754mr344297625e9.1.1730846556368;
        Tue, 05 Nov 2024 14:42:36 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6b629dsm947845e9.16.2024.11.05.14.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 14:42:36 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] reproducibility: restart bitbake for each build
Date: Tue,  5 Nov 2024 23:42:13 +0100
Message-Id: <20241105224213.1596075-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 22:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206759

From: Yoann Congal <yoann.congal@smile.fr>

Since [0], the reproducibility test tries to save logs of failed builds.
Using the memory persistent bitbake prevent this by concatenating logs in the
single persistent instance (See [YOCTO #15641]).
So, force a BitBake server restart for each build to ensure a new log
file is created.

This fixes this error (seen on AB [1]):
  2024-11-02 08:16:00,816 - oe-selftest - ERROR - reproducibleA build failed. Trying to compute built packages differences but the test will fail.
  2024-11-02 08:16:00,819 - oe-selftest - INFO -  ... ERROR
  2024-11-02 08:16:00,819 - oe-selftest - INFO - Traceback (most recent call last):
    File "/srv/pokybuild/yocto-worker/reproducible-meta-oe/build/meta/lib/oeqa/selftest/cases/reproducible.py", line 321, in test_reproducible_builds
      self.copy_file(variables["BB_CONSOLELOG"], os.path.join(save_dir, "bitbake-%s.log" % name))
    File "/srv/pokybuild/yocto-worker/reproducible-meta-oe/build/meta/lib/oeqa/selftest/cases/reproducible.py", line 216, in copy_file
      shutil.copyfile(source, dest)
    File "/usr/lib/python3.11/shutil.py", line 256, in copyfile
      with open(src, 'rb') as fsrc:
           ^^^^^^^^^^^^^^^
  FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/reproducible-meta-oe/build/build/build-st-meta-python/build-st/tmp/log/cooker/qemux86-64/20241102071141.log'

[0]: https://git.openembedded.org/openembedded-core/commit/?id=c78cc753843d4199443052e8deb0c9c3b7e4b580
[1]: https://valkyrie.yoctoproject.org/#/builders/87/builds/17/steps/40/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index a68f72ff23..415a1ef577 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -239,6 +239,10 @@ class ReproducibleTests(OESelftestTestCase):
         capture_vars.append("BB_CONSOLELOG")
         config += 'BB_CONSOLELOG = "${LOG_DIR}/cooker/${MACHINE}/console.log"\n'
 
+        # We want different log files for each build, but a persistent bitbake
+        # may reuse the previous log file so restart the bitbake server.
+        bitbake("--kill-server")
+
         bitbake_failure_count = 0
         if not use_sstate:
             if self.sstate_targets:

