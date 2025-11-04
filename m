Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4D3CCFA06
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 04:34:20 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10897.1762230859055906839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 20:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NeQjVzIi;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b6cf07258e3so3313886a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762230858; x=1762835658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdfOwLNIHfmUYwhYC8FV9uLqNGHnjHoIFBGLUu0lSkI=;
        b=NeQjVzIi/9ZVmZA8o0/bvlKX6is/KvbNMX0iLjxl0eJJ62W/31MNyVyE4Z9X6imcti
         02t2E9Jp6laGFdXOLjnK+Wjo4xWHh//qI+vvbB8rVzwNRUI/7zHd47ecA+8Pv5qc6S4v
         JgECXBJ9FAzSD+7Vytsss1z4MnMQ65XeBtL3Ozf/wAaVBvs6p41ytirO7d+ihjOPvg0c
         oGoTa7KFfhjG8UuQDCyO3jHobV0KCR4CM0s1NueCpwoAzmgnRgx9virfdk8+XgiOP0Jw
         POludW+NJN/mtz27W1J9UJ7eOQll6UjaQHUKLTwvGNNAVLseunJoJMsZ7Hggxn2EY7RT
         HsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762230858; x=1762835658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdfOwLNIHfmUYwhYC8FV9uLqNGHnjHoIFBGLUu0lSkI=;
        b=H4+xI2Iin71CE67apnseQjWZiFkV15S0aaIEgCBP5TISQo/o2OqU1QtHyqGsQXk3L9
         2PhuglO42ZLJuu0gikwb4t/9zHHo34o0fSTtL9BhJnevO9tVHMyFZl7Zl96ZdPGukmlV
         fa6UUnZ3YNBVg8X7+vi4X66IYnVwJHTzBuFFrT9U99VLcNzgBWFu6wzHP9B9pEY2Ekhx
         p2Kti/JGlKrJeFjiZGp/n6+1V49SyUzz3U/dQP0NjsTnQccNbYlWiIZ78aceO1uHVyyL
         J805aV8rMdBXSWsjfTVT/Cmbw2gHfLi+L3o8NqObgXLpMcF9HzVkWSQ0P9XcZpah7gkH
         k+1w==
X-Gm-Message-State: AOJu0YyGx6hV4RSL6CMaRpvwNnJ/ICLQ8leN0jrSSj8++fTy3DTF5bGq
	9Lfv80ZMXhT/gn7wZZTgY++AU4J7JumUgtJrbtSTqABpFW7JkTsc3nMnEouevz6j
X-Gm-Gg: ASbGncsmDl8TGJBkCsdKEYiqD7D4NOzpKAcgW03AO1TFSSUc6y21NUN3WWBqHYANUP3
	0qnuXVOpwxwz47Zt35kV0eDpvILpAWDlXaONLofZh0DmqMdSBBahgaTnHCYsSJWTxHI8V5+fl8z
	FpyflbjpIe4Lu+wPn/sMr8nwg+g4qVwcZJTM3unAwEk4+PKvfhJHi4wdERoviuqtDkyUib3Bb0Z
	JoPkTnVuFePbvQVOuz29zLo0G74gLF3ziIZz6GSqj9f2e+1oUYRRT2hOPu4RxQ6M00SXA0lo93K
	fBBx1oRAi2W0Z+7Ox5iGCqR+sLatkBnqzqvK5TlrIp5ZixVbtCkMo8IlrcOcAZnj/mjzLsqMbR0
	I0A5QL6B/hlf/TZt7TQn1a7+Qm4mFAvj/2GHUmz5ffsG6qvU725yapo9rkHwwEOuEmIBZLRUCQV
	4LMEyUMiPVdWkEBw==
X-Google-Smtp-Source: AGHT+IGoXCfZYuPSr2FIWwicm2vsFAjYIg/CPcn7wq31VCNcU4y9GAzNQSvOFdQLMClkQVpCSZjKlg==
X-Received: by 2002:a17:903:1ce:b0:27e:ec72:f62 with SMTP id d9443c01a7336-2951a35eb36mr206233085ad.6.1762230858220;
        Mon, 03 Nov 2025 20:34:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a74214sm9147025ad.97.2025.11.03.20.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 20:34:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v2 2/4] iproute2: upgrade 6.16.0 -> 6.17.0
Date: Tue,  4 Nov 2025 17:34:04 +1300
Message-ID: <20251104043406.1086244-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104043406.1086244-1-ankur.tyagi85@gmail.com>
References: <20251104043406.1086244-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 04:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225708

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ridge-avoid-redefinition-of-in6_addr.patch | 34 +++++++++++++++++++
 ...{iproute2_6.16.0.bb => iproute2_6.17.0.bb} |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.16.0.bb => iproute2_6.17.0.bb} (95%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch b/meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch
new file mode 100644
index 0000000000..5315358024
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch
@@ -0,0 +1,34 @@
+From ad944bd173cacc098f224e7db7248d7210821fca Mon Sep 17 00:00:00 2001
+From: Yureka <yureka@cyberchaos.dev>
+Date: Sun, 12 Oct 2025 14:39:47 +0200
+Subject: [PATCH] lib: bridge: avoid redefinition of in6_addr
+
+On musl libc, which does not use the kernel definitions of in6_addr, including
+the libc headers after the kernel (UAPI) headers would cause a redefinition
+error. The opposite order avoids the redefinition.
+
+Fixes: 9e89d5b94d749f37525cd8778311e1c9f28f172a
+Signed-off-by: Yureka <yureka@cyberchaos.dev>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=25b2834cc974729229afcd308f127995405f85c5]
+(cherry picked from commit 25b2834cc974729229afcd308f127995405f85c5)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/bridge.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/bridge.c b/lib/bridge.c
+index 5386aa01..104f5858 100644
+--- a/lib/bridge.c
++++ b/lib/bridge.c
+@@ -2,8 +2,8 @@
+ 
+ #include <net/if.h>
+ 
+-#include "bridge.h"
+ #include "utils.h"
++#include "bridge.h"
+ 
+ void bridge_print_vlan_flags(__u16 flags)
+ {
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb
similarity index 95%
rename from meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb
index dc7106902c..59e8a7311d 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb
@@ -13,9 +13,10 @@ DEPENDS = "flex-native bison-native libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
+           file://0002-lib-bridge-avoid-redefinition-of-in6_addr.patch \
            "
 
-SRC_URI[sha256sum] = "5900ccc15f9ac3bf7b7eae81deb5937123df35e99347a7f11a22818482f0a8d0"
+SRC_URI[sha256sum] = "9781e59410ab7dea8e9f79bb10ff1488e63d10fcbb70503b94426ba27a8e2dec"
 
 inherit update-alternatives bash-completion pkgconfig
 

