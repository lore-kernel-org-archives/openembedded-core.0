Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RWZhA-0002KL-D1
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:26:56 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 12:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43396281"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 12:20:11 -0800
From: nitin.a.kamble@intel.com
To: hjl.tools@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:20:00 -0800
Message-Id: <b224881df056580c35e265c2b3db311a1f366409.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
References: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
Subject: [PATCH 02/11] mdadm: fix CC definition in the Makefile
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
X-List-Received-Date: Fri, 02 Dec 2011 20:26:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

By hardcoding CC's definition in the Makefile, all the gcc parameters
set by tune settings are lost. Causing compile failure with x32 toolchain

As the bitbake defined CC is good, there is no need to redfine CC in the
make file, hence removed it to fix the issue.

This fixes bug: [YOCTO #1414]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../mdadm/files/mdadm_fix_for_x32.patch            |   24 ++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.2.2.bb         |    3 +-
 2 files changed, 26 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm_fix_for_x32.patch

diff --git a/meta/recipes-extended/mdadm/files/mdadm_fix_for_x32.patch b/meta/recipes-extended/mdadm/files/mdadm_fix_for_x32.patch
new file mode 100644
index 0000000..898e70b
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm_fix_for_x32.patch
@@ -0,0 +1,24 @@
+UpstreamStatus: pending
+
+By hardcoding CC's definition in the Makefile, all the gcc parameters 
+set by tune settings are lost. Causing compile failure with x32 toolchain
+
+As the bitbake defined CC is good, there is no need to redfine CC in the 
+make file, hence removed it to fix the issue.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/12/01
+
+Index: mdadm-3.2.2/Makefile
+===================================================================
+--- mdadm-3.2.2.orig/Makefile
++++ mdadm-3.2.2/Makefile
+@@ -40,7 +40,7 @@ KLIBC=/home/src/klibc/klibc-0.77
+ 
+ KLIBC_GCC = gcc -nostdinc -iwithprefix include -I$(KLIBC)/klibc/include -I$(KLIBC)/linux/include -I$(KLIBC)/klibc/arch/i386/include -I$(KLIBC)/klibc/include/bits32
+ 
+-CC = $(CROSS_COMPILE)gcc
++#CC = $(CROSS_COMPILE)gcc
+ CXFLAGS = -ggdb
+ CWFLAGS = -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter
+ ifdef WARN_UNUSED
diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
index 97878ed..7e380ec 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
 	    file://0001-mdadm-fix-build-failures-ppc64.patch \
+	    file://mdadm_fix_for_x32.patch \
 	  "
 
 SRC_URI[md5sum] = "12ee2fbf3beddb60601fb7a4c4905651"
-- 
1.7.6.4



