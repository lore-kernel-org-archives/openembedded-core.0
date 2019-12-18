Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 950F57FE61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 09:58:00 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id y8so730272pll.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 01:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=d3Dt+WEaptALTxP1IVa9iQrw55iU+Nln1wtse/f8xrs=;
	b=bXH8oFmhuZ0sbRVeg3woh2Ir1u7OLzshoP3yUOM1BUL+7XCofcsJjnYEsgfn6gtNZd
	gS4SHxMukpGVje7j5I/9SSeVb0oOlYsWrH8PzpKLQy8KUPhmwYwhnGboSc+4UAG9Umj0
	xcgv54tWkhHTZIMcAd1F8LUkMVlJFu085+ym6tjWCO5Ukwx4O9LwJOI66P8j4PJhkKGg
	Jo045NNdI2L0F79kER0iUUI1dpDV6bDQrLRqexY/unOIpq4+5TNlHQNcbEmFra4EQYJ+
	tSvS808Q/k8wxQQdFojZIG53v27Q2JEbFk0JFyAdWFSdGVMRKi9gtlkkB+6Kn3Kk6QRZ
	V+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d3Dt+WEaptALTxP1IVa9iQrw55iU+Nln1wtse/f8xrs=;
	b=UCIChMk8dWZ4mdStvgU8GcGQDyna50lE979GsXrnYKKx5GA5ep1uEnM04liORnMyrX
	u3OOlGl2yl/sQfDy/gBBR41nN97TTRdt+/lgDF0WdGgvLQKmSDCl+EqE4jiBBopho/bW
	7NWasziNCuA1HlxASlp2yvOA4P/72ACP3qtYcL5lKHiAO10dXrWf1mT5JKw1Q6mXw+Qf
	6gvmfbbgqmFiYuDVpMg6+LAxzpuLSUjzvczPXYmQWJqOHKB2G5X5ga8Axc9+OowT+NLW
	rc5E7pQ08mOe2jHOmCNXR4oCSyy12fEV2Zfd6/o/lw4nhdvIrd33avvY14ZV3RZOK++k
	Tu9w==
X-Gm-Message-State: APjAAAV8lKAlPJ3ydk6tlwi06HKtG6RiHd+cC5G+mluvfkdVFwOiMDaE
	RvJljKTrgV7rADYNmsSd6HhX3DXV
X-Google-Smtp-Source: APXvYqyygs0QpGsIdXWghcZFJLODwXevfW4HCt/O55i6sHGolW1f3w1jk1gMOvZUo3HJik+qDu9Gkw==
X-Received: by 2002:a17:902:8ec5:: with SMTP id
	x5mr1748420plo.208.1576663081534; 
	Wed, 18 Dec 2019 01:58:01 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	j38sm2411501pgj.27.2019.12.18.01.58.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Dec 2019 01:58:01 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 09:57:48 +0000
Message-Id: <1576663070-30914-1-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3 1/3] u-boot-fw-utils: Backport a patch for out-of-tree builds
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
X-List-Received-Date: Wed, 18 Dec 2019 09:58:00 -0000

This patch fixs the following error of u-boot-fw-utils when ${S} != ${B}:
| cp: cannot create regular file 'tools/version.h': No such file or directory

Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
---
 ...sure-tools-directory-exists-in-output-pri.patch | 41 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb |  5 ++-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Makefile-Ensure-tools-directory-exists-in-output-pri.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-Makefile-Ensure-tools-directory-exists-in-output-pri.patch b/meta/recipes-bsp/u-boot/files/0001-Makefile-Ensure-tools-directory-exists-in-output-pri.patch
new file mode 100644
index 0000000..217c500
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-Makefile-Ensure-tools-directory-exists-in-output-pri.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Backport [https://gitlab.denx.de/u-boot/u-boot/commit/fb013eee68d08403572ef3c579f6688bbe33fd47]
+
+This patch fixs the following error of u-boot-fw-utils when ${S} != ${B}:
+| cp: cannot create regular file 'tools/version.h': No such file or directory
+
+Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
+
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


