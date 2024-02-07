Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47DEC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 21:45:41 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.2638.1707342332887443425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 13:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HcW4nwIR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AD9C1BF208;
	Wed,  7 Feb 2024 21:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707342331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rpSNVrweZnuALMFbFs+swREpk/mOQJPfG0TVKz6G5n4=;
	b=HcW4nwIRvCwmHEoAZkZE4eDBcc/EyJbH2+1G2VNGyeDdaNH0jWbbM0C2uw84H6b/FaveIw
	QiVqWoyo2GyhJUuhINF2BOZMBMJ+XBQXIPfR9uWGkXY73oDprdtnde8ZK3z5cCqyen/Kms
	973P5zWyFfueRhGnckuVy7v/zb4icrGxRNGb6AQcW16IzWVVgtIdo39eCfYJWdGLVUZwVg
	Fip5tVO+4jY0EoF7E/QWZfbyQlhCHB+sjHRyamSpCn3mxTfRJeuj/s+8iqsLQnrQinMtk5
	lg3u5Qn3QIeM3wAh/9bdnQGumfjs+nqgzhENXdwMYIbCTiBqQkwkKeOcu/chAA==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 4/4] alsa-utils: upgrade 1.2.10 -> 1.2.11
Date: Wed,  7 Feb 2024 22:45:07 +0100
Message-Id: <20240207214507.3603517-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207214507.3603517-1-michael.opdenacker@bootlin.com>
References: <20240207214507.3603517-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 21:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195083

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


