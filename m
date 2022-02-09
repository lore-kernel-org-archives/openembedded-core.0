Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912FFC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 05:15:49 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.22828.1644383748509573525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 21:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RQfR/25N;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id i6so425516pfc.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 21:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0urcRUDyCEAkl53gp85zgYBIFqcuDNCXZ9WI1uIwBN8=;
        b=RQfR/25NPafsV3m7yxZ1qXGIfnLJwUNVV11iAjK7FUZ+MmYypuvluTnGiznlUXh7q7
         0wklzR3khu4udy8KFAkaZMZYtKWUDr5sfH88ck5J1swMV8BZyNO2b3ZYgTnp3XGCTaK7
         anTxmbIOMP/xOw0UyxKBMmG2zgLOKddd9ZOqu6TdcJcxz7N0XH7IR1oOA2ua+1H7AQ+c
         15EGAGvuvkiz6j5GzUdsNs9eqonTuXknZHKebZVmXa3pmSYARk8VtCW8qxXK1e/PKLSl
         qbPV/ZsLOuKa9OrHbN+egwjcUgIuiCU4/iru1awd5wm+D+JDaqxUqdZ/h7mIkXGX0Ipb
         GeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0urcRUDyCEAkl53gp85zgYBIFqcuDNCXZ9WI1uIwBN8=;
        b=qqR9mn9sOOUVkQHZlij5i68sKChoIwMSAQnze3POWa8/DnVuEMCa3tp0+ukBiCCAy+
         enAZX3B8kf80mqQBRtqqUZXlTpKB6Hjj7Q/DS1GH+N0xiGFHfck4W+/iJmi6yfgcH9/T
         brD+0n4KF+c+YR/9hx7xSzMm/NbVRXo57SH/XAssdiGpJNjYtoA8q7wZtiy231K/Y514
         5awiDNsWqCtzY3BEETyO6dJzh0rkknf+/iX+CsGi3Y0kTQQYN2LdEzXX6jhujXFndRaB
         sYGSt7Oup0+MuoXh7Pig61Zz56CAW5qnhcnNdyR9deQMK7px5bF20Xmw14GpUtbY1Tt7
         Go1A==
X-Gm-Message-State: AOAM532emBEmLlYtng47I2VWu78311m/X6vZEcvODclCT00o9/J4Obtv
	wfwU9rGlFdc8xCxTCE4Hc79yQBd/wgbwSQ==
X-Google-Smtp-Source: 
 ABdhPJyo6Y/Yrv+Jk8mnEggU73HbQaNeOZlKqQ/k7LlTbbnefNeUeL5bncwQK8CYEz6OyzccDCcuIA==
X-Received: by 2002:a05:6a00:8d2:: with SMTP id
 s18mr628854pfu.5.1644383747318;
        Tue, 08 Feb 2022 21:15:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 z1sm17583688pfh.137.2022.02.08.21.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 21:15:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4] perl: Help resolving WNOHANG and _exit in Posix module
Date: Tue,  8 Feb 2022 21:15:44 -0800
Message-Id: <20220209051544.3280726-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 05:15:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161535

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v4: Fix filepaths in release tarballs which are different than git repo

 ...01-ipc-force-POSIX-WNOHANG-resolving.patch | 52 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch

diff --git a/meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch b/meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch
new file mode 100644
index 00000000000..3df15d4f08c
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch
@@ -0,0 +1,52 @@
+From 0d8c411ef7e8b4452007c77eee3d83d227b86bb4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Feb 2022 14:05:22 -0800
+Subject: [PATCH] ipc: force POSIX::WNOHANG resolving
+
+It seems POSIX module is special and may not have autovivified (resolved) WNOHANG.
+see [1]
+
+Fixes
+ Bareword "POSIX::WNOHANG" not allowed while "strict subs"
+
+[1] https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/78eb0e39454ab3ca8e7ef77f1d014b50b3632fb9
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cpan/IPC-Cmd/lib/IPC/Cmd.pm | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+--- a/cpan/IPC-Cmd/lib/IPC/Cmd.pm
++++ b/cpan/IPC-Cmd/lib/IPC/Cmd.pm
+@@ -499,7 +499,7 @@ sub kill_gently {
+         next;
+     }
+ 
+-    my $waitpid = waitpid($pid, POSIX::WNOHANG);
++    my $waitpid = waitpid($pid, POSIX::WNOHANG());
+ 
+     if ($waitpid eq -1) {
+         $child_finished = 1;
+@@ -619,10 +619,10 @@ sub open3_run {
+           #
+           kill(-9, $$);
+ 
+-          POSIX::_exit 1;
++          POSIX::_exit(1);
+         }
+ 
+-        my $waitpid = waitpid($pid, POSIX::WNOHANG);
++        my $waitpid = waitpid($pid, POSIX::WNOHANG());
+ 
+         # child finished, catch it's exit status
+         if ($waitpid ne 0 && $waitpid ne -1) {
+@@ -1005,7 +1005,7 @@ sub run_forked {
+           $child_finished = 1;
+         }
+ 
+-        my $waitpid = waitpid($pid, POSIX::WNOHANG);
++        my $waitpid = waitpid($pid, POSIX::WNOHANG());
+ 
+         # child finished, catch it's exit status
+         if ($waitpid ne 0 && $waitpid ne -1) {
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index e4bcfe3ce69..48d755744fe 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://aacd2398e766500cb5d83c4d76b642fcf31d997a.patch \
            file://ea57297a58b8f10ab885c19eec48ea076116cc1f.patch \
            file://5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch \
+           file://0001-ipc-force-POSIX-WNOHANG-resolving.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.35.1


