Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B100C46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 09:24:40 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.98730.1703669070733716218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 01:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FjNATIBQ;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ccae5719cfso31858291fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 01:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703669068; x=1704273868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpfymWXb8ZQ1F3+YaBrzMLR0bhF0g8P8148N0zUMMKs=;
        b=FjNATIBQTGl9FmnJ+8/ba759f6VR6dd7TX8MTfjlrO/WlzmgTPWDeasekJyigmkXnf
         CzPIcVk4dSucg5zu4iR5nhFAb4awehIyf6CzyrO7thpPzy9PYuIjqO3YnafnbtSmV7U+
         N6OgAapCWZgJuoux7lmMpI59e02d8UEOtF9ig7lOTofEQhsHw15B0R9V3wzEPBgxFT+f
         Mq5lLJBuXeXbKb6+VqbvX+opnlraJ9l1bKmAQVGqkT5/Lrk/8MqiGGlIgjPBkLmvD1AQ
         0klmj1DVDKMdCHN1jPtzN0xsrw6hiX1fph2y9hi0UFDTn9cDdwMyJ1ayNt4JFT1xAM0o
         Tx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703669068; x=1704273868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpfymWXb8ZQ1F3+YaBrzMLR0bhF0g8P8148N0zUMMKs=;
        b=srJ4PMRG0ZBVAQ1xgpwznYjft0RRgr72nN6DuFTBXzGxUoElOsvF5mMUo2x5cR1N0r
         bSXut7/STiOX05SufWeDXIfi9ned4VG1WPd+faC4G+SdF42j0PWBngRCJIP9VDIRbUQd
         AE/EsS+PxpV64gmUBIzNPrpP7YOeFjByhuht7Dl+jM91jZ7bFjnUkndeUZt0XyqUz1yE
         +mvkVhZvUpwT4lGjvShi83hEa8BpIR1LlhqN4WsGtHNDzCRUqvrAKxlqW4YlowXBtOqF
         7o4GMww944At3u5RRk2Byd2w5wGVtL5iW82+6JMJfPNrQjtdI5tanKVEN9O6TVmKqZju
         6SsQ==
X-Gm-Message-State: AOJu0YxFv5eiGDNu0cL7oG4s/AWwkaG58Ffj7DKvPNpK4Ad7GCPy+Cnh
	B1KCA+Ro5vlxo5dTF8v6rZtKRVjw/RAws3E1GXKlgPNbZ19VitfN
X-Google-Smtp-Source: AGHT+IG8dZhWJaQuDC7pRxIn1Ycsly2aJC+8QNxCCUVZpo39l5ZE8tmr7wPf5dlHXb3lELX2iSG2rw==
X-Received: by 2002:a05:651c:544:b0:2cc:c677:4f8e with SMTP id q4-20020a05651c054400b002ccc6774f8emr894012ljp.47.1703669068663;
        Wed, 27 Dec 2023 01:24:28 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e18-20020a2e9852000000b002cca6703b13sm2131333ljj.99.2023.12.27.01.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 01:24:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v4 3/3] mesa: fix building of RustiCL + nouveau
Date: Wed, 27 Dec 2023 11:24:25 +0200
Message-Id: <20231227092425.4002461-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231227092425.4002461-1-dmitry.baryshkov@linaro.org>
References: <20231227092425.4002461-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 09:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192931

Incorporate a patch by Karol Herbst, fixing nouveau / libgalliumvl
dependency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../mesa/files/fix-nouveau-vl.patch           | 55 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/fix-nouveau-vl.patch

diff --git a/meta/recipes-graphics/mesa/files/fix-nouveau-vl.patch b/meta/recipes-graphics/mesa/files/fix-nouveau-vl.patch
new file mode 100644
index 000000000000..bcc1e274b6f8
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/fix-nouveau-vl.patch
@@ -0,0 +1,55 @@
+From 91039ec8e866ac870e237d265dd993c05c8e22e0 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Subject: [PATCH] gallium: fix linkink with libgalliumvl
+
+Upstream-Status: Pending [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26680]
+
+diff --git a/src/gallium/drivers/d3d12/meson.build b/src/gallium/drivers/d3d12/meson.build
+index a2ed8b3981d..f73fc11de58 100644
+--- a/src/gallium/drivers/d3d12/meson.build
++++ b/src/gallium/drivers/d3d12/meson.build
+@@ -135,5 +135,5 @@ libd3d12 = static_library(
+ 
+ driver_d3d12 = declare_dependency(
+   compile_args : '-DGALLIUM_D3D12',
+-  link_with : [libd3d12, libgalliumvl],
++  link_with : [libd3d12],
+ )
+diff --git a/src/gallium/drivers/r600/meson.build b/src/gallium/drivers/r600/meson.build
+index 023719a3a16..974b59d4594 100644
+--- a/src/gallium/drivers/r600/meson.build
++++ b/src/gallium/drivers/r600/meson.build
+@@ -185,7 +185,6 @@ libr600 = static_library(
+     inc_src, inc_mapi, inc_mesa, inc_include, inc_gallium, inc_gallium_aux, inc_amd_common,
+     inc_gallium_drivers,
+   ],
+-  link_with : [ libgalliumvl ],
+   dependencies: [dep_libdrm_radeon, dep_elf, dep_llvm, idep_nir, idep_nir_headers],
+ )
+ 
+diff --git a/src/gallium/drivers/radeonsi/meson.build b/src/gallium/drivers/radeonsi/meson.build
+index 29afa87c0b6..c89c417b02c 100644
+--- a/src/gallium/drivers/radeonsi/meson.build
++++ b/src/gallium/drivers/radeonsi/meson.build
+@@ -168,7 +168,7 @@ libradeonsi = static_library(
+ driver_radeonsi = declare_dependency(
+   compile_args : '-DGALLIUM_RADEONSI',
+   link_with : radeonsi_gfx_libs + [
+-    libradeonsi, libradeonwinsys, libamdgpuwinsys, libamd_common, libamd_common_llvm, libgalliumvl
++    libradeonsi, libradeonwinsys, libamdgpuwinsys, libamd_common, libamd_common_llvm
+   ],
+   dependencies : idep_nir,
+ )
+diff --git a/src/gallium/targets/rusticl/meson.build b/src/gallium/targets/rusticl/meson.build
+index b2963fe6dfa..e1acaca7e68 100644
+--- a/src/gallium/targets/rusticl/meson.build
++++ b/src/gallium/targets/rusticl/meson.build
+@@ -42,6 +42,7 @@ librusticl = shared_library(
+   ],
+   link_whole : librusticl,
+   link_with : [
++    libgalliumvl_stub,
+     libpipe_loader_static,
+     libswdri,
+     libswkmsdri,
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a192562a7935..885d45af5684 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
+           file://fix-nouveau-vl.patch \
 "
 
 SRC_URI[sha256sum] = "6e48126d70fdb3f20ffeb246ca0c2e41ffdc835f0663a03d4526b8bf5db41de6"
-- 
2.39.2


