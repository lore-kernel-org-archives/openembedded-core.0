Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55097C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:20:53 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.9679.1718288448624801759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ReyakETO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f70c457823so9046285ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288447; x=1718893247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GL4lKZm8E/b212henmNwlcd2elRv57d4M5Ny8tt7apA=;
        b=ReyakETOcSIApsdIXkNpyyQaH6VTHCx0Y2gTNSGGNEYzDgI41qa+WQmGjVC059z1lk
         V3ifvxrfpdvWfa4XHwj+yBD1Bx+XiqSR9ta8jHxzkzaWvO+pdOvbAqFsn2fFG/5fJDvt
         fH+0uZFQutIZrUlZqKdU6mPxzP2GssYSieLUjE3suyGHYYi4YogA0BnrzRD254JBhDoL
         TfbLCiLxxD4FtESwY31nJLAC+1vpcCjKDPCJo1jYJPLr+OMtzPhP9VoIJdYTEIPDkhBt
         j655UBiv1fvvWTp65WH5rjuUXRjCL9f2HZe/7lS4maow7SDRgheNV6AJbK4TNdjknVlu
         CB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288447; x=1718893247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GL4lKZm8E/b212henmNwlcd2elRv57d4M5Ny8tt7apA=;
        b=EHDMMXHIybpM3El8ITme7UCqaXpsSt5WNa0rJXk1v76fwCOTKKaLfxjYKdmnex/H7d
         snUrnPUibs01git6tnrXXvfKEHU6TxsogzB5lrIa9a/dnK2LR0rpoMs+vs6dZNjGWH8f
         chWr+FnTgvG2IA1ehYVV367QGu3eWAwm8gVJP3ookvLlK56nGHdRBvq4KsO+Fo6B3BdW
         vJGew19P2UFlfoGYzBDh1NueDzllxjnN9iPZZnbu0OYK0x6aXq8PyfSH6vb8TosIDKYv
         1EUU+xdLoVjrY8CvszW42eVQF2F4hwEXezVCQXHMixnAg8tgarMKT8GERh0isOWi+PTh
         CaLg==
X-Gm-Message-State: AOJu0YyehXVe1l5Y6oT/w/knB/cBNHGLvmZa5p0cQWP/TrZ36fE7qIel
	H1WmXQXBg7K3yaI77iJEE3JrBnjO8J6nwlSxFr82vLvLfpT/nIUFn/y50f/sDQIrCRuY2cgU4ha
	k
X-Google-Smtp-Source: AGHT+IGIVUGB/Trby+RP+96/vlqWDzdQ7e2JXfnhqscsxMrvEy5LhVILe0bBo7Ke4vLQFCpISb66YA==
X-Received: by 2002:a17:902:d4ca:b0:1f6:e8ee:54b7 with SMTP id d9443c01a7336-1f83b5e8a6cmr54322095ad.20.1718288447028;
        Thu, 13 Jun 2024 07:20:47 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/29] procps: fix build with new glibc but old kernel headers
Date: Thu, 13 Jun 2024 07:20:10 -0700
Message-Id: <aaced482585fa32d2eadeeb3eb692b3c55666a2a.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200608

From: Ross Burton <ross.burton@arm.com>

If you're building procps with a newer glibc (with pidfd_open()) but
older kernel headers (say 4.x, before __NR_pidfd_open) then procps will
fail to build because of a typo in configure.ac.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../procps/procps/pidfd.patch                 | 42 +++++++++++++++++++
 meta/recipes-extended/procps/procps_4.0.4.bb  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/pidfd.patch

diff --git a/meta/recipes-extended/procps/procps/pidfd.patch b/meta/recipes-extended/procps/procps/pidfd.patch
new file mode 100644
index 0000000000..23d1a3cd3e
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/pidfd.patch
@@ -0,0 +1,42 @@
+From c8f625e085b8249cc009e8b19c3a19100217eb35 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 25 Apr 2024 13:33:15 +0000
+Subject: [PATCH] Fix pidfd_open detection
+
+This check for pidfd_open uses AC_CHECK_FUNC which just runs the specified code, but 
+src/pgrep.c checks HAVE_PIDFD_OPEN which will only be defined by AC_CHECK_FUNCS.
+
+Also pidfd_open is defined in sys/pidfd.h so that needs including.
+
+Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/229]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+
+diff --git a/configure.ac b/configure.ac
+index fec27e3f..024731c7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -170,7 +170,7 @@ AC_TRY_COMPILE([#include <errno.h>],
+ 		AC_MSG_RESULT(yes),
+ 		AC_MSG_RESULT(no))
+ 
+-AC_CHECK_FUNC([pidfd_open], [enable_pidwait=yes], [
++AC_CHECK_FUNCS([pidfd_open], [enable_pidwait=yes], [
+   AC_MSG_CHECKING([for __NR_pidfd_open])
+   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
+ #include <sys/syscall.h>
+diff --git a/src/pgrep.c b/src/pgrep.c
+index d8e57dff..c5211aec 100644
+--- a/src/pgrep.c
++++ b/src/pgrep.c
+@@ -44,7 +44,9 @@
+
+ #ifdef ENABLE_PIDWAIT
+ #include <sys/epoll.h>
+-#ifndef HAVE_PIDFD_OPEN
++#ifdef HAVE_PIDFD_OPEN
++#include <sys/pidfd.h>
++#else
+ #include <sys/syscall.h>
+ #endif /* !HAVE_PIDFD_OPEN */
+ #endif
diff --git a/meta/recipes-extended/procps/procps_4.0.4.bb b/meta/recipes-extended/procps/procps_4.0.4.bb
index 800384f22f..ec8c4b0261 100644
--- a/meta/recipes-extended/procps/procps_4.0.4.bb
+++ b/meta/recipes-extended/procps/procps_4.0.4.bb
@@ -14,6 +14,7 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://sysctl.conf \
+           file://pidfd.patch \
            "
 SRCREV = "4ddcef2fd843170c8e2d59a83042978f41037a2b"
 
-- 
2.34.1


