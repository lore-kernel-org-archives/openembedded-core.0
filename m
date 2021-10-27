Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAE8C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 21:03:53 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.2437.1635368632909496425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 14:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=vW2TE/Lo;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.177, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f177.google.com with SMTP id u5so6905361ljo.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 14:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2H8SvDI5/Jv+qlgve2wxdol6gLCM5mvWDlAfCJe2DBQ=;
        b=vW2TE/LojIyDD5NbJcN+Igelk7fWUfbY0Q/GrzHMz3Drf3x3+QGUdHqPDK/Q44nTyt
         ALLGc08pQQoXiJ1Jm//Tc48EEeYX7bKgfsLS9RIMWtKyt3GTby1i0ofmZ/cpe+xSg5Dr
         2mQNn+Gwk/PBQOW3oueDn3NtUpQOWi/9XgVJC1bBtdFFMaj8q4pqPR91mdxAJzxtb3DU
         LLTSrmtke/31LIM9ENY5eWKSBZ3LTyVdIe1Ds/iEWiqpVnIouIwP7L/2/HPZYBRMneVs
         yVWkqJmPYHDU748d3p1YF6p3dw+Sxj3CGNAyijIMlyXR9qwcicf4/DVDXSpM4jky8ilA
         TNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2H8SvDI5/Jv+qlgve2wxdol6gLCM5mvWDlAfCJe2DBQ=;
        b=CSuqswPzg/+jkRA6xk1lQMfId1YjVGvtol8aVkSOkzfW2bnXq24owT2H6T9UkwXgjA
         nv+/xXdw7OJa+vp8qI0aDztvrAWs0m7K936NlHsZA1RXIAusfY6LKApPqTWmMJ5j5ayn
         QfujKTXRJqZ42Q0+DM0v3zVEqHA9Nh0vbVud9BdDLvmsbQj9XxGgI/tv8tBAJnxJrxAR
         6eHvaTAVs4CNL63hWOZX2OJe8jZ4J2i36pEzxhFfCP6SeVJ5d9JaUR54acqQMW4If8P+
         tCETqGFcn8qy2oN4qdfRrsqLjDX8vWCdPKr4uoayJDPqwvXfcu1+M6EFhIqBS3HLQPvL
         sSNg==
X-Gm-Message-State: AOAM531MM3ZycpX3XBNx8ZttzUW+DjxLJUtrEa71s99TwFvLLSqYuXZC
	RJigKOvdYqmaxcI22LS/+S3uKahC73AE0GbO
X-Google-Smtp-Source: 
 ABdhPJwzKzJdQje7VVqKzh/yhkYYmuhUwYr91aIR45F7fKsQHuDpUmTjHkRsBy5CV52H9btwH18YPg==
X-Received: by 2002:a2e:8109:: with SMTP id d9mr219430ljg.245.1635368630600;
        Wed, 27 Oct 2021 14:03:50 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 v20sm83751lfr.302.2021.10.27.14.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 14:03:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxcvt: add recipe
Date: Wed, 27 Oct 2021 23:03:38 +0200
Message-Id: <20211027210338.3320083-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 21:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157569

This library is a dependancy of xserver-xorg 21.1.0.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/libxcvt_0.1.1.bb                 | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
new file mode 100644
index 0000000000..628ccfb647
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Library providing a standalone version of the X server \
+implementation of the VESA CVT standard timing modelines generator"
+HOMEPAGE = "https://gitlab.freedesktop.org/xorg/lib/libxcvt"
+BUGTRACKER = "https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=129947a06984d6faa6f9a9788fa2a03f"
+SECTION = "x11/libs"
+
+SRC_URI = "git://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https"
+SRCREV = "6fe840b9295cfdc41bd734586c5b8756f6af6f9b"
+
+S = "${WORKDIR}/git"
+
+inherit meson
+
+FILES:${PN} = " \
+    ${libdir}/libxcvt.so.0* \
+    ${bindir}/cvt \
+"
-- 
2.25.1


