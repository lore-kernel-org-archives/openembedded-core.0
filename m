Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id DA47E60043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 05:56:07 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so203515997pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 21:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IKRlsIveLCm7z5Fz90VnQFszOyThK1emG0x/JqX90dg=;
	b=RVL0LiamwaNH16MvuFVox3DERZGE+uszdIYxPFsM3R1NQWdw08X3BPJgF7G8HW2FwU
	y8Vu523kB6X02WYPGgh680JpoV9nChUrYMXTkZRkTquFVXQtjTHLNK7fJ5tpMhVRABP0
	YzzTrgnSg3yr2267ysy830lHDwNTEfcm/74nlfYQx9jZMl5ROHt30UGJJayg9/22pt1f
	zldNPltn+Ea+h6RVOxIhhNflVIHoUk8jVkVgx9XfmMU2PUpXZwMr79aMWx4SFukkmBZH
	vi47eyvLRGBGKYAioFSdG1B4oHMINjuWyn2iEaq9MA1lnG9TuVIm/j2Alizmu+7ZITKP
	+Cdw==
X-Received: by 10.66.249.37 with SMTP id yr5mr60114392pac.24.1447739767627;
	Mon, 16 Nov 2015 21:56:07 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ij3sm4683691pbb.62.2015.11.16.21.56.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 21:56:06 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Nov 2015 21:56:00 -0800
Message-Id: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] directfb.inc: force bfd linker for armv7a
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
X-List-Received-Date: Tue, 17 Nov 2015 05:56:10 -0000

Workaround for linker errors seen with armv7a + gold:

 | ../arm-rdk-linux-gnueabi-libtool  --tag=CC   --mode=link arm-rdk-linux-gnueabi-gcc  -march=armv7-a -mfloat-abi=hard -mtune=cortex-a15 --sysroot=.../build/tmp/sysroots/eos -I.../build/tmp/sysroots/eos/usr/include/freetype2 -I.../build/tmp/sysroots/eos/usr/include/libpng16 -Wall -Wstrict-prototypes -Wmissing-prototypes -Wno-strict-aliasing -Werror-implicit-function-declaration -O3 -g2 -ffast-math -pipe -O2 -pipe -g -feliminate-unused-debug-types -D_GNU_SOURCE  -std=gnu99 -Werror-implicit-function-declaration  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o directfb-csource directfb-csource.o -lpng16 -ldl -lrt -lpthread
 | arm-rdk-linux-gnueabi-libtool: link: arm-rdk-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=hard -mtune=cortex-a15 --sysroot=.../build/tmp/sysroots/eos -I.../build/tmp/sysroots/eos/usr/include/freetype2 -I.../build/tmp/sysroots/eos/usr/include/libpng16 -Wall -Wstrict-prototypes -Wmissing-prototypes -Wno-strict-aliasing -Werror-implicit-function-declaration -O3 -g2 -ffast-math -pipe -O2 -pipe -g -feliminate-unused-debug-types -D_GNU_SOURCE -std=gnu99 -Werror-implicit-function-declaration -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o directfb-csource directfb-csource.o  .../build/tmp/sysroots/eos/usr/lib/libpng16.so -lz -lm -ldl -lrt -lpthread
 | .../build/tmp/sysroots/x86_64-linux/usr/bin/arm-rdk-linux-gnueabi/../../libexec/arm-rdk-linux-gnueabi/gcc/arm-rdk-linux-gnueabi/5.2.0/ld: error: directfb-csource.o: requires unsupported dynamic reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
 | collect2: error: ld returned 1 exit status

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc | 3 +++
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
1.9.1


