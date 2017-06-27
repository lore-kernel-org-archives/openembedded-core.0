Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 44AC777FC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 10:00:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 03:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,399,1493708400"; d="scan'208";a="117879536"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 27 Jun 2017 03:00:30 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 20BFD58058D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 03:00:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 12:57:40 +0300
Message-Id: <9a21869b7f6461d47c9444ad067b609d75bb8b35.1498557396.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1498557396.git.ed.bartosh@linux.intel.com>
References: <cover.1498557396.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 6/7] wic: add /boot mount point to fstab by default
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
X-List-Received-Date: Tue, 27 Jun 2017 10:00:29 -0000

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
index e90f9f9..f6f29aa 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -134,7 +134,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint in ("/", "/boot"):
+               or part.mountpoint == "/":
                 continue
 
             # mmc device partitions are named mmcblk0p1, mmcblk0p2..
-- 
2.1.4


