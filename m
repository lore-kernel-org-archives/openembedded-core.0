Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7A474782F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 17:01:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 10:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="97608069"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2017 10:01:25 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 12:01:25 -0500
Message-Id: <bd06ea81a5725ecdbea99378898d9471f6149ffc.1497027624.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497027624.git.anibal.limon@linux.intel.com>
References: <cover.1497027624.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1497027624.git.anibal.limon@linux.intel.com>
References: <cover.1497027624.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>,
	paul.eggleton@linux.intel.com
Subject: [PATCH 1/4] lib/oe/sdk: Adds get_extra_sdk_info to reuse code in buildhistory
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
X-List-Received-Date: Fri, 09 Jun 2017 17:01:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>

This function is going to be used for generating the target and host
manifest files packages for eSDK. Added some fixes for buildhistory.bblclass,
and docstring for get_extra_sdkinfo at oe.sdk

[YOCTO #9038]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 18 ++++++------------
 meta/lib/oe/sdk.py                | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3e907fc..bfcc88a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -582,25 +582,19 @@ END
 python buildhistory_get_extra_sdkinfo() {
     import operator
     import math
+    from oe.sdk import get_extra_sdkinfo
+
+    sstate_dir = d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')
+    extra_info = get_extra_sdkinfo(sstate_dir)
 
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
+            tasksizes_sorted = sorted(extra_info['tasksizes'].items(), key=operator.itemgetter(1, 0), reverse=True)
             for task, size in tasksizes_sorted:
                 f.write('%10d KiB %s\n' % (size, task))
 }
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index deb823b..1c5409e 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -372,5 +372,24 @@ def populate_sdk(d, manifest_dir=None):
     os.environ.clear()
     os.environ.update(env_bkp)
 
+def get_extra_sdkinfo(sstate_dir):
+    """
+    This function is going to be used for generating the target and host manifest files packages of eSDK.
+    """
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
2.1.4


