Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1D560116
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 03:28:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Nov 2017 19:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,470,1505804400"; 
   d="scan'208";a="7354124"
Received: from jskaggs5-mobl7.amr.corp.intel.com (HELO
	swold-mobl2.amr.intel.com) ([10.252.195.141])
	by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2017 19:28:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, bruce.ashfield@windriver.com
Date: Tue, 28 Nov 2017 19:28:18 -0800
Message-Id: <20171129032818.2545-2-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171129032818.2545-1-sgw@linux.intel.com>
References: <20171129032818.2545-1-sgw@linux.intel.com>
Subject: [PATCH 2/2] kernel-yocto: Stop the build if defconfig is missing
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
X-List-Received-Date: Wed, 29 Nov 2017 03:28:35 -0000

The bberror does not stop the build correctly, this should be a
bbfatal_log to ensure the failure correctly stops the build and logs
the failure.

Part of
[YOCTO #12162]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 98ec78fb768..2edf0fd1578 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -146,7 +146,7 @@ do_kernel_metadata() {
 	if [ -z "$bsp_definition" ]; then
 		echo "$sccs" | grep -q defconfig
 		if [ $? -ne 0 ]; then
-			bberror "Could not locate BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
+			bbfatal_log "Could not locate BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
 		fi
 	fi
 	meta_dir=$(kgit --meta)
-- 
2.13.6


