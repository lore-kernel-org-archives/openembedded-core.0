Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6B8C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 12:40:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.18416.1718023194754260108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 05:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=QASHcOI+;
 spf=pass (domain: snapchat.com, ip: 209.85.128.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4217c7eb6b4so12754935e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1718023193; x=1718627993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=msV/hjiIAYCvm6QqR/cs4GPt9Wg/VFjEPGk3Ulo/cK0=;
        b=QASHcOI+DV9rBRTUN1SLO/UnujajZZZ2ZBctPEIOhrWADeVSxlPByD31mP+/QS555Q
         OSFEnyek1GbSpJGvC7FbIYT8U0oVuuNxajEYErYg+haVEKm4zgqts3Vf7sf5P01osZFO
         nNkgzKH7xwrGfFAOfmsECbt4VT9CmwykEw5BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718023193; x=1718627993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msV/hjiIAYCvm6QqR/cs4GPt9Wg/VFjEPGk3Ulo/cK0=;
        b=wT8Nb9vrpVd1yUB26dGlS56kJ5AplWn8BZh+AlYsU1+7hIMM2zuCLrvKbsjh8hI1L2
         DjXkKWELcULYCyCIRakE8lja8fVR0/w0JFCyxjIZMjQdMTsrjzSRYgJoRksdsIDvoan/
         lclBYvixlNPsX5jF3W3hIkgHwLknwsFObUtJ7CYSODfa3kjsip59RMENT3p/S3oo3Ycd
         vRuwCVPfuARAKJTQ9mwkaA7Q1Cnba7vJihF6ncwAFOIUBNnWpjDN8m9jPSXXk0AWZCF/
         Hu1NUKiVZB15HmgQNdnONyzKjo56uJcH338jMgVWx+aYq+7ykIv1ml8x6M6jwCiFlQSi
         ji2A==
X-Gm-Message-State: AOJu0YytStYmnCYsg2a19t90N866K6Cen49vnMQTbETf6mkb0taZTBIP
	UAVFXOFI46ByjHHj1JUttXqoN4b9r487t6ndpJvzTotmq0jP9rNNwabmJJ6JuP0MHfl+vdBTE4h
	J9mk=
X-Google-Smtp-Source: AGHT+IEusKf2CI9dJk0U11K1dfl4UMoRzjKUDy7tZb8IodOr9FlqRu4/4sAhvKjQ0iT36QZIOUoC+A==
X-Received: by 2002:a05:600c:3b1e:b0:422:123f:4b15 with SMTP id 5b1f17b1804b1-422123f4f1amr9905085e9.37.1718023192790;
        Mon, 10 Jun 2024 05:39:52 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f224d5151sm3380254f8f.3.2024.06.10.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 05:39:52 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] oeqa/runtime: fix race-condition in minidebuginfo test
Date: Mon, 10 Jun 2024 14:39:35 +0200
Message-Id: <20240610123935.2102248-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 12:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200473

From: Etienne Cordonnier <ecordonnier@snap.com>

Fix this error where 'coredumpctl info' warns that the coredump is still being
processed:

```
AssertionError: 1 != 0 : MiniDebugInfo Test failed: No match found.
-- Notice: 1 systemd-coredump@.service unit is running, output may be incomplete.
```

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 80fdae240a..17fa660ace 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -155,6 +155,9 @@ class SystemdServiceTests(SystemdTest):
         self.target.run('kill -SEGV %s' % output)
         self.assertEqual(status, 0, msg = 'Not able to find process that runs sleep, output : %s' % output)
 
+        # Give some time to systemd-coredump@.service to process the coredump
+        time.sleep(1)
+
         (status, output) = self.target.run('coredumpctl info')
         self.assertEqual(status, 0, msg='MiniDebugInfo Test failed: %s' % output)
         self.assertEqual('sleep_for_duration (busybox.nosuid' in output or 'xnanosleep (sleep.coreutils' in output,
-- 
2.36.1.vfs.0.0


