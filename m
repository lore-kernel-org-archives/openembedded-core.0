Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.4073.1609193793719801545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=s5Zn1lB7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id i5so8073245pgo.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ncFqLETYW68MNXvntYkor4wWTb2PqSmnCkw5N0+20b8=;
        b=s5Zn1lB7MYyAVFoj3kyDOWi4ap2KHTMkK447VXFB3Y29vVXJH+dOWQUkR4r1yZ7S8Z
         v95EmttJcQQFVBUGPkvPWK6ufodEpOJ5PGhBdWngMsu3luvKOdTy4hQQAUIiNlBoEbim
         2IFqLuKAd2r8s1xxcdgYHKjTK5NYhf39ff4gEEGxdCh37vLa2ANFCU9RNk/AlYeaCBGl
         RmcvSg8pT6OfiF9hfAfQcs1iidIYTPXklhzcFJDNjoQPWGJIbjrDfHDhlSy92+2TkSKX
         7n3k5ApRUsJyIHfYAzCcnTALKzavAnsTEEVxv9LSk0k2Vrx3/u7yLZuQ3QvrcCYOS2Bn
         vNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ncFqLETYW68MNXvntYkor4wWTb2PqSmnCkw5N0+20b8=;
        b=VXgFGWy11DqJzRMqzn+tnUjl8nfXZfzoVzUlWYngUneTVv4XiTrTvmdVzl0W66BPWh
         LqB0xPrkGXtWC9k2WNK6K0qp2D1gMkB0at/ihZ5WvstLBeY0tIubhO1KqmtkU1RbybSB
         OoPfPKvLs8KXsYWqjKRrVGu/jFfQllRPg8I9wXEyXRhOrB8Mtio1TMwL470hRoSW1Fuc
         eK3tIr9V8eIA7k/6xeoz8udoB0fofHC7YPPpLrm/E4e4ZHaKhcKhy5BXlHGXs3X7SjKE
         w9l8xYt2iQpk06JpQzQBPgOOIXaXJT6sJRt6Vb9FnxseiLrkKJMSiGFFfauCEp8AUMDH
         JG2A==
X-Gm-Message-State: AOAM533VGjf4Fi2X3SEjKu9m1zaNjfjv1Di26N/hfGOISFvF0ozByGmw
	uKWG0EfOpTCxH6vQhkcG1XkLOY+FASLENpUQtRs=
X-Google-Smtp-Source: ABdhPJzCiWR9fSiqW8QTtzrTmwkJQb/xH9TCVu8B9I+eswEEtva1XpiE7bYuUbO0AoBsGtNWgHKeuA==
X-Received: by 2002:a63:f308:: with SMTP id l8mr46001228pgh.68.1609193792991;
        Mon, 28 Dec 2020 14:16:32 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:32 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/17] kernel: set COMPATIBLE_HOST to *-linux
Date: Mon, 28 Dec 2020 12:15:48 -1000
Message-Id: <59c5963affe8327ce4075941a4938f116ae25140.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

The target system triple contains whether the target is Linux or not,
so use it to avoid situations where you can attempt to build a kernel
for systems which don't support Linux.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1eeeab21a81990321468ddbdd1745ea24d1828d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass              | 2 ++
 meta/recipes-kernel/linux/linux-dummy.bb | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 29afd791e9..2a65c001d9 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,5 +1,7 @@
 inherit linux-kernel-base kernel-module-split
 
+COMPATIBLE_HOST = ".*-linux"
+
 KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 649fc04dd1..95dc85ff2f 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -26,7 +26,7 @@ DESCRIPTION_kernel-vmlinux = "Kernel vmlinux meta package"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-#COMPATIBLE_MACHINE = "your_machine"
+COMPATIBLE_HOST = ".*-linux"
 
 PR = "r1"
 
-- 
2.17.1

