Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.10170.1607002661114580164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VCkQd13+;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id ga15so3509377ejb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 05:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8ctEaqS0RdLPV60A10vVMY94+wRU9k0Pp2SZU3XxVEA=;
        b=VCkQd13+0+VZ0AESZhq9jrdexFxhAc+xtKVKpZCPIO5qW42mDdH0/oQHdtOQXheDRC
         pXR14MVSDxz+AmJppAIKmB/EeF6O5il6WESh/Fp/0vj3t3/xM56QxmXXi4q7E+uZH0/G
         KEL4wQ3MjJICEA/5BPGnEz6J4KpNWXaMwF7Lg6TZxYs2kyzW5L3LboL7gbk5NqSAZbwC
         rLAXFeIZ/tKQeSfLvRVnYHKTb5KrH4lcwojeG/kEj6ON8G4CoNHSjPdV6gDpoM8Pe/0S
         sch9lqFlwxPBT7FXl4Q8INSepmMuoYa0CgGcYu5mDpchNjbvzD2aOZlXeYLj2LM4Tbsu
         qvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8ctEaqS0RdLPV60A10vVMY94+wRU9k0Pp2SZU3XxVEA=;
        b=aeMhiX7pa3ruf1IcAS426wpDYj+9alSLbyTyEwCg+umQpj2eaUPT2eyDg3Gzu4uJ4V
         p/ACVeRfuckJUGBOkcL6ULSw2JoApJ1QDUwh6YouVFQrouqiVIoBOGxGvO+LP1JXLOey
         qVL56Qk261dsegV5Uh7IaMda7iQaYMmK3WemURKpbKtaHRP3vUEP5vaBvoEW+3uyUeki
         PaHfC8Pap4lQoIjR2yZ6d/jwLG+PfXsLhWjbXijBx+LLUpVg3Wq9XnTVFd3KR7w/L0uO
         OLEe817Yfp3SqzIn3RRDb0iHhP5+vQ9tJL4iLOUSpbAVlhC9hkZ8s5++YH9T9obF/1l1
         sHOg==
X-Gm-Message-State: AOAM533fQ5wBU8cxTVmvMWAwhsbKCKdEbEdIPgsVmhj0aKZzy8Pvkqxm
	J9/eUV5AUnoxsQu99BfT2tCyyzoH2dA9BA==
X-Google-Smtp-Source: ABdhPJwuKx7FvCqE/MbtpDYrGXiHMaKOTCC8ZYUzINQ6ZoM6anvjszOxO2Zns4a6+WHpmW+Yb08QkA==
X-Received: by 2002:a17:906:7f95:: with SMTP id f21mr2642558ejr.340.1607002659396;
        Thu, 03 Dec 2020 05:37:39 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id ng1sm77130ejb.112.2020.12.03.05.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:37:38 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/11] webkitgtk: fix reproducibility
Date: Thu,  3 Dec 2020 14:37:21 +0100
Message-Id: <20201203133727.12936-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203133727.12936-1-alex.kanavin@gmail.com>
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.30.2.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
index 58b66c0f66..31370f3239 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
@@ -134,3 +134,15 @@ GI_DATA_ENABLED_libc-musl_armv7ve = "False"
 
 # Can't be built with ccache
 CCACHE_DISABLE = "1"
+
+PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
+src_package_preprocess () {
+        # Trim build paths from comments in generated sources to ensure reproducibility
+        sed -i -e "s,${WORKDIR},,g" \
+            ${B}/DerivedSources/webkit2gtk/webkit2/*.cpp \
+            ${B}/DerivedSources/ForwardingHeaders/JavaScriptCore/*.h \
+            ${B}/DerivedSources/JavaScriptCore/*.h \
+            ${B}/DerivedSources/JavaScriptCore/yarr/*.h \
+            ${B}/DerivedSources/MiniBrowser/*.c
+}
+
-- 
2.29.2

