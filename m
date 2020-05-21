Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.8130.1590074331879203839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 08:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uYzmJjV+;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id u22so2939280plq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bJM1rls6Hqf0tzQuhZ/9MiMur2Ry/SncNcW21YXgBiM=;
        b=uYzmJjV++m1rj+cvaAoosoRj+2Nz7PxpO5pGdhSgczhUzoK2L3V1ywVFQhw4bwiYcE
         8IGKKySlKRmj/29Gyd+Q4DqfyYH/zvenIre4Raqatajtc3RanWfvrAbBOquDaRQtHZ/M
         3uIq3NF1UREBawExRzcODmnZ0GIr0wPI7UIrY3wsrRFCQYyQlhbWOHA+XUJA4KA15Y4m
         i9hwBDe0yPUM9lyab9pHcYwczJjzguBQZVaLUF9zK9oIga28QTuecsKxeMrVf6n9n73h
         DwIzmhJ+ECHMgmSe18tPxukcPC/v3KYs5kV+0/qC/bAuXzVZP+0FeB31bVH3wFXADvoi
         qGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bJM1rls6Hqf0tzQuhZ/9MiMur2Ry/SncNcW21YXgBiM=;
        b=lmW4Xxow8Y0FaIRAAF+3ggPaNazRnb0Fxl5pCH0fBQfh1c4LX/o/2uM3NGP9B2bTw8
         z1Y+hm/CG06Ql0a2lRVjC6v/Mt8uAbfQlI87K6he3PZiO2KerT1hAFblOzLy27oB8eCf
         BZCHkFaau2ytD9/NgvYx6SVLm6SJvWmkZcinKfFJ+ArkI2szzeglMPKaGR+ZxNVziLyC
         VOXtwOIYQ6Wxr4vTK7XajiKF8gJjHMak6BodxQiy6UCig8jhAEf28WuOEOBURZk2yC5g
         8WMkaCxxiZ6nbyVCejcnsCUCtLf2e0nl5pG8Ogr0ACVtdVnF4bHqTkDcLbg+mVNxCJry
         Ekjw==
X-Gm-Message-State: AOAM533JekWubTM2QozOlRZUCPEQCRyPRSgoWOnnFnzHONMhNBB6+Ese
	PXqYsjGRWKbjzl2b7rWq4l6lFLTFkjE=
X-Google-Smtp-Source: ABdhPJxTzYs5g6Ue6LxIgb1dvis/JWYnz05L/kDwRmSW1Wz0jOzOoRITS+P1slFdjT+3rVoS4sxQrQ==
X-Received: by 2002:a17:90a:f087:: with SMTP id cn7mr6749589pjb.223.1590074330984;
        Thu, 21 May 2020 08:18:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id x13sm4683601pjr.20.2020.05.21.08.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 08:18:50 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] cve-check: Run it after do_fetch
Date: Thu, 21 May 2020 08:18:47 -0700
Message-Id: <20200521151847.3256803-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain recipes e.g. bash readline ( from meta-gplv2 ) download patches instead of having them in
metadata, this could fail cve_check

ERROR: readline-5.2-r9 do_cve_check: File Not found: qemuarm/build/../downloads/readline52-001

This patch ensures that download is done before running CVE scan, even
though these will be external patches and may not contain CVE tags as it
expects, but it will fix the run failures as seen above

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 2a530a0489..556ac6e67f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -65,7 +65,7 @@ python do_cve_check () {
 
 }
 
-addtask cve_check before do_build
+addtask cve_check before do_build after do_fetch
 do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
-- 
2.26.2

