Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4AEE81DFA
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 13:26:09 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.12624.1696598760528065240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 06:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0TJcwrzR;
 spf=pass (domain: baylibre.com, ip: 209.85.128.52, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-405361bba99so18977655e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696598758; x=1697203558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lnePxctiV1ZPFgTFr5gLqjn1dgbMhjupXCKALuYMwY=;
        b=0TJcwrzRK4j8RUhD6bxN/YzAdkMx1LQqLknc5vZNA+LwOglFijQuCwBH8xAf5ULJQZ
         Gpl1Ys35OT68kqiPVk9dWAxUJVRiFfY6IWMUFqnvualsGyKHwmt9bEbsEMFUmXeh2A7i
         /JCRGZBjrqZp528Jp6lf9E+z0VS8pgL5IFg3FAxzDFfrYXAH419zOO8sM1HNvj/s6i6a
         u2SmawRFWmQ2AWz2e6kDdfaFqGY4FBsp0NkIE0HMXqJfnt8eZcnDTW9KYoDCOwV+dNtR
         qGfzBXDQaqo6TgaoiTzZpve6dcNSgJkxwpA7g07tJwEvNLu5A5sPRsh7YOvNxbG3wJlL
         5cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696598758; x=1697203558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lnePxctiV1ZPFgTFr5gLqjn1dgbMhjupXCKALuYMwY=;
        b=ImFUNRa+lZ6iIaJ793wY8nl6vsBJw7rksMfq6S5Hte192XB/nMjE8x5u+dRytYtD9B
         zG/dEgKhW7W9+l3XiNdQcKZYNSU4cc5PEVF9WZNn6N42tJDmshf71VAWVNbGoI21qKuV
         5R3LE0FYu9NVqvPUFVDvEt5g62GzeFtw/KLRtMSJOUKlWzWPiC4/SJ2NTc7VrdYgBLmB
         F591fNS409VHR+Zy0Ggg3DVGSstlZ2Bvy398K4x4EvVVAimD9e2aYwvq5I/ThPL7WWFL
         nA9MNXUYkQSraCWHOK74Kd7AFMWvr+e0rX4JtZLZpYLIx5YxFca3jlzJHqghHC5lRT7f
         3Ebg==
X-Gm-Message-State: AOJu0YyyFLroOo062nLM38wRrPdxXDLrnBjJdhRPYAxz/Dqush0oysnn
	N0uPdB4aVJX4SR4fkzhG3XgNq00W9fPDXJQLXcoRfw==
X-Google-Smtp-Source: AGHT+IHYnBP92oN1nNrseNyuUX25/t9N+8navhOHN37qONADVoXF0Hc/o2ifNFus0EbT7NcPP0DsIw==
X-Received: by 2002:adf:f005:0:b0:31f:db12:f5db with SMTP id j5-20020adff005000000b0031fdb12f5dbmr7345760wro.32.1696598758345;
        Fri, 06 Oct 2023 06:25:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d54ce000000b0031773a8e5c4sm1678587wrv.37.2023.10.06.06.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:25:58 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 1/2] oeqa/selftest/devtool: abort if a local workspace already exist
Date: Fri,  6 Oct 2023 15:25:53 +0200
Message-ID: <20231006132554.2561243-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 13:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188767

if user run devtool selftests with a local workspacelayer
the tests fail with various error such as:

- devtool.DevtoolAddTests.test_devtool_add just hangs
- devtool.DevtoolModifyTests.* fail with the following error:

 ERROR: Found duplicated BBFILE_COLLECTIONS 'workspacelayer', check bblayers.conf or layer.conf to fix it.
 Found duplicated BBFILE_COLLECTIONS 'workspacelayer', check bblayers.conf or layer.conf to fix it.

Check if a workspacelayer exists, warn the user and abort the tests

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b577f6d62a1..c36b1efa78b 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -27,6 +27,9 @@ def setUpModule():
     corecopydir = os.path.join(templayerdir, 'core-copy')
     bblayers_conf = os.path.join(os.environ['BUILDDIR'], 'conf', 'bblayers.conf')
     edited_layers = []
+    # make sure user doesn't have a local workspace
+    result = runCmd('bitbake-layers show-layers')
+    assert "workspacelayer" not in result.output, "Devtool test suite cannot be run with a local workspace directory"
 
     # We need to take a copy of the meta layer so we can modify it and not
     # have any races against other tests that might be running in parallel
-- 
2.41.0


