Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.11315.1590315683490744958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ajx9LSyN;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: gzatko@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id n5so14297001wmd.0
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 03:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJmkA3CHHKF303Earv/Gu+K1zRBuhRFvY4+PrFR/dyU=;
        b=Ajx9LSyNDv/o8+puLAqmOIdQ7+it4Pw7bPCyLbidJrlR6M0Ct8otI0St4YuznBaKo6
         HFH9E0BThsD/EcPevl2J4qlmlLPRWJjNwqvmNrv5ViIzwXyRsYM8senOh9eBFBofaolC
         NF19lRfavXRJzZI25miiROvZIXIWtHNLdVA0DWRAgJ8kJdZBrAV7jHg68AGicDeQem1u
         HJiZzioZMwbyXJN8Xd2c3asajm3oAwl1oJ8YMzWLTrh4DWy9gjcJcleFHvVDdyzV9iaP
         93V9G5DKpEdr3z9ktLPcSxclBYN8Rgi7tatZ2HnCwYAZep1WDQMhOLESZrRze4VKMyKL
         SG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJmkA3CHHKF303Earv/Gu+K1zRBuhRFvY4+PrFR/dyU=;
        b=CeTWB8YonbfXh/MOZJWjXButa1IQDbY+4Kg2olF2QLJ44ISNUGR4jMvRub18oaMknn
         rxVntyDGwDXD3lrPsoXuKw7xYuMgBw5Apq7ew9TethQYyR01+Wb1OHBnWKxiY9VysaTv
         Lu4EYjwR7iQl2vfzeNR8kUWS+VeMyoxay0K2mf5Y3d6e682z8aUclqqIpdN/gBXrjiMD
         LowG9pI8qcpj0gFoHW0HQQWtj7WCmPLi+6rj6RIT4AYlLerazxc3cMMeFXkA8ZQZyHgs
         JfXiiwp6OtPMJInb4zQYMX0wE8rPcP7ZuoqOte1q/LppALp0vvHiiahpvBCpRtoMm/5G
         Z5ug==
X-Gm-Message-State: AOAM530MsELU6enwMPm4dCYcLtOtCncm8zZR5TIY5dmokG00WnQasTX6
	uVhyCMqVN5CXRs3R2miORkm3CkNAtRM=
X-Google-Smtp-Source: ABdhPJx6VYUjCVV/nfWQWDtVwvBzP8tl73zB6ndQZm0V5wL+YHxWW7nn+qIddEUULzKhcCiLvNmhxw==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr198379wmi.126.1590315681512;
        Sun, 24 May 2020 03:21:21 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.lan (93.184.67.240.host.vnet.sk. [93.184.67.240])
        by smtp.gmail.com with ESMTPSA id 94sm15110531wrf.74.2020.05.24.03.21.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 03:21:21 -0700 (PDT)
From: "Gregor Zatko" <gzatko@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] 'inherit' directive may not be used in conf files as it's supposed to be used for the inheritance of classes. Correct form in conf file is INHERIT.
Date: Sun, 24 May 2020 12:21:16 +0200
Message-Id: <20200524102116.3929380-1-gzatko@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds:
- a sanity check to find whether the wrong case exists
- fail the build if so
- tell user about the difference in directives

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5426

Signed-off-by: Gregor Zatko <gzatko@gmail.com>
---
 meta/classes/sanity.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 292c5591dd..e021b9d240 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -784,6 +784,12 @@ def check_sanity_everybuild(status, d):
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
 
+    # Check whether 'inherit' directive is found (used for a class to inherit)
+    # in conf file it's supposed to be uppercase INHERIT
+    inherit = d.getVar('inherit')
+    if inherit:
+        status.addresult("Please don't use inherit directive in your local.conf. The directive is supposed to be used in classes and recipes only to inherit of bbclasses. Here INHERIT should be used.\n")
+
     # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
     distro = d.getVar('DISTRO')
-- 
2.26.2

