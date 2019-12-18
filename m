Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2049B7FB3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 08:42:50 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id x184so834829pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 00:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IdEv4lLsbPazzsauzNfdWuLWvep1FSxFZROF9z2HbS4=;
	b=qzVnGBDopuCzNpeG1bS9+vYdGVsvahBlLtUPoHEQdKmYZwxvLPSSDhSeu+nwrIt7yJ
	BJwXgsMowhiYey7d79+iqEzQYeJFPf1KdFzZufg47y/WbXIeuVZIINASBe3gWALYMgX5
	MeD6pq9aEKDxQMB7ygq4I9gwlq5Ykrq862ebvSEn2MoeHLxif/unDBlFu6TKMMuLcL8D
	+0tLK5AGwmeTl2eyzqYQcKWzT0Lh91HwDFFYBQ0pNV/hlg6BbKLCE7yguCTlBuZcoSKj
	IPfFEWoQCZPhYaAamsYFco8yDTuVgLCVCNt4cc5piZZ9t8R5bQko09KJfXLcLWKTTCvk
	Lq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IdEv4lLsbPazzsauzNfdWuLWvep1FSxFZROF9z2HbS4=;
	b=iF4VZZrK9tOMtQYzgeWrVmpkDAL4ZqIXo5x5GfTmInVkii78v8VDLMXDtScdiRgUc5
	9KQHjO/BN933lDlgjLc8uesB0cnpFN4wRs9aYTdDihfocnsAlsG8qXS9rKNToj7XOpJN
	xzpyXd/AwU0il4OaOZQ5dp7BzDoimnQEVBlxErQy4tnO1RTSivvtm3ODaZHLyFC7nz2B
	zY+vRs/NFXJXSYdvXroCwFPUlqF7wWIZT8b5nqVj4fvvvQNd6i2lrq5KI7tANuRmZUy6
	qez5H7iDzRgNd0WAL9QkQ7v0qWFcPsgORlw73t2Dim1ruzJt5rgD1xPBhcDKpsA8qL6U
	0Oow==
X-Gm-Message-State: APjAAAX1qjcypGDbFfrMTwRo8/bySK2YW28MCe2lltPanKVvBrCbHMEp
	NWakkg6LVvZwsV3HuSoJtK6mI7HP
X-Google-Smtp-Source: APXvYqw33wkAEDByWzcydco0FXlvBwrW/YGCUkiNQnbU5/pLj9dMeBhAGK+spQqkmkcpD/sApg5RVw==
X-Received: by 2002:a63:ec0a:: with SMTP id j10mr1774897pgh.178.1576658571074; 
	Wed, 18 Dec 2019 00:42:51 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	a12sm1988889pga.11.2019.12.18.00.42.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Dec 2019 00:42:50 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 08:42:43 +0000
Message-Id: <1576658565-16680-1-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 1/3] u-boot-fw-utils: Backport a patch for out-of-tree builds
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
X-List-Received-Date: Wed, 18 Dec 2019 08:42:50 -0000

This patch fixs the following error when ${S} != ${B}:
| cp: cannot create regular file 'tools/version.h': No such file or directory

Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
---
 ...sure-tools-directory-exists-in-output-pri.patch | 34 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb |  5 +++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Makefile-Ensure-tools-directory-exists-in-output-pri.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-Makefile-Ensure-tools-directory-exists-in-output-pri.patch b/meta/recipes-bsp/u-boot/files/0001-Makefile-Ensure-tools-directory-exists-in-output-pri.patch
new file mode 100644
index 0000000..b4cadec
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-Makefile-Ensure-tools-directory-exists-in-output-pri.patch
@@ -0,0 +1,34 @@
+From fb013eee68d08403572ef3c579f6688bbe33fd47 Mon Sep 17 00:00:00 2001
+From: Tom Rini <trini@konsulko.com>
+Date: Wed, 4 Dec 2019 18:54:30 -0500
+Subject: [PATCH] Makefile: Ensure tools directory exists in output prior to
+ use
+
+With the change to make tools/version.h a file we need to make sure that
+the output directory exists first otherwise we will get a build failure.
+
+Reported-by: Peter Robinson <pbrobinson@gmail.com>
+Tested-by: Peter Robinson <pbrobinson@gmail.com>
+Fixes: 4d90f6cd9813 ("tools: Avoid creating symbolic links for tools/version.h")
+Signed-off-by: Tom Rini <trini@konsulko.com>
+Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index b6a091a..0766f78 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1889,6 +1889,7 @@ checkarmreloc: u-boot
+ 	fi
+ 
+ tools/version.h: include/version.h
++	$(Q)mkdir -p $(dir $@)
+ 	$(call if_changed,copy)
+ 
+ envtools: scripts_basic $(version_h) $(timestamp_h) tools/version.h
+-- 
+2.7.4
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
index 7de91ff..c30c490 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
@@ -3,7 +3,10 @@ require u-boot-common.inc
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 DEPENDS += "mtd-utils"
 
-SRC_URI += "file://0001-include-env.h-Ensure-ulong-is-defined.patch"
+SRC_URI += " \
+	file://0001-include-env.h-Ensure-ulong-is-defined.patch \
+	file://0001-Makefile-Ensure-tools-directory-exists-in-output-pri.patch \
+	"
 
 INSANE_SKIP_${PN} = "already-stripped"
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" V=1'
-- 
2.7.4


