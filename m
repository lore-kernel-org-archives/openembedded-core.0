Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.9868.1600325320500377191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 23:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WjonHgeH;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id k14so782496pgi.9
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 23:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eWDY9y3zhX5vXAdxLRDTqlqglKnwdB/O8al1G0XC3pk=;
        b=WjonHgeHDhLa5CFZ0PU2uXfkfcYtiIbe4pKr1k1Db4CZ2tPTpUPc39gAxqIWt6QHhJ
         nQ4SeSLZJ+u4dRZdC7K0u258Wti1fO5j+g8fCvWcwAsfMX6MbMbdMD5Ly7FdynM5usm8
         sWG6MPv7x5fwYgm5dTjoGdZ/Qcr/MT7yrJqiEJR7+DxeAq/BK4LvfZjlxZ5jXx5crw7G
         pn7BTPfpQuiLGDw7i6niIEkc2raxceupiKcab/VkkZAKSN8c+hx6BQwZcSWuonUd4Dyz
         FqITmCqgHZl1O6twofG928HRU0AKHwxM6l3g2BSqfe0/zKBauhkoGBJyH5Mga9qwAR1J
         ogUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eWDY9y3zhX5vXAdxLRDTqlqglKnwdB/O8al1G0XC3pk=;
        b=o3904ZEpWy8cCWARXRa0b302t+pkbsFEcY3rG4Qv3cGsV08d0sab5haTD9up3O/PJX
         dtiSumlBGkuwkGmDIzvHF3mYNsqaS9kUGWC+3+TISZsPDjBTMhpsFSZOaSOxliMwrISO
         XZaK1DrUgpg20++ULpqC6G/QzwCOi57GRHezd6cm8hCyaA5XJUInL4/Hz/9M8TmUH8VN
         6bWMqR+y3/nv5Rvs4CBE2AkqD4L2btaVWy3sEc3LipMd8UWplL2TQlmxRLqOR6bIh3mR
         fWPMtg9omVuiSJCe9fhrBS4kxW4/um82RYFsTh+uuW0aWojRHm6WH5Ns7zIYrJxSr7/R
         rpKQ==
X-Gm-Message-State: AOAM5332KHRB0vW49XuhJKyT6ac5KuXBe/aBkuilrjFNG5a0Pqa0cBKX
	YQFw77LWbojt2qBJsfvjfenVVTub22NiuA==
X-Google-Smtp-Source: ABdhPJzj/cH2hty7NaLTMOrrPraDjrjlnu62rQ0UJK2zwdgdQIsHJmsspas7OU4pOdiEMUOHs/IZDg==
X-Received: by 2002:a63:441a:: with SMTP id r26mr21845311pga.290.1600325319655;
        Wed, 16 Sep 2020 23:48:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id z4sm19509062pfr.197.2020.09.16.23.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 23:48:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] packagegroups: remove strace and lttng-tools for rv32/musl
Date: Wed, 16 Sep 2020 23:48:37 -0700
Message-Id: <20200917064837.400325-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These tools are not yet ported to rv32/musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-core-tools-debug.bb           | 5 ++++-
 .../packagegroups/packagegroup-core-tools-profile.bb         | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index 81fbdf4608..283c1f1a35 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -13,9 +13,12 @@ PR = "r3"
 MTRACE = ""
 MTRACE_libc-glibc = "libc-mtrace"
 
+STRACE = "strace"
+STRACE_riscv32_libc-musl = ""
+
 RDEPENDS_${PN} = "\
     gdb \
     gdbserver \
-    strace \
     ${MTRACE} \
+    ${STRACE} \
     "
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 17b1391a47..1c94653d72 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -37,6 +37,7 @@ SYSTEMTAP_riscv64 = ""
 
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS_arc = ""
+LTTNGTOOLS_riscv32_libc-musl = ""
 
 BABELTRACE = "babeltrace"
 BABELTRACE2 = "babeltrace2"
-- 
2.28.0

