Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.315.1619279805992931152
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 08:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SNBCPRSG;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id m17so655843plc.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QZy4u2bgdLOzUIysKFo7gtR/IOFYnJiReKNiTsrZooM=;
        b=SNBCPRSGem1CEHmyq8Gcw4CLNgbK74IlW/FrqeXwtfWiYNgxvfKhNydT6Xx8vYQbV+
         I1i23BKB+PYSkVtaVMEBX7GKt0b2Vd6iUitRWx0FVjfn49lG7daKvVwY5TQw2rES18Dj
         q2UhK88U1J2NDfZDMgd84TIdLDvkjm3xE7GkkIoT8y2HkBlYgcgWLG+ytL+pU6UufNig
         67oShOEPebfAfopHwN+BRDyiQ0E55IgbEr8iM4DU5jRNHklHCq/IIYFauM95HFOgMjrc
         RXe7iKgwmWDaYglWUePybi3T0FiOfkRFaOOyKYpzbCsAwPJPp7CpcLGFliJQP5D9Tfyb
         eurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QZy4u2bgdLOzUIysKFo7gtR/IOFYnJiReKNiTsrZooM=;
        b=h/nPrejztHs9JZZnES5gvPflUsgqRs6NxJIGV7USB6ZZgDNXgcS2T2Fif0UjlpZKsE
         vzLHvfc7sEqJHjbrh6hLDwtZEuXBMmXV1sD+mxeRo4iBhuqTgusDWr4Emt/zBvIgMsir
         qcr2p5eMr4egC49BvY/wOXTneALZpN0U1ASa9JAC5YdiD+W/cEmm8xFU0p/oOY51QSEe
         fpI65wd2nOgJrQ4CzvlVaYRmazoQv+IR1tRUM3zD9zvsEq4KX5KPw3aH7/r6uoL1LP9Q
         KmVUPCOALKqFbb5+hYPI4RZdA92bqXgv+iEtlHajMnmtR2MEoAx4mW1uzCYeIYxLTeyh
         xd4w==
X-Gm-Message-State: AOAM5313niGzw3TQvSRKCmdn64gmbEtfByU75TKBbE3K3yjHJ562cqEN
	MOtez0HzgBSPLPAeAx2YFKR6l/7XyzXkgg==
X-Google-Smtp-Source: ABdhPJz29QKOLfWAZ/S5uTRT5AdO7m5BzZjof9FXpP73YMwy+8/YvCeMWAzuAitMThr4AMLByPIWDA==
X-Received: by 2002:a17:90b:88f:: with SMTP id bj15mr11986336pjb.147.1619279805477;
        Sat, 24 Apr 2021 08:56:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id a20sm7198299pfi.138.2021.04.24.08.56.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 08:56:45 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] packagegroups/packagegroup-base: add seccomp grp
Date: Sat, 24 Apr 2021 15:56:38 +0000
Message-Id: <20210424155639.1131482-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424155639.1131482-1-akuster808@gmail.com>
References: <20210424155639.1131482-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows for inclusion of the package when
the FEATURE is set

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 6d4d7e6f7e7..3482ea43133 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -38,6 +38,7 @@ PACKAGES = ' \
             ${@bb.utils.contains("DISTRO_FEATURES", "ppp", "packagegroup-base-ppp", "", d)} \
             ${@bb.utils.contains("DISTRO_FEATURES", "smbfs", "packagegroup-base-smbfs", "", d)} \
             ${@bb.utils.contains("DISTRO_FEATURES", "zeroconf", "packagegroup-base-zeroconf", "", d)} \
+            ${@bb.utils.contains("DISTRO_FEATURES", "seccomp", "packagegroup-base-seccomp", "", d)} \
             \
             '
 
@@ -76,6 +77,7 @@ RDEPENDS_packagegroup-base = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'ipsec', 'packagegroup-base-ipsec', '',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ppp', 'packagegroup-base-ppp', '',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf', '',d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "seccomp", "packagegroup-base-seccomp", "", d)} \
     "
 
 
@@ -343,3 +345,7 @@ RDEPENDS_packagegroup-base-serial = "\
 SUMMARY_packagegroup-base-phone = "Cellular telephony (voice) support"
 RDEPENDS_packagegroup-base-phone = "\
     ofono"
+
+SUMMARY_packagegroup-base-seccomp = "Seccomp support"
+RDEPENDS_packagegroup-base-seccomp = "\
+    libseccomp"
-- 
2.25.1

