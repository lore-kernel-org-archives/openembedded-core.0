Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17CEC433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 06:07:47 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.8455.1636524458022754656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 22:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hVfNIMzo;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id np3so676863pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 22:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DkbPcgZ2Arih32fQ39xQirFrX4CKyuoMrg9eIWIqEOA=;
        b=hVfNIMzoSa6r6gFnNzkhYJpN/2lRGtgR3rf3jpt2186zzKfuJ+c9KJ3VKcuRnpppOi
         U3xqc6TcSH0lur69bTpRicZ/fRfcrAj1a0NER0Wd4eGZhvFPy1rI7arR7O662vOTfSTu
         o1sh475M8uit1GY2x2NQnHGzNCOA0G1qEtnLgfoSkZMTT/RfvdSgtow4rHrDD8EAkHpC
         EXCYJ33C3b7nthOmxzTb3ngMcJz1bopOKrblaxDRCkc9fVlLSQHtXBjBLyk2qe/IcMLw
         bpJMkViLRzKRA51qcO88iTYHIS9elB8v/tgzyiuq8vDA95txRUwc+4GVuTgpchlsPQ1n
         gQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DkbPcgZ2Arih32fQ39xQirFrX4CKyuoMrg9eIWIqEOA=;
        b=AEBcxsvg9/3GiABhuoQUD/EBtU5I4uqnvzzrdjxPRr86s7BHrj0nTRtQ0VKgUw4wWF
         wCF6G8Grgh/nQ6nX5DAwoTWgGIoj8dvNzA1Myw1AlXvGYR7beqIf7dAmWwXw8rf0EdhP
         8fVUCZ12PaZc0XKtjSw0i1vDW93hg4nPRIAwfe7dBrhT3CYO9YXfOveseRljGWQHfWhC
         5yOtqLDy5lmCyllogZalwrKtufk3BjyihCRHO70cAF8OVyGkYmyjgOgSGByGr8AiE7yD
         HvXfbDkIU5iRBN655qeU9j0O7UpTjXy23qC182nrDuElrE9549Fo9knAFKDg78AjdXgS
         BfMQ==
X-Gm-Message-State: AOAM531RseKCrMH7ik3MNBm3fPZFfkf4O2hIIqUleX4tYSjdEko7dQHJ
	HhDGPQ3W0k0KnHCHlfr5gYrt7EJwQUo=
X-Google-Smtp-Source: 
 ABdhPJxyNUoDbT5ofSOIJVcuSTDgoye0h960KE7Snij+SJ+f+e4iFZSjboIsXdr3spI7jGkBEOGdxg==
X-Received: by 2002:a17:90a:1f8a:: with SMTP id
 x10mr14109376pja.215.1636524457225;
        Tue, 09 Nov 2021 22:07:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 ne7sm4267623pjb.36.2021.11.09.22.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 22:07:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Devendra Tewari <devendra.tewari@gmail.com>
Subject: [PATCH] wic: Use os.rename instead of bb.utils.rename
Date: Tue,  9 Nov 2021 22:07:33 -0800
Message-Id: <20211110060733.2342458-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 06:07:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158061

This is not invoked with bitbake context as a result bb.utils is not
visible when this function is called during image creation and builds
fail e.g.

NameError: name 'bb' is not defined

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Cc: Devendra Tewari <devendra.tewari@gmail.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 495518fac81..c7bc2469ab5 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -619,5 +619,5 @@ class PartitionedImage():
                              part.start + part.size_sec - 1, part.size_sec)
 
                 partimage = self.path + '.p%d' % part.num
-                bb.utils.rename(source, partimage)
+                os.rename(source, partimage)
                 self.partimages.append(partimage)
-- 
2.33.1


