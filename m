Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669B4C7EE31
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:58 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.44471.1684310815403940321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=P0vmrJcu;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-309382efe13so238819f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310814; x=1686902814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WN/YYfUGrJ1pI7TUwd5L1XglncB3+LSl4ZsVGPlcKIg=;
        b=P0vmrJcu0l69xJbmbd7/SdmVt/dcZFqwBdnRUk/47cGqcAUyykGDajCH3UlhiRMfIn
         CZwHdeSjKQFxCCWBjI1HbCVFOaalsa4G4fdTiHCLCvnxLF6NsiJBy5ZfySJE0OplyfGZ
         wauEb21RBuL9o0VbqZQf36gwrepImi9cIO2jedPOA0w2zCe07+3pMSyoK2B9/+5PJ21F
         PGAb+wPfAO2XQp89PcA/NDB4KdwrZtK1/fPRdOADocFEBnPwtezIjWxHI81DIw0fKKB7
         dvkmvhEYKPZN9GXiuhCCUkioAafcmB1eojBuTC1lSjshqCzumVCSUsCaDX/oKiiFV6Oj
         72aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310814; x=1686902814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN/YYfUGrJ1pI7TUwd5L1XglncB3+LSl4ZsVGPlcKIg=;
        b=BnQM4jjAij2fPEUDPLvFfsXYpJw/0RN10sHVh3ICUXRrSCAqVM/y69EaaeHcwiqk9l
         sQYOElJ/OjsdQCOW/A5A3+qglKjSNVkTjz6+ZLzt2aElZqNlfXzBkPmiLLel+k3FZ76F
         YLFRWDcGSGiFUqMGIxEgwXnJl1VItfWKwZYPjCozCzg5G2fAith5CoJnqd2SS3EonKxR
         sHlSx7yNPtDNkkL9daDFLHlLx7Cg43nILdO+kIUtm7yXMBvOzYQ5/Kmn5ewiUnRxWJ2r
         +qr5vlIjagQ00LbokIj5kF1rLRGGtgEiOvXfqqw7c/p75JcvMbLCRuQAz/LeOGtQBBAF
         pH2Q==
X-Gm-Message-State: AC+VfDyBDZfMc6wSkqptxyufz10t6uXKrVBGfLzKppe11twlTHdBVMZG
	Lcu3DwKJfhJ+FYwpr1E4IdozZkFdnXcyjcOn50E=
X-Google-Smtp-Source: ACHHUZ4HxBFAyw3DlWEaK70B9VCRqfTJJq6lz6w15HmGCHxzk+Ji1Y/CAGG9ZlcJN8qS+RpS1+Kivg==
X-Received: by 2002:a5d:56c8:0:b0:2f5:83a8:a9a9 with SMTP id m8-20020a5d56c8000000b002f583a8a9a9mr29689206wrw.16.1684310813885;
        Wed, 17 May 2023 01:06:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 11/20] python3-installer: add missing run-time dependencies
Date: Wed, 17 May 2023 10:06:30 +0200
Message-Id: <20230517080639.9336-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181460

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-installer_0.7.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-installer_0.7.0.bb b/meta/recipes-devtools/python/python3-installer_0.7.0.bb
index d7f1e79a5c..9429705b1f 100644
--- a/meta/recipes-devtools/python/python3-installer_0.7.0.bb
+++ b/meta/recipes-devtools/python/python3-installer_0.7.0.bb
@@ -15,6 +15,12 @@ inherit pypi python_flit_core
 # Bootstrap the native build
 DEPENDS:remove:class-native = "python3-build-native python3-installer-native"
 
+RDEPENDS:${PN} += " \
+    python3-compile \
+    python3-compression \
+    python3-netclient \
+"
+
 INSTALL_WHEEL_COMPILE_BYTECODE:class-native = "--no-compile-bytecode"
 
 do_compile:class-native () {
-- 
2.39.2


