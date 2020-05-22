Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.6225.1590114180888385017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 19:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id i68so7256504qtb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 19:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=gYQll8fvBQOJVIQbN89Ui88C6v9ubZaffBd/0qIoY9Y=;
        b=STI4W8pExqY8CeAGWd3CHYw2vnYns8TCaSYxuwGcvF89YOFGlM6YKQcC5i3SvDKmyb
         f52RIQHQ1Rga9YykF2MDt66PydUlN3uYeI623MAeMs+M1ZzXQVu8eitWyZvFT83cKd4I
         Y76sdyIuQRN4T+DlLDRuyLi9czkMuuFdrwZQSmTtB2ycc+kVmaZtSmU9fG2Vor3tcq/R
         zLNeW0vVW6n4kNbNelkgQv3F95jXTbHQz4ZMqGxbX83RsZmo5rqWhseL8BV/TzdaL7a4
         VLRVX2z38T/h5FfZUsYJbKdvma/yuzu3uhQu/GOlN/tzUMnvCrJfCkq7XXbbUPko9KDc
         jr7Q==
X-Gm-Message-State: AOAM530IwS3cdx8Ma9w8+Pt8lOspAJ5gYv7t/WcVQYN1hFTaK909LUJz
	52PglMhP0OCf9poymxlcdln+9XeqIOQ=
X-Google-Smtp-Source: ABdhPJwe0YQk24Pqk7hQBpG2Kkk/NhSARi3FDvHj3FAlS1K0umUIqwpK/CvSdLCD257CDFXmAGRn9Q==
X-Received: by 2002:ac8:3534:: with SMTP id y49mr13003087qtb.203.1590114179716;
        Thu, 21 May 2020 19:22:59 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id z25sm6938278qtj.75.2020.05.21.19.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 19:22:59 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/4] go-dep: Avoid use of 'go mod' support
Date: Thu, 21 May 2020 23:22:36 -0300
Message-Id: <20200522022237.3568393-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522022237.3568393-1-otavio@ossystems.com.br>
References: <20200522022237.3568393-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

dep utility must not use 'go mod' support, so we explicitly disable it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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
2.26.2

