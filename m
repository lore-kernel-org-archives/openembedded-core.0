Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoFh-00022z-56
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:34:37 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055116"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:27:53 -0800
Message-Id: <527ce4a07104405fa3832ed99d6b21fca83052a2.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/21] libatomics-ops: force ARM mode
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
X-List-Received-Date: Mon, 14 Nov 2011 04:34:37 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

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
 .../pulseaudio/libatomics-ops_1.2.bb               |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
index ab7ccbe..e5432f7 100644
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
-- 
1.7.6.4



