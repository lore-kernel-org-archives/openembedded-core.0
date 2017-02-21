Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3171672FD8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 22:48:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 14:48:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,191,1484035200"; d="scan'208";a="50982894"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 21 Feb 2017 14:48:53 -0800
Received: from yocto-ab03.ostc.intel.com (yocto-ab03.ostc.intel.com
	[10.54.69.73])
	by linux.intel.com (Postfix) with ESMTP id A54436A4004;
	Tue, 21 Feb 2017 14:48:53 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 14:48:49 -0800
Message-Id: <1487717331-26684-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH 1/3] lib/oe/sdk: Add get_extra_sdk_info to reuse code in buildhistory
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
X-List-Received-Date: Tue, 21 Feb 2017 22:48:54 -0000

This function is going to be used for generating the target and host manifest files packages for eSDK.
[YOCTO #9038]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/classes/buildhistory.bbclass | 20 ++++++++------------
 meta/lib/oe/sdk.py                | 17 +++++++++++++++++
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 7251a2c..b7130fe 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -550,23 +550,19 @@ END
 python buildhistory_get_extra_sdkinfo() {
     import operator
     import math
+    # importing oe.sdk due package information req
+    from oe.sdk import get_extra_sdkinfo
+
     if d.getVar('BB_CURRENTTASK') == 'populate_sdk_ext':
-        tasksizes = {}
-        filesizes = {}
-        for root, _, files in os.walk(d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')):
-            for fn in files:
-                if fn.endswith('.tgz'):
-                    fsize = int(math.ceil(float(os.path.getsize(os.path.join(root, fn))) / 1024))
-                    task = fn.rsplit(':', 1)[1].split('_', 1)[1].split('.')[0]
-                    origtotal = tasksizes.get(task, 0)
-                    tasksizes[task] = origtotal + fsize
-                    filesizes[fn] = fsize
+        sstate_dir = d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')
+        extra_info = get_extra_sdkinfo(sstate_dir)
+
         with open(d.expand('${BUILDHISTORY_DIR_SDK}/sstate-package-sizes.txt'), 'w') as f:
-            filesizes_sorted = sorted(filesizes.items(), key=operator.itemgetter(1, 0), reverse=True)
+            filesizes_sorted = sorted(extra_info['filesizes'].items(), key=operator.itemgetter(1, 0), reverse=True)
             for fn, size in filesizes_sorted:
                 f.write('%10d KiB %s\n' % (size, fn))
         with open(d.expand('${BUILDHISTORY_DIR_SDK}/sstate-task-sizes.txt'), 'w') as f:
-            tasksizes_sorted = sorted(tasksizes.items(), key=operator.itemgetter(1, 0), reverse=True)
+            tasksizes_sorted = sorted(extra_info['tasksizes'].items(), key=operator.itemgetter(1, 0), reverse=True)
             for task, size in tasksizes_sorted:
                 f.write('%10d KiB %s\n' % (size, task))
 }
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index fef02d0..4ce388f 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -371,5 +371,22 @@ def populate_sdk(d, manifest_dir=None):
     os.environ.clear()
     os.environ.update(env_bkp)
 
+def get_extra_sdkinfo(sstate_dir):
+    import operator
+    import math
+
+    extra_info = {}
+    extra_info['tasksizes'] = {}
+    extra_info['filesizes'] = {}
+    for root, _, files in os.walk(sstate_dir):
+        for fn in files:
+            if fn.endswith('.tgz'):
+                fsize = int(math.ceil(float(os.path.getsize(os.path.join(root, fn))) / 1024))
+                task = fn.rsplit(':',1)[1].split('_',1)[1].split(',')[0]
+                origtotal = extra_info['tasksizes'].get(task, 0)
+                extra_info['tasksizes'][task] = origtotal + fsize
+                extra_info['filesizes'][fn] = fsize
+    return extra_info
+
 if __name__ == "__main__":
     pass
-- 
1.8.3.1


