Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529FBE73179
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 13:54:38 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52585.1770040471373669432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 05:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uw7e0fPW;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c710439535so354303885a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 05:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770040469; x=1770645269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJxVyP77d+nCi9LYVxQusbk0HIddws7MXlYM4Vjhqe8=;
        b=Uw7e0fPWKTPJOqfgZUBdaJ6zpAl/0nDlErs5eo0TG9u9cyeayO67wad2cN3e1lXZ+z
         mtjkiXJEnPQ+qjqj2d3kXN/kdczt5/ATHT3GemUReeX2sufrdV3reuWikKz13nzz6XO6
         anQjhHeZCNCOGpMSXku/+iftHjqHQKGci3wQZELkrybcvqkZ8QGv8MXmLLOoabU1v29n
         zbI01qb1FcPZsqmMSj+wLibVmS00twvnTr5OiYV9vOvpwwNMnQJYI5adUMw45GG0A7xr
         McyUSyOqcAZ7RM3ep+hzlggbf4yDUzGtML/BzOg+rsd9R3G/rM8QJfjTdauttsLjlGYj
         ffCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040469; x=1770645269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJxVyP77d+nCi9LYVxQusbk0HIddws7MXlYM4Vjhqe8=;
        b=A/04ocqYsCsHukQSq9ouYjOkNMPTgQlbyS/AxJT3BfcPsXJubX7Oj51ujhnJFupPng
         juwSOUj96pFb+PLGIfTNoggKBFI1ymIS/EQZdpZcusG/AwAVkPp0OQGqYVsiC9vp4Ama
         bUXG7deCHVdz+RJy6S7FTgoCzWr+Bie04nlvnZaZCsIkJSMA2dnRqhH1W/915uDA2/Bt
         BAp1pcRQuS2G4s6rUzLnCRUskARxP9MfzST6xSre9ntZw0Vj9zsyrzlLakg1jvZtUXdq
         mak4NONn2CnhEdL0XH6nTP9YaO+42EslhRubb6HMY0dzADBLG3DMXlctDWsyk8MYKec0
         nKJA==
X-Gm-Message-State: AOJu0Yyn+ERVrhasdWOaHOKo1G0TNv0IVabNkjiGmTw6tDFOIuYTk3A0
	UyaycM2pX8v9WZLT2KiQixkYS3WEXxhsE5jLs2YjWRSVn8VfZzB0W1B7IRjYYw==
X-Gm-Gg: AZuq6aIE+DTDq1A9zhIWt24DmpRn1tn/jn4gFdkEzlZo9BV1v0jyItsxqrGLkLOTDdQ
	5A9Yx0/m7l+Cp5ojFIYWbsdcf2LEcZxuEhwtuqhj35IvfJZ+8zYxYy+LG0THkA5iaTCOoV03f/k
	+duCAm0ATsyN1r2KA8goJth6tvxVrF2YYYGqYN67UpW9cSJZPEqJjM5lhVefq93u9ZXmveURcIT
	erI8ysnQMGmRjBvRbPVBj/5Kv2H7DdL6DLRJaaXgk16YULM6yqP+YetRu3olvDY7+T9Lu3EpPZJ
	TgNTETLlO8qwkna6cHVRgNGm91jmY13KHh+HuLdkVGXcBtzgbEU/1sw6C68WhmAfRXmB/a5xgjG
	pUVYIUK6Yjg2y6mrvEzVFXeF98leZi8L4oVdjXrJCnIYag8L4hKkhLM2zZiNfY1If/duBummT2o
	GerN2HsYKZYVoori3xRXeQF+v/CVtgbF+ZPLWtJns8jlbbfedvzfngSg==
X-Received: by 2002:a05:620a:1712:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8c9eb294735mr1440968785a.38.1770040469319;
        Mon, 02 Feb 2026 05:54:29 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2845fsm1248654585a.31.2026.02.02.05.54.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:54:28 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH 3/9] add wic recipe
Date: Mon,  2 Feb 2026 08:54:08 -0500
Message-ID: <20260202135414.682558-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202135414.682558-1-twoerner@gmail.com>
References: <20260202135414.682558-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 13:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230354

Add a recipe to pull in the newly-externalized wic utility. Add wic to
the list of native wic-tools, and make it a dependency of the image
bbclass for wic images.

Add some bitbake variables to the default list of WICVARS that will
likely be needed in the environment file when invoking wic.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes-recipe/image_types_wic.bbclass |  4 +++-
 meta/conf/distro/include/maintainers.inc    |  3 ++-
 meta/recipes-core/meta/wic-tools.bb         |  1 +
 meta/recipes-support/wic/wic_0.3.0.bb       | 18 ++++++++++++++++++
 4 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/wic/wic_0.3.0.bb

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index f2fd00e6d7ec..a81f9e370aaf 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -39,6 +39,8 @@ WICVARS ?= "\
 	STAGING_DIR_HOST \
 	STAGING_LIBDIR \
 	TARGET_SYS \
+	TOPDIR \
+	WIC_SECTOR_SIZE \
 "
 
 inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
@@ -118,7 +120,7 @@ do_image_wic[recrdeptask] += "do_deploy"
 do_image_wic[deptask] += "do_image_complete"
 
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
-WKS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
+WKS_FILE_DEPENDS_DEFAULT += "wic-native bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
 # Unified kernel images need objcopy
 WKS_FILE_DEPENDS_DEFAULT += "virtual/cross-binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e830648945f3..22f974cae890 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -885,7 +885,8 @@ RECIPE_MAINTAINER:pn-weston = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-weston-init = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-which = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-wic-tools = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-wic = "Trevor Woerner <twoerner@gmail.com>"
+RECIPE_MAINTAINER:pn-wic-tools = "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-wireless-regdb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wpa-supplicant = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wpebackend-fdo = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index fa983ed5f12c..45fb873dd6bd 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -3,6 +3,7 @@ SUMMARY = "A meta recipe to build native tools used by wic."
 LICENSE = "MIT"
 
 DEPENDS = "\
+           wic-native \
            parted-native gptfdisk-native dosfstools-native \
            mtools-native bmaptool-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support/wic/wic_0.3.0.bb
new file mode 100644
index 000000000000..f0c58f527c70
--- /dev/null
+++ b/meta/recipes-support/wic/wic_0.3.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "OpenEmbedded Image Creator (wic) standalone CLI"
+HOMEPAGE = "https://github.com/twoerner/wic"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL-2.0-only;md5=4ee23c52855c222cba72583d301d2338"
+
+SRC_URI = "git://github.com/twoerner/wic.git;branch=master;protocol=https"
+SRCREV = "c9305099546888d17b33c16e98bb2012e36d734a"
+
+inherit python_hatchling
+
+RDEPENDS:${PN} += " \
+    python3-core \
+    python3-json \
+    python3-logging \
+    python3-misc \
+    "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.51.0


