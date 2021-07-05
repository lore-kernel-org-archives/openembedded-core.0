Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web12.548.1625524598776748405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VXA0swcq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso19701874otu.10
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VaHKmGEQ7wB2V7dmk4su1PwsA3erJgCLBcn0rXYK+Ns=;
        b=VXA0swcq40vqoZ3Zw/oh5mr16KSQvNG8RT+HSUr+GPSYowdy8mo7kXGC9nTP4q4NkC
         zaNL0fAvpOK/AuDKm0gaXSFKn3CLL9jkt+w8LU8niWaQUHhaB+Vv55lumgMdhXyQk8PG
         6jGtGd4C6hLVkIRAZtBmnxUlHOy4N6Ya5kLqgffHgcVer6LHHIgaff2QKCsv1rdzfBTr
         JgsBQMJwLtslGsilyqw25ngBwTkzqwQRy7WXVb3ltVHvrKVSSaagly/OqQ9pN8qeGFEF
         g0Ulm8cEYmyfq13On9IS1ZqhbV1vxU/BPvO0leoV+6tZjGT7Rsr9KpO0cHC0fZ0e0Qjz
         fDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VaHKmGEQ7wB2V7dmk4su1PwsA3erJgCLBcn0rXYK+Ns=;
        b=uJbA3dHer9E3J6mQTDOqhlJjmqJ2kDZ0SR4X3te7Xxmecw0cxkhWI/PQKdCwTKgZ8b
         //ngXVLbvPTVbm7S8Xdb0RWqvBmFbGHLNFEUakejmuCJKQICWliXlfGVSSH/WQwZAO0M
         BSMVp1OW0VFrhdmq/1NZjzOTIn8Mb1VCX0WJCFgxekrs+kfhfEoO8gWNdMkByE0q9rS/
         O7uL5eUDfZH3XzKPRIy1lFHe0jdyMPTVT8xgJzALBHArt4C4OqX6Nn2IRYHq13WqcRM+
         woF6xJu9THW88Ra3sRvznOnpmufWHlsa4s3rzeDpubC2IA3Rp9JLRjoXqmQEGB/zK08o
         6hyQ==
X-Gm-Message-State: AOAM5313MCJCx/plUroQeHwlIyYVsUHoBjOyzvBaUIJW+Eom053HlApe
	ZmSzFB+S5KNbOmJj3seL04kUjXGHNzuxYvHm
X-Google-Smtp-Source: ABdhPJzhBmKTIj2ozeEgcUPQLz+/rRIZj0V0hJIUqunz5EfaNK8XHK0W6LdUIPf7gZbZEvEmdJRusw==
X-Received: by 2002:a9d:39e3:: with SMTP id y90mr12811992otb.257.1625524597620;
        Mon, 05 Jul 2021 15:36:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:36:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/19] pypi: set SRC_URI with _prepend, not with +=
Date: Mon,  5 Jul 2021 12:34:50 -1000
Message-Id: <e8d6eda3435226a11f8f31ac1767892c42593a73.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

This did not cause problems in builds, but broke some devtool
workflows such as version upgrades or checking the latest version
from upstream. Tarballs should come first, not the patches.

(From OE-Core rev: 5cee50c25197102658e0689f635b2d567a375471)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8f17b8bce85efb0e9a7e15d0b98a5cf7b6bd9750)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index 87b4c85fc0..384a209874 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -19,7 +19,7 @@ PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 
 HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
 SECTION = "devel/python"
-SRC_URI += "${PYPI_SRC_URI}"
+SRC_URI_prepend = "${PYPI_SRC_URI} "
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
-- 
2.25.1

