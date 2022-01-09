Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03A0C433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:28:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.24053.1641767282054402833
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nnmJ99bm;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id s1so23382456wra.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5HvZ54GdDZq7Y4MBA1cCMxIl4yR24cxbRqg7BZLq7nc=;
        b=nnmJ99bmsm97t1rn7fZMV53p9lNpZlIMU1PkqR+bkEmRKgq0JL5L9UrwhF5TucA2YB
         W53pgkefK0BfNJkKP/k2+wpBIxx/FECjJ2YrGtJznxSsiBtaBoplfFUXt8S3g5EIJOrk
         aUb/BIKYp8z4rwa2pc7cj1vg3M2d+Nt29UlrwOSfdfrbsf5HOx7xVHdT2pl6qGmFlwPf
         HZY06V2zX0EXGpGAWwBNut4MD03bTYvCNb3d6xT1MaMEDiVsBdjEoco7FtZFtI3+77SS
         kCzLfNJUZsJw2LG5oWCmtgGk7Be6BAWxJrxStYnFIovRagnJJgOorUOfKPeDfR512wSU
         HpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5HvZ54GdDZq7Y4MBA1cCMxIl4yR24cxbRqg7BZLq7nc=;
        b=Q4yKsykGfxD6EA3I5e1CXPppK/t621FlFjiXqtiKktL7zhYDCYK6Wj4t1cwxg77WuI
         4qORCt+TH6A1Eis92KCBeWsVIW4kHXzPnKXVRr20Lh4VIahNZY/daT6q6TE7Stf84f6E
         pMGyluUzLWErFd669zboMqXZBjhyr24HYmU+7yVG5URqdDZTV+UJ/2TcHB0PZW7X3eZ3
         2NpHcq7M8vmydRDQhhByfVVwC7XHh92gFhqFMh3lN5VTAAGcof/QOQXpwQNveyp8rUbp
         dz4WdL2Av7ELWnvFGwqxqq6xyWeIoKkEsa+06mo9i37Pco86sPxngfSagnYQitYtttYU
         rjMw==
X-Gm-Message-State: AOAM531BlkNsKrQ+RYeiUfPCUwkjbakGUVe238DY8Bk5abm4yEOPpGEb
	UlasU+TddmUdY8hJyrNjo4GkOtt2gJo=
X-Google-Smtp-Source: 
 ABdhPJz2jHe7yB2cFbX5ABjoz/Kh6xnbUuG3HO2ZfqNkc2EoC296oFi1R/SVxPxzxFuNwhkreWSfhA==
X-Received: by 2002:adf:f4ca:: with SMTP id
 h10mr63210251wrp.512.1641767280726;
        Sun, 09 Jan 2022 14:28:00 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:28:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/14] systemd-boot: restore reproducibility
Date: Sun,  9 Jan 2022 23:27:32 +0100
Message-Id: <20220109222732.2252416-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:28:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160317

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/systemd/systemd.inc         |  3 +-
 ...list-fundamental_source_paths-using-.patch | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-src-fundamental-list-fundamental_source_paths-using-.patch

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index e416f8d64b..6739018559 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 SRCREV = "402280118fe082122437638f53a0019c4aea81aa"
 SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
-"
+           file://0001-src-fundamental-list-fundamental_source_paths-using-.patch \
+           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-src-fundamental-list-fundamental_source_paths-using-.patch b/meta/recipes-core/systemd/systemd/0001-src-fundamental-list-fundamental_source_paths-using-.patch
new file mode 100644
index 0000000000..1d0887490c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-src-fundamental-list-fundamental_source_paths-using-.patch
@@ -0,0 +1,28 @@
+From 8e882df78ede98c15a3f2567fabebfde1d774b02 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 7 Jan 2022 21:20:15 +0100
+Subject: [PATCH] src/fundamental: list fundamental_source_paths using relative
+ paths
+
+Otherwise, the compiler takes the full path to the source file
+and writes it into the binary output, breaking reproducibility.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/22047]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/fundamental/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/fundamental/meson.build b/src/fundamental/meson.build
+index 287f0fe36a..954bdf150b 100644
+--- a/src/fundamental/meson.build
++++ b/src/fundamental/meson.build
+@@ -20,7 +20,7 @@ sources = '''
+ # for sd-boot
+ fundamental_source_paths = []
+ foreach source : sources
+-        fundamental_source_paths += meson.current_source_dir() / source
++        fundamental_source_paths += '../../fundamental/' + source
+ endforeach
+ 
+ # for libbasic
-- 
2.20.1


