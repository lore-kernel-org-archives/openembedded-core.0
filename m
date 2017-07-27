Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 25B8078312
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 14:26:08 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 27 Jul 2017 07:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,419,1496127600"; d="scan'208";a="112608028"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 27 Jul 2017 07:26:10 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id CB4285809E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 07:26:09 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 17:02:46 +0300
Message-Id: <613e850ee279ba7b20d14bd6380f5ce735ea7757.1501162988.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1501162988.git.ed.bartosh@linux.intel.com>
References: <cover.1501162988.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v4 5/6] wic: add /boot mount point to fstab by default
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
X-List-Received-Date: Thu, 27 Jul 2017 14:26:09 -0000

wic avoided adding /boot to fstab for no reason.
This exception was hardcoded in the wic code.

There is no need for this as mountpoint in .wks file is an optional
field. It can be used only if user wants to have partitions
automatically mounted on system boot.

[YOCTO #11662]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 07e3f3e..61500ab 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -133,7 +133,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint in ("/", "/boot"):
+               or part.mountpoint == "/":
                 continue
 
             # mmc device partitions are named mmcblk0p1, mmcblk0p2..
-- 
2.1.4


