Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E3E7178304
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 16:33:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6JGX5QO007363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 19 Jul 2017 17:33:06 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dXruL-0005YJ-6l; Wed, 19 Jul 2017 17:33:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 17:33:02 +0100
Message-Id: <1500481982-21294-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500481982-21294-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1500481982-21294-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 19 Jul 2017 17:33:06 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/3] recipetool: Setup logging before calling prepare
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

======================================================================
ERROR [0.946s]: test_recipetool_load_plugin (recipetool.RecipetoolTests)
INFO - ----------------------------------------------------------------------
INFO - Traceback (most recent call last):
  File "/media/build1/poky/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/media/build1/poky/meta/lib/oeqa/selftest/cases/recipetool.py", line 514, in test_recipetool_load_plugin
    with open(srcfile) as fh:
FileNotFoundError: [Errno 2] No such file or directory: 'NOTE: Starting bitbake server...\n/media/build1/poky/meta-selftest/lib/recipetool/bbpath.py'
INFO - ----------------------------------------------------------------------

which comes from:

$ recipetool --quiet pluginfile
NOTE: Starting bitbake server...
/media/build1/poky/meta-selftest/lib/recipetool/bbpath.py

since there is corruption in the output despite the --quiet option. Setting
the logging up before calling tinfoil.prepare() resolves this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/recipetool | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/recipetool b/scripts/recipetool
index 3765ec7..3a3c9b7 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -36,8 +36,8 @@ def tinfoil_init(parserecipes):
     import bb.tinfoil
     import logging
     tinfoil = bb.tinfoil.Tinfoil(tracking=True)
-    tinfoil.prepare(not parserecipes)
     tinfoil.logger.setLevel(logger.getEffectiveLevel())
+    tinfoil.prepare(not parserecipes)
     return tinfoil
 
 def main():
-- 
2.7.4


