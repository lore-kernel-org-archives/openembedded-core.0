Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58534C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:05:53 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.7214.1651727151601613171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TtlljdGB;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id a21so3919616edb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CDyB6AL+cFf6Uf4d+nZrmgHEoTuPGw1GMuZk2ZcCBj4=;
        b=TtlljdGBJiluR6IYWLgoNxFG1kbQz8/INxXWjtmw4MlIL540zAthTHOvzrxnU5nO92
         e/OuRWZ9d+OImGasUo+osvXEbmXBsBSO8NLiRJnk03tTADjgke+2ATFsckBQRZqK4vFe
         CD+UGYg1fr1785ewNiVE06BiZ+MWxfztkq8ca9g0L/cW2WuM0MOAg4hxvkcB9GZ7/hpn
         V7z5tx6CNRJC3gPFiJBFZcm5cXw14uJKOOkUo0Vrw0LXXghXowqUgtivDeaHOLPNTlBZ
         +hTnmEk0qGkB8KcwX0boNcJNdXaOHHfKwv7oQ9aOqZhpDD/nfiFriuWhGPubA53i1IY8
         clrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CDyB6AL+cFf6Uf4d+nZrmgHEoTuPGw1GMuZk2ZcCBj4=;
        b=ZJyorGNwvEUy+FiMLinVUSpbI8TYY68XonUYy4NKrPWo8yMC0rPKv1LmnCFE+BGHhR
         LU/6IFKpUVEyqMIBO+bFxDzhbTLYj9ZW6dYUThE1XW0y/fr/dd0xXwPtA29qhVTydz+6
         3kTDX3pFXZs/q7MqWvZ8dRKdhYWLUBK2wCMMsKZAB9MgIGkXRLca/TNP9M6truue+LC7
         dsFpw3lOXQYGci/JA4PPPhZhBYdNcTLVLMRLWwGgKPjmgpBCY8ubBxaBtfqgzCizK0zY
         FkZVPbMxqOGdhVzzGHVhs95c6j7Qz5ehIqcLcNgYxLysHkcqmRpN8mN2q5wNP5xYB3kU
         tmvg==
X-Gm-Message-State: AOAM531gr/EdeGnFqDHjdIswTDQQe2Up4A+PAyB//wNIcmb2TkTXjY71
	OSJyvdtGNv3R/9i43KyCNDLgpLI+ft8=
X-Google-Smtp-Source: 
 ABdhPJz0++1Q/hTXrJm+xwAmr/WJ34A7qfSxWc9N8oKv2IOZw+UaT3M4JHSZic9y6XJHZm2SP7huTQ==
X-Received: by 2002:a05:6402:518c:b0:426:32d4:87 with SMTP id
 q12-20020a056402518c00b0042632d40087mr27482828edd.394.1651727150072;
        Wed, 04 May 2022 22:05:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/61] util-linux: upgrade 2.37.4 -> 2.38
Date: Thu,  5 May 2022 07:04:47 +0200
Message-Id: <20220505050544.651895-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:05:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165232

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...util-linux-libuuid_2.37.4.bb => util-linux-libuuid_2.38.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                    | 2 +-
 meta/recipes-core/util-linux/util-linux/run-ptest              | 3 +++
 .../util-linux/{util-linux_2.37.4.bb => util-linux_2.38.bb}    | 2 +-
 4 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.37.4.bb => util-linux-libuuid_2.38.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.37.4.bb => util-linux_2.38.bb} (99%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 982ec669a2..c9bddfb7a6 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"
+SRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"
diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
index 3a910be121..097107cd09 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -13,6 +13,9 @@ current_path=$(readlink -f $0)
 export bindir=$(dirname $current_path)
 export PATH=$bindir/bin:$PATH
 
+# losetup tests will be skipped and/or fail otherwise
+modprobe loop
+
 ./tests/run.sh --use-system-commands --parsable --show-diff | sed -u '{
       s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
       s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
diff --git a/meta/recipes-core/util-linux/util-linux_2.37.4.bb b/meta/recipes-core/util-linux/util-linux_2.38.bb
similarity index 99%
rename from meta/recipes-core/util-linux/util-linux_2.37.4.bb
rename to meta/recipes-core/util-linux/util-linux_2.38.bb
index b39020884f..8a7b47a0c6 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.4.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.38.bb
@@ -138,7 +138,7 @@ RPROVIDES:${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev"
 
 RDEPENDS:${PN}-bash-completion += "${PN}-lsblk"
 RDEPENDS:${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs findutils grep iproute2 kmod mdadm procps sed socat which xz"
-RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-sd-mod kernel-module-loop"
+RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-sd-mod kernel-module-loop kernel-module-algif-hash"
 RDEPENDS:${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY:${PN}-swaponoff = "1"
 
-- 
2.30.2


