Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.14113.1615070047045700625
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Mar 2021 14:34:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YJfSFuiO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id y124-20020a1c32820000b029010c93864955so1531726wmy.5
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Mar 2021 14:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BUOBriIGGU2npxSLR+dHarCqWeQ5u/hrMNcEaKgz084=;
        b=YJfSFuiOSO4PCTBv4A0GcgTXBonnsED71srisaUpxZ6KbAdDcyf8intoQrOhlQywNx
         g8wlJe4WOx8vRGAJvukkb6w1HBKgQqf7+mKnH6/sLGdV76ApRqkJ89tSDW5nyUo/FAPI
         2I1PeFlEz2W5WLPQ761fn3cKWeQ+oH+7z15pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BUOBriIGGU2npxSLR+dHarCqWeQ5u/hrMNcEaKgz084=;
        b=VDgQOeDJ3eO1niSrwRQ77Qb8PfSEXGCZwJTXOs67ZorfDoLsKQrcGQC8WtydKMHGKo
         RDShJaMts8kfZsj6NvmKcPUUNmBbey9gZQuHPhqdQmfyOLxEJtv4dClxW7THpbLwsVl4
         sVcvj4xuD5+GOdVY1lIU0h6llgokH/+R08za1cNOU5P7MIDR4V/1sYDShlgcUFDEKyBQ
         XmUlAlq2PVk6ykSN/iF2UQueRzLmqYqY9OtdV+XoeG057vTYcdgOxCD9MWBmaDk+uUND
         U08riOrDkx0Fwybo7XhJsrmm2qfuO9CbGLXyDEdrpcge57y6kjOIfBfSTEI16q0XrjxK
         pV2A==
X-Gm-Message-State: AOAM532L/GIHLckbxO8g/J6PKRlyoRN7CplA0x9QoCZ751EAFfSAvXVU
	154IptjZaQzW5BzYczrXakvKmfXVV2Qy2g==
X-Google-Smtp-Source: ABdhPJxi+O9H4dVX33SMU6Cbzj5AYb3Vp6dy6uyixG8wQtdP5+j+KPkMC7NP415lslkC4kQS+zYqng==
X-Received: by 2002:a1c:9854:: with SMTP id a81mr14570653wme.19.1615070045189;
        Sat, 06 Mar 2021 14:34:05 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ce4f:1a87:b380:4c7d])
        by smtp.gmail.com with ESMTPSA id c26sm11782688wrb.87.2021.03.06.14.34.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 14:34:05 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ltp: Fix another determinism issue
Date: Sat,  6 Mar 2021 22:34:04 +0000
Message-Id: <20210306223404.2361411-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the other fixes there remained occasional problems. Fix another makefile
sorting problem affecting the disktest binary.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ltp/ltp/determinism2.patch                | 24 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20210121.bb     |  5 ++--
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/determinism2.patch

diff --git a/meta/recipes-extended/ltp/ltp/determinism2.patch b/meta/recipes-extended/ltp/ltp/determinism2.patch
new file mode 100644
index 00000000000..ab08e8e5172
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/determinism2.patch
@@ -0,0 +1,24 @@
+testcases/kernel/io/disktest: Fix determinism issue
+
+The order of the objects linked into the test varies depending on the
+order of the files found on disk. This results in the disktest binary
+differing depending on that order.
+
+Sort the wildcard expansion of *.c which leads to reproducible binaries.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/testcases/kernel/io/disktest/Makefile
+===================================================================
+--- git.orig/testcases/kernel/io/disktest/Makefile
++++ git/testcases/kernel/io/disktest/Makefile
+@@ -209,7 +209,7 @@ LDLIBS		+= -lpthread
+ 
+ MAKE_TARGETS	:= disktest
+ 
+-OBJS		:= $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
++OBJS		:= $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
+ 
+ disktest-$(VER):
+ 	mkdir -p "$@"
diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-extended/ltp/ltp_20210121.bb
index 593f07087c4..325574a50e9 100644
--- a/meta/recipes-extended/ltp/ltp_20210121.bb
+++ b/meta/recipes-extended/ltp/ltp_20210121.bb
@@ -30,8 +30,8 @@ CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "4d005621edd109d119627eb9210b224a63bf22cb"
 
 # remove at next version upgrade or when output changes
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
+PR = "r2"
+HASHEQUIV_HASH_VERSION .= ".2"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-build-Add-option-to-select-libc-implementation.patch \
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-Add-more-musl-exclusions.patch \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://determinism.patch \
+           file://determinism2.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.27.0

