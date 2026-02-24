Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EB6F357DA
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21694.1771943595840889927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=y8buO5Fw;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso47690245e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943594; x=1772548394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BhoUsFliQYrCLzo2FhEnZnZ6m+T605BKF0nfQOd32Q=;
        b=y8buO5Fwohj/6UbuyWy9w9O2F1XufA9dvCvCyMp4mlMA8BnX7YESQ7rFxdAZo8YbMs
         59ZjjPYohC2tSfpeVmf2GcAwVNxrQ2HGXZ2Xubk8menKxFX5fKnbKVEYf/LB21YqlcQy
         a2btkTpetumsbcdwF8CA+BoKs8VeRwzBoAkVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943594; x=1772548394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7BhoUsFliQYrCLzo2FhEnZnZ6m+T605BKF0nfQOd32Q=;
        b=Pd59Z3ySDj3dqpTJ5G8njbAJZlDtzjPrlRrhLLo5+1jvQTvipmNb2TyrTZMVjNrHsA
         GqQ5++mFA1cZgkDNR8tNUu2VZ3Vn/HWLY23ezoxfTvKAoGdA1DkVK+TqfUPR+rNwQ/Pi
         ADyL85h1aL2VbPiwKuxn2/aYPqGgANqJfKhuX3VWsNuuDPqbrdducKPh6TImbFyvqpQW
         B32c29/MhYH6NXAAS4smXYdIuJ4zbF9wr1m+V97lvSOiXJvNqBJ6B2gbmbGKmMOrgt4M
         Dnui93PZCb5zB4WLc12n14QhUimDODO/Xg/68SGllAhkYkLnJzlqTKcffGxp8RvZkiFV
         Xvlw==
X-Gm-Message-State: AOJu0Yyo+/OnHRYR6IegzjBeriACE7qD6bbRL4FCCLyH0q4niHrZyZ7M
	WhBlz64FeNpTIvJTGbtt5hj9YjqK3yTzTXNGaT1N9wexqSh421LoygTKRRS6T9oy6fCYCmwCVOr
	waCQ7
X-Gm-Gg: AZuq6aKm0MtAiU9WNO6fJ+5w1NVorlBIjB3ITLXJqFB8G0xl1JjXbNoFN23IP6ailh6
	XxvTLW9v43Obgr/W3tIz5rWIymGAFvagps8Xa6ISbAAc54IV1ILodkUutMifhrS+q4tP7diVUdB
	kzR2VZgHEtuoZoB4pIiUQaCCXE5G5jW8t+EFrph7tEDQII5tOXdwHG6oglsouW0kAw/isy1VEo0
	uLkZYCBexu52W0uWaxEpa8IO5ggXmkBsq72sEgtXxX9Ra6P/SJyBmKVIotyTjM6vF0hmi1O1MSB
	KkRi+Vv4z+k77tj0TfDLMOmsP7WmbEkpfcPQEX1IeSrEymQ0YXGoWJUWh2EaHNwBE3xuh3bsbsy
	BQ37j7d7VYF72Ek8CKX1SIJyY23mg3Y8pe9tSR8K9uX5Mc7hrXMYn6gIswUYcKAorqHDfyfCDYI
	OjheQzgR+eS/P8Xxax+vWpb2lg3pM5jpk7LhrTgXgrwEwC38O8qg6c6MYitVP5ueutJtBTR7mAt
	7RFSUFb7JmRkEUmlosXWb5aHjWfgP9CrQ==
X-Received: by 2002:a05:600c:3516:b0:483:7783:5373 with SMTP id 5b1f17b1804b1-483a963588bmr189718395e9.23.1771943593839;
        Tue, 24 Feb 2026 06:33:13 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:13 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 35/44] wic/engine: error on old host debugfs for standalone directory copy
Date: Tue, 24 Feb 2026 15:32:03 +0100
Message-ID: <45b7d8a8211775000647cfc3ed698e5ad015ab11.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231842

From: Daniel Dragomir <daniel.dragomir@windriver.com>

When wic is used in standalone mode, it relies on host tools such as
debugfs. For directory host->image copies into ext* partitions, wic
uses scripted debugfs "-f" input with multiple mkdir/write commands.

Older host debugfs versions (< 1.46.5) may behave unreliably in this
mode and can silently miss files. This does not affect builds using
debugfs from OE where the version is known to be sufficiently new.

Add a debugfs version check and emit an error when an older host
debugfs is detected. The error is shown once per run and halts execution.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb536737bee95d5a5072b501bda9554705e8cd13)
[YC: removed patch changelog]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/wic/engine.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 565a0db38a6..8ca8ed0dbd4 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -220,6 +220,34 @@ def wic_list(args, scripts_path):
 
     return False
 
+_DEBUGFS_VERSION = None
+
+def debugfs_version_check(debugfs_path, min_ver=(1, 46, 5)):
+    global _DEBUGFS_VERSION
+
+    if _DEBUGFS_VERSION is None:
+        out = ""
+        for flag in ("-V", "-v"):
+            try:
+                out = exec_cmd(f"{debugfs_path} {flag}")
+                break
+            except Exception:
+                continue
+
+        import re
+        m = re.search(r"(\d+)\.(\d+)\.(\d+)", out or "")
+        _DEBUGFS_VERSION = tuple(map(int, m.groups())) if m else None
+
+    ver = _DEBUGFS_VERSION
+
+    if ver is not None and ver < min_ver:
+        raise WicError(
+            "Sorry, debugfs 1.46.5 or later is required for this script. "
+            "Older versions of debugfs can make directory copies into ext* partitions "
+            "via scripted debugfs (-f) unreliable or broken. Detected version: %s"
+            % (".".join(map(str, ver)) if ver else "unknown")
+        )
+
 
 class Disk:
     def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext')):
@@ -334,6 +362,7 @@ class Disk:
         if self.partitions[pnum].fstype.startswith('ext'):
             if isinstance(src, str): # host to image case
                 if os.path.isdir(src):
+                    debugfs_version_check(self.debugfs)
                     base = os.path.abspath(src)
                     base_parent = os.path.dirname(base)
                     cmds = []

