Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F737FF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 17:17:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1562.1777483059368892612
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 10:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=tXXsJIwk;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 49FD8C5CD5C;
	Wed, 29 Apr 2026 17:18:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B413601DF;
	Wed, 29 Apr 2026 17:17:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97AF11072B0FB;
	Wed, 29 Apr 2026 19:17:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777483056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=b9eUmtYssw3RWBlrVJhq5tPHF66Lz6VO6vooalXyDPo=;
	b=tXXsJIwkDJsJTnjnJyH+RqibOETScA1l1ovkMn+B0UzRojI1vRDK58XBMCsnnvWpET/Sf/
	2OH1R7XNPuc6H5jtnIbUs1n3ambfJLtFWrGpIyUekYp8uYW2EDl290KfuglUE4tm0MRXzU
	3y46dOeWNwQ3RkrIq/xKMIzzqbI9sGQwjEVGuhEg6P3VNbBzbxdqUFNVBoIatcRxNopNuB
	QU5WtaE2Mid71dX7klNQ1ArjpEMJPAd6Pc0AFH02MSCJgxVlAgVaaxwHHVbIudkAmUyb+1
	5dfp6nOZ6PE/y097ObYjy5lIl6IlSNqtCBMtPczuPP3YJojFT4cCrfmN/twAwQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	marek.vasut@mailbox.org,
	festevam@gmail.com,
	khem.raj@oss.qualcomm.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] u-boot-tools: drop yaml in DT validation
Date: Wed, 29 Apr 2026 19:17:23 +0200
Message-ID: <20260429171723.167639-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 17:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236127

Since yamltree was dropped from upstream dtc (i.e., in Linux), a patch wa=
s
sent to U-Boot to backport the corresponding changes.

Apply this patch in u-boot's sources.

Overall, this fixes the build-time issues with DTC (and so in
u-boot-tools).

Considering libyaml is no longer used, the dependency on libyaml-native c=
an be
dropped as well (thus reverting the change below):

02e09e036e: u-boot-tools: Add dependency on libyaml for dtschema validati=
on

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 ...ripts-dtc-drop-yaml-in-DT-validation.patch | 85 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-tools.inc      |  2 +-
 meta/recipes-bsp/u-boot/u-boot_2026.04.bb     |  1 +
 3 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-y=
aml-in-DT-validation.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-=
DT-validation.patch b/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop=
-yaml-in-DT-validation.patch
new file mode 100644
index 0000000000..4913366102
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-vali=
dation.patch
@@ -0,0 +1,85 @@
+From e77402000f978561ff2afe405aa9e5c9037a8717 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.cos=
ta@bootlin.com>
+Date: Wed, 29 Apr 2026 15:22:25 +0200
+Subject: [PATCH] scripts/dtc: drop yaml in DT validation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The build issues found in dtc/yamltree were partially mitigated by a
+previous commit (807bcd844a: "scripts/dtc: Fix pkg-config behavior under
+sysroot"), but upstream dtc simply disabled yaml, and the same should be
+done here in order to permanently avoid those issues.
+
+Backport the change below from Linux v5.18 [1]:
+
+ef8795f3f1c ("dt-bindings: kbuild: Use DTB files for validation")
+
+I tested this patch with a couple Yocto builds: u-boot and u-boot-tools,
+using the current master branch (rev. "c53b0708f9"), having removed
+libyaml-native from u-boot-tools's dependencies.
+
+[1] https://git.kernel.org/linus/ef8795f3f1ce
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+
+Upstream-Status: Submitted [https://lore.kernel.org/u-boot/2026042914461=
5.142350-1-joaomarcos.costa@bootlin.com/]
+---
+ scripts/Makefile.lib             | 6 ------
+ scripts/dtc/Makefile             | 8 --------
+ scripts/dtc/update-dtc-source.sh | 2 +-
+ 3 files changed, 1 insertion(+), 15 deletions(-)
+
+diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
+index b8969b7de54..d66f1ed13b1 100644
+--- a/scripts/Makefile.lib
++++ b/scripts/Makefile.lib
+@@ -86,12 +86,6 @@ base-dtb-y :=3D $(foreach m, $(multi-dtb-y), $(firstw=
ord $(call suffix-search, $m,
+ extra-y				+=3D $(dtb-y)
+ extra-$(CONFIG_OF_ALL_DTBS)	+=3D $(dtb-)
+=20
+-# U-Boot specific
+-ifneq ($(CHECK_DTBS),)
+-extra-y +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
+-extra-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-))
+-endif
+-
+ # Add subdir path
+=20
+ extra-y		:=3D $(addprefix $(obj)/,$(extra-y))
+diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
+index 6f309b37e08..2ba8dba03be 100644
+--- a/scripts/dtc/Makefile
++++ b/scripts/dtc/Makefile
+@@ -17,15 +17,7 @@ fdtoverlay-objs	:=3D $(libfdt) fdtoverlay.o util.o
+ # Source files need to get at the userspace version of libfdt_env.h to =
compile
+ HOST_EXTRACFLAGS :=3D -I$(srctree)/$(src)/libfdt
+=20
+-ifeq ($(wildcard $(PKG_CONFIG_SYSROOT_DIR)/usr/include/yaml.h),)
+ HOST_EXTRACFLAGS +=3D -DNO_YAML
+-else
+-dtc-objs	+=3D yamltree.o
+-# To include <yaml.h> installed in a non-default path
+-HOSTCFLAGS_yamltree.o :=3D $(shell pkg-config --cflags yaml-0.1)
+-# To link libyaml installed in a non-default path
+-HOSTLDLIBS_dtc	:=3D $(shell pkg-config --libs yaml-0.1)
+-endif
+=20
+ # Generated files need one more search path to include headers in sourc=
e tree
+ HOSTCFLAGS_dtc-lexer.lex.o :=3D -I$(src)
+diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-s=
ource.sh
+index 32ff17ffd08..94627541533 100755
+--- a/scripts/dtc/update-dtc-source.sh
++++ b/scripts/dtc/update-dtc-source.sh
+@@ -32,7 +32,7 @@ DTC_UPSTREAM_PATH=3D`pwd`/../dtc
+ DTC_LINUX_PATH=3D`pwd`/scripts/dtc
+=20
+ DTC_SOURCE=3D"checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.=
c srcpos.c \
+-		srcpos.h treesource.c util.c util.h version_gen.h yamltree.c \
++		srcpos.h treesource.c util.c util.h version_gen.h \
+ 		dtc-lexer.l dtc-parser.y"
+ LIBFDT_SOURCE=3D"fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
+ 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
+--=20
+2.47.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/=
u-boot/u-boot-tools.inc
index a055409c2c..4e4f7fa092 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -1,5 +1,5 @@
 SUMMARY =3D "U-Boot bootloader tools"
-DEPENDS +=3D "gnutls openssl util-linux swig-native libyaml-native"
+DEPENDS +=3D "gnutls openssl util-linux swig-native"
=20
 inherit python3native
 export STAGING_INCDIR =3D "${STAGING_INCDIR_NATIVE}"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.04.bb b/meta/recipes-bsp=
/u-boot/u-boot_2026.04.bb
index 5259fd5832..9f09d91daa 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
@@ -14,6 +14,7 @@ SRC_URI_RISCV =3D "\
     ${@bb.utils.contains    ("TUNE_FEATURES", "d",      "file://u-boot-r=
iscv-isa_d.cfg", "", d)} \
     ${@bb.utils.contains_any("TUNE_FEATURES", "b zbb",  "file://u-boot-r=
iscv-isa_zbb.cfg", "", d)} \
     ${@bb.utils.contains    ("TUNE_FEATURES", "zicbom", "file://u-boot-r=
iscv-isa_zicbom.cfg", "", d)} \
+    file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch \
     "
=20
 SRC_URI:append:riscv32 =3D "${SRC_URI_RISCV}"
--=20
2.47.0


