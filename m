Return-Path: <peter.griffin@linaro.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 376F97DDC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 09:55:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c5so1900723wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=tos4AR0RiQ8n2A8e6DtL9Ywt9V07o9bz/i5qlmAShqI=;
	b=eTue/F1Ur3Y60RaX4pHlZbISslNPUWRcuL+4BGya5TusNfxB/MjAilVKcWtiBVOraK
	p1UCAwqimvwWjHi6rNk/KevH4zjy6/sDnyR0MZLqzn2sawO+VLo9rarNlz3xsD9UJlxV
	lozFnfLV2QLUdrt2aHPghFE4MV/R4nDYBp8+SfIYC7gi4mU6w92AKSqLK4HOJfJ7bjTY
	VWu7Q7DKYDHEfu6Fk0bUm4PBcDvP34bE72lkGDAY3dL4g4/wz/l/a4jBbV9y3/P9OlmJ
	QhdOLrzFr4m6w5EJXxKtMiWnNoXc0HFJSCMPrhd+/xD+eaRn0nTsu4gP6FjWAvTkrbo0
	5Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tos4AR0RiQ8n2A8e6DtL9Ywt9V07o9bz/i5qlmAShqI=;
	b=pitJx0XEY/BcnnSci9nGcSwpjNyhCubfN/TZFImbw43bl7mA4KaJxFChZ5Jvecn2gS
	/+PJujRQXiiy2eOt1+nLrpSny614A4h6CrC5CFA6hyWfzsBnEG/+N8AKpDbeFCEKU4pl
	wyWNKRDF1l+lOEtrL9NhuubAFoFP3somsI/Fs9OnngWei1pOKXgiPwEnSfcoGdXPkv/5
	2RlKrNybMf3dRnH7AOKT2mpgeSqcl/iqicn2dnyS7khY0pAxxsRGco+TpbSCcs8qLkhv
	tPSorpP7jcYTYgMD7EwwXPSHD4WgwdkhuC+Ha85sA/rASV4F54ZrjVJn5GNnmwsLyw1L
	J0gg==
X-Gm-Message-State: APjAAAW1pA3nzaNqLLaSfCNuS3pc1ZmDdNXJoHYVXEv5ldtw+bBbK9fF
	QXOeebdcqzL/4m0yOOIVlWnliW5mW0o=
X-Google-Smtp-Source: APXvYqxRyaiSB0DRHfMnra/0cbRl4/9T99hjkuEqQCrYeL8dfDGe6Ho8TVUNLVcPOz4/4CmASFqOlQ==
X-Received: by 2002:a5d:6610:: with SMTP id n16mr16912624wru.250.1557914115636;
	Wed, 15 May 2019 02:55:15 -0700 (PDT)
Received: from localhost.localdomain
	(cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net.
	[86.31.179.135]) by smtp.gmail.com with ESMTPSA id
	l127sm2606987wml.40.2019.05.15.02.55.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 May 2019 02:55:14 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: openembedded-core@lists.openembedded.org,
	nicolas.dechesne@linaro.org
Date: Wed, 15 May 2019 10:55:11 +0100
Message-Id: <1557914111-18756-1-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4
Subject: [<thud> v2] mesa: Add backport of freedreno dmabuf modifiers patch.
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
X-List-Received-Date: Wed, 15 May 2019 09:55:15 -0000

This is required to get weston-simple-dmabuf-drm to work
and also now required by Chromium v73 ozone-wayland backend.

It is present in mesa 19.0, backporting to Thud which is
on 18.1.9.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 ...-freedreno-add-query-for-dmabuf-modifiers.patch | 101 +++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_18.1.9.bb          |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch
new file mode 100644
index 0000000..57ebd8f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch
@@ -0,0 +1,101 @@
+From c4bee1a1b3fb224002fe8c263bedbce1b705ed49 Mon Sep 17 00:00:00 2001
+From: Peter Griffin <peter.griffin@linaro.org>
+Date: Mon, 13 May 2019 19:18:56 +0100
+Subject: [PATCH] freedreno: add query for dmabuf modifiers
+
+Backport of mesa 7c4b9510d by Fritz Koenig. Tested with Weston
+and weston-simple-dmabuf-drm client.
+
+Upstream-Status: Backport from 19.0
+
+Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
+---
+ src/gallium/drivers/freedreno/freedreno_screen.c | 43 ++++++++++++++++++++++++
+ src/gallium/drivers/freedreno/freedreno_screen.h |  3 ++
+ 2 files changed, 46 insertions(+)
+
+diff --git a/src/gallium/drivers/freedreno/freedreno_screen.c b/src/gallium/drivers/freedreno/freedreno_screen.c
+index f338d75..cbb5b8a 100644
+--- a/src/gallium/drivers/freedreno/freedreno_screen.c
++++ b/src/gallium/drivers/freedreno/freedreno_screen.c
+@@ -40,6 +40,7 @@
+ 
+ #include "util/os_time.h"
+ 
++#include <drm_fourcc.h>
+ #include <errno.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -732,6 +733,37 @@ fd_screen_bo_get_handle(struct pipe_screen *pscreen,
+ 	}
+ }
+ 
++static void
++fd_screen_query_dmabuf_modifiers(struct pipe_screen *pscreen,
++		enum pipe_format format,
++		int max, uint64_t *modifiers,
++		unsigned int *external_only,
++		int *count)
++{
++	struct fd_screen *screen = fd_screen(pscreen);
++	int i, num = 0;
++
++	max = MIN2(max, screen->num_supported_modifiers);
++
++	if (!max) {
++		max = screen->num_supported_modifiers;
++		external_only = NULL;
++		modifiers = NULL;
++	}
++
++	for (i = 0; i < max; i++) {
++		if (modifiers)
++			modifiers[num] = screen->supported_modifiers[i];
++
++		if (external_only)
++			external_only[num] = 0;
++
++		num++;
++	}
++
++	*count = num;
++}
++
+ struct fd_bo *
+ fd_screen_bo_from_handle(struct pipe_screen *pscreen,
+ 		struct winsys_handle *whandle)
+@@ -921,6 +953,17 @@ fd_screen_create(struct fd_device *dev)
+ 	pscreen->fence_finish = fd_fence_finish;
+ 	pscreen->fence_get_fd = fd_fence_get_fd;
+ 
++	pscreen->query_dmabuf_modifiers = fd_screen_query_dmabuf_modifiers;
++
++	if (!screen->supported_modifiers) {
++		static const uint64_t supported_modifiers[] = {
++			DRM_FORMAT_MOD_LINEAR,
++		};
++
++		screen->supported_modifiers = supported_modifiers;
++		screen->num_supported_modifiers = ARRAY_SIZE(supported_modifiers);
++	}
++
+ 	slab_create_parent(&screen->transfer_pool, sizeof(struct fd_transfer), 16);
+ 
+ 	return pscreen;
+diff --git a/src/gallium/drivers/freedreno/freedreno_screen.h b/src/gallium/drivers/freedreno/freedreno_screen.h
+index 6be739a..5558066 100644
+--- a/src/gallium/drivers/freedreno/freedreno_screen.h
++++ b/src/gallium/drivers/freedreno/freedreno_screen.h
+@@ -89,6 +89,9 @@ struct fd_screen {
+ 	struct fd_batch_cache batch_cache;
+ 
+ 	bool reorder;
++
++	unsigned num_supported_modifiers;
++	const uint64_t *supported_modifiers;	
+ };
+ 
+ static inline struct fd_screen *
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.9.bb b/meta/recipes-graphics/mesa/mesa_18.1.9.bb
index 86d6a6b..0558690 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.9.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.1.9.bb
@@ -7,6 +7,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0004-Use-Python-3-to-execute-the-scripts.patch \
            file://0005-dri-i965-Add-missing-time.h-include.patch \
            file://0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
+           file://0001-freedreno-add-query-for-dmabuf-modifiers.patch \
 "
 
 SRC_URI[md5sum] = "2f8d2098ab478bc3907e42130577b54a"
-- 
2.7.4


