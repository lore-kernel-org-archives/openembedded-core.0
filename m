Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id A77EB6E672
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 04:27:01 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id AE69E2201C1;
	Wed,  3 Oct 2018 17:26:59 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2018 17:26:53 +1300
Message-Id: <20181003042653.4264-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <2f47bda4-deb2-9603-a151-8330f0d52e08@taitradio.com>
References: <2f47bda4-deb2-9603-a151-8330f0d52e08@taitradio.com>
Subject: [PATCH] glibc: Fix non-IA reproducibility for shared libraries
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
X-List-Received-Date: Wed, 03 Oct 2018 04:27:02 -0000

Compute a relative path to build-arm-tait-linux-gnueabi/csu/
for each library subdirectory.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/conf/bitbake.conf                        |  2 +-
 ...34-reproducible-makehack-shared-libs.patch | 48 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.28.bb         |  1 +
 3 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0034-reproducible-makehack-shared-libs.patch

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 93aee1ae46..6c0b3c239f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -482,7 +482,7 @@ HOSTTOOLS += " \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
     mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python python2 \
-    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
+    python2.7 python3 ranlib readelf readlink realpath rm rmdir rpcgen sed sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
     uniq wc wget which xargs \
 "
diff --git a/meta/recipes-core/glibc/glibc/0034-reproducible-makehack-shared-libs.patch b/meta/recipes-core/glibc/glibc/0034-reproducible-makehack-shared-libs.patch
new file mode 100644
index 0000000000..11902be523
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0034-reproducible-makehack-shared-libs.patch
@@ -0,0 +1,48 @@
+diff --git a/Makerules b/Makerules
+index a10a0b4d70..cacddb8784 100644
+--- a/Makerules
++++ b/Makerules
+@@ -606,10 +606,11 @@ lib%.so: lib%_pic.a $(+preinit) $(+postinit) $(link-libc-deps)
+ 	$(build-shlib) $(link-libc-args)
+ 	$(call after-link,$@)
+ 
++csu-objpfx-relative = $(shell realpath --relative-to=`pwd` $(csu-objpfx))/
+ define build-shlib-helper
+ $(LINK.o) -shared -static-libgcc -Wl,-O1 $(sysdep-LDFLAGS) \
+ 	  $(if $($(@F)-no-z-defs)$(no-z-defs),,-Wl,-z,defs) $(rtld-LDFLAGS) \
+-	  $(extra-B-$(@F:lib%.so=%).so) -B$(csu-objpfx) \
++	  $(extra-B-$(@F:lib%.so=%).so) -B$(csu-objpfx-relative) \
+ 	  $(extra-B-$(@F:lib%.so=%).so) $(load-map-file) \
+ 	  -Wl,-soname=lib$(libprefix)$(@F:lib%.so=%).so$($(@F)-version) \
+ 	  $(LDFLAGS.so) $(LDFLAGS-lib.so) $(LDFLAGS-$(@F:lib%.so=%).so) \
+@@ -662,13 +663,13 @@ endif
+ 
+ define build-shlib
+ $(build-shlib-helper) -o $@ $(shlib-lds-flags) \
+-	  $(csu-objpfx)abi-note.o $(build-shlib-objlist)
++	  $(csu-objpfx-relative)abi-note.o $(build-shlib-objlist)
+ endef
+ 
+ define build-module-helper
+ $(LINK.o) -shared -static-libgcc $(sysdep-LDFLAGS) $(rtld-LDFLAGS) \
+ 	  $(if $($(@F)-no-z-defs)$(no-z-defs),,-Wl,-z,defs) \
+-	  -B$(csu-objpfx) $(load-map-file) \
++	  -B$(csu-objpfx-relative) $(load-map-file) \
+ 	  $(LDFLAGS.so) $(LDFLAGS-$(@F:%.so=%).so) \
+ 	  -L$(subst :, -L,$(rpath-link)) -Wl,-rpath-link=$(rpath-link)
+ endef
+@@ -679,12 +680,12 @@ endef
+ # not for shared objects
+ define build-module
+ $(build-module-helper) -o $@ $(shlib-lds-flags) \
+-	  $(csu-objpfx)abi-note.o $(build-module-objlist) $(link-libc-args)
++	  $(csu-objpfx-relative)abi-note.o $(build-module-objlist) $(link-libc-args)
+ $(call after-link,$@)
+ endef
+ define build-module-asneeded
+ $(build-module-helper) -o $@ $(shlib-lds-flags) \
+-	  $(csu-objpfx)abi-note.o \
++	  $(csu-objpfx-relative)abi-note.o \
+ 	  -Wl,--as-needed $(build-module-objlist) -Wl,--no-as-needed \
+ 	  $(link-libc-args)
+ $(call after-link,$@)
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 804b7891ec..5508be13f7 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -48,6 +48,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch \
            file://0032-soft-fp-ignore-maybe-uninitialized.patch \
            file://0001-Linux-gethostid-Check-for-NULL-value-from-gethostbyn.patch \
+           file://0034-reproducible-makehack-shared-libs.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.17.1


