Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941D0F9D0D3
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 14:23:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20279.1776176621549751381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 07:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q2ew58El;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so54078645e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776176619; x=1776781419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a51qYD8saTI3InJq1iKdFYESDKYril3tHbNYtNdQHjI=;
        b=q2ew58ElCpbVPrwWSZRFujI7O6qE5k119fr6U8VIHfuXmKb1MC1CDZUDhUIgtWFcPX
         TKql6BGpzkuzE1JBXynInbGpvBY+R7nctw/NJaES0C9kFW8etIQJ4cy/kerVy/yJBrMl
         nQXrEwOHZGPVuiPuxSbbzMRF6UXWAQ6/jE0Z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176619; x=1776781419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a51qYD8saTI3InJq1iKdFYESDKYril3tHbNYtNdQHjI=;
        b=p/k6KQ7ml5JP201cLnI2yHcUKSpUxpzv1T9QTjCuEGFYRJ+dJn2Gyo97plkPEonZJe
         r5sQjH12uFncl7bCc4bUoF7BKzUm5Xut4zFj/ChaH5KvthM8IpqAwG53U89zTtE6FVqM
         /rsJbJ0vege0MqZhoa/IGZ4SGe54DfpsGFJhbWoPe4dEsIxjlZXIpbJmIi8N1OzhnFVs
         TM4nm2Dfyq95bbxrkYzgi7xapndgWyfQch1wE9qsjQyGTPwXG0OOdB8MgRJfnxPFLl87
         2KxMEEFi4Wjg1iXeuNa/7yZD1AHtCjoAkOnZh5STNK+lMzcN1hjJ4z7WZa+ReAycY778
         rV3g==
X-Gm-Message-State: AOJu0YwHI4BYtOsQPlwXImEglOfHv9rjXgdu6kp1yWSdjvZEB1gBDM7X
	jIQVqlpOtwbKb1Q5r3k6NorTBDfAoKOOiTayd0MCiuEZCzOkyToVA12qcWRB+ObcOjw5vyj5beQ
	pkCuAp40=
X-Gm-Gg: AeBDiev6v3m9DORwD0+5KNKR6+TOcPKNDYm2Ynl2KukRelhir9UXBLAT4Y0Tl5ljhPe
	+EV064iaGxqdeUS/KILbOz6fHqZybuGqO+e7+VbQnuzX9BWvZsNmOHL7etYbqTznpo74KiR0ByL
	+QlgtAPQF7karjWcHaw974zaYyqO4F4v40nc/1355H4df6K+fYIFbTmF1megU2Ocj+yZBoGiuoe
	wpetKuw0GhRqsduvbMfoT/pfJIKlsgvOd1qkpeKbHX7xb0LV+hTpMXiltddipGUs/OnA/92XGLs
	KjdTuEf8Bj2pEsTMxbqIONMkIYpIOvKvdBUloIiVFiY88VaOfY1EAl5yV4nU6i/IjE8lPLl0QMT
	0Aznyv4AmP0+ol1vkLsL8n/XFHcDaD3Fd2XSUKTXUfRVN2UmKVzRN4tysewPZ0TwBasFHWnySNT
	j0zashGmvRB8d52wWPyttJE2RfIcNSWPuaKsmgKsXSJZwcvha7blBw9NzTWRT+BFcq7vhamXYET
	j2h6WUFPUgzjVVD9U5XBfV8JEAhGWotXSYrdCRfcuSY
X-Received: by 2002:a05:600c:314b:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-488d687c076mr210744425e9.26.1776176619454;
        Tue, 14 Apr 2026 07:23:39 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488e07f8207sm118650825e9.1.2026.04.14.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:23:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] oeqa/selftest/devtool: add vulkan feature check for test needing it
Date: Tue, 14 Apr 2026 16:22:56 +0200
Message-ID: <20260414142257.2246081-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 14:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235158

From: Yoann Congal <yoann.congal@smile.fr>

When run with a distro without 'vulkan' DISTRO_FEATURES:
   $ oe-selftest -r devtool.DevtoolUpdateTests.test_devtool_git_submodules
  2026-04-14 14:36:57,036 - oe-selftest - INFO - test_devtool_git_submodules (devtool.DevtoolUpdateTests.test_devtool_git_submodules)
  vulkan-samples is unavailable:
    vulkan-samples was skipped: using DISTRO 'nodistro', which is missing required DISTRO_FEATURES: 'vulkan'
  2026-04-14 14:37:13,002 - oe-selftest - INFO -  ... ERROR
  2026-04-14 14:37:13,002 - oe-selftest - INFO - Traceback (most recent call last):
    File "/.../openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 1695, in test_devtool_git_submodules
      self.assertIn('gitsm://', src_uri, 'This test expects the %s recipe to be a git recipe with submodules' % recipe)
      ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/usr/lib/python3.13/unittest/case.py", line 1171, in assertIn
      if member not in container:
         ^^^^^^^^^^^^^^^^^^^^^^^
  TypeError: argument of type 'NoneType' is not iterable

This is caused by vulkan-samples being skipped because it needs the
vulkan DISTRO_FEATURES.

Note that this is not seen in testing because nodistro has vulkan
enabled by default since
2e1e7c86064 (bitbake.conf: Enable opengl ptest multiarch wayland vulkan in DISTRO_FEATURES by default, 2026-02-21)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index df45df23423..5ed69aee1b1 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -21,6 +21,7 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, Command, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.commands import get_bb_vars, runqemu, runqemu_check_taps, get_test_layer
 from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfNotFeature
 from bb.utils import mkdirhier, edit_bblayers_conf
 
 oldmetapath = None
@@ -1713,6 +1714,7 @@ class DevtoolUpdateTests(DevtoolBase):
         # Try building
         bitbake('%s -c patch' % testrecipe)
 
+    @skipIfNotFeature('vulkan', 'Test requires vulkan to be in DISTRO_FEATURES (operates on vulkan-samples)')
     def test_devtool_git_submodules(self):
         # This tests if we can add a patch in a git submodule and extract it properly using devtool finish
         # Check preconditions

