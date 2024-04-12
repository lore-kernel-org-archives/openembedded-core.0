Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3011C00A94
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 11:08:43 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.44253.1712920120875326661
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 04:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G2eQqMvS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-418031b617bso2143695e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 04:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1712920119; x=1713524919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5bzLGWR+RzUoV9e1Xy7Ll3Zqcm8vitGRsihXZpMhRhc=;
        b=G2eQqMvSk07yKvyOyvTqYohjFUSU3av4apevblgMnMFzb0Q4g53YFfEfhLoAA+tVsD
         tmjaJMZYp288N38hO9jscENHdVtI3/2sS087b+E+4Te3wTYn30C+c4m12e29OADVTV/m
         aow4PUNc35/T8+kn7UFaU4c1pKIBPSw4s75BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712920119; x=1713524919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bzLGWR+RzUoV9e1Xy7Ll3Zqcm8vitGRsihXZpMhRhc=;
        b=WIpRYeDcVWAszCNx6U6WeI8v7KktqIwIxHvZQwJefXNFOglBfrothhQ4tRFdg85RVj
         SJOk+j+HHffMnAboqrTPrrlfsc8kmgkSqHlHMVdxu27hvPjOGDCnepmt60QFCxCpag0m
         1EyMEsIusGQubERPJKz1deiHmmiaWutHg2DPZ6xoxTljjjqMvMc/dIBnVHwK3+UprU6Q
         6s2c4AEod8vfin1krW+7yw7gJ9Y/bOBI0ic65bjvI6U8YedLreenKU6WWxXuBnIYHeDV
         mQXURe938uhnc0d6mKKzK/7vpAbgyCqnuKQkeS3Ro9Rl/u3gzJQLhJrUOqjuPcynA4S8
         lGrw==
X-Gm-Message-State: AOJu0YxyjW1t+IFuBlKtbCyjdtTbgJUMlLa+ooscnLGLAE0vQnawMwKg
	OQ18G27zFIOyIx9t02knzcZapNHDp9HW7xYUED7ye7GLuxMj9vQpg2wVrJ5kgGEZyqVh3ZNbhEG
	cJRU=
X-Google-Smtp-Source: AGHT+IFKZRzHyq9VizxN3XhnOhZkYOnk4KeiIb9MTIR7MDJsGxm8+r6D1PriKp+9zxFTBNB5ea7KsA==
X-Received: by 2002:a05:600c:314e:b0:417:f536:f13e with SMTP id h14-20020a05600c314e00b00417f536f13emr1437518wmo.7.1712920118927;
        Fri, 12 Apr 2024 04:08:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:555f:bec2:a7d5:9e31])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c384a00b00416c990d650sm5362129wmr.28.2024.04.12.04.08.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 04:08:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-websockets: Import from meta-python
Date: Fri, 12 Apr 2024 12:08:36 +0100
Message-Id: <20240412110837.2253822-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 11:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198163

For the newer hash equivlance servers we need websockets. Import it
from meta-oe so we can easily include it in buildtools tarball.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc         |  1 +
 .../python/python3-websockets_12.0.bb            | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-websockets_12.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2d1f9fdec55..20eb3a04468 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -729,6 +729,7 @@ RECIPE_MAINTAINER:pn-python3-urllib3 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-webcolors = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-websockets = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-wheel = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-xmltodict = "Leon Anavi <leon.anavi@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-yamllint = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-websockets_12.0.bb b/meta/recipes-devtools/python/python3-websockets_12.0.bb
new file mode 100644
index 00000000000..f89c3b629ee
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-websockets_12.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "An implementation of the WebSocket Protocol (RFC 6455)"
+HOMEPAGE = "https://github.com/aaugustin/websockets"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "81df9cbcbb6c260de1e007e58c011bfebe2dafc8435107b0537f393dd38c8b1b"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} = " \
+    python3-asyncio \
+    python3-profile \
+"
-- 
2.40.1


