Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF3310706ED
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 16:01:14 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17854.1773849668913813209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 09:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hY89LdfK;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b48ac2727so2182117f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773849667; x=1774454467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Aqsw8i0nCdq4vM1fiPCbgovNgsP/hW7mJiTTq1GHB94=;
        b=hY89LdfKCxs3wRG6lwxyEXynFXdfPg5qFlz8d818Vn3k1eF/P3TWV5zYE1DVdeVMg0
         eaxh137MheG7d6ZVfuf5IJeYraT+lJYCpJgivkbmagDN3laVNFIxiEIFNUBx+kjBW88P
         nCZoxK7WKXZ0YR0TlekSysoFRDTwmJTDP8Q/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849667; x=1774454467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aqsw8i0nCdq4vM1fiPCbgovNgsP/hW7mJiTTq1GHB94=;
        b=ODimgB9sGMcF3J9Lf+v6tgrnBNyzakJD8PIbsbjienp3oaPhEo3VOERtHouWoPjH9K
         eP4/L+GRVB6k94IctSCHy2hxzelcMWKo3xaS99RbLxxKoZe7qFqj+uBqm3qYEKta2Za3
         0fuxwF+BqV3W9DjqsxVqncHUT4hUlaywOZ5JVqyU2n+5ttE/YjGWRMTIALYXiAdeNzqA
         NPa9MXo9S20It07jqragUngcQFfcn+uxMxxmhf/rfV9bJ66p8b6HDmpbe9in7cCsgwr8
         wmV8g95Fan1myTl49LhIvvpzLo+lGH1RLldmRkRlHjaenKXtfnyttNmeVk3RiKWxfj4j
         Y55w==
X-Gm-Message-State: AOJu0Yw/oEDpHOEK7Vq/bp82tKUcKu26NdNZMWU3oOQEDZaIlo/ttStR
	qXIPWNk0WBQFnS3OONIdRVgFLd4KZwJaCi0xBTitWLLtbqW47mYuFVs9rf+HMpP5fpXJ79kMCXf
	/YqRsVEM=
X-Gm-Gg: ATEYQzxxf+z5sd30TkaL6PCVKkTIVb++0u0Qe0cDUDliW980rjOCDEICO9E6d2/7jLf
	AasFJ/y3y1kHJq4l56wcuNFfiD9d7ITlIZ1ual+ZwPqOoDjnnVakGOQkAIqhsyXzbS6bIQzpUrF
	CMUnZP4IAKd+juwvpWkGh/tMWAtydWE0Q6aiwOVWHWmPraMFLscQIRm2FAeWE+5e2CZUy/fQDEl
	keZEqU3QvjT9tB8Y1DNQdynYUSLasZm3NmY7f57/IBrHU2s8MQMP7JDZ8Ga4y5N+ZwtYR4UDZrk
	qYKm+FZF3IP1/u8x5MAvvlSp63KHHaoT+PGEeDH83XCe+JRz6dOpst2Hp3FvfVHx1VBHO+7kAro
	VFhg+ztdr+CQzPg9DnkN/w2h+MKp07smHLs6IiOQ6aYr/saDMXL8LnaK5mfTI5udi6+UZ1nRThG
	+621NXz4QppudXOMuughULAEjaVkiCZzhDE26kG9ga7WQB1zDyaAeWdKJzMB6byw+BJY/8+Yd7V
	vbAZbbZRcGgsgkmPcO38yX+AKTUvBp0
X-Received: by 2002:a05:6000:40de:b0:439:b539:787 with SMTP id ffacd0b85a97d-43b527cb618mr6653702f8f.53.1773849667117;
        Wed, 18 Mar 2026 09:01:07 -0700 (PDT)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm9155984f8f.0.2026.03.18.09.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:01:06 -0700 (PDT)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH] oeqa/qemurunner: make the error message about invalid rootfs clearer
Date: Wed, 18 Mar 2026 17:00:58 +0100
Message-ID: <20260318160058.1912091-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 16:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233410

Printing "Invalid rootfs" when the rootfs image simply doesn't exist can
be misleading to the user. Print a clearer message to help users understand
the issue.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 1ceeeff96a..5979b52650 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -150,7 +150,7 @@ class QemuRunner:
             # interact badly with screensavers.
             env["QEMU_DONT_GRAB"] = "1"
         if not os.path.exists(self.rootfs):
-            self.logger.error("Invalid rootfs %s" % self.rootfs)
+            self.logger.error("rootfs %s does not exist" % self.rootfs)
             return False
         if not os.path.exists(self.tmpdir):
             self.logger.error("Invalid TMPDIR path %s" % self.tmpdir)
-- 
2.51.0


