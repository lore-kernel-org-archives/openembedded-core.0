Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 60CF371A82
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:55:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vA9BtqJT007426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 9 Nov 2017 11:55:53 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eClR2-00030e-H3; Thu, 09 Nov 2017 11:55:52 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 11:55:47 +0000
Message-Id: <1510228551-11516-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/7] oeqa/targetcontrol: Drop unused get_target_controller function
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
X-List-Received-Date: Thu, 09 Nov 2017 11:55:55 -0000

This funciton appears completely unused, drop it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/targetcontrol.py | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 3255e3a..e17c895 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -20,31 +20,6 @@ from abc import ABCMeta, abstractmethod
 
 logger = logging.getLogger('BitBake.QemuRunner')
 
-def get_target_controller(d):
-    testtarget = d.getVar("TEST_TARGET")
-    # old, simple names
-    if testtarget == "qemu":
-        return QemuTarget(d)
-    elif testtarget == "simpleremote":
-        return SimpleRemoteTarget(d)
-    else:
-        # use the class name
-        try:
-            # is it a core class defined here?
-            controller = getattr(sys.modules[__name__], testtarget)
-        except AttributeError:
-            # nope, perhaps a layer defined one
-            try:
-                bbpath = d.getVar("BBPATH").split(':')
-                testtargetloader = TestTargetLoader()
-                controller = testtargetloader.get_controller_module(testtarget, bbpath)
-            except ImportError as e:
-                bb.fatal("Failed to import {0} from available controller modules:\n{1}".format(testtarget,traceback.format_exc()))
-            except AttributeError as e:
-                bb.fatal("Invalid TEST_TARGET - " + str(e))
-        return controller(d)
-
-
 class BaseTarget(object, metaclass=ABCMeta):
 
     supported_image_fstypes = []
@@ -115,9 +90,9 @@ class QemuTarget(BaseTarget):
 
     supported_image_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
-    def __init__(self, d, image_fstype=None):
+    def __init__(self, d, image_fstype=None, logger=None):
 
-        super(QemuTarget, self).__init__(d)
+        super(QemuTarget, self).__init__(d, logger)
 
         self.rootfs = ''
         self.kernel = ''
-- 
2.7.4


