Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB26BE743F7
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 08:28:45 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.13007.1695976116058267844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 01:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=SGHlNcUz;
 spf=pass (domain: thaumatec.com, ip: 209.85.167.52, mailfrom: dse@thaumatec.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5046bf37ec1so12646373e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 01:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1695976114; x=1696580914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ/s45LOOqvwN+tgOInzVQP5xeJAanvn146pCkkZ8CE=;
        b=SGHlNcUzk9fbp0bK/uks5iuDV83SCEW776n9Lv51VfTayN1rNwtsSdO9p5Ud/Auc8r
         lG6cnaSWX1MwaEIG38QtpoYU0g8CmrVPrPTz3ucJb+364SJk6JiHeJWKaHi2kMzVxV5F
         sIj9AVwFNx/Ba3/7vfuQi1I/FuGex4oDq2PZQM79m2wg//nEANQgB9y0AjmIbvuswIgw
         4mqmuli9ZEPo7nriGbgVs5yIr3CFQm+AjNWZpLdvIVyvbj8ZoKQgw5kvdaQq0DMLC2bY
         4Z+4J4ET21w5EpVJbN9jR5W6oLT0Uwh0eBW1WMA5EB/SU65s/JRhB13rsrwTCc7v/fav
         8ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695976114; x=1696580914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ/s45LOOqvwN+tgOInzVQP5xeJAanvn146pCkkZ8CE=;
        b=n5YC1l3H6CNePBYYzMyUdoajsFvZhEZxCHR7RXG5vhxhIzx3KFP7xKHYMF8zzJoHYb
         X631Zyxb7cWM60FPrdkPJGIjDRnyPC4CSXL55lcKvWQkPexK/72ogDSBl1l6K90Fn5l9
         biPqlaTMFO3VzNpOe9KvHiOP8EbEg+rdCWASRMAvCYK8EYO7Tsujhvgc8SRJ1vFhxxKv
         fCC9NdIF758bWQHrmG2U/DaPrOEIQgI3gFDH5v4DMFPDq1v5YNfdLwTgPXgBK0Dc0VTo
         Kdc44tf6WnOc/95dZs8oE41LAlN3Sa3RyXRIfvpo3qbufXXIhha0Ltyx8zlT+cPILWV8
         SV2w==
X-Gm-Message-State: AOJu0YxqDMf2UeEhOQINwZ5JB/gOnR7XwwNeFExnKQYcj7fgS2Lf97TW
	p6suVE9oZu5U9/zQr+AjeEdpEXsafSLO8DdVlD4GMw==
X-Google-Smtp-Source: AGHT+IGCd3/F/6rKE8osm9UVGudYUHjVdwBOAGt+raJSgBpi8EpvYYK+nTBwBWZUddiyyU0hkxDLWg==
X-Received: by 2002:a19:770c:0:b0:503:1aae:eca0 with SMTP id s12-20020a19770c000000b005031aaeeca0mr2963016lfc.44.1695976114022;
        Fri, 29 Sep 2023 01:28:34 -0700 (PDT)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id p23-20020ac246d7000000b0050335c6d091sm597216lfo.79.2023.09.29.01.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:28:33 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [PATCH] wic: bootimg-partition: Fix file name in debug message
Date: Fri, 29 Sep 2023 10:27:54 +0200
Message-ID: <20230929082819.29653-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 08:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188395

Debug message about using custom configuration file includes file name
with incorrect extension. Correct file name to "extlinux.conf".

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 8956162205..58f6da72c3 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -112,7 +112,7 @@ class BootimgPartitionPlugin(SourcePlugin):
                 # Use a custom configuration for extlinux.conf
                 extlinux_conf = custom_cfg
                 logger.debug("Using custom configuration file "
-                             "%s for extlinux.cfg", configfile)
+                             "%s for extlinux.conf", configfile)
             else:
                 raise WicError("configfile is specified but failed to "
                                "get it from %s." % configfile)
-- 
2.41.0



