Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C525DC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 14:18:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.19257.1698157083789006543
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 07:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=syMjbQDR;
 spf=pass (domain: baylibre.com, ip: 209.85.128.54, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40838915cecso37588905e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 07:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698157082; x=1698761882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lnePxctiV1ZPFgTFr5gLqjn1dgbMhjupXCKALuYMwY=;
        b=syMjbQDRKDhRY0rAYPhep3I7zwgJ6Hxa2rgQlNLcMA/0BDg5aI4F1VY9L19nOieAr3
         L8W6frRcRnAIuLSpyk8iAW0kK5vqNr0Gv4Bxd62fKiJtDWC4roA81eVN691ti9zHffEz
         gVMohuMLURszJEW9DV1Y9O6WOarB54YeNTjxZ61iZ+0XdsNHlUJvoUf6vRwSl6cWwDTK
         NJdWkTPHzslFv6T63nAp1aM0jutNmCF4ShPQrUvm8Hc3SrtI76AYnsAxE7WqCl8crbGP
         gA0WXYw6u1XAGryurJIlaUROcWUU9SVbMTd2EmZxfWdDWtPGn7Mvk72wCT8V4nWqF85+
         JNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698157082; x=1698761882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lnePxctiV1ZPFgTFr5gLqjn1dgbMhjupXCKALuYMwY=;
        b=FsGKz9iMwEidGdai5HRrlYnAX41KvVWI5sDZOM+TjM9hFzK9Lki+VDMD/IS4Yv1XBX
         6OzLV83rxVXuF9dmaHx+GYmsEs4s4HjKXEbpyirwHe+X2UU7ykA+3iaeiWdRDqa6B/VF
         tijQzcyNUHQr+gV62gw0lUjiXBSl+/Kj/qFDXnNCExPxX12ii2Lx4yKS/A6UHiMcXgKj
         yJCjtJhUU5joKIb7pPuBrfdaEg5mnFEs3UYoTCQZSVExt+lh27rGHuAsIJly7/Taq0FB
         lFNm3BjvafbzBQZ98tycI7HnAkS2qlIhuYAQCS8y9N+vK0pllDZQEKyYkfdu+jNgy3WH
         xCLg==
X-Gm-Message-State: AOJu0YyANLnaV5Lrwo45feQCOJ7MB/ffoHLueY7kn24mHZo6B2r8u6xo
	WzDtYcZcP+uL0qAYMihPg0mZzK0B7fbJsjIlBceA/Q==
X-Google-Smtp-Source: AGHT+IGYer1+D1kgUTbgVzGb0YvNd2v/3aO3+pNj56q7MBKAIinIw0iNwyzH3P3dbpTqEhx6Nyautg==
X-Received: by 2002:a05:600c:474b:b0:408:53d4:52dd with SMTP id w11-20020a05600c474b00b0040853d452ddmr9261854wmo.22.1698157081956;
        Tue, 24 Oct 2023 07:18:01 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id m16-20020a7bca50000000b00405d9a950a2sm16646736wml.28.2023.10.24.07.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 07:18:01 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RESEND PATCH 1/2] oeqa/selftest/devtool: abort if a local workspace already exist
Date: Tue, 24 Oct 2023 16:17:53 +0200
Message-ID: <20231024141754.1528786-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 14:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189646

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

