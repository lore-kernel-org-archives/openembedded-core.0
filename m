Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00ACCC25B0C
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 22:26:24 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.18967.1659911178788636004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 15:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZVIQ7bej;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so7508807pjf.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 15:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=S/qu9ejmpu/bd+NT2qbtbHzgRMjR8eVxn0o/dSXR8PY=;
        b=ZVIQ7bejeZOir8SFWmqfnrBfHrfSZ7lnzVS/jUmkrVTk8rk/Q5V504VJHbk3ANCZZ0
         wG5y/arsyswh99a/YDHWmEtFFcD+FhIqLtDPtPa4N3XMEIDc2U41ioKqQ4XyCZu7O5vf
         NnyX8S7Rnr+by7E8u4qczX3DkJ99HBJlX2aKtO5LsfO/9zf33VKrY3qBtLuyzfmamv/g
         KTuQ/4VvDaLoIlu3/Wq2DJE6nSbEYlSmmuoMexOIfuYJEsaO7vGbfyasEIbajmmRtE1c
         +o15p7IDAIx0vMlXimBtG7S0RMIiS2svwPf7mZ8fPGp14f1duG4GI3hEN+vN19DaoHuo
         6B3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=S/qu9ejmpu/bd+NT2qbtbHzgRMjR8eVxn0o/dSXR8PY=;
        b=eyIW18AfWsJ58vMxMGkS1pMyeDyXrWZG4uFocP7lnuymOqmHag7DwTk4HHL8+1sDwe
         Und5uj0CERS3ZV4BdNBvA8/K+fpwN9xcpHQMJoY77pjJcGnBI9Qi75L4JF6vYUssfWle
         P5B6RJpb1ee9v6HL37cA9e/KmSzOuL7VxX5/+fh8owGLVbpey5InZrz3L1kmyP4dC5t2
         xmsHkchVgd4QKq/clMCZlR13fbkZrXGOkfwOwVF0I83YRbQMOlkk+H+d8rCDAh+Bbzm1
         urIYzCMEv+GY+DGa5t7n+X0An8an6+6LjuoLZU+mhGX8CVa4e3YHvfmvVXy5bmfnsDuZ
         kIjw==
X-Gm-Message-State: ACgBeo3wm6whbqOphRoQcgLiy3pQjpnayOEDCErujRxCAxJtM2Y69z0X
	DuWQRf+9AGgOsS4ChckkI7zC9iZ8F2I=
X-Google-Smtp-Source: 
 AA6agR7eSHXjFzoTQepBfORYPWKKR0TF5B5ltFQnFztDBM2yDBCFg1NtqNNmt8N4VAx7lHDfqbZ1+w==
X-Received: by 2002:a17:903:2685:b0:16e:da0a:9d8 with SMTP id
 jf5-20020a170903268500b0016eda0a09d8mr15994643plb.42.1659911177751;
        Sun, 07 Aug 2022 15:26:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 n6-20020a170902e54600b0016d773aae60sm7181776plf.19.2022.08.07.15.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 15:26:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] util-linux: Define pidfd_* function signatures
Date: Sun,  7 Aug 2022 15:26:12 -0700
Message-Id: <20220807222613.1173589-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807222613.1173589-1-raj.khem@gmail.com>
References: <20220807222613.1173589-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 22:26:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169008

glibc 2.36 has added sys/pidfd.h and APIs for
pidfd_send_signal and pidfd_open, therefore check
for this header and include it if it exists

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../0001-check-for-sys-pidfd.h.patch          | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c9bddfb7a68..e7757121588 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,6 +35,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
+           file://0001-check-for-sys-pidfd.h.patch \
            "
 
 SRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch b/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
new file mode 100644
index 00000000000..19f57f14bc7
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
@@ -0,0 +1,53 @@
+From 548bc568f3c735e53fb5b0a5ab6473a3f1457b91 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Aug 2022 14:39:19 -0700
+Subject: [PATCH] check for sys/pidfd.h
+
+This header in newer glibc defines the signatures of functions
+pidfd_send_signal() and pidfd_open() and when these functions are
+defined by libc then we need to include the relevant header to get
+the definitions. Clang 15+ has started to error out when function
+signatures are missing.
+
+Fixes errors like
+misc-utils/kill.c:402:6: error: call to undeclared function 'pidfd_send_signal'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+        if (pidfd_send_signal(pfd, ctl->numsig, &info, 0) < 0)
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/1769]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac          | 1 +
+ include/pidfd-utils.h | 4 +++-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a511e93de..fd7d9245f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -342,6 +342,7 @@ AC_CHECK_HEADERS([ \
+ 	sys/mkdev.h \
+ 	sys/mount.h \
+ 	sys/param.h \
++	sys/pidfd.h \
+ 	sys/prctl.h \
+ 	sys/resource.h \
+ 	sys/sendfile.h \
+diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
+index eddede976..d9e33cbc5 100644
+--- a/include/pidfd-utils.h
++++ b/include/pidfd-utils.h
+@@ -4,8 +4,10 @@
+ #ifdef HAVE_SYS_SYSCALL_H
+ # include <sys/syscall.h>
+ # if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
++#  ifdef HAVE_SYS_PIDFD_H
++#   include <sys/pidfd.h>
++#  endif
+ #  include <sys/types.h>
+-
+ #  ifndef HAVE_PIDFD_SEND_SIGNAL
+ static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
+ 				    unsigned int flags)
+-- 
+2.37.1
+
-- 
2.37.1


