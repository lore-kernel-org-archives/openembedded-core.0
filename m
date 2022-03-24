Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC77C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 02:11:49 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.6006.1648087908393987205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 19:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gGughtcy;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id s11so2829586pfu.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 19:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FKUaAtLQqajFaFAJxNo75Yfm+ez9M3X4onIDLk8iZQU=;
        b=gGughtcydBXrkorXBSGyi/zamC5sR4jk+UhyWAHq667YHFH24RbM/gmQ+50iV1wsMs
         ++L1jYz80BZnv4a1GBs5v7twM55HV69qL73TNHWBWKG7LCl/0OhElUgvXJniRQQteAjq
         75H7MLD882AQj070VI9uG1sPo6txcsF+TroZbgTqVZceX+k/mIG3G0258Cr9crs8tEiI
         /SvOk5wFAb6S/X/9puTtklxyNMTsVKmSutWKEuh9Y/8E8QEMHBnN0lUPTc6rMsZTkniq
         X2+mW5wCBwp7DxLIwkHqZ8oB4EO2WYZvA+GmwMNlJMqXUREHOjlAScXGy/RRBJ//XezA
         +ykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FKUaAtLQqajFaFAJxNo75Yfm+ez9M3X4onIDLk8iZQU=;
        b=UOkJ3KbIMZ+IVJyS3Mlh5dKlHmZqMRYJIODrYeFoWmI8ouZsrdTt/gAzv0jf/la4fb
         NmKfqP98umxK8hV4+iwuRDZOaA2xY4DYZW67p9VBzlOtzvagrovS0cggG/NHByI0jAsS
         QhTd1O5RXlqn8jgOPGiXHl4RexMeRz1twSrtnohjkKIqaXeW/ZG+AEI5cxIkBu2RGhqU
         vkSE9dyfUjmMky0CZk7Zp6ihiJtOlBFOuutv5kUVRwHAQkigaMOhIB97StHbSXnOYtp9
         32SpA9nrqMz1obSFrCCv5L1MfwyQ7zTIpiDnsoryEp7MEDezQWwi+C2bEIymOTD8stq5
         pzMA==
X-Gm-Message-State: AOAM532vLzh+ureO1ZgVEPMPJClmMvmjHdCQAjLJ+D3Jg7fJ9Hkip9JZ
	lFJo2Xbm6dM/zT/u+C8greFbKal3HQsG7w==
X-Google-Smtp-Source: 
 ABdhPJxCjJHVGeXAo8O4erBXF2L9qJ3fMd+xpOqRbeSn1tQZAHpII3FKxy09tAsXqHl1D7lWlxQqRQ==
X-Received: by 2002:a05:6a00:188f:b0:4fa:ece9:15d9 with SMTP id
 x15-20020a056a00188f00b004faece915d9mr1306028pfh.28.1648087907658;
        Wed, 23 Mar 2022 19:11:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 n52-20020a056a000d7400b004fad9132d73sm1089414pfv.129.2022.03.23.19.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 19:11:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] qemu: Depend on libepoxy instead of virtual/libgl
Date: Wed, 23 Mar 2022 19:11:41 -0700
Message-Id: <20220324021141.2159404-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 02:11:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163600

- This abstracts on GL/GLES implementations
- Rename packageconfig to epoxy to match what code it doing underneath

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rename packageconfig to epoxy as it matches code
v3: Depend on libepoxy instead of virtual/egl

 meta/recipes-devtools/qemu/qemu.inc      | 6 +++---
 meta/recipes-devtools/qemu/qemu_6.2.0.bb | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

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


