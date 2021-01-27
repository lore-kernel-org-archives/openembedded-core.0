Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6524.1611748362710892256
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 03:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iGMvMbWa;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id m2so1301940wmm.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 03:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NSrOYXW8EcLkFz+JtMHcHHG3OsS2o7YSzJxWqc61DuY=;
        b=iGMvMbWapP/W0OkdvNhBw019GCwdxAtxf42Ev3p9nAk4nLuiptiRpF46F2vVaLhBYj
         MKziqxCDLAQR92NuWPEffpjfnny2em2ZjxcPr1XM+Sh9Q1mk1siCDWIbiNrMNtWtjkFl
         srcZT4/zL2BrJMjPrr37EbVr2dnqDamP8Hhx+RnjY5gLGaHounpzi+pm4L1e4sx8L6l+
         yl9e5i6z78HrpGYpqUDRIIRIWKzg+LUmrzimVnqOaEn+UqnyunW4j+Dz5r/glAUfnWR6
         n/ul6w/fNMCj0bzbXV3j6sHXLWnV0QX/3aP2HNmBPbbqdk5tUCg30Xju39nudMeMRZyX
         YnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NSrOYXW8EcLkFz+JtMHcHHG3OsS2o7YSzJxWqc61DuY=;
        b=aDenHmSahNfTEvG0YPjO/MHfzyUgdzQJ7KIcnXfyNbNxeiXjbSDULPBYDO1gx9V3qX
         efIWoGt3KzLuTqnd6SIHn4HS/ZzFVUJQzRc71IcHnv6x5tGF04LfoGI32V5XWPDDr1y+
         Fr+Qvgb7qHirxi6my7g3Vsob26e3fg7wFTFqA2g1Km+oNRYOoB1qSRaW3fLGaSmfgE9b
         rFD1GpmTaMILZjyBCzl6tXv4RLbyGfTC1ZJgDmAbidDNTS2/Eng+SPwVd2RTWdkWMpnH
         xb1fYA3KdN6xytJaPGWvPEw4vJ9XuxyhMyVCORwHDawPoe38s4voERVZLVRagPP7uhpa
         XTpw==
X-Gm-Message-State: AOAM530R2ilInPj6VLIWDHOTRop8f2rNtcOyXz/V/jdIakhnGVa7DmjT
	9Y6nHXkMt8Z27ZcCYZqevvPwC89Jvb19Ag==
X-Google-Smtp-Source: ABdhPJxT16P6EX2ZGLxxYA0m6Tkixkkgfrs96cvwHxBbxFSk6iGoEIBPK1JXMqLT2SCUmOrPcde2Lg==
X-Received: by 2002:a05:600c:215:: with SMTP id 21mr3916316wmi.54.1611748361188;
        Wed, 27 Jan 2021 03:52:41 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id c16sm2570230wrx.51.2021.01.27.03.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 03:52:40 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] glslang: disable precompiled header
Date: Wed, 27 Jan 2021 11:52:32 +0000
Message-Id: <20210127115232.17762-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- precompiled headers have reproducible issues [1]

[1] https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210125-3iawhiyz/packages/diff-html

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/glslang/glslang_11.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/glslang/glslang_11.1.0.bb b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
index 5e53f02b1c..fe21dbcf50 100644
--- a/meta/recipes-graphics/glslang/glslang_11.1.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
@@ -18,6 +18,7 @@ inherit cmake python3native
 EXTRA_OECMAKE = " \
     -DCMAKE_BUILD_TYPE=Release \
     -DBUILD_SHARED_LIBS=ON \
+    -DENABLE_PCH=OFF \
     -DENABLE_CTEST=OFF \
     -DBUILD_EXTERNAL=OFF \
 "
-- 
2.30.0

