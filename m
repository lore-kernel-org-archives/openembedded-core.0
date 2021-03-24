Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.192.1616596822093295201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=psT5anwX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id v10so566587pgs.12
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Oecx9prKsnkaNJjvfO7c1/HOw2Jn3+zR0GwTIpRb7To=;
        b=psT5anwXi57ZdXzRUazj8nnM43sECizODu5Hxg3M+3pL4+prxxfpeANCHZHOMoEkRE
         OY81qDA3stt2IXjecKoKVaQz7gGaEvhtwyMSaQcR4OYggJu4WzIeTWUFm0/xw5dA9UQb
         bIemMY+KAXmbl2rcSDPtFw8g9Dw8Sl1UMYDVW3rTqDcPsm9Q415nSGweQfZcMrgn8vzj
         BigIDdr2LE17hnxU0hzvg1KY5l+V8fUAc5dq0KT+pDmlII/5grNPE3hWjrNPhzNmZBCb
         vzCfQMqpiXpqU/NNm9DL47MeLY+As8T65V88otKW7kEh6YXFfxxVKkQFQDKtJ+WeTU2m
         HbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oecx9prKsnkaNJjvfO7c1/HOw2Jn3+zR0GwTIpRb7To=;
        b=a2DpNyQLP9O4mAuLFWTRzpgDoImnVRibDbLHKKjnYU/+IGvpX+JO9BsRivh7Psf6Ub
         KqOU4yhqMYksUYlba4CO6A0/rKTKSnJlSBPdA2Y8Ow8saQac+i7JDt230p3BU4bJCCHz
         Uz8Wh3qBSIiBRXk8ET3dgChm6muwCqw9miVqWi/0OYS8mCY2KEmsRjs7bHBIsOCgiLSV
         2xfoxoxtu4fWViS8jfJVOUKxvfIiSlJIw9r75oerKY34x/W3HE0125uVJf1yUGKh6fPW
         Lj96QfVf6voQG8IeC9kxPNCXpJR/LNubTK1FRLmTt/gq5mC3NCF1hOBhwaMxc3uTGgf3
         siwQ==
X-Gm-Message-State: AOAM5337vQ6vlrs5n1YOm067buFU5TigV+q5IwQ8+KQtNFv1gJEmk3S0
	Bk1iftpAVc4yeVmsaSKjlZkVfdCFryPs4aLh
X-Google-Smtp-Source: ABdhPJwKhCF23Uqbr8eJNQ6nqW+FNGvCod6yxjPGGz7+oaZ00yTeocbC8iCIY7QMB3F6V3g7h1rkHg==
X-Received: by 2002:aa7:86d9:0:b029:1ef:4f40:4bba with SMTP id h25-20020aa786d90000b02901ef4f404bbamr3487363pfo.54.1616596820893;
        Wed, 24 Mar 2021 07:40:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.40.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:40:20 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/21] selftest/wic: Fix dependency issue in rawcopy test
Date: Wed, 24 Mar 2021 04:39:15 -1000
Message-Id: <d30a90062e29a3069f6e8d9f6d4eadd7a48adf4f.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The current test code contains a subtle race. It is building an ext4,
then trying to reuse that image in a wic build for the same recipe.
Whilst this happened to work, the code is within its rights to clean
up the output before the wic code runs.

Avoid this by using separate image targets instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 590398080e81fb5e2f81e12b8900858837dfe25f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 0435aa29c9..f7abdba015 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -905,14 +905,18 @@ class Wic2(WicTestCase):
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rawcopy_plugin_qemu(self):
         """Test rawcopy plugin in qemu"""
-        # build ext4 and wic images
-        for fstype in ("ext4", "wic"):
-            config = 'IMAGE_FSTYPES = "%s"\nWKS_FILE = "test_rawcopy_plugin.wks.in"\n' % fstype
-            self.append_config(config)
-            self.assertEqual(0, bitbake('core-image-minimal').status)
-            self.remove_config(config)
+        # build ext4 and then use it for a wic image
+        config = 'IMAGE_FSTYPES = "ext4"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal').status)
+        self.remove_config(config)
 
-        with runqemu('core-image-minimal', ssh=False, image_fstype='wic') as qemu:
+        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_rawcopy_plugin.wks.in"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal-mtdutils').status)
+        self.remove_config(config)
+
+        with runqemu('core-image-minimal-mtdutils', ssh=False, image_fstype='wic') as qemu:
             cmd = "grep sda. /proc/partitions  |wc -l"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-- 
2.25.1

