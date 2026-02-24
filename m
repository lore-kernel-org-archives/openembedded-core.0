Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907A5F3C98B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:41:13 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21676.1771944071852805017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NH19cA72;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4376de3f128so3998460f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771944070; x=1772548870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uchGvVweXdNAenMW6YbHRnTOzewxS6PtcAvyGiTeKM=;
        b=NH19cA72QVU1SLiRSs2IcGdEVgclXHdctpS7EIEefnlWjr7NZ5D1zIGZgUKIDsmbal
         pR+pCAanuhDUky7TyGzzbuJ1BWvli2tau6IcZ68pShFl5Sk6112t9ZQeju39Bj0aIu8r
         MDP8u+FPyzTn8w+XcehFRpErf726/jvwYZYj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944070; x=1772548870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8uchGvVweXdNAenMW6YbHRnTOzewxS6PtcAvyGiTeKM=;
        b=MmDqJXQRRm3W6aQnd7veJ+0P9RvshdARlPM+NyrVnEqwD6rTiYd/t3E/CWKbne2xQm
         eh9o7UMHlmF6zhBhELF4IWXG1+NBKY9ZSqgSRQmV2ncm00/D1gJ4hRqi2l3vQbiPxx2X
         xz+b5OZALArLMGgA6mF1HxPXN42xjoOuywXGYga4744RnpLpOmKl5wyajl066G/4BJNY
         Yg+YFPh5JWTcFsiOB41BqpjijjdPbTwgZ/GN9ZSZDwJXtNibyyQFoXrLViAG1YS+Vbm9
         46Qr8TSyinJ7tCj+CzQhGQzcq58oNz8U0CuEEZ939b4HOofnjYaoMSaoi9NANjySHeuh
         9oZg==
X-Gm-Message-State: AOJu0YwSFznfBJnhWRxqWcSGNX541dw5R77+6QYvFNnh5PohRcP7qEot
	GJkjjeXCwZkU+qDKU4POr706JRM2Y/Rig6ucvuAfhjAiYRw+pWgFKemIkSof/UgTI4ykUOfWsG0
	7338q
X-Gm-Gg: ATEYQzycK3JGI4kLduIcVO7q3o681LpKD1i+PrFm87xUWyu9W5tXQwLDkB5O9lC9NRu
	H8zST/T5kDwemTtaeQupFj+IpGf1D+leE9eLp6KISvMYpiEjkn2a2ZTXE4qcBIOTSuALz+mVqtF
	lBqvJTAS2vzoRQPrBgCKnv+3XLHc8BdT5WfKDI5fKjKxifD047qOljr2o2O2CjGtR27jZeLZdJF
	SPIvMD9sDaddpcpJ12vndWJwsUhyjhfjhgwvHI5ryN5bPIp6INaAJvallctcf5pDh454MeIjFua
	ShAHW+5cdlMRwUVzqLAdmUkNz1/wxtFhentw01Vva3X+e+pKwfUDkZso7QhhhoVSAqFbmNJvudn
	MoMgLumotTHhpBvlHH0DI5CJ39HlfcAMLdU0GdHQhDmDrF7n4nY8g2FEyzcF/ZiHMJeYOSjTDRy
	lJoy4qRNa6IlSBkZmEzH2ideqb1mKD6tOqy3GV4Q1SqIMmZgfKAPz1MhWfGRTruSKk4BQmqiO+i
	jxTc4coRzQZ/BvDyJ+GCg0HY7XL2bhaHg==
X-Received: by 2002:a05:6000:310b:b0:437:6c1f:de27 with SMTP id ffacd0b85a97d-4396f17e514mr23232520f8f.37.1771944069973;
        Tue, 24 Feb 2026 06:41:09 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm28711195f8f.25.2026.02.24.06.41.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:41:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 7/9] wic/engine: error on old host debugfs for standalone directory copy
Date: Tue, 24 Feb 2026 15:41:00 +0100
Message-ID: <c88d38df7567bc6759fe89fe28edefe1ab575166.1771943829.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943829.git.yoann.congal@smile.fr>
References: <cover.1771943829.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231858

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
index 9d596be3a72..8682ca3176c 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -222,6 +222,34 @@ def wic_list(args, scripts_path):
 
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
@@ -352,6 +380,7 @@ class Disk:
         if self.partitions[pnum].fstype.startswith('ext'):
             if isinstance(src, str): # host to image case
                 if os.path.isdir(src):
+                    debugfs_version_check(self.debugfs)
                     base = os.path.abspath(src)
                     base_parent = os.path.dirname(base)
                     cmds = []

