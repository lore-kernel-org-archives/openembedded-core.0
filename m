Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C9FC3ABB2
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 23:53:54 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.9640.1726530832277922454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Sep 2024 16:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=KDiZBXFm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a99eee4a5bso447198285a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 16:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1726530831; x=1727135631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GLf/V6XxKhyPW4+SyuXLnq6zR6u1c9sQEv9/b+zgPW0=;
        b=KDiZBXFmBAmPNgEouh5iFOWfL2LACkOn7n82dzqlBtilp1hBu+IyzZzoJ0c2aAzoJb
         NH8QBb8sHPJRAfyhZ5a2S4YT+BHPImTT7HRkQHyMsfmq6xED/ptZkGl/B33aiPNpAMAn
         q6AJVQ+ntnxwH1+wjUndHZ5OpUa84sHyCb2wY+89P0R00ClG6j10IQakgoe0ZD3puKLP
         QknPLOUSDq8oanQPTwYlGe1hZQr6MUpC9k3zlL7EHlzNlNb9p8eZyY7yd1rZeAOQAYcf
         z5pF2iCHZWq9nM1J2k+lVjet8MtPNTwIshRjb1NwK3hc7Yb4AuRv2+sGqDvO9SoV+mqX
         gITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726530831; x=1727135631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLf/V6XxKhyPW4+SyuXLnq6zR6u1c9sQEv9/b+zgPW0=;
        b=WjkXh/Gg6o6BuIkRjIFkH3/hJXDMQPV/Qd0t0DUTAglXa44dfMG9PKA4n5yokE7La2
         Vb+wg/a4X6jT/VY52lD0G0gwKZa4RTPEi6ulPfhM9S+mCmaUeYVarSJYfWfKGm6KYiFZ
         CCYEv3d3X0Ai1XzRLK6KgiLpRoSu9d/kze1di5jrzC7/JPR8WTKyrEofmg5uIVvRFrO6
         zfdb5YU1peI3vN4mzCBKTFtjXkmrKtIsCrkC/2wrB/sQjuMkD0B2FlnZq9PnBI9AWQz3
         Heb7sCpG946DvgEa+GaGQSlmh6s7twKOHPD+mTwt/ll8l9NTkZITnG1rdd45MvMRfjUo
         +4fg==
X-Gm-Message-State: AOJu0Yyqxm4bBh4sVYMVKeaDGjKJkKNHYIrEi5ddmALEzPjHqPZEexTk
	g70k3CzfL1T4p6UK7mBg1y0CWp0YbA0UF1q+/TEvhTsb++vv5TJ1nYdtfFl8TXBVhJgt420ROns
	=
X-Google-Smtp-Source: AGHT+IEankAC+78eXEtxjbYxeI9opnMy6v+HRFV6hUGgwjO1IEzXNaPvKsLqTxuLhlhe30/HdMgKfQ==
X-Received: by 2002:a05:620a:400b:b0:7a7:fef9:f608 with SMTP id af79cd13be357-7a9e5f878c3mr2647940085a.52.1726530830851;
        Mon, 16 Sep 2024 16:53:50 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ab3eb56391sm300767585a.93.2024.09.16.16.53.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 16:53:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wpa-supplicant: add patch to check for kernel header version when compiling macsec
Date: Mon, 16 Sep 2024 19:53:49 -0400
Message-Id: <20240916235349.1801165-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 23:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204613

When using Arm binary toolchain, version 2.11 of wpa-supplicant is
failing to compile with the following error:

| ../src/drivers/driver_macsec_linux.c:81:29: error: field ‘offload’ has incomplete type
|    81 |         enum macsec_offload offload;
|       |

Backport a recent patch that corrects the issue by adding a check for
the version of kernel headers being used in compilation and disabling
that enum if too old a version is being used (or is used by the
binary toolchain).

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 ...dware-offload-requires-Linux-headers.patch | 53 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch
new file mode 100644
index 000000000000..f9634e47c911
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch
@@ -0,0 +1,53 @@
+From 809d9d8172db8e2a08ff639875f838b5b86d2641 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Thu, 22 Aug 2024 00:03:41 +0300
+Subject: [PATCH] macsec_linux: Hardware offload requires Linux headers >= v5.7
+
+Hardware offload in Linux macsec driver is enabled in compile time if
+libnl version is >= v3.6. This is not sufficient for successful build
+since enum 'macsec_offload' has been added to Linux header if_link.h
+in kernels v5.6 and v5.7, see commits:
+- https://github.com/torvalds/linux/commit/21114b7feec29e4425a3ac48a037569c016a46c8
+- https://github.com/torvalds/linux/commit/76564261a7db80c5f5c624e0122a28787f266bdf
+
+New libnl with older Linux headers is a valid combination. This is how
+hostapd build failure has been detected by Buildroot autobuilder, see:
+- http://autobuild.buildroot.net/results/b59d5bc5bd17683a3a1e3577c40c802e81911f84/
+
+Extend compile time condition for the enablement of the macsec hardware
+offload adding Linux headers version check.
+
+Fixes: 40c139664439 ("macsec_linux: Add support for MACsec hardware offload")
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/patch/?id=809d9d8172db8e2a08ff639875f838b5b86d2641]
+Signed-off-by: Jon Mason <jdmason@kudzu.us>
+---
+ src/drivers/driver_macsec_linux.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/drivers/driver_macsec_linux.c b/src/drivers/driver_macsec_linux.c
+index c867154981e9..fad47a292f9f 100644
+--- a/src/drivers/driver_macsec_linux.c
++++ b/src/drivers/driver_macsec_linux.c
+@@ -19,6 +19,7 @@
+ #include <netlink/route/link.h>
+ #include <netlink/route/link/macsec.h>
+ #include <linux/if_macsec.h>
++#include <linux/version.h>
+ #include <inttypes.h>
+ 
+ #include "utils/common.h"
+@@ -32,7 +33,8 @@
+ 
+ #define UNUSED_SCI 0xffffffffffffffff
+ 
+-#if LIBNL_VER_NUM >= LIBNL_VER(3, 6)
++#if (LIBNL_VER_NUM >= LIBNL_VER(3, 6) && \
++     LINUX_VERSION_CODE >= KERNEL_VERSION(5, 7, 0))
+ #define LIBNL_HAS_OFFLOAD
+ #endif
+ 
+-- 
+2.39.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 321dedc58a7f..257ef43b6e5d 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
+           file://0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch \
            "
 SRC_URI[sha256sum] = "912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a"
 
-- 
2.39.2


