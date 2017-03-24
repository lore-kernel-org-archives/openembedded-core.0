Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 90A9477C31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 22:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490393188; x=1521929188;
	h=from:to:cc:subject:date:message-id;
	bh=FTjiIwnKCz5jLzkixA7dCkHmnmIiQljYXA7UKzkfXAo=;
	b=QPntas8iBnhKnyMI8ywrhTS4dZSzKOdc/qzCJNxKTf6sgzMcVLzIJr3b
	tYrB+O9a/KNVsewqjjNdqpceEiemPQ==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 15:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,216,1486454400"; d="scan'208";a="1111907765"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 24 Mar 2017 15:06:18 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org,
	juro.bystricky@intel.com
Date: Fri, 24 Mar 2017 15:06:15 -0700
Message-Id: <08d36d732abad80c4e13cc62f4465d441a8c00b0.1490392540.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1490392540.git.mariano.lopez@linux.intel.com>
References: <cover.1490392540.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1490392540.git.mariano.lopez@linux.intel.com>
References: <cover.1490392540.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/3] oeqa/target: Add decorator to register targets
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
X-List-Received-Date: Fri, 24 Mar 2017 22:06:27 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds a way to register targets that can be used with runtime testing. To
do this just decorate a target class with registerTarget, and set "targetName"
attribute to the name that will be used by TEST_TARGET variable.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/target/base.py | 23 +++++++++++++++++++++++
 meta/lib/oeqa/core/target/qemu.py |  5 +++++
 meta/lib/oeqa/core/target/ssh.py  |  6 +++++-
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/target/base.py b/meta/lib/oeqa/core/target/base.py
index d2468bc..c886491 100644
--- a/meta/lib/oeqa/core/target/base.py
+++ b/meta/lib/oeqa/core/target/base.py
@@ -1,8 +1,31 @@
 # Copyright (C) 2016 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
+import os
+import sys
+import importlib
 
 from abc import abstractmethod
 
+# Used to keep record of registered targets, it
+# uses class' targetName as the key to the class.
+targetClasses = {}
+
+def registerTarget(obj):
+    """ Use as decorator to register targets for runtime testing """
+
+    if (obj.targetName in targetClasses and
+        obj.__name__ != targetClasses[obj.targetName].__name__):
+
+        msg = ('Tried to register %s as "%s" that is used by %s' %
+               (obj, obj.targetName, targetClasses[obj.targetName]))
+        raise ImportError(msg)
+
+    if not issubclass(obj, OETarget):
+        raise TypeError('%s must inherit from OETarget' % obj)
+
+    targetClasses[obj.targetName] = obj
+    return obj
+
 class OETarget(object):
 
     def __init__(self, logger, *args, **kwargs):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 261c466..d1b6bf5 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -6,12 +6,17 @@ import sys
 import signal
 import time
 
+from oeqa.core.target.base import registerTarget
 from oeqa.core.target.ssh import OESSHTarget
 from oeqa.utils.qemurunner import QemuRunner
 
 supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic', 'elf']
 
+@registerTarget
 class OEQemuTarget(OESSHTarget):
+
+    targetName = 'qemu'
+
     def __init__(self, logger, ip, server_ip, timeout=300, user='root',
             port=None, machine='', rootfs='', kernel='', kvm=False,
             dump_dir='', dump_host_cmds='', display='', bootlog='',
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 035965a..d973058 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -7,9 +7,13 @@ import select
 import logging
 import subprocess
 
-from oeqa.core.target.base import OETarget
+from oeqa.core.target.base import OETarget, registerTarget
 
+@registerTarget
 class OESSHTarget(OETarget):
+
+    targetName = 'simpleremote'
+
     def __init__(self, logger, ip, server_ip, timeout=300, user='root',
                  port=None, **kwargs):
         if not logger:
-- 
2.10.2


