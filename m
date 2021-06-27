Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.2767.1624779761177608620
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 00:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hTM36rTW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id n23so9095871wms.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BhRqIG2Q8zMGsUvDWTAas9WIuHV6ZWKKEPssJyTXVho=;
        b=hTM36rTWEluA985fUKnSaTgmsNm0XrqRgUUmf3AoxqcjacflXp+09WMx4bPgrsahCX
         gedbYdJyKXcZFudGhCcjyj6ecsIHjaZv2XiMk46KIwAZHKwHdntTP1kYB1jkd51BKDrs
         czK4LarR9s3hduyyigTrosofOoououRTPI89s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BhRqIG2Q8zMGsUvDWTAas9WIuHV6ZWKKEPssJyTXVho=;
        b=AW4Nz7zZpAbrXhexvrBXHTwuwhMZF8FwdOj3WDmD2aHA2slNmzJwsF1K2jsgkL93mG
         xrwWMDphxcbSj03qGFJ9WM7zQXVDTcTQE0HAwORkOIfLOY6lyN1d4+kedSG47MGdUGNt
         xOqdrLFPAs+zijvc4mus4u1a65ub7HgZ5lp4C4Dvn3zkKbeUn7j5uyt674kPWVH5YCHu
         8l3nOxOIBERuA9J0Eg/+x1Kl+/O/XGSoQOAmP9f9R7odYDyErrTlYYcGyoXkFIShbar1
         ZnjfpyguvyRfC3cxUW3YQQVX3bfhbS7FNAJFSG0UOHIaKfpI3bgItCtWgviLO+zmR3pT
         wc0Q==
X-Gm-Message-State: AOAM532D/FIw/AjTx1joTLayNvix3F+543HY1AYElpjrSwyvJc28bHI/
	k5wFPxmMDAb6MkMafzR3wu3OQvP1eDWPfA==
X-Google-Smtp-Source: ABdhPJyMEquCMDieublr1Xy8+3VCI5YlEbpUnydLNk19eaTFYvh2+Rq+6GFYaZ64hriQnZ0lBF8njA==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr20167037wml.168.1624779759306;
        Sun, 27 Jun 2021 00:42:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:acb1:d8ce:3f1e:5404])
        by smtp.gmail.com with ESMTPSA id c12sm17172672wmr.27.2021.06.27.00.42.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 00:42:39 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] kernel-devicetree: Fix interaction when packaging disabled
Date: Sun, 27 Jun 2021 08:42:38 +0100
Message-Id: <20210627074238.3669890-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210627074238.3669890-1-richard.purdie@linuxfoundation.org>
References: <20210627074238.3669890-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When packaging is disabled using the nopackages class, ensure we don't
add to PACKAGES. This fixes builds where we have an unpackaged kernel
alongside a packaged kernel.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-devicetree.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index d4f8864200d..27a4905ac63 100644
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
2.30.2

