Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79ED9C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 15:28:19 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9.1785511697979230863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 08:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RDlY0sZM;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: twoerner@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-73791ee3612so588850137.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785511697; x=1786116497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y3r22QuEPzkd794+1HOz7ayBUaKrkj3AY/h3uW+txxs=;
        b=RDlY0sZMlOZ+i1t7Q7aP6pcWo/U2hvRbTjCxZFM3I8pCWiu4kDE55pGXX4etxrvO6x
         iRjSnMrEIOnHqSIfJ7QAM1Bs/x+fdvzIxuslFsb0T/P3VtJ5f/5hBa0mKbHAJZOwGF07
         VMnISlCnOqXAiUgSRUs5UtfJyBIZX7aM4pHCU6iilcqQ8Pg1Zjlagie6IT15RtU4GxX5
         mAK4y+aB9tV0+HeRWZpycl5hAn9oyRxFcp1VDKscDgn9m3umtg0yjKMvXNxqKdNnlTw+
         x+DqQfMrO2ZUNqVesiR3eflsANeujKsu1IergKG+1DnbG3C/rxbHKuQQVcFgLGEeynzy
         AWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511697; x=1786116497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y3r22QuEPzkd794+1HOz7ayBUaKrkj3AY/h3uW+txxs=;
        b=ILgFXQNAlxtJgBw/HPAqoOk3yXrJ45r/h8b1pbr0BPaf0Ut7+aUdGaeTO1KnuEd0VO
         BsQrZmj6V48uca/t7LtE1blEM6FkTKnUgDUaUyXYTINyBYvu/HSggKu8hCNtvoQbTaTN
         UzpjCfqj7bDlOxPRVuHCn02XU4FEeeBsXAU2x7rcmluQRXcoW19eDOp+17/qLZ8+nR/S
         x8BUhQ5rSTWT/Rayk4dM1AcqUWq9hZ6ikDFwiZcYrUmWQrDv8OnhPVoWbY+ArOfmrs1N
         5WJ7QGghXEuGAvDEL0dUCovfkoS8QYoimuGgfPzRkz/e8kRLpv2y2DkyMKTENNcvWRi+
         LIVw==
X-Gm-Message-State: AOJu0YwIpco5dpGuU2zGnFz/K5fCpXRORptoq8hGkS4CTqCZlHPOZEDR
	htqYIRwExqsKClODQsDIXHFhxFZsPX7sUoF5Igt43MMtdoJLeuzbvVsSYeZbBg==
X-Gm-Gg: AR+sD1324O92pW5+TD1BlgZP9I+gX9TRRLHX7n06B/KqLyyvt5d1tgVHye6/2C13qnL
	v7ivWS8lAhkyQraavw2Q/uobG1spj5PuiRSfqENhKo4fxGV9o0U83RYIaHNMpVLRm1ZxGofCa3K
	/+B1Wzut5prWSxfESA2kH4HCS3aom77mHjjNUjmF3rRr6X/idk3OoatVFB3ZKDuijturC0PGWpi
	VabNraM5q3uq1aDD6+sg6lsw6PJtzoLA6gHvaL3cqrQyUd4VuX+bfHd0nV4jeCdOLY/91QxCjP2
	xTSEAahtAljJgG9YPC3UYOtJotgSsX7V6Hl/HNXCQpQbGdgxtNaNUdUKO6nyHJ6vg922YwuqOUZ
	XCGlPDoC04wYpF/t/CYzezMLTEgGAUqbKC8C15l5fbfUbUsJInpHCH08d11owdtP3BlNcz5iZbn
	uWz9dydCO/gxTFXU+cEkrRFzpcM6RnJvfeNyKSV8bttnBLdZPYd3eO33gvXHX+VoSQ4nMZAHbsi
	rKLA88lGxJ8KoEAhx2CaGFO+w7qVP4=
X-Received: by 2002:a05:6102:8096:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-75b22b672b8mr610613137.8.1785511696841;
        Fri, 31 Jul 2026 08:28:16 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-759c9559116sm837007137.11.2026.07.31.08.28.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:28:15 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 2/6] wic: add a shared helper tool list
Date: Fri, 31 Jul 2026 11:28:06 -0400
Message-ID: <20260731152810.2641327-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260731152810.2641327-1-twoerner@gmail.com>
References: <20260731152810.2641327-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 15:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242448

The tools wic shells out to are listed in both wic-tools and
image_types_wic.bbclass, and the copies have drifted. Add
conf/wic-helper-tools.inc as the single source of truth.

Only wic-tools staged tar-native and util-linux-native before; images
now get them too.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v5:
- new in v5
---
 meta/classes-recipe/image_types_wic.bbclass |  5 +++--
 meta/conf/wic-helper-tools.inc              | 16 ++++++++++++++++
 meta/recipes-core/meta/wic-tools.bb         |  7 +++----
 3 files changed, 22 insertions(+), 6 deletions(-)
 create mode 100644 meta/conf/wic-helper-tools.inc

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index ea8c1c94ca2f..3f25b7912b26 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -112,14 +112,15 @@ do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@wks_checksums(d.getVar('WKS_FILES').split(), d.getVar('WKS_SEARCH_PATH')) if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
-do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('wic', 'parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
+
+require conf/wic-helper-tools.inc
+do_image_wic[depends] += "${@' '.join('%s:do_populate_sysroot' % r for r in ('wic-native ' + d.getVar('WIC_HELPER_TOOLS_DEPENDS')).split())}"
 
 # We ensure all artfacts are deployed (e.g virtual/bootloader)
 do_image_wic[recrdeptask] += "do_deploy"
 do_image_wic[deptask] += "do_image_complete"
 
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
-WKS_FILE_DEPENDS_DEFAULT += "wic-native bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
 # Unified kernel images need objcopy
 WKS_FILE_DEPENDS_DEFAULT += "virtual/cross-binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
diff --git a/meta/conf/wic-helper-tools.inc b/meta/conf/wic-helper-tools.inc
new file mode 100644
index 000000000000..f3b2b698e2df
--- /dev/null
+++ b/meta/conf/wic-helper-tools.inc
@@ -0,0 +1,16 @@
+WIC_HELPER_TOOLS ?= "\
+    parted \
+    gptfdisk \
+    dosfstools \
+    mtools \
+    bmaptool \
+    btrfs-tools \
+    squashfs-tools \
+    e2fsprogs \
+    util-linux \
+    tar \
+    erofs-utils \
+"
+
+WIC_HELPER_TOOLS_NATIVE_ONLY ?= "cdrtools"
+WIC_HELPER_TOOLS_DEPENDS = "${@' '.join('%s-native' % t for t in (d.getVar('WIC_HELPER_TOOLS') + ' ' + d.getVar('WIC_HELPER_TOOLS_NATIVE_ONLY')).split())}"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index c6e3d1b419dc..c3c39cec011d 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -2,12 +2,11 @@ SUMMARY = "A meta recipe to build native tools used by wic."
 
 LICENSE = "MIT"
 
+require conf/wic-helper-tools.inc
 DEPENDS = "\
            wic-native \
-           parted-native gptfdisk-native dosfstools-native \
-           mtools-native bmaptool-native grub-native cdrtools-native \
-           btrfs-tools-native squashfs-tools-native pseudo-native \
-           e2fsprogs-native util-linux-native tar-native erofs-utils-native \
+           ${WIC_HELPER_TOOLS_DEPENDS} \
+           grub-native pseudo-native \
            virtual/cross-binutils \
            "
 DEPENDS:append:x86 = " syslinux-native"
-- 
2.50.0.173.g8b6f19ccfc3a


