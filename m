Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85869C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:29 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.9109.1647518248201564116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UIM+eD/O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id j26so7053278wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9397Ed85prZRJb68kNuoJAND5MgUa1mVHM1vt9C8BVg=;
        b=UIM+eD/OdQXvUrdAkR9V/DQu6Ld5D7poWKfk8BnYwahan35VokntVJBb41SaswazDm
         40HyRJnft4tLUwueusI3Mfv4ChU1wP16pBmCg1kYl5XIx/yIK8v3UZoTfdxEDI8B/hWb
         s/ihZECJLGAK1njlFfKmZJ56wae8TC+UcMspI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9397Ed85prZRJb68kNuoJAND5MgUa1mVHM1vt9C8BVg=;
        b=Ugfv25TVq+f+/EyUvFU5ycaL2iyYCeCgu0C0EeOdv9DZrnKqgHAoc55WQtfu4Up+e/
         MgTXG5ln3gmzcUGI5mXwdd9QeHgJgubGReg/RbNo7l9wAwlWIUyHIxKT+9Jkvb4u+Oa2
         HJviqaNF704iBpXG7PoWqEJ47LUdvwapQCg4i6+2YEifteePo6Xt4l0wRPjslELHycF0
         qvJwf2oPhAPgTdsQk2i9LZp0iGSVI4c0Gc5V7NR2roXRdOTUY8PvdZpRuCYftWX0h/N9
         WHn4xA0E52DoewOvoEu32XtKYWGxwXWaMyTDQHjhBU3soiSgPrC/75RM582dTlWuc2Lh
         e1yA==
X-Gm-Message-State: AOAM531yf11gXOZGcj5sDZ0FjxsIFz2DSOy8jgT8BJ6KmgBANQw2EiUr
	j7zL90ut5LGKp5tR5tg7MiY94o/JKrOZ/xSE
X-Google-Smtp-Source: 
 ABdhPJx3yaA3+QruSwpnafkQN/awVz246Z5Ijn5kufuk51YS4SLueZLJpr3MLvk4JC2Th+j78fJMIQ==
X-Received: by 2002:adf:d1cb:0:b0:203:d2f7:43cf with SMTP id
 b11-20020adfd1cb000000b00203d2f743cfmr3820863wrd.287.1647518246528;
        Thu, 17 Mar 2022 04:57:26 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/26] python3-sphinxcontrib-applehelp: add new recipe
Date: Thu, 17 Mar 2022 11:56:54 +0000
Message-Id: <20220317115700.993924-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163406

Based on a patch from Armin Kuster <akuster808@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-sphinxcontrib-applehelp_1.0.2.bb  | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb
new file mode 100644
index 00000000000..cde0da82653
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "sphinxcontrib-applehelp is a sphinx extension which outputs Apple help books"
+HOMEPAGE = "https://www.sphinx-doc.org"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7715857042d4c8c0105999ca0c072c5"
+
+SRC_URI[sha256sum] = "a072735ec80e7675e3f432fcae8610ecf509c5f1869d17e2eecff44389cdbc58"
+
+PYPI_PACKAGE = "sphinxcontrib-applehelp"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


