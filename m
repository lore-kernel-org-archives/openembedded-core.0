Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2097C44532
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 16:54:19 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4762.1784739250663065463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 09:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nLspW9bK;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e5b048375so944767285a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 09:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784739250; x=1785344050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gB1x1Yd1JwGsEmQpwE8/Sa/b47RYBcchP56IiAXgg30=;
        b=nLspW9bKSyNR3vunTYsdP3Jln4lopfVmw41bSwtOOg7+MCXRIIgt3H91buPsEV3xx+
         cC7vxVh3ibGsfGeL5D+rRcILPJMfO5qDL8UMLk2Agyc49ex6Ub46o+Qi9OMyicI/W6z4
         EAtwZCnmXp0XiXHOdzuzlXAu7jqLtddfN00QzXwGRQi5QyhPfd/iRZsnsPN9Et1ndF1z
         Cqo2t5zlCBMYB48ANDtQAZolhP30LhjzRXgghOLGNclRFC5SRAtz67nXF9uz1oeOBoMk
         ttoT7TJ3f45VdRA3NJf8PHrVIHZEnivNzBm09qRkjHQTtAnw8uAcNOkRXlahlaS2C08K
         TJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784739250; x=1785344050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gB1x1Yd1JwGsEmQpwE8/Sa/b47RYBcchP56IiAXgg30=;
        b=lBcbJ7s471IyjcdO9fV2w0078DXDtNRvaBm1Ny324PDFIXLTjMVA/opKRPWhd5b5Ve
         0QuORKUxA2mSWmDAjt1iTw3nBaVmUVL7dzrc5lgVmU2IdOc0khRODmq00cOcKFAxLaP4
         DO2GogoZqK6NEISILROgQgGJMGYf5Gc4ics0nQeUUwHJptdHdsV9oZEE3mQq74tPTMJN
         58yYnlSmMwEoQ/n6l1lXuMSooSuPntcVR1txL7rJlpx0ttfon1o657JlVOPdXJAuxxoX
         OW+CU+g0NbYb4ptHyO+fSzucHXiSh/RhFl2SxZoj3emsjthrWt/1a5BkOmDjrj/7Ah+b
         5vCg==
X-Gm-Message-State: AOJu0YxYq+FGsNrmIrl01bZEOQ7XIW7AarBqVNXR7vV9KNl7+Kt/CGz9
	tYus2FlRdblo5e66modxuKUiZHuN9JqWKCSe9B88J2M9b/QZ0hVekaB8Q5hzYFcj
X-Gm-Gg: AR+sD13/n4p1/XG81IZDaN5JJdgUNlP9JakkW3ibsX59uGVa2xirxl4bS4ZQXyM7s4G
	7G6037z3TWGCvg6GVJ5s0YSisOkVutqWTLbRwULxtF9WHZjD8ymerNbDjdsFYEuJox0uT730wE2
	TKY8gz8aa9tH5vHhdzrOmyL7JejOmoaYL7N6TvfAtdLJWM3xJwcWXRB6f1wuoEN0J9KQ71HQecx
	kTcYuDvEyaC6FIbqljZgv+p/HNS3Ky2FfVIP06IzZGACKImGIGI0vH0qJIx47cBt/T1+jSux3dG
	fv5YnnEo2k+bC57y46bxix1Ao9ArtXnfU1QnqF9PfMDhb9Dd76jJquLDGlGtodOhpy16k5W5gRF
	/cQHe5V9VWqWnkfCyg1RUrrJtvDDzu5nIelei3wMUOfKx3IMw28tJCwHG4UXJ6V0Ft+zCxbYnH+
	OjzCFVL4HYWannhTCEr7PLjmXUE5Ll+cadu+UZEjyi4H5UbiEKOoNMZ1cGm+WmjIgjXq5fjTmVT
	pJa2wiikOqBJBfOVBD4xEE6WQKJ3axlApdVIQKYCQfKsyQhcyPQCSvbfDr7aHiqXNiCdhMg1FGg
	jT6miYPg+AR+8h3FIsC+cr0=
X-Received: by 2002:a05:620a:440b:b0:92e:a48d:251e with SMTP id af79cd13be357-930b3ea8f8emr2441678085a.24.1784739249421;
        Wed, 22 Jul 2026 09:54:09 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a6a157sm201963685a.37.2026.07.22.09.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:54:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.18: drm/virtio: fix deadlock in display_info_cb by removing hotplug from dequeue worker
Date: Wed, 22 Jul 2026 12:54:07 -0400
Message-ID: <20260722165407.1415244-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 16:54:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241707

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
---
 .../linux/linux-yocto-rt_6.18.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.18.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb  | 18 +++++++++---------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 6d287cdc7d..9d44c803eb 100644
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
index 8b9201a73e..7ff47505aa 100644
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
index 8528869a5e..6111ae89da 100644
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
-- 
2.43.0


