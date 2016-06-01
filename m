Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 612037735C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZeIX006852; Wed, 1 Jun 2016 13:35:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3Go5O3XvlvRA; Wed,  1 Jun 2016 13:35:57 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpvl006888
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000ll-Gb; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:38 +0100
Message-Id: <1464784540-2786-20-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 20/22] devtool.py: Fix parsing of bitbake-layers' output
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
X-List-Received-Date: Wed, 01 Jun 2016 12:36:02 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Current parsing was picking wrong targets, leading to the following problem:

	AssertionError: Command 'bitbake  Parsing recipes..done. -e' returned non-zero exit status 1:

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/devtool.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index deb3090..0b305c8 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -467,12 +467,11 @@ class DevtoolTests(DevtoolBase):
         testrecipes = 'perf kernel-devsrc package-index core-image-minimal meta-toolchain packagegroup-core-sdk meta-ide-support'.split()
         # Find actual name of gcc-source since it now includes the version - crude, but good enough for this purpose
         result = runCmd('bitbake-layers show-recipes gcc-source*')
-        reading = False
         for line in result.output.splitlines():
-            if line.startswith('=='):
-                reading = True
-            elif reading and not line.startswith(' '):
-                testrecipes.append(line.split(':')[0])
+            # just match those lines that contain a real target
+            m = re.match('(?P<recipe>^[a-zA-Z0-9.-]+)(?P<colon>:$)', line)
+            if m:
+                testrecipes.append(m.group('recipe'))
         for testrecipe in testrecipes:
             # Check it's a valid recipe
             bitbake('%s -e' % testrecipe)
-- 
2.5.0


