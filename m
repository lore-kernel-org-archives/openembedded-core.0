Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CA8E784AC
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 12:19:51 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.80195.1696249188817653448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 05:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=G0RToTUr;
 spf=pass (domain: thaumatec.com, ip: 209.85.167.46, mailfrom: dse@thaumatec.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50307759b65so25173416e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 05:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1696249187; x=1696853987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=arHeUtVWwxDIWETG5QlwH5YPckBijnA/Ab+v96FjjN8=;
        b=G0RToTUr+bMi5dY4UUDX0uAlHxVT+RUFKG3Eg6rNIAaMuvhNzUnRjse4BI08IWzVTA
         1RsxofMo/7czmiw6YkNhbbMBDueuYCLLak/WnWd8keEuvfz1LNnXzyIwYX52zs/64pzX
         WLZaPQu0J7v7ufWuhFhevO1iw1pkPaLqQLvBjAhHzov6CQ7/psC11pyrobk2CDL81QcX
         cUYMMga1ELxxTJaNEcbWvZEcvMgzp896+hcnLwRYV3ZAlVGDiTcTqWBe1puQKPFNNZMD
         /kEZHY7DyKxiktKStO4+zwZ+2FOYQhMhKDDX3+slHIMSRN4h5fk/qCQA9uuiSK7Z07lb
         Bvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696249187; x=1696853987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arHeUtVWwxDIWETG5QlwH5YPckBijnA/Ab+v96FjjN8=;
        b=f26VfHOZ7DzkTcnoJLPjZZHYgdGQwcCPgtQk1wDtA67x7rdLHcJey41zhpHY2WIzLJ
         Yaj+TaD5Apm/UVHkK+w8zIvQ+8NsKxPkW8p1F9/08jtWaVotN8T8A2rKKu2RWWnPkeDS
         0cSzOJzzwH33lYD1Vwx50HKzAe+0iaFsXvWrFbP8FqoHPidusvDmUe17cyVOEVOrCVrI
         FJutmY65UQLDw9dOqfzoNR/fs2rQ+PH2810WsSKX/w5adDhNf7BJm5jVyTJYQ8FuY8f8
         xSSw32ChwOG3DUy/D4ZSXLyH5fQW50X9V+7nBT9ElaB8lre2xlM77zdbUvTvgihIXy74
         A3/A==
X-Gm-Message-State: AOJu0YzoI/Ic8qDQ+2OvB1cdCHQ1aSe0K8kz6+efP0jmzM+7UraL/WVK
	eYTFb23OLX+K6CuDQEqwYvOdqOiP3L8Fqq0VE9c=
X-Google-Smtp-Source: AGHT+IEZ4u3hkWQ7Sp/jpt0Wob7eYf1ZdnmMwaX/w1wCeM7RfmiKNMm4KalhkCZypkw/tk6xzqouLQ==
X-Received: by 2002:a05:6512:34c3:b0:500:bfcb:1bf9 with SMTP id w3-20020a05651234c300b00500bfcb1bf9mr8182214lfr.67.1696249186646;
        Mon, 02 Oct 2023 05:19:46 -0700 (PDT)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id q26-20020ac2511a000000b00500a14a6659sm4738930lfb.51.2023.10.02.05.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 05:19:46 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [PATCH] wic: bootimg-partition: Allow root placeholder in custom config
Date: Mon,  2 Oct 2023 14:19:22 +0200
Message-ID: <20231002121936.133895-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 12:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188603

Allow using `<<uuid-of-rootfs>>` placeholder in the custom configuration
file. This placeholder is then replaced with the actual UUID of the
root partition, generated during do_image_wic().

This allows making use of dynamically generated partition UUID instead
of hard-coding it in the WKS file.

For consistency, the same root device placeholder tag was used
as in the `fs-uuid.bbclass`.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 scripts/lib/wic/engine.py                           | 10 ++++++++++
 scripts/lib/wic/plugins/source/bootimg-partition.py |  4 ++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 674ccfc244..c68e5adacb 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -626,3 +626,13 @@ def get_custom_config(boot_file):
         with open(cfg_file, "r") as f:
             config = f.read()
         return config
+
+def configure_custom_config(config, creator):
+    """
+    Replace placeholders in the configuration file with the actual values.
+    Does nothing if no placeholder is found.
+    """
+    rootdev_placeholder = '<<uuid-of-rootfs>>'
+    if rootdev_placeholder in config:
+        config = config.replace(rootdev_placeholder, creator.rootdev)
+    return config
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 58f6da72c3..969f99476b 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -19,7 +19,7 @@ import re
 from glob import glob
 
 from wic import WicError
-from wic.engine import get_custom_config
+from wic.engine import get_custom_config, configure_custom_config
 from wic.pluginbase import SourcePlugin
 from wic.misc import exec_cmd, get_bitbake_var
 
@@ -110,7 +110,7 @@ class BootimgPartitionPlugin(SourcePlugin):
             custom_cfg = get_custom_config(configfile)
             if custom_cfg:
                 # Use a custom configuration for extlinux.conf
-                extlinux_conf = custom_cfg
+                extlinux_conf = configure_custom_config(custom_cfg, cr)
                 logger.debug("Using custom configuration file "
                              "%s for extlinux.conf", configfile)
             else:
-- 
2.41.0



