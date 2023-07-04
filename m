Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC67EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 10:36:28 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.55635.1688466978600946875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 03:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EuUCcW4F;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-31438512cafso1977624f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 03:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688466977; x=1691058977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wrAyX9+/gz82cMjYGw/u6+37ENrFcCRYFjNJESqYtDE=;
        b=EuUCcW4F9XjLs6Yh5R6QbUYHM2/AzP9co6UT8UX/ONBPSBHDMceTpPEHrMVfC293vt
         BIBZws4CwHBa8mexqHFTlAKTeViwnP0jc2ypL321FQWzpcxNMYj8a4yqtiFmqZLBv+QS
         WvKqBY9m/kiRkkgmBdkI9wbi1IoyJoH9Mi8wWtADBlG99s4IrCV5PXLH6ADoU20jpFEK
         3xON7oSeDXQj7l94+9DglyECbNOkckb5wQWEXwPqhjOKrIiHMVGeoYP1LIt+3QOO7uC7
         kbC9Rh/UpvSNocDz1huMwNTYuaJYElyOU9OmLj5n1tS5YvuPUHhp52+/2thl5srQ3UVQ
         QtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688466977; x=1691058977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrAyX9+/gz82cMjYGw/u6+37ENrFcCRYFjNJESqYtDE=;
        b=Ty6ssx6hMbciUuGtxT7yeX3PZp8WVqNjgI4kzS00d2EBtV103AQ868pyeS7HRlryAl
         fNoHZ3WF9atBhOa41ftnYu+J+VBMxLx3J7cMSxGGtPJWE/g/jYpNQ/Dc57R0hhL/xkJm
         b/WNccdpkOEOFOLjc8yWQicLuF0xUMYzauiwzPRZe5LNnQ+wgL3T5vp8gqTDfc92UUZn
         H1jjjwfYPcHLfxygBm2tJ3dP3Oyh4n5fv2yAd/xa9QRPhJKfVnzeG6Ot7+gIjhea5BVm
         5RbeMIRaaZji4/65kSxd25o8yv8ALa6BWhnBgPLb0V8wLofWHYw+OgnDZwQAgMDMaVhj
         hadQ==
X-Gm-Message-State: ABy/qLbnsbXnTFTGyAQfQBwLnfufzbsB2OQTRIEGplAVHF0ZPmeaT7n7
	glyBBqvNxGc/ImWr6iSADuq7SACzvZc=
X-Google-Smtp-Source: APBJJlEWvF+4Lj3fshVK9UtEKa0mXaiDw03fM/m9rvmlwn7OG+KBgX0FXpX6OCBBsYy2/1dTYFJfXA==
X-Received: by 2002:a5d:62c9:0:b0:314:3f86:ddbf with SMTP id o9-20020a5d62c9000000b003143f86ddbfmr1385544wrv.14.1688466976496;
        Tue, 04 Jul 2023 03:36:16 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id bf11-20020a0560001ccb00b003062b2c5255sm27956300wrb.40.2023.07.04.03.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 03:36:16 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2] kernel-module-split add systemd modulesloaddir and modprobedir config
Date: Tue,  4 Jul 2023 10:36:09 +0000
Message-Id: <20230704103609.2396142-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 10:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183823

Because busybox doesn't support other path than /etc [1] we can't
change the default path unconditionally so change it only for systemd.

The modules-load.d [2] - Configure kernel modules to load at boot
should install their configuration files in /usr/lib/modules-load.d.

The modprobe.d [3] - Configuration directory for modprobe
should install their configuration files in /lib/modprobe.d

[1] https://git.busybox.net/busybox/tree/modutils/modprobe.c?id=669c40ed8ebf480c95ce36135104e474e361a7e6#n658
[2] https://man7.org/linux/man-pages/man5/modules-load.d.5.html
[3] https://man7.org/linux/man-pages/man5/modprobe.d.5.html

[YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=12212

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/kernel-module-split.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 0e4f9a6ec3..c1208d55e0 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -30,8 +30,8 @@ fi
 
 PACKAGE_WRITE_DEPS += "kmod-native depmodwrapper-cross"
 
-modulesloaddir ??= "${sysconfdir}/modules-load.d"
-modprobedir ??= "${sysconfdir}/modprobe.d"
+modulesloaddir ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${nonarch_libdir}', '${sysconfdir}', d)}/modules-load.d"
+modprobedir ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${nonarch_base_libdir}', '${sysconfdir}', d)}/modprobe.d"
 
 KERNEL_SPLIT_MODULES ?= "1"
 PACKAGESPLITFUNCS =+ "split_kernel_module_packages"
-- 
2.34.1


