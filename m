Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68880C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:40:28 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.174836.1783435223844952882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 07:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MdD1pjhf;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: twoerner@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bdfd7a2e06so2717153e0c.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435223; x=1784040023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJDpYzlVnu+OT/fmKKmTxh3+M45OXWKUkYpcOc0NHGM=;
        b=MdD1pjhf5z+b32bH3oZlFNwWHcsdnFHVGQxfT20yTG99MFI6/Rh/cyKUCr5x4QEwH+
         Xs+CAoSQGeLMOBrbo+BUIpYWqFfA0E7BlDe0oPb/pGi4Ur30xFTjEYDkHnquNM04sgkV
         rCGDCw2FuiBl+PwJnU72d2+jTR7T/U34yGnKcVkBW/NzYrV8nMTIZaQ7u+uIxn9oU8XT
         pq2ezTyDQlYAVpsSeW0wDkt5jKqDZR72824XAICRFhnUivJw6hx2GmwEmm2Wc/IYD5k5
         bXXf+h11stGhWG5lqufKynrwCjhQtHoWxLbQk+zRK2g5/UEXaPlo33nWCx/miQEkZSO6
         icnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435223; x=1784040023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJDpYzlVnu+OT/fmKKmTxh3+M45OXWKUkYpcOc0NHGM=;
        b=jjiS9hnBkNhPFLhBqRBs4Z5PLJRqCQRmaIKeqBwTthoc3GgYzb6Uw59kiZEgXFteWi
         L5F5bDobitrEPEzMLPZcooEmyZG7He24l9TMgf4ZLLI40fOi0oAPyyjcsBhREBJGABbL
         ggzqTAXRwMbD2qtBEGuGXynDjD75Bls3rkMeazXoKmGXcd8o8WftI/5XaxRcOLcir9IT
         zovkJIIhO76JM/NtEJqodjTnMCLMwc0kMaYop17Kizv96dvI8TnbCsmZKqCXLae9J0rh
         IrAkmfkcwlKVdGmbmYhMxAQsUinAtLM56M+EsprXa6hpLWAQVdlfqIv5IV9sxFhUnU5u
         Q6pQ==
X-Gm-Message-State: AOJu0Ywt70ETltJXrbMhFzjVQo0eyWVl7sdFIdvEv35XPUdhK5xOmy3s
	/owRthD+h+boWejsEg+BQ9muc3bjFdmarBe7zateZbjaWXKT41pMss00neP5wkut
X-Gm-Gg: AfdE7cnzVmT9e1eInIBjmwaYEHrkmEO9HELJJw3dPqsryszjiFJrHZHRAr1GOkzhHQH
	sf4QYV3r03Ks/SJovT2rsHdQkl6wA8Q8OtIXTbrmeMhosMivP/KWL7qys/ADvZWy8HubJ6+XH5M
	MzKSGYCRtj0Ca8VMF3I8tTd1k2or9qCql9cyOijyZW7U9n6T2e6RK7fFZidDolOYHBl9U0L7GkG
	yRiIn6MTqV4IEwrnJEuNvYdkP0G6SBKkqs8+KOronAgjH1lC70qe0IlVVxlM7sIuvHXFWdwPeMf
	i8gcVxTtk8ALVWyaNGLlSN/oxLO4CnkKgUmLLkNc/C30IJNXXY8JqyXY8wdel7yyp457jqIOfAj
	UgncgSQf7NLA+qNJGRhly4njG8wAydX1EH/9IRy7BuXYysQQ6+C1/civPzQl1lrJFpHe6pYfEGQ
	x5P21QcnnYAdUuEs8QyDlOGoYEiRBR/nIAVOKJwoZVX99OXEDIoWXVFHg=
X-Received: by 2002:a05:6122:a0c:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5be907a31b8mr3331979e0c.8.1783435222715;
        Tue, 07 Jul 2026 07:40:22 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be02934c13sm7107780e0c.3.2026.07.07.07.40.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:40:21 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] nativesdk-packagegroup-sdk-host: optionally add wic
Date: Tue,  7 Jul 2026 10:40:09 -0400
Message-ID: <20260707144009.708407-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260707144009.708407-1-twoerner@gmail.com>
References: <20260707144009.708407-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240399

wic is useful from an installed SDK for assembling or inspecting a wic
image, but adding it is not free: nativesdk-wic pulls in the long list
of host-side tools it might need (parted, gptfdisk, dosfstools, mtools,
bmaptool, grub, btrfs-tools, squashfs-tools, e2fsprogs, util-linux,
tar, erofs-utils, and syslinux on x86). Most SDKs do not need any of
that, so it should not be forced into the host packagegroup
unconditionally.

Add an SDK_INCLUDE_WIC knob, defaulting to "no", that gates
nativesdk-wic in the host packagegroup. A configuration that wants wic
in its SDK opts in with

  SDK_INCLUDE_WIC = "yes"

and gets a working wic, together with the tools it invokes, in the SDK;
the default SDK is unchanged.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 51e48f250b19..37218824171f 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -9,6 +9,11 @@ inherit_defer nativesdk
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
+# wic is useful from an installed SDK for assembling or inspecting a wic
+# image, but it is not needed by every SDK, so it is opt-in. Set
+# SDK_INCLUDE_WIC = "yes" to add it (it pulls in the tools it invokes).
+SDK_INCLUDE_WIC ?= "no"
+
 # autoconf pulls in nativesdk-perl but perl-module-integer is needed to 
 # build some recent linux kernels (5.14+) for arm
 RDEPENDS:${PN} = "\
@@ -29,6 +34,7 @@ RDEPENDS:${PN} = "\
     nativesdk-bison \
     nativesdk-flex \
     nativesdk-perl-module-integer \
+    ${@'nativesdk-wic' if bb.utils.to_boolean(d.getVar('SDK_INCLUDE_WIC')) else ''} \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.50.0.173.g8b6f19ccfc3a


