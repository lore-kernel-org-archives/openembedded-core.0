Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B064EC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:30:48 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.21789.1658104241478580110
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GZ1TrhC1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id bf13so9224930pgb.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TQZeZDV5hwASZa0IjrF7ctNQQqjVxCjZAXUCcfIcSFE=;
        b=GZ1TrhC1OTn+EooJfacozzNPPCLIb66BuOyNC5msYy2baXFKq/KHfqzcGScZIuqrs4
         JLTuFLKKP7UcLhDwDk/aqI03zww4/NkVMRHcHaPplBT7MTujfGZCse5FGXeOsZyfXPzO
         FxH9PFq3faRlBmmNxe7dCNXzv++pb1wL82aTfg5sC3WrzL8ZQE0heh593IGh/Xbtao1D
         0EScAFdrEx5oZMfG4UAqsoXWx2fq8ipp6umzyDZrLe59AJh8AqZukmxG0zPWU37jtDEw
         Ad4pYNrQYazp4UpWmFRDzRTrW3lRmEyN6GNWmZ6moqUzm1FygzMzvvOIlKAczTDweqYy
         Vh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TQZeZDV5hwASZa0IjrF7ctNQQqjVxCjZAXUCcfIcSFE=;
        b=XS9pMwATJbcQzaEeKIepqWBE2e1aQQfWLg3tuyRtLOFZzZl/8gKzOBz9XFzs4zghGI
         qreRPCaVMiqVTYgD+UeaLtJhkxn9k9UPsPj1fHgSjM6Kng2mdwLyS1LvG386zAhjZt81
         9oW2JzxL3AHFwbcWQag3drpXJ2ehJAil7mUpYJE0pxw5b7tH8t9DU+JrrOc1Ac3ZX0cO
         0snBZVBKM0o3fE+rZO/yvL1CE4Xswp1NFUfloi/pGfd8iF4gKW8qI1ZDJ1XwEaxUzYhn
         oBxhHnVjFuDtqHl3Yi4ch+Q18OzzPzx4avcro0ByboZDHWaIFc2PEU6VVMKFrPhmavdz
         AIbw==
X-Gm-Message-State: AJIora9vpEqh4kNvjK+JBCQiZgx5T/P7wyeVhywQFAYxUltI02mVg2/5
	uutv8OlWl9xN+q3k2JfM+QcCBsCwr+K02TbS
X-Google-Smtp-Source: 
 AGRyM1vNyNTiO3/9x8nnD2xthYjiUdKvp69Nw/9sZ0rEiv8endPFzscgGUT4WvUXB3Bn8qgNFByETg==
X-Received: by 2002:a63:149:0:b0:40c:f753:2fb0 with SMTP id
 70-20020a630149000000b0040cf7532fb0mr22319782pgb.172.1658104240158;
        Sun, 17 Jul 2022 17:30:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.30.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:30:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/23] qemu: Fix slirp determinism issue
Date: Sun, 17 Jul 2022 14:30:02 -1000
Message-Id: 
 <9637a46258a596ccb0a7ddc350b33a5fc6c7872e.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:30:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168166

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a PACKAGECONFIG option for slirp, defaulting to internal. This avoids
the presence of libslirp on the host causing qemu to link against that
instead breaking reproducibility and usability of the binary on hosts
where the library isn't present.

We need to add it to PACKAGECONFIG by default since users do expect slirp
to be enabled in the wider community.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5a9a64132bf5ecac9d611d29751226a466c4a2c1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb | 2 +-
 meta/recipes-devtools/qemu/qemu.inc                    | 1 +
 meta/recipes-devtools/qemu/qemu_6.2.0.bb               | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb
index bc5384d472..5ccede5095 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native me
 
 EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm pie \
+PACKAGECONFIG ??= "fdt alsa kvm pie slirp \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8c5a649c76..e1b5b2e5d3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -202,6 +202,7 @@ PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
 PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
 PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
+PACKAGECONFIG[slirp] = "--enable-slirp=internal,--disable-slirp"
 
 INSANE_SKIP:${PN} = "arch"
 
diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
index 9f7fad9886..42e133967e 100644
--- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
@@ -15,12 +15,12 @@ EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCU
 EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm pie \
+    fdt sdl kvm pie slirp \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
-PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie \
+PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie slirp \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 # ppc32 hosts are no longer supported in qemu
-- 
2.25.1


