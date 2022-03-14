Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD61C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.3436.1647298140212192747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GZpbgadY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id r64so2475593wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x47WnRFx2V285VDpGh3fab/yjp9xD0nrcW4jPTD952g=;
        b=GZpbgadY2UGpTZSqi82jhXDbDjz6Ry/uREeAxsqd6gzyrHdQU2XI/z39MphZsVyfny
         +geWmsonzlVacGvszXBfGQo0OdRBQgD6G6mOEXHgitfCj5QVY84F3l6p1isziF1FvSTH
         hAR7laxxh15kOn1ZqHUlFPUbSOrH0A7x2H5lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x47WnRFx2V285VDpGh3fab/yjp9xD0nrcW4jPTD952g=;
        b=lDQzp9hP8dG3xXhu/qi1TJ7PuGIJ7r0FPIFAe8Bj45evmy2vvP/aX9Xem/duWgiASX
         +gkzFQPpURzzybQwKqUhy5KkTqMl1DrcMqrTV0v80GtwQSNrH3xijB8qzgj0ThqeiVFV
         ffYHl6P+e5eqNyeAFCE8p33WHFKx34Z21UjqIsMSMooomQWzWMbl3WKLEVQErQ4KWXx7
         pxeptOGi8cQyer11gRf89aTNsCIrRB5DaXeLZ4EpmfN2O8V/enyWOAru2UsA2DyuA1UB
         m8yj5DEYoHIsik/i3p/IgspWWmLw2I52hRBUIh9ehxza68DRU7OCwhKSQcwen0Kh5ZGG
         dF5A==
X-Gm-Message-State: AOAM531zTtc/aOyDf/VR1YiQ8lZz0ced1W/4Qf2qZ3Rlu2edXIimsaKk
	u4Va3Yb2vszB8h3fzx+uBl2bN0tWD+AF7Vbi
X-Google-Smtp-Source: 
 ABdhPJyhV1VuYCkQnYKsKnmRs7eQ2Y1JpfQYWBt7S+ggzEMe+HqYkcAOiA5Xy9VSvWb3IUBv76CXVg==
X-Received: by 2002:a7b:c0d8:0:b0:389:a221:5910 with SMTP id
 s24-20020a7bc0d8000000b00389a2215910mr962230wmh.125.1647298138481;
        Mon, 14 Mar 2022 15:48:58 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 20/33] python3-pycparser: move from meta-python
Date: Mon, 14 Mar 2022 22:48:24 +0000
Message-Id: <20220314224837.834776-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163186

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pycparser_2.21.bb          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pycparser_2.21.bb

diff --git a/meta/recipes-devtools/python/python3-pycparser_2.21.bb b/meta/recipes-devtools/python/python3-pycparser_2.21.bb
new file mode 100644
index 00000000000..53b7367903e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycparser_2.21.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Parser of the C language, written in pure Python"
+HOMEPAGE = "https://github.com/eliben/pycparser"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c28cdeabcb88f5843d934381b4b4fea"
+
+SRC_URI[sha256sum] = "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN}:class-target += "\
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-ply \
+    ${PYTHON_PN}-pprint \
+    "
+
+RSUGGESTS:${PN}:class-target += "\
+    cpp \
+    cpp-symlinks \
+    "
-- 
2.32.0


