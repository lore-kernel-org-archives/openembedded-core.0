Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2574FE674BD
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 09:16:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.33462.1730452567244323993
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 02:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y8qelINz;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d518f9abcso1228447f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 02:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730452566; x=1731057366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EtfiGCfPaz14YNEou5r0LKRb9DrvIUuyXT46FWWqVZ8=;
        b=Y8qelINzEV6q+HTy0vBt0+tkplYxAB9YGa/ZdzzRGYSpvmdSWwYJZFfZQU8/nUVeqX
         vS5E6gLwB9sjSqyHZZCHu7v50eaPjjykpo9KSCfiitKTlHZ/twT49fNNVx1/hyfHE3b1
         3V8KXX5j76wqj6Jiv95VQmv/u3mtdvyyYTld4I3ooMvCKOIBrjrCg2QF90VGKZXEKAo/
         +gYjbgSWSAcGHdKFTuHWpSUfw5s5p+4XpKN2zkLsGEanrC6OCzqFcckjkeAKXUdyUIKa
         ngvsYy27KS8UHgBJ7A22GPq9PEd4aX4jbeq43NrrPoztAL5fSlnxHi0SiwAJOdH4A/0x
         FLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730452566; x=1731057366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtfiGCfPaz14YNEou5r0LKRb9DrvIUuyXT46FWWqVZ8=;
        b=CuWAVjY5h4hFmulTY6xlIaBMGLPXXawIm/B+V6RQD23DVzmbCMvgiBnxjN18kUlhS+
         2hgukKTU9il6V+exwQko85ZMV8DtWY0pvJG7vJr8PIEfFyxmsjWSzwPTjriwNJL4M+2g
         5ax5z/UxoI8iWqc2ArbPWwWElZVN/xNHBS2Tsnd9A3YFR7j9b6dkjWYhYZUlmahmrr5w
         9/Hv6Mx2JSqqjSjPJoZBQS7Po/d+mXGPzATQUoMtPuOU0YYtCzluMaTG1iMPvtb2ZOFO
         DwrBWVcvcLBJaMaN699S6XPQRVOLEcwjzRijBrbKrljOe9n5PgNTRDfSOiRAQShX3/yU
         Q7kg==
X-Gm-Message-State: AOJu0Ywu9D6cQdDdaHcCfBM5LU+QjhwZAcXl2qhBXH+NeSt7yxw1qyUV
	qLFlC7lecsfylXr+SGQdJUnwlxhMICSdwVPV2dBCrfn3ssvjLpdU0Sluxw==
X-Google-Smtp-Source: AGHT+IGRmMKUpXmQz62kHW04YiXcbrbI3doPiiT8/A3H/rO5irLJU/obgoktgHC44RqBp8iKwXZO7Q==
X-Received: by 2002:adf:e304:0:b0:37d:3a2d:8577 with SMTP id ffacd0b85a97d-3806115a2e6mr16497400f8f.33.1730452565387;
        Fri, 01 Nov 2024 02:16:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1188569sm4402893f8f.113.2024.11.01.02.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:16:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] oeqa/runCmd: print stderr when that is a separate stream
Date: Fri,  1 Nov 2024 10:15:53 +0100
Message-Id: <20241101091553.2872509-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 09:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206610

From: Alexander Kanavin <alex@linutronix.de>

runCmd by default merges stderr into stdout, and only
needs to print stdout when errors occur. When stderr
is requested as a separate stream, and an error occurs,
stderr is discarded, obscuring useful error messages.
This changes the output to include both streams.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/utils/commands.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index ca22d69f291..2a47f90e327 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -203,6 +203,8 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True, sync=T
 
     if result.status and not ignore_status:
         exc_output = result.output
+        if result.error:
+            exc_output = exc_output + result.error
         if limit_exc_output > 0:
             split = result.output.splitlines()
             if len(split) > limit_exc_output:
-- 
2.39.5


