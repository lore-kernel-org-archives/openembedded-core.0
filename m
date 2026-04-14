Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AC6F9D0E7
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 16:24:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.810.1776183879049160770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 09:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AM4qhPKp;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so46580085e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 09:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776183877; x=1776788677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eMfUuuAFxr4SfgeYYsxoSEDhwKrAm9kdMVHK0GURfOs=;
        b=AM4qhPKpeq0dglezZYn3l1L1gyleg0vLSa23PK4Pt6mMHq2kygQo3QUwWpSlcqNLVi
         dNIJMiscmU/s+ZebfYrgN98HmRUrMCL8EfuaMZWq7BO5LuDkmucfgFDZzSn52Z71yYGn
         HR7QXQPVZvm+BSFo8YTnNbwnAkaIryDSbhulw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776183877; x=1776788677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMfUuuAFxr4SfgeYYsxoSEDhwKrAm9kdMVHK0GURfOs=;
        b=cuvXHQP2XObtRUpg+MDomEUKxa1Itm7+IUX/8m0Fsli4lhT1/K9zd8/v8PILer/kCe
         xAjTiah+DSjrhjf9kS7S3N+a8R8MPZDG3MTLoYCpzpOySOxvpjI6KBzvMWLBvke9Chk2
         udUnmXm93rRcuISa2yVtTLSonn0puaDM8OxNTiTdr6eZAlZFwxL9kkqi2o4UXHf5SOJ7
         xdnxxse7L2JnW7O6bwWri9JLlOm9Gn0XBI0CwpEnSRdKiXXZCZE9JyDKuJbZ9HPB3vxU
         PUHGnmHUwMvfuPGoFdJvOsFmh0pu47mjbkDBylBwqKmSBwYcxyp+4iTzfon0kMgxkwpB
         EBQA==
X-Gm-Message-State: AOJu0Yz5D8LnwuchLVvXdHUnmqdhYR45hXfUwfLpO6qdIqnMHt66ohuN
	djrI0yPZeyVfAkfOa63ZLHKIOAxI5I3uv5G0CZqQT6A8W0XustbBvm2yG0fjjU+byRE2dknskBZ
	Zfa08hzQ=
X-Gm-Gg: AeBDietmSrkKUBFBb49Ix1e/1jVNp0k/GmcHHgcbfpvdyYt98M+7wlFUleBJdjrPeOq
	1eq67BtB9tSSoXuUWV9QRIvH6CrFijAn/JMySzMK1p0EZyubaRphd9coeujZ9b4Uht15nQCktQe
	uNRll8FNJvd9zHMUJbEohOSMOmy7Miqqf75WW91X62b6LGwEjgBUCOrWSzOv2+nFAMa4UVGZPrF
	J+yPgS4D3eSCX3VsqpxWrm/MxdXQ/U6uU3tj+uiIDd/xD8hO3Dh8UCf/uyvm17sSwGIPGLBlwgA
	sBpQ5f7YweER8R22FG6igBqnIeOXP1I7arlAkhEXI1cErjRiIpNV8TCP9AkhdD8dQE7VAi6uqpD
	CzjtUwxp3an+TMZR+4p2c2vfsKtpp4yVT43IN3FDbB14KQUSvBHe0glLCK8AzootBhaj+omShS1
	TTCG6WWcuP97prObUmfR/feW7kgxUHa3rkKE7V3mUcokSrOn9ncyA2qlKjYEQW3eJSY+jGthWA1
	KuSj0fBUsrolHoKUcjGWjQ/iGLW8Wsxj9qQ4Gl8SwBA
X-Received: by 2002:a05:600c:4451:b0:485:1878:7b8c with SMTP id 5b1f17b1804b1-488d684c6bdmr208208095e9.18.1776183876827;
        Tue, 14 Apr 2026 09:24:36 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488eddba112sm66017915e9.0.2026.04.14.09.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:24:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] oeqa/selftest/sstatetests: add wayland feature check for test needing it
Date: Tue, 14 Apr 2026 18:24:21 +0200
Message-ID: <20260414162421.154587-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 16:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235170

From: Yoann Congal <yoann.congal@smile.fr>

When run with a distro without 'wayland' DISTRO_FEATURES:
2026-04-14 17:42:00,568 - oe-selftest - INFO - FAIL: test_sstate_32_64_same_hash (sstatetests.SStateHashSameSigs.test_sstate_32_64_same_hash)
2026-04-14 17:42:00,568 - oe-selftest - INFO - ----------------------------------------------------------------------
2026-04-14 17:42:00,568 - oe-selftest - INFO - Traceback (most recent call last):
  File ".../openembedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 407, in test_sstate_32_64_same_hash
    self.sstate_hashtest("i686")
    ~~~~~~~~~~~~~~~~~~~~^^^^^^^^
  File ".../openembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File ".../openembedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 371, in sstate_hashtest
    bitbake("core-image-weston -S none")
    ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
...
AssertionError: Command 'bitbake  core-image-weston -S none' returned non-zero exit status 1:
...
ERROR: Nothing PROVIDES 'core-image-weston'
core-image-weston was skipped: using DISTRO 'nodistro', which is missing required DISTRO_FEATURES: 'wayland'

This is caused by core-image-weston being skipped because it needs the
wayland DISTRO_FEATURES.

Note that this is not seen in testing because nodistro has wayland
enabled by default since
2e1e7c86064 (bitbake.conf: Enable opengl ptest multiarch wayland vulkan in DISTRO_FEATURES by default, 2026-02-21)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 687640a4016..02fd45fe0d9 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -15,6 +15,7 @@ import re
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfNotFeature
 
 import oe
 import bb.siggen
@@ -354,6 +355,7 @@ class SStateCacheManagement(SStateBase):
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
 class SStateHashSameSigs(SStateBase):
+    @skipIfNotFeature('wayland', 'Test requires wayland to be in DISTRO_FEATURES')
     def sstate_hashtest(self, sdkmachine):
 
         self.write_config("""

