Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8C9C55179
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 02:10:18 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16892.1785636614994945816
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 19:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IEZFfZmX;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8f0e5e36912so11780496d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 19:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785636614; x=1786241414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O/o1w8OdqvAPx0+WW4szcBt8Y+yToWX/tEWSeBPDADY=;
        b=IEZFfZmXVINmbowV1Fh+5ux94Z6xDv1lKVQdh3k8Y4n0ExIoRgvdfGTIGlLZ3t5u+7
         eUBQl4DID3dw307i8LrCofwv4K+VpM53B/OteS7n7rcWZDQtQOv9ONWxuQGgV9Diso/I
         Q0qhuh0EbCK5VaimpolecGQxDjEOAV8ouBpYa08oRmCFItEEX8Y5Xrth/50xXOYsPbjp
         pMLz1jbsShQ1XTxSs1NLUy4GVn8gk31a4c6oBgYTj1nl/+7uXontydthdjuU/FS3A99O
         O6yLQDM5nilatqjMzTNw+Kw2tg5fzJSeNjs+BhoIPCqf8yRo7N4BJvZXO4LyBwu3fH+d
         8ctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785636614; x=1786241414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O/o1w8OdqvAPx0+WW4szcBt8Y+yToWX/tEWSeBPDADY=;
        b=iaXxXCAMskogZc/RRjiVcUv8qEfPuOJcjfuIHpwsgTH5JkcBOIZhuFqL8sHqj4oe5q
         jD/Mqg9PUqlMR6c7NPUM78oGfRf55H8Zu74QyHa5XaxyUcodMzWxn/MmHuGnXL++IASN
         36G/i1hj5h3MvcZpBnbOs3N2GtPz2h6xe+96g6RNMOBgg8HSDaYdO88PE0vVcAVZl+S0
         8NF/+nOOJTAldpW6Q4quzeng4O6OMMuw8/HHSjRbm1zig710hVi9Y01M/iZ+28KV0giI
         R5l7D7iAyUqlPP5mDo3bZjhBBPQA/4lSd9y9guiBYVe9WZ+o/zBk+XY6bQHeEIXVVBe4
         XbxQ==
X-Gm-Message-State: AOJu0YxdoTkIlXE+g/9NHRHmeI9K93214v30NLKdZ1HkISq8rJA5ZAJb
	bK4MysmVtdDqz/fNbhrXFE4nTrm9d7ZjQ1IFWKCx0CSZoCAh2JouPT/FNpirAQ==
X-Gm-Gg: AR+sD13jbiwAXTKMf/stk1vAe5GyR68QOVfRpkozl6EExdQWBJP9M+w1lVJ8ZuJhqkf
	NO9AAzXe4mVreuncgTz137uDNrgBq4la9EL5rRg4Z1/KeRfXAy7apYMJ1pY+/Z1shWZ2XqwIEqc
	z0UeQAaVbwAveIyTN5KZ132XD0LYFWCLmr4PbloW36FDFi2GGdYJhq/2Jtzfgi2ud8hP5EzD30/
	8/1/PBq+50wi7oP8dFd5nwMP2DfOOdEbwO/84PP4pdiQp6EezSlEk1u1AikJa6btFxbNmwskznh
	TyS49ZWXk+TDIDU2x68t7eMtsEPV+0ZaUdKHQlJAkAUUbuK1A1f7+R1xCDWZdZAXQzcw4PauIH5
	XLO/mK9MwlzZFfKnLMdqX3t1fpEFtN0D8FcE+uLNIHSnmwOFg8NYTLsAvEuzEHJI9x1wpvP7YNO
	rWpKXcEBVFl5c9Qkz+Q3Sm45EQot2wdUHpLcN/gJoC/eTN7Hll5eaM2hUrWfWSQfdwMS+BfQCoH
	w4oYas2h4gMTk8Suvk6KWGzzu3ujsw=
X-Received: by 2002:a05:6214:5015:b0:8e7:8d53:2417 with SMTP id 6a1803df08f44-908496389f6mr98245806d6.27.1785636613828;
        Sat, 01 Aug 2026 19:10:13 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908434a26basm44733566d6.12.2026.08.01.19.10.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 19:10:11 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 3/6] wic: add runtime dependencies on the tools it invokes
Date: Sat,  1 Aug 2026 22:09:57 -0400
Message-ID: <20260802021000.2886095-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260802021000.2886095-1-twoerner@gmail.com>
References: <20260802021000.2886095-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 02:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242512

wic shells out to a range of host tools (parted, mkfs.*, mcopy, sfdisk,
and more) but, since the recipe was created, has declared none of them,
so an installed wic works only by chance depending on what the host
provides. Declare them as RDEPENDS so they are installed with wic.

The wic image type and wic-tools each carried a copy of that same list,
and the copies had drifted: only wic-tools staged tar-native and
util-linux-native. Neither needs a list of its own now. native.bbclass
makes a native recipe's do_populate_sysroot depend on its RDEPENDS, so
depending on wic-native stages the lot.

Three entries stay written out. cdrtools has only a native recipe, so
there is no package a target or nativesdk wic could name, even though
wic does run mkisofs. grub is bootloader territory and belongs to
whatever drives wic. pseudo is wic-tools staging what the oe-selftest
needs.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v6:
- carry the tool list here directly; the shared
  conf/wic-helper-tools.inc that v5 added is gone
- fold the image_types_wic.bbclass and wic-tools change into this patch,
  so the one list is defined and used in the same place: both now take
  the tools from wic-native instead of repeating them

changes in v5:
- take the tool list from the shared conf/wic-helper-tools.inc
- drop the bootloader (grub, syslinux) RDEPENDS entirely; declare only
  the host tools wic runs
- trimmed the commit message; dropped the in-recipe comments

changes in v4:
- gate grub to x86 and aarch64; move syslinux into the same arch-gated
  appends
- also depend on syslinux-isolinux for isolinux.bin

changes in v3:
- list the tools on all variants rather than only the nativesdk variant

changes in v2:
- merge the tool list into the wic recipe as RDEPENDS; drop the separate
  .inc
---
 meta/classes-recipe/image_types_wic.bbclass |  4 ++--
 meta/recipes-core/meta/wic-tools.bb         |  5 +----
 meta/recipes-support/wic/wic_0.3.1.bb       | 12 ++++++++++++
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 671577cc062b..2dbe89fd899a 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -112,14 +112,14 @@ do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@wks_checksums(d.getVar('WKS_FILES').split(), d.getVar('WKS_SEARCH_PATH')) if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
-do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('wic', 'parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
+do_image_wic[depends] += "wic-native:do_populate_sysroot"
 
 # We ensure all artfacts are deployed (e.g virtual/bootloader)
 do_image_wic[recrdeptask] += "do_deploy"
 do_image_wic[deptask] += "do_image_complete"
 
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
-WKS_FILE_DEPENDS_DEFAULT += "wic-native bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
+WKS_FILE_DEPENDS_DEFAULT += "cdrtools-native"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS:arm = "systemd-boot"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index a4b7669137dd..4a4473469b7f 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -4,10 +4,7 @@ LICENSE = "MIT"
 
 DEPENDS = "\
            wic-native \
-           parted-native gptfdisk-native dosfstools-native \
-           mtools-native bmaptool-native grub-native cdrtools-native \
-           btrfs-tools-native squashfs-tools-native pseudo-native \
-           e2fsprogs-native util-linux-native tar-native erofs-utils-native \
+           cdrtools-native grub-native pseudo-native \
            "
 DEPENDS:append:x86 = " syslinux-native"
 DEPENDS:append:x86-64 = " syslinux-native"
diff --git a/meta/recipes-support/wic/wic_0.3.1.bb b/meta/recipes-support/wic/wic_0.3.1.bb
index d9b4cc05c4bd..116b0a2cd292 100644
--- a/meta/recipes-support/wic/wic_0.3.1.bb
+++ b/meta/recipes-support/wic/wic_0.3.1.bb
@@ -15,6 +15,18 @@ RDEPENDS:${PN} += " \
     python3-json \
     python3-logging \
     python3-misc \
+    parted \
+    gptfdisk \
+    dosfstools \
+    mtools \
+    bmaptool \
+    btrfs-tools \
+    squashfs-tools \
+    e2fsprogs \
+    e2fsprogs-resize2fs \
+    util-linux \
+    tar \
+    erofs-utils \
     "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.50.0.173.g8b6f19ccfc3a


