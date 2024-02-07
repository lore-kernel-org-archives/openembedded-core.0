Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088D7C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 21:45:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.2630.1707342319132073265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 13:45:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NFf/1iaF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 125CE40007;
	Wed,  7 Feb 2024 21:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707342317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mfV4S9CWbHTYl+Lqbc+PPyquwHQwrn7zGb8ZJshwkCE=;
	b=NFf/1iaFdBTp7flVfTceSSi8ly7ULx+pKlS2Ps3nLmFg09O+/m2fE1HgVkUwdtl1s3RFo8
	nSSMr90jJODns+bi3p0KzdreFp+2FU6Q/7aXFcKFGiy5fgROXT/MR52Ez+hDO+ZauybRkS
	R9thK/7/QSZwVRSJ7dO5P8uqvb4UoukCx/7mtqF+V8kPVmG8e5twECuyyQr2wkLCvhc9Kp
	Ifwu8hYXhtSpDffcsS9rG3j2ms98U7N1CKpaPYKR8Z+Qx4sUWTu6QnWm/vaSIhgXFEJQqf
	Nl4p4AzhwgNvcnD7BVU8kQAyXovaitsVRNgMdUpTPcM7/P6MY8CDRqYZUqpbSg==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/4] alsa-lib: upgrade 1.2.10 -> 1.2.11
Date: Wed,  7 Feb 2024 22:45:04 +0100
Message-Id: <20240207214507.3603517-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 21:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195080

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Upstream release update
  See https://www.alsa-project.org/wiki/Detailed_changes_v1.2.10_v1.2.11
- Remove merged patch
- Add new patch merged after the release

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 ...STRING-macro-outside-PIC-ifdef-block.patch | 52 -------------------
 ...topology-correct-version-script-path.patch | 38 ++++++++++++++
 ...{alsa-lib_1.2.10.bb => alsa-lib_1.2.11.bb} |  4 +-
 3 files changed, 40 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-topology-correct-version-script-path.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.10.bb => alsa-lib_1.2.11.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch
deleted file mode 100644
index 9a7ba0d847..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 10bd599970acc71c92f85eb08943eb8d3d702a9c Mon Sep 17 00:00:00 2001
-From: Michael Opdenacker <michael.opdenacker@bootlin.com>
-Date: Wed, 6 Sep 2023 15:16:44 +0200
-Subject: [PATCH] global.h: move __STRING() macro outside !PIC ifdef block
-
-From: Jaroslav Kysela <perex@perex.cz>
-
-It solves the musl libc compilation issue.
-
-control.c: In function 'snd_ctl_open_conf':
-../../include/global.h:98:36: warning: implicit declaration of function '__STRING' [-Wimplicit-function-declaratio]
-   98 | #define SND_DLSYM_VERSION(version) __STRING(version)
-      |                                    ^~~~~~~~
-
-Fixes: https://github.com/alsa-project/alsa-lib/issues/350
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/10bd599970acc71c92f85eb08943eb8d3d702a9c]
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
----
- include/global.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/include/global.h b/include/global.h
-index dfe9bc2b..3ecaeee8 100644
---- a/include/global.h
-+++ b/include/global.h
-@@ -51,6 +51,11 @@ const char *snd_asoundlib_version(void);
- #define ATTRIBUTE_UNUSED __attribute__ ((__unused__))
- #endif
- 
-+#ifndef __STRING
-+/** \brief Return 'x' argument as string */
-+#define __STRING(x)     #x
-+#endif
-+
- #ifdef PIC /* dynamic build */
- 
- /** \hideinitializer \brief Helper macro for #SND_DLSYM_BUILD_VERSION. */
-@@ -71,11 +76,6 @@ struct snd_dlsym_link {
- 
- extern struct snd_dlsym_link *snd_dlsym_start;
- 
--#ifndef __STRING
--/** \brief Return 'x' argument as string */
--#define __STRING(x)     #x
--#endif
--
- /** \hideinitializer \brief Helper macro for #SND_DLSYM_BUILD_VERSION. */
- #define __SND_DLSYM_VERSION(prefix, name, version) _ ## prefix ## name ## version
- /**
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-topology-correct-version-script-path.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-topology-correct-version-script-path.patch
new file mode 100644
index 0000000000..30aeef5817
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-topology-correct-version-script-path.patch
@@ -0,0 +1,38 @@
+From 2a736a0d2543f206fd2653aaae8a08a4c42eb917 Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Date: Tue, 30 Jan 2024 14:24:25 +0100
+Subject: [PATCH] topology: correct version script path
+
+From: Jan Palus <jpalus@fastmail.com>
+
+contrary to libasound, version script for libatopology is a regular
+source file. while it's often the case that $(builddir) and $(srcdir)
+point to the same directory, they don't always have to. therefore path
+needs to point explicitly to $(srcdir) for Versions script in topology
+
+Closes: https://github.com/alsa-project/alsa-lib/pull/383
+Fixes: GH-382
+Fixes: dc7da761f3a2 ("topology: separate Versions linker script")
+Signed-off-by: Jan Palus <jpalus@fastmail.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Upstream-Status: Backport [https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=2a736a0d2543f206fd2653aaae8a08a4c42eb917]
+---
+ src/topology/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/topology/Makefile.am b/src/topology/Makefile.am
+index 04299588..e0b78373 100644
+--- a/src/topology/Makefile.am
++++ b/src/topology/Makefile.am
+@@ -2,7 +2,7 @@ EXTRA_DIST = Versions
+ COMPATNUM=@LIBTOOL_VERSION_INFO@
+ 
+ if VERSIONED_SYMBOLS
+-VSYMS = -Wl,--version-script=Versions
++VSYMS = -Wl,--version-script=$(srcdir)/Versions
+ else
+ VSYMS =
+ endif
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
index 83bc6877d2..c212b17aa3 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
-           file://0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch \
+           file://0001-topology-correct-version-script-path.patch \
            "
-SRC_URI[sha256sum] = "c86a45a846331b1b0aa6e6be100be2a7aef92efd405cf6bac7eef8174baa920e"
+SRC_URI[sha256sum] = "9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be30e14662795bb4d"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


