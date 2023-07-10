Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C42EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 14:28:30 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.41193.1688999307390903058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 07:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=yxl0v4Ue;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7656652da3cso379082785a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 07:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688999306; x=1691591306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JIpgq7O6E5urFuQccMOJqT8XXQXyGHee9g06qt3aFqI=;
        b=yxl0v4Ue1COtIKjFDnnRNwNixsEFmN2fmoc4SX4TWGGh+q0Y/PP+ZTtdCNnigMA6Kc
         WkpsZ+Kzlrdc614hhVqh7hO1KErSOh/08eFrjy2Cm904oWmJh5ez3jvEQwcIzYRZcfNI
         oKT9F+Yqx3q2LmNKcPepNFnJJHZM6ZiQ+gs9D/X/+p6tuJcRxpxXSO6nkKU/CFYG3nE8
         sJO2siHphAgcEgxxykdrOi7NKYIPIGi5V3DFfxUsF2OlkxIhTVwBC2zdqQjHYIVgj/mc
         B07bEuD51nRxSttHlZZmDKOykA4sc/gpr2kOJl89msfqxuPIsqCi6jRdsHxEdzUZaoB/
         kylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688999306; x=1691591306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIpgq7O6E5urFuQccMOJqT8XXQXyGHee9g06qt3aFqI=;
        b=E5bi7KzoPHCDJuh0nncwguxpPVEQRt1yzxIsALP351xTBLgdqaVIubJDU1Nn4efb5Y
         hNfvw8eOJZD0++o/dhaxKHS8BaeieBvasXC8TMou/8yu44uQ0Hoyx9Luh1wJrOCMrZuD
         hfeArQdz37ycvCdqOad0BZGC4u3ETBhNO1b5H+V+JGB0A6I8l5foKqI8sewVrHGy4DbD
         tVYQW1e/sjyI49MZJF/3TD/vn+zZU+wLrCbt0ak7DT2R7vXS4grp4l24WHGSc7uHyfLa
         AxL8DSHtLiVzhSE1CLbEJI0v6oJknYbXG/oSbTbmzzSmzLZt/iJKS5NMLFdyL8kmfdSV
         nPMw==
X-Gm-Message-State: ABy/qLYD2b5wtpq3cUGmbm8mSKSNTnkzmZFTb8quOv5/28owhaVjzGeF
	SrMTWbI8oaZtic69jufrXraj2kbSc/VvK8AdilM=
X-Google-Smtp-Source: APBJJlEL9axkJhKw9/3vAf7U1XHJnApeNIVLbHD9t8FKVg42HN5QcZ/XRvaQ+ydTTEAzXN7b1twGZA==
X-Received: by 2002:a05:620a:4006:b0:767:1415:f9eb with SMTP id h6-20020a05620a400600b007671415f9ebmr14371595qko.29.1688999305899;
        Mon, 10 Jul 2023 07:28:25 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id v14-20020ae9e30e000000b0076772ab6937sm4869362qkf.114.2023.07.10.07.28.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 07:28:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] diffoscope: upgrade 242 -> 243
Date: Mon, 10 Jul 2023 10:28:23 -0400
Message-ID: <20230710142824.1646924-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 14:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184077

Changelog:

[ Chris Lamb ]
* Drop Jenkins build reference in README.rst.

[ Ed Maste ]
* Update FreeBSD package names

[ Mattia Rizzolo ]
* Improve the documentation on to produce that binary blob that in the arsc
  comparator.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../diffoscope/{diffoscope_242.bb => diffoscope_243.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_242.bb => diffoscope_243.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_242.bb b/meta/recipes-support/diffoscope/diffoscope_243.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_242.bb
rename to meta/recipes-support/diffoscope/diffoscope_243.bb
index 4b0d518edc..a73ad6da9e 100644
--- a/meta/recipes-support/diffoscope/diffoscope_242.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_243.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d858c591d2c8d42b2b29eb6d229408607b1cd8a4e7ade72d0cd002db6d1c2a6e"
+SRC_URI[sha256sum] = "3ce7ff00d72ffd9c904d1d93a4a147208878f56e8f0286073533615689d840b1"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.41.0


