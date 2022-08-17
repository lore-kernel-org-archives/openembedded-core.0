Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B3DC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 16:00:36 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.30630.1660752034753317888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 09:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=TJbW79h3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id h8so10365297qvs.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=4hWdHbF0qUta01i0L3XspuRyqYzmiIFuhEXGbPEn300=;
        b=TJbW79h3fiVGT0AvdaPuGuKNIQI8kvEmes4qknfQbauVzFh6L72O8WNth/ER2fb5Xc
         AXA319Iv/fG8/qUfI9QQUDIcswAnCURZlf02vG3g6atR7HRnYql99MIJaKMtMq3KZx2D
         s2wMYOYTJ0tiUqO7GWdLIkPewMw1s8cy4asanJbLGiY4H1h0kAdX7GGGNSep0kcKzbKT
         w2w6UNN+VMj5MTqLTxa18fWSKMmWyeiqhzzYay4BCeBAa8rJEOsQMKhnq6OCeX/y7KkJ
         yzpxzSuZvqzQO2yeuDZPSJ2PTEjvWMcu7z+633RnD06UhX2DMhJHEEBCcWvpkXEZlCFF
         hEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=4hWdHbF0qUta01i0L3XspuRyqYzmiIFuhEXGbPEn300=;
        b=q8sum4b6dzeNp93DCVfhhpN5JW+Pf48uAN9HOed/uoa0HnvxTXFpJ1FhnSobWeR+Hb
         JMFhixTBEBd0hBk6liekIc63pO89qRNwOJJyp412rfwNmz7OCOcdrx9lXAcNryLIbcbq
         x+5Y6HMfLIrZgtXfR3iiTDUsYi50Gj5OhIOWKo3Pdd3XEjHFY2zy1FnppR2bEQUeKAUo
         xvzxuDxFzOF+cCxmFUzE8VBjsCx3GFx5k4w1fsx0O3ejyE6rYG6stOmZxlAn7Du+XdPE
         9prB8kNRBkeoIEvTE6skNSM00CX2Wi59jBFUSDe7kg+hkxcuHdls8kgshW7knKG44+wV
         aPtA==
X-Gm-Message-State: ACgBeo3u0UFQ+5hCVxAjV1bO5PK8/8YZWtzuucQcEmYAbjqepT7aVaxF
	4SwpDHJshe4fbdyE48yJc33/DnBzPwVF8ozy
X-Google-Smtp-Source: 
 AA6agR5Jtwi6wqrdUS/BIRxvxJZYFptI/g7TNdIB+g0mQ4g5oFS3JXGYUZcHTT5roBEajAa8xrYKAw==
X-Received: by 2002:a05:6214:21e8:b0:476:d5d1:f2d3 with SMTP id
 p8-20020a05621421e800b00476d5d1f2d3mr22944865qvj.90.1660752033124;
        Wed, 17 Aug 2022 09:00:33 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 s16-20020a05620a255000b006b5f06186aesm14346780qko.65.2022.08.17.09.00.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 09:00:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/parselogs: add qemuarmv5 arm-charlcd masking
Date: Wed, 17 Aug 2022 12:00:31 -0400
Message-Id: <20220817160031.1378175-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 16:00:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169492

On qemuarmv5, arm-charlcd is logging an error because the device isn't
present on the virtual machine.  Mask it off, as that device could be
present on the physical hardware (and we want to use the same kernel
config as the real hardware).

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 15dda7947f44..d82585c90e4d 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -142,6 +142,7 @@ ignore_errors = {
         'Failed to initialize \'/amba/timer@101e3000\': -22',
         'jitterentropy: Initialization failed with host not compliant with requirements: 2',
         'clcd-pl11x: probe of 10120000.display failed with error -2',
+        'arm-charlcd 10008000.lcd: error -ENXIO: IRQ index 0 not found'
         ] + common_errors,
     'qemuarm64' : [
         'Fatal server error:',
-- 
2.30.2


