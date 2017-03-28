Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DDD8771C86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 07:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490685352; x=1522221352;
	h=from:to:cc:subject:date:message-id;
	bh=ghfgHAdvAMM1KlGfSKwuHZYngE3GXYxWUlF8FBTn5xM=;
	b=hg5qXdSYYZhTH3ebai71P9yXcu8JYJwfFeVr4aJra1dx0D4JfpSjb1g2
	r2yqpNdI7F0cPBUmOXyo4TdO/w0+Pg==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 00:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,235,1486454400"; d="scan'208";a="71193997"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 28 Mar 2017 00:15:51 -0700
Received: from yocto-ab03.ostc.intel.com (yocto-ab03.ostc.intel.com
	[10.54.69.73])
	by linux.intel.com (Postfix) with ESMTP id E44996A4080;
	Tue, 28 Mar 2017 00:15:44 -0700 (PDT)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 00:15:40 -0700
Message-Id: <1490685341-9889-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH v3, 1/2] lib/oe/sdk: Add get_extra_sdk_info to reuse code in buildhistory
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
X-List-Received-Date: Tue, 28 Mar 2017 07:15:51 -0000

This function is going to be used for generating the target and host manifest files packages for eSDK.
[YOCTO #9038]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/classes/buildhistory.bbclass | 16 ++++------------
 meta/lib/oe/sdk.py                | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 109b375..ab04db7 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -554,25 +554,17 @@ END
 python buildhistory_get_extra_sdkinfo() {
     import operator
     import math
+    # importing oe.sdk due package information req.
+    from oe.sdk import get_extra_sdkinfo
 
     if d.getVar('BB_CURRENTTASK') == 'populate_sdk_ext' and \
             "sdk" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
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
         with open(d.expand('${BUILDHISTORY_DIR_SDK}/sstate-package-sizes.txt'), 'w') as f:
-            filesizes_sorted = sorted(filesizes.items(), key=operator.itemgetter(1, 0), reverse=True)
+            filesizes_sorted = sorted(extra_info['filesizes'].items(), key=operator.itemgetter(1, 0), reverse=True)
             for fn, size in filesizes_sorted:
                 f.write('%10d KiB %s\n' % (size, fn))
         with open(d.expand('${BUILDHISTORY_DIR_SDK}/sstate-task-sizes.txt'), 'w') as f:
-            tasksizes_sorted = sorted(tasksizes.items(), key=operator.itemgetter(1, 0), reverse=True)
+             tasksizes_sorted = sorted(extra_info['tasksizes'].items(), key=operator.itemgetter(1, 0), reverse=True)
             for task, size in tasksizes_sorted:
                 f.write('%10d KiB %s\n' % (size, task))
 }
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index deb823b..d101bf0 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -372,5 +372,21 @@ def populate_sdk(d, manifest_dir=None):
     os.environ.clear()
     os.environ.update(env_bkp)
 
+def get_extra_sdk_info(sstate_dir):
+    import operator
+    import math
+
+    extra_info = {}
+    extra_info['tasksizes']
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


