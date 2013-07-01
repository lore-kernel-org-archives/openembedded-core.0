Return-Path: <B19537@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0187.outbound.messaging.microsoft.com [213.199.154.187])
	by mail.openembedded.org (Postfix) with ESMTP id DCA386AF05
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 05:43:19 +0000 (UTC)
Received: from mail21-db8-R.bigfish.com (10.174.8.234) by
	DB8EHSOBE002.bigfish.com (10.174.4.65) with Microsoft SMTP Server id
	14.1.225.23; Mon, 1 Jul 2013 05:43:19 +0000
Received: from mail21-db8 (localhost [127.0.0.1])	by mail21-db8-R.bigfish.com
	(Postfix) with ESMTP id CA9FC10C016F	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 05:43:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -5
X-BigFish: VS-5(z3e12hzc89bh444eMzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz17326ah8275bh8275dhz2dh2a8h668h839h93fhd24he5bhf0ah1288h12a5h12a9h12bdh137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail21-db8 (localhost.localdomain [127.0.0.1]) by mail21-db8
	(MessageSwitch) id 1372657393599719_25335;
	Mon,  1 Jul 2013 05:43:13 +0000 (UTC)
Received: from DB8EHSMHS030.bigfish.com (unknown [10.174.8.243])	by
	mail21-db8.bigfish.com (Postfix) with ESMTP id 851101E80046	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 05:43:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS030.bigfish.com
	(10.174.4.40) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 1 Jul 2013 05:43:13 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Mon, 1 Jul 2013 05:43:11 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r615h6vo011570;
	Sun, 30 Jun 2013 22:43:07 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Jul 2013 13:51:19 +0800
Message-ID: <1372657879-11813-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>, b40527@freescale.com
Subject: [meta-fsl-ppc][PATCH v3] linux-qoriq-sdk(-headers): upgrade to the version of sdk-1.4
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
X-List-Received-Date: Mon, 01 Jul 2013 05:43:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1.Update kernel version to 3.8.

2.add DEPENDS libgcc and append TOOLCHAIN_OPTIONS to KERNEL_{CC,LD}.
kernel in sdk 1.4 need run-time support libraries 'libgcc.a', added
in file arch/powerpc/Makefile:
LIBGCC :=3D $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
Without passing the TOOLCHAIN_OPTIONS (define --sysroot parameter),
it will fail to find the libgcc.a.

3.Also remove the patches which were already merged on git tree.

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
Signed-off-by: Ting Liu <b28495@freescale.com>
---
 ...option-Automount-devtmpfs-at-dev-in-kerne.patch |   78 --------------=
------
 ...Undef-before-redefining-__attribute_const.patch |   28 -------
 ...-build-dependencies-for-c-files-requiring.patch |   44 -----------
 .../linux/files/fix_getrusage_for_perf.patch       |   33 ---------
 ...efile.headersinst-install-headers-from-sc.patch |   46 ++++++++++++
 recipes-kernel/linux/linux-qoriq-sdk-headers.bb    |    4 +
 recipes-kernel/linux/linux-qoriq-sdk.bb            |    8 +-
 recipes-kernel/linux/linux-qoriq-sdk.inc           |    7 +-
 8 files changed, 57 insertions(+), 191 deletions(-)
 delete mode 100644 recipes-kernel/linux/files/0001-Enable-the-option-Aut=
omount-devtmpfs-at-dev-in-kerne.patch
 delete mode 100644 recipes-kernel/linux/files/0001-compiler.h-Undef-befo=
re-redefining-__attribute_const.patch
 delete mode 100644 recipes-kernel/linux/files/0001-powerpc-Fix-build-dep=
endencies-for-c-files-requiring.patch
 delete mode 100644 recipes-kernel/linux/files/fix_getrusage_for_perf.pat=
ch
 create mode 100644 recipes-kernel/linux/files/scripts-Makefile.headersin=
st-install-headers-from-sc.patch

diff --git a/recipes-kernel/linux/files/0001-Enable-the-option-Automount-=
devtmpfs-at-dev-in-kerne.patch b/recipes-kernel/linux/files/0001-Enable-t=
he-option-Automount-devtmpfs-at-dev-in-kerne.patch
deleted file mode 100644
index 39783ef..0000000
--- a/recipes-kernel/linux/files/0001-Enable-the-option-Automount-devtmpf=
s-at-dev-in-kerne.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 3179602e581b6fe8797a5677d5ac4ecfab065cc6 Mon Sep 17 00:00:00 2001
-From: Chunrong Guo <B40290@freescale.com>
-Date: Thu, 11 Apr 2013 01:52:48 -0500
-Subject: [PATCH] Enable "the option Automount devtmpfs at /dev" in kerne=
l
-
-Upstream-Status:Pending
-Signed-off-by: Chunrong Guo <b40290@freescale.com>
----
- arch/powerpc/configs/85xx/e6500rev1_defconfig |    1 +
- arch/powerpc/configs/corenet32_smp_defconfig  |    1 +
- arch/powerpc/configs/corenet64_smp_defconfig  |    1 +
- arch/powerpc/configs/mpc85xx_defconfig        |    1 +
- arch/powerpc/configs/mpc85xx_smp_defconfig    |    1 +
- 5 files changed, 5 insertions(+)
-
-diff --git a/arch/powerpc/configs/85xx/e6500rev1_defconfig b/arch/powerp=
c/configs/85xx/e6500rev1_defconfig
-index 4b5866d..32ebb50 100644
---- a/arch/powerpc/configs/85xx/e6500rev1_defconfig
-+++ b/arch/powerpc/configs/85xx/e6500rev1_defconfig
-@@ -72,6 +72,7 @@ CONFIG_IPV6=3Dy
- CONFIG_IP_SCTP=3Dm
- CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
- CONFIG_DEVTMPFS=3Dy
-+CONFIG_DEVTMPFS_MOUNT=3Dy
- CONFIG_MTD=3Dy
- CONFIG_MTD_CMDLINE_PARTS=3Dy
- CONFIG_MTD_CHAR=3Dy
-diff --git a/arch/powerpc/configs/corenet32_smp_defconfig b/arch/powerpc=
/configs/corenet32_smp_defconfig
-index b43d4b6..3fe10e5 100644
---- a/arch/powerpc/configs/corenet32_smp_defconfig
-+++ b/arch/powerpc/configs/corenet32_smp_defconfig
-@@ -71,6 +71,7 @@ CONFIG_IPV6=3Dy
- CONFIG_IP_SCTP=3Dm
- CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
- CONFIG_DEVTMPFS=3Dy
-+CONFIG_DEVTMPFS_MOUNT=3Dy
- CONFIG_MTD=3Dy
- CONFIG_MTD_CMDLINE_PARTS=3Dy
- CONFIG_MTD_CHAR=3Dy
-diff --git a/arch/powerpc/configs/corenet64_smp_defconfig b/arch/powerpc=
/configs/corenet64_smp_defconfig
-index 13b032b..74cc46a 100644
---- a/arch/powerpc/configs/corenet64_smp_defconfig
-+++ b/arch/powerpc/configs/corenet64_smp_defconfig
-@@ -66,6 +66,7 @@ CONFIG_IPV6=3Dy
- CONFIG_IP_SCTP=3Dm
- CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
- CONFIG_DEVTMPFS=3Dy
-+CONFIG_DEVTMPFS_MOUNT=3Dy
- CONFIG_MTD=3Dy
- CONFIG_MTD_CMDLINE_PARTS=3Dy
- CONFIG_MTD_CHAR=3Dy
-diff --git a/arch/powerpc/configs/mpc85xx_defconfig b/arch/powerpc/confi=
gs/mpc85xx_defconfig
-index 8fb742d..f353a6e 100644
---- a/arch/powerpc/configs/mpc85xx_defconfig
-+++ b/arch/powerpc/configs/mpc85xx_defconfig
-@@ -75,6 +75,7 @@ CONFIG_IPV6=3Dy
- CONFIG_IP_SCTP=3Dm
- CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
- CONFIG_DEVTMPFS=3Dy
-+CONFIG_DEVTMPFS_MOUNT=3Dy
- CONFIG_MTD=3Dy
- CONFIG_MTD_CHAR=3Dy
- CONFIG_MTD_BLOCK=3Dy
-diff --git a/arch/powerpc/configs/mpc85xx_smp_defconfig b/arch/powerpc/c=
onfigs/mpc85xx_smp_defconfig
-index b31c8ac..cdc2c87 100644
---- a/arch/powerpc/configs/mpc85xx_smp_defconfig
-+++ b/arch/powerpc/configs/mpc85xx_smp_defconfig
-@@ -77,6 +77,7 @@ CONFIG_IPV6=3Dy
- CONFIG_IP_SCTP=3Dm
- CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
- CONFIG_DEVTMPFS=3Dy
-+CONFIG_DEVTMPFS_MOUNT=3Dy
- CONFIG_MTD=3Dy
- CONFIG_MTD_CHAR=3Dy
- CONFIG_MTD_BLOCK=3Dy
---=20
-1.7.9.7
-
diff --git a/recipes-kernel/linux/files/0001-compiler.h-Undef-before-rede=
fining-__attribute_const.patch b/recipes-kernel/linux/files/0001-compiler=
.h-Undef-before-redefining-__attribute_const.patch
deleted file mode 100644
index 597fd3b..0000000
--- a/recipes-kernel/linux/files/0001-compiler.h-Undef-before-redefining-=
__attribute_const.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6f92ab6de9d8daeb575949bbbcbc7bcdcebc60af Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem at gmail.com>
-Date: Thu, 5 Jan 2012 11:42:35 -0800
-Subject: [PATCH] compiler.h: Undef before redefining __attribute_const__
-
-This is required to avoid warnings like
-util/include/linux/compiler.h:8:0: error: "__attribute_const__" redefine=
d [-Werror]
-
-Signed-off-by: Khem Raj <raj.khem at gmail.com>
----
- tools/perf/util/include/linux/compiler.h |    4 +++-
- 1 files changed, 3 insertions(+), 1 deletions(-)
-
---- a/tools/perf/util/include/linux/compiler.h
-+++ b/tools/perf/util/include/linux/compiler.h
-@@ -4,9 +4,11 @@
- #ifndef __always_inline
- #define __always_inline	inline
- #endif
-+#undef __user
- #define __user
-+#undef __attribute_const__
- #define __attribute_const__
--
-+#undef __used
- #define __used		__attribute__((__unused__))
-=20
- #endif
diff --git a/recipes-kernel/linux/files/0001-powerpc-Fix-build-dependenci=
es-for-c-files-requiring.patch b/recipes-kernel/linux/files/0001-powerpc-=
Fix-build-dependencies-for-c-files-requiring.patch
deleted file mode 100644
index d3464fb..0000000
--- a/recipes-kernel/linux/files/0001-powerpc-Fix-build-dependencies-for-=
c-files-requiring.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Pending
-
-From 2e7ffea0c0c09c6d9219d604e0351423f43844f4 Mon Sep 17 00:00:00 2001
-From: Matthew McClintock <msm@freescale.com>
-Date: Thu, 6 Sep 2012 13:45:21 -0500
-Subject: powerpc: Fix build dependencies for c files requiring libfdt.h
-
-Several files in obj-plat depend on libfdt header file. Sometimes
-when building one can see the following issue. This patch adds
-libfdt as dependency to those object files
-
-| In file included from arch/powerpc/boot/treeboot-iss4xx.c:33:0:
-| arch/powerpc/boot/libfdt.h:854:1: error: unterminated comment
-| In file included from arch/powerpc/boot/treeboot-iss4xx.c:33:0:
-| arch/powerpc/boot/libfdt.h:1:0: error: unterminated #ifndef
-|   BOOTCC  arch/powerpc/boot/inffast.o
-| make[1]: *** [arch/powerpc/boot/treeboot-iss4xx.o] Error 1
-| make[1]: *** Waiting for unfinished jobs....
-|   BOOTCC  arch/powerpc/boot/inflate.o
-| make: *** [uImage] Error 2
-| ERROR: oe_runmake failed
-| ERROR: Function failed: do_compile (see /srv/home/pokybuild/yocto-auto=
builder/yocto-slave/p1022ds/build/build/tmp/work/p1022ds-poky-linux-gnusp=
e/linux-qoriq-sdk-3.0.34-r5/temp/log.do_compile.2167 for further informat=
ion)
-NOTE: recipe linux-qoriq-sdk-3.0.34-r5: task do_compile: Failed
-
-Signed-off-by: Matthew McClintock <msm@freescale.com>
----
- arch/powerpc/boot/Makefile |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
-index b7d8333..6a15c96 100644
---- a/arch/powerpc/boot/Makefile
-+++ b/arch/powerpc/boot/Makefile
-@@ -107,6 +107,7 @@ src-boot :=3D $(addprefix $(obj)/, $(src-boot))
- obj-boot :=3D $(addsuffix .o, $(basename $(src-boot)))
- obj-wlib :=3D $(addsuffix .o, $(basename $(addprefix $(obj)/, $(src-wli=
b))))
- obj-plat :=3D $(addsuffix .o, $(basename $(addprefix $(obj)/, $(src-pla=
t))))
-+obj-plat: $(libfdt)
-=20
- quiet_cmd_copy_zlib =3D COPY    $@
-       cmd_copy_zlib =3D sed "s@__used@@;s@<linux/\([^>]*\).*@\"\1\"@" $=
< > $@
---=20
-1.7.9.7
-
diff --git a/recipes-kernel/linux/files/fix_getrusage_for_perf.patch b/re=
cipes-kernel/linux/files/fix_getrusage_for_perf.patch
deleted file mode 100644
index 0029fdc..0000000
--- a/recipes-kernel/linux/files/fix_getrusage_for_perf.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-commit 7b78f13603c6fcb64e020a0bbe31a651ea2b657b
-Author: Markus Trippelsdorf <markus@trippelsdorf.de>
-Date: Wed Apr 4 10:45:27 2012 +0200
-
-    perf tools: Fix getrusage() related build failure on glibc trunk
-   =20
-    On a system running glibc trunk perf doesn't build:
-   =20
-        CC builtin-sched.o
-    builtin-sched.c: In function =E2=80=98get_cpu_usage_nsec_parent=E2=80=
=99: builtin-sched.c:399:16: error: storage size of =E2=80=98ru=E2=80=99 =
isn=E2=80=99t known builtin-sched.c:403:2: error: implicit declaration of=
 function =E2=80=98getrusage=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
-        [...]
-   =20
-    Fix it by including sys/resource.h.
-   =20
-    Signed-off-by: Markus Trippelsdorf <markus@trippelsdorf.de>
-    Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
-    Link: http://lkml.kernel.org/r/20120404084527.GA294@x4
-    Signed-off-by: Ingo Molnar <mingo@kernel.org>
-
-Upstream-Status: Backport [3.4]
-
-diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
-index fb8b5f8..1cad3af 100644
---- a/tools/perf/builtin-sched.c
-+++ b/tools/perf/builtin-sched.c
-@@ -17,6 +17,7 @@
- #include "util/debug.h"
-=20
- #include <sys/prctl.h>
-+#include <sys/resource.h>
-=20
- #include <semaphore.h>
- #include <pthread.h>
diff --git a/recipes-kernel/linux/files/scripts-Makefile.headersinst-inst=
all-headers-from-sc.patch b/recipes-kernel/linux/files/scripts-Makefile.h=
eadersinst-install-headers-from-sc.patch
new file mode 100644
index 0000000..0f28d3d
--- /dev/null
+++ b/recipes-kernel/linux/files/scripts-Makefile.headersinst-install-hea=
ders-from-sc.patch
@@ -0,0 +1,46 @@
+From e60cc1b011bf0f1acdb7e5168b7bed4ebb78c91f Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Wed, 9 Jan 2013 16:24:39 -0500
+Subject: [PATCH] scripts/Makefile.headersinst: install headers from scra=
tch file
+
+If headers_install is executed from a deep/long directory structure, the
+shell's maximum argument length can be execeeded, which breaks the opera=
tion
+with:
+
+| make[2]: execvp: /bin/sh: Argument list too long
+| make[2]: ***
+
+By dumping the input files to a scratch file and using xargs to read the
+input list from the scratch file, we can avoid blowing out the maximum
+argument size and install headers in a long path name environment.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ scripts/Makefile.headersinst |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
+index 06ba4a7..536d722 100644
+--- a/scripts/Makefile.headersinst
++++ b/scripts/Makefile.headersinst
+@@ -71,7 +71,7 @@ printdir =3D $(patsubst $(INSTALL_HDR_PATH)/%/,%,$(dir=
 $@))
+ quiet_cmd_install =3D INSTALL $(printdir) ($(words $(all-files))\
+                             file$(if $(word 2, $(all-files)),s))
+       cmd_install =3D \
+-        $(PERL) $< $(installdir) $(SRCARCH) $(input-files); \
++        xargs $(PERL) $< $(installdir) $(SRCARCH) < $(INSTALL_HDR_PATH)=
/.input-files; \
+         for F in $(wrapper-files); do                                  =
 \
+                 echo "\#include <asm-generic/$$F>" > $(installdir)/$$F;=
    \
+         done;                                                          =
 \
+@@ -100,7 +100,9 @@ targets +=3D $(install-file)
+ $(install-file): scripts/headers_install.pl $(input-files) FORCE
+ 	$(if $(unwanted),$(call cmd,remove),)
+ 	$(if $(wildcard $(dir $@)),,$(shell mkdir -p $(dir $@)))
++	@echo $(input-files) > $(INSTALL_HDR_PATH)/.input-files
+ 	$(call if_changed,install)
++	@rm $(INSTALL_HDR_PATH)/.input-files
+=20
+ else
+ __headerscheck: $(subdirs) $(check-file)
+--=20
+1.7.0.4
diff --git a/recipes-kernel/linux/linux-qoriq-sdk-headers.bb b/recipes-ke=
rnel/linux/linux-qoriq-sdk-headers.bb
index b1cbb8d..0ee4fc1 100644
--- a/recipes-kernel/linux/linux-qoriq-sdk-headers.bb
+++ b/recipes-kernel/linux/linux-qoriq-sdk-headers.bb
@@ -2,6 +2,8 @@ DESCRIPTION =3D "Linux kernel headers for Freescale platf=
orms"
 SECTION =3D "devel"
 LICENSE =3D "GPLv2"
=20
+PR =3D "${INC_PR}.1"
+
 INHIBIT_DEFAULT_DEPS =3D "1"
 PROVIDES =3D "linux-libc-headers ${PN}"
 RPROVIDES_${PN}-dev +=3D "linux-libc-headers-dev"
@@ -11,6 +13,8 @@ RRECOMMENDS_${PN}-dbg =3D "linux-libc-headers-dev (=3D =
${EXTENDPKGV})"
=20
 require recipes-kernel/linux/linux-qoriq-sdk.inc
=20
+SRC_URI_append +=3D " file://scripts-Makefile.headersinst-install-header=
s-from-sc.patch"
+
 inherit kernel-arch
=20
 do_configure() {
diff --git a/recipes-kernel/linux/linux-qoriq-sdk.bb b/recipes-kernel/lin=
ux/linux-qoriq-sdk.bb
index a015e49..502132f 100644
--- a/recipes-kernel/linux/linux-qoriq-sdk.bb
+++ b/recipes-kernel/linux/linux-qoriq-sdk.bb
@@ -7,11 +7,11 @@ LICENSE =3D "GPLv2"
=20
 require recipes-kernel/linux/linux-qoriq-sdk.inc
=20
-PR =3D "r11"
+PR =3D "${INC_PR}.1"
=20
-SRC_URI +=3D "file://fix_getrusage_for_perf.patch \
-            file://0001-Enable-the-option-Automount-devtmpfs-at-dev-in-k=
erne.patch \
-           "
+DEPENDS_append =3D " libgcc"
+KERNEL_CC_append =3D " ${TOOLCHAIN_OPTIONS}"
+KERNEL_LD_append =3D " ${TOOLCHAIN_OPTIONS}"
=20
 do_configure_prepend() {
 	# copy desired defconfig so we pick it up for the real kernel_do_config=
ure
diff --git a/recipes-kernel/linux/linux-qoriq-sdk.inc b/recipes-kernel/li=
nux/linux-qoriq-sdk.inc
index f77543e..1c66f9b 100644
--- a/recipes-kernel/linux/linux-qoriq-sdk.inc
+++ b/recipes-kernel/linux/linux-qoriq-sdk.inc
@@ -1,11 +1,10 @@
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
=20
-PV =3D "3.0.51"
-PR =3D "r11"
+PV =3D "3.8"
+INC_PR =3D "r11"
=20
-SRCREV =3D "faac5211f398f25e2be44ac996895335d5218516"
+SRCREV =3D "4b66366af2d77de68f4bd6548d07421e13d3df05"
 SRC_URI =3D "git://git.freescale.com/ppc/sdk/linux.git \
-           file://0001-compiler.h-Undef-before-redefining-__attribute_co=
nst.patch \
 	  "
=20
 KSRC ?=3D ""
--=20
1.7.9.5



