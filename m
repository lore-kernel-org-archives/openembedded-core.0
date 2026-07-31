Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DD3C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 15:28:29 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16.1785511705525645863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 08:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ia6bn+OH;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: twoerner@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bf8a2932a3so638332e0c.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785511704; x=1786116504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UIeATkx7vW4JBubmI/84KAjWUSOQE7SuKJJafkwiCRg=;
        b=ia6bn+OHGU1EZuf1o2Vhas6Gc2TYJ0O0kh6yB+NPfNMNNFw4mCCAw7yqgVNn+xKcsz
         uOpKlVxsFGrjc8mFh90nwQP83Ug4iHyo4n/Kd8nBeQU3/Q8zRGZyWYSZErbCN/D0HMCD
         a9GE817nAOOHdGgVHZSCRHKPqGDGecq5pwcJ7piBg6HVF0MNuPpbwA87DQlWkZ2NGZ26
         0al8ePlTb9pEVs+x2zZnms2YlaySV/Fg68+DSFIK+r2SgUlitAzxNbgeOtyoc2Sm0QjM
         YjNYcjl31IY0fe2SZ1i+HMIrOItDsm8fLB8iaMW5EvxcF+k0GEVA6hW2HdJDhl50AQZR
         SGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511704; x=1786116504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UIeATkx7vW4JBubmI/84KAjWUSOQE7SuKJJafkwiCRg=;
        b=qzMwVT9O/77NQfUHQOMBTmqoYHr6EAdbAcDoagfR7AhhM9+7kzZgqRKPLGScN4UxVJ
         +cwyxktG7ZKbIdbaJyifxQjmU+ipEMcR+f2Ppj5lwDXj1vpN68BP0bnNN//NjRv6un24
         8DUHSyNdtlj2wDMeCHh7Uy/yVNGKWDGIgw82CoEMdBhh2Nz/UiWKfvhfUvdV5M7DG3mj
         GSsVkaFd1ZOWzgjMp6CE1ThxIKhT9HmrB8s0K/ESTKGtJApwlt+0qhJxXTeDpVEk2A6g
         nae9bErasimAkUw0xZIVAx+jvqNHh//J8RFiTCyhCXy4cPA8OvyVGvlor3cn8GCl/KHk
         Ylwg==
X-Gm-Message-State: AOJu0Yw/sFfCU//zLdx3xDxwTgnoUsh9mdDOClxzFArLydo+UJ0lBpuU
	OJyOL5V9onuTy8caNCPquiHcJQVArItj0Bn6ShqnnV8uSCuyqLXi84PSxA6D5Q==
X-Gm-Gg: AR+sD12W1H1vWDzuZjErQ5W/74McBSjucc7+rs7Aesi1NUPBBD4QzaBPHGFpWH763Kj
	8VpFptBSnpWPL3Qr5W514CJSbUUSLJ1bKi243xMjkzwwFFfOwwVgB0nC+0t1+qYv6aNgfl+5yxj
	BszjzqW+h8zY6y72bBw4pZ8CtsnkOpwxuwgeeGnDkfdYJiPC9Q92OSc1ITQR+QZBMXFy0KLziox
	9yVoYbo0MgkVU4jK5BWNxpxi7X2mWtDy8qaTdYEnPi7ETFZMEyCu+rARGaveOj+QLwT7sPSm3Bl
	MSkvIMbtiPRT8ajfOSOiDj61aKbLyQ+Xcvhr6zPEn7xf59kjtzRaEvRZ+NSDwTphrNZ0A4UQyLY
	An+DsKyCkHwxqNCmsjxEzgBEkdFBpiBg4qfYsZh7k57b7Bt+b+Dp/m4jeJaMU/5Qby5YpOrbrMR
	mP+9apC6ajgcKXa/PPdhcJRB+si/7/FG4+Rgu0DuKuvygvErfaK5yxDLl0fCSQCJLBXFxfkd34G
	Em1qss9o8ioUwcW5A7tl3+cEZYLMYo=
X-Received: by 2002:a05:6102:6899:b0:726:8813:2085 with SMTP id ada2fe7eead31-75b23d6e2d3mr535449137.13.1785511704327;
        Fri, 31 Jul 2026 08:28:24 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-759c9559116sm837007137.11.2026.07.31.08.28.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:28:23 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 6/6] wic: gate syslinux-native on the target, not the build host
Date: Fri, 31 Jul 2026 11:28:10 -0400
Message-ID: <20260731152810.2641327-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260731152810.2641327-1-twoerner@gmail.com>
References: <20260731152810.2641327-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 15:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242452

Whether wic needs the syslinux installer is decided by the .wks file,
and so by the target: only an x86 image asks for syslinux. Currently
image_types_wic.bbclass adds syslinux-native when the BUILD HOST is
x86 instead, which is a different question. Does an image depend on
syslinux-native today?

                 | x86 target | non-x86 target
    -------------+------------+----------------
    x86 host     | yes        | yes
    non-x86 host | no         | no

The answer varies by row when it should vary by column, and both of the
wrong cells cost something. An x86 image built on a non-x86 host gets
the target bootloader without the installer that puts it in place. An
x86 host builds an installer that a non-x86 image will never use.

Gate on the target instead, as wic-tools already does [1]:

                 | x86 target | non-x86 target
    -------------+------------+----------------
    x86 host     | yes        | no
    non-x86 host | yes        | no

Bug 13276 [2] reported the bottom-right cell failing, back when the
syslinux recipe was x86-only for every variant, and it was closed in
2019 by gating on BUILD_ARCH [3]. The recipe has since been reworked so
that only its target code is x86-specific [4], which leaves that gate
unnecessary as well as misdirected. A non-x86 target never asks for
syslinux, so 13276's case stays fixed.

[YOCTO #16383]

[1] https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/meta/wic-tools.bb
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=13276
[3] https://git.openembedded.org/openembedded-core/commit/?id=7e2ee2b59319
[4] https://git.openembedded.org/openembedded-core/commit/?id=7273e131bfc7

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v5:
- new in v5
---
 meta/classes-recipe/image_types_wic.bbclass | 3 +--
 meta/conf/wic-helper-tools.inc              | 3 +++
 meta/recipes-core/meta/wic-tools.bb         | 4 ----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 3f25b7912b26..b00b5155475d 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -120,9 +120,8 @@ do_image_wic[depends] += "${@' '.join('%s:do_populate_sysroot' % r for r in ('wi
 do_image_wic[recrdeptask] += "do_deploy"
 do_image_wic[deptask] += "do_image_complete"
 
-WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
 # Unified kernel images need objcopy
-WKS_FILE_DEPENDS_DEFAULT += "virtual/cross-binutils"
+WKS_FILE_DEPENDS_DEFAULT = "virtual/cross-binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS:arm = "systemd-boot"
diff --git a/meta/conf/wic-helper-tools.inc b/meta/conf/wic-helper-tools.inc
index 66f2f1b2bddc..0ee4aaee6a89 100644
--- a/meta/conf/wic-helper-tools.inc
+++ b/meta/conf/wic-helper-tools.inc
@@ -14,6 +14,9 @@ WIC_HELPER_TOOLS ?= "\
 
 WIC_HELPER_TOOLS_NATIVE_ONLY ?= "cdrtools"
 WIC_HELPER_TOOLS_DEPENDS = "${@' '.join('%s-native' % t for t in (d.getVar('WIC_HELPER_TOOLS') + ' ' + d.getVar('WIC_HELPER_TOOLS_NATIVE_ONLY')).split())}"
+WIC_HELPER_TOOLS_DEPENDS:append:x86 = " syslinux-native"
+WIC_HELPER_TOOLS_DEPENDS:append:x86-64 = " syslinux-native"
+WIC_HELPER_TOOLS_DEPENDS:append:x86-x32 = " syslinux-native"
 
 WIC_HELPER_TOOLS_PACKAGE_ONLY ?= "e2fsprogs-resize2fs"
 WIC_HELPER_TOOLS_RDEPENDS = "${WIC_HELPER_TOOLS} ${WIC_HELPER_TOOLS_PACKAGE_ONLY}"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index c3c39cec011d..22d530e42300 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -9,10 +9,6 @@ DEPENDS = "\
            grub-native pseudo-native \
            virtual/cross-binutils \
            "
-DEPENDS:append:x86 = " syslinux-native"
-DEPENDS:append:x86-64 = " syslinux-native"
-DEPENDS:append:x86-x32 = " syslinux-native"
-
 INHIBIT_DEFAULT_DEPS = "1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.50.0.173.g8b6f19ccfc3a


