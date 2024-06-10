Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B17C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 16:16:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.23764.1718036211360819977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 09:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=b+RXv181;
 spf=pass (domain: snapchat.com, ip: 209.85.218.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6269885572so991157266b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 09:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1718036209; x=1718641009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Jk/qqiVKJGMhHnwCqj+m3HrP3qSeMpqe29MEKc/jkE=;
        b=b+RXv181N/WQBBi9oTerXTU1SxFjDOj0tH7dB9Xm8J+pdp1rZX2xu7eG44I984xgja
         3eVy/utm/BeOZ5jYxi4sxmg3TSB0PZWcnpF0tygkosm8f1Snti9BtXXxb9Iv2GG/IZ9s
         kU2qOICWmzeNgU6AYScI1CavRSikFPpLrOunY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718036209; x=1718641009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Jk/qqiVKJGMhHnwCqj+m3HrP3qSeMpqe29MEKc/jkE=;
        b=FZvxbBJIOTl5HeM9b5E4gkRFMFMD0s5CXVpizdsdOtwCCT/aWRxoK/QzFIOaahndaR
         h6b/LhcPt7klwDFHBsxoJrwt8qql00enNVSZu412A8pw8YP/ds7BgfhsaE/g7VrtG2fT
         4qBIPlwuL3VxV5qQm/CMhPXOX+y55bG1++y4flCGD8ULZM05u3eGB5SYnHMdaEfBP5d8
         T0Opwo9k29YUavaMfSHD8I9UQh/Osp10YuHaKIjSxBl20k1pT543xjDEC0KS/skRxX5s
         sTLpA1+2cCdIHog+NpweexsiMzUa2xXk9LzEXayDnP5KLNKo4GmpddwFEsoeAowb4QHl
         NXeQ==
X-Gm-Message-State: AOJu0Yy04wIG1fbbKPvzds3loZC0d/Lv0izDuy24gz0pJZM7uX7j2Cyi
	YAMArpm3085LD8vUyBRIu1wmgJmVXqzvkPZHbm4e0iyozyzcc1J/5Po9zvnmhpKplacRAPMMu6N
	tjYA=
X-Google-Smtp-Source: AGHT+IEBIOaZAsXG6S5zd4vHBPdUZRrx54RVr6zFnpZY5t34LHwJwG3ThS6ZH89lk7+gXUOe0WHzkw==
X-Received: by 2002:a17:906:3d8:b0:a6e:ffef:b6ab with SMTP id a640c23a62f3a-a6f34c7da08mr9718466b.7.1718036209223;
        Mon, 10 Jun 2024 09:16:49 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f15095318sm246915066b.131.2024.06.10.09.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:16:48 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v3] oeqa/runtime: fix race-condition in minidebuginfo test
Date: Mon, 10 Jun 2024 18:16:42 +0200
Message-Id: <20240610161642.257051-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 16:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200481

From: Etienne Cordonnier <ecordonnier@snap.com>

Fix this error where 'coredumpctl info' warns that the coredump is still being
processed:

```
AssertionError: 1 != 0 : MiniDebugInfo Test failed: No match found.
-- Notice: 1 systemd-coredump@.service unit is running, output may be incomplete.
```

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 80fdae240a..aed230708e 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -155,6 +155,13 @@ class SystemdServiceTests(SystemdTest):
         self.target.run('kill -SEGV %s' % output)
         self.assertEqual(status, 0, msg = 'Not able to find process that runs sleep, output : %s' % output)
 
+        # Give some time to systemd-coredump@.service to process the coredump
+        for x in range(20):
+            status, output = self.target.run('coredumpctl --quiet --no-pager --no-legend | wc -l')
+            if output == "1":
+                break
+            time.sleep(1)
+
         (status, output) = self.target.run('coredumpctl info')
         self.assertEqual(status, 0, msg='MiniDebugInfo Test failed: %s' % output)
         self.assertEqual('sleep_for_duration (busybox.nosuid' in output or 'xnanosleep (sleep.coreutils' in output,
-- 
2.36.1.vfs.0.0


