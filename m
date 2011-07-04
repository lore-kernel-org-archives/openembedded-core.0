Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QdmMD-0005Va-BX
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 18:50:49 +0200
Received: by rex (Postfix, from userid 1000)
	id 959C030C09; Mon,  4 Jul 2011 17:46:33 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 17:46:30 +0100
Message-Id: <2fdd3789ba8af6d2c5443d4a460889bf015717c2.1309797628.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
References: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
References: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 8/8] gcc-package-cross: Switch to using pattern matching to detect when to stash libgcc into the sysroot
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
X-List-Received-Date: Mon, 04 Jul 2011 16:50:49 -0000

Currently, we stash libgcc if PN is gcc-cross or gcc-crosssdk. This patch
changes it to work for *gcc-cross and *-gcc-crosssdk which means it
will patch for multilib extended toolchains.

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-package-cross.inc |   26 ++++++++++++----------
 1 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-cross.inc b/meta/recipes-devtools/gcc/gcc-package-cross.inc
index 3d27788..15627e7 100644
--- a/meta/recipes-devtools/gcc/gcc-package-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-cross.inc
@@ -33,20 +33,22 @@ do_install () {
 	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
 
 	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
-	if [ "${PN}" == "gcc-cross" -o "${PN}" == "gcc-crosssdk" ]; then
-		dest=${D}/${includedir}/gcc-build-internal-${MULTIMACH_TARGET_SYS}
-		oe_runmake "DESTDIR=$dest" libdir=${target_libdir} base_libdir=${target_base_libdir} prefix=${target_prefix} exec_prefix=${target_exec_prefix} install-target-libgcc
+	case ${PN} in
+		*gcc-cross|*gcc-crosssdk)
+			dest=${D}/${includedir}/gcc-build-internal-${MULTIMACH_TARGET_SYS}
+			oe_runmake "DESTDIR=$dest" libdir=${target_libdir} base_libdir=${target_base_libdir} prefix=${target_prefix} exec_prefix=${target_exec_prefix} install-target-libgcc
 
-		# Ideally here we'd override the libgcc Makefile's idea of slibdir but
-		# for now, we just move the files to the correct location
+			# Ideally here we'd override the libgcc Makefile's idea of slibdir but
+			# for now, we just move the files to the correct location
 
-		install -d $dest${target_base_libdir}
-		mv $dest${target_exec_prefix}/${TARGET_SYS}/lib*/* $dest${target_base_libdir}
-		rm -rf $dest${target_exec_prefix}/${TARGET_SYS}
+			install -d $dest${target_base_libdir}
+			mv $dest${target_exec_prefix}/${TARGET_SYS}/lib*/* $dest${target_base_libdir}
+			rm -rf $dest${target_exec_prefix}/${TARGET_SYS}
 
-		# Also need to move gcc from /usr/lib/gcc/* to /usr/lib/ else the search paths won't find the crt*.o files
+			# Also need to move gcc from /usr/lib/gcc/* to /usr/lib/ else the search paths won't find the crt*.o files
 
-		mv $dest${target_libdir}/gcc/* $dest${target_libdir}/
-		rmdir $dest${target_libdir}/gcc
-	fi
+			mv $dest${target_libdir}/gcc/* $dest${target_libdir}/
+			rmdir $dest${target_libdir}/gcc
+		;;
+	esac
 }
-- 
1.7.4.1



