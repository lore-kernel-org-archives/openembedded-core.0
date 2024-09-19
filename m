Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D685CF395D
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 16:26:28 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.24566.1726763186603488301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 09:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YAedvlof;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: danismostlikely@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a9b3cd75e5so102054785a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726763185; x=1727367985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V//XbblqTMOWChKaW+/lQwHgZCUM7lFUwfNQUnTbkKk=;
        b=YAedvlofxMD2bDXovVgG/lH23YoMy8K3okhLsq+SUS7AGC62IvCT9BiyBIrQX35y3e
         WrxjsJDC6eGG1q/zrJTdDy4fJlPPVv4ZzJQOLiO6eF86y9YA/v6BeznRpi1aP5lh+VJd
         89JJ8WSFou86RdhuVYUuk6iM72/0zNxnTteV/rrgkyRfW55Iof5fFbxv+w0Dh1PolF6f
         5/sbi/vA+B+PdXr3DoIkUl5XzG/4usyK2KWPBoOUKV/A1Et0go0LKV6u9RDEiJAEIElL
         ImWMHDgDCKPGmtTMuOSDTwfwUzGku2KM8FWlroGsm8oe1amra91IHTxP7GGbqYZlDxCs
         JpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726763185; x=1727367985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V//XbblqTMOWChKaW+/lQwHgZCUM7lFUwfNQUnTbkKk=;
        b=Bm2KvTtNxNI/nyYK9AQiakgW0cmOXG5NK89H4vXgBy8G8xaLfJXk85+8zWiEHODX9i
         4p4dHk0pjQI6R9c1b1dKGCMOSRM5utygGdRXORcnmZMM1HbedNj46+dndT+kB6QtQxFx
         Ac08FbuJcp/HQDz6ROaRXLwGBbc9pGt4ivQuJjS/rldY8BBhWJNyyjuT7rIAWKX3fVUm
         n2p/ge29+ld74Pp446WveoUlDz0Bx0LS7HmnwjKcNnPbH3ORFpISgT/IXuJzfd0J35kZ
         ZOo/8a1mqsLKsivADk41Z1H/otAnLXzNu0AKydqxmyolKcvJCTFHaR/f523y6tt51xU1
         uKGg==
X-Gm-Message-State: AOJu0YzN0Fy+1bc9ZvFF9V1UXUvTII3w6Gt3p5kD8qPXPjF5M4r9smHu
	ijHp92F5U//OCphZb3Yuls/ChmMKPJP0SZ/uQ88neZVjHx5iMjHZfhqcUA==
X-Google-Smtp-Source: AGHT+IHLKPU5VP7gKFxLyOas4YYElJj819BlH9jKcZ96JAVNtT6ha2aji5KVAdjIR5olM7jj7yda4Q==
X-Received: by 2002:a05:620a:4396:b0:7ac:9c64:8ac3 with SMTP id af79cd13be357-7ac9c648b27mr1294748385a.56.1726763185373;
        Thu, 19 Sep 2024 09:26:25 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08bddc3sm88636485a.90.2024.09.19.09.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:26:25 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 1/3] python3-pip: keep pip program name
Date: Thu, 19 Sep 2024 10:24:58 -0600
Message-ID: <20240919162500.2642940-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 16:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204707

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Python 2.x support is long gone, and may tools expect to use pip
by that name. Keep the pip name around again.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/python/python3-pip_24.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pip_24.2.bb b/meta/recipes-devtools/python/python3-pip_24.2.bb
index 1f8aeb35fc8..5e1a467990a 100644
--- a/meta/recipes-devtools/python/python3-pip_24.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.2.bb
@@ -29,10 +29,6 @@ SRC_URI += "file://no_shebang_mangling.patch"
 
 SRC_URI[sha256sum] = "5b5e490b5e9cb275c879595064adce9ebd31b854e3e803740b72f9ccf34a45b8"
 
-do_install:append() {
-    rm -f ${D}/${bindir}/pip
-}
-
 RDEPENDS:${PN} = "\
   python3-compile \
   python3-io \
-- 
2.46.1


