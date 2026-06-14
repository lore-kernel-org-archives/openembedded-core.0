Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E22CD98DE
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:29 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105034.1781424204472407605
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bVSY0X/I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso1538896f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424203; x=1782029003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zi8uCvCFohNipHW1uNkG5kt2NNBqCV/Ud3IHR4r2H1w=;
        b=bVSY0X/I2vVQwvGbIo3/EfV2XcE05AeKmqtWIrs5eCNoTCRANsWF2v1ODdpG8JEu7Y
         P4m3D4wCWCoxzALP75cWmFoLPlA2oDqaZij0w+1+1Tyh0aMFXYf4xyoCThBZ4VG6fkcW
         6yUY0QgFAmhUn4fkZV4gU/i+pIL77OZHp0GpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424203; x=1782029003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zi8uCvCFohNipHW1uNkG5kt2NNBqCV/Ud3IHR4r2H1w=;
        b=qH/Oovb0ApZTjWzqXnrtFi7Wn4GY4WnJmLcvBRozrTphF5wCv5pphhavLO63FMkOv+
         iZvZ3rRCyhihzn46kmzBR+KH+QLQaJK0zt/BCpgdPjYacklXopBF9TTSZ0AYsI01kdqa
         ATvmetPxygQkvitIlbDaWzR1q6xXbrKcL4vPB52+qcGHYijJ/oEm3s9H44lIHOqfRaOR
         r59h4aZdhIEXFfeDOtybdY0z7uQLYA4sNH5MtfF4dR3fHJbfqyBmxnZ8mVWAK/DdtXSr
         qTRzw0Pd6DkcjHlEnEb3kBVpGWOPzU3n363w2/QDw0hWKbjWcwJk8F1u2CcJqh2KgMJd
         xRQw==
X-Gm-Message-State: AOJu0YwPrDN3gNNE1G8KI/6DvEFuqQUlIlCubXU5nvb1CCTZlh8E16Lc
	IlvroqgySOztFotEwF5Yo/uo1mwalfg1ZgAeiJ2Km4pV5jAW8tK+CZLPMZwSxX3QNYxUG5MY//F
	WjLZq
X-Gm-Gg: Acq92OHfbbws9mD/8QtJ+DuQDaf+Zt7tomhltpG9pbes+SXf1aRvBC7SHyQf74YB4hF
	4uJS8E63O6suOh1SC3/Sl++YVSyk/VoZSbzyTZZYL80vcpQ8Td0pqb50smLR+BUwi58bOn14O7o
	XofkNIhWoMgytshO4o9Xp0lrLrNgWd/Bhbjf7eiElWUdafrAMb5mz+NHxHNQATnJRZoqsLIJcgK
	s7J5j4p0qPGE02GWn+6LN/wQ/TYcJw9JFwTYi/VPZAMj+mtjzwT0P9s6zYLZX8C8VBCM6kELqfS
	rnlNugj/CktZEUOBR3AP0zCVX+xoU9/57BbZY2Kyhecsy8kvCBnDSdPqsPuF7/crz8Kwzys3joA
	39McuirH5e2GihB7BPgGiaccPmKu1Uz0PDPI+HK0m68blVQuQ2FL3jr1OLx4r6EEx/0WaDYvd6b
	8dAEBbyIQbAtDFpOqTW/CGv7MC1TLxgI9AqynBM/wxGM0QI7YDks/OLG6CsU09kLM=
X-Received: by 2002:a05:600c:4754:b0:492:2100:aba2 with SMTP id 5b1f17b1804b1-4922100ac1emr63089725e9.4.1781424202695;
        Sun, 14 Jun 2026 01:03:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/56] python3-pyopenssl: upgrade 26.2.0 -> 26.3.0
Date: Sun, 14 Jun 2026 09:02:19 +0100
Message-ID: <20260614080307.4017177-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238692

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-pyopenssl_26.2.0.bb => python3-pyopenssl_26.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_26.2.0.bb => python3-pyopenssl_26.3.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
index 9660a03f89a..c27f0719d17 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "8c6fcecd1183a7fc897548dfe388b0cdb7f37e018200d8409cf33959dbe35387"
+SRC_URI[sha256sum] = "589de7fae1c9ea670d18422ed00fc04da787bbde8e1454aea872aa57b49ad341"
 
 inherit pypi setuptools3
 

