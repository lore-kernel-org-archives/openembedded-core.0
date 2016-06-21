Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 71DCF6018C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 11:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5LBupdJ029319; Tue, 21 Jun 2016 12:57:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id P_jnVzI-395m; Tue, 21 Jun 2016 12:57:29 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5LBvPkK029341
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Jun 2016 12:57:26 +0100
Message-ID: <1466510245.3319.174.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2016 12:57:25 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Hernandez, Alejandro" <alejandro.hernandez@intel.com>
Subject: [PATCH] package_manager: Fix multilib package arch ordering issues
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
X-List-Received-Date: Tue, 21 Jun 2016 11:57:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Order is not preserved in dict() and this code depends on the order of
these lists of package architectures used when multilibs are enabled. 
This caused 'random' breakage where sometimes the correct order was present
and sometimes it wasn't.

Use collections.OrderedDict() to avoid this problem.

Kudos to Bill Randle and Alejandro Hernandez who did most of the work debugging 
this, I simply took the problem they identified and wrote a patch to fix it.

This unblocks the M1 build but this code needs auditing as there are clearly
other ordering issues (e.g. the set() usage).

[YOCTO #9717]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 4aaff8c..bc22c5f 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -5,6 +5,7 @@ import subprocess
 import shutil
 import multiprocessing
 import re
+import collections
 import bb
 import tempfile
 import oe.utils
@@ -101,13 +102,8 @@ class Indexer(object, metaclass=ABCMeta):
 
 class RpmIndexer(Indexer):
     def get_ml_prefix_and_os_list(self, arch_var=None, os_var=None):
-        package_archs = {
-            'default': [],
-        }
-
-        target_os = {
-            'default': "",
-        }
+        package_archs = collections.OrderedDict()
+        target_os = collections.OrderedDict()
 
         if arch_var is not None and os_var is not None:
             package_archs['default'] = self.d.getVar(arch_var, True).split()
@@ -138,7 +134,7 @@ class RpmIndexer(Indexer):
                         target_os[eext[1]] = localdata.getVar("TARGET_OS",
                                                               True).strip()
 
-        ml_prefix_list = dict()
+        ml_prefix_list = collections.OrderedDict()
         for mlib in package_archs:
             if mlib == 'default':
                 ml_prefix_list[mlib] = package_archs[mlib]



