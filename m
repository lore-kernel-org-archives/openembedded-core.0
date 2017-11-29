Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8DCA360116
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 03:28:34 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Nov 2017 19:28:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,470,1505804400"; 
   d="scan'208";a="7354118"
Received: from jskaggs5-mobl7.amr.corp.intel.com (HELO
	swold-mobl2.amr.intel.com) ([10.252.195.141])
	by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2017 19:28:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, bruce.ashfield@windriver.com
Date: Tue, 28 Nov 2017 19:28:17 -0800
Message-Id: <20171129032818.2545-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH 1/2] kernel-yocto: ensure sccs variable is set when using KBUILD_DEFCONFIG
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
X-List-Received-Date: Wed, 29 Nov 2017 03:28:34 -0000

When using KBUILD_DEFCONFIG, $sccs should be set to the $WORKDIR/defconfig
regardless if it compares or is copied. Otherwise $sccs is not set and the
defconfig is not found correctly.

Part of
[YOCTO #12162]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1d447951c49..98ec78fb768 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -110,8 +110,8 @@ do_kernel_metadata() {
 				fi
 			else
 				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
-				sccs="${WORKDIR}/defconfig"
 			fi
+			sccs="${WORKDIR}/defconfig"
 		else
 			bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
 		fi
-- 
2.13.6


