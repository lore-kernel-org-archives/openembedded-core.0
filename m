Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB9CE6FE34
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 17:43:06 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.4937.1725644584383077320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 10:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=CxamNR0T;
 spf=pass (domain: snapchat.com, ip: 209.85.221.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so1948473f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1725644582; x=1726249382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZbpEDovHySb6PKxP3qB/PIp7RtTCGzaA3rx7yB0JUQ=;
        b=CxamNR0T7sjPFvUZgnXOcJhuONLoR3MEIEPGEwKdPUrcY1ixDJK5ppGqveIC7fqRTX
         vBanNNUBpJod6NYV7Vw7vUyZzxJ+E7UW6Gt32qLC1Y9NvXOPNIClc0fwniZoQ8cEoVhY
         6iMpSJLjnmody/Zjyg7POJrabpUM3CW8VTuDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725644582; x=1726249382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZbpEDovHySb6PKxP3qB/PIp7RtTCGzaA3rx7yB0JUQ=;
        b=uVOQbwOuVMbXwgv3UxVd75UeY/nk24a1TdOWNyZybvPZ70IRr76Slj80DKboEISzjQ
         2W+MjfozHIKrzq/M8xZSWHLLQ6ig+voWzy1CWchV8g+8kkj+/z4zxvuW3AeaknTPIFvV
         CyIGPnvljuEyJpenqUQj6jFKF+6xTkaWMB60NRYN1Kb8U3Y9q867MjYhNEk6lV8tIU0F
         /Ah/Fd1wmgiBrCz/Dm94Qj5ivNDkEBsVAeEeB8Sw2WBcSIg8B9pwjrRUh3UNdHWcHzTp
         yBoV76C4AyauCXnDw1Gv3/Jo8euFmAmLNPnNtKN/TOjgdZSjVzsDPRBHcSrksAMNC7V0
         6Cgw==
X-Gm-Message-State: AOJu0Yxz08LTnnW/JqcF+k6MdOpjMJrLrPmzSX3Ob/U2VdnbkvNsJSCs
	4HAmai27LF2LjKZGdzwctNcXmvD2IuJ5k2Q7WAliUZ9gVJCghXrCOYBAXrMDg9NXtIizqBpfJba
	TM6A=
X-Google-Smtp-Source: AGHT+IHjTnYfV9E8ClyOw75mzIN446dDOCdDj9t2Tzir25LNu13sGkLCERwdldmw51cjCDUESqeTrg==
X-Received: by 2002:a05:6000:d0:b0:378:8f2f:905f with SMTP id ffacd0b85a97d-3789229b892mr39415f8f.11.1725644582202;
        Fri, 06 Sep 2024 10:43:02 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789160d29asm424577f8f.27.2024.09.06.10.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:43:01 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] systemd: make home directory readable by systemd-coredump
Date: Fri,  6 Sep 2024 19:42:54 +0200
Message-ID: <20240906174254.3803158-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 17:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204280

From: Etienne Cordonnier <ecordonnier@snap.com>

In https://github.com/systemd/systemd/commit/924453c22599cc246746a0233b2f52a27ade0819
ProtectHome was set to true for systemd-coredump in order to reduce risk, since an attacker could craft a malicious binary in order to compromise systemd-coredump.
At that point the object analysis was done in the main systemd-coredump process.
Because of this systemd-coredump is unable to product symbolicated call-stacks for binaries running under /home ("n/a" is shown instead of function names).

However, later in https://github.com/systemd/systemd/commit/61aea456c12c54f49c4a76259af130e576130ce9 systemd-coredump was changed to do the object analysis in a forked process,
covering those security concerns.

Let's set ProtectHome to read-only so that systemd-coredump produces symbolicated call-stacks for processes running under /home.

Note: it still does not work in /tmp (because of PrivateTmp=yes) and in /root (for unknown reasons).

Before the change (with minidebuginfo enabled):

    root@qemux86-64:~# /home/sleep 1000 &
    [1] 426
    root@qemux86-64:~# kill -11 $(pidof sleep)
    root@qemux86-64:~# coredumpctl info
               PID: 426 (sleep)
               UID: 0 (root)
               GID: 0 (root)
            Signal: 11 (SEGV)
         Timestamp: Fri 2024-09-06 17:25:18 UTC (3s ago)
      Command Line: /home/sleep 1000
        Executable: /home/sleep
     Control Group: /system.slice/system-serial\x2dgetty.slice/serial-getty@ttyS0.service
              Unit: serial-getty@ttyS0.service
             Slice: system-serial\x2dgetty.slice
           Boot ID: 44ef4ddfaad249ceaa29d1e9f330d3b5
        Machine ID: fb279f18f2c849c59768754c7a274ee3
          Hostname: qemux86-64
           Storage: /var/lib/systemd/coredump/core.sleep.0.44ef4ddfaad249ceaa29d1e9f330d3b5.426.1725643518000000.zst (present)
      Size on Disk: 16.5K
           Message: Process 426 (sleep) of user 0 dumped core.

                    Stack trace of thread 426:
                    #0  0x00007f365f3849a7 clock_nanosleep (libc.so.6 + 0xd49a7)
                    #1  0x00007f365f38f667 __nanosleep (libc.so.6 + 0xdf667)
                    #2  0x0000561fee703737 n/a (/home/sleep + 0x7737)
                    #3  0x000000003a6227c5 n/a (n/a + 0x0)
                    ELF object binary architecture: AMD x86-64
    [1]+  Segmentation fault      (core dumped) /home/sleep 1000

After the change (with minidebuginfo enabled):

    root@qemux86-64:~# /home/sleep 1000 &
    [1] 450
    root@qemux86-64:~# kill -11 $(pidof sleep)
    root@qemux86-64:~# coredumpctl info
               PID: 450 (sleep)
               UID: 0 (root)
               GID: 0 (root)
            Signal: 11 (SEGV)
         Timestamp: Fri 2024-09-06 17:30:12 UTC (4s ago)
      Command Line: /home/sleep 1000
        Executable: /home/sleep
     Control Group: /system.slice/system-serial\x2dgetty.slice/serial-getty@ttyS0.service
              Unit: serial-getty@ttyS0.service
             Slice: system-serial\x2dgetty.slice
           Boot ID: 44ef4ddfaad249ceaa29d1e9f330d3b5
        Machine ID: fb279f18f2c849c59768754c7a274ee3
          Hostname: qemux86-64
           Storage: /var/lib/systemd/coredump/core.sleep.0.44ef4ddfaad249ceaa29d1e9f330d3b5.450.1725643812000000.zst (present)
      Size on Disk: 16.5K
           Message: Process 450 (sleep) of user 0 dumped core.

                    Stack trace of thread 450:
                    #0  0x00007f795dd689a7 clock_nanosleep (libc.so.6 + 0xd49a7)
                    #1  0x00007f795dd73667 __nanosleep (libc.so.6 + 0xdf667)
                    #2  0x0000561965c9d737 rpl_nanosleep (sleep + 0x7737)
                    #3  0x0000561965c9d0c1 xnanosleep (sleep + 0x70c1)
                    #4  0x0000561965c985c8 main (sleep + 0x25c8)
                    #5  0x00007f795dcba01b __libc_start_call_main (libc.so.6 + 0x2601b)
                    #6  0x00007f795dcba0d9 __libc_start_main (libc.so.6 + 0x260d9)
                    #7  0x0000561965c98685 _start (sleep + 0x2685)
                    ELF object binary architecture: AMD x86-64
    [1]+  Segmentation fault      (core dumped) /home/sleep 1000

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 ...oredump-set-ProtectHome-to-read-only.patch | 38 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_256.5.bb    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0003-coredump-set-ProtectHome-to-read-only.patch

diff --git a/meta/recipes-core/systemd/systemd/0003-coredump-set-ProtectHome-to-read-only.patch b/meta/recipes-core/systemd/systemd/0003-coredump-set-ProtectHome-to-read-only.patch
new file mode 100644
index 00000000000..feb1178d235
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-coredump-set-ProtectHome-to-read-only.patch
@@ -0,0 +1,38 @@
+From 4ac1755be2d6c141fae7e57c42936e507c5b54e3 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Fri, 6 Sep 2024 10:36:28 +0200
+Subject: [PATCH] coredump: set ProtectHome to read-only
+
+In https://github.com/systemd/systemd/pull/5283/commits/924453c22599cc246746a0233b2f52a27ade0819
+ProtectHome was set to true for systemd-coredump in order to reduce risk, since an attacker could craft a malicious binary in order to compromise systemd-coredump.
+At that point the object analysis was done in the main systemd-coredump process.
+Because of this systemd-coredump is unable to product symbolicated call-stacks for binaries running under /home ("n/a" is shown instead of function names).
+
+However, later in https://github.com/systemd/systemd/commit/61aea456c12c54f49c4a76259af130e576130ce9 systemd-coredump was changed to do the object analysis in a forked process,
+covering those security concerns.
+
+Let's set ProtectHome to read-only so that systemd-coredump produces symbolicated call-stacks for processes running under /home.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/4ac1755be2d6c141fae7e57c42936e507c5b54e3]
+
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+---
+ units/systemd-coredump@.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/units/systemd-coredump@.service.in b/units/systemd-coredump@.service.in
+index 012c60d2f6..fa3206d07b 100644
+--- a/units/systemd-coredump@.service.in
++++ b/units/systemd-coredump@.service.in
+@@ -28,7 +28,7 @@ PrivateDevices=yes
+ PrivateNetwork=yes
+ PrivateTmp=yes
+ ProtectControlGroups=yes
+-ProtectHome=yes
++ProtectHome=read-only
+ ProtectHostname=yes
+ ProtectKernelModules=yes
+ ProtectKernelTunables=yes
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core/systemd/systemd_256.5.bb
index 11b0fc5f05f..db053b45428 100644
--- a/meta/recipes-core/systemd/systemd_256.5.bb
+++ b/meta/recipes-core/systemd/systemd_256.5.bb
@@ -28,6 +28,7 @@ SRC_URI += " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
+           file://0003-coredump-set-ProtectHome-to-read-only.patch \
            "
 
 # patches needed by musl
-- 
2.43.0


