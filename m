Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web12.544.1625524582985833516
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BXI5AZq3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id f12-20020a056830204cb029048bcf4c6bd9so7634661otp.8
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D+h2sLQ1klqp2ofIQU6Vl513wiuvwHdcWsXqxOSg0iI=;
        b=BXI5AZq3BExObNXxzI79NQd8J6lV9iT+cLcK/rcMd0dZN88FviPjgPTnJqZz7bW2Su
         fj2uaLmf6QtidKklNEFu5GGcidce3ys+vqOBOm0rzB0Uq3LhfOeszkA2N6UsN7yR1SIG
         II+QfvSTnrOlcp/+MwHRX5/M++8/EXIYVWBgC+0YUe6ZIkyCmKp0Am+8Va1ExlAAmnEP
         nNwMPOiLT+KpQOJ0nqGlRg/qtSFGrBn6aTdUmCCHDi7S3JxeLiPpnmaaoY6HE3Xeezr+
         oypiTksYM2ABHeioSf43bH0RHUk6CjKj5pR9jBN3TcK99m45dmAGIeGjecmwIWflaXQ9
         kuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D+h2sLQ1klqp2ofIQU6Vl513wiuvwHdcWsXqxOSg0iI=;
        b=cY3Jk++Z6rRJIxw+e6V72gQ7XmUVAMu53HnvGrK/wyaNuSdL3R8arI3671m/DxHup3
         /qjJNmdzH4bK2HF8lKH3O/SGw1JzjJ0xZZnYFRXmUJyt7XP5/r+qvsxz4PLiRJhQ+/qK
         V8DaPeRA1hYPzxbIxxse5XTL9xIjr9T2FBf3XYOO+438PeJE8OpRQMpfzFWDHoZri1s+
         fJRFI3k6OQvdgFvrS12c2ojMgBSiIbOJ8zadkJE04qj3fisrgvdPk4bpBuLOYRnTKo2N
         pExpagki5Lz69wq5kn48QYAEoppMgnr/AoDhJjZIhqkyqWJ9OeToaMEWkfBuRoIH2BT0
         a7Yw==
X-Gm-Message-State: AOAM531RVS6FxVMnHr9HgWCjIRoiJOLergtwNDbfKFBCxwT0vXYhhdUM
	TZ2Aa+bAZGurxg4LFZFrjl+CcKIk82QUqn/M
X-Google-Smtp-Source: ABdhPJzG9vWXgnlznXjcTwE32PtzU+KOBo1VXMxFYiTpf/U8qwdvho0ryGzKUt7Spz6W2TmRSR5pNA==
X-Received: by 2002:a9d:4901:: with SMTP id e1mr12913380otf.103.1625524581947;
        Mon, 05 Jul 2021 15:36:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.36.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:36:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/19] kernel-devicetree: Fix interaction when packaging disabled
Date: Mon,  5 Jul 2021 12:34:47 -1000
Message-Id: <44756b6d92d922873fe1781e2cc1be3031cc5a86.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When packaging is disabled using the nopackages class, ensure we don't
add to PACKAGES. This fixes builds where we have an unpackaged kernel
alongside a packaged kernel.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d6b114cf5a9b22688c0b59a3afc46a07450d87b5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-devicetree.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index d4f8864200..27a4905ac6 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -1,8 +1,11 @@
 # Support for device tree generation
-PACKAGES_append = " \
-    ${KERNEL_PACKAGE_NAME}-devicetree \
-    ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
-"
+python () {
+    if not bb.data.inherits_class('nopackages', d):
+        d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
+        if d.getVar('KERNEL_DEVICETREE_BUNDLE') == '1':
+            d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-zimage-bundle")
+}
+
 FILES_${KERNEL_PACKAGE_NAME}-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
 FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
 
-- 
2.25.1

