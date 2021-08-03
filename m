Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.1477.1627970205189077282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 22:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m+THfMUQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d1so22425739pll.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 22:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M7ur0Yhw4P2ePf9S0dCH9/u+aFX01DxPDVhPn7xjiIs=;
        b=m+THfMUQCKGVRF2vqjXz7D/GD+Od0O6MGRJquHMfwuYLGQxl5VNO2E1BceP/DLdlTn
         2bUwCj8jP+LxUlgUKcbfXnSb0FIE8tlPWWm7bqQMkTpN8QAa7sslpsbYPJKl1SLQBpaw
         h5VA2ZcTk1CcmPnIE0vXCxywUGqwgrbCYxjobcEsCt/+Arpz5pH9bVy959FkDZmnrprz
         Z+pLTnN0aoXu2lsNWfXQNOAQXmuQ1xTjZn7YycN/MsC+jpsP1Jlk51O8o9QgiU+Qrmjh
         1DEz2q6ffzfDIRPqvq7FyCycifiGxanP7jXL6otuBwuJvzE9PkXImKiszj0t2E8Lgn8Y
         feRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M7ur0Yhw4P2ePf9S0dCH9/u+aFX01DxPDVhPn7xjiIs=;
        b=qUzS+nPwYkm6xkOdw3b1PqszWQ4T5bWZ1QT2fXNtkdvJ+odFdDpEVZNQbOzeZYzP8U
         obiyJ2XyD0N4ktAJxfWInfJoOrxHdx1Z8uUW03Vw/FqEpZ8MYXDCPAXqylJejk3da+BZ
         F1/arO06DGTVyLqDMKZT09aXos3wBL5Od+dcw7MCx66aS3aQhZZvM6vBjlkKKkhkjfJJ
         GFhp28sngzNpQfsdECDKCTDPGCMNivTj/tCR+NvTlhtwyQCRgme33cBpr8t/GZMeuISc
         QtHO8QG6hoAx7/TmCDVDOjzeLs+HP2PEZw8G9fVjhJ2s23GFeL19pqRrrCArYKAKZfH3
         eb+w==
X-Gm-Message-State: AOAM531KztVaQJK4dDBZVwWveZ+Oub/UtrrbW/K35XZ6c6HgdTNRMv1J
	et7R4xBXUuKvHK+5J1WQrXeLPfXtDzAS5w==
X-Google-Smtp-Source: ABdhPJw74hEaVx6NBfXc/aUvbfgNc9WpfbOMe9lR+USzCMMvXo2kIKzyEZhMeHUlTVwL9Qppm9TSNA==
X-Received: by 2002:a17:90b:1495:: with SMTP id js21mr2774380pjb.2.1627970204424;
        Mon, 02 Aug 2021 22:56:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id k193sm14691942pfd.128.2021.08.02.22.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 22:56:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mesa: Define a fallback for DRIDRIVERS
Date: Mon,  2 Aug 2021 22:56:41 -0700
Message-Id: <20210803055641.3772574-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some machines may not define this variable, in such cases bitbake fails
to parse

run.do_configure.3766843: line 164: -Ddri-drivers=${@strip_comma('${DRIDRIVERS}')}: bad substitution

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa_21.1.5.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_21.1.5.bb b/meta/recipes-graphics/mesa/mesa_21.1.5.bb
index 3f62990b29..951fe8333b 100644
--- a/meta/recipes-graphics/mesa/mesa_21.1.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_21.1.5.bb
@@ -1,5 +1,4 @@
 require ${BPN}.inc
-
+DRIDRIVERS ??= ""
 DRIDRIVERS:append:x86:class-target = ",r100,r200,nouveau,i965"
 DRIDRIVERS:append:x86-64:class-target = ",r100,r200,nouveau,i965"
-
-- 
2.32.0

