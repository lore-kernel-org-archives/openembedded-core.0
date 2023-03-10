Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65707C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 09:54:38 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.15611.1678442071133061892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 01:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CL4kZkoa;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id a25so18359207edb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678442069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmNA2apU145Tb6HVv/TehXX1cqNX7UgTk4nwrin/fZA=;
        b=CL4kZkoaICFdagc53AalkAFmB5RkIxWm2LINCd8CZvGpNkI9FZ9IHi5JPhT+8ZxwOJ
         Agu4eaot5TH34bOEops3qFHvhNHQdYQ9oezk6gSEbsnHdy7sgMLeW9IaCESehO3y7icn
         Pfa//iRPTdSTUKStQl/5FrE9tYNwl+5RMmA2prc8V2iwQDjuFi7LDqQOba+LodPYA7hk
         yAuIAe6YXA2e3pQX75ZE64QE27vdpnBFE0gHzxVD9B93Sf+pR36ok5lEC6PLHEasW+on
         gCfehCJT53xuIYR68oSjT9rOydRP3J2q6NEVr92tvExeTzo+jiCwdrgtUmJQFo63KCHX
         rZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678442069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmNA2apU145Tb6HVv/TehXX1cqNX7UgTk4nwrin/fZA=;
        b=Dw6T4tAUja13ULxx9Fjhu74qSZL6EBIpFOdjelUDstRQ9Uvs0mJG//b2of9fpwpW0v
         fiV3WjcMWSac90utOAl0PY79D/ns8IlvD/9yrnF50eT/vVLhBdaN/ZWcYSf9iCZHCDDc
         +CLL8FshrWk1mXiaLA0WV7r+5+SAkMJBZOjbyYiTkagUWV0ZpmVX9it/iVGD2s05QdmL
         oktj0HNlLEUb7B2N7W0qJlAQOEZryF3J4YrKxrjDD+8kXGE2KtnNeNq5fuuiFV4hMg2N
         +vebRvWbUtSo+FCvBPvBYY8MbTdHKaY+Ysyv0Rd0Rz1oDOTW9u5XQ1eDfv9HfAvSxGiH
         B+0Q==
X-Gm-Message-State: AO0yUKUUCXTLvxiBzwoVevzhjquF90HJMjbp0DR3a0SJQ6yi8YTZy32U
	zueXamhCNtKC3BhnZKeTsl2mI5ShQ7M=
X-Google-Smtp-Source: AK7set9d5UsodyCp8A/U9c0cOG6IPTpXsdFFev0k953WWQvwWvUq80YBE3nKf0KD4bByFEnc7c2fAw==
X-Received: by 2002:a17:906:1411:b0:8b1:779c:a8ac with SMTP id p17-20020a170906141100b008b1779ca8acmr26060122ejc.13.1678442069397;
        Fri, 10 Mar 2023 01:54:29 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id kq10-20020a170906abca00b008c405ebc32esm759549ejb.28.2023.03.10.01.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:54:29 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 1/4] cmake, cmake-native: Modify download filename
Date: Fri, 10 Mar 2023 10:54:16 +0100
Message-Id: <20230310095419.3487056-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310095419.3487056-1-zboszor@gmail.com>
References: <174B040A85AB843D.27660@lists.openembedded.org>
 <20230310095419.3487056-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 09:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178316

So it won't clash with python3-cmake's download filename
from pypi.org which obviously has a diffferent checksum.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/cmake/cmake.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index b7e674c4c4..9005255a23 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://Copyright.txt;md5=09069e0fffe4e5eaf6dde04c3b1932e5 \
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
-SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
+SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz;downloadfilename=cmake-src-${PV}.tar.gz \
 "
 
 SRC_URI[sha256sum] = "c026f22cb931dd532f648f087d587f07a1843c6e66a3dfca4fb0ea21944ed33c"
-- 
2.39.2


