Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73D8F88094
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:53 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7589.1776322124737290927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mNfyvEVw;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so5272812f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322123; x=1776926923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1sjjgMJpj1M94vEE/TxwPq6m7Lyysw0wegXrHYT2Zs=;
        b=mNfyvEVw5bMSC+viGhuHsyiMjo8P9m5/OZfQcJprarNUbQCqsQuYNnZMrbf99bXB0u
         Rbf2azJnzk93YLMtkHDvPTV0tY/Tk8py8HLtlHEkoPPPnLq83nuRBE8pWk9rBhgwPzSE
         gZM7niR+KhPcz4vux4V/IC1bsQQdhdIJN2GUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322123; x=1776926923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g1sjjgMJpj1M94vEE/TxwPq6m7Lyysw0wegXrHYT2Zs=;
        b=JkIdkJ8mhowWZKsWK9VroCkEJ2Z0FuylOMbaq3nFsfO+iU2Pbc1gYDqDGGT2s4xg7j
         9DCimV7n4mE7VDkQOQfCKg8+85bsortPoqat47G6zKtgIHE3PIoIpxl6lFVnVLgTu2dp
         z7OyBpC//M6YJlHVpxwuiAZUtaY+nZB1Z40wP7XZuQE0rmCcNpNEk55aR6Lqs3BxXRRK
         PvlLPDiXvOW41sf3wiBAznGeEXt/h/0na0o44zXXLoIv8kTzZH2FLcHp1GN7SECn0gVl
         StfoMuwLeLn1r/VuJW7eqASaRjuFG47OxSxmVqdZtEgFBHIegzGqFQAEgW1DpIvOUzsx
         hkMg==
X-Gm-Message-State: AOJu0Yy+leH8V2Z3iD3Sb8Dg12TUW3y6snjuIUL0vEDuKOmxL93UWED/
	xtEl5Sz82J2DdKjAlzIqOwNdyhXlBSaWpw+eD0S+DysW6pHoQsVw5bZR+v3XagBbYF6dq/ezzaY
	G4SV7oipY4w==
X-Gm-Gg: AeBDiessnIHXvgwu2pPDG15OvFF1ASdTiiVNg41cuODcbB+i3CiHP+LhdLwaDCgy4E8
	CaEr264yZEW/BJDc/HpzXqpHh7TvzmrpSGQvgYue5kRqZZdv57KUQ/8e48dONYbnkexPAuQcDCl
	QCLVvG1sH2TsByer0nbZoTVeGSKbUgKxQbVtx34V4FPSSK7IdzmFkTq1zV7OrM+RK0ch9DU1QX9
	ssyihpKzGLt9fatCjq/SJAktIdSrPxg91yhRZINocRxKeUGAAP3SQ/cpKGP54cnBXr47Mh2MqSk
	52shEjU6XUshk7OwRqI+PL52zf+225YmaGygmabFhgn/tp/XqDSzQqF4o4y3387yk7B6be7QoqL
	JKkGjH8whbi5Onm3X19AXzpvLO3A81Uf7uo25ebMnwk5ySS4lTaSuZrF+ymdP2u2s2vX5p7368w
	DmsPsFYDoqMSlvJl6jUvbJCBKNV6YX1WiQ1YiTZMfBpb5s2OmfehHOyAXHEhJplxdW7qwyEeeFV
	OsW4LXaFLKbzmaql88+72O5BrD5bf6/6Ntxkw==
X-Received: by 2002:a05:6000:290b:b0:43d:77a8:3bb5 with SMTP id ffacd0b85a97d-43d77a83d38mr22326766f8f.37.1776322122785;
        Wed, 15 Apr 2026 23:48:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 37/47] oeqa/selftest/devtool: add vulkan feature check for test needing it
Date: Thu, 16 Apr 2026 08:47:38 +0200
Message-ID: <6f9c690d34938522c850f49b818601bea7752817.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235379

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

