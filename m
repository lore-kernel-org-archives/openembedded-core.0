Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195E9C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 16:23:03 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.36334.1644855781823259760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 08:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gUm1G1tg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id u1so13996308wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 08:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8O1SQOFNnYmF6ZISvZKBhnD2amq/GJbjN2CBwUFE+g0=;
        b=gUm1G1tgUa7vgcYF90RvxI5W/ruA41eWT1h5mkwSzlXu4NwCoGDuk2zrVJqFVyZbK8
         e4bOe9X8/QlrahWjZuFO3eKX4g1rF54nmzbpcSEmxtE8N3JOD2RHL61i5wd299nUoDsx
         emHU9vrZiCfeVj4B9Lfa77NTTWEjz3oH835Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8O1SQOFNnYmF6ZISvZKBhnD2amq/GJbjN2CBwUFE+g0=;
        b=8QNx61DCBeIs95MPQfYueRcMnAu9sCIxE0LwSgcisEAm00Fnk7Vjd1e2Uu2XEQ03Nx
         C+3XqCQNcQpxQUfWNxMSh0uohlzmJVj7K64D5bSqRaPTOCiBQgyuivhGIAgOQexW5dBs
         Osugy9VvYlgvHRH9CGwloHyJmBDyq1zEmYibierwy3hXXgEoiDxyCsHOwd+yrhtQemnn
         u8sUEdTYnrRADtFZIsM1BD8oBsLPPdaQ4cam9DbTM+v3BmTVi/xSrjuwMV2qRBIM/fZo
         r5CtcsiCH/ml7kmQx/YqrzSVWckUPt0PdNdtJEkb9ciLiJY/CXtnM/aDeUuoarqvOoVv
         hsnQ==
X-Gm-Message-State: AOAM533YvF+7T9lhwj+yiS0fSB4O35QldLmihxoVUc0fuZ0PtqsOwVJ+
	QoAqNXVBewQmw4WFYqJwlBx7dAGOe/9Cczd1
X-Google-Smtp-Source: 
 ABdhPJzmwnf24wnFAN1RF9Pl23F7nOulnmJO4bS3ojYdHIaArC5/1Xoy31fSxKtuw1XqgKIDEa9V1A==
X-Received: by 2002:a5d:53c9:: with SMTP id a9mr312309wrw.672.1644855779615;
        Mon, 14 Feb 2022 08:22:59 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8594:17f2:9d48:b842])
        by smtp.gmail.com with ESMTPSA id
 b11sm2858056wrd.31.2022.02.14.08.22.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 08:22:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ltp: Disable proc01 test
Date: Mon, 14 Feb 2022 16:22:58 +0000
Message-Id: <20220214162258.2844710-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 16:23:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161721

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ltp/ltp/disable_hanging_tests.patch       | 27 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20220121.bb     |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch

diff --git a/meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch b/meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch
new file mode 100644
index 00000000000..f25a692dc0f
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch
@@ -0,0 +1,27 @@
+This patch disables tests which we've found "hang" on our infrastructure.
+
+proc01:
+https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1748 (arm)
+https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1781 (arm)
+https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/2782 (arm)
+(was trying to read /proc/kmsg, looks like a horrible test anyway)
+
+Upstream-Status: Inappropriate [OE Configuration]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/runtest/fs
+===================================================================
+--- git.orig/runtest/fs
++++ git/runtest/fs
+@@ -64,11 +64,6 @@ writetest01	writetest
+ #Also run the fs_di (Data Integrity tests)
+ fs_di fs_di -d $TMPDIR
+ 
+-# Read every file in /proc. Not likely to crash, but does enough
+-# to disturb the kernel. A good kernel latency killer too.
+-# Was not sure why it should reside in runtest/crashme and won't get tested ever
+-proc01 proc01 -m 128
+-
+ read_all_dev read_all -d /dev -p -q -r 3
+ read_all_proc read_all -d /proc -q -r 3
+ read_all_sys read_all -d /sys -q -r 3
diff --git a/meta/recipes-extended/ltp/ltp_20220121.bb b/meta/recipes-extended/ltp/ltp_20220121.bb
index bf567c6fb88..655f99f8381 100644
--- a/meta/recipes-extended/ltp/ltp_20220121.bb
+++ b/meta/recipes-extended/ltp/ltp_20220121.bb
@@ -27,6 +27,7 @@ SRCREV = "b0561ad8d9ee9fe1244b5385e941eb65a21e91a1"
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch \
+           file://disable_hanging_tests.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.32.0


