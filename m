Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.25053.1598550850438803992
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 10:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QFHtw3cg;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id t20so5211783qtr.8
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 10:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KRVkzGIfuP9UcJhA/l4tIpggAj/72bHh1diG3ncSpgs=;
        b=QFHtw3cg1TUhMOuJDlwKgJ6qDYU1rzyNeD/fDeEtydiQCoxdINjXCIGcH3mhLnO/k6
         3cB2u6YrtDBX6RzKE2xmgaWQ57TyrCfVMae6/OM/lsPk/kEH0n/Icd1ZkvMSsgZKMEJu
         yz13DZZ131tRGHhb8zemDH7ChzN7GWo/fJWoeuD6rdSJbG/MZ2mtEOM1x+2oCVMvzia0
         CTgVyTNg0BBqH3h4PzOT/GKnwOCyexeo8hxPY7DyakTOwQ67lEWoZ34nx/qWxy7NGLsx
         vPfH729cHBdBZYGFuDLtfvYaZeN12uu1ipryQuohMqrFBEoCHtFKhwMd7qUu9ebhz7vj
         flwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KRVkzGIfuP9UcJhA/l4tIpggAj/72bHh1diG3ncSpgs=;
        b=eyVo7bsO9hanlvMmQ+j6+AD3hdTcluilU+pAat+N+ZpEiHmxYRL4wsFsjyt/qTrZK+
         DfQWkEIrYSR5c71RB8GEyHcyWr6J9+h3+I9nNDj17ca+UAVkeWnr+3o0Nv/AC+xPG3Bj
         DLGIo/Dh5SUc22NCmadrlJzIr3avbZMUefWvWV5B8YjIrrxN9gTQq/b0DD1s1o+L0VG7
         3XFUwGsqH9GEQ7Djr3ng7LaNJXshESQrZBDQwE32ys1FAVu6PJLmvY+k+My1MXaXaEdV
         xbybKxcsTDogHij+mdVWOFypvs7ol/6Pcy4oOhOtoQiW6a72N2KEEKUuR2NR7erywJ1N
         N4AQ==
X-Gm-Message-State: AOAM530YOIF+4nGgGGDSLogiwMvyZDuSJTPwo3uvUO+Fe6E3QmByMXjD
	IkahdgIAyTBxnz7f3Xb0ugI=
X-Google-Smtp-Source: ABdhPJzLGA/ABLM6qVFx499cgRfC5qn6Os4gj4IM0KblGqgO95YIxMkdMAUDZvTrjE8gdOmgko+hxQ==
X-Received: by 2002:ac8:37bb:: with SMTP id d56mr10835710qtc.222.1598550849581;
        Thu, 27 Aug 2020 10:54:09 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f4sm2339963qtp.38.2020.08.27.10.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 10:54:08 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/5.8: disable IKHEADERS in default builds
Date: Thu, 27 Aug 2020 13:54:01 -0400
Message-Id: <642bd810150ce2b97d656391fc7da976950d72d0.1598550535.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1598550535.git.bruce.ashfield@gmail.com>
References: <cover.1598550535.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

A patch from 5.4 wasn't propagated to 5.8, and IKHEADERS was
renabled in our default builds.

This cases reproducibility issues when kernel modules are built.

We haven't tracked down the root cause yet, but for now, we still
don't want reproducibility failing on builds.

There's a dedicated reproducibility feature available for those
that want to enable the feature.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index f8758d2b1c..f956f04d53 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
-SRCREV_meta ?= "7ddf21c67d219078d369988270f008bf8d730b1c"
+SRCREV_meta ?= "0a4bef3856894e8bca3c74c97e7924ad262c0dc8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 53145287bb..ae3b82b86a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "657076afb65e40e322bcc3b2bb8eeca590e20912"
 SRCREV_machine ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
-SRCREV_meta ?= "7ddf21c67d219078d369988270f008bf8d730b1c"
+SRCREV_meta ?= "0a4bef3856894e8bca3c74c97e7924ad262c0dc8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 7b2844699a..0f162f87be 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
 SRCREV_machine_qemux86-64 ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
 SRCREV_machine_qemumips64 ?= "768aed7c0609f38222ee7672981a9b60c943f4fb"
 SRCREV_machine ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
-SRCREV_meta ?= "7ddf21c67d219078d369988270f008bf8d730b1c"
+SRCREV_meta ?= "0a4bef3856894e8bca3c74c97e7924ad262c0dc8"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

