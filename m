Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1342A782EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 09:09:01 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 14 Jun 2017 02:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="113021625"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 14 Jun 2017 02:09:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 6509D5804B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 02:09:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 12:07:05 +0300
Message-Id: <202f15c7a6835bfc17f42bfa3b54d2282e68f8b9.1497430965.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497430965.git.ed.bartosh@linux.intel.com>
References: <cover.1497430965.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/3] image.bbclass: improve setup of flags
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
X-List-Received-Date: Wed, 14 Jun 2017 09:09:02 -0000

Replaced setVarFlag calls to appendVarFlag to allow
modification of prefuncs, postfuncs and subimages flags
in inherited image classes.

[YOCTO #11372]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ff4eda1..e18ac72 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -496,9 +496,10 @@ python () {
         d.setVar(task, '\n'.join(cmds))
         d.setVarFlag(task, 'func', '1')
         d.setVarFlag(task, 'fakeroot', '1')
-        d.setVarFlag(task, 'prefuncs', debug + 'set_image_size')
-        d.setVarFlag(task, 'postfuncs', 'create_symlinks')
-        d.setVarFlag(task, 'subimages', ' '.join(subimages))
+
+        d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
+        d.appendVarFlag(task, 'postfuncs', ' create_symlinks')
+        d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', 'DATETIME')
 
-- 
2.1.4


