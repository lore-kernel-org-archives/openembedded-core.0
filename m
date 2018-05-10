Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B2FE374C60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 12:20:39 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id v5-v6so1808319wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 05:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TG5uOoHLOskp+c2puImyegtJ71SWKLcBcUxlHqPifvA=;
	b=DYJ61Vgk5z4Sw9MBGQHRHZhIKiAn2VkRb3hDMfnXSU77y3TUnxpx2tiM9vdkZY/Kkh
	hABNURsLFbmbHOxd8JbjuQXy6DgeYKZ5OpyKyI00yvYOc/pcGExSYJoaUB5mNLvjwiAP
	gDknHFUro2Cdj1VmdSE36Kn6O+Qr9qmLE6o0GTL0JatI5czSjyXVJ7hxkaC3AbY/N9nO
	KWOutBQxi2j3j6fR8Aab6oL9WtWGvdd68rGcpT62KGu0wcdW/sLeS5XCIlD7nwurTlfu
	LzZPjG3WVxwZHeAYv8qEQ/Aby3duTDrfTcflQmieRrFK75cdIuL1IBVyQybVJcEU0Xur
	AU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TG5uOoHLOskp+c2puImyegtJ71SWKLcBcUxlHqPifvA=;
	b=ssizJFm3Pipnb66zfdGqM754LddMwIiP4ys49SA+VmQq2hNtUv48iRXC2cv8rw272g
	4xbMd0tjXBHOJa7Wsr18blOgPzOQ0TEOO3OH+rRZt5JMcjTEz/YwR90RngBxoxiS3nHe
	8It+kdMdNZ0n1bS5mTy3KVZn/zvqYEm1oull8FyUIsMyKBqentDQFY+4k3mmBVqf6C0m
	n7cQZOPNI/OuLaCA0rt73+AIZook6pFz6UHejIiviuZW+WkVGII9sIZgkDydRcH4pBYZ
	bPtRNhQ5n/y1olvBkctVYnlVHy4Bn5V5N4ZIy0UFwDJTz9OHw5MMVxHbPAXDbev+lCWI
	ZDxg==
X-Gm-Message-State: ALKqPwdL9YqsI9/Je73wruGTwKgAfIRdaNx0q2P5oywmf/D41laoRXVN
	5v3o2s4M/52TjNK6BhfTJRTheA==
X-Google-Smtp-Source: AB8JxZo/c3sgKGhYx5oG8/19Y16Rm+AI/xLgwoGpDmSy1ycEEHCjTNfxFn3OXXh7y8+YAmhYSU10gw==
X-Received: by 2002:adf:a294:: with SMTP id
	s20-v6mr1116880wra.114.1525954839753; 
	Thu, 10 May 2018 05:20:39 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u37-v6sm953453wrb.53.2018.05.10.05.20.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 05:20:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 May 2018 12:20:36 +0000
Message-Id: <20180510122036.15212-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
References: <CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
Subject: [PATCH] busybox: Enable FEATURE_MOUNT_NFS and use libtirpc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2018 12:20:40 -0000

* We dropped in-tree obsoleted rpc from glibc and now busybox builds
  which had CONFIG_FEATURE_MOUNT_NFS enabled were failing with:
  | util-linux/mount.c:252:11: fatal error: rpc/rpc.h: No such file or directory
  |  # include <rpc/rpc.h>
  |            ^~~~~~~~~~~
  | compilation terminated.
  | make[1]: *** [util-linux/mount.o] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc       | 6 +++---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index d1675c37aa..2db19ed317 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "BusyBox combines tiny versions of many common UNIX utilities into
 HOMEPAGE = "http://www.busybox.net"
 BUGTRACKER = "https://bugs.busybox.net/"
 
-DEPENDS += "kern-tools-native"
+DEPENDS += "kern-tools-native libtirpc"
 
 # bzip2 applet in busybox is based on lightly-modified bzip2 source
 # the GPL is version 2 only
@@ -15,8 +15,8 @@ SECTION = "base"
 # Whether to split the suid apps into a seperate binary
 BUSYBOX_SPLIT_SUID ?= "1"
 
-export EXTRA_CFLAGS = "${CFLAGS}"
-export EXTRA_LDFLAGS = "${LDFLAGS}"
+export EXTRA_CFLAGS = "${CFLAGS} -I${STAGING_INCDIR}/tirpc"
+export EXTRA_LDFLAGS = "${LDFLAGS} -ltirpc"
 
 EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
 
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index fbb5fd852c..816555fc21 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -638,7 +638,7 @@ CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
 # CONFIG_FEATURE_MOUNT_HELPERS is not set
 # CONFIG_FEATURE_MOUNT_LABEL is not set
-# CONFIG_FEATURE_MOUNT_NFS is not set
+CONFIG_FEATURE_MOUNT_NFS=y
 # CONFIG_FEATURE_MOUNT_CIFS is not set
 CONFIG_FEATURE_MOUNT_FLAGS=y
 CONFIG_FEATURE_MOUNT_FSTAB=y
-- 
2.17.0


