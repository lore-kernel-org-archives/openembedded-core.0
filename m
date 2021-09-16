Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web09.4743.1631830808018426865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 15:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=uUZhO84U;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id s15so7033949qta.10
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 15:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0arGjVXa+1Nmsj6NqN83ztUIzVt3f1PrkMUTDM0bq+Y=;
        b=uUZhO84UvANW7VYf/BxpnUVapKb07QbV9UPbJT+mBxMTg6XJfesg7Dv2glZBEysEcG
         xBdL8lmqnwrWLGiWG2yA9DEQyL9H/Wv1duxZQ5EwciEA2pyyw7DbbMM9Hdm9568vIKJC
         jWiEPzO+wuqBGDqApsIP5feqGtMEYs7RQF4L+05BliPY1RdnLedPmf7PfFWTRh+FtKuU
         f3U32nmQYqEsLCqKPJfyHrw6vE6MMFhYyhMG1en6pbFSyVVitvdDHuawnRef9Bf8nGHA
         5MrYFOHpZ0uzVT5kDkvy8n7wvpzS0wCNfcDYihFEd/V37WSI5uN4cmk7wP6/Q44bMvzu
         0Seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0arGjVXa+1Nmsj6NqN83ztUIzVt3f1PrkMUTDM0bq+Y=;
        b=BYwoUSACTGgwkVdionagOUls0qp0iOjihDnN//U8ig9sXg6scC/i1pty39WUAJ4T3A
         jI/usr4qwfL3aUsj7094keHHMQ1TS/j66CpdujHpZxi4q+ybinFi6qBMefFP1KCsh+VZ
         eEFlwjG1lMJTbaVh3hd1uQv18gV63n/3nNRryzTUgdoqyc8SogsQ3AHeauOJ/1PJlda1
         PTVyFQDtkWXzv/VRUUduQ3PcF/+RIk6v1844vRgTGU3E66nnWBNC0ips+2jA5ZHP/sHh
         DlHcp1u5G/NTW8BsaYtitN+HVSKXiQRXeUNpj2PfsPJ/SOVnFr24LoMLT7yg65RaPLJJ
         uIGA==
X-Gm-Message-State: AOAM532OeuHl8m7f8wS6hrCVnC1QpB1lZWs7tIY1sWRUmQBOwZRKy/bS
	kBgbWkNy4sGi13XkZqQ1XQz0JB3wvogrHw==
X-Google-Smtp-Source: ABdhPJyA7mcU0BnrCSMIM15VfS0VAdRIuUiVwyVwRqKsge5ZsgrS7x5VPcWC9yNshDR7/SaHgNQFAw==
X-Received: by 2002:ac8:7f45:: with SMTP id g5mr7140001qtk.93.1631830807015;
        Thu, 16 Sep 2021 15:20:07 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a650:b700:b85d:4277:577e:3e0a])
        by smtp.gmail.com with ESMTPSA id bl36sm3114668qkb.37.2021.09.16.15.20.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 15:20:06 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] machine/qemuarm*: use virtio graphics
Date: Thu, 16 Sep 2021 18:20:06 -0400
Message-Id: <20210916222006.18189-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using virtio graphics for the Arm QEMU machines.  You will
noticed the difference in the dmesg by seeing:
[    2.693337] [drm] pci: virtio-gpu-pci detected at 0000:00:10.0

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarm.conf   | 2 +-
 meta/conf/machine/qemuarm64.conf | 2 +-
 meta/conf/machine/qemuarmv5.conf | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 93d855b6e1e2..d71a793edf05 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -20,7 +20,7 @@ QB_SMP = "-smp 4"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-QB_GRAPHICS = "-device VGA,edid=on"
+QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index ea7fae2722a0..3b08dedddc86 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -19,7 +19,7 @@ QB_CPU = "-cpu cortex-a57"
 QB_SMP = "-smp 4"
 QB_CPU_KVM = "-cpu host -machine gic-version=3"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-QB_GRAPHICS = "-device VGA,edid=on"
+QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 6c99a5296589..252d6286d8ec 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -13,7 +13,8 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
-QB_OPT_APPEND = "-usb -device usb-tablet"
+QB_GRAPHICS = "-device virtio-gpu-pci"
+QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 PREFERRED_VERSION_linux-yocto ??= "5.13%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
-- 
2.20.1

