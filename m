Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.8908.1615559028800587290
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 06:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RchsquF8;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: ja.kaisrlik@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id x16so1879344wrn.4
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 06:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8QoUDdk+DmL3z5aU8sg7y4YXmmrW2KO1VQgm7s2m3+w=;
        b=RchsquF83qE6WQ2vQozyY1oEBUyDF+bLCIzwbITvzRqjtjNKzR/DPvTPdfZgYu98xc
         GgnhAL2W/mIiR9y23rOoif4pdwS+csE+ta8jvlrZBxGeJfr5zZm3tOxc40md4P0n2+fb
         B4PQEAlThFnU1dWGUruWkh7WSxMYbAA4HDQbWJDJtbutgu8q+lqUZCT8Xvb5KDgGT+mE
         poysVb+iygQDt9Q+n80PhRDprzt1XH+tfMYlrhFtSxVvoIu3fshZ87z76wQaUgSx09Xp
         vELxKd4yRkPYePEJ2PR/wquMAoTkVxUbgCO0c5/wq0Pd7qozIQFo92GnGcusJO1D7MqR
         4t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8QoUDdk+DmL3z5aU8sg7y4YXmmrW2KO1VQgm7s2m3+w=;
        b=X7KrJ87mmDGA2KTg8X9ChgmlSFQLbTsqJXmqlDSqo2LIgMHdooP6aIzzTpq6c11FoA
         6GCTi28/xmrXYQVrkwUeVXoNU1kKuUIybxj+UcARbwoG78tfY2MbF2P7R3unFV8RfF31
         /eBZ61QMPEJaDg664dBZm8NHHdeAsseaVSjyTdAJHPfD1JDoLXcV3a5zNbpwxx5pk9lD
         WmNsV2MevNHBx7i6na+A5kra9iqMHicOMdoy3QtgX+59+gCyqD5NUNofmrWfB96nPmZq
         1iUUE/lFyGrB7aP2wchHjohFgJ1QzaC7DuuxPon0zeAo/aSP6ESxxvdM/+UElFoVorB3
         z6Ew==
X-Gm-Message-State: AOAM532C0xdfbm1N1Qng/GZv5d/e12F2xGx0htNWEEKKUwnzKNEftQM+
	cL439lBofYBTSF80x2PbuWXfvfEnr+c=
X-Google-Smtp-Source: ABdhPJza9XMgKa/VUNwpXnmdjzz34x2fgjjTgq6etB5xMTa05EQAXsqUnq2p31t/0h9fwLHMUKIsiQ==
X-Received: by 2002:adf:fe09:: with SMTP id n9mr14412638wrr.104.1615559027189;
        Fri, 12 Mar 2021 06:23:47 -0800 (PST)
Return-Path: <ja.kaisrlik@gmail.com>
Received: from xeri-steel.avast.com ([88.103.225.52])
        by smtp.gmail.com with ESMTPSA id i4sm2279771wmq.12.2021.03.12.06.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 06:23:46 -0800 (PST)
From: ja.kaisrlik@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Jan Kaisrlik <ja.kaisrlik@gmail.com>
Subject: [OE-core][PATCH] abseil-cpp: reorder content of packages
Date: Fri, 12 Mar 2021 15:23:23 +0100
Message-Id: <20210312142323.1053949-1-ja.kaisrlik@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Kaisrlik <ja.kaisrlik@gmail.com>

move cmake target files to -dev package and remove check for empty package since
package contains shared libraries

Signed-off-by: Jan Kaisrlik <ja.kaisrlik@gmail.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 9557c93..6a1a029 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -28,7 +28,6 @@ EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
                 "
 
 BBCLASSEXTEND = "native nativesdk"
-ALLOW_EMPTY_${PN} = "1"
 
-FILES_${PN} = "${libdir}/libabsl_*.so ${libdir}/cmake"
-FILES_${PN}-dev = "${includedir}"
+FILES_${PN} = "${libdir}/libabsl_*.so"
+FILES_${PN}-dev = "${includedir} ${libdir}/cmake"
-- 
2.6.5

