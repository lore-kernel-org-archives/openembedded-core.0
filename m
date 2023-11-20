Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A3BC5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:12 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.609.1700498350082406085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CtWGaOzV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso4384612b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498349; x=1701103149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aP8rMIa0oJJgjF57nUR5wRFxe3CR61hJDAIlAl6krQc=;
        b=CtWGaOzV7UT2c32qB6B5OaQSra5x/tW/t5kIFQ0S/7ngdolEd9j7urwPUg8jB5GD87
         Qgx2iIOMD8QxR37dLiaA1NLFdKrWC7HL6KdA1tz7b3K4rsIwn5MLAyq1bq5cdLNjX5yp
         nr+ZtRxX6+fMF/ZYtsE+zEf1PfOYMm7k+ZXjb8Zhn6HduD7rHKgOmIfUzMsSmuyZGPvw
         WVZ/sYEQ4s6YS633x7hskURZjs6oh3RRUsmLZpIZNwfS19dqn7TSTy/XfvGADAEFTBno
         PZ+V+g9Y+ynTEjZXY0KLU8359xg7/XjCE/uCJ6xYD3/Y2aTnW+fVTtJaVkCyMg7g5js/
         kItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498349; x=1701103149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aP8rMIa0oJJgjF57nUR5wRFxe3CR61hJDAIlAl6krQc=;
        b=AUiKn/SOwGZ8uvR/p/qmLFi5Z0wdf22lRG+ofhvRnSD+7sOEgtclL30/CFr71OaP7s
         YgmeY5BXie2/sapKYiFyJaFObQLPlZP7Uc51AljaDrFOXhJFEOK3dAWhMTNLKGCvyzl9
         RQB2V5BZ68MJCn4CgOGPaEigdiCUmGM8P/sLD5/Pq4IFAzYGAVqLyCOcUwuSuhsL8l30
         bHmIh5FJesEJ+E3T9n07R9GA/z6snYIOnDK3N4lKQKzYdP1Xf3j5GZNFr8QU9IzcEj/7
         bFycZEHqbjT/fyosYbu1ad2vjAnoHqQqdPbO8DGqxGfgm0mHePhWyb5Pu+G/s7p4H5L8
         T/sw==
X-Gm-Message-State: AOJu0YzFkiYN7cvY2mRSsvBba5Pvi9hJx0h4+sKoUbIzoSaLRsss2YkW
	AqG04y1/cClR5qd8FxJ5v1n99lqRbr2CBI0osJrebQ==
X-Google-Smtp-Source: AGHT+IHv48ISfnGZf33FCDw7k4gawc8S7zHXygKzENW9ctEQN8Ask1/LHKxvbUJelpPnVydfx47Pxw==
X-Received: by 2002:a05:6a21:168b:b0:186:ff2d:f964 with SMTP id np11-20020a056a21168b00b00186ff2df964mr11132603pzb.36.1700498349174;
        Mon, 20 Nov 2023 08:39:09 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 07/33] perl: fix intermittent test failure
Date: Mon, 20 Nov 2023 06:38:21 -1000
Message-Id: <a9c39c67e8421103f14302f6cf7aa2bf6a940cba.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190896

From: William Lyu <William.Lyu@windriver.com>

Fixes [YOCTO #15136]

This fix addresses the intermittent failure of the Perl ptest
t/op/sigsystem.t.

Signed-off-by: William Lyu <William.Lyu@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 8c1ee92efa107ed055f1737640a027fa89077494)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ent-failure-of-test-t-op-sigsystem.t.patch | 77 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.38.0.bb     |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch

diff --git a/meta/recipes-devtools/perl/files/0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch b/meta/recipes-devtools/perl/files/0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch
new file mode 100644
index 0000000000..86fd42cd3d
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch
@@ -0,0 +1,77 @@
+From 75d974a58c461b3b5d35280e497810e46abae4ca Mon Sep 17 00:00:00 2001
+From: William Lyu <William.Lyu@windriver.com>
+Date: Wed, 4 Oct 2023 08:58:41 -0400
+Subject: [PATCH] Fix intermittent failure of test t/op/sigsystem.t
+
+[Perl issue #21546] -- https://github.com/Perl/perl5/issues/21546
+
+This fix addresses the intermittent failure of the test
+t/op/sigsystem.t by improving its robustness. Before the fix, this
+test waits a hard-coded amount of time in the parent process for the
+child process to exit, and the child process may not be able to exit
+soon enough. With this fix, the parent process in this test polls for
+whether the SIGCHLD handler reaped the child process for at most 25
+seconds.
+
+Upstream-Status: Backport [commit ID: 75d974a]
+
+Signed-off-by: William Lyu <William.Lyu@windriver.com>
+Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
+Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+Committer: William Lyu is now a Perl author.
+---
+ AUTHORS          |  1 +
+ t/op/sigsystem.t | 17 ++++++++++++++---
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/AUTHORS b/AUTHORS
+index 21948bfdc7..527dd992fd 100644
+--- a/AUTHORS
++++ b/AUTHORS
+@@ -1443,6 +1443,7 @@ Wayne Scott                    <wscott@ichips.intel.com>
+ Wayne Thompson                 <Wayne.Thompson@Ebay.sun.com>
+ Wilfredo Sánchez               <wsanchez@mit.edu>
+ William J. Middleton           <William.Middleton@oslo.mobil.telenor.no>
++William Lyu                    <William.Lyu@windriver.com>
+ William Mann                   <wmann@avici.com>
+ William Middleton              <wmiddlet@adobe.com>
+ William R Ward                 <hermit@BayView.COM>
+diff --git a/t/op/sigsystem.t b/t/op/sigsystem.t
+index 25da854902..831feefb0f 100644
+--- a/t/op/sigsystem.t
++++ b/t/op/sigsystem.t
+@@ -37,7 +37,15 @@ SKIP: {
+     test_system('with reaper');
+ 
+     note("Waiting briefly for SIGCHLD...");
+-    Time::HiRes::sleep(0.500);
++
++    # Wait at most 50 * 0.500 = 25.0 seconds for the child process to be 
++    # reaped. If the child process exits and gets reaped early, this polling
++    # loop will exit early. 
++
++    for (1..50) {
++	last if @pids;
++	Time::HiRes::sleep(0.500);
++    }
+ 
+     ok(@pids == 1, 'Reaped only one process');
+     ok($pids[0] == $pid, "Reaped the right process.") or diag(Dumper(\@pids));
+@@ -50,8 +58,11 @@ sub test_system {
+     my $got_zeroes      = 0;
+ 
+     # This test is looking for a race between system()'s waitpid() and a
+-    # signal handler.    Looping a few times increases the chances of
+-    # catching the error.
++    # signal handler. The system() call is expected to not interfere with the 
++    # SIGCHLD signal handler. In particular, the wait() called within system() 
++    # is expected to reap the child process forked by system() before the 
++    # SIGCHLD signal handler is called. 
++    # Looping a few times increases the chances of catching the error.
+ 
+     for (1..$expected_zeroes) {
+ 	$got_zeroes++ unless system(TRUE);
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.38.0.bb b/meta/recipes-devtools/perl/perl_5.38.0.bb
index 956e4d64d7..639664e355 100644
--- a/meta/recipes-devtools/perl/perl_5.38.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
+           file://0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.34.1


