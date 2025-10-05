Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AD2CCD184
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 22:01:03 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.20221.1759701661192085116
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 15:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=nheLdb0R;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-2025100522005879e9ca27660002076a-lnprsi@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2025100522005879e9ca27660002076a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 06 Oct 2025 00:00:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=sq2XgJRcQ8KzeQPGRDnhJmpO4P635Uf84Krikn+80S4=;
 b=nheLdb0RFLjGT9JHqNNzGiAiZqBBN2DF/7A6RHnl+QSN8RHYt65h8FnDdYOWyvjtoTsnJJ
 ZqI9dxEs8/ZD97wA/PTMJpw2XPYwqjFt0l2fwAArajSYeI6FFM3OEYct7NhnkPu5NEzQ7QBW
 C8z/dBoWMwwK0Uv6HZFJp6Ud5fT3Gk2N0azgXYWKkm+5We5x82FAFAgVR4LbgK4ApjVHwAi4
 nQo3HzMqHBU31gRA2qBHBgm1X0BQvL26qaz+1Mx8KLnYE+AnN6AzqtfNIVum5skFVLiQdVtO
 OdfNFYHlpzP3AouLROhTo+ti4y0r8sMtMFUa1ozgL5331Q7/Ghx8txag==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/4] devtool: ide_sdk: pass BITBAKEDIR to oe-init-build-env
Date: Mon,  6 Oct 2025 00:00:33 +0200
Message-ID: <20251005220047.4101591-4-adrian.freihofer@siemens.com>
In-Reply-To: <20251005220047.4101591-1-adrian.freihofer@siemens.com>
References: <20251005220047.4101591-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224449

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This fixes an issue where the generated install_and_deploy script is
unable to find the bitbake directory when run outside of the build
environment. This happens if the oe-selftest suite runs in a bitbake
environment that is bootstrapped by bitbake-setup.

oe-selftest -r devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_none_qemu

AssertionError: Command '.../build-st/workspace/ide-sdk/cmake-example/
  scripts/install_and_deploy_cmake-example-cortexa57' returned non-zero exit status 1:
Error: The bitbake directory (/tmp/devtoolqakq7kzgeo/bitbake) does not exist!
  Please ensure a copy of bitbake exists at this location or specify an
  alternative path on the command line
. /tmp/devtoolqakq7kzgeo/core-copy/oe-init-build-env
  /home/adrian/bitbake-builds/poky-master-poky-with-sstate-distro_poky-altcfg-machine_qemuarm64/build-st
  failed

Another reason this issue occurs with oe-selftests is that devtool
tests assume the full poky git repository is available. The setUpModule
function clones layer repositories, which for poky includes bitbake.
However, when using separate git repositories for bitbake and
openembedded-core, the bitbake directory is not preserved during layer
copying. While copying layers to allow modification during tests makes
sense, copying bitbake is less beneficial. Referring to the original
bitbake location is preferable, but cleaning up the devtool tests is
not part of this change.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index ccb6cfbc61..d9b54f7991 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -286,6 +286,7 @@ class RecipeModified:
         self.b = None
         self.base_libdir = None
         self.bblayers = None
+        self.bitbakepath = None
         self.bpn = None
         self.d = None
         self.debug_build = None
@@ -346,6 +347,7 @@ class RecipeModified:
         self.b = recipe_d.getVar('B')
         self.base_libdir = recipe_d.getVar('base_libdir')
         self.bblayers = recipe_d.getVar('BBLAYERS').split()
+        self.bitbakepath = recipe_d.getVar('BITBAKEPATH')
         self.bpn = recipe_d.getVar('BPN')
         self.cxx = recipe_d.getVar('CXX')
         self.d = recipe_d.getVar('D')
@@ -712,11 +714,11 @@ class RecipeModified:
         """Generate a script which does install and deploy"""
         cmd_lines = ['#!/bin/sh']
 
-        # . oe-init-build-env $BUILDDIR
+        # . oe-init-build-env $BUILDDIR $BITBAKEDIR
         # Using 'set' to pass the build directory to oe-init-build-env in sh syntax
         cmd_lines.append('cd "%s" || { echo "cd %s failed"; exit 1; }' % (
             self.oe_init_dir, self.oe_init_dir))
-        cmd_lines.append('set ' + self.topdir)
+        cmd_lines.append('set %s %s' % (self.topdir, self.bitbakepath.rstrip('/bin')))
         cmd_lines.append('. "%s" || { echo ". %s %s failed"; exit 1; }' % (
             self.oe_init_build_env, self.oe_init_build_env, self.topdir))
 
-- 
2.51.0


