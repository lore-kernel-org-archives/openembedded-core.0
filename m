Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BCAE973179
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7EuV2025219
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:56 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:56 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:20 -0800
Message-ID: <0f0f16d3955f1428d1691a4edfe48cf00defed21.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/40] directfb.inc: force bfd linker for armv7a
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:56 -0000
Content-Type: text/plain

From: Andre McCurdy <armccurdy@gmail.com>

Workaround for linker errors seen with armv7a + gold:

 | ../arm-rdk-linux-gnueabi-libtool  --tag=CC   --mode=link arm-rdk-linux-gnueabi-gcc  -march=armv7-a -mfloat-abi=hard -mtune=cortex-a15 --sysroot=.../build/tmp/sysroots/eos -I.../build/tmp/sysroots/eos/usr/include/freetype2 -I.../build/tmp/sysroots/eos/usr/include/libpng16 -Wall -Wstrict-prototypes -Wmissing-prototypes -Wno-strict-aliasing -Werror-implicit-function-declaration -O3 -g2 -ffast-math -pipe -O2 -pipe -g -feliminate-unused-debug-types -D_GNU_SOURCE  -std=gnu99 -Werror-implicit-function-declaration  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o directfb-csource directfb-csource.o -lpng16 -ldl -lrt -lpthread
 | arm-rdk-linux-gnueabi-libtool: link: arm-rdk-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=hard -mtune=cortex-a15 --sysroot=.../build/tmp/sysroots/eos -I.../build/tmp/sysroots/eos/usr/include/freetype2 -I.../build/tmp/sysroots/eos/usr/include/libpng16 -Wall -Wstrict-prototypes -Wmissing-prototypes -Wno-strict-aliasing -Werror-implicit-function-declaration -O3 -g2 -ffast-math -pipe -O2 -pipe -g -feliminate-unused-debug-types -D_GNU_SOURCE -std=gnu99 -Werror-implicit-function-declaration -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o directfb-csource directfb-csource.o  .../build/tmp/sysroots/eos/usr/lib/libpng16.so -lz -lm -ldl -lrt -lpthread
 | .../build/tmp/sysroots/x86_64-linux/usr/bin/arm-rdk-linux-gnueabi/../../libexec/arm-rdk-linux-gnueabi/gcc/arm-rdk-linux-gnueabi/5.2.0/ld: error: directfb-csource.o: requires unsupported dynamic reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
 | collect2: error: ld returned 1 exit status

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/directfb/directfb.inc |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 446aaea..cbd4014 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -22,6 +22,9 @@ S = "${WORKDIR}/DirectFB-${PV}"
 
 LDFLAGS_append =" -lts -lm"
 
+# Workaround for linking issues seen with armv7a + gold
+LDFLAGS_append_armv7a = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+
 BINCONFIG = "${bindir}/directfb-config"
 
 inherit autotools binconfig-disabled pkgconfig
-- 
1.7.9.5


