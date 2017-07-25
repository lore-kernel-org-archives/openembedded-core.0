Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 848877833F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 11:50:07 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2017 04:50:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,411,1496127600"; d="scan'208";a="111737091"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 25 Jul 2017 04:50:09 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 918B058011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 04:50:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 14:26:40 +0300
Message-Id: <17899b45e618b370cafae5801aa16438356ce6db.1500981812.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1500981812.git.ed.bartosh@linux.intel.com>
References: <cover.1500981812.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 5/6] wic: add /boot mount point to fstab by default
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
X-List-Received-Date: Tue, 25 Jul 2017 11:50:08 -0000

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
index 4f441c1..0a65a9c 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -135,7 +135,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint in ("/", "/boot"):
+               or part.mountpoint == "/":
                 continue
 
             # mmc device partitions are named mmcblk0p1, mmcblk0p2..
-- 
2.1.4


