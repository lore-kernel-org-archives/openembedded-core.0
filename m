Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4C3C47089
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 16:37:52 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.80372.1669999068909007798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 08:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iUHRbpUN;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id bj12so12765761ejb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 08:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+qq+R0QxxHAnFZQm1OBwOnZ4a6MvMD9MZVAi69l/PWY=;
        b=iUHRbpUNhz/7THjA8poSJzPYEbSL4YeoMHE7/f/aS8G5B7B+yxRMfq/SWKp73KRvMM
         xF2/Yhnt6+skTjDFVDaTTfvDkxXmvrrCTZ2oTIB5cMhie1SiiUaMaAVAZnVRQpB8ffF/
         UB3u3z4Ia6vNK92OBv2wEby6BTq5O53d5jz9i5tRfoKeGEze3QQGx24Xiwm5auii4qtp
         S1ySN+KSmDSXVYFINCVz4bUR6QHn+4bY/fgdKM9TCg3UsV3oycCpyXeGAYwzfuvPhL/p
         +byoBpHinAr8ohoIcqzQozZL3WmK4AQdRd5mPaRXUMma5W12mkQFjsnpQ0jQVQdd/eAu
         DUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qq+R0QxxHAnFZQm1OBwOnZ4a6MvMD9MZVAi69l/PWY=;
        b=R0cODxh27w4ndEY5OWVF+aR/V8DylLs+eDopDWxOELwsTb0H/GGeiBT0jU044rA3Mc
         2SxbMGaCPrlvNSc+aeQTfAHNoGJfk0rMHVMy2NEETbwZH7SQjMz2KVL4SpsSFPCnQX1d
         csrDQCgY5Yua8Dy2y9aaIgFeaYlrzaU9BRsHW3XRO655q0rQ+gWVnj/C9ILH9R/LtLnL
         T7QLbHkfNE+LvGHsLWDN6pdpfZkknFOmu3IKF5c9DSvrOw8/PYEg/MnFVuRCNHP778ai
         3ZrqmIw7WDB91SJYDIy78kHCjqeQ4cBXd8KQJsSBL0KKCxXtcuR7QMI6k3j84D95BlF2
         WAXg==
X-Gm-Message-State: ANoB5pl6bxc7MZfHXhcAPqXxX4Izqex+oznU04Gryu0UYUpQoVP4vUWg
	3QPvwJOnlH6bHdLW6NIUZhAcPIHF3sI=
X-Google-Smtp-Source: AA0mqf7RnAgMKSyhSdPRlcU84oJoflaTxEMzPaJEk858Mnbf+HjkU7JgieZlOhpvizU036yq/snTjg==
X-Received: by 2002:a17:906:706:b0:7ac:2e16:eb05 with SMTP id y6-20020a170906070600b007ac2e16eb05mr63095113ejb.26.1669999067253;
        Fri, 02 Dec 2022 08:37:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id kj22-20020a170907765600b007c090da9eb4sm3244340ejc.82.2022.12.02.08.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:37:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] ptest-packagelists.inc: correctly assign fast and slow tests
Date: Fri,  2 Dec 2022 17:37:36 +0100
Message-Id: <20221202163739.1194505-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 16:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174240

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
index cf1b57e186..66b1fcbe3f 100644
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


