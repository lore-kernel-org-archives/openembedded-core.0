Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E302978301
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 16:33:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6JGX5EZ007362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 19 Jul 2017 17:33:06 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dXruL-0005YE-6C; Wed, 19 Jul 2017 17:33:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 17:33:01 +0100
Message-Id: <1500481982-21294-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500481982-21294-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1500481982-21294-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 19 Jul 2017 17:33:06 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/3] devtool: Setup logging before calling prepare
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jul 2017 16:33:08 -0000

This avoids test failures like:

INFO - ======================================================================
INFO - FAIL [1.755s]: test_devtool_layer_plugins (devtool.DevtoolTests)
INFO - ----------------------------------------------------------------------
INFO - Traceback (most recent call last):
  File "/media/build1/poky/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/media/build1/poky/meta/lib/oeqa/selftest/cases/devtool.py", line 1354, in test_devtool_layer_plugins
    self.assertEqual(result.output, s[::-1])
AssertionError: "NOTE: Starting bitbake server...\noY senu[36 chars]rciM" != "oY senuZ s'enoynA morF tiforP oN edaM tfosorciM"
- NOTE: Starting bitbake server...
  oY senuZ s'enoynA morF tiforP oN edaM tfosorciM
INFO - ----------------------------------------------------------------------

since there is corruption in the output. Setting the logging up before
calling tinfoil.prepare() resolves this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index bba0721..b231e46 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -115,8 +115,8 @@ def setup_tinfoil(config_only=False, basepath=None, tracking=False):
         import bb.tinfoil
         tinfoil = bb.tinfoil.Tinfoil(tracking=tracking)
         try:
-            tinfoil.prepare(config_only)
             tinfoil.logger.setLevel(logger.getEffectiveLevel())
+            tinfoil.prepare(config_only)
         except bb.tinfoil.TinfoilUIException:
             tinfoil.shutdown()
             raise DevtoolError('Failed to start bitbake environment')
-- 
2.7.4


