Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF92CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 15:39:29 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.66628.1697297968426256074
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 08:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MMviszEy;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-57de6e502fcso1734927eaf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 08:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697297967; x=1697902767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AbaskGLnrqpzFbNXAGCuNbAP8puQqgr1785NsWJonks=;
        b=MMviszEy1qoE8pMLK+y2gudH42g0dGdKI/Zw8sjq+rAC7gL7/XdPnfDHq51YpUwYC8
         m2mH2PvhgFoMEqwa/P3okAh663m4EozoK9AZ5a81ALVGl7Vk5m/tm4Xs+S4J/oDI5T26
         /X+9PoZhLIh/YzM7cK6NYgTJo+YDeg2ay0khSEl7QD3Iy2OXYFVym4k4O4BYHfP9yGFG
         f5NDgzGCVHYKPioLdWdXyYd7JzG1seGF7r1r6HEgGFjE/W9p/RrqpBrmLaxTOsmeb+hZ
         J9lH8sKmID1aeVxpTPaivgJg4Ij3TGqDq6bWu/v5hKLuQbB9fEZ5tnQ+9fh1Z1oM119l
         UNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697297967; x=1697902767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbaskGLnrqpzFbNXAGCuNbAP8puQqgr1785NsWJonks=;
        b=p0SG6muq7+sindZ229Z2ltzX24mVySgFYX86N1z5mhQzSNfmupNXOnAMjH1FiuA3Kq
         NkXRhVl3JHHtZ+gtivoYx/qlAf8UkArpTn/LdN+IwvJT8cO6PS/vtVGauPSvcPFhROyT
         jj0BoKHf+fabPObUHKx4G/CDQ6PmTvt7Rrkz2yGxx83C+Huvgxerl/Gzd2811b7Mp/Kn
         Q9Euys/c2mWkCuQuunIS0W9p5wERTSo/DLnWFTPB871oBK292ovqQuQNZUiVoQKS4hme
         axpusKme0zjer4htwg20HT1vXilnp1lttFb+iZ6LM9pWbyyrdEwvQx3Bcd0QgD9Yhxkw
         PTwA==
X-Gm-Message-State: AOJu0YxX4Rk1vWPu+1n6BFpBPXD2m25MF/KthLHrpmFp1IXYMJvrLJjK
	Ae2qMmOoWZJrtuTY4NwWFrT0GuIMvAWXYg==
X-Google-Smtp-Source: AGHT+IFZ2ZF7hq8+78G9gSYEtv+CXA3OLEwvZ6qeHADKApZgxu3L9jf9ANv3A7SJPxUnkTskOzQLCQ==
X-Received: by 2002:a05:6358:e49d:b0:133:a8e:6feb with SMTP id by29-20020a056358e49d00b001330a8e6febmr30742557rwb.12.1697297967342;
        Sat, 14 Oct 2023 08:39:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::27bb])
        by smtp.gmail.com with ESMTPSA id v27-20020aa799db000000b006b6f3bc8123sm1929031pfi.50.2023.10.14.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 08:39:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] gcompat: Add fcntl64 wrapper
Date: Sat, 14 Oct 2023 08:39:23 -0700
Message-ID: <20231014153924.54987-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 15:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189118

Needed by pvr mesa drivers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcompat/0001-Add-fcntl64-wrapper.patch    | 44 +++++++++++++++++++
 meta/recipes-core/musl/gcompat_git.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/musl/gcompat/0001-Add-fcntl64-wrapper.patch

diff --git a/meta/recipes-core/musl/gcompat/0001-Add-fcntl64-wrapper.patch b/meta/recipes-core/musl/gcompat/0001-Add-fcntl64-wrapper.patch
new file mode 100644
index 00000000000..3f265e273a9
--- /dev/null
+++ b/meta/recipes-core/musl/gcompat/0001-Add-fcntl64-wrapper.patch
@@ -0,0 +1,44 @@
+From 37f70f54c74c4ceeb089cbee88311ba00638f211 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 13 Oct 2023 21:02:23 -0700
+Subject: [PATCH] Add fcntl64 wrapper
+
+fixes loadtime errors with pvr precompiled driver for visionfive2
+
+load libpvr_dri_support.so: Error relocating /usr/lib/libpvr_dri_support.so: fcntl64: symbol not found
+
+Upstream-Status: Submitted [https://git.adelielinux.org/adelie/gcompat/-/merge_requests/28]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libgcompat/unistd.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/libgcompat/unistd.c b/libgcompat/unistd.c
+index 011fba2..400abf3 100644
+--- a/libgcompat/unistd.c
++++ b/libgcompat/unistd.c
+@@ -1,6 +1,7 @@
+ #include <assert.h> /* assert */
+ #include <fcntl.h>  /* O_CREAT */
+ #include <limits.h> /* NGROUPS_MAX */
++#include <stdarg.h> /* va_list, va_start, va_end */
+ #include <stddef.h> /* NULL, size_t */
+ #include <unistd.h> /* confstr, getcwd, getgroups, ... */
+ #include <errno.h>  /* ENOSYS, ENOMEM */
+@@ -250,3 +251,13 @@ int __close(int fd)
+ {
+ 	return close(fd);
+ }
++
++int fcntl64 (int fd, int cmd, ...)
++{
++  int ret;
++  va_list ap;
++  va_start(ap, cmd);
++  ret = fcntl(fd, cmd, ap);
++  va_end(ap);
++  return ret;
++}
+-- 
+2.42.0
+
diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index ba802e3caaa..3e5541ba91e 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb33ef4af05a9c7602843afb7adfe792"
 
 SRC_URI = "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current \
            file://0001-auxv-new-module.patch \
+           file://0001-Add-fcntl64-wrapper.patch \
            "
 SRC_URI:append:powerpc = "\
            file://0001-make-Static-PIE-does-not-work-on-musl-ppc.patch \
-- 
2.42.0


