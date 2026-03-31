Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FE710F92E6
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 17:23:55 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.393.1774977824656172449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 10:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DmGdGrxp;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so3059525e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 10:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774977823; x=1775582623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Cz+ql27+TAMxQ7W2rDJ8i8SOoAz/6l9Lsp06kGGjq8=;
        b=DmGdGrxpY/rudxPMsD3VtSrAH5+bKSE3b2hnvx2P0bJvI8SYDie7HF2ZtD0dDXrGxn
         gIXZhkuK928YRb0NBZvtq5Si68gVbbrXBu53wvF0fKP0ve6Qx9xkOCIkv1zWHqQSEUQw
         UdjAQqc/9YKyxoI6FwFuMOJxRYGktuxExMw7aHXxaxd7y7GoVs92EKYu1E7BV5llP+mI
         CvLXzX/sONgxbrdOKTJOfu7yuAcCLfSRoTXA1hxY8V557dy/S9Y2DrhhX4xnijx7WPpi
         PiACcGe66o9+n8N8oRdh2Q/o3hbCCBnGn/nNpLH2mfFgA4k49wYZhTYFXMzWSV39y7Uu
         kU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977823; x=1775582623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Cz+ql27+TAMxQ7W2rDJ8i8SOoAz/6l9Lsp06kGGjq8=;
        b=FFvOxM0yiDFk7KN0/4zeyXOk2qbk27eoGdgnz5orORAVdd3/GLJ6GQmlY5grwsvT3X
         gF9Ss0zhVQ6IJ+wPtYhj68zvyKz3NKdqmuMH45cWd8FJz721qIOKY93G5zjwfXiSg5nx
         ko57cgGC60YWoBkGK0n1AOwi/qpGpJK+K+uEjorInw4TVmrfaCua+fhyNJMhXX1+wudU
         SejyrnplvwZfqZTXxEwYBPO82nlmYWbKfwm5QN+PbxWDUOld9gT2Tp7Ma7bJ9a299WCy
         uDLvAY0MgCdPhF1FyFb5tbw7P7NOT6IF4d1fQtTFKb4B5YyZlEtDiM4dezioW6tDhZWa
         h7lg==
X-Gm-Message-State: AOJu0YySdfe2K1PP/sfD2OY6D97EhuM0V27L8NDoJzWdJTijRD+665wJ
	MEnP7P9l1jLQ1Xl8IsoehhZWDmvK1jiIdqAKegLS5WaK1BV0B6PQB6aFfs0bKJMK
X-Gm-Gg: ATEYQzwFAQxHNTiLooAxfPGHv5EuB1sRen0PQI1w2JWRak/3r2UBLZSCvGwJM9Vxzyh
	ksIIdddcTA+LudLbXH0Rq3066u677DYPsoeQBkXuDZoryE/q1k7CR+6gFKpNiZWvjkxwID7Cc++
	Uw0WFZbL6BDMdMjOpU7ldtvCrYBghg2p8gU6d0atewaU11eUOy784JB77/7AxlqBnt/uell5JaY
	hDzM1Oz2VOtd9UhNcnDYu8SHme6kDnztofCW/54x9r97p0H5OclJk258TqrnaYK/bc6y0IWY+xe
	aOHzCJeUR8VgeY5kYi4bynh9yN5eGnFsl3SSD0lClZIod0Lp8G0h5q6G9rMrSe0cAJSb9wWCv11
	saU6MDBLhc5atXGK8BX5/6WSY/bPbqD3UF+mKTmEtF/I4QWWv9T3ExKc2sojyxgrIhAbWYws/G7
	dmyuj9uDb6bgAAIc21YCYL3GCzOJlfN2s/U+roVlVl2w==
X-Received: by 2002:a05:600c:1f11:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-48883575caemr3685325e9.7.1774977822309;
        Tue, 31 Mar 2026 10:23:42 -0700 (PDT)
Received: from toster.lan ([185.228.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e86ecf6sm49253475e9.14.2026.03.31.10.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:23:41 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>,
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] mesa: gallivm: Fix armhf build against LLVM 22
Date: Tue, 31 Mar 2026 18:23:17 +0100
Message-ID: <20260331172316.422197-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 17:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234305

From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>

StringMapIterator<bool> became StringMapIterBase<bool, false /* IsConst */>;
Use `auto` to handle either case.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 ...livm-Fix-armhf-build-against-LLVM-22.patch | 30 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
new file mode 100644
index 0000000000..dfa2e86568
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
@@ -0,0 +1,30 @@
+From 973dc32026c164d0c13f7f5bef36c8d1c2375973 Mon Sep 17 00:00:00 2001
+From: Alessandro Astone <ales.astone@gmail.com>
+Date: Sun, 1 Mar 2026 18:14:09 +0100
+Subject: [PATCH] gallivm: Fix armhf build against LLVM 22
+
+StringMapIterator<bool> became StringMapIterBase<bool, false /* IsConst */>;
+Use `auto` to handle either case.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40161]
+Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
+---
+ src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+index d3ad342..c95d86e 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
++++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+@@ -331,7 +331,7 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
+       llvm::sys::getHostCPUFeatures(features);
+    #endif
+ 
+-   for (llvm::StringMapIterator<bool> f = features.begin();
++   for (auto f = features.begin();
+         f != features.end();
+         ++f) {
+       MAttrs.push_back(((*f).second ? "+" : "-") + (*f).first().str());
+-- 
+2.53.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6ee8d87c4a..c10851f980 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
+           file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
 "
 
 SRC_URI[sha256sum] = "ddb7443d328e89aa45b4b6b80f077bf937f099daeca8ba48cabe32aab769e134"
-- 
2.53.0


