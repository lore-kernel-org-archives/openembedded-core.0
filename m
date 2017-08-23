Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 80B0D78044
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 22:47:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 23 Aug 2017 15:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,417,1498546800"; d="scan'208";a="1007026273"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 23 Aug 2017 15:47:29 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 15:47:28 -0700
Message-Id: <20170823224728.7575-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH] initramfs-framework/setup-live: quote bootparam_root variable
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
X-List-Received-Date: Wed, 23 Aug 2017 22:47:28 -0000

When bootparam_root was empty the if statement would resolve into
invalid syntax instead of short circuiting after the -z, causing a boot
failure.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
I stupidly didn't test an empty root parameter with my previous patch
and just assumed the -z $bootparam_root would still work. I was wrong.

Rest assured this patch was tested with all three cases: an empty root
parameter, root=/dev/ram0, and a valid PARTUUID.

 meta/recipes-core/initrdscripts/initramfs-framework/setup-live | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
index b98a321..4c79f41 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
@@ -12,7 +12,7 @@ ISOLINUX=""
 ROOT_DISK=""
 shelltimeout=30
 
-	if [ -z $bootparam_root -o $bootparam_root = "/dev/ram0" ]; then
+	if [ -z "$bootparam_root" -o "$bootparam_root" = "/dev/ram0" ]; then
 		echo "Waiting for removable media..."
 		C=0
 		while true
-- 
2.9.5


