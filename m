Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.33139.1597619582958225180
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 16:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uFlqWzmd;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id ep8so6798692pjb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 16:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tE7kg0jv+0hw+vv1s6GAlzVjXvNbBsw+72k6/muubG8=;
        b=uFlqWzmdwHeL06sMwD516wwPRHIv+PihHIrYLLnk2wedvXEJ9jgvuAYz6LRXC/ORNl
         qlnj2PzeQTuQYjJ0NJ3Is3WCJyOAIBUWDrf8Ze2YWkQQQBRyBgZY4zyD5MGmpgOqkBW0
         AZORBAy/Yc4EUp3YfJaDuSXgjn2af36h6zrcmGbyaC32CZzqioNZHEOmCe3n5OE1jFe1
         vniIrfSaxLBXnOFYDLYndzd1Pid1eROAZ8MDWoicNUNA/dhbkj6mM1ao1SpIyAZhdveb
         2nz6qVAxIjMytORLZAywrIoWsbQhvqDM6haxkMk1CfbznJbI0EQPE9h7BRkV2H2obb7q
         iZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tE7kg0jv+0hw+vv1s6GAlzVjXvNbBsw+72k6/muubG8=;
        b=FKuIvnB1sXsQc32urSN5JSiCb2DOD24VavBRUeyltSFWG4sRFOIsbtFt8Z7/0UGt3w
         CqeJpQWmtI8FIYUzQ2yA1nyO0ePgQ39GLb0P0wdHeEwXX43rxcFTOghSY1U8d75A48JT
         N3FRO2QTs7QtCy+Ng6xaW5PtNPFzJxn2gErkquKeFVUXqVOM2NSXJ3aoPmo6s6tqW635
         Oddm+SwFRI5B6hGrwSHxw3hQNxpVEqyytYikt3+VSTOLN4WhQno1JtpBMMob99X8eMoC
         Y9+sdFnFP7mCJ03AwuNO1X85pZN03Np4Q1R8IfAftb1QZoepQUKiFEDkc03abD54CtSz
         F3tQ==
X-Gm-Message-State: AOAM533Lvw72FtrgnBM2AAqm9t8VVNcpSbLxNuMIhXgs8EqIvDjPx4Zg
	9/JcytivM4M4pMmnr61uXCOBzEkKaggGOg==
X-Google-Smtp-Source: ABdhPJxhygRqkuC/DhZgFV3i9grKG1W0VnKEIbj9frNDnzeCf0B/h4a4x24UntVsrKPQ1nPUoXkuZg==
X-Received: by 2002:a17:90a:eac9:: with SMTP id ev9mr10120481pjb.106.1597619582097;
        Sun, 16 Aug 2020 16:13:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id q25sm16134427pfn.181.2020.08.16.16.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 16:13:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Denys Dmytriyenko <denys@ti.com>,
	Philip Balister <philip@balister.org>
Subject: [PATCH] localedef: Update to include floatn.h fix
Date: Sun, 16 Aug 2020 16:12:56 -0700
Message-Id: <20200816231256.4166163-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently localedef-native build fails on older hosts which have glibc
headers without floatn.h this patch created a local file to avoid this
dependency

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Cc: Philip Balister <philip@balister.org>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 2e0a71c303..1566056297 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,7 +1,7 @@
 SRCBRANCH ?= "release/2.32/master"
 PV = "2.32"
 SRCREV_glibc ?= "3de512be7ea6053255afed6154db9ee31d4e557a"
-SRCREV_localedef ?= "b6ca7c146c6d2c93cddfa61e395cb8a196e3d46f"
+SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 
-- 
2.28.0

