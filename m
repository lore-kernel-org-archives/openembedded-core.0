Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D980C55174
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 02:10:28 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16894.1785636623995436146
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 19:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F6C9FOBx;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51a868b6962so22378121cf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 19:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785636623; x=1786241423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DsZj0FkXJPtw6CIMHenGAk34t3AkhsbX6gEF2E2gu0U=;
        b=F6C9FOBxgwNLWpKesiOAY34jI0jyuQnJFOU4U85vHhKhVQ6tk9r+sbl/rJZ/6Zcs1Q
         0Zfs1SJprgIUOrMd3kz4piW8YOVEsRIqfYMflEJxPdTVScHY69Kf1Hny3FYZe/U8MqJ4
         ywcQUs2++9ypRKEuDVtV6V5DjxpCRqRpAhryObeQxexUy8c816S0o4EL57maRipnxrlR
         Ga9IBYaX3sCK31AocqwfXv/QILMi5yW6966e7T+xidtPWoKcflYxzd5FhD8FoxiRkECU
         PAiblva52h5yZwaH9I2+fVaexNAckSznMCbxy0uTUyMRbyfSMuhCSNiMIj6pUfxNlXBX
         OJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785636623; x=1786241423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DsZj0FkXJPtw6CIMHenGAk34t3AkhsbX6gEF2E2gu0U=;
        b=MsY3BJsEgaAVghFP8Rkas7bNFcnh40Sw94tdiyzy0zjo6qGUQ1HzvIXvN+ZKTHguho
         mZZJsk+jH+i1+7IHdNbNIUUystzTPElHWmDwFILJCdJi61d8YvOu31ycrn0K3LIh0KJ8
         Zg78VWk2gA9gmGMcjZzmYO8eFFA55bERm2ob1zK81wNBmV2frIH0wBqq7V5ydFG+LejH
         jKsMCgOBKHDX255eZihjvd2j3VFPIIEoyt7a/fAYYWabBRHJZj5sg+IlT7tEfsf4QxeU
         Nt6Cs0WxD+lwUlPALhdVcxw+qUHisTYgmyDAUGm2keRfe6IRZ190wk69ODyvOIGVsw9J
         w8rA==
X-Gm-Message-State: AOJu0YwfaVbmVTC+fxAj1FaG7SrsC7RfOKjssZLKAdrXZRHxHBUZ2kFi
	IMxAfl6Rk/Ygl7azOHQYU5UVSFUxrspBmaFvJbjdc/28vIh8R+Y+HePpeSN7ww==
X-Gm-Gg: AR+sD10gpG8f+XmxFhmm2NR5ILOgxETrJeQR5i2aj9gdFZK151vEY0qctEGK3o1HQH0
	PHvdqL765LTXi4nqAtJbuZER847/B7L1u9IOmWXAqVpXCiJAV0zj4Gjt5eh+ZtR4pvVQN+Um1Ak
	ExakKyXFCfY2TmtNYM/3s6dSJXiuFOkW+5mOzHOvUuRi9xE+SKpau+QkHGqiIy0elA+ybkug5tm
	q98nZiPNgkzA65N/pR4Kb7+NP6c8hY6aHebFOb4KHPaquE4AjbyjGMrptvLEGEunPOt5X8n6amG
	I+dCNh9MwO+cXCoK/n4xU+xpTbR8pIbKKm0biEkjYgqvgaOACKYdiB9MKf9aUJbQGY5Bs0Lbzsz
	TPcaf7JUrPP8hqvahBpJQYxmjKzZYaq5WHbcc31jXVovV1sXxqHDjVWWcc68g/2wn7CuktKW14h
	iBKJI7/O1jg9s8n15Zj+3Y6wRxgT3vFar/OknmPLdT1hTEBzqcFhpIuXL0mrTzKOh5OKaGwUYUt
	/umdrnYGDgqgZy2NuNWciVgIhrB4jrW
X-Received: by 2002:a05:622a:11d3:b0:516:e10f:7140 with SMTP id d75a77b69052e-52b5678f1e2mr94254421cf.35.1785636622894;
        Sat, 01 Aug 2026 19:10:22 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908434a26basm44733566d6.12.2026.08.01.19.10.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 19:10:19 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 6/6] image_types_wic: gate syslinux-native on the target, not the build host
Date: Sat,  1 Aug 2026 22:10:00 -0400
Message-ID: <20260802021000.2886095-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260802021000.2886095-1-twoerner@gmail.com>
References: <20260802021000.2886095-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 02:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242515

A .wks needs the syslinux installer only when the target is x86.
image_types_wic.bbclass selects syslinux-native on the build host
architecture instead, so the dependency lands like this:

                 | x86 target | non-x86 target
    -------------+------------+----------------
    x86 host     | yes        | yes
    non-x86 host | no         | no

Two of those cells are wrong. An x86 image cross-built on a non-x86 host
gets the target bootloader without the installer that writes it, and an
x86 host building a non-x86 image builds an installer nothing uses.

Gate on the target, as wic-tools does [1]:

                 | x86 target | non-x86 target
    -------------+------------+----------------
    x86 host     | yes        | no
    non-x86 host | yes        | no

Bug 13276 [2] was an aarch64 host failing to build syslinux-native for
an ARM target, at a time when syslinux was x86-only in every variant. It
was closed in 2019 by gating on BUILD_ARCH [3]. Since 7273e131bfc7 [4]
only syslinux's target code is x86-specific, so a host gate is no longer
needed, and gating on the target keeps 13276's case fixed.

[YOCTO #16383]

[1] https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/meta/wic-tools.bb
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=13276
[3] https://git.openembedded.org/openembedded-core/commit/?id=7e2ee2b59319
[4] https://git.openembedded.org/openembedded-core/commit/?id=7273e131bfc7

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v6:
- retitled with an image_types_wic prefix, which is now the only file it
  touches
- gate WKS_FILE_DEPENDS_DEFAULT with target-arch appends instead of the
  removed shared variable; wic-tools keeps the arch-gated DEPENDS it
  already had

changes in v5:
- new in v5
---
 meta/classes-recipe/image_types_wic.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 2dbe89fd899a..cc7cf69edb74 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -118,8 +118,10 @@ do_image_wic[depends] += "wic-native:do_populate_sysroot"
 do_image_wic[recrdeptask] += "do_deploy"
 do_image_wic[deptask] += "do_image_complete"
 
-WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
-WKS_FILE_DEPENDS_DEFAULT += "cdrtools-native"
+WKS_FILE_DEPENDS_DEFAULT = "cdrtools-native"
+WKS_FILE_DEPENDS_DEFAULT:append:x86 = " syslinux-native"
+WKS_FILE_DEPENDS_DEFAULT:append:x86-64 = " syslinux-native"
+WKS_FILE_DEPENDS_DEFAULT:append:x86-x32 = " syslinux-native"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS:arm = "systemd-boot"
-- 
2.50.0.173.g8b6f19ccfc3a


