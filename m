Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web08.2712.1604432278384523223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 11:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p2eAVia7;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id w65so15179363pfd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 11:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F2/xrQXSmbdAfqLPzP+dOLYBW9URXMBq9PwMNNuhrQw=;
        b=p2eAVia7XJgUZ8PKi5deeFIVYcQbmp0sUK8ie+saMNuYrohmlTdeCYNbsfmmTHi/qK
         sxOdeWcPlpXCLPItKdKC8upZ/6uDEPa7SUs775LTmWXSY1tsylLJEIcCO1pQwuJFs/r3
         ZwL5j62WDCDKtTF51WSboWHFFLm3J2ZCLcSAGShkC1tplvK9y/jpKx7V5isyWtPdN+II
         /fh7paJ7B1GrAheVQESp3p7hFjnboasMNbfzWNLGIY2jmhFSi+h3brXnbcOvJVd4XL4x
         SbWDGIMRI/Z5PZ21KHpimxb40bP5fwv8+HPN8rrEFy9UFNT9hEcam1IQuhp4TQ38gP8y
         L4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F2/xrQXSmbdAfqLPzP+dOLYBW9URXMBq9PwMNNuhrQw=;
        b=ebZDnrxgd/gRV56eJJODWspz1NzDZ+/v+nqBVnMRwQEN8tkb+IHrWTDuJSnShhDNK/
         /h1YngqQJ7npKDuNCdZnhjAV9R9SLzMbzqBUo8FpqbgiOL9EC6eKPv7hj+iGlQA3NdYv
         Dtz+HWz7jQA28TxSQZ8efi7iQCItQSr9eJ33pKORukrgKGYbTIli9u0VVjI3+koFzoWQ
         vNfPTnb50uS8AFoWqBnuL5PBpTKpRq96eqMrVJcOFRM+umAM4fa5FhPt1yDLM2t5Vuz2
         1h7rOG/ZZY8VvZALwlpTTF0z0jT1zBiHGiDD7bhsMrbzwHTKMjpvhcCcDWY/lWLEqfiW
         Zmuw==
X-Gm-Message-State: AOAM532ipcxsGcgahAGBC39mxy39BTiqQbsvSAnrpDlD+IM0wB1gGH+v
	oAyMDwdc0omvt20mCTukmYfAvuEttJLiPw==
X-Google-Smtp-Source: ABdhPJwIunQU4HPVo0f6q3cEaQ61cRbWQ5bR9W+2zyBCDqmClJ96Tx7+POAJ5ALBeRKE6J9IbyUmzA==
X-Received: by 2002:a63:3116:: with SMTP id x22mr5758645pgx.278.1604432277518;
        Tue, 03 Nov 2020 11:37:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id j5sm4208247pjb.56.2020.11.03.11.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 11:37:57 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rt-tests: Enable only for x86/ppc64 architectures
Date: Tue,  3 Nov 2020 11:37:53 -0800
Message-Id: <20201103193753.1621431-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It needs frc() implementation for oslat, this is new tool added to
rt-tests recently, and there is no easy knob to configure it out at
present

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-rt/images/core-image-rt-sdk.bb | 8 +++++++-
 meta/recipes-rt/rt-tests/rt-tests_1.9.bb    | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index 624b7d9430..4f2fdf12c5 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -15,6 +15,12 @@ DEPENDS += "linux-yocto-rt"
 
 IMAGE_FEATURES += "dev-pkgs tools-sdk tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks"
 
-IMAGE_INSTALL += "rt-tests hwlatdetect kernel-dev"
+IMAGE_INSTALL += "${RTTESTS} hwlatdetect kernel-dev"
+
+RTTESTS ?= ""
+RTTESTS_powerpc64 = "rt-tests"
+RTTESTS_powerpc64le = "rt-tests"
+RTTESTS_x86 = "rt-tests"
+RTTESTS_x86-64 = "rt-tests"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.9.bb b/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
index 2834cabcd4..1fe0bd5cfc 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
@@ -16,6 +16,7 @@ SRC_URI += " \
 
 # rt-tests needs PI mutex support in libc
 COMPATIBLE_HOST_libc-musl = 'null'
+COMPATIBLE_HOST = "(i.86.*|x86_64.*|powerpc64.*)-linux"
 
 # Do not install hwlatdetect
 EXTRA_OEMAKE += "PYLIB=''"
-- 
2.29.2

