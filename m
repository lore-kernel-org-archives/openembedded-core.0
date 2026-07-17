Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6390CC44520
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:34:42 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13735.1784295274927264632
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mKovVwGn;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: twoerner@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9696319e14dso2725302241.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784295274; x=1784900074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LMbixBlwElxwtWJTJyI7L88D3tifLNe9vh2wAVJ7ff0=;
        b=mKovVwGnx6xu+pVRqNG8XJvRNNPBiSu6ljO8mrHAZw8Xv7INW/TwE008GO8QckKR9e
         gtoZMZnSnECIzLQsJdV+068i6CsPyhdxXRGrRkTxbvq0lHvNA2Bm6NDaAYWKYN8UftEq
         vjN/WOftn29k/CkrTTRcPinpXWPBVwbuHteRGibrgOJrqTi9nXL8sAVL22p4StdZeRPl
         ssQHrsGWeJGOxFUFyQLIBJQVYr+kfaevn4fyP7MGYYdmQWOxVkWarOvkE0AN9IAzcunn
         z6Mvf7yZP4G9AoOaj+FoqhlC9QfvJNFeLasK/wpeB0TxkOiB9VxGRfsLJrjP76YvBLmF
         rs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784295274; x=1784900074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LMbixBlwElxwtWJTJyI7L88D3tifLNe9vh2wAVJ7ff0=;
        b=qd4a1p3I5Ss1IAj5WixCjDA7dJB5HAbUMiQLZ9HXeOi4Cadz2+osYgQOj1s9c3NR/h
         93zr9lafqM+1Z4lgS9VvpIGEvGfn3pVwYTcAIEPCRE4VWb0KBXHj/sw83xW/2iPqqBnE
         BPV1kHqrwvXRk3+eSCUueTPOISBnX/5ieCCCF4yh4IVFUCDg4vN0fkKZHVm1zuWqGc1u
         JSZQrSHKkT2M4mxkdJReAyTpB3NK5O+FVARYUro14gIohXUmQTYgZtufoLa+qeLcdY6e
         Uk4Pe65cHmoNeIhLoKtVb2RtSojo+9n4NGfdwTOBb54qTW/yMV8XVBqDhRekTkg2P7+S
         1Xbw==
X-Gm-Message-State: AOJu0YxJjYe/HTvA+LFmNT3F+LBr0bHlNZtKpA3AMmJWPrbaMDNUktBa
	6oABe6ATQ58n2cAProI6OqZcn5+aq/NfAyU+nQ4TDDvXzVF0ySICwGzaykGpiA==
X-Gm-Gg: AfdE7ck4ZbBJp/7I2kYuruptb5WsrC+XGXMjg9+ydgKd/idSB9qLconQBiKYQbHR76R
	laAVPI21Q7KE2jEt9R6Se5erjjdPHD0UGwJX8YQHQAzvHqF7mtTdLOxXeUENxPCuscLn8wKmypU
	scW0a8B6FtJklF9SNYhHdNS51dyUpP6TcT4VtjQz7WDgO5PaYZME53dIVIOfY0D52NVynfWixS1
	YspwLo77h0AMqg1M1Q8IXW8yRitWab5j2SZHmtefFQ/NBDdyZRR2icQhDNjopBCpF2M/NkON6lh
	YVfhdIeYPWVv5WkZyVGjiBu1EFRXV+0OfSZDD2hK/rGbvzth5MXy3Bq/vH/PYwTyoPgQXtIIT/h
	gw5jJwkcLdFMTgtFFyBCz3CoW+6mIfqBF2hmrDj2lMCL8jGXzNXemAE94s4mcNc6t+fXr+UAuwu
	4SM08tS+OC21o0ztHruIxctI0Oc3bBcjsfZDN3bgcOvRg4WFqOxKvOqfc=
X-Received: by 2002:a05:6102:a46:b0:747:4d96:dbb5 with SMTP id ada2fe7eead31-74753532c7cmr499039137.12.1784295273766;
        Fri, 17 Jul 2026 06:34:33 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc3688e1sm565059241.3.2026.07.17.06.34.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:34:32 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/6] nativesdk-packagegroup-sdk-host: add wic via a new SDK_FEATURES lever
Date: Fri, 17 Jul 2026 09:34:17 -0400
Message-ID: <20260717133421.3510970-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717133421.3510970-1-twoerner@gmail.com>
References: <20260717133421.3510970-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241184

wic is useful from an installed SDK for assembling or inspecting a wic
image, but adding it is not free: nativesdk-wic pulls in the tools it
runs (parted, gptfdisk, dosfstools, mtools, bmaptool, grub, btrfs-tools,
squashfs-tools, e2fsprogs, util-linux, tar, erofs-utils, and syslinux on
x86). Most SDKs do not need any of that, so wic should not be in the
host packagegroup unconditionally.

Introduce SDK_FEATURES, a list of optional additions to the SDK host
tools, in the same spirit as DISTRO_FEATURES, MACHINE_FEATURES and
IMAGE_FEATURES: a developer reads the setting and knows exactly what is
being included.

Gate wic in the host packagegroup on the "wic" feature, which is not
enabled by default. A configuration that wants wic in its SDK adds the
"wic" feature to SDK_FEATURES and gets a working wic, together with the
tools it invokes, in the SDK.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- replace the SDK_INCLUDE_WIC yes/no knob with a new general SDK_FEATURES list; gate wic on the "wic" feature
- add the SDK_FEATURES default and documentation.conf entry

changes in v2:
- gate nativesdk-wic behind a new SDK_INCLUDE_WIC knob (default "no") instead of adding it unconditionally as in v1
---
 meta/conf/bitbake.conf                                          | 2 +-
 meta/conf/documentation.conf                                    | 1 +
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb            | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdf37d0da247..b7bc74887b69 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -898,6 +898,7 @@ OES_BITBAKE_CONF = "1"
 
 MACHINE_FEATURES:append = " ${@oe.utils.filter_default_features('MACHINE_FEATURES', d)}"
 SDK_MACHINE_FEATURES ?= ""
+SDK_FEATURES ?= ""
 
 DISTRO_FEATURES:append = " ${@oe.utils.filter_default_features('DISTRO_FEATURES', d)}"
 
@@ -992,4 +993,3 @@ MULTILIB_VARIANTS ??= ""
 # what it would be anyway if the signature generator (e.g. OEEquivHash) doesn't
 # support unihashes.
 BB_UNIHASH ?= "${BB_TASKHASH}"
-
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 842cf31739de..604c51322813 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -361,6 +361,7 @@ SANITY_TESTED_DISTROS[doc] = "A list of the host distribution identifiers that t
 SDK_ARCH[doc] = "The target architecture for the SDK."
 SDK_DEPLOY[doc] = "The directory set up and used by the populate_sdk_base to which the SDK is deployed."
 SDK_DIR[doc] = "The parent directory used by the OpenEmbedded build system when creating SDK output."
+SDK_FEATURES[doc] = "The list of optional features to add to the standalone SDK's host tools, for example 'wic'. Analogous to IMAGE_FEATURES but for the SDK host side."
 SDK_NAME[doc] = "The base name for SDK output files."
 SDK_OUTPUT[doc] = "The location used by the OpenEmbedded build system when creating SDK output."
 SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command 'bitbake -c populate_sdk imagename'."
diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 51e48f250b19..c2974a57fe3e 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -29,6 +29,7 @@ RDEPENDS:${PN} = "\
     nativesdk-bison \
     nativesdk-flex \
     nativesdk-perl-module-integer \
+    ${@bb.utils.contains('SDK_FEATURES', 'wic', 'nativesdk-wic', '', d)} \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.50.0.173.g8b6f19ccfc3a


