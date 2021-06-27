Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.5492.1624803244292175998
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AHBpr5dk;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id l16so5342885qkp.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 07:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=80/aaGdITj+l2oHG2+bodpnn1XmoWYcClASFVbe6VGA=;
        b=AHBpr5dkTZ7HeXoy1sGSsMMqj/ozjOk+PvouCL/rwM4qf31VfP9q8wMmvpejJtZsxm
         /Pt2XMVzWcLPKckNq1Ne4HMFoOnzMW6xQkzu+Ldn/0Wqgv+L952SDuaOvzB3zHGxZLLs
         tC8K0pqDLwbsDO1axi+jF3rPbMH0aKqTTl0Tnb90iab6XIQmhu9uAibHMrrTM0LZBfOI
         Ypb6CzIsEc/CVxyAYrjfRln/FuiSwgMZuzK8xmObcvVvW9tzd72ZHFhowwC7EsUeblG8
         n268ml1jumAQgSpHGvRp7lg/AHNCUGjhFjSxrs+fUIrNAQ0kNM7coUgGSEaI2aep2oDM
         bHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=80/aaGdITj+l2oHG2+bodpnn1XmoWYcClASFVbe6VGA=;
        b=eQFV7iyVXjowLAsGWr2GEJwSUB9oNtfZo+YC3vD1cSeoyQ6HlXUWkZCoC0k/4BA7x1
         P0E9grDzKXQZCNeCSZIiC19k9dlrnyKo9FPuYsXzH2Mfg+6JbcWQOTTRJ73rncnL5cdt
         P2hsmtRiB/qqXuNGkyN7kqWW4duDdSWYF1g+/nK5VXs1zka851Bp3R6/vid38t40xqBj
         5fkotBrLPcqPObZ7wiCrNTQKi2bkPlYS7qJkqrXKF/pnfWSblJaG1gFVYbp8gF5Oc+JU
         297mjAOWH4SEu+GotOpa17bjalTk9cmzBYyJ9v33SmFHLw01S4s35TybrdEsuWGIKBpo
         mbWQ==
X-Gm-Message-State: AOAM532h3JarYDXZ9vBc5e6yMw5G1IY6WxV6PJwhCRscUnn/tBmczch/
	558S3ouvwEHsKwfouQ4qTgI=
X-Google-Smtp-Source: ABdhPJxQ9v424f3+3gwy+k0YndWNQ+IrXfwT8f4kjVSz8qIIKj9P4zgGZQaFWHCtFoSylPJwnIZZBA==
X-Received: by 2002:a37:b12:: with SMTP id 18mr15507880qkl.366.1624803243471;
        Sun, 27 Jun 2021 07:14:03 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j8sm5496142qti.20.2021.06.27.07.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 07:14:03 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/5.10: rcu: Fix stall-warning deadlock due to non-release of rcu_node ->lock
Date: Sun, 27 Jun 2021 10:13:57 -0400
Message-Id: <9ff2e39879acd85e71017ae8f06b21c8da2465c1.1624803046.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1624803046.git.bruce.ashfield@gmail.com>
References: <cover.1624803046.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    139fe7d68413 rcu: Fix stall-warning deadlock due to non-release of rcu_node ->lock

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index b52e06d35e..fcf72cd99c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "74f60bcd7323d243e0f3d3db34021ae624afb61a"
+SRCREV_machine ?= "4a59bc57b2be77da9394b10eb37067da7d63b7a4"
 SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index e6ee6e52db..e6dfc0da2d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "20eb193a68fbdaa56ed9a49b97aef6a0eb9fbdea"
-SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemuarm ?= "dd1f9602f3e4e9dc177421ba12ce073ad2099a58"
+SRCREV_machine ?= "139fe7d68413054f850e206ab749f97a968867a8"
 SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 1e5a3df5f9..16e996e518 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "efa48180fd02b074a2c9e18958fc9b7e4c9f1c00"
-SRCREV_machine_qemuarm64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemumips ?= "aa324c158a84601d99949b7cfa5c376b9691cddc"
-SRCREV_machine_qemuppc ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemuriscv64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemuriscv32 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemux86 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemux86-64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemumips64 ?= "7bc9a08bf3b92db4fdb0225fdd23836c8f5c037f"
-SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemuarm ?= "17e89ca08f67fdcbaf0a3ae4c429602f76463923"
+SRCREV_machine_qemuarm64 ?= "139fe7d68413054f850e206ab749f97a968867a8"
+SRCREV_machine_qemumips ?= "bdcaaee7b7ce0e865670a2cee55b1974eb67357b"
+SRCREV_machine_qemuppc ?= "139fe7d68413054f850e206ab749f97a968867a8"
+SRCREV_machine_qemuriscv64 ?= "139fe7d68413054f850e206ab749f97a968867a8"
+SRCREV_machine_qemuriscv32 ?= "139fe7d68413054f850e206ab749f97a968867a8"
+SRCREV_machine_qemux86 ?= "139fe7d68413054f850e206ab749f97a968867a8"
+SRCREV_machine_qemux86-64 ?= "139fe7d68413054f850e206ab749f97a968867a8"
+SRCREV_machine_qemumips64 ?= "2f11a726a60ad9e8a48de6bc2101a993b461e8d1"
+SRCREV_machine ?= "139fe7d68413054f850e206ab749f97a968867a8"
 SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.19.1

