Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.10036.1618921888294091689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 05:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B69NvWqD;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id z2so2058129qkb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 05:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hwMFnhcJK6b87qrPILL92II9LiYrH7Qv6LrkE4zf6uU=;
        b=B69NvWqDHOe/GDKLC+H3U1Ggq6h/YyXbl3eJx27qG4IYZSRakMicIrce+Aowo1E8M2
         ctuz18cNkAHumE7eOdzooLR+aBFqhN/YDGiCBXnSblS1H0EfAjao+MkfC+aGF8fL7eAl
         mOn/eVhOby50DO160fevb18m1t1OTPQ9nMoEgU5HT/P/C+f59p1yLwqKBatApKQ23v55
         92skUB1551NstuKeagjA98TcNopnzQ7InQjpnlMmH3WOAmBuyVH+fdXaaEiq8eVrQwbO
         WO8rjqcjPTgJKKyTFqxbLeB5MggQc6hcYvafoGo2+Lhdg3fLHarwHL41k4Y5bNzCr2jK
         N4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hwMFnhcJK6b87qrPILL92II9LiYrH7Qv6LrkE4zf6uU=;
        b=msofOIKbBBRf/WsuYEJ/RN4UdZPshZzTY0E1wpebhq5naWRkKwDDayeP2nm+lO8O64
         /Yf/f6e/I0DBbkTn2yCxsn147UewphQS5T1nIKO15CidgnMtgio0v7lrX9lsuREJQLwn
         qeQcMMjzfqD69MRgNaYrYmDaoQ5d8gHBqP/Qu6kD8UbKf2pnaGHpqM0tlBoNbhWCFK/h
         C3X25qyG48hl7lvMt16ryc7SUDk1J6Se3tgyB0fLyoGjTGvQydJ6nbYEfKvXTfwjkYD8
         fKWuLi1su//ukxoAIEx10NbJr6ALIy2JKYdkiviyy5FAQZtt0Eu8XNzNpbEglmXQreYj
         mN8A==
X-Gm-Message-State: AOAM530+ss/HoHqXrh7ijRzeheX0MJCliGoLb+b31n/wRc8kyv0qJJ1H
	fk8IUvFSgXGixmCDRuOSu9Y=
X-Google-Smtp-Source: ABdhPJzJWcd7CD3nJ8D87qgVs1Akfft9LOxDarVejECuNH0UvfCz3h6pN/QHH5Ic34fSjkCKwZNr2g==
X-Received: by 2002:a37:4042:: with SMTP id n63mr16710347qka.501.1618921887416;
        Tue, 20 Apr 2021 05:31:27 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id v65sm12231946qkc.125.2021.04.20.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 05:31:27 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.10: fix arm defconfig warnings
Date: Tue, 20 Apr 2021 08:31:26 -0400
Message-Id: <20210420123126.63409-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

A recent fix to the kern-tools promoted some previously unseen
issues to warnings. This commit fixes them by tagging some BT
options as non-hardware so they won't generate warnings if they
don't appear in the final .config. These are sub BT options and
shouldn't warn when/if their controlling option is disabled by
a fragment.

    40a967b115f base: exclude some BT options as non-hardware

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 20faff811a..dacff74bce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "ac98a75ef2bc550f67454bd738ede581c8846ff3"
-SRCREV_meta ?= "b7125842b7ce188e7846a49fcb15a71c54806d6c"
+SRCREV_meta ?= "40a967b115fdbac34fc980d0e27ac2373a031189"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 54575a7917..21a2e89115 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "ee7efde0c94e8b2eba1a5a2709f2d21874ac7525"
 SRCREV_machine ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_meta ?= "b7125842b7ce188e7846a49fcb15a71c54806d6c"
+SRCREV_meta ?= "40a967b115fdbac34fc980d0e27ac2373a031189"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e93e41c69b..e6859a2319 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -17,13 +17,13 @@ SRCREV_machine_qemuarm ?= "4f13e8499f2bfc9d95dcc70b981ea16351ff088b"
 SRCREV_machine_qemuarm64 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
 SRCREV_machine_qemumips ?= "64f8949180b1a6375abef20eebf735e853701c71"
 SRCREV_machine_qemuppc ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_machine_qemuriscv64 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_machine_qemuriscv32 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_machine_qemux86 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_machine_qemux86-64 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
+SRCREV_machine_qemuriscv64 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
+SRCREV_machine_qemuriscv32 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
+SRCREV_machine_qemux86 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
+SRCREV_machine_qemux86-64 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
 SRCREV_machine_qemumips64 ?= "6bf49ed9b223173d918b7c0140b8d0561bc2674c"
-SRCREV_machine ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_meta ?= "b7125842b7ce188e7846a49fcb15a71c54806d6c"
+SRCREV_machine ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
+SRCREV_meta ?= "40a967b115fdbac34fc980d0e27ac2373a031189"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

