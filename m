Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E454C982DC
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 18:38:48 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.645.1789670320798710367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 11:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=ile/DUfK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260917183838bf6ae70dcd000207d3-fx4fkf@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260917183838bf6ae70dcd000207d3
        for <openembedded-core@lists.openembedded.org>;
        Thu, 17 Sep 2026 20:38:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=aKORRr+PV+R5cSLBs76r8OK0l63cNGpEyx1Jbut/iPM=;
 b=ile/DUfKrBI/MJeAZtGo89IPTI0+j5enzHOsh9gW1gIhxJ0tPiRw0ZYCubwrZrcHFqlU7A
 shlY/T3k/DwEIIapFLlp7gjLM0Br12Uoizp/dvD7A7/PFMzJDpT6kQNvR1f59/36cyIRAFz9
 1VB+O9amM4GGAhW8kUlLxypn2RHq/iv4xNkYz+tNkaX2NlzREW52MoiZlLRRPGFDPD+MT+3E
 W0n0eEya/y3eC5/NMiCuGPvWiIkt4hLq7j5p5f9Uf/PL1NBq5n9Ka8SVx0NV+9f1CVKT4c5W
 ou1oRnBz4355hgc/8KtQCzIpooofsTQzCtLfGkg/n2986C32XT9IXV/g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 5/7] devtool: ide-sdk: move the loopback target helpers to ide_plugins
Date: Thu, 17 Sep 2026 20:37:57 +0200
Message-ID: <20260917183832.998361-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260917183832.998361-1-adrian.freihofer@siemens.com>
References: <20260917183832.998361-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 18:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246083

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The debugger configuration classes in ide_plugins need to know whether
the target loops back to the local machine, which is where the slirp
port forwarding they have to deal with exists. They cannot import
ide_sdk for it, since ide_sdk imports them.

No functional change.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py | 14 ++++++++++++++
 scripts/lib/devtool/ide_sdk.py              | 16 +---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 333ec9bac8..2cdb2e504a 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -15,6 +15,20 @@ from devtool import DevtoolError
 logger = logging.getLogger('devtool')
 
 
+# Hosts a ssh target is considered to loop back to the local machine, e.g. a
+# QEMU instance reached through slirp/hostfwd port forwarding (root@localhost)
+# which has an ephemeral ssh host key that changes on every boot.
+LOOPBACK_HOSTS = ('localhost', '127.0.0.1', '::1')
+
+
+def target_host(target):
+    return target.split('@')[-1]
+
+
+def is_loopback_target(target):
+    return target_host(target) in LOOPBACK_HOSTS
+
+
 class BuildTool(Enum):
     UNDEFINED = auto()
     CMAKE = auto()
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index a2b15ce440..a987c37f06 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -25,7 +25,7 @@ import bb
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError, parse_recipe
 from devtool.standard import get_real_srctree
 from devtool.deploy import parse_packages_arg
-from devtool.ide_plugins import BuildTool, DebuggerCrossConfig
+from devtool.ide_plugins import BuildTool, DebuggerCrossConfig, LOOPBACK_HOSTS, is_loopback_target
 from oe.kernel_module import kernel_module_os_env
 from pseudo_rootfs_utils import PseudoRootfsError, extract_sdk_rootfs, pseudo_state_dir
 
@@ -48,20 +48,6 @@ class DevtoolIdeMode(Enum):
     shared = 'shared'
 
 
-# Hosts a ssh target is considered to loop back to the local machine, e.g. a
-# QEMU instance reached through slirp/hostfwd port forwarding (root@localhost)
-# which has an ephemeral ssh host key that changes on every boot.
-LOOPBACK_HOSTS = ('localhost', '127.0.0.1', '::1')
-
-
-def target_host(target):
-    return target.split('@')[-1]
-
-
-def is_loopback_target(target):
-    return target_host(target) in LOOPBACK_HOSTS
-
-
 class TargetDevice:
     """SSH remote login parameters"""
 
-- 
2.55.0


