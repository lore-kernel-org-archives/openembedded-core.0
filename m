Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6982C982D1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 05:13:57 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32802.1789622030335191975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 22:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CqHH3LQS;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb7692a57so3609901cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 22:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789622029; x=1790226829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bomJNaLxu08+cjP92rVBgsVguQIwsAoUC05KKrX7MI=;
        b=CqHH3LQSY+qaHtSz4shPaM63Yqyc6lwxMBIR9mhO2/995fvwaSJ4j5QyNEdBshEB7s
         lkySUvjuU3ZnX8ry4d2qpv5XDuYKSGA5TuPdPSsJnfFdXFuwt50FFrxEp7LWLlPpGFZj
         0DUsK2QdYKcjejQFRjQwU2xVdO4jK+few8tYtYc2m2yhUfRFPtMuQC2yfGwphZn1uAnm
         nMG8FzHQ2GmFNf/2524i5j4fIeJbnpyDrGnwwXoHVT8LVFnp4RP/rdgO8TxpFTgF3aLm
         clcEOZMkCnzgHlMB2UHDd5JWESphpTBjTS4kBs6z0uCkyHb9Ra0MgVqQHMaFDQ6VK6N6
         fiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789622029; x=1790226829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bomJNaLxu08+cjP92rVBgsVguQIwsAoUC05KKrX7MI=;
        b=y0F2QzYiHJAAeHczF7vc8Bp0FCYJDs0Fdw6GcFkkmAaHNSG4jzrV2svruKWvbbmjRH
         BgAQOlxJBT1l684icxpHmaeLo9clQtc03lJUThkSAEhwAAVq9AH22RWu0KzvPylsZRYy
         ocXzXMAsmb/x7RkMQNR04AGmdVn/aDKj5bEDQEGlXMBDSbeEruf1/9mmwSyXOJimY7G5
         6h6tk9fGUkbPiqBo5KbHFt9rIMFnGwI9AlQIevdiGiWv8RUOofreUGV2DchANelB7zbO
         GDpZRlDD4JypSQsDtTgJYk6b31qeYhEjuSODnIhwjP9wi7ymG3tmwGWXCryAAsk3Xjl2
         IX4g==
X-Gm-Message-State: AFuF++llJuiJ6HfG2UcxlZCVCamKuRyri8T/xXV7mhJOUgRtcCCeYx8l
	UftxKMcPb+0vimZe+gnSzqOi3CdSDoIz+fLRaCKUS9A/1we0Y1eTRLgIpZtu1Rxt
X-Gm-Gg: AYBFou3J9cgtVWUqOxm5FeLCUf6pz7cnrc9AcQQkuJs0R9uajxL/lMgMI+UbcUzBl9o
	31jWWTdH9/AuS8boHyHUrdkpeOruPkBaTzePtGO1g3EiWhrjwlmZFdS2Y7FgCoCBNvRiQU9h8Fn
	j2++xXMgWWdHeBNUTaBqE8nfH/QMZoBnrPBek/SvZR7AuFHfLYiDDBknlinJwMGXPNDAZfLY5HA
	M/QXNJRwUUbYpc5bu9k6c5cYLGNYk5GT+IRYDQdw3ULrRrrTql4tyyqisz2t+uDpLR2mZeegYoj
	MdK1Bh5bQ2eRV7dcv6CR0SxJHr9BR1iVsvhQeyHtTJW+0XBx8OpbTl5+uHfj2P4F+TfVBBFCL34
	RT5i0kwCNDWQAWAeV9AlX/zJewXHjIJPlWKjEWqOu9MuV1kg+dBSKkbx85pSe8zHHAUuzpMVYNQ
	j5yksvw8PNGAODQ1/GDwJC6JR64a/yBn1CSUM2nD/+ulFJsynFhiy4fIynUFqQ2h159Njenrx0+
	KgN7h8UA92zgavVfyV+zdvJbCeaPxUuyQ/w2iWx2fG6RmzW1mUCcDGLEswEGS7jq3kBCb4CkN25
	yxFse/PLwZpgBerio9ahM789NsfxUUx1rIE6BnzY+UIPrBxVhsNfhpHiMAykjMOzcoOMgzCS3O7
	WZD4/uFibs31JG6bYDgtXKuKDFg==
X-Received: by 2002:a05:622a:148f:b0:530:9bb:54ae with SMTP id d75a77b69052e-5327ee59ad4mr91236781cf.15.1789622029155;
        Wed, 16 Sep 2026 22:13:49 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53261fd4cc4sm39481161cf.6.2026.09.16.22.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:13:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 04/06] linux-yocto/7.2: drm/client: avoid spurious vblank-timeout warning
Date: Thu, 17 Sep 2026 01:13:37 -0400
Message-ID: <20260917051340.1472139-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917051340.1472139-1-bruce.ashfield@gmail.com>
References: <20260917051340.1472139-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 05:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246013

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/7.2:

1/1 [
    Author: Krystian Kaniewski
    Email: krystianmkaniewski@gmail.com
    Subject: drm/client: Avoid warning on vblank timeout during modeset client waits
    Date: Wed, 12 Aug 2026 10:05:19 +0000

    [ Backport of a fix posted on LKML; not yet merged upstream. ]

    Commit d8c4bddcd8bc ("drm/fb-helper: Synchronize dirty worker with
    vblank") added a vblank wait to the fb-helper damage worker via
    drm_client_modeset_wait_for_vblank(). On virtualized/emulated displays
    (the Yocto QEMU autobuilder) and on PREEMPT_RT, the vblank can fail to
    arrive within the 1s timeout even though this is harmless optional
    throttling, producing a spurious warning:

      WARNING: drivers/gpu/drm/drm_vblank.c:1329 drm_crtc_wait_one_vblank
      vblank wait timed out on crtc 0
       drm_crtc_wait_one_vblank
       drm_client_modeset_wait_for_vblank
       drm_fb_helper_damage_work

    The traceback is picked up by Yocto's parselogs and fails runtime tests.

    Add a non-warning drm_crtc_wait_one_vblank_internal() and use it from the
    client modeset wait path, where a timeout is expected and does not
    indicate a kernel bug. The warning is preserved for all other callers of
    drm_crtc_wait_one_vblank(), whose external behaviour is unchanged.

    Link: https://lore.kernel.org/all/ad8b0286-7779-4682-9516-da4280f1d846@mail.kernel.org
    Fixes: d8c4bddcd8bc ("drm/fb-helper: Synchronize dirty worker with vblank")
    Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_7.2.bb |  2 +-
 .../linux/linux-yocto-tiny_7.2.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto_7.2.bb   | 18 +++++++++---------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index da34435770..438c896749 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -15,7 +15,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5391c0d4e57d3cacdd66e7d5a016dba8c6f5956e"
+SRCREV_machine ?= "c2f967f4c1065d41084f300d3eca7cd413635dc3"
 SRCREV_meta ?= "b5d69636e3e56aa6a5b8f987b4587e7a56c4782a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index 3a8f086d5c..0a9595a749 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -18,7 +18,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
+SRCREV_machine ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
 SRCREV_meta ?= "b5d69636e3e56aa6a5b8f987b4587e7a56c4782a"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index 550ba49ebc..f1c2d475c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -17,17 +17,17 @@ KBRANCH:qemux86-64 ?= "v7.2/standard/base"
 KBRANCH:qemuloongarch64  ?= "v7.2/standard/base"
 KBRANCH:qemumips64 ?= "v7.2/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "0e60d19f0d15f5fbef845da9454998c76b37bd97"
-SRCREV_machine:qemuarm64 ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
-SRCREV_machine:qemuloongarch64 ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
+SRCREV_machine:qemuarm ?= "56c7106647e505ca1fb15fd433b0bc991024764c"
+SRCREV_machine:qemuarm64 ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
+SRCREV_machine:qemuloongarch64 ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
 SRCREV_machine:qemumips ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine:qemuppc ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
-SRCREV_machine:qemuriscv64 ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
-SRCREV_machine:qemuriscv32 ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
-SRCREV_machine:qemux86 ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
-SRCREV_machine:qemux86-64 ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
+SRCREV_machine:qemuppc ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
+SRCREV_machine:qemuriscv64 ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
+SRCREV_machine:qemuriscv32 ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
+SRCREV_machine:qemux86 ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
+SRCREV_machine:qemux86-64 ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
+SRCREV_machine ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
 SRCREV_meta ?= "b5d69636e3e56aa6a5b8f987b4587e7a56c4782a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.43.0


