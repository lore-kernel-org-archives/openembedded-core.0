Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1ULDVs-00069c-9L
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 15:09:17 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Mar 2013 06:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,925,1355126400"; d="scan'208";a="308652195"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 28 Mar 2013 06:52:00 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2013 15:51:58 +0200
Message-Id: <1364478718-21290-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] elfutils: remove i386_dis.h/x86_64_dis.h compilation targets
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
X-List-Received-Date: Thu, 28 Mar 2013 14:09:17 -0000

Since we provide those files manually (i386_gendis, which is needed for
generating those files, has to be run on host and would fail when
compiling for other architectures), the mentioned compilation targets
in libcpu/ are not needed anymore.

This change will avoid a nasty race condition when running "make -jX
install" resulting in a zero size libebl_i386.so file. The issue happens
because, at "make install" time, the *_dis.h prerequisites will be newer
than the target itself, triggering a chain of recompilations while, in
the same time, the binary files are copied to the destination directory.
Hence, the zero sized file...

[YOCTO #4131]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.148.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index e8d58fb..9c0a08e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -52,7 +52,7 @@ EXTRA_OECONF_append_class-native = " --without-bzlib"
 EXTRA_OECONF_append_libc-uclibc = " --enable-uclibc"
 
 do_configure_prepend() {
-	sed -i 's:./i386_gendis:echo\ \#:g' ${S}/libcpu/Makefile.am
+	sed -i '/^i386_dis.h:/,+4 {/.*/d}' ${S}/libcpu/Makefile.am
 
 	cp ${WORKDIR}/*dis.h ${S}/libcpu
 }
-- 
1.7.9.5



