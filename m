Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4807BC27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 16:03:12 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.23409.1718035389017939333
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 09:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Sk7OfXOy;
 spf=pass (domain: snapchat.com, ip: 209.85.208.47, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57c83100cb4so1291441a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1718035387; x=1718640187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QhSb7KPpybPaCCjnltiNwtIEnn101EXlb+1Qne6lsY4=;
        b=Sk7OfXOygPfU6qHmcs9zzJBqwsJ7OjNeXJvgI1osWwQ0g2fxTOQtQJulhRW/c4QflY
         Km20luo2QFfS34SwDvHtbIWRxokfHx+PgYNH+jan9flqNzmUMf10mI2oC388EL3K/XKz
         SknQOkWKAwKKmiiLusiF3Mx2XRsmz5E1bP5mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718035387; x=1718640187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhSb7KPpybPaCCjnltiNwtIEnn101EXlb+1Qne6lsY4=;
        b=v6lo0gDgppcHSGPHHEsDEHi5I/bOAhuEkDPBqzrFt8Lp++AIQnIBCRfY6qz5UmVqdX
         NuQlu5KQYvTVdsyMNA2xvc3tFvDBMvemZeZxivT5Jn9BhEp/XCnggvVI2uTSOLBTLSt2
         URb01P2Dd4cAu87MKRxM8LZ2SXWVKlgDtKtKz7IVj1GhchDVzv7eYApRJgTdNvCkLacu
         7971e+k40r35rIcgSE7IYShUfNXx3gvblAFUw8Jf/whDHVEMIrYQywn7X1UlpnIfbRO0
         hceQpDu19CQI4VIuEq+suOflNyRhtlWPe8JR1OL0d1WZ74oQ3yHociiWiLd2UvVKQfpN
         U0tQ==
X-Gm-Message-State: AOJu0YzSiwLXl7lFcpjRLYq0rkpBFWl8WEIC0hnFDE/DBXt0qq3VAuaF
	9v3YcJH2JHWWEJY1ZmX16ZG7Hnsg5jg62v7DEgezmO/wIriRdY7D+1jwnb3YvgWvnt2pnO7OHzj
	8hAg=
X-Google-Smtp-Source: AGHT+IEdqaEEb29NIqt602wVXkUvspdLudDBP4r+SH/+YbDw1633Lk6nSvcsHykirKpY2PPHisLKyg==
X-Received: by 2002:a17:907:9728:b0:a6f:1641:da55 with SMTP id a640c23a62f3a-a6f1641e656mr310227666b.46.1718035386583;
        Mon, 10 Jun 2024 09:03:06 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f24d67093sm2985699f8f.96.2024.06.10.09.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:03:05 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v2] oeqa/runtime: fix race-condition in minidebuginfo test
Date: Mon, 10 Jun 2024 18:03:00 +0200
Message-Id: <20240610160300.4003823-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 16:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200478

From: Etienne Cordonnier <ecordonnier@snap.com>

Fix this error where 'coredumpctl info' warns that the coredump is still being
processed:

```
AssertionError: 1 != 0 : MiniDebugInfo Test failed: No match found.
-- Notice: 1 systemd-coredump@.service unit is running, output may be incomplete.
```

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 80fdae240a..7b3cb53e29 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -155,6 +155,15 @@ class SystemdServiceTests(SystemdTest):
         self.target.run('kill -SEGV %s' % output)
         self.assertEqual(status, 0, msg = 'Not able to find process that runs sleep, output : %s' % output)
 
+        # Give some time to systemd-coredump@.service to process the coredump
+        for x in range(20):
+            status, output = self.target.run('coredumpctl --quiet --no-pager --no-legend | wc -l')
+            if output == "1":
+                break
+            else:
+                x += 1
+                time.sleep(1)
+
         (status, output) = self.target.run('coredumpctl info')
         self.assertEqual(status, 0, msg='MiniDebugInfo Test failed: %s' % output)
         self.assertEqual('sleep_for_duration (busybox.nosuid' in output or 'xnanosleep (sleep.coreutils' in output,
-- 
2.36.1.vfs.0.0


