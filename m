Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E1E69782F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 16:33:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6JGX5Bv007361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 19 Jul 2017 17:33:06 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dXruL-0005YB-5V; Wed, 19 Jul 2017 17:33:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 17:33:00 +0100
Message-Id: <1500481982-21294-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 19 Jul 2017 17:33:06 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/3] oe-pkgdata-util: Setup logging before calling prepare
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
INFO - FAIL [1.046s]: test_find_path (pkgdata.OePkgdataUtilTests)
INFO - ----------------------------------------------------------------------
INFO - Traceback (most recent call last):
  File "/media/build1/poky/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/media/build1/poky/meta/lib/oeqa/selftest/cases/pkgdata.py", line 50, in test_find_path
    self.assertEqual(result.output, 'zlib: /lib/libz.so.1')
AssertionError: 'NOTE: Starting bitbake server...\nzlib: /lib/libz.so.1' != 'zlib: /lib/libz.so.1'
- NOTE: Starting bitbake server...
  zlib: /lib/libz.so.1
INFO - ----------------------------------------------------------------------

since there is corruption in the output. Setting the logging up before
calling tinfoil.prepare() resolves this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-pkgdata-util | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 677effe..a690870 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -40,9 +40,8 @@ def tinfoil_init():
     import bb.tinfoil
     import logging
     tinfoil = bb.tinfoil.Tinfoil()
-    tinfoil.prepare(True)
-
     tinfoil.logger.setLevel(logging.WARNING)
+    tinfoil.prepare(True)
     return tinfoil
 
 
-- 
2.7.4


