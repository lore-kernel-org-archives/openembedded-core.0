Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UI24w-0005cq-I9
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 20:20:10 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 19 Mar 2013 12:03:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,873,1355126400"; d="scan'208";a="216561669"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.175])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Mar 2013 12:03:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 12:03:18 -0700
Message-Id: <1363719798-9369-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] alsa-tools: add patch for mips since it does not have io.h
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
X-List-Received-Date: Tue, 19 Mar 2013 19:20:11 -0000

[YOCTO #4051]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../alsa/alsa-tools/mips_has_no_io_h.patch                  | 13 +++++++++++++
 meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb         |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch b/meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch
new file mode 100644
index 0000000..7083cb2
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch
@@ -0,0 +1,13 @@
+Index: alsa-tools-1.0.26.1/hda-verb/hda-verb.c
+===================================================================
+--- alsa-tools-1.0.26.1.orig/hda-verb/hda-verb.c
++++ alsa-tools-1.0.26.1/hda-verb/hda-verb.c
+@@ -13,7 +13,7 @@
+ #include <ctype.h>
+ #include <unistd.h>
+ #include <sys/ioctl.h>
+-#ifndef __PPC__
++#if __PPC__ || __MIPS__
+ #include <sys/io.h>
+ #endif
+ #include <sys/types.h>
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
index 0fe4bee..2b46aaf 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
                     file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
+           file://mips_has_no_io_h.patch \
            file://autotools.patch"
 
 SRC_URI[md5sum] = "805526ea5d6c40e1f2c94cee86141230"
-- 
1.8.0.2



