Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QCCcp-0008Q7-Me
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Apr 2011 17:13:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Apr 2011 08:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,240,1301900400"; d="scan'208";a="681051038"
Received: from unknown (HELO localhost) ([10.255.12.227])
	by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2011 08:11:36 -0700
Message-Id: <1465094fd0cc3ac1be3073a0f44196f17f329b05.1303170477.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1303170477.git.dvhart@linux.intel.com>
References: <cover.1303170477.git.dvhart@linux.intel.com>
Old-Date: Mon, 18 Apr 2011 16:25:00 -0700
Date: Tue, 19 Apr 2011  8:11:36 -0700
To: openembedded-core@lists.openembedded.org
From: Darren Hart <dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/2] kernel: Copy over bzImage to sysroots during install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2011 15:14:00 -0000

From: Darren Hart <dvhart@linux.intel.com>

Fixes [Yocto #987]

The following commit introduced a build failure:

Commit 3b49416fc7a7ee9bfe722f2e6089aa18df41dc58
Author: Darren Hart <dvhart@linux.intel.com>
Date:   Tue Mar 8 17:09:10 2011 -0800
kernel/bbclass: rework kernel and module classes to allow for building
out-of-tree modules

Resulting in:
| install: cannot stat
`/usr/local/test/intel-bsp/build/tmp/sysroots/n450/kernel/bzImage': No such
file or directory
| ERROR: Function 'build_boot_bin' failed (see
/usr/local/test/intel-bsp/build/tmp/work/core2-poky-linux/poky-image-minimal-live-1.0-r0/temp/log.do_bootimg.1106
for further information)

The bzImage file was not being copied to sysroot, correct that.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3107790..c443285 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -136,6 +136,7 @@ kernel_do_install() {
 	if [ ! "${S}" == "${B}" ]; then
 		cp -fR ${S}/* $kerneldir
 	fi
+	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
 	echo "LINUX BUILD TREE COPIED TO SYSROOTS"
 	du -hs $kerneldir
 
-- 
1.7.3.4



