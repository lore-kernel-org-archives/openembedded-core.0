Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pxj7p-0004FV-SX
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Mar 2011 17:54:10 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Mar 2011 08:52:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,297,1297065600"; d="scan'208";a="718732201"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2011 08:52:24 -0800
Message-Id: <ed0283122b6867cc29d35bb6d0215935406073a4.1299775598.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299775598.git.sgw@linux.intel.com>
References: <cover.1299775598.git.sgw@linux.intel.com>
Old-Date: Thu, 10 Mar 2011 13:51:20 +0800
Date: Thu, 10 Mar 2011  8:52:22 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Dongxiao Xu <dongxiao.xu@intel.com>, Liping Ke <liping.ke@intel.com>
Subject: [PATCH 7/8] gst-plugins-bad: add missing dependency librsvg
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
X-List-Received-Date: Thu, 10 Mar 2011 16:54:10 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Defaultly gst-plugins-bad will configured with option --enable-rsvg.
Besides, it will check if librsvg really exists by certain configure
code.

Therefore there will be a certain race condition that, during
librsvg's populate_sysroot, gst-plugins-bad's do_compile will find
some header files are still not exists though its configure says the
library is supported.

Explicitly add librsvg as gst-plugins-bad's dependency could solve
this issue.

This fixes [YOCTO #831]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../gstreamer/gst-plugins-bad_0.10.20.bb           |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.20.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.20.bb
index 59e127c..239072d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.20.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.20.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://gst/qtmux/gstqtmuxmap.h;beginline=1;endline=19;md5=2da8f56a44697c1527c5a4bcf8d5d69b \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=71a904d99ce7ae0c1cf129891b98145c"
 
-DEPENDS += "gst-plugins-base libmusicbrainz tremor"
+DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg"
 
-PR = "r0"
+PR = "r1"
 
 inherit gettext
 
-- 
1.7.1.1



