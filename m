Return-Path: <zev@bewilderbeest.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2662DC433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 06:48:38 +0000 (UTC)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 by mx.groups.io with SMTP id smtpd.web12.3177.1642574916507867468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 22:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@bewilderbeest.net
 header.s=thorn header.b=BwAbs/qh;
 spf=pass (domain: bewilderbeest.net, ip: 71.19.156.171,
 mailfrom: zev@bewilderbeest.net)
Received: from hatter.bewilderbeest.net (174-21-190-118.tukw.qwest.net
 [174.21.190.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 18D48135;
	Tue, 18 Jan 2022 22:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1642574916;
	bh=cXqNS9oxeWnPCgtLPMam07e5ji5JmEjZaiMzj3q0aGg=;
	h=From:To:Cc:Subject:Date:From;
	b=BwAbs/qhbbnUrn+Prpl/a+GLc1AY57gDguxIpIDlLbvE9Cij5gURBJRc8HqeIJT+b
	 mId3daWW/wG/ord2/UzGIKqcjuVl2Gn8IAsRrhBeowQzAfAmc1ZyByFXCAfXnT5oNu
	 h8t8tAUY2HeftNz3Ac7HEBGn4rSQTMUSxv3K5rWc=
From: Zev Weiss <zev@bewilderbeest.net>
To: openembedded-core@lists.openembedded.org
Cc: Zev Weiss <zev@bewilderbeest.net>,
	openbmc@lists.ozlabs.org
Subject: [OE-core][PATCH] u-boot: Split do_configure logic into separate file
Date: Tue, 18 Jan 2022 22:48:12 -0800
Message-Id: <20220119064812.17824-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 06:48:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160690

Some auxiliary u-boot recipes may need u-boot properly configured
(including *.cfg additions via bbappends) but aren't necessarily
building u-boot itself; to support such situations, here we split the
u-boot do_configure() out of u-boot.inc and into its own
u-boot-configure.inc.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 meta/recipes-bsp/u-boot/u-boot-configure.inc | 39 ++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc           | 31 +---------------
 2 files changed, 40 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-configure.inc

diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc b/meta/recipes-=
bsp/u-boot/u-boot-configure.inc
new file mode 100644
index 000000000000..04e0894752f4
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
@@ -0,0 +1,39 @@
+# This provides the logic for creating the desired u-boot config,
+# accounting for any *.cfg files added to SRC_URI.  It's separated
+# from u-boot.inc for use by recipes that need u-boot properly
+# configured but aren't doing a full build of u-boot itself (such as
+# its companion tools).
+
+inherit uboot-config cml1
+
+DEPENDS +=3D "kern-tools-native"
+
+do_configure () {
+    if [ -n "${UBOOT_CONFIG}" ]; then
+        unset i j
+        for config in ${UBOOT_MACHINE}; do
+            i=3D$(expr $i + 1);
+            for type in ${UBOOT_CONFIG}; do
+                j=3D$(expr $j + 1);
+                if [ $j -eq $i ]; then
+                    oe_runmake -C ${S} O=3D${B}/${config} ${config}
+                    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
+                        merge_config.sh -m -O ${B}/${config} ${B}/${conf=
ig}/.config ${@" ".join(find_cfgs(d))}
+                        oe_runmake -C ${S} O=3D${B}/${config} oldconfig
+                    fi
+                fi
+            done
+            unset j
+        done
+        unset i
+        DEVTOOL_DISABLE_MENUCONFIG=3Dtrue
+    else
+        if [ -n "${UBOOT_MACHINE}" ]; then
+            oe_runmake -C ${S} O=3D${B} ${UBOOT_MACHINE}
+        else
+            oe_runmake -C ${S} O=3D${B} oldconfig
+        fi
+        merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
+        cml1_do_configure
+    fi
+}
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
index 2d5e46f4ef1c..f022aed732ce 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -3,7 +3,6 @@ PROVIDES =3D "virtual/bootloader"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-DEPENDS +=3D "kern-tools-native"
 DEPENDS +=3D "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mk=
image-native', '', d)}"
=20
 inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python=
3native kernel-arch
@@ -25,35 +24,7 @@ PACKAGECONFIG[openssl] =3D ",,openssl-native"
 # file already exists it will not be overwritten.
 UBOOT_LOCALVERSION ?=3D ""
=20
-do_configure () {
-    if [ -n "${UBOOT_CONFIG}" ]; then
-        unset i j
-        for config in ${UBOOT_MACHINE}; do
-            i=3D$(expr $i + 1);
-            for type in ${UBOOT_CONFIG}; do
-                j=3D$(expr $j + 1);
-                if [ $j -eq $i ]; then
-                    oe_runmake -C ${S} O=3D${B}/${config} ${config}
-                    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
-                        merge_config.sh -m -O ${B}/${config} ${B}/${conf=
ig}/.config ${@" ".join(find_cfgs(d))}
-                        oe_runmake -C ${S} O=3D${B}/${config} oldconfig
-                    fi
-                fi
-            done
-            unset j
-        done
-        unset i
-        DEVTOOL_DISABLE_MENUCONFIG=3Dtrue
-    else
-        if [ -n "${UBOOT_MACHINE}" ]; then
-            oe_runmake -C ${S} O=3D${B} ${UBOOT_MACHINE}
-        else
-            oe_runmake -C ${S} O=3D${B} oldconfig
-        fi
-        merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
-        cml1_do_configure
-    fi
-}
+require u-boot-configure.inc
=20
 do_compile () {
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; th=
en
--=20
2.33.0


