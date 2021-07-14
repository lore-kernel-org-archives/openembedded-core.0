Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.5920.1626265576277363591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yb9twba0;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id m2so3018813wrq.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uXjvemldLclxGvcspuX4EeAeQNLGsoEdKyVta6IMDU4=;
        b=Yb9twba0gLtAlZjT5j8XISP/61YzvOM4g23c6YSG9o5hIPwTN/9bp4N8/GLNgQBA3M
         U4DwqM3SF84BRt2FvPX2N5JZ8GqxhjFg4U0cTU36hgW0snBhiAGPape3uvXPO/lqnrsF
         qpdMkacGyfhjxm+rGijO0tUpbR05jXhDZU1M6gCYHPcLQUgdwDEendeszsBkXgOafsX6
         KTMHc144Ki8Rp+eExHwnxDznWPy+ghkM9TplqnAhIOjyKyIl+noTMPNuxRlgTa8kqtxd
         lVtfgGT2p/WfLgkwLbxZRuyqgELyndqzKjvWV1/ipTK9UNTD8YLhikRUu53wCvmY1R/J
         dCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uXjvemldLclxGvcspuX4EeAeQNLGsoEdKyVta6IMDU4=;
        b=c/9gCr+9JgKjSsjbgfNLQi7/pnzZXZP6Zx1kZFe9l5xypo1s0FHJGnQns/F/SaRwC3
         Vj0z/4a8hELSY5w1B4H36udrqlIr21la2uqyr0YKxrg5Rxx8JZRBlBgQq1KwufHpKKja
         4vGlIJTwrbCF00Q1Qdhi6URV0dz5h/jsSU6jAfBy7FHeE6+86sZaaZzbBrlFoJYFHstB
         tkuIhLn+F2UsFSZns0p0EBuJzUGLQ8ttfeN9HmCXiKOBiLTWdG0LLzwrDnKgbNiTRTCa
         34CTKjiIO9j7PUQaj7fMeLPiL47ZQYvZen6hFPUkb0h5+cuA1bFbgdsROuXfVchnud8g
         IYKw==
X-Gm-Message-State: AOAM5331KsUhpL3F1uQAiFif1ThRUFBSvk0lDY9QFx3xIuXSofktlmeu
	PsKnezAUy3pcfxC8qvXuIFnDqp2iMCg=
X-Google-Smtp-Source: ABdhPJyqhx1jDOWuQOmRZIEoeRSLU7+cp9VPPaJ2DDk0LxXLZ5v8R2+iIkD2TRl66hp8/ezbOg+D1g==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr7262784wrr.55.1626265574988;
        Wed, 14 Jul 2021 05:26:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/21] llvm: make upgradable via devtool
Date: Wed, 14 Jul 2021 14:25:48 +0200
Message-Id: <20210714122606.605142-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assembling PV from bits is too clever for devtool; but it can be
done in the opposite direction.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 8a5d3dc9bf..de79adc410 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,11 +19,9 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-MAJOR_VERSION = "12"
-MINOR_VERSION = "0"
-PATCH_VERSION = "0"
+PV = "12.0.0"
 
-PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
+MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
@@ -178,7 +176,7 @@ FILES_${PN}-llvmhello = "\
 FILES_${PN}-dev += " \
     ${libdir}/${LLVM_DIR}/llvm-config \
     ${libdir}/${LLVM_DIR}/libRemarks.so \
-    ${libdir}/${LLVM_DIR}/libLLVM-${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}.so \
+    ${libdir}/${LLVM_DIR}/libLLVM-${PV}.so \
 "
 
 FILES_${PN}-staticdev += "\
-- 
2.31.1

