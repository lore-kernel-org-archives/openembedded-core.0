Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.24466.1611511688475663334
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 10:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cknuYKJR;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id m2so8653849wmm.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 10:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uIBPoMUDkCtWu7emM6Fl/NTsolR1U7MHdU9Q0VvaaJ0=;
        b=cknuYKJRwlroFAGFgZc6Iirs1ObXHqK9beEtDUDCDs8rqbiruct5ZCNOQgnh8eh53S
         pES48Xp5RAEuW8hG5JAg3KM5qbA/Lh9gQrahGFVo/sc3Z4FtBCtTHP+iCApoH5BzqkOf
         gNFa2Fg1PSD8gK8R2Yog2xn5q2eH3OSecczFkAVvDBREsXB7rJbxAHZLMDBB4p/kNUon
         mldR7rnTNtDD2TuvKmKm6YQcjicGXLxqB0xGlreRCiJlVEl8oebS3xymH2dbwVxArCNd
         WMhUjj5GOfwKhypH3AwZ84Dk1DcwZQ1ghMdXpwNTe5dJYZ/RLKfhJ8OPJ7db2WosSpFS
         6GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uIBPoMUDkCtWu7emM6Fl/NTsolR1U7MHdU9Q0VvaaJ0=;
        b=BHFaeou6ohegRRQ7vNN4IUCfy1/YqKJqGDoo6J29O3lRgvSDh9imWrCjyPD/LeEfSD
         hqJvSb1f+p8HCJN+qMAaAGN/oFi3SoA4C+kz3lSLOfWlFce7C2JLoiF+9gyopWtKJEXR
         jzViEJQy2wXo4NpCyuyRn+IewOkIIyiAIHAGmcb6s8g+lxCRrw+xmCBdNq6KT8tKtBV+
         e/7ut5k3sYOSHm03y5zEqJk6aPvyz08X6llFp4j4dpZ3Gsp0hq6PvNNq7cXyQpAWtSxQ
         NUmvK0KrTrqdEL4+QVlLdAwKrxV+7z2fVSC6lofutUbz8tiQHdMjrBIYPrnurEeuoqWm
         EiBQ==
X-Gm-Message-State: AOAM530B5Gv0GjWbDroeTF/zTHW9c5m90AIcsfrQm4QMU8PbJtBJX+N8
	HCA/z7qEeDGDhWt78tCPmA5okLkIAkmsxA==
X-Google-Smtp-Source: ABdhPJxDB8/UDGwtrgmLg7hRyUSCwEF8GwuBpZHOMsG64XR40ys4DAwwr5W6nq4+gAeEtta3CygTuA==
X-Received: by 2002:a7b:cb8a:: with SMTP id m10mr4595264wmi.127.1611511687021;
        Sun, 24 Jan 2021 10:08:07 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id e4sm7554101wrw.96.2021.01.24.10.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 10:08:06 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 2/4] glslang: enable shared libs
Date: Sun, 24 Jan 2021 18:07:56 +0000
Message-Id: <20210124180758.1610301-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124180758.1610301-1-quaresma.jose@gmail.com>
References: <20210124180758.1610301-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/glslang/glslang_11.1.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-graphics/glslang/glslang_11.1.0.bb b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
index f1cc966b2a..5e53f02b1c 100644
--- a/meta/recipes-graphics/glslang/glslang_11.1.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
@@ -15,4 +15,14 @@ S = "${WORKDIR}/git"
 
 inherit cmake python3native
 
+EXTRA_OECMAKE = " \
+    -DCMAKE_BUILD_TYPE=Release \
+    -DBUILD_SHARED_LIBS=ON \
+    -DENABLE_CTEST=OFF \
+    -DBUILD_EXTERNAL=OFF \
+"
+
+SOLIBSDEV = "glslang.so"
+FILES_${PN} += "${libdir}/*.so"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.0

