Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515BCC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 16:24:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.36360.1644855859210104036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 08:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JXI5ospB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id e3so27840882wra.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 08:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vztSoHSG7A2ddGDzoYTRh/AsSmY30YSfJFNijEsoEqM=;
        b=JXI5ospBZ1Sm0VmW6fwaCotNNEM/KQTMPsiGO04a2rMagYkSbubj1rCVacgI7KB3Oo
         b43pW2k3+K016POf6fxn1uzfyjPquL7bEVtxos0+XV9iE7DFCGwKwnXc8idMMCda4VGy
         +rvzSqe2YxjchSdPOMHJsSev52kT9r61RePoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vztSoHSG7A2ddGDzoYTRh/AsSmY30YSfJFNijEsoEqM=;
        b=Xdkz8nDa+O7MeOCIv4WU45xWgHMsB8bdXGlNk1HAOiuUYiCAnHgHSJizHuzE8iAgNs
         S+jHpsvCyHdobz2nlDDrZ+guOUJrhMW1QKem0TuJdL/9WMP/c+fQL/KtWOUY1hpst04e
         vmUzAYqP8AzXEOAhPjrtlBpzMf5twSrrwaoIXB8VqKRbQzIA7JLskRQ2avbro8+PiYkP
         0+tZ469S+6JrIFNGpnAX8UKhLVwq9EphXOO96JRZbRRWkOzhNJnllyzEAFG2/9yVtOB3
         95cagdHw6oSlmRT8F2WCxfDwqC6FgBNtGzEPiXuiWGVVshPYpMUDaivZuUAl0zPJzdxg
         6JCg==
X-Gm-Message-State: AOAM5302BWv9QmbiSaM3hyfzx5WpFKrI0EFhbz9+H0Jm9GJX4NA9Y45c
	BE7Jhp7p04jdVRejv/BVNXLCO6pKcyG6KPiY
X-Google-Smtp-Source: 
 ABdhPJyLwlXhdlsu7rGhD2T3C2FJchjsk2kp7TApXwOhq489lji+RU3v9N9qxw3+EB2oBBhxFw7nWA==
X-Received: by 2002:adf:e841:: with SMTP id d1mr316807wrn.293.1644855857501;
        Mon, 14 Feb 2022 08:24:17 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8594:17f2:9d48:b842])
        by smtp.gmail.com with ESMTPSA id
 bg23sm16367820wmb.5.2022.02.14.08.24.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 08:24:16 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ltp: Disable proc01 test
Date: Mon, 14 Feb 2022 16:24:16 +0000
Message-Id: <20220214162416.2844807-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 16:24:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161722

This test has history of hanging on arm trying to read from /proc/kmsg and it has
reappeared. Disable the test since hanging autobuilder builds are annoying. I suspect
there is a genuine race on ARM somewhere here in the kernel.

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


