Return-Path: <vivien.didelot@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016CFC433EF
	for <webhook@archiver.kernel.org>; Sun, 30 Jan 2022 19:26:53 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web09.22805.1643570811976080297
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 30 Jan 2022 11:26:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bKHHbRI0;
 spf=pass (domain: gmail.com, ip: 209.85.219.47,
 mailfrom: vivien.didelot@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id i19so10836141qvx.12
        for <Openembedded-core@lists.openembedded.org>;
 Sun, 30 Jan 2022 11:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X+t2ApzOG/oGCjoccYyT8ae6Lewm2bhUpojleO4WqV8=;
        b=bKHHbRI0t4qRS9e7fO5g0RTdE5KTUGDou5ShJ9ZCPv9lw8Dz1vtv1Z447EMri3VcMC
         fWgFbLgxHa/TF0pxonJTRYbsJo4jr1dm3wRmwhVqi30MMUkiOH1EOkVBISBSZmE/+M9g
         1/MapQ8KR01I84WSqaixuR28i+byrFnKUJ8Kmr+6A9PgS1xQ748wOSJ6Jgn7k3a08w76
         PaXUj+5nsSkWffvaaqf006j8KUKCQKnNu2eDx16PYEtYxR0ggi2+tptWIQpKqYnW3ihq
         XI5iTKAvCq49qbxH7aFRX8MsNIjCOjKyk7844ES80RdlZWMNNXMcfkVWcvb25yqAuxiA
         LA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X+t2ApzOG/oGCjoccYyT8ae6Lewm2bhUpojleO4WqV8=;
        b=HUHhXZd//fWw+CInLGRHXf/PEA4cA0gCqHXgLnG6TwW+vb5Qf35Qlw1e/tN5JVDPl5
         XAZNtYzIXyPLsKU1gYqpwjwjsS+l4AXLLFYhxuo9Fen26DJ/Ukz9rCEKIb3dcTjAODbU
         pWQ5THy5jl5VvGYo4GBxgR3A4rm3LB/URwqqJjiUH0XM+KKtflCZ4ozlQO+tiqEH72jJ
         kSLUowStS6nrPbnd5Oowm1qEtI1NKqiTD01OFhx4f7rvtrDeg9xM4u8JQPR6kfLoAGdg
         XR7ezEek2AKU5bfecaQx378W3v8bKdogkzWRjEL0oFFRj/baR6EY9uxCzeScFCcKJYER
         xoyA==
X-Gm-Message-State: AOAM533MEa75pZHsg7UPWGIh+cL30Si7spnGr0KDxOiN1Ce9R7jO0Bdr
	DA+WyBqNVmQ1taw1a+Q5gIBHEfhCN9M=
X-Google-Smtp-Source: 
 ABdhPJwRBF2BKutnRl1UaS49oZAXUKCOwXOcMdBN6nSRu1LuK6nsSYA7t0BiC4CxcqTIUD29QUpWAg==
X-Received: by 2002:a05:6214:410d:: with SMTP id
 kc13mr15055486qvb.71.1643570811094;
        Sun, 30 Jan 2022 11:26:51 -0800 (PST)
Received: from localhost
 (bras-base-mtrlpq2848w-grc-41-70-53-240-211.dsl.bell.ca. [70.53.240.211])
        by smtp.gmail.com with ESMTPSA id
 bq41sm1867046qkb.9.2022.01.30.11.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 11:26:50 -0800 (PST)
From: Vivien Didelot <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vivien Didelot <vdidelot@pbsc.com>
Subject: [OE-Core][PATCH 1/2] wic: bootimg-partition: simplify
 BOOT_IMAGE_FILES logic
Date: Sun, 30 Jan 2022 09:25:26 -0500
Message-Id: <20220130142527.2960188-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jan 2022 19:26:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161114

bootimg-partition fills a partition for the files specified with the
IMAGE_BOOT_FILES variable, optionally suffixed with _label-<label>
or _uuid-<uuid>. Simplify the variables lookup to make this logic
clearer to read.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 5dbe2558d2..f22364766a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -48,13 +48,9 @@ class BootimgPartitionPlugin(SourcePlugin):
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
         boot_files = None
-        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), (None, None)):
-            if fmt:
-                var = fmt % id
-            else:
-                var = ""
-
-            boot_files = get_bitbake_var("IMAGE_BOOT_FILES" + var)
+        vars = ("IMAGE_BOOT_FILES_uuid-%s" % part.uuid, "IMAGE_BOOT_FILES_label-%s" % part.label, "IMAGE_BOOT_FILES")
+        for var in vars:
+            boot_files = get_bitbake_var(var)
             if boot_files is not None:
                 break
 
-- 
2.35.0


