Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.407.1624812646863457145
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 09:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YXXtEvqB;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id e3so11754356qte.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 09:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uhIKtLSwPY/mTYCPqwTutki8hC0UdPky2Wlq7sR+TvI=;
        b=YXXtEvqBvg9Zlmqwgv1dUgUswufvfTNO/jKrx4JQDdItFSH/DUMgGCoWJ0zvoTm1mB
         syohziwzJEkkllqMhx+cgo2bam8hyKbb/5QaJdHbsFAi1Q33/1HkPgGmHpM0dmegEEj1
         krH9lUnz0gyqgAqRuu2gYrZi+ZNGxHWnl/LhDmm2YiP/2eqEER8S+QDFX2xp/CNsKi/B
         PGosHw6ADXqiNi8cqCAUkOXT8d49lYpp+Xhdr6Jej2kER8WZN7ntwNK10p96KInWR0W9
         F5R1rsS+QDV1iuwKa5ChDTz2FZsq+KvFBGffcmNgHo9SgjEJlvwB02rdv7dbeCqeh4YI
         Yafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uhIKtLSwPY/mTYCPqwTutki8hC0UdPky2Wlq7sR+TvI=;
        b=m7nHC3RwK/Gv875KdhHbOBKF9+idJkbbGfCXpuALyUaJteGGBJXhUEfbZ/xYJTwerU
         ELTJisohbUrykilLmO6Igq27RiQj+eQ8pmhw/elxSx5esY6o4EKns7U6hBadw/3VTnzP
         g62rz/Y6sxsbRg4C7KIoy2CJPN22zglAWYlDYHTodjM48M3GeU9nYxLuoZNNjzRDhUqv
         2b1SxIbjYXcn3nBc5lHS3Ae3IUYr7YTGPWlVCSUp8md5p9guVf3qCaaaiyk1w+/Mr0+P
         DqPvNv3psnGN1kqARqo5xC19A8774oI713DuttH/fQ4bmZvWFRu9DSIqJ1fhs6cI+97Y
         2hZQ==
X-Gm-Message-State: AOAM530PJa/JH6mTPnGmux/kIDjdZ2k2vlzaNRorWphjxBRQ4ix1c+6Q
	Xhr35pOw1viyBBe8bqwm2aU=
X-Google-Smtp-Source: ABdhPJwqI5p5c5xwsMqJJ7kNhf/QsuuZOwqtx28iU66UgoOnCxo6vnpA682i/btaB8WxIbmchYt12Q==
X-Received: by 2002:ac8:4b4d:: with SMTP id e13mr15604167qts.376.1624812646030;
        Sun, 27 Jun 2021 09:50:46 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id b8sm7150439qtr.77.2021.06.27.09.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 09:50:45 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/5.10: rcu: Fix stall-warning deadlock due to non-release of rcu_node ->lock
Date: Sun, 27 Jun 2021 12:50:40 -0400
Message-Id: <f8468e583c358b82cfdf4c4388540761ae0f4e46.1624811389.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1624811389.git.bruce.ashfield@gmail.com>
References: <cover.1624811389.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    139fe7d68413 rcu: Fix stall-warning deadlock due to non-release of rcu_node ->lock

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb               |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb  | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index ea2c854649..f511f233b6 100644
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
index d73b1d0305..f5ade2992c 100644
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
index c3342da193..dd4aef7f89 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "efa48180fd02b074a2c9e18958fc9b7e4c9f1c00"
+SRCREV_machine_qemuarm ?= "17e89ca08f67fdcbaf0a3ae4c429602f76463923"
 SRCREV_machine_qemuarm64 ?= "139fe7d68413054f850e206ab749f97a968867a8"
-SRCREV_machine_qemumips ?= "aa324c158a84601d99949b7cfa5c376b9691cddc"
-SRCREV_machine_qemuppc ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemuriscv64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemuriscv32 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemux86 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemux86-64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemumips64 ?= "7bc9a08bf3b92db4fdb0225fdd23836c8f5c037f"
-SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
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

