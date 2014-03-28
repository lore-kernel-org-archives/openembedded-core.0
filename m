Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ADA726E7D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 13:08:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2014 06:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,751,1389772800"; d="scan'208";a="501659917"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 28 Mar 2014 06:07:44 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Mar 2014 15:07:40 +0200
Message-Id: <52dc7313677c1fe5e609d0e38d60c7f842e94d55.1396012002.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1396012002.git.laurentiu.palcu@intel.com>
References: <cover.1396012002.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1396012002.git.laurentiu.palcu@intel.com>
References: <cover.1396012002.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] image.py: check file exists before deleting
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
X-List-Received-Date: Fri, 28 Mar 2014 13:08:00 -0000

When RM_OLD_IMAGE = "1", we delete old images but we didn't check they
actually exist...

[YOCTO #6029]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/image.py |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index a03b73e..c9b9033 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -192,7 +192,8 @@ class Image(ImageDepGraph):
                 if img.find(self.d.getVar('IMAGE_LINK_NAME', True)) == 0:
                     img = os.path.join(deploy_dir, img)
                     if os.path.islink(img):
-                        if self.d.getVar('RM_OLD_IMAGE', True) == "1":
+                        if self.d.getVar('RM_OLD_IMAGE', True) == "1" and \
+                                os.path.exists(os.path.realpath(img)):
                             os.remove(os.path.realpath(img))
 
                         os.remove(img)
-- 
1.7.9.5


