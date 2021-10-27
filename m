Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D748C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.9298.1635325674998708655
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XLrgdi3u;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 y205-20020a1c7dd6000000b0032cc8c2800fso4707689wmc.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jUF0CjclDr9b+rBbcm6dNn6oxk6dXQo6TMkOaJ9aPJg=;
        b=XLrgdi3u6EP2aAM0uJeQdWOpDJ1qfPuXMZLfijgH7VghENwTWuh7/u8mBUTEIyrLAL
         2Wul4sEwgvhswI768NLt1bYNPJNlCioPlffHHmxv2mvrgILEscZZANwSyoyjLK3EaxOq
         kK0Rg1lu5c64q8gB3HmlwMAD+9uv1GBI/BxkpjUFbDkDSvp5T4bFiI4PvZdqXUpVxCBX
         gfPfaMCu0Bipkhkgdleu3hjIEquLwYjJmX5IXdwx0TN6fd3wtzVIo0nvJdbfSywWLe84
         tWGEN613LJGkD4j+G+1iIXscQzftkdg4KVG95s6euB4wuW1NshXmzIWFW4yIrlfllVPx
         yBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jUF0CjclDr9b+rBbcm6dNn6oxk6dXQo6TMkOaJ9aPJg=;
        b=YWbsmfjqNRvJo823DvO7WnXvyXHVphJfIMjnRsYd0L3UjBSpVLY+9/EzYbc4ZrkmAn
         75xTPNJAdcyrZjLpQyU8evsIFpuRFlfio/aB0bdiooFAGTpH4Z7h91MU770GFwEPq/Dl
         lfOru4AFqt9hTzNWQ+D1mtwa0t1x9Ma42e2HeCgl+bEupI0eSkf86S9rxw8+95AwgTlL
         zOGyc4Yy9WqIZVbXTrAq8ewEhC49R+pRD5J4jnLfdP9ZyjydPVYGS4MCv1Pb0PuMpIqj
         TUYc57u7cBBO3HEH0PcQDmz6sbYKjpSQwwNSt+ba5eQVLb/koVkBcf1WfJO2bqX5YG8k
         o3Fw==
X-Gm-Message-State: AOAM530bqi3SsKMQUhnbAKChRzb2HRXyoa1pe2IrUXKbBKbwT+Mmwzgt
	OhGtOuC1Uy4eirG8BqyR1ZDsD4ZvD9I=
X-Google-Smtp-Source: 
 ABdhPJx1Y5VDKEvTjkqmOaM8df3N5cxkVXbutWZj8Yb3LvEks+3TLep6yPNKlrcunJ5Htm8ZczqSJQ==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr4548156wmg.195.1635325673638;
        Wed, 27 Oct 2021 02:07:53 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/30] virgl: skip headless test on specific older distros and
 fail otherwise
Date: Wed, 27 Oct 2021 11:07:29 +0200
Message-Id: <20211027090736.2546759-23-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157499

This allows catching failures on new build hosts, instead of quietly skipping
the test due to incomplete host setup.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 129503de63..a90f62bfe1 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -213,17 +213,21 @@ class TestImage(OESelftestTestCase):
         """
         import subprocess, os
 
+        distro = oe.lsb.distro_identifier()
+        if distro and distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04']:
+            self.skipTest('virgl headless cannot be tested with %s' %(distro))
+
         render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one sutable for mesa llvmpipe sofware renderer."""
         try:
             content = os.listdir("/dev/dri")
             if len([i for i in content if i.startswith('render')]) == 0:
-                self.skipTest("No render nodes found in /dev/dri: %s. %s" %(content, render_hint))
+                self.fail("No render nodes found in /dev/dri: %s. %s" %(content, render_hint))
         except FileNotFoundError:
-            self.skipTest("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
+            self.fail("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
         try:
             dripath = subprocess.check_output("pkg-config --variable=dridriverdir dri", shell=True)
         except subprocess.CalledProcessError as e:
-            self.skipTest("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
+            self.fail("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
         features = 'INHERIT += "testimage"\n'
         if 'opengl' not in qemu_distrofeatures:
-- 
2.20.1


