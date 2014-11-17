Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 00BE272053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 20:10:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Nov 2014 12:07:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,404,1413270000"; d="scan'208";a="609301540"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 17 Nov 2014 12:09:39 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Nov 2014 22:09:31 +0200
Message-Id: <559c5c54bd21519f11dfb94a055ee4f14fc582b3.1416254938.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1416254938.git.cristian.iorga@intel.com>
References: <cover.1416254938.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1416254938.git.cristian.iorga@intel.com>
References: <cover.1416254938.git.cristian.iorga@intel.com>
Subject: [PATCH 3/3] iproute2: upgrade to 3.17.0
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
X-List-Received-Date: Mon, 17 Nov 2014 20:10:03 -0000

0001-ip-link-Remove-unnecessary-device-checking.patch removed,
included upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...p-link-Remove-unnecessary-device-checking.patch | 35 ----------------------
 .../{iproute2_3.16.0.bb => iproute2_3.17.0.bb}     |  5 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remove-unnecessary-device-checking.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_3.16.0.bb => iproute2_3.17.0.bb} (58%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remove-unnecessary-device-checking.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remove-unnecessary-device-checking.patch
deleted file mode 100644
index 0305a70..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remove-unnecessary-device-checking.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 38790ccf7bd0e6eab78024ec381fd98d7c6a2782 Mon Sep 17 00:00:00 2001
-From: vadimk <vadim4j@gmail.com>
-Date: Sat, 30 Aug 2014 15:06:00 +0300
-Subject: [PATCH] ip link: Remove unnecessary device checking
-
-The real checking is performed later in iplink_modify(..) func which
-checks device existence if NLM_F_CREATE flag is set.
-
-Also it fixes the case when impossible to add veth link which was
-caused by 9a02651a87 (ip: check for missing dev arg when doing VF rate)
-because these devices are not exist yet.
-
-Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
-Acked-by: Oliver Hartkopp <socketcan@hartkopp.net>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
----
- ip/iplink.c |    2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/ip/iplink.c b/ip/iplink.c
-index 1a907d9..ea06871 100644
---- a/ip/iplink.c
-+++ b/ip/iplink.c
-@@ -593,8 +593,6 @@ int iplink_parse(int argc, char **argv, struct iplink_req *req,
- 				duparg2("dev", *argv);
- 			*dev = *argv;
- 			dev_index = ll_name_to_index(*dev);
--			if (dev_index == 0)
--				invarg("Unknown device", *argv);
- 		}
- 		argc--; argv++;
- 	}
--- 
-1.7.10.4
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.17.0.bb
similarity index 58%
rename from meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.17.0.bb
index 39fe9c8..d12b33f 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.17.0.bb
@@ -3,10 +3,9 @@ require iproute2.inc
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
-           file://0001-ip-link-Remove-unnecessary-device-checking.patch \
           "
-SRC_URI[md5sum] = "6c823b40fdcfa7b8120743349a52ac18"
-SRC_URI[sha256sum] = "1f0a8a6c0e872166f75433f5cbf9766f3002b5c2f13501b3bb8c51846a127b79"
+SRC_URI[md5sum] = "b741a02c6dda5818d18011d572874493"
+SRC_URI[sha256sum] = "09e406636e7598e46d5d4f7b928bf5db57049d65dbeb9a496005957ee16f6000"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.1.0


