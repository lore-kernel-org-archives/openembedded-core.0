Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58A2C43219
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 21:53:26 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.14175.1644184406049643446
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WPX432p7;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id s13so36499260ejy.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X6yU64S3Mg5sCFr1Nz74j46JcmCdewtGEzlfCSHCN74=;
        b=WPX432p7L8X7vUwaBTiHu0t/UkUqVkbyBInhkiwSljt72l2ZAu1vffcfgjKwo7WN51
         kywk0mIUu6wnrgtCvKTRbcRbj9jCrpkfPpjZIX3j8AGDjXnL0/EDJJdmGm4PiYAz+jmi
         QBhO8GOTWtuivT9SGaqjmkdTqGX4JeJEvQjq6vwLjtuLbGs6jMQIpE3gYTAinH2di8e+
         tlTl4muBd1s8gbTrukNbEmpSQxi1gsdYtFNrMqlxE7WE5Yvf9p7G8/wOfelYYfKfeuFi
         w7zvUiwZ8s4DXbJq4NoZSTTEw9qlTBfkAjEIn2mxC3dBcqhvLa756EOFev058+YkNWG6
         EIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X6yU64S3Mg5sCFr1Nz74j46JcmCdewtGEzlfCSHCN74=;
        b=TKWuIGP8dt2ctb1/LbLZQewszGYMR9Rok60Cj133MGC2yS1oYzaOJ6BgNG8grfpwE9
         jgQbzRrPVPZ2g82fDNeax1gJhIgIRlZ8KKoLYPF3FYyeeU1pqm5CqUOyAoL/GLaQ62Y0
         2dZu0K6Qzv4L2F1notvQ75/fmwtwyZMcdKHx11JLf2yd2eOXqdKOgg6qJLNdVz3Eiwhk
         nFR/gLRjSgTi9s7YCB9H0+MOVucvKEmwTul6AVdVx+JyQYeCd5JATFSJ5npZ7Rprrco/
         Nohl7WCPUjVM6/x9chAizecr+yjHckWLf0zKrdiNmhe/Lc55aChXf5+i2irjw0p/WaYH
         tfLQ==
X-Gm-Message-State: AOAM533Sk9Odz0MgE8hyVpcmdL53SmjFfrH8DwUSpBSxZMH9r5Qabm6/
	ru0mZy8MZa2hmyczb3U2G0h504tZJV8=
X-Google-Smtp-Source: 
 ABdhPJxJBAVsuHh6vPqCzJiWJPO4v3gAbmYSyocN/OhoIAzAdb5r9n93PHDcaFjsuhpr/qkmCAfLeQ==
X-Received: by 2002:a17:907:f9c:: with SMTP id
 kb28mr684593ejc.213.1644184404644;
        Sun, 06 Feb 2022 13:53:24 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j11sm1191927ejb.110.2022.02.06.13.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 13:53:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/8] qemu: replace a gtk wrapper with directly setting
 environment from runqemu
Date: Sun,  6 Feb 2022 22:53:15 +0100
Message-Id: <20220206215316.367469-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220206215316.367469-1-alex@linutronix.de>
References: <20220206215316.367469-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 21:53:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161419

The wrapper is executed by host bash, and host bash refuses to run
when pseudo libc is preloaded via LD_PRELOAD (which is the case
when gl is enabled).

Only the fontconfig setting is carried over as local testing showed that
only that is necessary for the gui to look ok nowadays; adjust further
if necessary.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/qemu/qemu-native.inc |  4 ----
 meta/recipes-devtools/qemu/qemu.inc        | 11 -----------
 meta/recipes-devtools/qemu/qemu_6.2.0.bb   |  4 ----
 scripts/runqemu                            |  1 +
 4 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-native.inc b/meta/recipes-devtools/qemu/qemu-native.inc
index 5d3ba3486c..d9acc613f9 100644
--- a/meta/recipes-devtools/qemu/qemu-native.inc
+++ b/meta/recipes-devtools/qemu/qemu-native.inc
@@ -5,7 +5,3 @@ inherit native
 EXTRA_OEMAKE:append = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
 
 LDFLAGS:append = " -fuse-ld=bfd"
-
-do_install:append() {
-     ${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'make_qemu_wrapper', '', d)}
-}
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 843de3337a..325118cfb3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -138,17 +138,6 @@ do_install:append() {
 }
 # END of qemu-mips workaround
 
-make_qemu_wrapper() {
-        gdk_pixbuf_module_file=`pkg-config --variable=gdk_pixbuf_cache_file gdk-pixbuf-2.0`
-
-        for tool in `ls ${D}${bindir}/qemu-system-*`; do
-                create_wrapper $tool \
-                        GDK_PIXBUF_MODULE_FILE=$gdk_pixbuf_module_file \
-                        FONTCONFIG_PATH=/etc/fonts \
-                        GTK_THEME=Adwaita
-        done
-}
-
 # Disable kvm/virgl/mesa on targets that do not support it
 PACKAGECONFIG:remove:darwin = "kvm virglrenderer glx gtk+"
 PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer glx gtk+"
diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
index c9a53e3b05..062ed32b01 100644
--- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
@@ -12,10 +12,6 @@ EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
 EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
 EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
 
-do_install:append:class-nativesdk() {
-     ${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'make_qemu_wrapper', '', d)}
-}
-
 PACKAGECONFIG ??= " \
     fdt sdl kvm pie \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
diff --git a/scripts/runqemu b/scripts/runqemu
index d60cb2e152..5c108ec23a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1377,6 +1377,7 @@ class BaseConfig(object):
                 if self.sdl == True:
                     self.qemu_opt += 'sdl,'
                 elif self.gtk == True:
+                    os.environ['FONTCONFIG_PATH'] = '/etc/fonts'
                     self.qemu_opt += 'gtk,'
 
                 if self.gl == True:
-- 
2.20.1


