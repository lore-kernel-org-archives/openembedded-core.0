Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F475C27C75
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 10:56:42 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.5397.1718276193352583550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 03:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=YqCR/SPA;
 spf=pass (domain: snapchat.com, ip: 209.85.208.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57a30dbdb7fso1035880a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 03:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1718276191; x=1718880991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FVIME5QgE2e80l/RtzG1vcGoH7EarLchCXofVkVonFM=;
        b=YqCR/SPAZcSNyh8foN3Nqrg3vtMTAtbw0z2lbTotHocwpRINSM3XBUPZZ07VdDv4+g
         sLq526QfwGKAxDicP0QjyIaEg5HRW4mAyBSmoeUJu8kLam+oJaiczVBmoQr8pJ8OMJyR
         aXGRPp55RPX4lsXCXhySyXkqO6+Ful0413BR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718276191; x=1718880991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVIME5QgE2e80l/RtzG1vcGoH7EarLchCXofVkVonFM=;
        b=veFGu3rlyaSx79U5ZgyTyW2WGfJH3awoYbEJbLJFXv7dWGQfUC7gBWG2Z5nJHrVxTP
         1O1NxOOeLzz9tjX10I/i1NUdiugNQpTkylam0HcU0+xTcv9LiJxhFfEyC1ijYmpIlj1r
         N9XY1GIdC0GVwdQD8Z72B3WQ62rc8066lQG1WMAVavA/EYwx/YnTZH+rETbW+bqxS0GO
         mCErNwQbVO+bph11QRH5ZUiuudZLwxq0VhXeKJw5yzgVnIY//Jv4gkHUU+HkQD9ZVev5
         /2aVW2pd7eI1TeAf7lMrUFcLxQzuTPMfGjfkk1Uhb5gbxTBjZF3H0jKqxuhWic2BGlTW
         qxnw==
X-Gm-Message-State: AOJu0Yyi5bqRziTJJLZH5o5mSM3ohxIP/MA7HhV+RFw0NsA9bf+t0oP2
	0SJvAjYZSmrMb2qYkFoIjWltt4G8HY1BIqdFn/fL2JIA1PdH7atoiAn2i2nTOvYo1D5zVrTF/Pn
	wx85Zpg==
X-Google-Smtp-Source: AGHT+IGEyxG0y+QAijD3VJTh89lKxuXKMVGFrXZmxerHhxH+1q/7Z8BfueC28+RN+HcmP92HqUnW3w==
X-Received: by 2002:a17:907:9722:b0:a6a:6ed0:fbd7 with SMTP id a640c23a62f3a-a6f47fac446mr368122766b.37.1718276190528;
        Thu, 13 Jun 2024 03:56:30 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56db67cfsm59848766b.77.2024.06.13.03.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 03:56:30 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v4] oeqa/runtime: fix race-condition in minidebuginfo test
Date: Thu, 13 Jun 2024 12:56:21 +0200
Message-Id: <20240613105621.959146-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 10:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200595

From: Etienne Cordonnier <ecordonnier@snap.com>

Fix this error where 'coredumpctl info' warns that the coredump is still being
processed:

```
AssertionError: 1 != 0 : MiniDebugInfo Test failed: No match found.
-- Notice: 1 systemd-coredump@.service unit is running, output may be incomplete.
```

(From OE-Core rev: ad1ce64f5c1f22a7b10025d8cba20dc74354ac81)

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 80fdae240a6..640f28abe99 100644
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
 
-        (status, output) = self.target.run('coredumpctl info')
+        # Give some time to systemd-coredump@.service to process the coredump
+        for x in range(20):
+            status, output = self.target.run('coredumpctl list %s' % sleep_pid)
+            if status == 0:
+                break
+            time.sleep(1)
+        else:
+            self.fail("Timed out waiting for coredump creation")
+
+        (status, output) = self.target.run('coredumpctl info %s' % sleep_pid)
         self.assertEqual(status, 0, msg='MiniDebugInfo Test failed: %s' % output)
         self.assertEqual('sleep_for_duration (busybox.nosuid' in output or 'xnanosleep (sleep.coreutils' in output,
                          True, msg='Call stack is missing minidebuginfo symbols (functions shown as "n/a"): %s' % output)
-- 
2.36.1.vfs.0.0


