Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A31C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:52:09 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.58039.1697817119710700923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V/cOeiuX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c0ecb9a075so7519925ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817119; x=1698421919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MeG4l1t04l0jDCWXdsSr2pLKylDQYLkk8bOSZw7pnbw=;
        b=V/cOeiuXNpSBkwZCqIBpF3Jo0h+iLB6aL7/7Xv0CiAQAGdmyAgI9e6Ysh4urM1cxPh
         frpk+pC/osGrMijbEkgXoi7FTEiWJ/0KdfqF6TeKG2UXjcrE9BVcJ11Pa/1VU41Gy3sT
         4Pzv6GA+h1Z9ysPnnHxz0RwScOqhPXJlYAAsla1fvKS22Gfwm+mZVRO3HUcJt9GXeGA+
         pa+IEEx7bJKbsHhyuPhEB1Y3skHpY2Wi79IXmZjysEi4HlYofxiQC1ta5J5xj1Is/sBE
         /TRwnmnnrN2T98HQOIGgU7GcCEf9FE1skgQBoaXSq6dZewgvQ4PIVxCGL9BPO2gutVEs
         VPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817119; x=1698421919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeG4l1t04l0jDCWXdsSr2pLKylDQYLkk8bOSZw7pnbw=;
        b=OicOQafHTVKuh7x66DfxutisufLzoJBXAi0+/kW0RTgGKC+Z1fKQ0eYviZ1qGqeiWf
         EfhszSKuZzFGGCXWuZwBs0B1edzc9bfG/HmpWWnc4UuJPiV/BcsFcsEh0p0aJo+PmhZ+
         7uP9p40PvsNbS4witlvsUHc6BvnHuo+sVGM/gajeNo86YSt1FT0ja0dys0AVTUbKMwRq
         KhulOGTgi3ZhtJ6xzZjerReEqTmbJ29hrWHhj2BTJrxPAH3x4xXOpMX7uiEWkr+1Q+UH
         Ii6AE1IXHGQjjmtZtT5Qkja2Kq1na5KQ1dpL/PIACkrofaK478U8Kld7BFypc1695/GM
         1oQw==
X-Gm-Message-State: AOJu0YxTvBM/qRrTiYUOsIq97vkVzyqLV3YYKcrYJVCRP2mKAeYaVU5a
	5hhB6Z1BRoNXTuKUL4FWkaKwJhCMx4PVJeMsFCA=
X-Google-Smtp-Source: AGHT+IFTtxsfN4QDiUpS/QWX3z+AZfIpSxvOXBp9t8NTOWLg5eDJhshyNoH5kic7ExsIEpWgCGDnfQ==
X-Received: by 2002:a17:903:41c3:b0:1ca:8468:f05e with SMTP id u3-20020a17090341c300b001ca8468f05emr2430179ple.29.1697817118826;
        Fri, 20 Oct 2023 08:51:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:51:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/24] uboot-extlinux-config.bbclass: fix missed override syntax migration
Date: Fri, 20 Oct 2023 05:51:16 -1000
Message-Id: <585544b99c62d3e4edebd7c4e9225f70069a5176.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189559

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

uboot-extlinux-config allows to specify multiple "labels" (entries in a
menu, à-la grub) and each of them have their own values for some fields.
Each "base" variable, e.g. UBOOT_EXTLINUX_FDT can be overridden for each
label. This is done via the OVERRIDES mechanism based on the label name,
e.g. UBOOT_EXTLINUX_FDT:linux if linux is a label.

However, OVERRIDES doesn't contain the label globally because it's only
necessary in one task. Therefore, the OVERRIDES itself is modified
within the task. This means that the sigdata will not be told the
dependency on UBOOT_EXTLINUX_FDT:linux, because it cannot know about it.

For this reason, we need to explicitly specify which variables this task
depends on via vardeps varflag for the task.

This was done in the past, but we missed updating it during the override
syntax migration so the cache wouldn't get invalidated if someone
modifies UBOOT_EXTLINUX_FDT:linux from a configuration file or a
bbappend for example.

Let's fix this by migrating it to the new syntax.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4dd9d873508128adbbf5ff6cf0a3df3d2ffbcf6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/uboot-extlinux-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/classes-recipe/uboot-extlinux-config.bbclass
index 653e583663..2f5c665f97 100644
--- a/meta/classes-recipe/uboot-extlinux-config.bbclass
+++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
@@ -152,7 +152,7 @@ python do_create_extlinux_config() {
         bb.fatal('Unable to open %s' % (cfile))
 }
 UBOOT_EXTLINUX_VARS = "CONSOLE MENU_DESCRIPTION ROOT KERNEL_IMAGE FDTDIR FDT KERNEL_ARGS INITRD"
-do_create_extlinux_config[vardeps] += "${@' '.join(['UBOOT_EXTLINUX_%s_%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d.getVar('UBOOT_EXTLINUX_LABELS').split()])}"
+do_create_extlinux_config[vardeps] += "${@' '.join(['UBOOT_EXTLINUX_%s:%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d.getVar('UBOOT_EXTLINUX_LABELS').split()])}"
 do_create_extlinux_config[vardepsexclude] += "OVERRIDES"
 
 addtask create_extlinux_config before do_install do_deploy after do_compile
-- 
2.34.1


