Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA520C04FDE
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.70629.1670929884400632099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UuX8/kng;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id h10so15217537wrx.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ScaxZRNGoYDBNQ17g3p4l8x8C+B9u+MHki9uEbTMx/k=;
        b=UuX8/kngJJtg22lQv/hXWWcjViVDe/Toie4Fhr36GpDg263vIGmSctVeviR8zXiapV
         Yrr2BbjiWOFF5576xtfMP4RMSdqwm1PGGPM1TpYLOqSqDI/j7TBktuQyXwQE2pX8A1GD
         P8dLDc/Kd5KbdZ4UOiBrZO7wyx9fuh/FuhomXVKl9YxfFJLDXbsUH5zezE3PjXDpZie6
         OAoqPvWyiB850mV+3HSWXdy3HN9ceArkAv1hhL7oEJ+qWITrNDDkdFpaCfJ8VFy4mmt8
         KO0L0oqirCtFLzN+0ATNReEM1/ufkEaua7Y3EsF45o0ggXfZkAjDrv9ZmwWuMPOJRSCq
         MQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScaxZRNGoYDBNQ17g3p4l8x8C+B9u+MHki9uEbTMx/k=;
        b=4STq+lGuHn3n7iD5rb1cyLzDdn/DpLHT5Z13OhVnveBuL7jrIWVeH6VblEsu8sqDeq
         jbgXVnykagjwR1H1dAl+aXJmgjYQ7BSRF2EHxS8nLKzqFqGg0dBYyZJuGkKGW2nBhxj6
         jcb1NAAK+1493JD+eg4b4sYiYYxl4oKVoNgokhS0K2eLWkGJZxZ91n+qvtjOgDKyr5cO
         rFiQHkM9m+EAzOEceCb3NY0CoFZ66Ks/hxvXAe3u3XpdcYFTerb1GArLr7tAmQasWNrh
         TvNj1JLm4xzjhv7XFuG7ET8u8KiRaODz3352Y3b2rlkcoO+mVfseR9cRnZ+LwdWdPdzV
         q2aA==
X-Gm-Message-State: ANoB5pnwJyBHjDACxycSTOwqeR0TbCAbTFd5t+WO8yjGJjrVmm5FUqlt
	hs7Y4KmibCXc5Y4i3RNc2lKDZtfZnp4=
X-Google-Smtp-Source: AA0mqf4O+Zw/0eociOSVR2KwiIYHGfB0M7Yqn68EeXnCzu99gvmNfkwBQeDnw8zIcK02F/9vBHgj5A==
X-Received: by 2002:a5d:5610:0:b0:242:1ad2:15e1 with SMTP id l16-20020a5d5610000000b002421ad215e1mr11456629wrv.2.1670929882609;
        Tue, 13 Dec 2022 03:11:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/24] ptest-packagelists.inc: correctly assign fast and slow tests
Date: Tue, 13 Dec 2022 12:10:55 +0100
Message-Id: <20221213111118.149697-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174511

The execution times were checked from
https://autobuilder.yocto.io/pub/non-release/20221127-2/testresults/qemux86-64-ptest/core-image-ptest-all/log.do_testimage.40537.20221127010849
and ptests were moved both ways according to the same criteria:
more than 30 seconds or less.

openssl is dropped from fast tests, as it is also listed in slow
tests (which is correct).

With the rearrangement fast ptests altogether take about 420 seconds
on qemux86_64 with kvm.

m4 ptest was missing a depedency.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../distro/include/ptest-packagelists.inc     | 21 +++++++++----------
 meta/recipes-devtools/m4/m4-1.4.19.inc        |  1 +
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 79de9b00ae..48dec07577 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -5,22 +5,22 @@
 #
 PTESTS_FAST = "\
     acl-ptest \
-    apr-ptest \
     apr-util-ptest \
     attr-ptest \
+    babeltrace-ptest \
+    babeltrace2-ptest \
     bc-ptest \
     bluez5-ptest \
-    bzip2-ptest \
+    busybox-ptest \
     diffstat-ptest \
     diffutils-ptest \
-    elfutils-ptest \
     ethtool-ptest \
     expat-ptest \
+    findutils-ptest \
     flex-ptest \
     gawk-ptest \
     gdbm-ptest \
     gdk-pixbuf-ptest \
-    gettext-ptest \
     glib-networking-ptest \
     gzip-ptest \
     json-c-ptest \
@@ -29,7 +29,6 @@ PTESTS_FAST = "\
     liberror-perl-ptest \
     libgpg-error-ptest\
     libnl-ptest \
-    libmodule-build-perl-ptest \
     libpcre-ptest \
     libssh2-ptest \
     libtimedate-perl-ptest \
@@ -50,10 +49,8 @@ PTESTS_FAST = "\
     lzo-ptest \
     m4-ptest \
     nettle-ptest \
-    openssl-ptest \
     opkg-ptest \
     pango-ptest \
-    parted-ptest \
     popt-ptest \
     python3-atomicwrites-ptest \
     python3-bcrypt-ptest \
@@ -82,21 +79,23 @@ PTESTS_FAST:remove:riscv32 = "qemu-ptest"
 PTESTS_PROBLEMS:append:riscv32 = " qemu-ptest"
 
 PTESTS_SLOW = "\
-    babeltrace-ptest \
-    babeltrace2-ptest \
-    busybox-ptest \
+    apr-ptest \
+    bzip2-ptest \
     coreutils-ptest \
     curl-ptest \
     dbus-ptest \
     e2fsprogs-ptest \
-    findutils-ptest \
+    elfutils-ptest \
+    gettext-ptest \
     glib-2.0-ptest \
     gstreamer1.0-ptest \
     libevent-ptest \
     libgcrypt-ptest \
+    libmodule-build-perl-ptest \
     lttng-tools-ptest \
     openssh-ptest \
     openssl-ptest \
+    parted-ptest \
     perl-ptest \
     python3-cryptography-ptest \
     python3-ptest \
diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index 2adf4de6f2..6ee9742277 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -54,6 +54,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest += "make coreutils diffutils"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
+     locale-base-fr-fr \
      locale-base-fr-fr.iso-8859-1 \
 "
 
-- 
2.30.2


