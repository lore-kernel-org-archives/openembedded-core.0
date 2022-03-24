Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D74C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 16:13:39 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.12966.1648138418738686452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TsSEBbMS;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 gp15-20020a17090adf0f00b001c7cd11b0b3so996708pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FzMChxh5k+zI0Cxm6iihQTpNT4G+DFNLoo01FxUwaK8=;
        b=TsSEBbMS9SZorbkwCQJfcWm4Ub3/PouCeQ5YIzb6Pppfi/Qocy/ieKWIispBtH8j+h
         Zhy/Yuau2iZQu6UdpYR1KHZS6dQ2r94Vr5y5EstyEi/UZtw7FX3icdhyEKR+csU8Mdvv
         gw3viIYjwzkxYW+pswggcDSc9A/NYoe4d5gh6x0L9W4ioKnjrDAJCOB75HgpV2kcpUxM
         yqhTyYjpGb6lvzXIYCag5Y6WnTfnMOdzi65VPumawLDzUGnYH/xipebhZfgnG32PxH5v
         PZJRDr19r9i7o1VwUwqnQTjRCOfzwV7ktwy1l8+65j+tiAnJEV5EFPNm5ELRNWlaeHIl
         zl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FzMChxh5k+zI0Cxm6iihQTpNT4G+DFNLoo01FxUwaK8=;
        b=FlJLOYmOFF69nzk4OLAPoG9EnS7edQ8gJTCMHw+hfyJ2kxEIO9wzsfMVNwSUIq/fwG
         DcreJuu+chMvIBJqiAqxWoQeeHWD3XlhLjw2yNDFmtZ6yPRQq1PVWKIokwZky9u7MXXQ
         7UWQqBtjRJEI2CnD2DJ0Rpvb9TAkwGuxBgWWgAOhjmJPo7x2tRkv2ajuJtp0Gh/3ENgq
         AaaXhr1CVjURh7dzcU6yT5GMLFJN3DZdMMf59NvlWWXwPR7Zj5cQ427f+gpUJvcY8tqb
         gQGiGg7YxS8Uhk90gTv4CDuk2gCYAllM9hytT2k0crF95EjdAE03sM8kRi/Sre3UxS1r
         Dvhg==
X-Gm-Message-State: AOAM530IPP+nUVdfx0GP9mU/jU4xxjW+/lYQljaEHikSnrGa1Pm4nULk
	u0S9TiJgBsorngM0Mylf5NrnHR1QDqk=
X-Google-Smtp-Source: 
 ABdhPJxxNrgzVmfW7FBnHHAlJyiJpJ7tLmg451mUwHedyIR/2xBOJgAEu+gYvedMeo8XBaUA7qwthw==
X-Received: by 2002:a17:902:f68e:b0:154:6518:69ba with SMTP id
 l14-20020a170902f68e00b00154651869bamr6776977plg.60.1648138417742;
        Thu, 24 Mar 2022 09:13:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 oo17-20020a17090b1c9100b001bf0ccc59c2sm10393992pjb.16.2022.03.24.09.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 09:13:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4] qemu: Depend on libepoxy instead of virtual/libgl
Date: Thu, 24 Mar 2022 09:13:35 -0700
Message-Id: <20220324161335.4192450-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 16:13:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163618

- This abstracts on GL/GLES implementations
- Rename packageconfig to epoxy to match what code it doing underneath

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rename packageconfig to epoxy as it matches code
v3: Depend on libepoxy instead of virtual/egl
v4: Fix qemu-system-native recipe to adjust for renamed packageconfig

 meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb | 2 +-
 meta/recipes-devtools/qemu/qemu.inc                    | 6 +++---
 meta/recipes-devtools/qemu/qemu_6.2.0.bb               | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb
index b544ab4e817..bc5384d472e 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native me
 EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"
 
 PACKAGECONFIG ??= "fdt alsa kvm pie \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 78aea71cc05..e9d2dae0405 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -142,8 +142,8 @@ do_install:append() {
 # END of qemu-mips workaround
 
 # Disable kvm/virgl/mesa on targets that do not support it
-PACKAGECONFIG:remove:darwin = "kvm virglrenderer glx gtk+"
-PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer glx gtk+"
+PACKAGECONFIG:remove:darwin = "kvm virglrenderer epoxy gtk+"
+PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer epoxy gtk+"
 
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl2"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr --enable-cap-ng,--disable-virtfs,libcap-ng attr,"
@@ -165,7 +165,7 @@ PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"
 PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
 PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
 PACKAGECONFIG[alsa] = "--audio-drv-list=default,,alsa-lib"
-PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/libgl"
+PACKAGECONFIG[epoxy] = "--enable-opengl,--disable-opengl,libepoxy"
 PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
index c7eef0a9d5e..92857adf9c3 100644
--- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
@@ -17,9 +17,9 @@ EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)
 PACKAGECONFIG ??= " \
     fdt sdl kvm pie \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
 PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
-- 
2.35.1


