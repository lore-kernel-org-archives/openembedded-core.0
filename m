Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIJ-0003re-8D
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:54:55 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:47:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86045454"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:47:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:39 -0800
Message-Id: <6487d9b35148c438fdfe16ec90c45f7189416399.1323643433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/26] mdadm: Make custom CC definition conditional
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
X-List-Received-Date: Sun, 11 Dec 2011 22:54:55 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

By hardcoding CC's definition in the Makefile, all the gcc parameters
set by tune settings are lost. Causing compile failure with x32 toolchain

As the bitbake defined CC is good, there is no need to redfine CC in the
make file, hence making the CC definition in the Makefile conditional.

This fixes bug: [YOCTO #1414]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |   24 ++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.2.2.bb         |    4 +-
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch

diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch b/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
new file mode 100644
index 0000000..79ba2cf
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
@@ -0,0 +1,24 @@
+UpstreamStatus: pending
+
+By hardcoding CC's definition in the Makefile, all the gcc parameters 
+set by tune settings are lost. Causing compile failure with x32 toolchain
+
+As the bitbake defined CC is good, there is no need to redfine CC in the 
+make file, hence making the CC definition in the Makefile conditional.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/07
+
+Index: mdadm-3.2.2/Makefile
+===================================================================
+--- mdadm-3.2.2.orig/Makefile
++++ mdadm-3.2.2/Makefile
+@@ -40,7 +40,8 @@ KLIBC=/home/src/klibc/klibc-0.77
+ 
+ KLIBC_GCC = gcc -nostdinc -iwithprefix include -I$(KLIBC)/klibc/include -I$(KLIBC)/linux/include -I$(KLIBC)/klibc/arch/i386/include -I$(KLIBC)/klibc/include/bits32
+ 
+-CC = $(CROSS_COMPILE)gcc
++CC ?= $(CROSS_COMPILE)gcc
++
+ CXFLAGS = -ggdb
+ CWFLAGS = -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter
+ ifdef WARN_UNUSED
diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
index 97878ed..02109e3 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
 	    file://0001-mdadm-fix-build-failures-ppc64.patch \
+	    file://mdadm-3.2.2_fix_for_x32.patch \
 	  "
 
 SRC_URI[md5sum] = "12ee2fbf3beddb60601fb7a4c4905651"
@@ -22,7 +23,6 @@ CFLAGS += "-fno-strict-aliasing"
 inherit autotools
 
 do_compile() {
-	export CROSS_COMPILE="${TARGET_PREFIX}"
 	oe_runmake
 }
 
-- 
1.7.6.4



