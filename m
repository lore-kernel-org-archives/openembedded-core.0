Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C47EC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 12:31:46 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.7168.1658493098025166569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 05:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O6miEm27;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id id17so2708348wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=044YdHDdDByhBSLJbRPXWl0Rjfdxao+Pg/kG1hzQHaA=;
        b=O6miEm27oREhV1WkD/sxi6jfPo9F0ihI+vEEqVy599n9U/nchcPKK9hTFdDsbD5Hf9
         ezPSekqHRSnxHpuztyPgChv1MWgNSjqRd8Vrcp5xTVy2ZbVK5NVvjzNRY0mkAFSezyYA
         GLR2+GjWcoMZn1xHiEnoKl5Kq0V/8hhC4XBH2TwTFK/aSJ8YsneednX1Qa1q4vQ9eCkS
         /ef9J4LLpNJOzMkt1xHj6NZq4UcbbkzOF2gLc6r/qctwU0WRycrzlRLHO35QRwjKJNan
         Xp/7M8xdwWYGQ5ZGWWyim4lLzqhHug/Ws9JLl8QwCXKHu3IibYDuo4kp8OK9iVbIJpQJ
         tpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=044YdHDdDByhBSLJbRPXWl0Rjfdxao+Pg/kG1hzQHaA=;
        b=ub4TV5+8boUnS/dvrBDNCNGJFQPOTjVGI7x24zDoouaO1rYGbJe9WVHNd5KliFDZt+
         kKGEzSo7xBElOS9Pyg3CTK+KxCENQ8Uov2rXyR9dXDRiNJffbi63l9ylbcMOpHM46FXW
         llTJA9tcvfBA3vIq+v1jV2SqaV4/9SeuUvcEks04bk1nFWBxzW7YepgW9PnkS7SpO969
         vqzA4+K7NWCor7o/P/NFeEp1bRdij/y99ae/eB167aUgCC2E0jabWOpDAnLZ/ZF5edL8
         H3vjvVcupXZK2SEfH012dNKuJ6SRZYuPrbtKVKD2rAkW4Bz691k1mkX3X2fQHMAx+7Cd
         LXJQ==
X-Gm-Message-State: AJIora+teVHR3QjMSeBYmDtxIBoY6V5xiPD4xwaS1OGpyl2hMiKRXg3G
	cjrWm9qUYn+fvjnmvz8j9PX8ZOPNQ49q7w==
X-Google-Smtp-Source: 
 AGRyM1um603ddppEm1PIUEmPcmnU1FK/hoie5CHaqkKrz2kTDcgVmSMQFFpLLLRu93d/QNpgthZJ4Q==
X-Received: by 2002:a05:600c:211:b0:3a3:194d:7282 with SMTP id
 17-20020a05600c021100b003a3194d7282mr326249wmi.132.1658493096148;
        Fri, 22 Jul 2022 05:31:36 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 q6-20020a1cf306000000b0039c5ab7167dsm8404001wmq.48.2022.07.22.05.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 05:31:35 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/3] archiver.bbclass: avoid kernel rebuilds caused
 by the do_unpack_and_patch
Date: Fri, 22 Jul 2022 13:31:23 +0100
Message-Id: <20220722123124.390710-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722123124.390710-1-jose.quaresma@foundries.io>
References: <20220722123124.390710-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 12:31:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168405

The commit b8c5680 [1] add the funcion is_work_shared and at the same
time change from kernel-yocto.bbclass to a more generic kernel.bbclass.

This is also a fixup for the commit fed0ed8 [2] to avoid kernel rebuilds
because of the do_kernel_configme->do_unpack_and_patch task dependency.

[1] https://git.openembedded.org/openembedded-core/commit/?id=b8c5680a67888d43540366a40bd0c501e926ac31
[2] https://git.openembedded.org/openembedded-core/commit/?id=fed0ed82928e6a7846fbad233ac657bd17bcefc7

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 5da369d422..9c605cc932 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -610,6 +610,6 @@ python () {
     # sstatesig.py:sstate_rundepfilter has special support that excludes this dependency
     # so that do_kernel_configme does not need to run again when do_unpack_and_patch
     # gets added or removed (by adding or removing archiver.bbclass).
-    if bb.data.inherits_class('kernel-yocto', d):
+    if bb.data.inherits_class('kernel', d):
         bb.build.addtask('do_kernel_configme', 'do_configure', 'do_unpack_and_patch', d)
 }
-- 
2.37.1


