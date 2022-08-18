Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3747C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 09:17:00 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.40250.1660814212938727706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 02:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=joBY0GkC;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id k9so1031204wri.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 02:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=4R3S3Dp2skdIlneHlrL7GVwQePMLDmc6kVO2QQFX7ik=;
        b=joBY0GkC47XRUB1j8Lz1FaxPJbL4S3iAr+1kDRrZyQ3rQB7s4C83Zc4R4Vlz5j1AWl
         JODLt32YSoCoWTXzaZQxaH2bKvpXII3pTfUuG2vngMzORuV0i5VsqMT44D7kkEz0MBTa
         sjapQ21XLJ+8IQMmjmnGnbRKqVlURJBPtl71rm2o5EuQcIHIhFxWk71dft5213ENaqP4
         hNJnueFrMHeEGeLZAWSMdyqBRtApbp+M1Z5/6NlNoiEvIJVH2k1dJjZGL9Ei7IqSFngc
         L8mnKL/v5BHTm3LswMcPeiwfmaHEuTfJDQWuH2aXpGLqeReQWSu8TSNLWfXD3txWCw40
         jfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=4R3S3Dp2skdIlneHlrL7GVwQePMLDmc6kVO2QQFX7ik=;
        b=dEJmeDQaJCxOi7g6BPySl6Fwnc0SNWwBWHO0lo1ELQppRQ/lImcmxGG2paN290btbE
         xyP4OCHeZfHOChU+n0qR1+++BQlHyqLdj8NCrgf2wf3zKVZQN/Wojk60Glo5tra14CyD
         r91yVLOs/mR5iYwOIaMWM9tCZfQsQ5gv73EyR0Cb7fLRixeca1nUaMGKC/Lc0rs8nRW4
         wKVZVRhZsDrZQVDOYvyK0b0Q07yYvR8dT1wuk7lekdyKFIXM5vsIPUGO3Z4ludwnkUwH
         ESMJMAVMjSCZX3huFGHxCffYzJRnWogu2CHTUT+5rL+xX/sbsOQKvVF1c64pxjpG8Lok
         DcjQ==
X-Gm-Message-State: ACgBeo2x2krCgV3D2t/xjPeLSlKo0e+NgOrl7zWYemV6bOOvtxRMQClT
	1cdCv56yni3/u0WSpVR4jpoqxX4ZJ4w=
X-Google-Smtp-Source: 
 AA6agR5byx8jQoHQu37Ve8Cr0Dql3tjINTFZoiEhmfMBQbXat5TyMZk4frWfVPd9qaWR3hDa6k5lIw==
X-Received: by 2002:a05:6000:1ac9:b0:220:7f40:49e3 with SMTP id
 i9-20020a0560001ac900b002207f4049e3mr1065440wry.40.1660814210966;
        Thu, 18 Aug 2022 02:16:50 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 r14-20020a056000014e00b00223678fe95asm1096685wrx.18.2022.08.18.02.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 02:16:50 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][kirkstone][PATCH] python3-pip: Fix RDEPENDS after the
 update
Date: Thu, 18 Aug 2022 10:16:28 +0100
Message-Id: <20220818091628.201421-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 09:17:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169517

From: Daiane Angolini <daiane.angolini@foundries.io>

Fix the following error messages:

   ModuleNotFoundError: No module named 'distutils'

   ModuleNotFoundError: No module named 'colorsys'

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8beef93e6e341566eba8a125f75ad836ac6a3d69)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/python/python3-pip_22.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
index 09a305edf8..6e28b87ba3 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -55,6 +55,8 @@ RDEPENDS:${PN} = "\
   python3-unixadmin \
   python3-xmlrpc \
   python3-pickle \
+  python3-distutils \
+  python3-image \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.37.2


