Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BEAEC782E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 09:08:45 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 02:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="274088518"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2017 02:08:46 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3823C5804B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 02:08:46 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 12:07:04 +0300
Message-Id: <02d55a89a655082af6832d03f1e14ac4a95bb981.1497430965.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497430965.git.ed.bartosh@linux.intel.com>
References: <cover.1497430965.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/3] image.bbclass: cleanup: add new variable "task"
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
X-List-Received-Date: Wed, 14 Jun 2017 09:08:45 -0000

Replaced repeated expression "do_image_%s" % t with
a variable 'task' to simplify the code and increase
readability.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 85f6b9a..ff4eda1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -491,19 +491,19 @@ python () {
         for dep in typedeps[t]:
             after += ' do_image_%s' % dep.replace("-", "_").replace(".", "_")
 
-        t = t.replace("-", "_").replace(".", "_")
-
-        d.setVar('do_image_%s' % t, '\n'.join(cmds))
-        d.setVarFlag('do_image_%s' % t, 'func', '1')
-        d.setVarFlag('do_image_%s' % t, 'fakeroot', '1')
-        d.setVarFlag('do_image_%s' % t, 'prefuncs', debug + 'set_image_size')
-        d.setVarFlag('do_image_%s' % t, 'postfuncs', 'create_symlinks')
-        d.setVarFlag('do_image_%s' % t, 'subimages', ' '.join(subimages))
-        d.appendVarFlag('do_image_%s' % t, 'vardeps', ' '.join(vardeps))
-        d.appendVarFlag('do_image_%s' % t, 'vardepsexclude', 'DATETIME')
-
-        bb.debug(2, "Adding type %s before %s, after %s" % (t, 'do_image_complete', after))
-        bb.build.addtask('do_image_%s' % t, 'do_image_complete', after, d)
+        task = "do_image_%s" % t.replace("-", "_").replace(".", "_")
+
+        d.setVar(task, '\n'.join(cmds))
+        d.setVarFlag(task, 'func', '1')
+        d.setVarFlag(task, 'fakeroot', '1')
+        d.setVarFlag(task, 'prefuncs', debug + 'set_image_size')
+        d.setVarFlag(task, 'postfuncs', 'create_symlinks')
+        d.setVarFlag(task, 'subimages', ' '.join(subimages))
+        d.appendVarFlag(task, 'vardeps', ' '.join(vardeps))
+        d.appendVarFlag(task, 'vardepsexclude', 'DATETIME')
+
+        bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
+        bb.build.addtask(task, 'do_image_complete', after, d)
 }
 
 #
-- 
2.1.4


