Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9A1C52D6D
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:08:41 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.30065.1722791314896461577
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PmpfPIOh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70eaf5874ddso7407638b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791314; x=1723396114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O84P8HG2VeJnt5KVid+qXnAX2y4ZW944IHOCF50AOv4=;
        b=PmpfPIOhstNv4qEsWdIRg7aVq+wi+B9LaosqNRc1p5JOhLj9riWrjh/BcH/vvZw9B6
         VAIGND0xlNwy08rnWcx11HenYKerFXznBqqEh8aToPJH1qbibpW8gWKCtYeIWC+QXurR
         9cRn2ZjiO7re7hJNPz2SqqoOP3wI3JqHJMtqeMp3VoA7sdNAyYHMAFQJE6pV8IthVbUM
         bkwbT2nw3lNBu0ZeJBlI6/O31KJ72kqCaCg/uafmhOXEjfNbH6cjopO3tGVaMAW9tL9r
         5D8iTIi9p2kzuu/I7Q/4+Yi43new28wukcSQXN47bfrXHxCsSJ538O9Vbg7Z1ORaOVUf
         7Juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791314; x=1723396114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O84P8HG2VeJnt5KVid+qXnAX2y4ZW944IHOCF50AOv4=;
        b=AeYuw+QteGfJ+O39kkehnACvib63RzVaQGtvHglAo8uLhNZMpx2x59Jd2ap2GlM3gf
         +F1ykDhl955Xd0q2Ui9n43zW6eqM9dq978md2+P4rynqbY+mYnRkHrJCQ9LfeCJbL507
         oWcwspMO8yx3BhRRhIO7pmIcwrsKVdxCfq/WZDlBF90mqpqmKlgAolqXAD3cwD71mXVL
         cO58JwURaZYE0qmT6tJGmiiY/UkyGmn/qxn9uhNCekmP7YV54KG69if4ouDjV6kCm7oX
         SCtYjapr7lNMI7kwHreHvSsV6HgJ7KJjR+03bIYxJw19SAldwtuc+z3jyGqC7DaYg7Pa
         IKmQ==
X-Gm-Message-State: AOJu0YziVcuPzdUAi4B0rUs1H0+OYelvN+gOCnE15Xhg7hM01AJo9uri
	SJpmPWCAv4QRXxLeJeRHrZyv1fRE/7fE4jnFf05K/Dk7Tt6QohFSIKhzr2LkQzjUqJwPrP570Ew
	hR7wgNg==
X-Google-Smtp-Source: AGHT+IEXV6uTECjL6csF/lvytvhsR2mp5fBC1g5J8VyahpMc52biGjCRdDItzNfAnc8kMy2mmmintA==
X-Received: by 2002:a05:6a20:918c:b0:1c0:bd9c:adf with SMTP id adf61e73a8af0-1c699616e6cmr10392394637.50.1722791314104;
        Sun, 04 Aug 2024 10:08:34 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4e3c41sm8714415a91.48.2024.08.04.10.08.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:08:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] lttng-modules: Upgrade 2.13.9 -> 2.13.14
Date: Sun,  4 Aug 2024 10:08:14 -0700
Message-Id: <2721f84ba755ceea5780e44feb0713ad8c4d0217.1722791084.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722791084.git.steve@sakoman.com>
References: <cover.1722791084.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:08:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202958

From: Siddharth Doshi <sdoshi@mvista.com>

License-Update: Upstream cleaned stale file paths in License file and updated LICENSES/LGPL-2.1 and LICENSES/GPL-2.0 -> LICENSES/LGPL-2.1-only.txt and LICENSES/GPL-2.0-only.txt causing md5 to change.
(ref commit ->
https://github.com/lttng/lttng-modules/commit/b972ef5708a00718a081f0eb40205e25677e5e93
and
https://github.com/lttng/lttng-modules/commit/61baff6e8de2462f45006662bc34bcbf5f645ba0#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7)

Note: Upgrade lttng-modules to 2.13.14 to fix fcheck error which occurs
with commit 782202de6478f68caaed4567017095ad906c4eef in kernel "file: Rename fcheck
lookup_fd_rcu" which does replaces fcheck with lookup_fd_rcu.

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0009-Rename-genhd-wrapper-to-blkdev.patch | 19 +++++++++++--------
 ...les_2.13.9.bb => lttng-modules_2.13.14.bb} |  4 ++--
 2 files changed, 13 insertions(+), 10 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.9.bb => lttng-modules_2.13.14.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch b/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
index 90fec9dc58..874e076675 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
@@ -8,9 +8,12 @@ to follow upstream.
 
 Upstream-Status: Backport
 
+Note: Updated patch to cleanly apply to 2.13.14
+
 Change-Id: I4ec94fb94d11712dd20f0680aea1de77fbfa9d17
 Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
 Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
 ---
  include/wrapper/{genhd.h => blkdev.h} | 10 +++++-----
  src/lttng-statedump-impl.c            |  2 +-
@@ -21,7 +24,7 @@ diff --git a/include/wrapper/genhd.h b/include/wrapper/blkdev.h
 similarity index 93%
 rename from include/wrapper/genhd.h
 rename to include/wrapper/blkdev.h
-index 4a59b68e..0d5ad90f 100644
+index e32c7b6..76397f6 100644
 --- a/include/wrapper/genhd.h
 +++ b/include/wrapper/blkdev.h
 @@ -1,6 +1,6 @@
@@ -41,9 +44,9 @@ index 4a59b68e..0d5ad90f 100644
 +#ifndef _LTTNG_WRAPPER_BLKDEV_H
 +#define _LTTNG_WRAPPER_BLKDEV_H
  
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
- #include <linux/blkdev.h>
-@@ -45,7 +45,7 @@ struct class *wrapper_get_block_class(void)
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0) \
+	|| LTTNG_RHEL_KERNEL_RANGE(5,14,0,162,0,0, 5,15,0,0,0,0))
+@@ -47,7 +47,7 @@ struct class *wrapper_get_block_class(void)
  /*
   * Canary function to check for 'block_class' at compile time.
   *
@@ -52,17 +55,17 @@ index 4a59b68e..0d5ad90f 100644
   *
   *   extern struct class block_class;
   */
-@@ -104,4 +104,4 @@ struct device_type *wrapper_get_disk_type(void)
+@@ -106,4 +106,4 @@ struct device_type *wrapper_get_disk_type(void)
  
  #endif
  
 -#endif /* _LTTNG_WRAPPER_GENHD_H */
 +#endif /* _LTTNG_WRAPPER_BLKDEV_H */
 diff --git a/src/lttng-statedump-impl.c b/src/lttng-statedump-impl.c
-index 4d7b2921..0e753090 100644
+index 9d197ce..229517e 100644
 --- a/src/lttng-statedump-impl.c
 +++ b/src/lttng-statedump-impl.c
-@@ -41,7 +41,7 @@
+@@ -42,7 +42,7 @@
  #include <wrapper/namespace.h>
  #include <wrapper/irq.h>
  #include <wrapper/tracepoint.h>
@@ -72,5 +75,5 @@ index 4d7b2921..0e753090 100644
  #include <wrapper/fdtable.h>
  #include <wrapper/sched.h>
 -- 
-2.19.1
+2.35.7
 
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
index a08386b053..a3e29ab7b7 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
@@ -3,7 +3,7 @@ SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 HOMEPAGE = "https://lttng.org/"
 LICENSE = "LGPL-2.1-only & GPL-2.0-only & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0464cff101a009c403cd2ed65d01d4c4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8d0d9f08888046474772a5d745d89d6a"
 
 inherit module
 
@@ -16,7 +16,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "bf808b113544287cfe837a6382887fa66354ef5cc8216460cebbef3d27dc3581"
+SRC_URI[sha256sum] = "c6449f7ff12ab644a630692a556304e51525ca37d98aebf826796918be0f5da6"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.34.1


