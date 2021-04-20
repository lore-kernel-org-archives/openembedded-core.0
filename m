Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.9881.1618921878528656620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 05:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZoT1eioB;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id a18so4718087qtj.10
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 05:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V1INWpMJkxLK1bi0HPxkI+HSlFZEzlDvSfc04NLS2Jc=;
        b=ZoT1eioBvC/GK6HfETP/WcXvNyA4tYrVfV3ebEl8jIDzMeXTLWLRCMkTKhtrfQQO13
         Ivx5RUAakRgldHSDpb7LTJL7hM5IeYLGTk9pHqdcRb/gxM3TAvi4vXGgu2rlUYOsT34d
         XQv/EWEzPIw7kaxlQqK/RcII0+G8JdIbK+9Pj1VXrXGpxD6E3zZ8WqGy92RNKFGW3C6m
         Kx/sT4isc5GBzhirttmUrA74I2U97gGV1MQSBexrjgio0eWkeVlP7+IB2F32sn7q+C/i
         HC7snajPjKug2MY7ZfdVQ9Mr1pQSUsPL/0sqqBQiBlb9ZnDu/0e8ErxI6cetfuTSnjl/
         LsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V1INWpMJkxLK1bi0HPxkI+HSlFZEzlDvSfc04NLS2Jc=;
        b=dwjrKCFN9LJsoPdriW9sRElDz0liCEABv1y5dzSPr1sJOrmSwGbKV5ylsKDDD6qInN
         3pJYo6Woa8et+4IjiLHTifozRzteNHyiPe+nA524zTerh01Brs4AkJQ8/kRXkcdUXskw
         TZB0nfyWRTbdPc3WolhHZupp4FTIzOWweLnLv6lN8+pEvf3q+kqAdltLwwroW10jISr3
         jUpIY2RP2QTSFaX61Dp7fX3ldokqjml/OUsSJ69TOLhncyX0HyxfU7UpOZ+BlfOvBv1R
         k1McdJ34zPK85pKQswtxShrhNwuPKDNgCGZSyFyoKH8Me3Fg7jP05/1rW/yYBIlOO84N
         jh8g==
X-Gm-Message-State: AOAM5320Pig4DJesPcY4PPBcSal7vcQ3bb5KgkzVNr9oKhL2x3cVir64
	/UVIncOnlo0borWAE6ozcNg=
X-Google-Smtp-Source: ABdhPJyT5085uHX28nnx8PBhz5M+41WQ96I7g4ikkE8rIA5txPNjBGLW64bdP0+O66oHnH000zn8Uw==
X-Received: by 2002:ac8:7c4d:: with SMTP id o13mr9741195qtv.369.1618921877654;
        Tue, 20 Apr 2021 05:31:17 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id t3sm3511218qke.72.2021.04.20.05.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 05:31:17 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.4: fix arm defconfig warnings
Date: Tue, 20 Apr 2021 08:31:16 -0400
Message-Id: <20210420123116.63350-1-bruce.ashfield@gmail.com>
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

    d7fd0213b75 base: exclude some BT options as non-hardware

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index e52c9ebe0e..a802a570a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "324e77d816cf6434507ab29140beb24044009efa"
-SRCREV_meta ?= "5017570a130f142365dfdcd043d84143fdd6e255"
+SRCREV_meta ?= "d7fd0213b75ce9b6206f63dbdd435ab326598642"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index f07375c761..1edc632de7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "8463db325b93f0669446f68c19334cfe11ffb9c2"
 SRCREV_machine ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_meta ?= "5017570a130f142365dfdcd043d84143fdd6e255"
+SRCREV_meta ?= "d7fd0213b75ce9b6206f63dbdd435ab326598642"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 4f056d6d82..3a9463af6a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
 SRCREV_machine_qemux86-64 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
 SRCREV_machine_qemumips64 ?= "996fe040c8d8d01a9af6be42dae3844d127471bf"
 SRCREV_machine ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_meta ?= "5017570a130f142365dfdcd043d84143fdd6e255"
+SRCREV_meta ?= "d7fd0213b75ce9b6206f63dbdd435ab326598642"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

