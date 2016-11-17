Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C37FF719F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 20:49:55 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1c7Td6-0007Bp-Hf from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2016 12:49:56 -0800
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 17 Nov 2016 12:49:53 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2016 14:49:51 -0600
Message-ID: <1479415791-28938-1-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH] busybox: enable fractional sleep arguments
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
X-List-Received-Date: Thu, 17 Nov 2016 20:49:55 -0000
Content-Type: text/plain

Fractional durations (e.g. 0.5s) for the sleep command are useful and
not terribly uncommon in practice, especially in scripts associated
with test cases (e.g. mdadm, lttng-tools).  Enable FEATURE_FLOAT_SLEEP
by default in order to avoid having to patch every instance of a
script using a fractional sleep.

The busybox binary gains a few hundred bytes in text (armv5e shown):

$ size -x busybox.nosuid.{before,after}
   text	   data	    bss	    dec	    hex	filename
0x89382	  0x71d	 0x2250	 572655	  8bcef	busybox.nosuid.before
0x8954e	  0x721	 0x2250	 573119	  8bebf	busybox.nosuid.after

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index c0459d59612b..cbdb1391fd33 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -279,7 +279,7 @@ CONFIG_SEQ=y
 # CONFIG_SHA3SUM is not set
 CONFIG_SLEEP=y
 CONFIG_FEATURE_FANCY_SLEEP=y
-# CONFIG_FEATURE_FLOAT_SLEEP is not set
+CONFIG_FEATURE_FLOAT_SLEEP=y
 CONFIG_SORT=y
 CONFIG_FEATURE_SORT_BIG=y
 # CONFIG_SPLIT is not set
-- 
2.7.4


