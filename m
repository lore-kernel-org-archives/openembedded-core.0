Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.29230.1620637210414242610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 02:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TVJslLzF;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id s6so17770583edu.10
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 02:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6gkUEtI16L4nC8h3yFlc4W/JkvJUQ3miiluxzdDTP9Y=;
        b=TVJslLzFUeveCRzjPr4oIAvjNkMED7mrm69T5bwrwN3Y24lU0mxq259MerYG95W6Sz
         8QDl0TW1wPbvP9g85qm2R/j8SDNIkQmxnODFRgSWbxPmq3BMeqsduZmsRAHqhLfj0eRX
         gRvguUBRMI/E7UvbtFOE73b7DzIVB5XhCJOuGX6+sTqBAj8RZtlV8CsBk/Q7E5beF2UO
         A6qm0/x1si5QnYng38u1bCN7+zeHZqWkLXkdszljcx1yzVZ5BMmtkW2QjVcGYoaPNrDX
         y7mgZpZM1Wchpe0rDPxQZohL6x2PEWix/bCBzrpLXEImr/TDqDYE4uSBVB3ZcJsinIPl
         rTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6gkUEtI16L4nC8h3yFlc4W/JkvJUQ3miiluxzdDTP9Y=;
        b=cGhewk2iIvLFob9XfDGhcftVV/xcJRG6vnFqkVTJt63S67i1YCwlMSHmyWOh7XhPfE
         XuPAC1pwGN2JgTq0Cs3m9fuQPqLdSMufHtc0iFJg5mXqH5Rx/AW3VVeSQY+Hgppo302Y
         ym3pP0foDb+hLLLdsdbfJ6pcNRQBr6Vl+n8TMTVphU2ag7TbUxgQqa3KenDssCX5XpSG
         UdChLxi+3BrFIwJdb36typAvwHaRVpCkL+ZBCeA6LvfyWA0nf022mWT0LsRvA26hdlf1
         FmPRkq55tNFR2hfnYtz0nqv6cQbmHw/OPSipvBUy7bO5bUi02bv7nFez/OYmlYkY1pjE
         8IRw==
X-Gm-Message-State: AOAM530RvKIWMlJIc3bSsVQyP4RBubaGr5OWpIXSCtHHZREPVKdYa1sH
	yiWXZW8K4ZsDAtdCHMjbgBFwBQAtklg=
X-Google-Smtp-Source: ABdhPJxETWe1B3J/H+E2TXHoiXTeevs/RuzbdBSsXuYHEoWz2YH8HFRgSopLupGA953y6bD3AKlOXw==
X-Received: by 2002:a50:ccc9:: with SMTP id b9mr26919545edj.316.1620637208945;
        Mon, 10 May 2021 02:00:08 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k5sm12043195edk.46.2021.05.10.02.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 02:00:08 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] gcc-sanitizers: Package up static hwasan files as well
Date: Mon, 10 May 2021 11:00:04 +0200
Message-Id: <20210510090004.1057872-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* introduced with gcc-11, other hwasan files were already packaged in:
  3df4a25465 gcc-sanitizers: Package up hwasan files
  but static library was still triggering installed-vs-shipped

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index d0348c4817..59e91daaea 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -90,7 +90,9 @@ FILES_libasan-dev += "\
     ${libdir}/libhwasan.so \
     ${libdir}/libasan.la \
 "
-FILES_libasan-staticdev += "${libdir}/libasan.a"
+FILES_libasan-staticdev += "${libdir}/libasan.a \
+    ${libdir}/libhwasan.a \
+"
 
 FILES_libubsan += "${libdir}/libubsan.so.*"
 FILES_libubsan-dev += "\
-- 
2.30.2

