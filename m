Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01474C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 10:52:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.20703.1657709562685264728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 03:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a0T3GC71;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id a5so14924255wrx.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 03:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1jMPZGcBBYYgFbJJUF9OObXjrlBoT/TLulGDnaSQD6c=;
        b=a0T3GC71LUWQA1TLoxYw0mOQGTs7zaTcq5h/9E1K9mbMD7lblLO5El6jCyO/Dw00El
         B90lJgXWbpCxvStdX/cL2sOteJ8WVzDcNze5cLNTTmmbsaP4H7ouSyYN5PFLl0gzWqzj
         C1daz0NuT+SQXi7erP+XFR/kcNE9CUaxHyryg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1jMPZGcBBYYgFbJJUF9OObXjrlBoT/TLulGDnaSQD6c=;
        b=4SbxDxMUQCJGr28yM04Cd/ari/CPIlDBtVtHtYgeMw4rdDEVmuf1m632r96LQzPbAt
         U/PTyFbOnw9lAyi5AKeA7TeLhEZdtYQ6krzcySRCxxy9ZDClQNpj8e9Bk+vAOHD9OsPA
         x4G1tKiZGrLI7uWO4X8UruqoeQjgkD3XYvMhgR5B7qHKshOcY3N2HJS4+UWrOThKJQ+A
         HCPZyaj8yLEpHAC+Kr3u6CBrW41HVlxt2G8HQkHTtK/Cb9aldkDj+xJgp2oqWPdw3dib
         KN88tLgdQBOw+MV2DiPQGqPKTWNUmyr1m0OC2Eq32j0CLvnvXwxxHcc1eV+q0YKxb/hI
         bu6A==
X-Gm-Message-State: AJIora8AlWeIOxUDEbrjZ/lq79ChMW/Q4rrcgU4ulCIXSGDRJBjWNkZv
	rlk1ubCefNWvl7bc2JGAR0fQPkCiBnQf7Q==
X-Google-Smtp-Source: 
 AGRyM1uRiu5up5JMmeqDBi/2sUX2CtyECPPuhZICHF9JiwzYdUk02swkmebhqy6xOI3Z0C1y65eyBw==
X-Received: by 2002:a05:6000:100f:b0:21d:779f:fa87 with SMTP id
 a15-20020a056000100f00b0021d779ffa87mr2815070wrx.291.1657709560687;
        Wed, 13 Jul 2022 03:52:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5d1c:2bb3:e975:b527])
        by smtp.gmail.com with ESMTPSA id
 l16-20020a1ced10000000b003a0375c4f73sm1668977wmh.44.2022.07.13.03.52.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 03:52:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu: Fix slirp determinism issue
Date: Wed, 13 Jul 2022 11:52:37 +0100
Message-Id: <20220713105237.307377-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713105237.307377-1-richard.purdie@linuxfoundation.org>
References: <20220713105237.307377-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 10:52:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167955

Add a PACKAGECONFIG option for slirp, defaulting to internal. This avoids
the presence of libslirp on the host causing qemu to link against that
instead breaking reproducibility and usability of the binary on hosts
where the library isn't present.

We need to add it to PACKAGECONFIG by default since users do expect slirp
to be enabled in the wider community.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu-system-native_7.0.0.bb | 2 +-
 meta/recipes-devtools/qemu/qemu.inc                    | 1 +
 meta/recipes-devtools/qemu/qemu_7.0.0.bb               | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_7.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_7.0.0.bb
index bc5384d472e..5ccede5095c 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_7.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_7.0.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native me
 
 EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm pie \
+PACKAGECONFIG ??= "fdt alsa kvm pie slirp \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 16674eb5adb..c412d416d5a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -188,6 +188,7 @@ PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
 PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
 PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
+PACKAGECONFIG[slirp] = "--enable-slirp=internal,--disable-slirp"
 
 INSANE_SKIP:${PN} = "arch"
 
diff --git a/meta/recipes-devtools/qemu/qemu_7.0.0.bb b/meta/recipes-devtools/qemu/qemu_7.0.0.bb
index 9f7fad9886e..42e133967e1 100644
--- a/meta/recipes-devtools/qemu/qemu_7.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_7.0.0.bb
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
2.34.1


