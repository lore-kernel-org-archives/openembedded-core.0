Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.2095.1598295648732811209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 12:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MVDxSm2u;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id s15so4278275qvv.7
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 12:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+FP2H9KeOzZ9OBg1ioP66BPBZneqDaEIfLUCbfpRBvA=;
        b=MVDxSm2uazfMUfgAdZSof6IEXdk2RAta+4+o7oSAuN4ujML/zt+Cqu+Yx4flsTc1Ma
         S/uM65YAgJ324PoIAtyi0RQMOTc6e2gmfDsqOf0bRzJwSU9/GOZKfb6YtNXUKuHSdBbj
         pcguNiXkdQffgu/MpkhhqEg2MzyDQuMb5mBP9qBGK/pBpbJrF4p9LrXIliTSlnLtP/ey
         +lUfxUBVN/rNtGL98o1SVp2eYPrUuikkfuJpiQq3le8l5LRxGBl0P+HSvtjjuRaDdEbf
         IQ8haaU5e/S7v1+8pAG+kuWsYjXxTX25wG0uXAmHg+cTCts02r6clDjEB/g+aDU45ReK
         Tjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+FP2H9KeOzZ9OBg1ioP66BPBZneqDaEIfLUCbfpRBvA=;
        b=tZtrwVlS7XsB6LvFMqSVfzUhcz1BtQyOYblrcwQVH7NeX9/vgmJFVxXSOh3IVEfew/
         pMDHTYHfazIu7yYKxoR1SHmmV3u4NGhb8sb7kzHH3RTOSp68dAFPUB8tLPEUDz9poq1/
         aj8Yuk0xXrlSdzTgJegCJBQUwnXJ5kvluzHGprzt2U4FrTyNCvtTNdLdSFzzpnXGARVa
         RIzs6bpH+q1eo9sdtMXSVi2gAlF78qd8qz00A1PtHJZhSKKD267YTYa06UFRAwUmq4m5
         q+EZoGucK4HtwXxxeRdBmkDQZ471/TJvFQcK3mnVoWOkydxq4PGQp0ojZNJhqmDpy629
         hBJg==
X-Gm-Message-State: AOAM5318ytcUgH+syLEkCdTll+jzxJF1882MtCDbh9SbZilR74jylCJ5
	fcHTZ4Y/MRlBmCNZ7SZsMxk=
X-Google-Smtp-Source: ABdhPJw3QIWRH0tfYlew0eMEVkSIvKruLXikR7VbKHU+Mdoj99+W/q4GNFTGSABnEalsENagzsnzbg==
X-Received: by 2002:a0c:a8c7:: with SMTP id h7mr6301388qvc.181.1598295647903;
        Mon, 24 Aug 2020 12:00:47 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f3sm3160826qth.56.2020.08.24.12.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 12:00:47 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/5.8: disable CONFIG_NFS_DISABLE_UDP_SUPPORT
Date: Mon, 24 Aug 2020 15:00:41 -0400
Message-Id: <20200824190041.54316-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200824190041.54316-1-bruce.ashfield@gmail.com>
References: <20200824190041.54316-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Some of our tests may run NFS over UDP, so we don't want udp
support disabled.

Turn off that setting, and we can revisit if any side effects
are noticed.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index b2d4995474..bf1dba1060 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "912adf166eb0688e011154048f5fa0e5863249c3"
-SRCREV_meta ?= "2f9b296099dc534d1c9909f34b1090d8d2280c9b"
+SRCREV_meta ?= "89db4beb484f8eca238bdd57554ebd7b55b78427"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 847b2623d6..308022ad16 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "a463c9ee9da138e9fd6f602b5a18352ddd241fbd"
 SRCREV_machine ?= "912adf166eb0688e011154048f5fa0e5863249c3"
-SRCREV_meta ?= "2f9b296099dc534d1c9909f34b1090d8d2280c9b"
+SRCREV_meta ?= "89db4beb484f8eca238bdd57554ebd7b55b78427"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 86f3e851f7..42d76f2b80 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "912adf166eb0688e011154048f5fa0e5863249c3"
 SRCREV_machine_qemux86-64 ?= "912adf166eb0688e011154048f5fa0e5863249c3"
 SRCREV_machine_qemumips64 ?= "21530680430bfb9f8a73fba97e6734bd4869a690"
 SRCREV_machine ?= "912adf166eb0688e011154048f5fa0e5863249c3"
-SRCREV_meta ?= "2f9b296099dc534d1c9909f34b1090d8d2280c9b"
+SRCREV_meta ?= "89db4beb484f8eca238bdd57554ebd7b55b78427"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

