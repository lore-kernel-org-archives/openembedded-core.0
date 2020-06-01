Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.34656.1591009989296510176
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 04:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aYO8D/gZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id ce8so841011edb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MrlAjlZIInm3YWai+aDHORjxYONGwgv8yrT5y5Qy7R0=;
        b=aYO8D/gZfBNX+bxwrSeEYO6t10oMHirUYBHQKp0FqEXTO/iDZ6X5YnhAmMZ67YxDKo
         o7a/N+ExDKo2J0FMSzSE4ZkqYkx/knxv2AFfaMVy83CqL/BVFK9TKuP0hvqr5dTO9oyl
         CMtWfL03vzL2B+k35f+8nHlv6v2Nxl+MudDvW56eQm37Q5PWHrg0NxPssf3LD3QUH6We
         bWixqQiaSA1EBzE/dzFKbUkqCGizgDzvo3BnsazpHN4lRQjbF3fEDBad0u1fLN+QI6z2
         2xVTI6CnO3ZuekD6BlHXe4CmSvYBCpKjN5hCyaYJMapsBW9kvl2ikNHyTJE8FUguv44y
         irUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MrlAjlZIInm3YWai+aDHORjxYONGwgv8yrT5y5Qy7R0=;
        b=PBq4Cc/fvV4XUlpKZDaKHHF/qZQC4truP0WiZZH9CDeYdIT3C157CbVRZ4z3pPh/aP
         cekHCgrEi037n8XFRYhXNWxmGfOlryFH4Y0YJJPNYfOJI99kItCG6lm8FD9zFbz9VMs6
         kNePk/c0JihqIhTypNtSAIk0gjwpWuagVRkr/Te5JKAM8jEu5J/wphVpGktLiR9yYj7Z
         N5iVXJEDCELggPWYcwugONJytQfGV5TXRzVu1oF8ALNx1gsKotqY+DNqPMIG5QO7bw3L
         4Cn7mkGbXNcDKV8X9X5LBG+Ncnn7WZ1jgLMDRQj1skq+qrVd0CsdvyhIowr7p74rM7p3
         VRDA==
X-Gm-Message-State: AOAM530trTIXj7yd7fqia8bOgrtPSqxx33eXPT0UjSExX7F5+ErxLCzc
	EZW0NAZGTVtyeveRz1vtct9yxI0y
X-Google-Smtp-Source: ABdhPJyTXiamuEnkGThhlR49Wp4jJoLPbPEosf+QjPvNGWCycUt4u0gap3sINlNQBQZ9LCW23MAQZg==
X-Received: by 2002:a05:6402:8d1:: with SMTP id d17mr20335370edz.38.1591009987540;
        Mon, 01 Jun 2020 04:13:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id n5sm9645637edq.13.2020.06.01.04.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 04:13:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] lz4: disable static library
Date: Mon,  1 Jun 2020 13:12:43 +0200
Message-Id: <20200601111243.30819-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was found to be built in a non-reproducible way.

[YOCTO #13925]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index ed4452c82e..6510156ed0 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 # Fixed in r118, which is larger than the current version.
 CVE_CHECK_WHITELIST += "CVE-2014-4715"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
+EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
 
 do_install() {
 	oe_runmake install
-- 
2.26.2

