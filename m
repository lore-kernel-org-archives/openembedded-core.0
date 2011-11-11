Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu4f-0005YU-Jl
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:35:29 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WoS0cn1eKjBV7G8qwf0BQZCpZA3R7jWbQSsvfUdF2jE=;
	b=tl5PLVzh5uzVjefv3yEqkSC74/DTpZbyUz/hZ6TTktkAOzxKh3gn9r3N95U9ymOjb1
	RFeaYvSk0ZBc4YDIMlV7yecDr882cjyOXR88MbpDL1iJSCrzGxump23Ei95cIBfQvSf/
	qY/aOu70EOBpFYHtPvA2ipacXKbrdHVOpXyMw=
Received: by 10.204.154.151 with SMTP id o23mr8839717bkw.62.1321028953939;
	Fri, 11 Nov 2011 08:29:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id by2sm1764504bkb.15.2011.11.11.08.29.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:29:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:38 +0100
Message-Id: <53c36b587f93507a6a41a6f6e7760af585e59f82.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 02/22] libatomics-ops: force ARM mode
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
X-List-Received-Date: Fri, 11 Nov 2011 16:35:29 -0000

* otherwise ie spitz (armv5te) build fails with:
| make[3]: Entering directory `/OE/shr-core/tmp/work/armv5te-oe-linux-gnueabi/libatomics-ops-1.2-r5/libatomic_ops-1.2/src'
| arm-oe-linux-gnueabi-gcc  -march=armv5te  -mthumb -mthumb-interwork  -mtune=xscale --sysroot=/OE/shr-core/tmp/sysroots/spitz -DHAVE_CONFIG_H -I.    -fPIC -O
2 -pipe -g -feliminate-unused-debug-types -DNDEBUG -c atomic_ops.c
| arm-oe-linux-gnueabi-gcc  -march=armv5te  -mthumb -mthumb-interwork  -mtune=xscale --sysroot=/OE/shr-core/tmp/sysroots/spitz -DHAVE_CONFIG_H -I.    -fPIC -O
2 -pipe -g -feliminate-unused-debug-types -DNDEBUG -c atomic_ops_stack.c
| arm-oe-linux-gnueabi-gcc  -march=armv5te  -mthumb -mthumb-interwork  -mtune=xscale --sysroot=/OE/shr-core/tmp/sysroots/spitz -DHAVE_CONFIG_H -I.    -fPIC -O
2 -pipe -g -feliminate-unused-debug-types -DNDEBUG -c atomic_ops_malloc.c
| atomic_ops_malloc.c: In function 'msb':
| atomic_ops_malloc.c:223:2: warning: right shift count >= width of type [enabled by default]
| rm -f libatomic_ops_gpl.a
| ar cru libatomic_ops_gpl.a atomic_ops_stack.o atomic_ops_malloc.o
| arm-oe-linux-gnueabi-ranlib libatomic_ops_gpl.a
| {standard input}: Assembler messages:
| {standard input}:286: Error: selected processor does not support Thumb mode `swp r1,r2,[r3]'
| {standard input}:329: Error: selected processor does not support Thumb mode `swp r0,r1,[r3]'

* this is just work around, proper fix proposed by Henning Heinold
  hm we should think of reworking this recipe now. Because since gcc 4.5
  pulseaudio for arm can use the gcc internal atomicstuff and in oe-core
  and meta-oe we have 4.5 or 4.6 only. The lib is
  only needed for mips and it is still the old release, on cvs
  is a much better version, which supports thumb too, if
  remember correctly.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pulseaudio/libatomics-ops_1.2.bb               |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
index ab7ccbe..c84917a 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2 & MIT"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab \
 		   "
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-${PV}.tar.gz \
            file://fedora/libatomic_ops-1.2-ppclwzfix.patch \
@@ -20,6 +20,8 @@ S = "${WORKDIR}/libatomic_ops-${PV}"
 
 ALLOW_EMPTY_${PN} = "1"
 
+ARM_INSTRUCTION_SET = "arm"
+
 inherit autotools pkgconfig
 
 do_install_append() {
-- 
1.7.8.rc1



