Return-Path: <max.eliaser@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 76456710DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 17:36:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2014 10:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,405,1406617200"; d="scan'208";a="593594931"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.68])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2014 10:36:54 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 10:34:11 -0700
Message-Id: <ef8574dfdd5992bdd42b788a909d0610d8b23b21.1409074419.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1409074419.git.max.eliaser@intel.com>
References: <cover.1409074419.git.max.eliaser@intel.com>
In-Reply-To: <cover.1409074419.git.max.eliaser@intel.com>
References: <cover.1409074419.git.max.eliaser@intel.com>
Subject: [PATCH 3/5] qemux86: support X11 when QEMU is emulating a different GPU than vmware
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
X-List-Received-Date: Tue, 26 Aug 2014 17:36:59 -0000

QEMU is capable of emulating four different VGA adapters: cirrus, std, vmware,
and QXL. By adding the cirrus and fbdev X.Org drivers to the qemux86 image,
the image can be made to launch an X server on when cirrus and std are chosen,
in addition to just vmware. (The build of QEMU in OE-Core appears to have QXL
disabled, meaning a driver for it is unnecessary.)

The runqemu script now allows the choice of emulated VGA adapter to be
specified manually, so it's important that qemux86 supports any configuration
the user might choose without requiring the image to be rebuilt.

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 meta/conf/machine/qemux86.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index ebc27db..3562276 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -19,6 +19,8 @@ XSERVER = "xserver-xorg \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
+           xf86-video-cirrus \
+           xf86-video-fbdev \
            xf86-video-vmware"
 
 MACHINE_FEATURES += "x86"
-- 
1.8.3.2


