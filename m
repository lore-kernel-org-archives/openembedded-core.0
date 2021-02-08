Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.35328.1612792454199791456
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=anuCAmdK;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id h6so15655703oie.5
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aTzxIThLN/vFBh+Q5Dzhr0XGbF76JzsbQe2sNMII9Eo=;
        b=anuCAmdKuMNHZsI3VGYIky4RuxH/sBSRTfJIjdIEOcpq5x5qLSheFtMt0sGgqUoips
         lhSA4QxL3YSst5CmkoediKN5VArOdIWOsb+HfCOd7dFxYrK/EPoS8oSsLbWA7Q+ahkwg
         mvE/s/JAcctX0mz+2BNgAmQR10NbWIS/XGlJklUoA9qpu0PQEuDqs4S8rHBf+x8AkZMp
         8YEQPPpRVBGICig4DXTeJ1zjIEOQT+830AwN3Vc+Ln7iqxUStlWINFIS768VQvAJZQwI
         fn2jUYO+e7zeQoUCim+4o68/vABdsqDWB1qnbvarf3dUjeWwCfNWp2NJLtkRw3BkLYpV
         GJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aTzxIThLN/vFBh+Q5Dzhr0XGbF76JzsbQe2sNMII9Eo=;
        b=bOQ5wYdYLLt+XsHmD3pXkUU2R7J/HE7O/hDy61URR3thqfIuuYjqU3poDWe6amDPHE
         GKa+pCnaUiXvE5F74Gmy1ciJDRwNrnoaWkSJeHSRWoHVkSEu9wA1TLrd3SQmfXJWZ0Kl
         g/Sdn6cSe7oQvKm8frjuVjY58KqaIFDb63ZRp0tpgE0EqPVxo8NImsCN4JNEpoy9ziwg
         WRv2iuAsujuhoifjmKlICp8lKEe1QBRV9KCVmnB2cyscBfTx1l+JSlh7TFaU4gfwqOPf
         zP/gNwabKvr+SKw3UbShuFwhZoa+Aug9CDX4DZ+pqwK78ogWs0XL1QolwNEOm0mq9tG4
         PJKA==
X-Gm-Message-State: AOAM532rdEZsAMUSWpvRj3XhJyoHOL8B4iF/NnCs0VWP7QRZrQ5KIvvJ
	j826edvZu0RJwUHWsBUaZl/SL+sEoc/eEgtPdAM=
X-Google-Smtp-Source: ABdhPJx0PAuzZDtuztXevrOLE9O7Ax6XaPLBb2O1QY+5zfImdmMZ134OFUc4pMq3FQ+drx6OFtZGpw==
X-Received: by 2002:a54:478c:: with SMTP id o12mr10865239oic.28.1612792453121;
        Mon, 08 Feb 2021 05:54:13 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.54.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:54:12 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/28] linux-yocto-rt/5.4: fix 5.4-stable caused build breakage
Date: Mon,  8 Feb 2021 03:52:05 -1000
Message-Id: <843401ededf7e1246d0a472935776fc3b34bc04f.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.4-stable included a backport of:

   Author: Eric W. Biederman <ebiederm@xmission.com>
   Date:   Thu Dec 3 14:11:13 2020 -0600

     rwsem: Implement down_read_interruptible

     [ Upstream commit 31784cff7ee073b34d6eddabb95e3be2880a425c ]

     In preparation for converting exec_update_mutex to a rwsem so that
     multiple readers can execute in parallel and not deadlock, add
     down_read_interruptible.  This is needed for perf_event_open to be
     converted (with no semantic changes) from working on a mutex to
     wroking on a rwsem.

     Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
     Link: https://lkml.kernel.org/r/87k0tybqfy.fsf@x220.int.ebiederm.org
     Signed-off-by: Sasha Levin <sashal@kernel.org>

We implement a -rt variant to fix the build issues.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e610fb7cc22447441f18a9b1bffe58aadb6aaab6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 027e1a15c7..4ca458ee8f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "06c752971a7cb66123ab2b3731044103fc5662e0"
-SRCREV_meta ?= "70cec8c033a6f5c48f0a93374f0bfc25240f14fd"
+SRCREV_machine ?= "6b0893e9fddb5473b181b29059fe64980f353c83"
+SRCREV_meta ?= "d676bf5ff7b7071e14f44498d2482c0a596f14cd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 8dfa5357bd..32fbf9dc55 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "c65142e64f3d705d0b978b44394d274165d872b2"
 SRCREV_machine ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_meta ?= "70cec8c033a6f5c48f0a93374f0bfc25240f14fd"
+SRCREV_meta ?= "d676bf5ff7b7071e14f44498d2482c0a596f14cd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 3ddff222af..89412fddda 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
 SRCREV_machine_qemux86-64 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
 SRCREV_machine_qemumips64 ?= "e4714b9bb683cf08909e6dc2e91fd508e56bfbc2"
 SRCREV_machine ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_meta ?= "70cec8c033a6f5c48f0a93374f0bfc25240f14fd"
+SRCREV_meta ?= "d676bf5ff7b7071e14f44498d2482c0a596f14cd"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.25.1

