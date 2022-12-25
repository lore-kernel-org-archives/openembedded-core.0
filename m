Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C314AC3DA7A
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 21:59:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.126061.1672005581919184740
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 13:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AOPrJ5B+;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id fc4so23037506ejc.12
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzPYvHH0H6FWllOARL90mGJTxxCwr18B2lHzq+Q9z88=;
        b=AOPrJ5B+xbSjJg+NShkeKGAh/6M8c7WCFJvfJ6kkBH7yrNXDLAe0qDK3yL9JfKZ0dV
         5wHVGY+RtPnQT5999yctxHAo8lbk0iLSgXKfOd8cZ5DGfM/DsvbrkM6Vv73rcKpdatY+
         bGOa4BF/UWprAPAQweG03BlNObbpPEqjqVFb0tMi9bMN/tlWvAWUmXPNuxged59Teym+
         fm+svrOrpDiLmuaRZ7+EtAyJPy6l0HP4dApZjU9ucHVDEuPGrqUAjw/11tgJLJuuU8W9
         LP5aqPwQ4JXQlzfGnWx2CVYKvuZxYql8jFWK+ByUnSi8tXnUDiZeJ+rxI5EgZg+X3teD
         1e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzPYvHH0H6FWllOARL90mGJTxxCwr18B2lHzq+Q9z88=;
        b=xd++/sDUQIJpfrDAliKqcVy9VSTV6f0zk+QImxvpsSUT/ZaskZVrjcQ/cFYt5TbtiK
         xdVw40Lzro5MfATrBW/qKULfbPxbfdWHZiMXv9JIj2IIEMagvTl+8Pk7Mri+802dz6do
         fzzrjbGq5VPQVmk4CJ/Na0WhSA8dF5pGvO6gy3nCLKKrgGsqjQMQ73HCDcbbNSv455Kp
         UxAbxWm8Mj947RVeDFMNn5ZCMLgOFD6dCkPvePeHI5e+8O7mehWi7GOeH198KGsOzjJg
         YlKZLjMmQXWCGjxfi+5F7x9z/2Jl4OL8RrsOIJHlATLhuivaJsRTT3fGu1Udf+eSQeNK
         jWdQ==
X-Gm-Message-State: AFqh2kqZh8JEKbAMdxA6jN8ZbaXXwfX1VPUy+OBErZIRrXGi1jOAK22S
	DCVzOFvCUR8bTWKJz3M/Hl8/GiFxSbg=
X-Google-Smtp-Source: AMrXdXuu5VyD5cMb1OIJf8VFmCWzj480BNA9nmMd82MBqIEy16MuWZkFtOewL8QcPJ8wdWxSktHE6Q==
X-Received: by 2002:a17:906:99d1:b0:7c1:12ef:bf52 with SMTP id s17-20020a17090699d100b007c112efbf52mr12642084ejn.3.1672005580184;
        Sun, 25 Dec 2022 13:59:40 -0800 (PST)
Received: from localhost.localdomain (42.93.115.87.dyn.plus.net. [87.115.93.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007c0f2c4cdffsm4066487ejk.44.2022.12.25.13.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:59:39 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 10/11] packagegroup-rust-sdk-target: Add cargo
Date: Sun, 25 Dec 2022 21:59:20 +0000
Message-Id: <20221225215921.12868-11-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225215921.12868-1-alex.kiernan@gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 21:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175005

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
index 334b24900b4b..59874c4c2c81 100644
--- a/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
@@ -10,4 +10,5 @@ inherit packagegroup
 
 RDEPENDS:${PN} = " \
     rust \
+    cargo \
 "
-- 
2.39.0


