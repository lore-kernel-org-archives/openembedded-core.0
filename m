Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A140AC25B47
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 16:02:59 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.177369.1698249775353401669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 09:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=jWHafu45;
 spf=pass (domain: baylibre.com, ip: 209.85.167.48, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-508126afb9bso1937376e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698249773; x=1698854573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ynL7zdGAC20mTB5OyW7aNoAjUj+6tC+J1p/mu7GHXZY=;
        b=jWHafu455X/CeAwh0wimkwg/jON4jXY9YzLAjeVazxnnMpWWTa0h2EgMlCDtfi8/AX
         fL7CHJkFybijUqHiyeu5CygPd4vtZe2uQ9JKBWRPyY1g//M06kDV78EhWYFTPNs/Jmvx
         mmUvTI1FetotEskBEM2UKj0W8FOvnHQHz1We+qWe+ChnZSaM/zANYMrS39Y6d+TpUpRK
         esJ2P9VLJlyQ/NjEZnSlm6tSJSmXVVBUloia8zUxoLtVwRY2XWxQFyOgb/T390PK6Vnv
         wMOItdz4Wi0WFCgXFgN/fyEQ3VL7AKit7YLMSBGWig49idwfs5L30A19L5nZ/X+AJX5h
         bnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698249773; x=1698854573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynL7zdGAC20mTB5OyW7aNoAjUj+6tC+J1p/mu7GHXZY=;
        b=nNd/1Y/mkJvuvMjQ+HXcRzjTYNGSr3gVzS5/S5puM8ZRl/H/JUPFsNSMlrJ/vl3yg3
         QAapBd7xHwvHMPAR9tZXGF2ndi3r1qQNCopumKQ0ybLXgSQ8fysIezSlq8BwRXg42xK9
         /gQNECJtxRL2Qc0P8ow8bfjT07ZRsX3xpsIGvMs8yIQNu2H5zZaNC/gR+y/pj64pVehP
         upgbrLnRc69Y6VlnzIi5MerEJ5khKd3AfIT4/768gTYO95VlTycu0gF3IlSVND/Oyad0
         byGNR9JF5adS2gvw+Z88MX6byirkh9uK0IO2fxtdRgf5m+1Qi8io+Wpysb9Jf1mM22Ot
         I0vg==
X-Gm-Message-State: AOJu0YykmU+eKVkNsx4ntLbM0FACsxyz+OW/NtCmyNqFtfykCP6uwnB4
	CjA8sjwocf8recoYKx02wX+EQzxeN/iILxnt6CExyA==
X-Google-Smtp-Source: AGHT+IF48RbSPb88l3P+Ntzfiilfu28U337zWPkIyJ0dODVpZ6dKTrACpGegoKmDky1Dyfqhb2NFrw==
X-Received: by 2002:ac2:4312:0:b0:507:ab6b:31ef with SMTP id l18-20020ac24312000000b00507ab6b31efmr8279921lfh.41.1698249773296;
        Wed, 25 Oct 2023 09:02:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4585000000b0032d8034724esm12382786wrq.94.2023.10.25.09.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 09:02:53 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [OE-core][RESEND][PATCH 1/2] oeqa/selftest/devtool: abort if a local workspace already exist
Date: Wed, 25 Oct 2023 18:02:44 +0200
Message-ID: <20231025160245.2446263-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 16:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189689

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
2.42.0


