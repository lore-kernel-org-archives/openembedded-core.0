Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C749C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 17:15:41 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.386.1647537340890073161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 10:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E9lfjL1J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id r10so8307987wrp.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xURAktvxNIuR6/cLulCZT5DZp09xDBY6QHyM9rxlqnw=;
        b=E9lfjL1Js3YgBjfL6ASORWVC4p4uBHmQZlp3CuEDmvgXm/d9N/UPq/o7eIpLVfLWsw
         BeQ3x9+SCRKu759b3ey4xB5XdpNvYw8MCKRneO2NM2Ze44RD5VqXtrkS/z+yIF3Udy3C
         spnA4mcBEWHkEpj13KQ8nSz5lrIn9MNHjjCUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xURAktvxNIuR6/cLulCZT5DZp09xDBY6QHyM9rxlqnw=;
        b=zOTxaZ9Vb1FsjtHJPvcdJbvXv6VDwlCXAZtbxw3f2sDXyflss83D3+xVu7VvFQ/icg
         LBu09BlvvOQtglvtWaHI4byyl7e0NFQ7oynjvEgT0OClzuQ/ZdE2I4zA21BRFU+JInDu
         gqTlBH4rOnmL2l9zAn6Fc1Safv6/LJDeLUxgKc/yLVitCa68kVnbzD+y8Q29L8opL1cq
         2pI0IEzoanDz7JM11fkxLpucl2xi6Cu62nqqvt0Egz60a+2XVGUSJO4VRVXAOP0JDLBQ
         pW2T87uT6Mbtv5Kd0m/qHiLAEwEK9rrLoAae17nNpzJSEYkZO4YrF2OHh1InJ/noZlBD
         wJKg==
X-Gm-Message-State: AOAM530+jH4AYURA19Ax7w6OCJyWasftx9LwDxAKxxGeAX0M7fc1G5+R
	uWjS4I+cGpTHMnsP1O1YmmVsbgLLFQ5V+pIr
X-Google-Smtp-Source: 
 ABdhPJzRbRlFblzLFkr9QV5tgiAgo/nSwH1vrP0UHiNYHk0yjs2kFNo9zL3bUZX7KWaDaBLBejVr8g==
X-Received: by 2002:a05:6000:1868:b0:203:732e:6a96 with SMTP id
 d8-20020a056000186800b00203732e6a96mr4965372wri.39.1647537338859;
        Thu, 17 Mar 2022 10:15:38 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm6397093wri.0.2022.03.17.10.15.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 10:15:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-sphinx: Work around reproducibility issue
Date: Thu, 17 Mar 2022 17:15:37 +0000
Message-Id: <20220317171537.1007187-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 17:15:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163428

The dict used in this recipe doesn't write into the cache consistently, work
around it until this issue is resolved in python upstream (similar to frozenset
issues).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-sphinx_4.4.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb b/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb
index 225e7737f60..97ec2619cb9 100644
--- a/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb
@@ -10,6 +10,12 @@ SRC_URI[sha256sum] = "6caad9786055cb1fa22b4a365c1775816b876f91966481765d7d50e9f0
 
 inherit setuptools3 pypi
 
+ 
+do_install:append () {
+	# The cache format of "{None, 'en', 'ja'}" doesn't seem to be consistent (dict ordering?)
+	rm ${D}${libdir}/${PYTHON_DIR}/site-packages/sphinx/writers/__pycache__/*latex*
+}
+
 RDEPENDS:${PN} = "\
     python3-packaging python3-docutils python3-requests \
     python3-imagesize python3-alabaster python3-jinja2 \
-- 
2.32.0


