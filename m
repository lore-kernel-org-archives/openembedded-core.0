Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318EFC25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 13:25:07 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.9502.1718112295021011689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 06:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=aOb2h5i9;
 spf=pass (domain: snapchat.com, ip: 209.85.208.179, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso72658771fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1718112292; x=1718717092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+YOE77V0FRox6UNQJs0iifz/P+byRWI10ge43b2+T8=;
        b=aOb2h5i9ymqJPZeQgTTS1MXqiF5nwhTjO0SqCrfifbW+ndKrV1rW+Jk9FNCrdcus8p
         1WrmSTl9xsQAsz5pd6WvLJsMHAcLXVxOn6wBQfrb+5AltdmOD99m/EU1nXj7ec+tW1Qz
         LjIlcaoO+VDFtNPrkMr+wFrQ8LNTFAnjvT0+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718112292; x=1718717092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+YOE77V0FRox6UNQJs0iifz/P+byRWI10ge43b2+T8=;
        b=elb7zxoy+5zH0/0Pud/DTE7fw+7Zi2RG/gJZrWVuSrYZ5LHUvVDOwD8UaJOMWr8ohl
         LoKuB0ep4RzUieuX+qpBdvyPPXgkEd+OIXjy83oWzM+9OP6kU4q5Vhau3Hgnrx6FWcrA
         MenLl1409kt4sKRXM+acE0VoRIhGPimt84c0+Up92tD1lx4YDX8wOiAm1yJsN5gmjRCf
         PFT0GFZDvPOvAxXRT2BtdKvQav72le83uukLIoNEdbX4YSa25Flv2J/rv3IlYxPiU+Do
         7I9S3mST0t/53+Y8CiFUVcQALr4/kqn9d2fGUiG3OjFKNNyn+/mL6GCGgPf6rnZA4r6P
         kKZw==
X-Gm-Message-State: AOJu0YytnDYwWwJzgoORC2jRU3zWGyM9z4HB9J9S54eEaarT1nmMTr6Z
	HUzcsqkkGqrZrCVTxUz/I28Db3lfunXkcFfzDhxfbo9DFSC/VsuGL7/i8dr825As1nptnzlQf+a
	BSYI=
X-Google-Smtp-Source: AGHT+IFRe7KR4YezbHU0x93ECrkvwRgpai3F/1HDKU/ixtHZKhWDBtlkBOQ4PWtXhwh4+JMCsydV4A==
X-Received: by 2002:a05:651c:4c6:b0:2ea:7d2f:415d with SMTP id 38308e7fff4ca-2eadce1f0d4mr88320831fa.1.1718112290338;
        Tue, 11 Jun 2024 06:24:50 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421580fe3cfsm209904575e9.9.2024.06.11.06.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:24:49 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v4] oeqa/runtime: fix race-condition in minidebuginfo test
Date: Tue, 11 Jun 2024 15:24:47 +0200
Message-Id: <20240611132447.1497274-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 13:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200521

From: Etienne Cordonnier <ecordonnier@snap.com>

Fix this error where 'coredumpctl info' warns that the coredump is still being
processed:

```
AssertionError: 1 != 0 : MiniDebugInfo Test failed: No match found.
-- Notice: 1 systemd-coredump@.service unit is running, output may be incomplete.
```

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 80fdae240a6..b399e2e279e 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -150,12 +150,21 @@ class SystemdServiceTests(SystemdTest):
         t_thread.start()
         time.sleep(1)
 
-        status, output = self.target.run('pidof sleep')
+        status, sleep_pid = self.target.run('pidof sleep')
         # cause segfault on purpose
-        self.target.run('kill -SEGV %s' % output)
-        self.assertEqual(status, 0, msg = 'Not able to find process that runs sleep, output : %s' % output)
+        self.target.run('kill -SEGV %s' % sleep_pid)
+        self.assertEqual(status, 0, msg = 'Not able to find process that runs sleep, output : %s' % sleep_pid)
+
+        # Give some time to systemd-coredump@.service to process the coredump
+        TIMEOUT_SEC = 20
+        for x in range(TIMEOUT_SEC):
+            status, output = self.target.run('coredumpctl list %s' % sleep_pid)
+            if status == 0:
+                break
+            self.assertLess(x, TIMEOUT_SEC - 1, msg="Timed out waiting for coredump creation")
+            time.sleep(1)
 
-        (status, output) = self.target.run('coredumpctl info')
+        (status, output) = self.target.run('coredumpctl info %s' % sleep_pid)
         self.assertEqual(status, 0, msg='MiniDebugInfo Test failed: %s' % output)
         self.assertEqual('sleep_for_duration (busybox.nosuid' in output or 'xnanosleep (sleep.coreutils' in output,
                          True, msg='Call stack is missing minidebuginfo symbols (functions shown as "n/a"): %s' % output)
-- 
2.36.1.vfs.0.0


