Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AC4C433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 08:09:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.20544.1634458188947866593
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 01:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lhS0kjqd;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so7100733wmd.5
        for <Openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 01:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ujo5tNpQfZPC0a4TRR3ZeKPaJfBZC7YvVtRHr0ET+tw=;
        b=lhS0kjqdlja/399/fKHUInE0bRPoDN8rrq78Ahqkl4+i9kqxZf3qBhjrdztoGXijRw
         +KJ7KElhkO2NfyrgSwqknyKQIW9i+4bHGy5FbT4/S2sP5zU9BVIzcW2MG31mUPgih+RF
         h5lbzB0dUHE/OnYyToJokH6hmaw+dFRIox9CnfQIp/BkewTUGbzrYR63NOMISgt4jDtC
         RbM1JmVbMxHirTvf+iSBcVXmU8nDbS3IjembW8UdLa5axhIH1r/eAX0TYUPlE2fEurVT
         VXIoLMHw2NFvvDJxfy1O3BsvDewQ84t+ALSl0iJ59ynuwhsT87FJqc1cKhA7MtfCwqzt
         qj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ujo5tNpQfZPC0a4TRR3ZeKPaJfBZC7YvVtRHr0ET+tw=;
        b=viCWgJLThtxNJt5ipnTFMm8dFzDTuISkIHnL8W0Ni1ZGQJ9ZCjXyun27zt82OX6yyu
         uYBSURadGXsh6sCGzetXC7IKBOnfEzo5Mz8XKL2RR2w7OeBReyaazWsKfmBmgM08Ervy
         KFOzHsPUidUbNpMbhCgnhr/jn1z9J0/Q/YXcJ3pIyoOb6Qkx1UKd7il/79PCNXAHR7TC
         7jARPUp1jBWFGZVquWOgx5VmOti1aWgLmfcNnmBEOAXYKNCRgjmT10ZTXywBX1T4rqXw
         hbWsEz4YIoJOCXkxijrxVI+84KjDNz/mKsA7Nipvzitv+LtJ5oq8inBMpUiGf96U/WXf
         WxDg==
X-Gm-Message-State: AOAM532qGj4+W4VDu4TrnoXaoYt8jXpecoeLJIgDFhLZHJ5ALPl3Fpxp
	9QvEgtervPzMzbdP8l8IbIJFs+KxKkAaQToc
X-Google-Smtp-Source: 
 ABdhPJzromFVU0/9hw+BYL8mgDAEle5FbQCRUqiJGC+Kg5AbRYpX0TWpgshNGA2xqUrvF+zk6TpoPg==
X-Received: by 2002:a05:600c:3595:: with SMTP id
 p21mr23559354wmq.71.1634458187290;
        Sun, 17 Oct 2021 01:09:47 -0700 (PDT)
Received: from slackware.local
 (dslb-002-205-236-074.002.205.pools.vodafone-ip.de. [2.205.236.74])
        by smtp.gmail.com with ESMTPSA id
 e15sm9266657wrv.74.2021.10.17.01.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 01:09:46 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 4/5] oeqa/selftest: extend overlayfs test
Date: Sun, 17 Oct 2021 10:08:58 +0200
Message-Id: <20211017080859.96939-4-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211017080859.96939-1-uvv.mail@gmail.com>
References: <20211017080859.96939-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 08:09:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157029

Test that overlayfs.bbclass generates one systemd unit, that
applications can set dependencies on, and that this unit mounts all
required overlays

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 42 +++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index f0c9860b48..84242a1605 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -149,15 +149,54 @@ WantedBy=multi-user.target
 EOT
 }
 
+"""
+
+        overlayfs_recipe_append = """
+OVERLAYFS_WRITABLE_PATHS[mnt-overlay] += "/usr/share/another-overlay-mount"
+
+SYSTEMD_SERVICE:${PN} += " \
+    my-application.service \
+"
+
+do_install:append() {
+    install -d ${D}${systemd_system_unitdir}
+    cat <<EOT > ${D}${systemd_system_unitdir}/my-application.service
+[Unit]
+Description=Sample application start-up unit
+After=overlayfs-user-overlays.service
+Requires=overlayfs-user-overlays.service
+
+[Service]
+Type=oneshot
+ExecStart=/bin/true
+RemainAfterExit=true
+
+[Install]
+WantedBy=multi-user.target
+EOT
+}
 """
 
         self.write_config(config)
         self.add_overlay_conf_to_machine()
         self.write_recipeinc('systemd-machine-units', systemd_machine_unit_append)
+        self.write_recipeinc('overlayfs-user', overlayfs_recipe_append)
 
         bitbake('core-image-minimal')
 
         with runqemu('core-image-minimal') as qemu:
+            # Check that application service started
+            status, output = qemu.run_serial("systemctl status my-application")
+            self.assertTrue("active (exited)" in output, msg=output)
+
+            # Check that overlay mounts are dependencies of our application unit
+            status, output = qemu.run_serial("systemctl list-dependencies my-application")
+            self.assertTrue("overlayfs-user-overlays.service" in output, msg=output)
+
+            status, output = qemu.run_serial("systemctl list-dependencies overlayfs-user-overlays")
+            self.assertTrue("usr-share-another\\x2doverlay\\x2dmount.mount" in output, msg=output)
+            self.assertTrue("usr-share-my\\x2dapplication.mount" in output, msg=output)
+
             # Check that we have /mnt/overlay fs mounted as tmpfs and
             # /usr/share/my-application as an overlay (see overlayfs-user recipe)
             status, output = qemu.run_serial("/bin/mount -t tmpfs,overlay")
@@ -167,3 +206,6 @@ EOT
 
             line = self.getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/my-application")
             self.assertTrue(line and line.startswith("overlay"), msg=output)
+
+            line = self.getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/another-overlay-mount")
+            self.assertTrue(line and line.startswith("overlay"), msg=output)
-- 
2.28.0


