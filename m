Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.5629.1630416645143331946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 06:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RXcIoVQp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id v10so27745416wrd.4
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uT5wN0V+yVOdYgzJlx5jEesa07dhZ7aJfgK1vP5a55o=;
        b=RXcIoVQpVsMPbJV0dirt6xmdRByBoX03WBKw1aVaUeu7TxLQ1PewEsOWlbafL9Uz43
         H4Ifrss9nkAtcA/XaszMsKZtCvMdWdaw2k8h0zZFvsXFfRc6Z+yS+DMPAUNESA+2PWdC
         55dS0T0n+U3GMFLX3JHOjTlLa5XPAFJBuzrcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uT5wN0V+yVOdYgzJlx5jEesa07dhZ7aJfgK1vP5a55o=;
        b=kGRrfrAELmRzsYNS2Q6d49QIInRZvGjHE6OdBS2yKya7iNRTCtydVfB8jxmfDO6+Zc
         mRdaBJv2EHOkr6XyEMgO2tQQQ/JGdIUOhtEgozJyMbHsQyR/Z5GTwfvcGWIPo+l6Rpye
         oA9UQl1DHQiVo8nJTGPfOujMAi3FM7Nmh0QyRlUVHKrHDNK9xUstWYkELxzSZTfw6ncE
         fyO9n3HLQ5aYelWOCTPMKBLjcBBsvX2Qvj6uqaEXVmkDOshlaSpiaJw6blH/NNcmYUYb
         l0dMog/dVIqIlWr+hhkCgM4mbtNLwOraoq5yn43inWzEltn1mFmzUp9D0Fx15s58KIhM
         bCKg==
X-Gm-Message-State: AOAM5320mFgwYBvXPSXIQjq5Plk8EOIH3gK5Ra43Dq4L8lL0Hv+I7Xgu
	NTdD0fuHo2iu63rzk9ayrc+pYlgLVEoz1Q==
X-Google-Smtp-Source: ABdhPJwBgNrOMdLoVkOeODTjXjPQREXBcavx47mSSThp1Uxhqyf9el+rWY4+dKZ4XBFz8uBOqe2VFw==
X-Received: by 2002:a5d:490d:: with SMTP id x13mr31032681wrq.412.1630416643226;
        Tue, 31 Aug 2021 06:30:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id s12sm18684062wru.41.2021.08.31.06.30.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 06:30:42 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel: Use unexpanded EXTENDPKGV
Date: Tue, 31 Aug 2021 14:30:42 +0100
Message-Id: <20210831133042.867604-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EXTENDPKGV can contain AUTOINC so use an expanded form in the variables allowing
for later expansion during packaging to avoid race issues over the variable and
the build failures that can result.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ab60e060c6e..d13c38fb026 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -92,18 +92,17 @@ python __anonymous () {
     kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
     imagedest = d.getVar('KERNEL_IMAGEDEST')
 
-    fullver = d.getVar('EXTENDPKGV')
     for type in types.split():
         if bb.data.inherits_class('nopackages', d):
             continue
         typelower = type.lower()
         d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
         d.setVar('FILES:' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
-        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s (= %s)' % (kname, typelower, fullver))
+        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s (= ${EXTENDPKGV})' % (kname, typelower))
         splitmods = d.getVar("KERNEL_SPLIT_MODULES")
         if splitmods != '1':
-            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (= %s)' % (kname, fullver))
-            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME} (= %s)' % (kname, fullver))
+            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (= ${EXTENDPKGV})' % kname)
+            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME} (= ${EXTENDPKGV})' % kname)
             d.setVar('PKG:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
             d.appendVar('RPROVIDES:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
 
-- 
2.32.0

