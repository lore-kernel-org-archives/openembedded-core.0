Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.4337.1604440371943139688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 13:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YcgBC9o/;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id gn41so9326593ejc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 13:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hwkfsHBeSP4YGniz5U5O94hUNNJbn61yIK+Wa1qqs7A=;
        b=YcgBC9o/b5FTZcFKMI+rMNfpUKiOu+90Lm9TnzRZCsteGc/LBMNQK1/y/mibhBc7Le
         BJ4ezH6MXh6VrCLVaLLovnVoRlc1J/OWIIEPam2Sca7xAvZA08DUWqW2AQPSCXsEzJOT
         O9lrXd2Dbd0Q4iF1QAAmOKHBlS/CDM8wtr4VgMvr0vPzqPOuLY6+MR7jRpi7WJDcrWDn
         xN8z7IRVbd+ItFrpcThWkMgt5dLvTiBunJ84zzZcwHOFbPo0ZJgD3nVwfWAVN9sHjRZ/
         HretEW0HwyGwAxu4I+xqnWchkPIMtBJJ8+4G/POlkeSvWP7nXBT9rZJQ0u58v/0U80W9
         ql5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hwkfsHBeSP4YGniz5U5O94hUNNJbn61yIK+Wa1qqs7A=;
        b=jycDk8OoG9S+acnGIfUQfRkhhvTBI3sdLhW3+0+6/dvVAU7kD1rPE39fv/2eU1+6qN
         0hKduYhvkLTOEWb9J0xjciqjT5JAp25ROAtumaXXi8U/et6HuXEWX0mk917/MR/u5a7E
         IOaanaCWBrcOYEg4LJ+UhxklkpGIDvKqd5tggiBQbeCtL9NuoVfDZYIhUWvRlk1aoqfn
         +cELn4XaugomhbsLG7OHjZ7ejuR53iM2ZJG4g3EzZucFQEs0cgUXz9t8E42Ic96zef3U
         +yd5EQGmMcP7ji+Lb7mqzg5A2+ub6TJzJjasrOE33CZ8UFbMzi+4dcl0kiYrT2lYnLqi
         Oi2g==
X-Gm-Message-State: AOAM533g2hjQtg864gWwH5Vubj1Jw9Q4ES+Ymw4IfMetAYLqmbWbGsSV
	N/j7QFJHZypJ2YyEOc5UVw4wmjqF82o=
X-Google-Smtp-Source: ABdhPJztZfXnLQns1ivdaoLmE16/bdyHBWeVDRubKPzioLvXp/bHyxE/HMGIfVSIWTURMwpQGLRoOg==
X-Received: by 2002:a17:906:6156:: with SMTP id p22mr21163014ejl.64.1604440370004;
        Tue, 03 Nov 2020 13:52:50 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d23sm82135edp.36.2020.11.03.13.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 13:52:49 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] libxkbcommon: add missing dependency on libxml2
Date: Tue,  3 Nov 2020 22:52:44 +0100
Message-Id: <20201103215244.857384-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <164419F41027C9D2.7719@lists.openembedded.org>
References: <164419F41027C9D2.7719@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* it was introduced with xkbregistry support in:
  https://github.com/xkbcommon/libxkbcommon/commit/afb26e7df9090a0b765eb294b6efff448f763b6f
  and as xkbregistry is enabled by default libxkbcommon
  is failing since the upgrade to 1.0.1 in builds where
  libxml2 wasn't included in RSS (e.g. when wayland
  isn't in DISTRO_FEATURES -> in PACKAGECONFIG)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
index 4ef20b0721..353856e1c4 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.xkbcommon.org"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e525ed9809e1f8a07cf4bce8b09e8b87"
 LICENSE = "MIT & MIT-style"
 
-DEPENDS = "util-macros flex-native bison-native"
+DEPENDS = "util-macros flex-native bison-native libxml2"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-- 
2.27.0

