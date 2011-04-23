Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWO0-0005Br-Hj
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:32:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2011 23:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="632967537"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2011 23:29:01 -0700
Message-Id: <09a55b1d4354531afe692f2618bd4fa5bf2dec74.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 16:34:05 -0700
Date: Fri, 22 Apr 2011 23:29:00 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 09/37] qemu: disable sdl for target build
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
X-List-Received-Date: Sat, 23 Apr 2011 06:32:08 -0000

From: Saul Wold <sgw@linux.intel.com>

This allows qemu  to build for the target in the world build.
Not sure this would make sense to run on the target.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 412bdfd..362e9f3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -8,9 +8,13 @@ QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
 require qemu-targets.inc
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --enable-kvm --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370"
+SDL ?= "--disable-sdl"
+SDL_virtclass-native ?= ""
+SDL_virtclass-nativesdk ?= ""
 
-#EXTRA_OECOF += "--disable-sdl"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --enable-kvm --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL}"
+
+#EXTRA_OECONF += "--disable-sdl"
 
 inherit autotools
 
-- 
1.7.1.1



