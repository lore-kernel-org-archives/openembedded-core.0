Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0D1F8DFE3
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:26 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28274.1776378804944782731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BRzSDzxc;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso10620665e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378803; x=1776983603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1sjjgMJpj1M94vEE/TxwPq6m7Lyysw0wegXrHYT2Zs=;
        b=BRzSDzxcuH9hGAqs78nIxKoVrnTfBosdMiTkDk276/73vvad+9GEu6DiMUpz7qtbff
         8iJqSsax353F++NETDD5QlWcRDKLC4EntQFwOgzE2O5IBXJEkabVbNSp980iKm/fEuWW
         K4QJ+lYU/X5cedj5PcKLh3QhjtB7vvB/IvldU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378803; x=1776983603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g1sjjgMJpj1M94vEE/TxwPq6m7Lyysw0wegXrHYT2Zs=;
        b=WNZhZjxG886JfgwyEWXR9IhJA2zHQLa4aUZqZsFWcC0fUf+loYnFINqpiDcWubhC4k
         +fSyR/oBGtxEmyhgiGeskg6px+1OAFKnZlIS+neqt8TYVvVXlovugZkRYcZRsF3zhDi9
         aCxpzFFXa6E99TLS8SkvnTpmmXwS2O+zBivdKU8BPzyW9sQT7zmcSK3BF1UES4dmWBPq
         GsgivjQDFFnmWy2mmUunaq6SHA5iegT2UCIOFrMhg4FDH/SsgVlnm6TrZITYOMM7+9+n
         rJVfkbMJ8fHVw5pQjveFxq8L1W9RPAuZvLC0gCYfpS1n8ng2Ayb8mjJFcZkzvI7iwJkh
         Yx8Q==
X-Gm-Message-State: AOJu0YwJnd3oEmiaasjXGmsMZltbfQI1qOLXgTPtBqnRdYaLECLn1/or
	6dalQpJY8w5YauVyVAU4GeTFotVJ3hoNb2xLbppAao2TymCTKqA3xckkiRnXzPDx6A9+jHxxeGo
	lD4sYt55gXA==
X-Gm-Gg: AeBDietEAM7jdx4NMzx8P4GqbCFrbp/5a5JOgrNAwx23dUjtT034e1QwLgPU+2tc0kD
	XYP7bS6WYTVGoMU963eqIf9FjYrO54Jxy7TSA5BXdUvc9jg9qJxdlNlLaCnDQcA6EHG1OBJvFbj
	cfCjrGyWHNBh57zUVzQDQYnhduO0RdopZuC1Bxipb0jZg03O5+ZL0b0V8/MwUittM9nyX7luobD
	VGe5rNTyg6vgNfP+nUUD+9hPihP5oogmELqg8WaT7QHafyclwMWCt1emBqLha+PX/JC5KePuy7V
	tPJf+D7751cagji314pqw1P5SX9lIhWAzyU85U3DkQKLOKtLo1N2ULplgZ535zdiKCk0GGSv3fL
	fclHjOCZ+i+MkzRa4/Q8gI9NuDREpME2GE29cAZwDH7AiPpjvbPfk0II05n846hMJj9ORlCCdnz
	o6J47YY7NDLq/y9byhdDdRznRV/gpTgyWRs0UwyZsuUb6Pl53OpTAoOZvu3DvLj6aKB5I2GLP2w
	dEdOPHNfCuofcud9BORfz4nb1eHSzmiYNSu1Q==
X-Received: by 2002:a05:600c:a411:b0:488:c239:d498 with SMTP id 5b1f17b1804b1-488fb89e84fmr2605965e9.8.1776378803017;
        Thu, 16 Apr 2026 15:33:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 37/51] oeqa/selftest/devtool: add vulkan feature check for test needing it
Date: Fri, 17 Apr 2026 00:30:20 +0200
Message-ID: <6f9c690d34938522c850f49b818601bea7752817.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235466

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
index 73a79b21041..23849b0bf2f 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -18,6 +18,7 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.commands import get_bb_vars, runqemu, runqemu_check_taps, get_test_layer
 from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfNotFeature
 from bb.utils import mkdirhier, edit_bblayers_conf
 
 oldmetapath = None
@@ -1685,6 +1686,7 @@ class DevtoolUpdateTests(DevtoolBase):
         # Try building
         bitbake('%s -c patch' % testrecipe)
 
+    @skipIfNotFeature('vulkan', 'Test requires vulkan to be in DISTRO_FEATURES (operates on vulkan-samples)')
     def test_devtool_git_submodules(self):
         # This tests if we can add a patch in a git submodule and extract it properly using devtool finish
         # Check preconditions

