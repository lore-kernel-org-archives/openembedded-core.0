Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhT-0008Qi-1M
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:11 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197477"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:40 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:23 -0800
Message-Id: <39a60d4f0ca8e88514114c0666df0305e51e7356.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/36] bluez4: Fix build on x86/amd64 with gcc 4.7
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:11 -0000

From: Khem Raj <raj.khem@gmail.com>

gcc figures an impossible asm contraint
in inline asm which it is correct about

"i" requires the operand to be a compile-time constant
but memory location of a multi-dimensional array isn't constant
at compile time.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../bluez/bluez4-4.98/sbc_mmx.patch                |   24 ++++++++++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.98.bb     |    6 +++-
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.98/sbc_mmx.patch

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.98/sbc_mmx.patch b/meta/recipes-connectivity/bluez/bluez4-4.98/sbc_mmx.patch
new file mode 100644
index 0000000..98fab45
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4-4.98/sbc_mmx.patch
@@ -0,0 +1,24 @@
+on x86 and x86_64 gcc 4.7 complains
+
+sbc/sbc_primitives_mmx.c: In function 'sbc_calc_scalefactors_mmx':
+sbc/sbc_primitives_mmx.c:294:4: warning: asm operand 2 probably doesn't match constraints [enabled by default]
+sbc/sbc_primitives_mmx.c:294:4: error: impossible constraint in 'asm'
+
+This patch is taken from https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/911871
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: bluez-4.98/sbc/sbc_primitives_mmx.c
+===================================================================
+--- bluez-4.98.orig/sbc/sbc_primitives_mmx.c	2011-12-21 14:53:54.000000000 -0800
++++ bluez-4.98/sbc/sbc_primitives_mmx.c	2012-02-24 10:07:03.422073800 -0800
+@@ -318,7 +318,7 @@
+ 				"movl          %k0, 4(%3)\n"
+ 			: "+r" (blk)
+ 			: "r" (&sb_sample_f[0][ch][sb]),
+-				"i" ((char *) &sb_sample_f[1][0][0] -
++				"r" ((char *) &sb_sample_f[1][0][0] -
+ 					(char *) &sb_sample_f[0][0][0]),
+ 				"r" (&scale_factor[ch][sb]),
+ 				"r" (&consts),
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.98.bb b/meta/recipes-connectivity/bluez/bluez4_4.98.bb
index 62de1fe..2412b1b 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.98.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.98.bb
@@ -1,8 +1,10 @@
 require bluez4.inc
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI += "file://bluetooth.conf"
+SRC_URI += "file://bluetooth.conf \
+            file://sbc_mmx.patch \
+           "
 
 SRC_URI[md5sum] = "362864b716950baa04797de735fc237b"
 SRC_URI[sha256sum] = "9a5b655bada7c7a1921cb3bac83b8a32bbe49893e4c7a1377cdc1b0d35f7d233"
-- 
1.7.7.6



