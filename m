Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UdzFd-0001C7-Dc
	for openembedded-core@lists.openembedded.org;
	Sun, 19 May 2013 10:45:58 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so3289606eei.34
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 01:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=nYaKkVe6romCVkncxLBGtoU8hjpFMNwci6aZ2562lQM=;
	b=GBC/VWlZu8Vu5Uluj7/+v1+FxaREd+6hs5GhkBkl+L1MmZDbLE+y4oz4Ab+snmbg07
	oClnZ1Fa7KWhV6w9hb4C0Fl4420zlIKjDN+O2v3jB21Wk/yGACASwOQ2y+D7qzQn4Dwg
	54p/Hqkke0b+l4dv9QXSYTy0Z1RqNu6rutTFEw6bad4beKhlAgkKsM9R96PJ4FgE2dDw
	VTUgih+Oa6J20Y3ipHKGjAagnCCnIesa7RIVy5Gisf/viD2e60hwSxENK36MP41zvyu4
	5+PQzIwcVqhfJyds9Zv8pLAH1tcm+F2DBon0eJFLM1xN8+jSEX8abLGa6MYWI17xTzVm
	Cp6g==
X-Received: by 10.14.5.5 with SMTP id 5mr151705393eek.21.1368952059239;
	Sun, 19 May 2013 01:27:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	s8sm30235590eeo.4.2013.05.19.01.27.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 19 May 2013 01:27:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 May 2013 10:27:36 +0200
Message-Id: <1368952056-26629-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <20130519082432.GD3196@jama>
References: <20130519082432.GD3196@jama>
Subject: [PATCH] pixman: temporary disable thumb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 May 2013 08:46:04 -0000

* building with thumb triggers ICE with gcc-4.8
OE @ ~/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/pixman/1_0.29.4-r0/pixman-0.29.4/test $ make
../arm-oe-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-oe-linux-gnueabi-gcc  -march=armv5te -mthumb -mthumb-interwork
--sysroot=/OE/oe-core/tmp-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I..  -I../pixman -I../pixman
-I/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/include/libpng16    -O2 -pipe -g -feliminate-unused-debug-types -Wall -fno-strict-aliasing -fvisibility=hidden
-c -o utils-prng.lo utils-prng.c
arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=armv5te -mthumb -mthumb-interwork --sysroot=/OE/oe-core/tmp-eglibc/sysroots/qemuarm
-DHAVE_CONFIG_H -I. -I.. -I../pixman -I../pixman -I/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/include/libpng16 -O2 -pipe -g -feliminate-unused-debug-types
-Wall -fno-strict-aliasing -fvisibility=hidden -c utils-prng.c  -fPIC -DPIC -o .libs/utils-prng.o
utils-prng.c: In function 'prng_srand_r':
utils-prng.c:73:1: internal compiler error: Segmentation fault
 }
 ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
make: *** [utils-prng.lo] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb
index b1bd557..7cc5a74 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb
@@ -23,6 +23,8 @@ NEON = " --disable-arm-neon "
 NEON_armv7a = " "
 NEON_armv7a-vfp-neon = " "
 
+ARM_INSTRUCTION_SET = "arm"
+
 EXTRA_OECONF = "--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
 EXTRA_OECONF_class-native = "--disable-gtk"
 
-- 
1.8.2.1



