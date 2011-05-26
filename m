Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QPhQP-0007Ly-0O
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 22:44:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 13:41:48 -0700
X-ExtLoop1: 1
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2011 13:41:48 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	elizabeth.flanagan@intel.com
Date: Thu, 26 May 2011 13:41:44 -0700
Message-Id: <03152273cac84eef23738c5f26c45b082194284f.1306442263.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.5
In-Reply-To: <cover.1306442263.git.nitin.a.kamble@intel.com>
References: <cover.1306442263.git.nitin.a.kamble@intel.com>
Subject: [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
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
X-List-Received-Date: Thu, 26 May 2011 20:44:57 -0000

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
 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
index b77df2c..051bd72 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
@@ -17,3 +17,6 @@ PE = "1"
 PR = "r0"
 
 EXTRA_OECONF += "--with-driver=xlib"
+
+# nullify -O2
+CFLAGS_append += " -O"
-- 
1.7.3.5



