Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AB9CD1288
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 01:39:13 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.20.1725068346722546450
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 18:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=g6B5E08w;
 spf=pass (domain: baylibre.com, ip: 209.85.128.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6b4412fac76so21033197b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 18:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725068346; x=1725673146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zmQHo3UBBJ1xADCrfUOh8Vrw3oIv6+oTlLtlIkR+IJM=;
        b=g6B5E08wCFIcwZQDQtilSo7/cnv+Mb0u6JkyymvuodquethrOfkEtTFgTUwgontFN/
         30tPzKsCL28Fcn6PzzRPSu/Fe1oPBxqxGpDTZG6AWkARr2KrbVxAkjeMPvs8KlMQAfm4
         9zyyRZz2A89lJosX4h16e4RiN7WLZWr+2salNxMUO1wdS28ULwat6uYOm2w7G012JPk0
         /BNgSlJdFtEZXuLeVIzx7dKOg+SiPb8vg6eZ3XUPbeCYSeS9MU6x9ns3kylvYN48/djo
         WuJaaqzlQa6lzC5BQX/U7zHxeUtqrUWEyF9csPX0d529iPvNLHWv6fnw7WCArvhKBJg3
         JaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725068346; x=1725673146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmQHo3UBBJ1xADCrfUOh8Vrw3oIv6+oTlLtlIkR+IJM=;
        b=bIoYviHNyLNs0nG1UvjDzv8DMGJuwrRPTTTOvA/sRClfISe04w1bHFhtJYc0PjZpT7
         710Ko81z3LO//SkPRODfTb52Er+9g6koRrZngWjKygLSWUMmk2/W9UstD5WjD0TGvah0
         MjeTBLsRYu1FRbYn5ZdHdAYIZBI5wuTXdYsMejwLK+ymU6tWswG5hqN1hSJFvxL38wK/
         PEevwlhHutki7vuYG7FwElSEPmZwaVaREELw0cy2X/0l2kKLsb1RA1ge/ZbhQfecfBx9
         7DQb3QaAJaqQlwmU5tcu0uxkzNE0f2XxCdxVh8KQ+/gY4z7dSNEB+zju8FkLyajdxQXY
         dCjw==
X-Gm-Message-State: AOJu0Yxv8h0SFmeaFtnE6IQPPjU4qJGbZ55rgZjGnWWW5TDepCjku/Wt
	McyHzbgqx//gNHXj9JOZLNy7XE6lTXHBCiP8gxWw/O275YPMipuoyMYUbWV6XnubYn90Ip+duX7
	COEo=
X-Google-Smtp-Source: AGHT+IEtqPxCdqQuULozcMKWPYPaWiwNimgi6SuL/SXEBYAR1XIRFEYdU5SWN3eYmUyC+Wf0f3vHmg==
X-Received: by 2002:a05:690c:386:b0:64a:e7ec:f3d with SMTP id 00721157ae682-6d40e585c71mr43684337b3.18.1725068345356;
        Fri, 30 Aug 2024 18:39:05 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d3ed6bsm200834785a.73.2024.08.30.18.39.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 18:39:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] patchtest: test_mbox: remove duplicate regex definition
Date: Fri, 30 Aug 2024 21:39:02 -0400
Message-Id: <20240831013903.3213564-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Aug 2024 01:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203971

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_mbox.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index 0b623b7d17b..ae16c4bf934 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -31,7 +31,6 @@ class TestMbox(base.Base):
 
     rexp_detect = pyparsing.Regex('\[\s?YOCTO.*\]')
     rexp_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
-    revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
     signoff_prog = parse_signed_off_by.signed_off_by
     revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
     maxlength = 90
-- 
2.39.2


