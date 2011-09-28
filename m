Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oIr-00041r-3i
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:37 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360934"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:38 -0700
Message-Id: <776942858cad072facc9b5fea618ee88ff56a3a8.1317193250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/29] blktrace: update to version 1.0.3
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:37 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This also removes dso_linking_change_build_fix.patch since the same
change has been made upstream.

Also removes unused SRC_URI checksums.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../blktrace/dso_linking_change_build_fix.patch    |   26 --------------------
 meta/recipes-kernel/blktrace/blktrace_git.bb       |   12 +++------
 2 files changed, 4 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/dso_linking_change_build_fix.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/dso_linking_change_build_fix.patch b/meta/recipes-kernel/blktrace/blktrace/dso_linking_change_build_fix.patch
deleted file mode 100644
index 5b74339..0000000
--- a/meta/recipes-kernel/blktrace/blktrace/dso_linking_change_build_fix.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-after gcc linking has changed, all the libraries must be explicitely specified 
-This patch avoids this linking error:
-
-| make[1]: Entering directory `/disk0/pokybuild/build1/tmp/work/i586-poky-linux/blktrace-1.0.1+git0+1e09f6e9012826fca69fa07222b7bc53c3e629ee-r1/git/btreplay'^M
-| ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types -I. -I.. -I../btt -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -UCOUNT_IOS -UDEBUG -DNDEBUG -o btreplay btreplay.o -laio -lrt^M
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: >: invalid DSO for symbol `pthread_join@@GLIBC_2.0' definition^M
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/lib/libpthread.so.0: could not read symbols: Bad value^M
-| collect2: ld returned 1 exit status^M
-| make[1]: *** [btreplay] Error 1
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/11
-
-Index: git/btreplay/Makefile
-===================================================================
---- git.orig/btreplay/Makefile
-+++ git/btreplay/Makefile
-@@ -11,7 +11,7 @@ XCFLAGS	= -D_GNU_SOURCE -D_LARGEFILE_SOU
- override CFLAGS += $(INCS) $(XCFLAGS) $(OCFLAGS)
- 
- PROGS	= btrecord btreplay
--LIBS	= -laio -lrt
-+LIBS	= -laio -lrt -lpthread
- 
- all: depend $(PROGS)
- 
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 37b7f51..3439a1f 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -4,17 +4,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libaio"
 
-SRCREV = "1e09f6e9012826fca69fa07222b7bc53c3e629ee"
+SRCREV = "0abccbcb5d1a538028ffcb3869d646d29bf5812b"
 
-PR = r2
-PV = "1.0.1+git${SRCPV}"
+PR = "r3"
+PV = "1.0.3+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git;protocol=git \
-           file://blktrace-makefile.patch \
-           file://dso_linking_change_build_fix.patch"
-
-SRC_URI[md5sum] = "588aa9ab8a14d1766ab3f061d728ed89"
-SRC_URI[sha256sum] = "f3cb6a3df1b3dc67369c7c4da3444a7897aa8a18e55937b368e0a6aa2f64b3aa"
+           file://blktrace-makefile.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.6



