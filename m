Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7775178743
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:42:03 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:42:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181356223"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:42:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:18 +1300
Message-Id: <9c274bc8a5d622ab3cdf3b8439bdb0503cfbf7ad.1512438001.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/12] devtool: fix handling of linux-yocto after multisrc changes
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
X-List-Received-Date: Tue, 05 Dec 2017 01:42:03 -0000

devtool now handles multiple source trees for any recipe that includes
them in SRC_URI, extracting them all side-by-side so that you can make
changes in any of them. As a result, when running devtool modify on a
linux-yocto kernel recipe under the source path you will get a "source"
subdirectory containing the kernel source and a "kernel-meta"
subdirectory next to it containing the kernel metadata. (Previously you
just got the source tree and the kernel metadata remained in the work
directory). We create a symlink automatically at do_unpack from the work
directory so that it can still be found there, however
kernel_feature_dirs() expects to find the kernel-meta repository and
we also now need to make externalsrc remove that so that it doesn't
unpack and overwrite the one we've already extracted. Change
kernel_feature_dirs() so that if there are no kmeta entries in SRC_URI,
it will fall back to a directory named ${KMETA} if it happens to be
present in the work directory, ignoring how it got there.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/externalsrc.bbclass  | 2 +-
 meta/classes/kernel-yocto.bbclass | 7 ++++++-
 scripts/lib/devtool/standard.py   | 4 +++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 65dd13d..1ce53ee 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -65,7 +65,7 @@ python () {
             url_data = fetch.ud[url]
             parm = url_data.parm
             if (url_data.type == 'file' or
-                    'type' in parm and parm['type'] == 'kmeta'):
+                    (parm.get('type', None) == 'kmeta' and d.getVar('EXTERNALSRC_KMETA') != "1")):
                 local_srcuri.append(url)
 
         d.setVar('SRC_URI', ' '.join(local_srcuri))
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1d44795..18a7113 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -42,7 +42,12 @@ def find_kernel_feature_dirs(d):
             destdir = parm["destsuffix"]
             if type == "kmeta":
                 feature_dirs.append(destdir)
-	    
+    if not feature_dirs:
+        # If the kernel-meta directory already exists (e.g from externalsrc)
+        # with EXTERNALSRC_KMETA = "1" then use it
+        kmetadir = d.getVar('KMETA')
+        if os.path.isdir(os.path.join(d.getVar('WORKDIR'), kmetadir)):
+            feature_dirs.append(kmetadir)
     return feature_dirs
 
 # find the master/machine source branch. In the same way that the fetcher proceses
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index cadd038..fe33c7e 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -909,7 +909,9 @@ def modify(args, config, basepath, workspace):
 
             if bb.data.inherits_class('kernel', rd):
                 f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
-                        'do_fetch do_unpack do_kernel_configme do_kernel_configcheck"\n')
+                        'do_fetch do_kernel_configme do_kernel_configcheck"\n')
+                if bb.data.inherits_class('kernel-yocto', rd):
+                    f.write('EXTERNALSRC_KMETA = "1"\n')
                 f.write('\ndo_patch() {\n'
                         '    :\n'
                         '}\n')
-- 
2.9.5


