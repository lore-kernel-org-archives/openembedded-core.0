Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 432F07669F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 05:54:04 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so53978041qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 22:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bPcMUNdh0iJFJKsd+yaFye1xHt8rJA75e1hyxdglf8Q=;
	b=F7VSxS4Diq17WFVopNToW2pB72GGz8DMxVdaXfczWmrfbOeIVejOWngY/DlfUynnta
	q05lulxHLg84LnlSzGbiDihJT6tI3NzVq2t8Wj6kj3LPaV0Yh5ACsdqEPNj3xmtbGUBJ
	jp0+7oyZ87kYaoou+1Fen2YWJxNrRVRVT0JEH0qvgChL7YoNehLwBjGNSKS2OrlCweA1
	dMg7IyTtQ0asPSAijfTNQJnsKOQOv/nnOzFWtMB9hPbOzw03KKYOyExn1NNhYcGeflNx
	7r5GJQMqrgVIZ9tg4xDQi6ghOqK/wYx3tILts0CXN1gRzsbqomtI0yLQWAuT5rR0r3Wb
	ohSg==
X-Received: by 10.55.42.163 with SMTP id q35mr40855458qkq.107.1441778044678;
	Tue, 08 Sep 2015 22:54:04 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	e47sm3300670qgd.28.2015.09.08.22.54.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 22:54:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 05:53:57 +0000
Message-Id: <1441778037-745-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH V2] busybox: Use CC instead of bare LD to be the Linker
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
X-List-Received-Date: Wed, 09 Sep 2015 05:54:06 -0000

This patch was on mailing list, another patch to make sure -r is not
passed directly but via -Wl switch is added.

This was exposed when using clang and gold linker, clang does not have
-r switch to do relocatable objects and problem happens specific to OE
becuase we use LD = CC

now what happens is that busybox assumes that linker will be called
directly, and hence sprinkles linkers options in its kbuild system which
aggregate into LDFLAGS, some of these options are happily ignored by gcc
as well but it passes -r options rightly to linker so it all works,
however when using clang, this falls apart since -r is not known option
for clang so it drops this option and all obects which should be
partially linked becomes ET_EXEC and when they are added to final link
then gold starts to get confused

/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linux/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
error: applets/built-in.o: unsupported ELF file type 2
clang-3.7: error: linker command failed with exit code 1 (use -v to see invocation)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-linking-instead-of-LD-and-use-CFLAGS-and.patch | 114 +++++++++++++++++++++
 .../busybox/0002-Passthrough-r-to-linker.patch     |  32 ++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |   2 +
 3 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch b/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
new file mode 100644
index 0000000..2bf2b91
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
@@ -0,0 +1,114 @@
+From a9333eb6a7b8dbda735947cd5bc981ff9352a2c9 Mon Sep 17 00:00:00 2001
+From: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
+Date: Thu, 10 Mar 2011 00:27:08 -0500
+Subject: [PATCH 1/2] Use $(CC) when linking instead of $(LD) and use $(CFLAGS)
+ and $(EXTRA_CFLAGS) when linking.
+
+This fixes the issue where LDFLAGS escaped with -Wl are ignored during
+compilation. It also simplifies using CFLAGS or EXTRA_CFLAGS (such as
+-m32 on x86_64 or -flto) which apply to both compilation and linking
+situations.
+
+Signed-off-by: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
+---
+Upstream-Status: Pending
+
+ Makefile               |  7 ++++---
+ scripts/Makefile.build |  8 ++++----
+ scripts/Makefile.lib   | 13 +++----------
+ 3 files changed, 11 insertions(+), 17 deletions(-)
+
+Index: busybox-1.23.2/Makefile
+===================================================================
+--- busybox-1.23.2.orig/Makefile
++++ busybox-1.23.2/Makefile
+@@ -309,7 +309,8 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D
+ MODFLAGS	= -DMODULE
+ CFLAGS_MODULE   = $(MODFLAGS)
+ AFLAGS_MODULE   = $(MODFLAGS)
+-LDFLAGS_MODULE  = -r
++LDFLAGS_RELOCATABLE = -r -nostdlib
++LDFLAGS_MODULE  = $(LDFLAGS_RELOCATABLE)
+ CFLAGS_KERNEL	=
+ AFLAGS_KERNEL	=
+ 
+@@ -331,7 +332,7 @@ KERNELVERSION = $(VERSION).$(PATCHLEVEL)
+ export	VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION \
+ 	ARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC \
+ 	CPP AR NM STRIP OBJCOPY OBJDUMP MAKE AWK GENKSYMS PERL UTS_MACHINE \
+-	HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
++	HOSTCXX HOSTCXXFLAGS LDFLAGS_RELOCATABLE LDFLAGS_MODULE CHECK CHECKFLAGS
+ 
+ export CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
+ export CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
+@@ -610,7 +611,7 @@ quiet_cmd_busybox__ ?= LINK    $@
+       cmd_busybox__ ?= $(srctree)/scripts/trylink \
+       "$@" \
+       "$(CC)" \
+-      "$(CFLAGS) $(CFLAGS_busybox)" \
++      "$(CFLAGS) $(CFLAGS_busybox) $(EXTRA_CFLAGS)" \
+       "$(LDFLAGS) $(EXTRA_LDFLAGS)" \
+       "$(core-y)" \
+       "$(libs-y)" \
+Index: busybox-1.23.2/scripts/Makefile.build
+===================================================================
+--- busybox-1.23.2.orig/scripts/Makefile.build
++++ busybox-1.23.2/scripts/Makefile.build
+@@ -174,7 +174,7 @@ cmd_modversions =							\
+ 		| $(GENKSYMS) -a $(ARCH)				\
+ 		> $(@D)/.tmp_$(@F:.o=.ver);				\
+ 									\
+-		$(LD) $(LDFLAGS) -r -o $@ $(@D)/.tmp_$(@F) 		\
++               $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@ $(@D)/.tmp_$(@F)        \
+ 			-T $(@D)/.tmp_$(@F:.o=.ver);			\
+ 		rm -f $(@D)/.tmp_$(@F) $(@D)/.tmp_$(@F:.o=.ver);	\
+ 	else								\
+@@ -257,7 +257,7 @@ quiet_cmd_link_o_target = LD      $@
+ # If the list of objects to link is empty, just create an empty built-in.o
+ # -nostdlib is added to make "make LD=gcc ..." work (some people use that)
+ cmd_link_o_target = $(if $(strip $(obj-y)),\
+-		$(LD) -nostdlib $(ld_flags) -r -o $@ $(filter $(obj-y), $^),\
++		$(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@ $(filter $(obj-y), $^),\
+ 		rm -f $@; $(AR) rcs $@)
+ 
+ $(builtin-target): $(obj-y) FORCE
+@@ -292,10 +292,10 @@ $($(subst $(obj)/,,$(@:.o=-objs)))    \
+ $($(subst $(obj)/,,$(@:.o=-y)))), $^)
+ 
+ quiet_cmd_link_multi-y = LD      $@
+-cmd_link_multi-y = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps)
++cmd_link_multi-y = $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@ $(link_multi_deps)
+ 
+ quiet_cmd_link_multi-m = LD [M]  $@
+-cmd_link_multi-m = $(LD) $(ld_flags) $(LDFLAGS_MODULE) -o $@ $(link_multi_deps)
++cmd_link_multi-m = $(CC) $(ld_flags) $(LDFLAGS_MODULE) -o $@ $(link_multi_deps)
+ 
+ # We would rather have a list of rules like
+ # 	foo.o: $(foo-objs)
+Index: busybox-1.23.2/scripts/Makefile.lib
+===================================================================
+--- busybox-1.23.2.orig/scripts/Makefile.lib
++++ busybox-1.23.2/scripts/Makefile.lib
+@@ -121,7 +121,8 @@ cpp_flags      = -Wp,-MD,$(depfile) $(NO
+ # yet ld_flags is fed to ld.
+ #ld_flags       = $(LDFLAGS) $(EXTRA_LDFLAGS)
+ # Remove the -Wl, prefix from linker options normally passed through gcc
+-ld_flags       = $(filter-out -Wl$(comma)%,$(LDFLAGS) $(EXTRA_LDFLAGS))
++ld_flags       = $(filter-out -Wl$(comma)%,$(LDFLAGS) $(EXTRA_LDFLAGS) $(CFLAGS) $(EXTRA_CFLAGS))
++ld_flags_partial = $($(filter-out -shared%, $(filter-out -pie%,$(ld_flags))))
+ 
+ 
+ # Finds the multi-part object the current object will be linked into
+@@ -151,10 +152,8 @@ $(obj)/%:: $(src)/%_shipped
+ # Linking
+ # ---------------------------------------------------------------------------
+ 
+-# TODO: LDFLAGS usually is supposed to contain gcc's flags, not ld's.
+-# but here we feed them to ld!
+-quiet_cmd_ld = LD      $@
+-cmd_ld = $(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LDFLAGS_$(@F)) \
++quiet_cmd_ld = CC    $@
++cmd_ld = $(CC) $(ld_flags) $(LDFLAGS_$(@F)) \
+ 	       $(filter-out FORCE,$^) -o $@
+ 
+ # Objcopy
diff --git a/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch b/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch
new file mode 100644
index 0000000..de286fb
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch
@@ -0,0 +1,32 @@
+From df2cc76cdebc4773361477f3db203790f6986e3b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Aug 2015 23:42:40 -0700
+Subject: [PATCH 2/2] Passthrough -r to linker
+
+clang does not have -r switch and it does not pass it down to linker
+either, LDFLAGS_RELOCATABLE is used when CC is used for LD, so this
+should not cause side effects
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 9da02cb..10dd4a9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -309,7 +309,7 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ -Wbitwise $(C
+ MODFLAGS	= -DMODULE
+ CFLAGS_MODULE   = $(MODFLAGS)
+ AFLAGS_MODULE   = $(MODFLAGS)
+-LDFLAGS_RELOCATABLE = -r -nostdlib
++LDFLAGS_RELOCATABLE = -Xlinker -r -nostdlib
+ LDFLAGS_MODULE  = $(LDFLAGS_RELOCATABLE)
+ CFLAGS_KERNEL	=
+ AFLAGS_KERNEL	=
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 5e02732..2559823 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -33,6 +33,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-Switch-to-POSIX-utmpx-API.patch \
            file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
            file://0001-chown-fix-help-text.patch \
+           file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
+           file://0002-Passthrough-r-to-linker.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
-- 
2.5.1


