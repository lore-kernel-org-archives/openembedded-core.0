Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419B3CD6111
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:53:41 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.68581.1696870414757715473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PIHSCnxW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-307d20548adso4385633f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 09:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696870413; x=1697475213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfUzhguaFEWwhdAHXxtCdvyViAWObBB4Q9aXe7bEzW4=;
        b=PIHSCnxWa41FSnk70hiVaasd2XcchOU03+43nUH/jeEJkYCwU/rA1HVi0iOyrMHRx2
         bUE9JGzaQRzbnsyHpKnOfmTqoQOJsZ8IzVPw6fuQnR01M+Olx7wvkOP+OJGGHQEznrAB
         mN/2Nm0Lpwu2zujaKZs7UXar8nnA6YjG68Ojo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696870413; x=1697475213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfUzhguaFEWwhdAHXxtCdvyViAWObBB4Q9aXe7bEzW4=;
        b=LCxyzjcn4jkqO+yP4ARazGIY9mwKUGRJH9fspCJqkJ6Bjw4WjiT9pS3fUWOgREaSwH
         U6nc7AxU0PpDrwAHtlV2+Xc4ntXKd5ufUYwREwp6oys9hZvJbbOfJNigasQ5e/Uin213
         mL0VB5kr69c+ZGklSvLq1wvjIg7wMwd5zyjJuu+hc2pmhO1t0Xiw0xPOGBA0WZ+AVsip
         YlYeQY9382RjQzSXVqto4bdOanH7nfqK+cgqN84NhV5jdCk0s3qpP4cGceTCzV8cbXiQ
         gMU+bYH3RN6RHGgSuSzBGk/RxZ90JUKnkfyzdZIwp5SxPjl0A2udHyHmdDzXsGVV3CnU
         pM2Q==
X-Gm-Message-State: AOJu0YxnrKhQEtC/sM5vLPStAlHKreZO/N6tTyfl40e5pX3nQ3QhiJ/l
	7MZi5ihkGvdHRX4lvCZ81l7d/d9iLPlPpv7xGRs=
X-Google-Smtp-Source: AGHT+IGr7DCXRrXqXg7HmAWeUqaCzvFN0smdQSP03bvb8uyCqGJmVoJe/4sXrrAOIaX+ncrxJylKiQ==
X-Received: by 2002:adf:e886:0:b0:31f:f9e5:ef05 with SMTP id d6-20020adfe886000000b0031ff9e5ef05mr13903309wrm.1.1696870412904;
        Mon, 09 Oct 2023 09:53:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8318:8840:ca53:f6f2])
        by smtp.gmail.com with ESMTPSA id l1-20020a5d4bc1000000b00323287186b2sm10133974wrt.29.2023.10.09.09.53.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:53:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] runqemu/qemurunner: Use nodelay with tcp serial connections
Date: Mon,  9 Oct 2023 17:53:30 +0100
Message-Id: <20231009165330.3580227-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009165330.3580227-1-richard.purdie@linuxfoundation.org>
References: <20231009165330.3580227-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188855

This disables Nagle's algorithm for our tcp serial connections which may
be causing data transfer issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/loongarch/qemuloongarch.inc | 2 +-
 meta/conf/machine/include/riscv/qemuriscv.inc         | 2 +-
 meta/conf/machine/qemuarm.conf                        | 2 +-
 meta/conf/machine/qemuarm64.conf                      | 2 +-
 meta/lib/oeqa/utils/qemurunner.py                     | 1 +
 scripts/runqemu                                       | 4 ++--
 6 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/loongarch/qemuloongarch.inc b/meta/conf/machine/include/loongarch/qemuloongarch.inc
index 30f560532e4..e1bcfabc430 100644
--- a/meta/conf/machine/include/loongarch/qemuloongarch.inc
+++ b/meta/conf/machine/include/loongarch/qemuloongarch.inc
@@ -30,6 +30,6 @@ QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
 QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
-QB_TCPSERIAL_OPT = " -device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = " -device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = " -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-device,rng=rng0"
diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 325e7c514f8..46ae66b9e50 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -33,6 +33,6 @@ QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
-QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
 QB_GRAPHICS = "-device bochs-display"
 QB_OPT_APPEND = "-device virtio-tablet-pci -device virtio-keyboard-pci"
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 881733eb2da..943ce7c16a2 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -26,6 +26,6 @@ QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
 # Virtio serial console
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
-QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
 
 KMACHINE:qemuarm = "qemuarma15"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 226b86fa18a..a096d964db5 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -27,4 +27,4 @@ QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-pci,drive=disk0"
 # Virtio serial console
 QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
-QB_TCPSERIAL_OPT = "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 6c91570d1b5..bcc267c9820 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -97,6 +97,7 @@ class QemuRunner:
         try:
             sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
             sock.setblocking(0)
+            sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
             sock.bind(("127.0.0.1",0))
             sock.listen(2)
             port = sock.getsockname()[1]
diff --git a/scripts/runqemu b/scripts/runqemu
index 0668e12e616..6fca7439a1d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -842,11 +842,11 @@ to your build configuration.
             if self.get('QB_TCPSERIAL_OPT'):
                 self.qemu_opt_script += ' ' + self.get('QB_TCPSERIAL_OPT').replace('@PORT@', port)
             else:
-                self.qemu_opt_script += ' -serial tcp:127.0.0.1:%s' % port
+                self.qemu_opt_script += ' -serial tcp:127.0.0.1:%s,nodelay=on' % port
 
             if len(ports) > 1:
                 for port in ports[1:]:
-                    self.qemu_opt_script += ' -serial tcp:127.0.0.1:%s' % port
+                    self.qemu_opt_script += ' -serial tcp:127.0.0.1:%s,nodelay=on' % port
 
     def check_and_set(self):
         """Check configs sanity and set when needed"""
-- 
2.39.2


