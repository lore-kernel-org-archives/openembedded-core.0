Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD0DC54EBC
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9378.1672830369815591871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GeRwaQ3C;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id bs20so30464763wrb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mOql6FD44ov3GKpLvst//2ANSQolLR1/Y/u1uV9FXQ=;
        b=GeRwaQ3CH5RWsD5ZLJXZ9kuxY10d6SWx+Ix9Z4Q3RknJDji+OXSbu6dZ6rgd9Qz9h/
         xgbymEyIsiQSH2ld9iXEhv9pWINmljz0DL1tcPMF8LvAGBRM6We6Ybu8Gx8Z+K9r2k/Q
         rdF3XH8e5vZq1iF+hVmrXMNfvObEWFgjLuZ43bqbK1yUoc6xBgOSoOVfwuGEQBlsd4zq
         ZsA3ShOrqIcfIzuTSAnOLdSVAHmlrj7NQxNkMHDLaUOCVsKZppIrW3n2uPi+ZMhyX2ul
         780TYSqcXVDwa9u4WtXkYwieSyckn8nTZcpw3CcaJZ26nJHxxFN0E+qjr7mhXLR0KA0+
         d8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mOql6FD44ov3GKpLvst//2ANSQolLR1/Y/u1uV9FXQ=;
        b=wY8Q/fVSPtp3osaQMuqp+4896hrpXy0lo6+HKuCjoXOCE/PmLl+vGu3DpoPVH8cWmF
         o6bqTXkbBRHLwk2s5PXwhiiERma0WTXA+FPPIcBviHVysp1ECC7KeJaiLnOe5n0y/5Uq
         jC/CRIc11pYDl8ygAV8dxE7mBUH6F0z4NVqgF5+6Nt8AoOg0AvNgqj9hxBY68qRoUP7q
         1PxCzh1yr0mGXXBRXwzIIH4R4wnEtAtxzUHVqJHDcYzXIb+cklN52kzzAvmkJ8jrIpHz
         42R6unekVC1FScOVf8Db28qeVDOLwh/6uf15vOvRjbjOyFB4gCBVHkLAtjmwO5RZucDh
         OAXA==
X-Gm-Message-State: AFqh2koJKiwNw6i0AqtEqPegOJQbNwKUFzRl3/P43g4og/nTU/CrJJZ7
	FbHcrA0r7c9TDimyrVKbXRplKdl0o7A=
X-Google-Smtp-Source: AMrXdXuNHxmQnbq3xHZoTjKe9iWWZtMeRMRl816c+njr4FhqJSu3YRKxaT4E38TENkrylLHQ1bvTJA==
X-Received: by 2002:a5d:5645:0:b0:289:552f:ed1b with SMTP id j5-20020a5d5645000000b00289552fed1bmr17552143wrw.63.1672830403150;
        Wed, 04 Jan 2023 03:06:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 66/77] nghttp2: upgrade 1.50.0 -> 1.51.0
Date: Wed,  4 Jan 2023 12:05:37 +0100
Message-Id: <20230104110548.2537259-66-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175451

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../nghttp2/{nghttp2_1.50.0.bb => nghttp2_1.51.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.50.0.bb => nghttp2_1.51.0.bb} (92%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
similarity index 92%
rename from meta/recipes-support/nghttp2/nghttp2_1.50.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
index 66311b2edf..fc1a592200 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "af24007e34c18c782393a1dc3685f8fd5b50283e90a9191d25488eb50aa2c825"
+SRC_URI[sha256sum] = "66aa76d97c143f42295405a31413e5e7d157968dad9f957bb4b015b598882e6b"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.30.2


