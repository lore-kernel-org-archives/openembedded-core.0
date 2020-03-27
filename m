Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.17624.1585329926924187397
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C2NJgeOw;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id d5so12414684wrn.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=g55n3U94xpLDFOvzJs9Eo4kgyUh7IEAt9O35fGjHeJU=;
        b=C2NJgeOwFzr9oVTvgmF5F5fIQV7jqFH9UF2wDnjsyFMbk2GSqxupoRqh+lT1pjH+7S
         89sVe+O2A6+Snyh2bF+Nslm+xKY611ND/KjnTxY4qKX7W+pWM6hK9p3VtPWlGxPXLhVM
         b0QiDdxo78bCz4wMX0+I31nyhhU2mdmBk04f4qNgukF34Ud1fqro4xRhSnSMMySbAzwp
         kmnumpR25uhJmmf84H+VGD9MoKc2jvWhozSyiHyCWoMDvS6mX9djKqtqJ6LnxZhRWDfv
         7pd8I9idfWeP16PGBQc4v33XTjGdFPCDuweIdSi4eTCH9WDCeSPjHZGVclMUUetChQTA
         84lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=g55n3U94xpLDFOvzJs9Eo4kgyUh7IEAt9O35fGjHeJU=;
        b=pqIWJfZEC7v7vW92jN5xwVSkvwmzzzDuQ2dQsjvXiaQC8QpgOcepSe9rT7A5kn6CmE
         svg4+PS6/dNPnLrQ5NCYKmorO/wrGAj9XxAFSNODCX2ZO1eRywnYLPZ1aBN3Hk9OilZP
         zxs4ZQyyG5ebLCM4zIiDan7KXkSZgC1PjuB7LieughNBuNxAi79g6V4tF7C7r09Gf/+B
         DaebzvdG9yEWJgx8W1KPrqthBonTAGYhWQ4ZjklU/L6q4q6fZd6wbSGRXEQFPxNX65pq
         9ZbcPfsE8BGaDhbLvV1gr2avG08o+J51jUKRMNQZh1SM/bAoT0/SHfTCh7SIDhPYEEqj
         czQg==
X-Gm-Message-State: ANhLgQ3Hof04u3h+IjitfKg3xm6YPlKAfShVj2l7piu56K5GbmXBUbKR
	Do8L4uIACfJDXIvfxRgBLMueaZtN
X-Google-Smtp-Source: ADFU+vsCP5o+Q/BP37qFMZSTtHA8GqC64GB/CiL/By7kzObExqTB/3nPg4dHK/21B/4MyIy+Fdi1Sg==
X-Received: by 2002:a5d:490f:: with SMTP id x15mr440505wrq.47.1585329925347;
        Fri, 27 Mar 2020 10:25:25 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:24 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 01/13] systemd: Use PACKAGE_BEFORE_PN, not =+
Date: Fri, 27 Mar 2020 17:25:08 +0000
Message-Id: <20200327172520.62888-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327172520.62888-1-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>

By using PACKAGE_BEFORE_PN rather than =+ it's clearer how we expect the
package ordering to work. It also avoids the possibilty that dev/dbg/etc.
artefacts attempt to package as part of these packages.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3: None
Changes in v2:
- new (use PACKAGE_BEFORE_PN)

 meta/recipes-core/systemd/systemd_244.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index c5c0ce4bad05..f0cf102dc250 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -305,7 +305,7 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
 
-PACKAGES =+ "\
+PACKAGE_BEFORE_PN = "\
     ${PN}-gui \
     ${PN}-vconsole-setup \
     ${PN}-initramfs \
@@ -319,6 +319,8 @@ PACKAGES =+ "\
     ${PN}-journal-upload \
     ${PN}-journal-remote \
     ${PN}-extra-utils \
+    udev \
+    udev-hwdb \
 "
 
 SUMMARY_${PN}-container = "Tools for containers and VMs"
@@ -578,8 +580,6 @@ INSANE_SKIP_${PN} += "dev-so libdir"
 INSANE_SKIP_${PN}-dbg += "libdir"
 INSANE_SKIP_${PN}-doc += " libdir"
 
-PACKAGES =+ "udev udev-hwdb"
-
 RPROVIDES_udev = "hotplug"
 
 RDEPENDS_udev-hwdb += "udev"
-- 
2.17.1

