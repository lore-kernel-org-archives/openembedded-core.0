Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDC0CD37B0
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8180.1778224367475417762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=G7Yz+zfs;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44a044cb827so1304660f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224366; x=1778829166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQUgV+M18RP3uOHUZOPyuF2v498jzbbqQI5XTZqO/FM=;
        b=G7Yz+zfsq6OlXDgPaO6fmDr8RIKMuQmWHlGcTzmpB6/Z7HcaasJEeyHIZo2UEeCZ3q
         ZD0Jw50TeX0LE4hbELAZmUArVi7HT6lCZ3QXxXiCbAUult33el3pwJT7oEFPWVUHTTXr
         iNlwHtMR4kz3bhVffT90VJgMwPxpqk0cT4AM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224366; x=1778829166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQUgV+M18RP3uOHUZOPyuF2v498jzbbqQI5XTZqO/FM=;
        b=BJXLr+wGKu2wvuLJvE8me+iA0hIg5BbDNWnPRJXC8VQdBVqnZyWtz7ln4qe8+kznRy
         fJwtNaSEjKi72e/K3Ba7cnrOJ37a2x+gJb3hby56+KFJACJm9gnSBnnn906fhN3ZIWIU
         k3Jso2Nk4bPgC/jkoBOLkXdm1fXkJNGE5b4fhXB2hFIEA9ZP+mDfehQOCVVB0E0FkH1X
         VL8hQxEBewiGOn7ju9uZa5P/eG8S2ZXQSlTKYwIwoxcM69GDLVy+UJdRpBaEuTspUcWI
         14fbUFKGuZa8LM67bTSY2LWyaVz/9fM0s8rZo3yLoOXbVmizHKE/dxr+2Kt2kEDIPaP7
         kyDQ==
X-Gm-Message-State: AOJu0Yxk/pToYFF3uaDeSQHpd4sxF4IibuScMtfZwRBnOicIjqwUx/eb
	A5aT8Qwuvehp5+6xmqt12fJv4h7gNs0RwEvUh7ZDzArbh6LsFxg40Ooep3w4YFJyfgXfV/tmG+L
	8ftTNVX8=
X-Gm-Gg: Acq92OGwfWAAJr5ABx1XSIMQfjVRvVKriYeH+LZZh70JVUUD5BqX0mzV8DoCd27vT5g
	J2lRiGTNqpFighU4T2uWYwCZQzp0hIuWR+sysiOWQr22lD67a5IEOTBETAn1x6LDgG2/wdB8FbB
	XMNdBofKYSzMq/jHpbaneIrwZr+PrJjW18Bz07WbmC3N32uY9d2DGUYFRksvjQrTyuRFd9hQLQB
	AWksVO+o6vX6RIOfJgxY95/BBP6PZYvhtQg30yn/LLmqYe/F6z+dWBZdLy+ZHUdin3q4J2Dg+uw
	H+ZHqQiwuvLoMnSQMtGAro4v2S2s+6RBUuSF+H3UBFYv1ryivmUuzHJmSgfgZvD50chfdJKX3yv
	CvWrQkOTKNe+CbnkUVKDIZ2jrdQ6NY/mNp9ZS/G1V/2PHJPdNezY45ynUJdQIFe0RvbqQ20t3Pe
	9WhPSt7bEbYkp8m19VK7zm5476wxmxq1NCKQDjlyogulPCfscZGRnnl090M6qC1He3xSisEy/en
	swRd2GNyYQ3nv8bL0PmpZ2YTI8=
X-Received: by 2002:a05:6000:2383:b0:43d:7dcf:ae26 with SMTP id ffacd0b85a97d-4515d4d107bmr19067835f8f.34.1778224365557;
        Fri, 08 May 2026 00:12:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 46/52] apr: Add CVE_PRODUCT to support product name
Date: Fri,  8 May 2026 09:11:39 +0200
Message-ID: <81e41469b7f2b455a54e10a534e679e4a466edeb.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236688

From: Himanshu Jadon <hjadon@cisco.com>

apr is tracked in NVD under apache:portable_runtime rather than the
recipe name apr. Set CVE_PRODUCT accordingly so cve-check uses the
correct NVD product identity for APR.

No additional alias was found to be necessary for this recipe.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit bc3803e12d4938e2de514c39bd5d0f011f883ace)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/apr/apr_1.7.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.7.6.bb b/meta/recipes-support/apr/apr_1.7.6.bb
index 8ad3756b3a0..43d5b0bf4dd 100644
--- a/meta/recipes-support/apr/apr_1.7.6.bb
+++ b/meta/recipes-support/apr/apr_1.7.6.bb
@@ -138,3 +138,6 @@ do_install_ptest() {
 }
 
 export CONFIG_SHELL = "/bin/bash"
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "apache:portable_runtime"

