Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web12.3209.1592856155961106801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 13:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z87W78kw;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id h95so379556pje.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 13:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KqEEpGLDICQupPirpOE1vZSNu8cwaibwH52956VJ/No=;
        b=Z87W78kwgLAQag81TSD+Ha5iQqOZtHkjw2TE3Gv3an2g+Qx0mq0AknzYjsUznBMnO/
         OJncCqDpJfXnFDq4ZlEMUa5ZITiKCkL65lsAQpsqEW1mHHL5y1tSCuQ4Ws57U6xi/75U
         V5RNaOamDhw9UccYy+dpmUcrFAXcbkzRmO2TJGIDiOU6oaocUcnKzItF3wr11H3SRxDb
         lUVqopNcNa1MZqHQ+FYlqe05mUY0OAj0fITWdS523YQ/ip1X8zsM1i69F73voBAPqVir
         99NsKFPw3GyCgdEu8aFB+i4ssUzggufO+/tAwksGnUxqyY3NeGA8b6sPFb8vN4CHJipm
         Q8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KqEEpGLDICQupPirpOE1vZSNu8cwaibwH52956VJ/No=;
        b=H79giHhrMpHWBHvu9kmw3StPgAWz7F/ytiajE+X1K/bqmX5A4a4vpx/PjiuNR9M5dX
         Lfe7khBZxCyEXj/9oehlPVYNFayn11J5sKJo6OoMLD2leI7TTjfycDUi2LxjP5Szh6nO
         bgpZC8w80zx2A8hTYboUMeOvu/DJZYcAeRg4JhpVlUPCRG7FR2SLqRI0f3hQO8yjmFmB
         K05bT2R+s6Sjn3VkCZQPag+y/Mhz+apI+Y+DVL9YY54wQIks92db8OgNCoHwTScTU/9Q
         3H9/9sTQVFw93Z6M5G7gs+L5+JOyNaCeEj8uA6lm3OSMlgp1ijfOSblglJD+DIf8Yh9Z
         jkag==
X-Gm-Message-State: AOAM531PFLeaAEMsFn8DjcvNZ8XLuxoH/F3zks8kYkEoiO5yW6psOs11
	NKXLuKAj4oZz1iYOT95T61HHFPF8B/I=
X-Google-Smtp-Source: ABdhPJzj2mYsCYAtTRxkxmgUJn9CxIdgBWL31vDbM+vQrS9zFk0u8r1jB3zu9x0IHvMtghrIqQTmKA==
X-Received: by 2002:a17:90a:d596:: with SMTP id v22mr20106837pju.180.1592856155170;
        Mon, 22 Jun 2020 13:02:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id 71sm15007937pfb.20.2020.06.22.13.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 13:02:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio.salvador@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 3/4] go-dep: Avoid use of 'go mod' support
Date: Mon, 22 Jun 2020 13:02:29 -0700
Message-Id: <20200622200230.54899-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622200230.54899-1-raj.khem@gmail.com>
References: <20200622200230.54899-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio.salvador@gmail.com>

dep utility must not use 'go mod' support, so we explicitly disable it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/go-dep_0.5.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/go/go-dep_0.5.4.bb b/meta/recipes-devtools/go/go-dep_0.5.4.bb
index 615cb289e5..496224a5cf 100644
--- a/meta/recipes-devtools/go/go-dep_0.5.4.bb
+++ b/meta/recipes-devtools/go/go-dep_0.5.4.bb
@@ -13,6 +13,10 @@ SRCREV = "1f7c19e5f52f49ffb9f956f64c010be14683468b"
 
 inherit go
 
+# New Go versions has Go modules support enabled by default and cause the Glide
+# tool build to fail.
+export GO111MODULE = "off"
+
 GO_INSTALL = "${GO_IMPORT}/cmd/dep"
 
 RDEPENDS_${PN}-dev += "bash"
-- 
2.27.0

