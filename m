Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6BCC4829E
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:44:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.13725.1707381858906487546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l0M8kmMa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AA111BF207;
	Thu,  8 Feb 2024 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707381857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rpSNVrweZnuALMFbFs+swREpk/mOQJPfG0TVKz6G5n4=;
	b=l0M8kmMaCm7dLaOU9nM9Zs3YSHjgJLpCBU4aE5/3FIVaP3tSLiV5uyqtjmRf69tHcnhcib
	GNMoL960Fp4AVodfcLQbR92dm7NxSe84M17XddfILPU/AocecW4wT2nkW0dy/6WXwcnjGr
	AZSjheDLHVs7WQHFeYJ9HyeDEfdxovdRasRWYfAq/FIH1E/Mkie/kFsQi1d5Sfc4woxLlm
	sqlOrfgDc3Uq3KXtpCjCpS/O2gZL31Slr5aGoA/jiryQvDMZmyDuFoauV6J4L5RbWT5PAp
	UowliXe4s8hb+Zt5IqEjmfak0aYufm8I3zfKazDoidh4R9JYAO8uKcfXEwz60g==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v3 4/4] alsa-utils: upgrade 1.2.10 -> 1.2.11
Date: Thu,  8 Feb 2024 09:44:06 +0100
Message-Id: <20240208084406.3621627-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208084406.3621627-1-michael.opdenacker@bootlin.com>
References: <20240208084406.3621627-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195118

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Upstream release upgrade
  See https://www.alsa-project.org/wiki/Detailed_changes_v1.2.10_v1.2.11
- Remove merged patches

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 ...nhlt-dmic-info.c-include-sys-types.h.patch | 31 -------------------
 .../0001-topology.c-include-locale.h.patch    | 31 -------------------
 ...a-utils_1.2.10.bb => alsa-utils_1.2.11.bb} |  4 +--
 3 files changed, 1 insertion(+), 65 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.10.bb => alsa-utils_1.2.11.bb} (96%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
deleted file mode 100644
index 0ebf98b41e..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 35a3382f3818d29b60f4c888e338189a4d93d0e5 Mon Sep 17 00:00:00 2001
-From: Michael Opdenacker <michael.opdenacker@bootlin.com>
-Date: Tue, 19 Sep 2023 11:47:50 +0200
-Subject: [PATCH] nhlt/nhlt-dmic-info.c: include sys/types.h
-
-To fix an issue compiling with the musl C library:
-nhlt-dmic-info.c: error: unknown type name 'u_int8_t'
-
-https://github.com/alsa-project/alsa-utils/issues/238
-
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/0925ad7f09b2dc77015784f9ac2f5e34dd0dd5c3]
-Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
----
- nhlt/nhlt-dmic-info.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/nhlt/nhlt-dmic-info.c b/nhlt/nhlt-dmic-info.c
-index 3f6c64d..331555a 100644
---- a/nhlt/nhlt-dmic-info.c
-+++ b/nhlt/nhlt-dmic-info.c
-@@ -33,6 +33,7 @@
- #include <fcntl.h>
- #include <getopt.h>
- #include <sys/stat.h>
-+#include <sys/types.h>
- #include <arpa/inet.h>
- 
- int debug = 0;
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
deleted file mode 100644
index e1c7470356..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d8a8a9affd5726827ef3995652248595b4a8c87e Mon Sep 17 00:00:00 2001
-From: Michael Opdenacker <michael.opdenacker@bootlin.com>
-Date: Tue, 19 Sep 2023 11:27:46 +0200
-Subject: [PATCH] topology.c: include locale.h
-
-To fix an issue compiling with the musl C library:
-topology.c: error: 'LC_ALL' undeclared
-
-https://github.com/alsa-project/alsa-utils/issues/239
-
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/8c229270f6bae83b705a03714c46067a7aa57b02]
-Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
----
- topology/topology.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/topology/topology.c b/topology/topology.c
-index 1840ffe..5d03a8b 100644
---- a/topology/topology.c
-+++ b/topology/topology.c
-@@ -32,6 +32,7 @@
- #include <sys/stat.h>
- #include <getopt.h>
- #include <assert.h>
-+#include <locale.h>
- 
- #include <alsa/asoundlib.h>
- #include <alsa/topology.h>
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb
similarity index 96%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb
index 4e5ed8dfa0..e598fac9f8 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb
@@ -25,10 +25,8 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://0001-topology.c-include-locale.h.patch \
-           file://0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch \
            "
-SRC_URI[sha256sum] = "104b62ec7f02a7ce16ca779f4815616df1cc21933503783a9107b5944f83063a"
+SRC_URI[sha256sum] = "9ac6ca3a883f151e568dcf979b8d2e5cbecc51b819bb0e6bb8a2e9b34cc428a7"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.34.1


