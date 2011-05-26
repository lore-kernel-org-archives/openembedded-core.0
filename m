Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPjhg-0001hA-3c
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 01:10:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 16:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,276,1304319600"; 
   d="scan'208";a="5588287"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.104])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2011 16:07:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 16:07:40 -0700
Message-Id: <f2c9614a1c532a360cc7d36ceb2eb53a37db4ee4.1306451124.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306451124.git.sgw@linux.intel.com>
References: <cover.1306451124.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306451124.git.sgw@linux.intel.com>
References: <cover.1306451124.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 9/9] mesa-xlib: workaround gcc 4.6.0 ICE
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
X-List-Received-Date: Thu, 26 May 2011 23:10:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Fixes this bug [YOCTO #1105]

Working around this issue withg gcc 4.6.0 for beagleboard machine (armv7)

ccache arm-poky-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp -fno-tree-vectorize
--sysroot=/build_disk/poky_build/build0/tmp/sysroots/beagleboard -c -I.
-I../../../../src/gallium/include -I../../../../src/gallium/auxiliary
-I../../../../src/gallium/drivers
-I../../../../src/gallium/drivers/svga/include -O2 -pipe -g
-feliminate-unused-debug-types -Wall -Wmissing-prototypes -std=c99 -ffast-math
-fvisibility=hidden -fno-strict-aliasing -fPIC -D_GNU_SOURCE -DPTHREADS
-DHAVE_POSIX_MEMALIGN -DUSE_XSHM -std=gnu99 -fvisibility=hidden -DHAVE_STDINT_H
-DHAVE_SYS_TYPES_H svga_tgsi_insn.c -o svga_tgsi_insn.o
svga_tgsi_insn.c: In function 'svga_shader_emit_instructions':
svga_tgsi_insn.c:2969:1: internal compiler error: in push_minipool_fix, at
config/arm/arm.c:12084
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
make[4]: *** [svga_tgsi_insn.o] Error 1

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
index b77df2c..d9c3806 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
@@ -14,6 +14,10 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF += "--with-driver=xlib"
+
+# GCC 4.6.0 hits an internal compiler error using -O2 on beagleboard machine
+# use -O to nullify -O2 as a workaround.
+CFLAGS_append += " -O"
-- 
1.7.3.4



