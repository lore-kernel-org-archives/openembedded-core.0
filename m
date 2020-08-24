Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.560.1598291624294716256
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 10:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Up/F18Pv;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id p36so3459973qtd.12
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+FP2H9KeOzZ9OBg1ioP66BPBZneqDaEIfLUCbfpRBvA=;
        b=Up/F18Pvo40nfAOmNaif5yNve0552aNG7w3VLjR5rl44vW/y8ukiHf7rewrrbKjtvt
         vh/PyAB5jMTGEuWi/VNqeYmT6t9by8AnOVi6mynJfuamndbCE8nuUaVVfFvQbdZMozHt
         aRRbSHqfQxYsqpajLquhYkbffcLNGue3Tr/OePx7GivGm7xmcWZ374xcMXNvoBetoQL6
         rfp5DjuLikrX9Q1vsKfP/7goka8JgOFKo/aqnJY3MKKW1i032J7W6E5s1thq0AX93EZ7
         iNdUFr2y/17+LNErS9ObZx14dRViyKZ58WroP6FLttriRhiuHtOlXZA8aK5DhUo/Wn2q
         SxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+FP2H9KeOzZ9OBg1ioP66BPBZneqDaEIfLUCbfpRBvA=;
        b=YdymxkzWHxBRFY9NtOXYM3V9l3LfEWO6lgsYPbHyvtaAPCgEjchc9McNk2iGmbdxnb
         9orgLUy+NPWcoXHiPo0ywzvxbPO79wV615GvxqpRfbs76BXp4QevRtyWM/ybXL4+Fo1e
         sF6X0sDqP13sx0Mm1gGlHtOLiVsBF5rKt0Ae+bmE7QkF/p+bGe30+yf78g11yeOTATrm
         D9jWpAFMT3XXKct85pki7FJcIcNUogV+PekFncIsPW2bB04uZs+WD+309PLSV+389qDd
         saXv+Ed7DXGLoP0+qj+GDs6o6534OEMkAUu+KAADIWoGJyXqjvCnk/2ELUWcUgC39Z0/
         MslA==
X-Gm-Message-State: AOAM531rrBbf4dhh+3Aa0YSjQcqUHM+AEBYZmZH6EoEQ2A75/lmJJvME
	8ldopogr0Xz/3GmKJlAzCsM=
X-Google-Smtp-Source: ABdhPJwelkBr/ji7TX52iIOy9lnfoOnY3HMJKOsWY9FprmGXy6q6BK0iOPOke6ItvzUXP2Zf2cP5Yg==
X-Received: by 2002:ac8:4511:: with SMTP id q17mr5680992qtn.117.1598291623362;
        Mon, 24 Aug 2020 10:53:43 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id s124sm9871960qke.102.2020.08.24.10.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 10:53:42 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.8: disable CONFIG_NFS_DISABLE_UDP_SUPPORT
Date: Mon, 24 Aug 2020 13:53:40 -0400
Message-Id: <20200824175340.53702-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
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

