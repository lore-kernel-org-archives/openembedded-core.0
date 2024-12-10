Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE93E77182
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 21:06:37 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.4185.1733864790022729655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 13:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZHmkM8Jq;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-467777d7c83so11465481cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 13:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864789; x=1734469589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLHiv35ka3kX87sbYtPdQmP6EM00dr9N1d0nsC+Fk70=;
        b=ZHmkM8JqSBX3Q56kHJkSZaK9qt3HeFAUMHEtCDSfQPNa/Tav1A3ooTJ8a9CHLeX4Gr
         vBpPzbLhauSoG7uYHxpkeaDXnf4wVAb412bltK9OZgYdbfAA5X2rv6VYrp9wWcRXpUzR
         yPgiKZEeySkPfBVqISrOkB/1yNfXZdyUX+EK4wgMJ7bC212QkXsrmZumxntfkiDrO/Bn
         U/nCObPwgLH1nWt9xTwlwNRWTKg4INW5f83MHEbnknp6C/NNkiG7V4TJQkx7djeBJTDS
         q/5RTQb86XAH+QHO76HJOk+Xq09APf1eGSADcaRrBCrgMDnEXXzVfN0WNSa8i1HSZaKH
         h47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864789; x=1734469589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLHiv35ka3kX87sbYtPdQmP6EM00dr9N1d0nsC+Fk70=;
        b=gwom+KWBeGijN3LlEXucuhOg1/KhENDqnsyBIF0chG+KrewbA8pzkIavhYIEtE0PIW
         Ps+/g0M4/6WOe6/yIX1SgyeQKbJOpOI9GHR861KND0aA9i5hxPQY0kE8Fh/VxqXDzqpT
         0sfXT4psTlj3EFv9JTO4NhtV+u+p0vbNGFdKJ1BNMQLCsWInLXfDxfPnIYqyX8feAY44
         T3cnYC9aVrJaWR+ctZoNgvO+q56ObhEGbynhJMqDwe1YU8smmoIANtKhibNlyjXYuNjp
         KiB3MnrDDy4q2+j5I2BhI6yx5GvvD5RMx62CGhqP8Z9zHpeT2GKjhBCRL85289j6uGwx
         h7AQ==
X-Gm-Message-State: AOJu0YyYsSlLuaF5aRRM4aTVCqjoHccj16Yr+gt7YRTGgaUXhhw8G0A8
	7SjB+n5cE6lH099Xt0vcwCOvHReLWjJu4+QJr8qOR7hZZ7Sy+aqv7oTdwSAt
X-Gm-Gg: ASbGncuXumFES9qANYXiHZ5UYfwloLCNyvwjR4YhDgDFRhPwbISW+qVzFpQf1cwTSTU
	RS/IEEmg+fsQQBFCaIz4/1mLlJj0Lg6+j5f6cFg9+aeJg0Px9cs9/aIj68rcRp70WWVDcWKuUTI
	iLrFNymM2fEeR/PTbMPgxH4WwZ3zVNWFXITKfQ60+1Qi4BLhRQhHmHsdG8uB684zQd9kcGwaKOz
	xc4r0zMrULcCoWLGdosfLscU7+ZGN7Aq8j1kPVi0bf/70oKxgAGM55D+z/kZ1b39JuTgdDj7gGO
	RPEIYPcr1TzJCng12dNb0FjRJSA+zvj8Wf1xa6ZsWPh4VtiqxWJRIVE=
X-Google-Smtp-Source: AGHT+IG4Y7+I5w2YqFO3pDgkY2TKDQOPHTlGtZ5Onkxz8gjhF8j/+9AGN+iVNEd5IVlG1jzcXZ6PPw==
X-Received: by 2002:a05:622a:1389:b0:467:5a54:877a with SMTP id d75a77b69052e-46789309d4fmr5935301cf.28.1733864789069;
        Tue, 10 Dec 2024 13:06:29 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4676e091d95sm18415301cf.12.2024.12.10.13.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:06:28 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] poky/poky-tiny: update default to v6.12
Date: Tue, 10 Dec 2024 16:06:17 -0500
Message-Id: <96fdaf0aab7a75c7dbf9e5bee583ac3c6353f262.1733864271.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1733864271.git.bruce.ashfield@gmail.com>
References: <cover.1733864271.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 21:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208561

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 6.12 kernel is a LTS and our next reference kernel, so
we bump our default to it.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 2 +-
 meta-poky/conf/distro/poky.conf      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index fd17097b56..20c13e6f60 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -44,7 +44,7 @@ FULL_OPTIMIZATION = "-Os"
 # Distro config is evaluated after the machine config, so we have to explicitly
 # set the kernel provider to override a machine config.
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-tiny"
-PREFERRED_VERSION_linux-yocto-tiny ?= "6.10%"
+PREFERRED_VERSION_linux-yocto-tiny ?= "6.12%"
 
 # We can use packagegroup-core-boot, but in the future we may need a new packagegroup-core-tiny
 #POKY_DEFAULT_EXTRA_RDEPENDS += "packagegroup-core-boot"
diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index b17bee5db5..f35f5382e1 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
-PREFERRED_VERSION_linux-yocto ?= "6.10%"
-PREFERRED_VERSION_linux-yocto-rt ?= "6.10%"
+PREFERRED_VERSION_linux-yocto ?= "6.12"
+PREFERRED_VERSION_linux-yocto-rt ?= "6.12%"
 
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
 SDKPATHINSTALL = "/opt/${DISTRO}/${SDK_VERSION}"
-- 
2.39.2


