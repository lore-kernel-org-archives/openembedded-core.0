Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EE2C36FC33
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 00:09:07 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Jun 2014 17:09:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,984,1392192000"; d="scan'208";a="441514482"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO swold-linux.bigsur.com)
	([10.255.12.167])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2014 17:09:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jun 2014 17:09:03 -0700
Message-Id: <1402013345-24930-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>
References: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/4] busybox: put udhcpc in background
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
X-List-Received-Date: Fri, 06 Jun 2014 00:09:08 -0000

If the interface is slow to come up udhcpc will continue in the background

[YOCTO #6339]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/busybox/busybox.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 0c1969c..f6cb039 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -119,6 +119,7 @@ do_prepare_config () {
 	  {if(net==2&&$0 !~ /^#/&&$1){print("# "$1" is not set")}else{print}}' \
 		  ${S}/.config.oe-tmp > ${S}/.config
 	fi
+	sed -i 's/CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"/CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"/' ${S}/.config
 }
 
 # returns all the elements from the src uri that are .cfg files
-- 
1.8.3.1


