Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4306A564
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2013 11:12:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8MBREL3005478; Sun, 22 Sep 2013 12:27:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1ixuarCp2igB; Sun, 22 Sep 2013 12:27:14 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8MBR8Vm005472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 22 Sep 2013 12:27:09 +0100
Message-ID: <1379848341.18603.208.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Sep 2013 12:12:21 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCHv2] gcc-target: Fix libatomic dependency tracking issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Sep 2013 11:12:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The --enable-dependency-tracking option was added to workaround build
issues in libatomic. This fixes that build problem properly and removes
the flag since the dependency tracking code appears to be full of races
which are much deeper and harder to fix.

As per the automake manual, dependency tracking is only useful and worth
the build performance cost if you are doing more than one compile of the same
source code which in most cases we are not so this is a good thing anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

v1 was missing the gcc-4.8.inc change

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 0fbbc1d..4af98f8 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -75,6 +75,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0043-cpp.patch \
 	   file://0044-gengtypes.patch \
 	   file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
+	   file://0046-libatomic-deptracking.patch \
 	  "
 SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
 SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0046-libatomic-deptracking.patch b/meta/recipes-devtools/gcc/gcc-4.8/0046-libatomic-deptracking.patch
new file mode 100644
index 0000000..6ea4f42
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0046-libatomic-deptracking.patch
@@ -0,0 +1,41 @@
+gcc 4.8 won't build with --disable-dependency-tracking since the *.Ppo files
+don't get created unless --enable-dependency-tracking is true.
+
+This patch ensures we only use those compiler options when its enabled.
+
+Upstream-Status: Submitted
+
+(Problem was already reported upstream, attached this patch there
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=55930)
+
+RP 
+2012/09/22
+
+Index: gcc-4.8.1/libatomic/Makefile.am
+===================================================================
+--- gcc-4.8.1.orig/libatomic/Makefile.am	2013-01-14 18:16:23.000000000 +0000
++++ gcc-4.8.1/libatomic/Makefile.am	2013-09-22 10:38:18.904064750 +0000
+@@ -100,7 +100,8 @@
+ IFUNC_DEF	= -DIFUNC_ALT=$(PAT_S)
+ IFUNC_OPT	= $(word $(PAT_S),$(IFUNC_OPTIONS))
+ 
+-M_DEPS		= -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
++@AMDEP_TRUE@M_DEPS		= -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
++@AMDEP_FALSE@M_DEPS		= 
+ M_SIZE		= -DN=$(PAT_N)
+ M_IFUNC		= $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
+ M_FILE		= $(PAT_BASE)_n.c
+Index: gcc-4.8.1/libatomic/Makefile.in
+===================================================================
+--- gcc-4.8.1.orig/libatomic/Makefile.in	2013-05-31 09:09:26.000000000 +0000
++++ gcc-4.8.1/libatomic/Makefile.in	2013-09-22 10:40:42.520059917 +0000
+@@ -298,7 +298,8 @@
+ PAT_S = $(word 3,$(PAT_SPLIT))
+ IFUNC_DEF = -DIFUNC_ALT=$(PAT_S)
+ IFUNC_OPT = $(word $(PAT_S),$(IFUNC_OPTIONS))
+-M_DEPS = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
++@AMDEP_TRUE@M_DEPS = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
++@AMDEP_FALSE@M_DEPS = 
+ M_SIZE = -DN=$(PAT_N)
+ M_IFUNC = $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
+ M_FILE = $(PAT_BASE)_n.c
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index c7e3e16..e1179ac 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -5,7 +5,7 @@ EXTRA_OECONF_PATHS = " \
     --with-sysroot=/ \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
     --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
-    --with-gxx-include-dir=${includedir}/c++/ --enable-dependency-tracking"
+    --with-gxx-include-dir=${includedir}/c++/"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
 



