Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1RVtPO-0003fT-Ri
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:17:46 +0100
Received: by eekc1 with SMTP id c1so763174eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6M12g+pYHhN1Z4Pup7RMWh+nRCUoF9TdumaJ5yirEX4=;
	b=Rwx5uc1QYG268eYUAIWBN22OgEBMd42EdPgfT1Fn4TvGlC94/laIW3/990P6/Tctse
	SFLHB4cZv/JD7gZL/t4DBMfLxF8/yIUag1c8BTfxf+RPCEHzSHs9SAim91/Flhu9ykvI
	mt1fEcxsTJM1madvRN+iThqd25P2waDVhgASs=
Received: by 10.227.206.129 with SMTP id fu1mr1790604wbb.22.1322694666213;
	Wed, 30 Nov 2011 15:11:06 -0800 (PST)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id gg1sm3719426wbb.17.2011.11.30.15.11.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 15:11:05 -0800 (PST)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: sgw@linux.intel.com
Date: Thu,  1 Dec 2011 00:01:56 +0000
Message-Id: <262b7b5f2bc5cf31b54a7f5d3ff27306a6a45de8.1322697616.git.julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <4ED69E46.3030808@linux.intel.com>
References: <4ED69E46.3030808@linux.intel.com>
Cc: Julian Pidancet <julian.pidancet@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] Fix multiarch DISTRO_FEATURE
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
X-List-Received-Date: Wed, 30 Nov 2011 23:17:46 -0000

Make get_gcc_multiarch_setting more elegant. Use a dictionnary
to store the config options and replace bb.data.getVar with d.getVar.
Remove i686 from the architecture list because it doesn't seem
to be a valid TARGET_ARCH any more in OE.
Configure gdb (gdb and gdb-cross) with --enable-64-bit-bfd if
multiarch DISTRO_FEATURE is present

Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |   17 ++++++++++-------
 meta/recipes-devtools/gdb/gdb-common.inc |    1 +
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 7ec2f7e..fe112d9 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -22,13 +22,16 @@ def get_gcc_mips_plt_setting(bb, d):
     return ""
 
 def get_gcc_multiarch_setting(bb, d):
-    if 'multiarch' in bb.data.getVar('DISTRO_FEATURES',d,1).split() :
-        if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'i586', 'i686' ] :
-            return "--enable-targets=all"
-        if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'powerpc' ] :
-            return "--enable-targets=powerpc64"
-        if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'sparc' ] :
-            return "--enable-targets=all"
+    target_arch = d.getVar('TARGET_ARCH', True)
+    multiarch_options = {
+        "i586":    "--enable-targets=all",
+        "powerpc": "--enable-targets=powerpc64",
+        "sparc":   "--enable-targets=all",
+    }
+
+    if 'multiarch' in d.getVar('DISTRO_FEATURES', True).split() :
+        if target_arch in multiarch_options :
+            return multiarch_options[target_arch]
     return ""
 
 # We really need HOST_SYS here for some packages and TARGET_SYS for others.
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index e01b57c..d728139 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -41,6 +41,7 @@ EXPAT = "--without-expat"
 EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x \
                 --with-curses --disable-multilib --with-system-readline --disable-sim \
                 ${GDBPROPREFIX} --with-libelf=${STAGING_DIR_TARGET} ${EXPAT} \
+                ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
                "
 
 GDBPROPREFIX = "--program-prefix=''"
-- 
Julian Pidancet



