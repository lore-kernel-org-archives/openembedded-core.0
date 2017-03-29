Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7809971D31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 16:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490803616; x=1522339616;
	h=from:to:cc:subject:date:message-id;
	bh=fW55MvBZnhLOloKSd6Z7JRcorZf6yEjonPg++y2FUTo=;
	b=n7HXvoNUtL9N8lUQy09n1mXhUTmj6eU+Fog+JA97vw9dUmRliugGqMvF
	XMi03tWtH+WQePESuhgPVEl7cfmsDQ==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2017 09:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,241,1486454400"; d="scan'208";a="66499245"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 29 Mar 2017 09:06:54 -0700
Received: from yocto-ab03.ostc.intel.com (yocto-ab03.ostc.intel.com
	[10.54.69.73])
	by linux.intel.com (Postfix) with ESMTP id 3DD8F6A4080;
	Wed, 29 Mar 2017 09:06:48 -0700 (PDT)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 09:06:54 -0700
Message-Id: <1490803614-31301-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH v4, 1/2] lib/oe/sdk: Adds get_extra_sdk_info to reuse code in buildhistory
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
X-List-Received-Date: Wed, 29 Mar 2017 16:06:54 -0000

Added some fixes for buildhistory.bblclass, and docstring for get_extra_sdkinfo at oe.sdk

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/classes/buildhistory.bbclass |  4 +---
 meta/lib/oe/sdk.py                | 15 +++++++++++----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index ab04db7..ffc5054 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -553,8 +553,6 @@ END
 
 python buildhistory_get_extra_sdkinfo() {
     import operator
-    import math
-    # importing oe.sdk due package information req.
     from oe.sdk import get_extra_sdkinfo
 
     if d.getVar('BB_CURRENTTASK') == 'populate_sdk_ext' and \
@@ -564,7 +562,7 @@ python buildhistory_get_extra_sdkinfo() {
             for fn, size in filesizes_sorted:
                 f.write('%10d KiB %s\n' % (size, fn))
         with open(d.expand('${BUILDHISTORY_DIR_SDK}/sstate-task-sizes.txt'), 'w') as f:
-             tasksizes_sorted = sorted(extra_info['tasksizes'].items(), key=operator.itemgetter(1, 0), reverse=True)
+            tasksizes_sorted = sorted(extra_info['tasksizes'].items(), key=operator.itemgetter(1, 0), reverse=True)
             for task, size in tasksizes_sorted:
                 f.write('%10d KiB %s\n' % (size, task))
 }
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index d101bf0..7f1d5bf 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -372,12 +372,12 @@ def populate_sdk(d, manifest_dir=None):
     os.environ.clear()
     os.environ.update(env_bkp)
 
-def get_extra_sdk_info(sstate_dir):
-    import operator
+def get_extra_sdkinfo(sstate_dir):
     import math
 
     extra_info = {}
-    extra_info['tasksizes']
+    extra_info['tasksizes'] = {}
+    extra_info['filesizes'] = {}
     for root, _, files in os.walk(sstate_dir):
         for fn in files:
             if fn.endswith('.tgz'):
@@ -386,7 +386,14 @@ def get_extra_sdk_info(sstate_dir):
                 origtotal = extra_info['tasksizes'].get(task, 0)
                 extra_info['tasksizes'][task] = origtotal + fsize
                 extra_info['filesizes'][fn] = fsize
-    return extra_info 
+    return extra_info
+    """
+    Function get_extra_sdkinfo: 
+    Is going to be used for 
+    generating the target and host 
+    manifest files packages of eSDK.
+    """ 
+    print(get_extra_sdkinfo.__doc__)
 
 if __name__ == "__main__":
     pass
-- 
1.8.3.1


