Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHAO9-0003FZ-Lf
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:23:37 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so4820551bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 01:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Mz2/ambmGRrDxZtnB+81+IQB33lHokt6/B6sXab09C4=;
	b=hKhR9PoBcoXqUc5iMruWjFglB5y6sGLRhXTIpvYwrV2xx3lUSvyCUo3FOXeqIMrl4x
	17OOg59/ZMvpJnZUe/T/Z0U4jsU6z53Gjjf86R4jSo/KYZ1lDR7vNSBXKAT8jOB/9YH2
	dPAxKuDmIpL2gfSw8/ZvZ87PZ9Faij8t8HiZY=
Received: by 10.204.138.88 with SMTP id z24mr10099688bkt.17.1319185066661;
	Fri, 21 Oct 2011 01:17:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u10sm12534940bkv.3.2011.10.21.01.17.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 01:17:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 10:17:25 +0200
Message-Id: <22ed6acc0a44d9bc0d6f7a2e800c039d77d75477.1319184832.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
References: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319184832.git.Martin.Jansa@gmail.com>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/8] libatomics-ops: force ARM mode
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
X-List-Received-Date: Fri, 21 Oct 2011 08:23:37 -0000

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

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pulseaudio/libatomics-ops_1.2.bb               |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
index 05b22e8..4d9ca0d 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
@@ -20,4 +20,6 @@ S = "${WORKDIR}/libatomic_ops-${PV}"
 
 ALLOW_EMPTY_${PN} = "1"
 
+ARM_INSTRUCTION_SET = "arm"
+
 inherit autotools pkgconfig
-- 
1.7.7



