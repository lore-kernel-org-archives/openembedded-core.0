Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2BDC54F4D
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43817.1785193004407629708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=i3MyJq9F;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493f75f7172so27171385e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785193003; x=1785797803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u1afVMIvEaNVALGHOcx4gFGRscQ2BEVVE06ihxp+vqk=;
        b=i3MyJq9F0RldqCfrCHhXKV8NCPlK4pxGDQyZqaArRS4qQjxZD/i/s09nIhgfWbYJLQ
         mtnQGrW+VjsZyy3wmd3nnn9ReM6Qnm1Tzj2lBftsbnGiXmtcFnb9RInpt3YHr1ar/TKi
         5ZeMieKSg9E8fHeGCy8ShhE4b40I6tO4VJreo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193003; x=1785797803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u1afVMIvEaNVALGHOcx4gFGRscQ2BEVVE06ihxp+vqk=;
        b=jAMtwg3gDDJyRzmGiTflOhXOySYKUFYHnRtGMlLQYztf1BJ186bupELnY8MuKgvksi
         7NF/4OGidzvhJl68qtLVgRsOU/m5MGOWzQkKd3wM0m3Sf0pPUHc0LuQi4lbPPJG0BY7A
         KCR7H1komaXC5x08Zb59d0RTPYjZ9N+UCL3CwWJuGZ05/WQOyRDk9rfeU4g9v5fJEaTz
         6+kq9P2Y8XYbXM3brQ8X/OmUHAkNZk/uUGfqDcur/l8qxawQm3LyBVtAUTxJTULfGhtz
         L77YG79X31w8C6HbpiWNmLaBaa04Pacmn+Eq8HM5iVXLfVlU7jsHoyqC2Vh3KluOG+3+
         4Tkw==
X-Gm-Message-State: AOJu0Yypun7R5w/+X28A59ltO7m5VEN3vPv2yzjptZLz/7LrSFXEMqU/
	O4N0Ubc73qIqWTO/7oX+BT0urPbbdlwZQ8yf1nS/W6dOiO9Hzd4c/j9UNNj+eXXXkO74kzyRmr1
	+1J1ft3k=
X-Gm-Gg: AR+sD12WX4QMbofakqJ/YyLv+SrXM+hYrHUr2IH2PHP19gFYVdcZHbagMAY8DZFnZaE
	VtNuDk6dE5Mo+uqi21V7sp586dc/9YyARDCYdvhoRGwHG3uBN1OwgA1XbeYOrDz3vZI4RK+PVlT
	NBesIl3kog797+H+Y3zKXwJpdbfgDCYzXjOGcg5bOvq5tVzd8BIZOV16GlEmBWSVaxbAsI17NQJ
	1fzBzjWUSy09j1xMxnj4OKKdcrZMWUZL2GjfbCKZI5unVZse1rqfsKhsQEzD5+dNoXxGd1LY8PK
	9oMmLa6aLuFr/c8NBBgL+EorvzhXNVDOgP2PvzCHlvkBI+4U4KwqZcmZyDUHcvD1KwKlAlqYA57
	mmOPl01r3eHiE1QRhrxG1XIh01q8R/bl8GY7TezztjJfrOq/kGllSQyc02QY2yX2ER0W0LbWTNt
	1k5JhCwBIGFjsPsavGzaLVlIAi5x1APp4CPFRt9DQxyqRLZoTzEsA9Ut7tx1MTJeI/DAT8JnBdp
	Tl7bQ==
X-Received: by 2002:a05:600c:4595:b0:495:3a21:4e5d with SMTP id 5b1f17b1804b1-496b56f461dmr126968375e9.0.1785193002580;
        Mon, 27 Jul 2026 15:56:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 29/36] linux-yocto/6.18: drm/virtio: fix deadlock in display_info_cb by removing hotplug from dequeue worker
Date: Tue, 28 Jul 2026 00:55:43 +0200
Message-ID: <ca1e1cfe697c211cf3bc356d284b103fde8f9982.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242146

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To partially (or fully) address: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16217

Integrating the following commit(s) to linux-yocto/6.18:

1/1 [
    Author: Ryosuke Yasuoka
    Email: ryasuoka@redhat.com
    Subject: drm/virtio: fix deadlock in display_info_cb by removing hotplug from dequeue worker
    Date: Mon, 13 Jul 2026 22:01:00 +0900

    A probe-time deadlock can occur between the dequeue worker and
    drm_client_register(). During probe, drm_client_register() holds
    clientlist_mutex and calls the fbdev hotplug callback, which triggers an
    atomic commit that ends up sleeping in virtio_gpu_queue_ctrl_sgs()
    waiting for virtqueue space. The dequeue worker that would free that
    space calls virtio_gpu_cmd_get_display_info_cb(), which invokes
    drm_kms_helper_hotplug_event() -> drm_client_dev_hotplug(), attempting
    to acquire the same clientlist_mutex. Since wake_up() is only called
    after the resp_cb loop, the probe thread is never woken and both threads
    deadlock.

    Fix this by removing the hotplug notification from
    virtio_gpu_cmd_get_display_info_cb(). The display data (outputs[i].info)
    is still updated synchronously in the callback.

    For the init path, drm_client_register() already fires an initial
    hotplug when the client is registered, which picks up the connector
    state updated by display_info_cb.

    For the runtime config_changed path, add a wait_event_timeout() in
    config_changed_work_func() so that display_info_cb updates the connector
    data before the hotplug notification is sent. Also replace
    drm_helper_hpd_irq_event() with drm_kms_helper_hotplug_event() since
    virtio-gpu never calls drm_kms_helper_poll_init() and thus
    drm_helper_hpd_irq_event() always returns false without doing anything.

    Fixes: 27655b9bb9f0 ("drm/client: Send hotplug event after registering a client")
    Closes: https://syzkaller.appspot.com/bug?id=d6dd6f86d3aaf7eebe7406e45c1c6e549453f224
    Closes: https://syzkaller.appspot.com/bug?id=908bd910da5dd79b88de4cf7baf376cc873a922e
    Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
    Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
    Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
    Link: https://patch.msgid.link/20260713-virtiogpu_syzbot-v2-1-2958fa37d46d@redhat.com
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 496ab6151ead169d9f4873d1e2a3f5e646c73b07)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.18.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb  | 18 +++++++++---------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 6d287cdc7d5..9d44c803eb9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,7 +15,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0156acd2db993abc3baa366fee892d503aab1ccc"
+SRCREV_machine ?= "56572c42354027a50e261f16fe13b057604873e7"
 SRCREV_meta ?= "2f71b0a288c307062fc60948ac793d8d51c685e2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 8b9201a73e3..7ff47505aa0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -18,7 +18,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
+SRCREV_machine ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
 SRCREV_meta ?= "2f71b0a288c307062fc60948ac793d8d51c685e2"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 8528869a5ed..6111ae89daa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,17 +17,17 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "162946cfb65f28f0a5f60e927bdae5615e6356a8"
-SRCREV_machine:qemuarm64 ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
-SRCREV_machine:qemuloongarch64 ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
+SRCREV_machine:qemuarm ?= "78e0248ce3cecd33f63926cd1d54c64e163d076c"
+SRCREV_machine:qemuarm64 ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
+SRCREV_machine:qemuloongarch64 ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
-SRCREV_machine:qemuriscv64 ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
-SRCREV_machine:qemuriscv32 ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
-SRCREV_machine:qemux86 ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
-SRCREV_machine:qemux86-64 ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
+SRCREV_machine:qemuppc ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
+SRCREV_machine:qemuriscv64 ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
+SRCREV_machine:qemuriscv32 ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
+SRCREV_machine:qemux86 ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
+SRCREV_machine:qemux86-64 ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
+SRCREV_machine ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
 SRCREV_meta ?= "2f71b0a288c307062fc60948ac793d8d51c685e2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll

