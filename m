Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FD9C43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 07:54:32 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39676.1782892465595579176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 00:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=muPXFfeA;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-923220bf1d5so35591585a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 00:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782892464; x=1783497264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ITcap7cZxn44injB7pVCvRB0fkfKTxrDTlhvPp5AVsg=;
        b=muPXFfeA3wmzx3FFDecwBgBELYu6Bjs9dieUHMqsmaWWswQBUtE5RXmqyxmRLqKH8U
         sE9d+gQ4SBW5YSuCzWZ+UfMyblw1NP/Q6TnFSg6IG8QetrHHjk5uWyl5EoDqPjatKatG
         xSD1NcUAgTGSfwZ4OjRk7ILbF67pWLAlJ9ytYO9XZA9W36mfYaXoihhZoe8m+qfJMByT
         VfIxL3Ets+cga3ffN7eR9rBSRZ0Bh2fqOhpFCFuv+iba8g8Z+xNBy2pe1w2JSbVq/epn
         +KdOQaniZkUq/6GUqPQ4kKb3I1mgh1hxVAe6omj5AYy9o05RBXrESU5fmVqV96KmlDFl
         IfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892464; x=1783497264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ITcap7cZxn44injB7pVCvRB0fkfKTxrDTlhvPp5AVsg=;
        b=qVYrqvObOnKwFO2K524hIFCZZIKnix6sLlpjnENTGvV8hlJsVkKuPJujLD27tb6hbr
         m5bzlBntoVCEHsAhCAKCHDn0cd6Nk3y4eL/XPm8AGHaNDiX2mxTkDIpb9/ELvKBE7q4K
         UZ8MGEXtVOISmJvu9q3M5MvgrhnI6iNL7JNp87pE92vL97m4fZuAjkMXoVGp+0TBmdFu
         qNZe+DyN6gPnbHwlh+81CyzsxQfOzWdwLZvuZTtqVjscVa9MotHTv2puGeIfXIUHu9YS
         P1TA++dp0pm+7fHWanNbFgfWlaFayaOTTiMNvoPmGx3rmBhTHi2JfFczo3HcNTZH3qZc
         gJpw==
X-Gm-Message-State: AOJu0Yz0nsdZcvGlHs8B/U6McG/DM+vNReNeed807T/FAFpLWmuWrO5R
	J2pO/pm6I/NprMZecxa/7dr1pmhNYuZsj4pROO1jn6wr0r7IEvmE41OIdJ7+sg==
X-Gm-Gg: AfdE7cnGhZPVHM7gEgMh19CgxL+jcE1U8uPJ9Wy7KiNCmyh2ehD146EroCMOT2ujX/O
	FoDtlxRXw6IG+sApmYh5PdhENeLHHiNPefq/U3rYs5lzBrrsYG8uHrBtfpCkH4eoDdpRUSFx04r
	XPUcootyMEi0jxrTw79H+bu7fqunJibHoS/5GHICeK0IMulEhuTachXDZaZjbf/5LSStpaBDXbq
	j3JoGbtRpW/nUSIyEkdfK6la04BuW2+HxA1tfBNtQ8uB4W5Xl/RcA6mNg5kXS2PriN0SE4ZR9Xx
	69FVas6HaDIgRPzWQD3NlW7tZgq88Wz8paL80YOMW3v3A2O3xJfz8Y33bbaZ0cWfGzRymLix5KW
	skig7uYaYd3PTHUYbP0ty+Ry4fgD2AwbqbuB9cBkoF8fhaS1AScmirrYuCBgPySXgVX03cIlqS5
	I3muLO5s2aLc90AR6Z6AJ6zgfZQcnQRKv4nE65q4RgHvTd8Niq0QF3VR4MGWcefxyDbQ==
X-Received: by 2002:a05:620a:19a7:b0:92e:56f7:c5fb with SMTP id af79cd13be357-92e781c1014mr71383785a.12.1782892464452;
        Wed, 01 Jul 2026 00:54:24 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62371ba1sm502294485a.42.2026.07.01.00.54.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:54:23 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] wic-tools.inc: add
Date: Wed,  1 Jul 2026 03:54:08 -0400
Message-ID: <20260701075411.1092848-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260701075411.1092848-1-twoerner@gmail.com>
References: <20260701075411.1092848-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 07:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239949

wic invokes a range of host-side tools (parted, mkdosfs, mcopy,
mkfs.*, grub-mkimage, ...) at image-creation time, depending on the
partition types and bootloaders in a .wks file. The set wic could
invoke is enumerated in its NATIVE_RECIPES table, and matches the
helpers wic-tools lists in its DEPENDS.

Refactor that helper list into a shared wic-tools.inc (WIC_TOOLS) and
switch wic-tools to it, so the canonical list lives in one place and
can be reused by other recipes that need the same set.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/meta/wic-tools.bb  | 15 ++++++++-------
 meta/recipes-core/meta/wic-tools.inc | 24 ++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/meta/wic-tools.inc

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 45fb873dd6bd..b81729d9ff1b 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -2,13 +2,14 @@ SUMMARY = "A meta recipe to build native tools used by wic."
 
 LICENSE = "MIT"
 
-DEPENDS = "\
-           wic-native \
-           parted-native gptfdisk-native dosfstools-native \
-           mtools-native bmaptool-native grub-native cdrtools-native \
-           btrfs-tools-native squashfs-tools-native pseudo-native \
-           e2fsprogs-native util-linux-native tar-native erofs-utils-native \
-           virtual/cross-binutils \
+require wic-tools.inc
+
+# wic itself, the shared WIC_TOOLS helpers as -native build dependencies,
+# plus the extras specific to building the native sysroot: native-only
+# cdrtools, pseudo and the cross binutils.
+DEPENDS = "wic-native \
+           ${@' '.join('%s-native' % t for t in d.getVar('WIC_TOOLS').split())} \
+           cdrtools-native pseudo-native virtual/cross-binutils \
            "
 DEPENDS:append:x86 = " syslinux-native syslinux grub-efi systemd-boot"
 DEPENDS:append:x86-64 = " syslinux-native syslinux grub-efi systemd-boot"
diff --git a/meta/recipes-core/meta/wic-tools.inc b/meta/recipes-core/meta/wic-tools.inc
new file mode 100644
index 000000000000..a1d622e9d345
--- /dev/null
+++ b/meta/recipes-core/meta/wic-tools.inc
@@ -0,0 +1,24 @@
+# Recipes providing the host-side tools wic may invoke at image-creation
+# time, as listed in wic's NATIVE_RECIPES table. Names are given without
+# a class suffix so they can be mapped to -native, nativesdk- or any
+# other variant as needed.
+#
+# This list is limited to tools that exist both as -native and as
+# nativesdk- packages. Tools that are not available in every variant
+# (for example native-only cdrtools) and architecture-gated tools (for
+# example syslinux) are intentionally left out and handled separately.
+
+WIC_TOOLS = "\
+    parted \
+    gptfdisk \
+    dosfstools \
+    mtools \
+    bmaptool \
+    grub \
+    btrfs-tools \
+    squashfs-tools \
+    e2fsprogs \
+    util-linux \
+    tar \
+    erofs-utils \
+"
-- 
2.50.0.173.g8b6f19ccfc3a


