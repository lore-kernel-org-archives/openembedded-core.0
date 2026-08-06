Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A276C56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:14:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13247.1785993287393087376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 22:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rJqKc45m;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954df200ddso11963465e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 22:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993286; x=1786598086; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MjOBcDOh/Gbbb1Y73jiYcS7HmsdGcEDmQDrGLvwA/+4=;
        b=rJqKc45mjVP+BcE9HXrNsudW0+NKAaJ+ja3hTlRF9VsXUCYDxEM+rOyQSqNlZUUAJW
         dPd+v+TL1wx8PhH1VdMh72itqOx6epgvSUj0aMg2bDvSK4VhueQDp7Dq1wBTvGHr7tfu
         rmYtUiITV+d90rdiZZOAOxyAsLQhc60MyQqKxu3NLfTadHOXBdjnFPJlXqw3+GK8Zv8O
         bgFzmDnDFQ18LW5Q+7aDoujcaHPQOhpUL8sWelM9QLsJxMVUe3NAOuwnwKkMiaqpz4CD
         q9kXfpGC0GUx81rrgIH6ku65+hjqwQzu9YUjo4iIXGgvKYfQkJy7p882QzxQMZ+Copov
         0YDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993286; x=1786598086;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjOBcDOh/Gbbb1Y73jiYcS7HmsdGcEDmQDrGLvwA/+4=;
        b=HBlwFoHVZFZ+OtE7tQWA49SHsZxVfLhtvdCXkqUJIZ7zIUSGvVYaZITgmyIeoCUOwX
         yyRk5UJXh2v8Zco3Arj+uipTqgtoB/phjuUM8QSylFZoIJcbbLReudLF4FQFpmX7BA4y
         sX83c7tVffcomlmwkN1oJbuycriy7Sx2QIFsKaw5ZjjAtWYMNWIc0btsCBMZ7ADUb45p
         zDmA5gVv9bkpJWwP7cW2XMl8A2sBJ/qSSMyfcCJLkgkQa37kZNGUamSTPGxJFxL5UAZx
         BtXDNFa5+TlA2A3UMy22JoQf1DUu8YpTWTZqh9AuV7Az2RKYHcgHOSL44a2o/9ZboEzM
         4B8Q==
X-Gm-Message-State: AOJu0Yys96Ed7I5VB/hLrAYYJlTATV7matFjILa9eVmnXDCwr+vfaAwe
	e9T7SSmZvVh1zGvGaAh23EQcAggryLhd/Z/MopaR77ApTpw8Y3JY9kqdVjaqZg==
X-Gm-Gg: AR+sD13GGxRkCkfGWOQ+s4W9zXGhRi+dbt1hbiykLFO/hg1BMjapnA+9qZ7fnSYMECv
	Ll7u90vc7HbaMq24oTi6AskXErM/q+xZ4cBWUfaGw8O+zNqAsLeIehICNVDwUbVhipSIfIpp92u
	SACROvBrF3PbJtdieImmDC2GgLQYTZ/wD/lQquPuWFhZ4a8A/LPV3KxHO4BjPtlYoEiAgiTRMw3
	nvFXVTFHuJLWnTYDUGRggRe+tgh8X7Q5w3UjjZWOT3gBYa11VmJ2CdjfyfMKb2F8+NXsVs7wV9B
	OalvIEMykMR76Yla/nW8LJMPBdibQD5f6DC6fjCmtV+NlIlFV4wZVq1KhW9GxAg2bA9G2PMXdgv
	L56jbTnfFQQk+OEbnRU8PgLIflIMH1mZBdsoyTgov6WZN78gOLYZy2C7Oga86ri59c26MiSSHXv
	cVRzAsTFEyyAG/exg6PGysNBTu5DOSpUHH4oXfOmyuh+B+vd4u5m1Uy58jSZBI
X-Received: by 2002:a05:600c:1d23:b0:499:516b:83d5 with SMTP id 5b1f17b1804b1-499516b83d9mr83846795e9.11.1785993285585;
        Wed, 05 Aug 2026 22:14:45 -0700 (PDT)
Received: from term011.lan (95C81D0F.dsl.pool.telekom.hu. [149.200.29.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542183b2sm35765355e9.4.2026.08.05.22.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:14:45 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 3/3] mesa, mesa-tools-native: Use mesa-libclc
Date: Thu,  6 Aug 2026 07:14:37 +0200
Message-ID: <20260806051437.276400-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806051437.276400-1-zboszor@gmail.com>
References: <20260806051437.276400-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 05:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242898

According to the release notes at
https://lists.freedesktop.org/archives/mesa-dev/2026-August/226690.html

| One important note for packagers is that there is now a Mesa community
| maintained libclc fork that is verified to pass the OpenCL CTS with
| Mesa/Rusticl, and will fix bugs after an upstream libclc major release
| branch goes EoL. The Mesa build system will pick it up when available,
| and fall back to upstream libclc if not. This libclc fork is not
| verified for any other usages or users of libclc outside of Mesa.

Rusticl would complain if about not this libclc fork is used due to
OpenCL CTS compliance.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-tools-native.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.inc             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
index 20207450bf..c495d2e8a8 100644
--- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -11,7 +11,7 @@ PACKAGECONFIG += "gallium-llvm"
 # to PACKAGECONFIG like in mesa.inc
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
 
-DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native"
+DEPENDS += "mesa-libclc-native spirv-tools-native spirv-llvm-translator-native"
 
 EXTRA_OEMESON += " \
     -Dmesa-clc=enabled -Dinstall-mesa-clc=true -Dmesa-clc-bundle-headers=enabled \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a50b900cf2..fa51d62bfc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -109,7 +109,7 @@ PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
 
 # "opencl" also requires libclc and gallium-llvm to be present in PACKAGECONFIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang libclc spirv-tools spirv-llvm-translator"
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang mesa-libclc spirv-tools spirv-llvm-translator"
 
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr xorgproto libxshmfence"
 # "x11" requires "opengl"
@@ -253,7 +253,7 @@ RPROVIDES:libopencl-mesa += "virtual-opencl-icd"
 RPROVIDES:libgles2-mesa += "libgles3-mesa"
 RPROVIDES:libgles2-mesa-dev += "libgles3-mesa-dev"
 
-RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc', '', d)}"
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-libclc', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgallium \
-- 
2.55.0


