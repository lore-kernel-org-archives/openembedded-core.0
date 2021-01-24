Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.24579.1611511689262894150
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 10:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FKtP8299;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id m187so8638220wme.2
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 10:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DHjtX/u/WkwpEcnndpjQl0mn+aVKREf/vhXag91UcIk=;
        b=FKtP8299RgcPGbec6f0sHtYk2m9JAVve0E2qi+WsnzWwEWD58UuOmwQFfoPsOOzS0d
         E+L/4FbKZW6qKILaVVjfOKgmo4jZLPzyb+eHCQZfAQrXtEKZ4GsYWbF/HKCDZr8hljnQ
         98QAhog2emVQ2vnSBA5kqMVFm+rOtk9zmVSln7LxL6aolhyMb7LcLv8uVi/VjZCPM6WQ
         XmrgRCd/6S9DUDMgT7CFRj/TilyvWpKv2AAdbeFP83n5WbT8TzXacnHRJee3tH1BE0VX
         kKIE7Hj5xuCwL0djF3j5VM3jqdM9Yh0L8IKny2a5cCQn4GX2IoRB7/G1Ny9Auge3WjIS
         chag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DHjtX/u/WkwpEcnndpjQl0mn+aVKREf/vhXag91UcIk=;
        b=qRbdHMnqVhcdFIiVuCpqe0xIzN3Whs3CkpIMe1hRFFQl83I9THT40U34rbRKYB5KB7
         IjVMW6uzbpGahftuxiREiXeyfNhNsGGjSNWxDgIMy/khqQtPdCYtHvOKxgDXRqVxtq1c
         RGNH5BfNKO0ft0RMJt04eOIfzMDpeCzWArpGne8XNVdY/NEG+JB2PMRC0M45PQbTxilj
         RYeZFZI9NS4i/qn5GCaO4X/NWTsFG2DzYWQExbRwOEFs3VrGsjGpJUVqATtqDTb4Q/oO
         RlfIMdcDqMu2SWU+PfAB7Lcw4DgkWeZRy1f4IEoXlzN99oLp+wNoek3uopxIiv0TVThd
         xKuw==
X-Gm-Message-State: AOAM532FMtydOOB6ham1bzhS3JkvBOsBU2R57FIle2p+zOhqLkTh0+Sp
	sVFHpB8qkOw4O0I7D7WvN7+AD4rwdgHL1Q==
X-Google-Smtp-Source: ABdhPJymk6Ln2JPKths4rEdGCkO3TWM9rNMJ4MqI5muf3KwE+Gf5OYzYLbsinkjwr3GNqupP7mGoZg==
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr3446618wma.53.1611511687893;
        Sun, 24 Jan 2021 10:08:07 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id e4sm7554101wrw.96.2021.01.24.10.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 10:08:07 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 3/4] shaderc: avoid reproducible issues
Date: Sun, 24 Jan 2021 18:07:57 +0000
Message-Id: <20210124180758.1610301-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124180758.1610301-1-quaresma.jose@gmail.com>
References: <20210124180758.1610301-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/shaderc/shaderc_2020.4.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
index ee9b118371..e886e81d0e 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
@@ -19,15 +19,17 @@ DEPENDS = "spirv-tools glslang"
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DSHADERC_SKIP_TESTS=ON"
 
+BBCLASSEXTEND = "native nativesdk"
+
+# TODO: probably there is better solution for this.
+# I don't know any method for get the version of a receipe in DEPENDS,
+# so do this ugly hack
+inherit pkgconfig
+DEPENDS += "glslang-native"
 do_configure_prepend() {
-    # TODO: probably there is better solution for this.
-    # I dont know any method for get the version of a receipe in DEPENDS
-    # so do this ugly hack
     cat <<- EOF > ${S}/glslc/src/build-version.inc
 "${PV}\\n"
 "$(pkg-config --modversion SPIRV-Tools)\\n"
 "$(glslangValidator --version | head -1 | cut -d' ' -f3)\\n"
 EOF
 }
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.30.0

