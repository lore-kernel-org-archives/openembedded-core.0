Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F72C433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:41 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.4001.1637788480319975354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NwB1ioBX;
 spf=pass (domain: gmail.com, ip: 209.85.219.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id bu11so2686202qvb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HBXYzIcDbWfSZ9MC8xvyz+u2DWcbab2XOL/C6LGV8Fk=;
        b=NwB1ioBXtwHjESL8xBFxoO79+I87dnDtMBXzwTHOVjM4ciEVE3UpaB9ATC7jgBxWN0
         9Zy/+33HldhaVF+WCRP4tGEYm1xoj+VythoiRl6s/P6VfSq/9wsRmq43IF20uNJuByt8
         0wlC3tL7JjzSQB6BFZH2TFn0w1SmVq+eyVaBCT1++QCV/qn7to1N0TM9rVyKatVyLAaa
         99oGohJEDbAbsQDJfLQVgYKw0Ri+OeLFLA7nJaETsxKquhn3h1Cvs5pibDAfngSgMfBt
         xRjogKMPjApR7CmaP3z7p8XejoypxV/OJPL5VrF+f/4DYi4W4lTphZOUG+JvUvy7IqfE
         j8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HBXYzIcDbWfSZ9MC8xvyz+u2DWcbab2XOL/C6LGV8Fk=;
        b=UqxAQQIFYRJMmapdkWl09liAlfK2S2I0uJlNYUu8JzEfB6EnRrLBJ8/RcpYSnY0u6n
         lUYZuYhDy/iihzMYigSlyQ/GPC4bBRkaouOfDi6B7pOHy+pZWuux54Gf5NqNYXdSn4sN
         u7r/nFPKWHfdSEV4F8AJIjVf+7GRNWQj2pn359jJlQDVKhGEFYY+zfOMqfWjK2NDh2DH
         cXG65eKdTf5nY/TeQK6UK1cA9xVg1qN/3wDqei9lnKGwsJmpK2H9zcKH8Y9iGvzV0NGL
         eqzPpjyi1z4OHCT58/m08dO/3ZNt7DSqkddAgB1q/8rUFZ9lqr96MleYZDay6ObYN6KQ
         xMhg==
X-Gm-Message-State: AOAM530l5/G97Zo8sYop0fwBKjvggmFad7nSs74+ZaRQFAdvfkzovsxR
	e8+jy5sa/yfub2IFdsjzmgs=
X-Google-Smtp-Source: 
 ABdhPJztYkxhhEyi0do6ssROFXsbptDlb/BmGTavD5WBjZ8D69nLPMDwn2/wkA50DFcO+gekiiZPPQ==
X-Received: by 2002:a05:6214:2482:: with SMTP id
 gi2mr11369972qvb.59.1637788479426;
        Wed, 24 Nov 2021 13:14:39 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 11/20] python: import pyrsistent from meta-python
Date: Wed, 24 Nov 2021 16:14:17 -0500
Message-Id: 
 <bc9fecb4605b7ed14d931d179854fc94ada18d8c.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158757

From: Bruce Ashfield <bruce.ashfield@gmail.com>

pyrsistent is a dependency of python3-jsonschema, which is being
imported to support kernel device tree validation.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-pyrsistent_0.18.0.bb            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyrsistent_0.18.0.bb

diff --git a/meta/recipes-devtools/python/python3-pyrsistent_0.18.0.bb b/meta/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
new file mode 100644
index 0000000000..0b4d2564f6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Persistent/Immutable/Functional data structures for Python"
+HOMEPAGE = "https://github.com/tobgu/pyrsistent"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.mit;md5=a4b94c2b800b582a8d3925a9939cbf44"
+
+SRC_URI[sha256sum] = "773c781216f8c2900b42a7b638d5b517bb134ae1acbebe4d1e8f1f41ea60eb4b"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-numbers \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


