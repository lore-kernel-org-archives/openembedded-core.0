Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5E5C44521
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:34:42 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13736.1784295276465903684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ImhlF4SP;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: twoerner@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6cf48482ddeso2160027137.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784295275; x=1784900075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MdysAh0RTvZZt1vmAeOhRr1h74KZZWBwzKXgDV1QgUw=;
        b=ImhlF4SPkAt7GLH1Jj7jJkxScuDUP5kiSYuOeNeJsB5gxIbVLDlK1mzwJbOel7dEJA
         6UtKMVgWqgkrpZNoVetJID1WU0dQMkthko0JaFEWvKHHG3GjxHhuHRg+mO8/MStgjlDk
         e9+hAquCfJdD3C7tky6n6QbMjNBdvcNo9qI/pMDwCpspaWODrax4k3RgX8OQFXOTkmff
         vPu+RbmpnTx6c/s6QvL9sDvXeihBmG2EsmyAhpbWBPwIgjYNXUev95SgHxW7G8vs1oW2
         9V8xuzJ27RAD5fZ23csfGC1w1zDlD7dpEbxG+HabQ5/Z22mJX5aevm4GHiQ/p67qzPFJ
         mMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784295275; x=1784900075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MdysAh0RTvZZt1vmAeOhRr1h74KZZWBwzKXgDV1QgUw=;
        b=GWEUd40Qs0xZ6l4jWNGY0q2AV/8xZkwjlmR0w2nqOeeBNb0XHhln9ZWZR1uQiuMmJm
         2ReSbP2DCfa51NuC71UBU1RcQXbwI1IhrHHXN5AfTqNfjpaK07b050FCVmDrhtiVUqCc
         Ohx/f2RJTkknbYKF3atWpDbDJYN4aVlwUceZefjoQfNhQKwGsharUWqZ4MDgc6g0tMCt
         nZMlxwKZo7ZwJ2XcGdtOfleN614q//gO99Yf8qf1Qvxomh2vh7tFnkMs/rHit7ksdRyW
         MYJAmy0t6PDRk3+e9ftXyBFEJcMWBp7hGqph4T+VghHPf7VUDI3HrqdlpxZJHGECp93T
         6opA==
X-Gm-Message-State: AOJu0YyDTMNJpiG2Ttlw3va+z8EtcPk+a+SFzCleRaCIYtN4qnHsGXc/
	pxDDGeK85DnAByI5O9Y+R8QQobjy249AW7ibBOHyJHO442xXBhBxbmy+mJA6wA==
X-Gm-Gg: AfdE7cmaAk0IdRSP4wl+488vh8FUqDOV+gPP4tsroqbfqCZa4NWpWfDw0tyhGx4HqN6
	iGJrJcl5a4rXevSXKLD2DhLcbx67idyT2JPxxSxX2kDOHnbua/JTUpJVZ1sgADYkeCLgfrZ2Yv3
	o2pyTtEpQp+F0v0JF+LKAxUeXi/CqDuGpisXiDs5alTuBtYmY11xzEatX8nj8w1td4PRa6Z1i2P
	4ht9UVAN3D0/VLQmUjnMyAUmiYKklQQxoo2ptDf+K008Z/pH/ryMWPI2kG1GELJ9ghf6YCToKBe
	RPyxGJxIp26fMGWIihoQMbvPO8Mekz+0vG5bSTdKb/SZzVceNDBAWJZ0Rt3mCa5cLBWiAa6vETi
	kUqiMk5QkZRjn/mpW73xG0dZWShIyMuY8IxOh+X9DgvuX/n6AM/PkRFWDGS7TENGexrmboj6ex2
	5OTrr70Gro8wlU+U5FdVJgF0rhKl341M6YEztQuGloBdt6
X-Received: by 2002:a05:6102:3f54:b0:728:53be:7c87 with SMTP id ada2fe7eead31-747534fef2emr478458137.7.1784295275265;
        Fri, 17 Jul 2026 06:34:35 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc3688e1sm565059241.3.2026.07.17.06.34.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:34:34 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/6] nativesdk-packagegroup-sdk-host: gate qemu behind SDK_FEATURES
Date: Fri, 17 Jul 2026 09:34:18 -0400
Message-ID: <20260717133421.3510970-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717133421.3510970-1-twoerner@gmail.com>
References: <20260717133421.3510970-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241185

qemu (with its helper) is added to every standalone SDK on the
architectures where it builds. It is only useful for running target
binaries on the host via qemu-usermode, which not every SDK user wants,
and it is a large thing to carry when they do not.

Move it behind the "qemu" SDK feature, which is enabled by default so an
unmodified configuration still gets qemu exactly as before on the same
architectures; the architecture guard is retained. A configuration that
does not want it removes the "qemu" feature from SDK_FEATURES.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- new in v3
---
 meta/conf/bitbake.conf                                          | 2 +-
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b7bc74887b69..c9317bc9722a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -898,7 +898,7 @@ OES_BITBAKE_CONF = "1"
 
 MACHINE_FEATURES:append = " ${@oe.utils.filter_default_features('MACHINE_FEATURES', d)}"
 SDK_MACHINE_FEATURES ?= ""
-SDK_FEATURES ?= ""
+SDK_FEATURES ?= "qemu"
 
 DISTRO_FEATURES:append = " ${@oe.utils.filter_default_features('DISTRO_FEATURES', d)}"
 
diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index c2974a57fe3e..7205599288a2 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -13,7 +13,7 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 # build some recent linux kernels (5.14+) for arm
 RDEPENDS:${PN} = "\
     nativesdk-pkgconfig \
-    ${@'nativesdk-qemu nativesdk-qemu-helper' if d.getVar('SDK_ARCH') in ['x86_64', 'aarch64', 'ppc64', 'ppc64le', 'riscv64', 'loongarch64', 'mips64', 's390x', 'sparc64'] else ''} \
+    ${@'nativesdk-qemu nativesdk-qemu-helper' if bb.utils.contains('SDK_FEATURES', 'qemu', True, False, d) and d.getVar('SDK_ARCH') in ['x86_64', 'aarch64', 'ppc64', 'ppc64le', 'riscv64', 'loongarch64', 'mips64', 's390x', 'sparc64'] else ''} \
     nativesdk-pseudo \
     nativesdk-unfs3 \
     nativesdk-opkg \
-- 
2.50.0.173.g8b6f19ccfc3a


