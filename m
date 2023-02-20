Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C881CC61DA3
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:20:42 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.27666.1676931632661902981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=S9QBuTxw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id z2so3139286plf.12
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zp1vk4kUOmVAEqybZ4ZHyfCcGLaruBZ/AuKsSvRPlQ4=;
        b=S9QBuTxwHoopQ3V2ZPh0nnHUEwwRiGvKn2uJkGDnb4Ts9nII34ZdOuay6vHuKTswNv
         5yjGvED2EfmMfbL5ojg4Eyl2yq/rx6SOiAylBYCEXFAsBAjBEUp478hga/6MdTx09/AA
         1ocaSx48fQjyqt1qgG5ekVOoC+7/SisbphgYyxqN5zbt9ePDHbXUkLOilAyAPJttmU8z
         M5Y4sbBkIwnSCJOJnnpuHd8WUN6/Sz9dposlHj0xRvHe98ldX80tBPxiFEN9BK1VQKBr
         oRw8ejM8AiTFseq/dN3c4PzkATb42LOWUZAy/+Xi6d/gBr3Oqz1qAxjPQMA+6c6+r0V4
         4VTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zp1vk4kUOmVAEqybZ4ZHyfCcGLaruBZ/AuKsSvRPlQ4=;
        b=fYlW6g0rjZ0FIEw4vLXyH3njZ2ppx7tSVggcfgf1NxgHpXvInvAx9KK0m+o7aFZ1qI
         g9tJzaPKpw0ZXB4tRHl/tscVYpNIeFL2IxFoNc3WjTQ6sRQbTTXRkulwh5DBVrR1u29w
         Pq7mkS/sLiE0ci5yzerZq/JFAyfONyrwcUX3OVXSQn/U7cxdwf44R/n/Jpg4sgP/jBVf
         hDm22LuNofg7HkIJV0UT7M3mrn9h0qOYY5J6tp1O4xl2bViYxQtrUizRhFk4txXUnRce
         QC6Kf12VrNMqe+5AGnNBq6ShvprX57JEeajFjARR9lkwoanmNuRqFdw0VXAB9eSIOBn/
         G33A==
X-Gm-Message-State: AO0yUKXYMSGpXBaw4SaZumbBWnNL1uG5lavafhWd4pI1Yl1c0ecsdoHy
	M0xlKtaqvNqZPi/01hWWUJjwHFfSVU3kOpsWizU=
X-Google-Smtp-Source: AK7set/ZTgnkh6hVb13FD5oLt5rkIFD7tuHT8438yjpHsDmbjxp4nmiGLUKYgoOz65xYzMryxY02Uw==
X-Received: by 2002:a17:903:18d:b0:19a:723a:832f with SMTP id z13-20020a170903018d00b0019a723a832fmr4694454plg.7.1676931631334;
        Mon, 20 Feb 2023 14:20:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/16] qemu: Fix slirp determinism issue
Date: Mon, 20 Feb 2023 12:20:08 -1000
Message-Id: <e5dc03e4a3b71ff144896a8ce56a34b8677e8e27.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177461

Add a PACKAGECONFIG option for slirp, defaulting to internal. This avoids
the presence of libslirp on the host causing qemu to link against that
instead breaking reproducibility and usability of the binary on hosts
where the library isn't present.

We need to add it to PACKAGECONFIG by default since users do expect slirp
to be enabled in the wider community.

Note: qemu version 4.2.0 doesn't support an "internal" option for
enable-slirp, so use "git" instead which uses the same configure
code path, avoids host libslirp contamination and forces use of the
qemu internal slirp implementation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5a9a64132bf5ecac9d611d29751226a466c4a2c1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb | 2 +-
 meta/recipes-devtools/qemu/qemu.inc                    | 2 ++
 meta/recipes-devtools/qemu/qemu_4.2.0.bb               | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
index d83ee59375..5ae6a37f26 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native"
 
 EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm"
+PACKAGECONFIG ??= "fdt alsa kvm slirp"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fff2c87780..e9fcb239b4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -279,6 +279,8 @@ PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
 PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
 PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
+# version 4.2.0 doesn't have an "internal" option for enable-slirp, so use "git" which uses the same configure code path
+PACKAGECONFIG[slirp] = "--enable-slirp=git,--disable-slirp"
 PACKAGECONFIG[rbd] = "--enable-rbd,--disable-rbd"
 PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
 
diff --git a/meta/recipes-devtools/qemu/qemu_4.2.0.bb b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
index f9905e2812..05449afe4e 100644
--- a/meta/recipes-devtools/qemu/qemu_4.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
@@ -24,8 +24,8 @@ do_install_append_class-nativesdk() {
 }
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm \
+    fdt sdl kvm slirp \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
+PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm slirp"
-- 
2.34.1


