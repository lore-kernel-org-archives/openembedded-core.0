Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 863E47689C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:04:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 25 Aug 2015 02:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,744,1432623600"; d="scan'208";a="790452418"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 25 Aug 2015 02:04:58 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 304786A4083;
	Tue, 25 Aug 2015 02:04:07 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:04:28 +0300
Message-Id: <c09f7a4f0ab7ac0f57eddb927d77e4ed55881388.1440492980.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
References: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440492980.git.ed.bartosh@linux.intel.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 17/17] image.py: add script output to the rootfs log
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
X-List-Received-Date: Tue, 25 Aug 2015 09:05:00 -0000

Let's add output of image creation script to the bitbake log
as it can contain useful information.

One good example of such an information is wic report about
artifacts and .wks file used for image creation.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/image.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 7f82748..6f57df2 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -11,11 +11,14 @@ def generate_image(arg):
             (type, create_img_cmd))
 
     try:
-        subprocess.check_output(create_img_cmd, stderr=subprocess.STDOUT)
+        output = subprocess.check_output(create_img_cmd,
+                                         stderr=subprocess.STDOUT)
     except subprocess.CalledProcessError as e:
         return("Error: The image creation script '%s' returned %d:\n%s" %
                (e.cmd, e.returncode, e.output))
 
+    bb.note("Script output:\n%s" % output)
+
     return None
 
 
-- 
2.1.4


