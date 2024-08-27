Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2A5C54735
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.70875.1724736245895410627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PPSsm458;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a86933829dcso568965166b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736244; x=1725341044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ybn/noZnxtl0jgYyDQSm/eIQOsXZYG2SPy2XgIWp3B8=;
        b=PPSsm458PbPefhZOujDKJi3jRkFrsAcVK7IlhENfgfCuDV5KRmIXvxefPQejob2X8L
         M1mf687z98afU7BIVsLVwgZa8XhqMwpSoPs4Kz2MHdaMEZqN98GD3PbMEKrFuqOK6nIN
         C03lBWdcjT1YeG2yclnUyin6o4BqT1ekKx/eUoGqPkDdwPszGjdgIdeuOjQvS+dw4Kdx
         ElpD1DFEMShHrtD/ee0y4+uThh0KpS6J+Ar7PnD60mHBEXuOgMT0E7Osh6vv/SmjIBhI
         jDROAZ9jYTG1wtTyeM5b74jX9Dqm1tPAqOoLgkQMAsLm8oyrKHEzFCML19UKL44e2ft8
         8aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736244; x=1725341044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ybn/noZnxtl0jgYyDQSm/eIQOsXZYG2SPy2XgIWp3B8=;
        b=rKoprplbMK3EmFK0FmSxZntaToVb0+ubGilKQYsZTqzCygD28JduVF2pos0ZKMrDWs
         DuwIwVi0PHzZGI59JGRQLv+gXm51fw1pf2dD4zeHazPZILe1J7M8KCpjOTr231cuPFu5
         3f7uzEuJARSVf1W+aLYHBnn7g7bDAY6YFLHHEfUKD2EADFeCGK4rzb0cozA9wrVfFXHQ
         OyJ+B6XpRfv8HK6p6kN6U1ciXN41gQtopOKUnet+m56yyuz5O6z5aZVelq2YrdukFPpn
         zeRFmYzVv9IfbSozfvPYdYc1161vBAiD64lYJwb9EQVQIz6H9vxQwRuzWLQ/XDjcYtzv
         oQpw==
X-Gm-Message-State: AOJu0YxhI8fBQ0uqtKLQSwoSpbMT4oEayGGYEMTe/mI25hSxSUOPJlE/
	zyVR9B5EtgP4CW3tZA6tRzD1gUZl7mKkP1Ds8hBtX5pqk6nZ4RjIVvmjJQ==
X-Google-Smtp-Source: AGHT+IFcwoy3zEXb/Q1mt/Xsm3kDdqJ9Hwl7BeuEWqeFY4E6E+ncp/xsALWcqTZF6rrBamsXE3HGIA==
X-Received: by 2002:a17:907:da4:b0:a77:b516:3023 with SMTP id a640c23a62f3a-a86a518b2b2mr946763966b.4.1724736243295;
        Mon, 26 Aug 2024 22:24:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/34] perl: update 5.38.2 -> 5.40.0
Date: Tue, 27 Aug 2024 07:23:30 +0200
Message-Id: <20240827052354.1319810-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203787

From: Alexander Kanavin <alex@linutronix.de>

Update rdepends generator to account for new version specifiers
(v{version} instead of just {version}) and exclude a few more
external modules detected at runtime.

Adjust musl configuration to set custom LC_ALL handling
(musl doesn't follow glibc in that, see the last few comments here:
https://github.com/Perl/perl5/issues/22375 ).

Adjust ptest packaging to add a dummy Makefile for 'make perl
releases' test (otherwise the packaging specifically excludes makefiles).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ent-failure-of-test-t-op-sigsystem.t.patch |  77 --
 ...ule-breaks-through-the-perl-wrapper-.patch |   8 +-
 ...Makefile.PL-Fix-_PATH_LOG-for-determ.patch |   5 +-
 .../files/0002-Constant-Fix-up-shebang.patch  |   9 +-
 .../perl/files/determinism.patch              |  16 +-
 .../perl/files/encodefix.patch                |  16 +-
 .../perl/files/errno_ver.diff                 |  15 +-
 .../perl/files/native-perlinc.patch           |  18 +-
 .../perl/files/perl-configpm-switch.patch     |   3 +-
 .../perl/files/perl-dynloader.patch           |  18 +-
 .../perl/files/perl-rdepends.txt              | 694 ++++++++++++++++--
 meta/recipes-devtools/perl/perl-ptest.inc     |   3 +
 .../perl/{perl_5.38.2.bb => perl_5.40.0.bb}   |  11 +-
 13 files changed, 713 insertions(+), 180 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch
 rename meta/recipes-devtools/perl/{perl_5.38.2.bb => perl_5.40.0.bb} (96%)

diff --git a/meta/recipes-devtools/perl/files/0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch b/meta/recipes-devtools/perl/files/0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch
deleted file mode 100644
index 86fd42cd3d3..00000000000
--- a/meta/recipes-devtools/perl/files/0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 75d974a58c461b3b5d35280e497810e46abae4ca Mon Sep 17 00:00:00 2001
-From: William Lyu <William.Lyu@windriver.com>
-Date: Wed, 4 Oct 2023 08:58:41 -0400
-Subject: [PATCH] Fix intermittent failure of test t/op/sigsystem.t
-
-[Perl issue #21546] -- https://github.com/Perl/perl5/issues/21546
-
-This fix addresses the intermittent failure of the test
-t/op/sigsystem.t by improving its robustness. Before the fix, this
-test waits a hard-coded amount of time in the parent process for the
-child process to exit, and the child process may not be able to exit
-soon enough. With this fix, the parent process in this test polls for
-whether the SIGCHLD handler reaped the child process for at most 25
-seconds.
-
-Upstream-Status: Backport [commit ID: 75d974a]
-
-Signed-off-by: William Lyu <William.Lyu@windriver.com>
-Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
-Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
-
-Committer: William Lyu is now a Perl author.
----
- AUTHORS          |  1 +
- t/op/sigsystem.t | 17 ++++++++++++++---
- 2 files changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/AUTHORS b/AUTHORS
-index 21948bfdc7..527dd992fd 100644
---- a/AUTHORS
-+++ b/AUTHORS
-@@ -1443,6 +1443,7 @@ Wayne Scott                    <wscott@ichips.intel.com>
- Wayne Thompson                 <Wayne.Thompson@Ebay.sun.com>
- Wilfredo Sánchez               <wsanchez@mit.edu>
- William J. Middleton           <William.Middleton@oslo.mobil.telenor.no>
-+William Lyu                    <William.Lyu@windriver.com>
- William Mann                   <wmann@avici.com>
- William Middleton              <wmiddlet@adobe.com>
- William R Ward                 <hermit@BayView.COM>
-diff --git a/t/op/sigsystem.t b/t/op/sigsystem.t
-index 25da854902..831feefb0f 100644
---- a/t/op/sigsystem.t
-+++ b/t/op/sigsystem.t
-@@ -37,7 +37,15 @@ SKIP: {
-     test_system('with reaper');
- 
-     note("Waiting briefly for SIGCHLD...");
--    Time::HiRes::sleep(0.500);
-+
-+    # Wait at most 50 * 0.500 = 25.0 seconds for the child process to be 
-+    # reaped. If the child process exits and gets reaped early, this polling
-+    # loop will exit early. 
-+
-+    for (1..50) {
-+	last if @pids;
-+	Time::HiRes::sleep(0.500);
-+    }
- 
-     ok(@pids == 1, 'Reaped only one process');
-     ok($pids[0] == $pid, "Reaped the right process.") or diag(Dumper(\@pids));
-@@ -50,8 +58,11 @@ sub test_system {
-     my $got_zeroes      = 0;
- 
-     # This test is looking for a race between system()'s waitpid() and a
--    # signal handler.    Looping a few times increases the chances of
--    # catching the error.
-+    # signal handler. The system() call is expected to not interfere with the 
-+    # SIGCHLD signal handler. In particular, the wait() called within system() 
-+    # is expected to reap the child process forked by system() before the 
-+    # SIGCHLD signal handler is called. 
-+    # Looping a few times increases the chances of catching the error.
- 
-     for (1..$expected_zeroes) {
- 	$got_zeroes++ unless system(TRUE);
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
index ed8ec1d4168..2076c61ee0e 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From e8e095b9c71c58f8197d6315359446b6b084cb2b Mon Sep 17 00:00:00 2001
+From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 5 Jun 2018 14:58:42 +0300
 Subject: [PATCH] Somehow this module breaks through the perl wrapper and
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 948c476..f537526 100644
+index fe38598..0828f52 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -1110,6 +1110,9 @@ WARNING
+@@ -1161,6 +1161,9 @@ WARNING
      }
  
      foreach my $name (@$names){
@@ -24,7 +24,7 @@ index 948c476..f537526 100644
          my ($abs, $use_dir);
          if ($self->file_name_is_absolute($name)) {     # /foo/bar
              $abs = $name;
-@@ -2006,6 +2009,7 @@ sub init_PERL {
+@@ -2097,6 +2100,7 @@ sub init_PERL {
  
      $self->{PERL} ||=
          $self->find_perl(5.0, \@perls, \@defpath, $Verbose );
diff --git a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
index 63815d44fb6..7e5d08d8db5 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From a73fff1fcf0def4ce93964f1b63fe3ad0967259d Mon Sep 17 00:00:00 2001
+From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
@@ -31,6 +31,3 @@ index d09ba69..d44e58c 100644
  
  # if possible, generate the code that handles the constants with 
  # ExtUtils::Constant, otherwise use cached copy in fallback/
--- 
-2.31.1
-
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 686cc7167bb..80986e66dab 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,7 +1,7 @@
-From 260ebd15e16cd86b9b58e5c5f3a496b3853ca46d Mon Sep 17 00:00:00 2001
+From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
-Subject: [PATCH 2/2] Constant: Fix up shebang
+Subject: [PATCH] Constant: Fix up shebang
 
 The instructions indicate that the script should be explicitly passed to
 "perl -x", so automatically setting the #! to be ^X is unnecessary and
@@ -15,7 +15,7 @@ Upstream-Status: Submitted [https://rt.cpan.org/Public/Bug/Display.html?id=12986
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cpan/ExtUtils-Constant/lib/ExtUtils/Constant/XS.pm b/cpan/ExtUtils-Constant/lib/ExtUtils/Constant/XS.pm
-index 14eb809714..d4d074e121 100644
+index 14eb809..d4d074e 100644
 --- a/cpan/ExtUtils-Constant/lib/ExtUtils/Constant/XS.pm
 +++ b/cpan/ExtUtils-Constant/lib/ExtUtils/Constant/XS.pm
 @@ -219,7 +219,7 @@ sub dogfood {
@@ -27,6 +27,3 @@ index 14eb809714..d4d074e121 100644
  use ExtUtils::Constant qw (constant_types C_constant XS_constant);
  
  EOT
--- 
-2.21.0
-
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index f2b11115524..bdb9a928bb6 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,7 @@
-Fixes to make the perl build reproducible:
+From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 5 Feb 2020 23:54:02 +0000
+Subject: [PATCH] Fixes to make the perl build reproducible:
 
 a) Remove the \n from configure_attr.sh since it gets quoted differently depending on
    whether the shell is bash or dash which can cause the test result to be incorrect.
@@ -20,11 +23,14 @@ RP 2020/2/7
 
 Upstream-Status: Submitted [see links above]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
+---
+ cpan/Encode/Byte/Makefile.PL | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: perl-5.30.1/cpan/Encode/Byte/Makefile.PL
-===================================================================
---- perl-5.30.1.orig/cpan/Encode/Byte/Makefile.PL
-+++ perl-5.30.1/cpan/Encode/Byte/Makefile.PL
+diff --git a/cpan/Encode/Byte/Makefile.PL b/cpan/Encode/Byte/Makefile.PL
+index 6824bbb..4af4a50 100644
+--- a/cpan/Encode/Byte/Makefile.PL
++++ b/cpan/Encode/Byte/Makefile.PL
 @@ -171,7 +171,7 @@ sub postamble
      my $lengthsofar = length($str);
      my $continuator = '';
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 396ed0d53e3..665699d12df 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,14 +1,22 @@
+From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 18 Feb 2020 17:27:26 +0000
+Subject: [PATCH] perl: Fix encode module reproducibility issues
+
 The code is encoding host compiler parameters into target builds. Avoid
 this for our target builds (patch is target specific, not native)
 
 Upstream-Status: Inappropriate [Cross compile hack]
 RP 2020/2/18
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ cpan/Encode/bin/enc2xs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: perl-5.30.1/cpan/Encode/bin/enc2xs
-===================================================================
---- perl-5.30.1.orig/cpan/Encode/bin/enc2xs
-+++ perl-5.30.1/cpan/Encode/bin/enc2xs
+diff --git a/cpan/Encode/bin/enc2xs b/cpan/Encode/bin/enc2xs
+index 502ae39..7669b05 100644
+--- a/cpan/Encode/bin/enc2xs
++++ b/cpan/Encode/bin/enc2xs
 @@ -195,7 +195,7 @@ sub compiler_info {
      # above becomes false.
      my $sized  = $declaration && !($compat && !$pedantic);
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index a965fbeeecf..477642f4570 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,7 +1,7 @@
-From 8e1efba7560d8d55524c7a0f1b0539ddce419b86 Mon Sep 17 00:00:00 2001
+From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
-Subject: [PATCH 6/8] Remove Errno version check due to upgrade problems with
+Subject: [PATCH] Remove Errno version check due to upgrade problems with
  long-running processes.
 
 Bug-Debian: http://bugs.debian.org/343351
@@ -17,21 +17,18 @@ Upstream-Status: Pending
  1 file changed, 5 deletions(-)
 
 diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
-index 6251a3c..eeed445 100644
+index 77aa19b..4bdbef1 100644
 --- a/ext/Errno/Errno_pm.PL
 +++ b/ext/Errno/Errno_pm.PL
-@@ -294,11 +294,6 @@ EDQ
+@@ -295,11 +295,6 @@ EDQ
      # they've already declared perl doesn't need to worry about this risk.
      if(!$ENV{'PERL_BUILD_EXPAND_CONFIG_VARS'}) {
          print <<"CONFIG_CHECK_END";
 -use Config;
 -"\$Config{'archname'}-\$Config{'osvers'}" eq
--"$archname-$Config{'osvers'}" or
--	die "Errno architecture ($archname-$Config{'osvers'}) does not match executable architecture (\$Config{'archname'}-\$Config{'osvers'})";
+-"$archname-$osvers" or
+-	die "Errno architecture ($archname-$osvers) does not match executable architecture (\$Config{'archname'}-\$Config{'osvers'})";
 -
  CONFIG_CHECK_END
  }
  
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 20d7fe60604..7e3e5f6652a 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,11 +1,19 @@
+From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 30 May 2007 09:33:32 +0000
+Subject: [PATCH] perl: sync with OE
+
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
 
-Index: perl-5.8.8/lib/ExtUtils/MM_Unix.pm
-===================================================================
---- perl-5.12.3.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2008-10-31 22:01:35.000000000 +0000
-+++ perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2008-10-31 22:01:35.000000000 +0000
-@@ -1597,6 +1597,19 @@
+diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+index 0828f52..b8abff4 100644
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+@@ -1862,6 +1862,19 @@ from the perl source tree.
  	$self->{PERL_LIB}     ||= $Config{privlibexp};
  	$self->{PERL_ARCHLIB} ||= $Config{archlibexp};
  	$self->{PERL_INC}     = $self->catdir("$self->{PERL_ARCHLIB}","CORE"); # wild guess for now
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 0be1d5a93c5..3721277933f 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From c25d460a2f00e9af25087d40447fe1a81c89710c Mon Sep 17 00:00:00 2001
+From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
@@ -14,7 +14,6 @@ values would be valid for the host only.
 
 Upstream-Status: Inappropriate [native]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  configpm | 18 ++++++++++++++++--
  1 file changed, 16 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-devtools/perl/files/perl-dynloader.patch b/meta/recipes-devtools/perl/files/perl-dynloader.patch
index 887f7c0f7ff..5472602d3af 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,3 +1,8 @@
+From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard@openedhand.com>
+Date: Sun, 27 May 2007 21:04:11 +0000
+Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
+
 Upstream-Status: Inappropriate [embedded specific]
 
 Allow the location that .so files are searched for for dynamic
@@ -6,12 +11,15 @@ us to load .so's from the host system while building for the target
 system.
 
 Update by Nitin A Kamble <nitin.a.kamble@intel.com> 2011/04/21
+---
+ dist/XSLoader/XSLoader_pm.PL | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
 
-Index: perl-5.24.1/dist/XSLoader/XSLoader_pm.PL
-===================================================================
---- perl-5.24.1.orig/dist/XSLoader/XSLoader_pm.PL
-+++ perl-5.24.1/dist/XSLoader/XSLoader_pm.PL
-@@ -52,6 +52,24 @@ sub load {
+diff --git a/dist/XSLoader/XSLoader_pm.PL b/dist/XSLoader/XSLoader_pm.PL
+index ff5ca31..0d50803 100644
+--- a/dist/XSLoader/XSLoader_pm.PL
++++ b/dist/XSLoader/XSLoader_pm.PL
+@@ -32,6 +32,24 @@ sub load {
      my ($caller, $modlibname) = caller();
      my $module = $caller;
  
diff --git a/meta/recipes-devtools/perl/files/perl-rdepends.txt b/meta/recipes-devtools/perl/files/perl-rdepends.txt
index e5f45bf2910..48e5a9de2f1 100644
--- a/meta/recipes-devtools/perl/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl/files/perl-rdepends.txt
@@ -166,9 +166,6 @@ RDEPENDS:perl-module-builtin += "perl-module-warnings"
 RDEPENDS:perl-module-b-xref += "perl-module-b"
 RDEPENDS:perl-module-b-xref += "perl-module-config"
 RDEPENDS:perl-module-b-xref += "perl-module-strict"
-RDEPENDS:perl-module-bytes += "perl-module-bytes-heavy"
-RDEPENDS:perl-module-bytes += "perl-module-strict"
-RDEPENDS:perl-module-bytes += "perl-module-warnings"
 RDEPENDS:perl-module--charnames += "perl-module-bytes"
 RDEPENDS:perl-module-charnames += "perl-module-bytes"
 RDEPENDS:perl-module-charnames += "perl-module--charnames"
@@ -299,6 +296,7 @@ RDEPENDS:perl-module-digest-md5 += "perl-module-warnings"
 RDEPENDS:perl-module-digest-md5 += "perl-module-xsloader"
 RDEPENDS:perl-module-digest += "perl-module-strict"
 RDEPENDS:perl-module-digest += "perl-module-warnings"
+RDEPENDS:perl-module-digest-sha += "perl-module-cwd"
 RDEPENDS:perl-module-digest-sha += "perl-module-digest-base"
 RDEPENDS:perl-module-digest-sha += "perl-module-dynaloader"
 RDEPENDS:perl-module-digest-sha += "perl-module-exporter"
@@ -479,6 +477,7 @@ RDEPENDS:perl-module-extutils-cbuilder-platform-android += "perl-module-warnings
 RDEPENDS:perl-module-extutils-cbuilder-platform-cygwin += "perl-module-extutils-cbuilder-platform-unix"
 RDEPENDS:perl-module-extutils-cbuilder-platform-cygwin += "perl-module-strict"
 RDEPENDS:perl-module-extutils-cbuilder-platform-cygwin += "perl-module-warnings"
+RDEPENDS:perl-module-extutils-cbuilder-platform-darwin += "perl-module-config"
 RDEPENDS:perl-module-extutils-cbuilder-platform-darwin += "perl-module-extutils-cbuilder-platform-unix"
 RDEPENDS:perl-module-extutils-cbuilder-platform-darwin += "perl-module-strict"
 RDEPENDS:perl-module-extutils-cbuilder-platform-darwin += "perl-module-warnings"
@@ -518,7 +517,6 @@ RDEPENDS:perl-module-extutils-command += "perl-module-file-copy"
 RDEPENDS:perl-module-extutils-command += "perl-module-file-find"
 RDEPENDS:perl-module-extutils-command += "perl-module-file-path"
 RDEPENDS:perl-module-extutils-command += "perl-module-strict"
-RDEPENDS:perl-module-extutils-command += "perl-module-vars"
 RDEPENDS:perl-module-extutils-command += "perl-module-warnings"
 RDEPENDS:perl-module-extutils-constant-base += "perl-module-constant"
 RDEPENDS:perl-module-extutils-constant-base += "perl-module-extutils-constant-utils"
@@ -588,7 +586,6 @@ RDEPENDS:perl-module-extutils-makemaker-locale += "perl-module-encode-alias"
 RDEPENDS:perl-module-extutils-makemaker-locale += "perl-module-i18n-langinfo"
 RDEPENDS:perl-module-extutils-makemaker-locale += "perl-module-strict"
 RDEPENDS:perl-module-extutils-makemaker-locale += "perl-module-warnings"
-RDEPENDS:perl-module-extutils-makemaker += "perl-module-b"
 RDEPENDS:perl-module-extutils-makemaker += "perl-module-cpan"
 RDEPENDS:perl-module-extutils-makemaker += "perl-module-cwd"
 RDEPENDS:perl-module-extutils-makemaker += "perl-module-exporter"
@@ -689,7 +686,6 @@ RDEPENDS:perl-module-extutils-mm-unix += "perl-module-extutils-mm-any"
 RDEPENDS:perl-module-extutils-mm-unix += "perl-module-file-basename"
 RDEPENDS:perl-module-extutils-mm-unix += "perl-module-file-find"
 RDEPENDS:perl-module-extutils-mm-unix += "perl-module-strict"
-RDEPENDS:perl-module-extutils-mm-unix += "perl-module-vars"
 RDEPENDS:perl-module-extutils-mm-unix += "perl-module-version"
 RDEPENDS:perl-module-extutils-mm-unix += "perl-module-warnings"
 RDEPENDS:perl-module-extutils-mm-uwin += "perl-module-extutils-mm-unix"
@@ -845,8 +841,6 @@ RDEPENDS:perl-module-file-stat += "perl-module-constant"
 RDEPENDS:perl-module-file-stat += "perl-module-exporter"
 RDEPENDS:perl-module-file-stat += "perl-module-fcntl"
 RDEPENDS:perl-module-file-stat += "perl-module-overload "
-RDEPENDS:perl-module-file-stat += "perl-module-strict"
-RDEPENDS:perl-module-file-stat += "perl-module-warnings"
 RDEPENDS:perl-module-file-stat += "perl-module-warnings-register"
 RDEPENDS:perl-module-file-temp += "perl-module-constant"
 RDEPENDS:perl-module-file-temp += "perl-module-cwd"
@@ -875,13 +869,16 @@ RDEPENDS:perl-module-gdbm-file += "perl-module-strict"
 RDEPENDS:perl-module-gdbm-file += "perl-module-tie-hash"
 RDEPENDS:perl-module-gdbm-file += "perl-module-warnings"
 RDEPENDS:perl-module-gdbm-file += "perl-module-xsloader"
+RDEPENDS:perl-module-getopt-long-parser += "perl-module-getopt-long"
+RDEPENDS:perl-module-getopt-long-parser += "perl-module-warnings"
+RDEPENDS:perl-module-getopt-long += "perl-module-base"
 RDEPENDS:perl-module-getopt-long += "perl-module-constant"
 RDEPENDS:perl-module-getopt-long += "perl-module-exporter"
+RDEPENDS:perl-module-getopt-long += "perl-module-getopt-long-parser"
 RDEPENDS:perl-module-getopt-long += "perl-module-overload"
 RDEPENDS:perl-module-getopt-long += "perl-module-pod-usage"
 RDEPENDS:perl-module-getopt-long += "perl-module-strict"
 RDEPENDS:perl-module-getopt-long += "perl-module-text-parsewords"
-RDEPENDS:perl-module-getopt-long += "perl-module-vars"
 RDEPENDS:perl-module-getopt-long += "perl-module-warnings"
 RDEPENDS:perl-module-getopt-std += "perl-module-exporter"
 RDEPENDS:perl-module-getopt-std += "perl-module-strict"
@@ -1048,7 +1045,6 @@ RDEPENDS:perl-module-io-socket-ip += "perl-module-constant"
 RDEPENDS:perl-module-io-socket-ip += "perl-module-errno"
 RDEPENDS:perl-module-io-socket-ip += "perl-module-posix"
 RDEPENDS:perl-module-io-socket-ip += "perl-module-socket"
-RDEPENDS:perl-module-io-socket-ip += "perl-module-strict"
 RDEPENDS:perl-module-io-socket-ip += "perl-module-warnings"
 RDEPENDS:perl-module-io-socket += "perl-module-errno"
 RDEPENDS:perl-module-io-socket += "perl-module-exporter"
@@ -1144,8 +1140,8 @@ RDEPENDS:perl-module-io-uncompress-unzip += "perl-module-io-file"
 RDEPENDS:perl-module-io-uncompress-unzip += "perl-module-io-uncompress-adapter-identity"
 RDEPENDS:perl-module-io-uncompress-unzip += "perl-module-io-uncompress-adapter-inflate"
 RDEPENDS:perl-module-io-uncompress-unzip += "perl-module-io-uncompress-rawinflate"
-RDEPENDS:perl-module-io-uncompress-unzip += "perl-module-posix"
 RDEPENDS:perl-module-io-uncompress-unzip += "perl-module-strict "
+RDEPENDS:perl-module-io-uncompress-unzip += "perl-module-time-local "
 RDEPENDS:perl-module-io-uncompress-unzip += "perl-module-warnings"
 RDEPENDS:perl-module-io-zlib += "perl-module-fcntl"
 RDEPENDS:perl-module-io-zlib += "perl-module-io-handle"
@@ -1196,6 +1192,7 @@ RDEPENDS:perl-module-ipc-sysv += "perl-module-vars"
 RDEPENDS:perl-module-ipc-sysv += "perl-module-xsloader"
 RDEPENDS:perl-module-json-pp-boolean += "perl-module-overload"
 RDEPENDS:perl-module-json-pp-boolean += "perl-module-strict"
+RDEPENDS:perl-module-json-pp-boolean += "perl-module-warnings"
 RDEPENDS:perl-module-json-pp += "perl-module-b"
 RDEPENDS:perl-module-json-pp += "perl-module-bytes"
 RDEPENDS:perl-module-json-pp += "perl-module-constant"
@@ -1206,7 +1203,6 @@ RDEPENDS:perl-module-json-pp += "perl-module-math-bigfloat"
 RDEPENDS:perl-module-json-pp += "perl-module-math-bigint"
 RDEPENDS:perl-module-json-pp += "perl-module-overload"
 RDEPENDS:perl-module-json-pp += "perl-module-strict"
-RDEPENDS:perl-module-json-pp += "perl-module-subs"
 RDEPENDS:perl-module-less += "perl-module-strict"
 RDEPENDS:perl-module-less += "perl-module-warnings"
 RDEPENDS:perl-module-lib += "perl-module-config"
@@ -1245,6 +1241,7 @@ RDEPENDS:perl-module-locale += "perl-module-strict"
 RDEPENDS:perl-module-locale += "perl-module-warnings"
 RDEPENDS:perl-module-math-bigfloat += "perl-module-exporter"
 RDEPENDS:perl-module-math-bigfloat += "perl-module-math-bigint"
+RDEPENDS:perl-module-math-bigfloat += "perl-module-math-bigrat"
 RDEPENDS:perl-module-math-bigfloat += "perl-module-math-complex"
 RDEPENDS:perl-module-math-bigfloat += "perl-module-overload"
 RDEPENDS:perl-module-math-bigfloat += "perl-module-strict"
@@ -1269,6 +1266,7 @@ RDEPENDS:perl-module-math-bigint-lib += "perl-module-strict"
 RDEPENDS:perl-module-math-bigint-lib += "perl-module-warnings"
 RDEPENDS:perl-module-math-bigint += "perl-module-exporter"
 RDEPENDS:perl-module-math-bigint += "perl-module-math-bigfloat"
+RDEPENDS:perl-module-math-bigint += "perl-module-math-bigrat"
 RDEPENDS:perl-module-math-bigint += "perl-module-math-complex"
 RDEPENDS:perl-module-math-bigint += "perl-module-overload"
 RDEPENDS:perl-module-math-bigint += "perl-module-strict"
@@ -1297,13 +1295,13 @@ RDEPENDS:perl-module-math-complex += "perl-module-warnings"
 RDEPENDS:perl-module-math-trig += "perl-module-exporter"
 RDEPENDS:perl-module-math-trig += "perl-module-math-complex"
 RDEPENDS:perl-module-math-trig += "perl-module-strict"
-RDEPENDS:perl-module-memoize-anydbm-file += "perl-module-vars"
-RDEPENDS:perl-module-memoize += "perl-module-config"
-RDEPENDS:perl-module-memoize += "perl-module-exporter"
+RDEPENDS:perl-module-memoize-anydbm-file += "perl-module-strict"
+RDEPENDS:perl-module-memoize-expire += "perl-module-strict"
 RDEPENDS:perl-module-memoize += "perl-module-strict"
-RDEPENDS:perl-module-memoize += "perl-module-vars"
 RDEPENDS:perl-module-memoize-sdbm-file += "perl-module-sdbm-file"
+RDEPENDS:perl-module-memoize-sdbm-file += "perl-module-strict"
 RDEPENDS:perl-module-memoize-storable += "perl-module-storable"
+RDEPENDS:perl-module-memoize-storable += "perl-module-strict"
 RDEPENDS:perl-module-mime-base64 += "perl-module-exporter"
 RDEPENDS:perl-module-mime-base64 += "perl-module-strict"
 RDEPENDS:perl-module-mime-base64 += "perl-module-warnings"
@@ -1362,11 +1360,9 @@ RDEPENDS:perl-module-net-ftp += "perl-module-warnings"
 RDEPENDS:perl-module-net-hostent += "perl-module-class-struct"
 RDEPENDS:perl-module-net-hostent += "perl-module-exporter"
 RDEPENDS:perl-module-net-hostent += "perl-module-socket"
-RDEPENDS:perl-module-net-hostent += "perl-module-strict"
 RDEPENDS:perl-module-net-netent += "perl-module-class-struct"
 RDEPENDS:perl-module-net-netent += "perl-module-exporter"
 RDEPENDS:perl-module-net-netent += "perl-module-socket"
-RDEPENDS:perl-module-net-netent += "perl-module-strict"
 RDEPENDS:perl-module-net-netrc += "perl-module-filehandle"
 RDEPENDS:perl-module-net-netrc += "perl-module-strict"
 RDEPENDS:perl-module-net-netrc += "perl-module-warnings"
@@ -1397,10 +1393,8 @@ RDEPENDS:perl-module-net-pop3 += "perl-module-strict"
 RDEPENDS:perl-module-net-pop3 += "perl-module-warnings"
 RDEPENDS:perl-module-net-protoent += "perl-module-class-struct"
 RDEPENDS:perl-module-net-protoent += "perl-module-exporter"
-RDEPENDS:perl-module-net-protoent += "perl-module-strict"
 RDEPENDS:perl-module-net-servent += "perl-module-class-struct"
 RDEPENDS:perl-module-net-servent += "perl-module-exporter"
-RDEPENDS:perl-module-net-servent += "perl-module-strict"
 RDEPENDS:perl-module-net-smtp += "perl-module-io-socket"
 RDEPENDS:perl-module-net-smtp += "perl-module-io-socket-ip"
 RDEPENDS:perl-module-net-smtp += "perl-module-mime-base64"
@@ -1446,7 +1440,6 @@ RDEPENDS:perl-module-perlio-encoding += "perl-module-xsloader"
 RDEPENDS:perl-module-perlio-mmap += "perl-module-strict"
 RDEPENDS:perl-module-perlio-mmap += "perl-module-warnings"
 RDEPENDS:perl-module-perlio-mmap += "perl-module-xsloader"
-RDEPENDS:perl-module-perlio-scalar += "perl-module-xsloader"
 RDEPENDS:perl-module-perlio-via += "perl-module-xsloader"
 RDEPENDS:perl-module-perlio-via-quotedprint += "perl-module-mime-quotedprint"
 RDEPENDS:perl-module-perlio-via-quotedprint += "perl-module-strict"
@@ -1461,14 +1454,12 @@ RDEPENDS:perl-module-pod-escapes += "perl-module-warnings"
 RDEPENDS:perl-module-pod-functions += "perl-module-exporter"
 RDEPENDS:perl-module-pod-functions += "perl-module-strict"
 RDEPENDS:perl-module-pod-man += "perl-module-file-basename"
+RDEPENDS:perl-module-pod-man += "perl-module-perlio"
 RDEPENDS:perl-module-pod-man += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-man += "perl-module-strict"
-RDEPENDS:perl-module-pod-man += "perl-module-subs"
-RDEPENDS:perl-module-pod-man += "perl-module-vars"
 RDEPENDS:perl-module-pod-man += "perl-module-warnings"
 RDEPENDS:perl-module-pod-parselink += "perl-module-exporter"
 RDEPENDS:perl-module-pod-parselink += "perl-module-strict"
-RDEPENDS:perl-module-pod-parselink += "perl-module-vars"
 RDEPENDS:perl-module-pod-parselink += "perl-module-warnings"
 RDEPENDS:perl-module-pod-perldoc-baseto += "perl-module-config"
 RDEPENDS:perl-module-pod-perldoc-baseto += "perl-module-strict"
@@ -1537,107 +1528,108 @@ RDEPENDS:perl-module-pod-simple-blackbox += "perl-module-integer"
 RDEPENDS:perl-module-pod-simple-blackbox += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-simple-blackbox += "perl-module-pod-simple-transcode"
 RDEPENDS:perl-module-pod-simple-blackbox += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-blackbox += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-blackbox += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-checker += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-simple-checker += "perl-module-pod-simple-methody"
 RDEPENDS:perl-module-pod-simple-checker += "perl-module-strict"
 RDEPENDS:perl-module-pod-simple-checker += "perl-module-text-wrap"
-RDEPENDS:perl-module-pod-simple-checker += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-checker += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-debug += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-simple-debug += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-debug += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-debug += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-dumpastext += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-simple-dumpastext += "perl-module-strict"
+RDEPENDS:perl-module-pod-simple-dumpastext += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-dumpasxml += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-simple-dumpasxml += "perl-module-strict"
 RDEPENDS:perl-module-pod-simple-dumpasxml += "perl-module-text-wrap"
+RDEPENDS:perl-module-pod-simple-dumpasxml += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-justpod += "perl-module-pod-simple-methody"
 RDEPENDS:perl-module-pod-simple-justpod += "perl-module-strict"
 RDEPENDS:perl-module-pod-simple-justpod += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-linksection += "perl-module-overload"
 RDEPENDS:perl-module-pod-simple-linksection += "perl-module-pod-simple-blackbox"
 RDEPENDS:perl-module-pod-simple-linksection += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-linksection += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-linksection += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-methody += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-simple-methody += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-methody += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-methody += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple += "perl-module-integer"
 RDEPENDS:perl-module-pod-simple += "perl-module-pod-escapes"
 RDEPENDS:perl-module-pod-simple += "perl-module-pod-simple-blackbox"
 RDEPENDS:perl-module-pod-simple += "perl-module-pod-simple-linksection"
 RDEPENDS:perl-module-pod-simple += "perl-module-pod-simple-tiedoutfh"
 RDEPENDS:perl-module-pod-simple += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-progress += "perl-module-strict"
+RDEPENDS:perl-module-pod-simple-progress += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-pullparserendtoken += "perl-module-pod-simple-pullparsertoken"
 RDEPENDS:perl-module-pod-simple-pullparserendtoken += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-pullparserendtoken += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-pullparserendtoken += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-pullparser += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-simple-pullparser += "perl-module-pod-simple-pullparserendtoken"
 RDEPENDS:perl-module-pod-simple-pullparser += "perl-module-pod-simple-pullparserstarttoken"
 RDEPENDS:perl-module-pod-simple-pullparser += "perl-module-pod-simple-pullparsertexttoken"
 RDEPENDS:perl-module-pod-simple-pullparser += "perl-module-strict"
+RDEPENDS:perl-module-pod-simple-pullparser += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-pullparserstarttoken += "perl-module-pod-simple-pullparsertoken"
 RDEPENDS:perl-module-pod-simple-pullparserstarttoken += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-pullparserstarttoken += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-pullparserstarttoken += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-pullparsertexttoken += "perl-module-pod-simple-pullparsertoken"
 RDEPENDS:perl-module-pod-simple-pullparsertexttoken += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-pullparsertexttoken += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-pullparsertexttoken += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-pullparsertoken += "perl-module-strict"
+RDEPENDS:perl-module-pod-simple-pullparsertoken += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-rtf += "perl-module-if"
 RDEPENDS:perl-module-pod-simple-rtf += "perl-module-integer"
 RDEPENDS:perl-module-pod-simple-rtf += "perl-module-pod-simple-pullparser"
 RDEPENDS:perl-module-pod-simple-rtf += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-rtf += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-rtf += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-search += "perl-module-config"
 RDEPENDS:perl-module-pod-simple-search += "perl-module-cwd"
 RDEPENDS:perl-module-pod-simple-search += "perl-module-file-basename"
 RDEPENDS:perl-module-pod-simple-search += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-search += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-search += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-simpletree += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-simple-simpletree += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-simpletree += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-simpletree += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-textcontent += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-simple-textcontent += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-textcontent += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-textcontent += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-text += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-simple-text += "perl-module-pod-simple-methody"
 RDEPENDS:perl-module-pod-simple-text += "perl-module-strict"
 RDEPENDS:perl-module-pod-simple-text += "perl-module-text-wrap"
-RDEPENDS:perl-module-pod-simple-text += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-text += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-tiedoutfh += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-tiedoutfh += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-tiedoutfh += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-transcodedumb += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-transcodedumb += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-transcodedumb += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-transcode += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-transcode += "perl-module-vars"
 RDEPENDS:perl-module-pod-simple-transcodesmart += "perl-module-encode"
 RDEPENDS:perl-module-pod-simple-transcodesmart += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-simple-transcodesmart += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-transcodesmart += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-transcodesmart += "perl-module-warnings"
 RDEPENDS:perl-module-pod-simple-xmloutstream += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-simple-xmloutstream += "perl-module-strict"
-RDEPENDS:perl-module-pod-simple-xmloutstream += "perl-module-vars"
+RDEPENDS:perl-module-pod-simple-xmloutstream += "perl-module-warnings"
 RDEPENDS:perl-module-pod-text-color += "perl-module-pod-text"
 RDEPENDS:perl-module-pod-text-color += "perl-module-strict"
 RDEPENDS:perl-module-pod-text-color += "perl-module-term-ansicolor"
-RDEPENDS:perl-module-pod-text-color += "perl-module-vars"
 RDEPENDS:perl-module-pod-text-color += "perl-module-warnings"
 RDEPENDS:perl-module-pod-text-overstrike += "perl-module-pod-text"
 RDEPENDS:perl-module-pod-text-overstrike += "perl-module-strict"
-RDEPENDS:perl-module-pod-text-overstrike += "perl-module-vars"
 RDEPENDS:perl-module-pod-text-overstrike += "perl-module-warnings"
 RDEPENDS:perl-module-pod-text += "perl-module-encode"
 RDEPENDS:perl-module-pod-text += "perl-module-exporter"
+RDEPENDS:perl-module-pod-text += "perl-module-perlio"
 RDEPENDS:perl-module-pod-text += "perl-module-pod-simple"
 RDEPENDS:perl-module-pod-text += "perl-module-strict"
-RDEPENDS:perl-module-pod-text += "perl-module-vars"
 RDEPENDS:perl-module-pod-text += "perl-module-warnings"
 RDEPENDS:perl-module-pod-text-termcap += "perl-module-pod-text"
 RDEPENDS:perl-module-pod-text-termcap += "perl-module-posix"
 RDEPENDS:perl-module-pod-text-termcap += "perl-module-strict"
 RDEPENDS:perl-module-pod-text-termcap += "perl-module-term-cap"
-RDEPENDS:perl-module-pod-text-termcap += "perl-module-vars"
 RDEPENDS:perl-module-pod-text-termcap += "perl-module-warnings"
 RDEPENDS:perl-module-pod-usage += "perl-module-config"
 RDEPENDS:perl-module-pod-usage += "perl-module-exporter"
@@ -1674,6 +1666,10 @@ RDEPENDS:perl-module-socket += "perl-module-warnings-register"
 RDEPENDS:perl-module-socket += "perl-module-xsloader"
 RDEPENDS:perl-module-sort += "perl-module-strict"
 RDEPENDS:perl-module-sort += "perl-module-warnings"
+RDEPENDS:perl-module-stable += "perl-module-experimental"
+RDEPENDS:perl-module-stable += "perl-module-strict"
+RDEPENDS:perl-module-stable += "perl-module-version"
+RDEPENDS:perl-module-stable += "perl-module-warnings"
 RDEPENDS:perl-module-storable += "perl-module-exporter"
 RDEPENDS:perl-module-storable += "perl-module-io-file"
 RDEPENDS:perl-module-subs += "perl-module-strict"
@@ -1899,6 +1895,34 @@ RDEPENDS:perl-module-term-complete += "perl-module-exporter"
 RDEPENDS:perl-module-term-complete += "perl-module-strict"
 RDEPENDS:perl-module-term-readline += "perl-module-strict"
 RDEPENDS:perl-module-term-readline += "perl-module-term-cap"
+RDEPENDS:perl-module-term-table-cell += "perl-module-list-util"
+RDEPENDS:perl-module-term-table-cell += "perl-module-strict"
+RDEPENDS:perl-module-term-table-cell += "perl-module-term-table-hashbase"
+RDEPENDS:perl-module-term-table-cell += "perl-module-term-table-linebreak"
+RDEPENDS:perl-module-term-table-cell += "perl-module-term-table-util"
+RDEPENDS:perl-module-term-table-cell += "perl-module-warnings"
+RDEPENDS:perl-module-term-table-cellstack += "perl-module-list-util"
+RDEPENDS:perl-module-term-table-cellstack += "perl-module-strict"
+RDEPENDS:perl-module-term-table-cellstack += "perl-module-term-table-hashbase"
+RDEPENDS:perl-module-term-table-cellstack += "perl-module-warnings"
+RDEPENDS:perl-module-term-table-hashbase += "perl-module-strict"
+RDEPENDS:perl-module-term-table-hashbase += "perl-module-warnings"
+RDEPENDS:perl-module-term-table-linebreak += "perl-module-strict"
+RDEPENDS:perl-module-term-table-linebreak += "perl-module-term-table-hashbase"
+RDEPENDS:perl-module-term-table-linebreak += "perl-module-term-table-util"
+RDEPENDS:perl-module-term-table-linebreak += "perl-module-warnings"
+RDEPENDS:perl-module-term-table += "perl-module-list-util"
+RDEPENDS:perl-module-term-table += "perl-module-strict"
+RDEPENDS:perl-module-term-table += "perl-module-term-table-cell"
+RDEPENDS:perl-module-term-table += "perl-module-term-table-hashbase"
+RDEPENDS:perl-module-term-table += "perl-module-term-table-util"
+RDEPENDS:perl-module-term-table += "perl-module-warnings"
+RDEPENDS:perl-module-term-table-spacer += "perl-module-strict"
+RDEPENDS:perl-module-term-table-spacer += "perl-module-warnings"
+RDEPENDS:perl-module-term-table-util += "perl-module-base"
+RDEPENDS:perl-module-term-table-util += "perl-module-config"
+RDEPENDS:perl-module-term-table-util += "perl-module-strict"
+RDEPENDS:perl-module-term-table-util += "perl-module-warnings"
 RDEPENDS:perl-module-test2-api-breakage += "perl-module-strict"
 RDEPENDS:perl-module-test2-api-breakage += "perl-module-test2-util"
 RDEPENDS:perl-module-test2-api-breakage += "perl-module-warnings"
@@ -1964,6 +1988,193 @@ RDEPENDS:perl-module-test2-api-stack += "perl-module-strict"
 RDEPENDS:perl-module-test2-api-stack += "perl-module-test2-api"
 RDEPENDS:perl-module-test2-api-stack += "perl-module-test2-hub"
 RDEPENDS:perl-module-test2-api-stack += "perl-module-warnings"
+RDEPENDS:perl-module-test2-asyncsubtest-event-attach += "perl-module-base"
+RDEPENDS:perl-module-test2-asyncsubtest-event-attach += "perl-module-strict"
+RDEPENDS:perl-module-test2-asyncsubtest-event-attach += "perl-module-test2-event-exception"
+RDEPENDS:perl-module-test2-asyncsubtest-event-attach += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-asyncsubtest-event-attach += "perl-module-warnings"
+RDEPENDS:perl-module-test2-asyncsubtest-event-detach += "perl-module-base"
+RDEPENDS:perl-module-test2-asyncsubtest-event-detach += "perl-module-strict"
+RDEPENDS:perl-module-test2-asyncsubtest-event-detach += "perl-module-test2-event-exception"
+RDEPENDS:perl-module-test2-asyncsubtest-event-detach += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-asyncsubtest-event-detach += "perl-module-warnings"
+RDEPENDS:perl-module-test2-asyncsubtest-formatter += "perl-module-strict"
+RDEPENDS:perl-module-test2-asyncsubtest-formatter += "perl-module-warnings"
+RDEPENDS:perl-module-test2-asyncsubtest-hub += "perl-module-base"
+RDEPENDS:perl-module-test2-asyncsubtest-hub += "perl-module-strict"
+RDEPENDS:perl-module-test2-asyncsubtest-hub += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-asyncsubtest-hub += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-asyncsubtest-hub += "perl-module-warnings"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-list-util"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-strict"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-test2-api-context"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-test2-asyncsubtest-event-attach"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-test2-asyncsubtest-event-detach"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-test2-asyncsubtest-hub"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-test2-ipc"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-test2-util-guard"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-test2-util-trace"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-time-hires"
+RDEPENDS:perl-module-test2-asyncsubtest += "perl-module-warnings"
+RDEPENDS:perl-module-test2-bundle-extended += "perl-module-strict"
+RDEPENDS:perl-module-test2-bundle-extended += "perl-module-test2-v0"
+RDEPENDS:perl-module-test2-bundle-extended += "perl-module-warnings"
+RDEPENDS:perl-module-test2-bundle-more += "perl-module-base"
+RDEPENDS:perl-module-test2-bundle-more += "perl-module-strict"
+RDEPENDS:perl-module-test2-bundle-more += "perl-module-test2-plugin-exitsummary"
+RDEPENDS:perl-module-test2-bundle-more += "perl-module-test2-tools-basic"
+RDEPENDS:perl-module-test2-bundle-more += "perl-module-test2-tools-class"
+RDEPENDS:perl-module-test2-bundle-more += "perl-module-test2-tools-classiccompare"
+RDEPENDS:perl-module-test2-bundle-more += "perl-module-test2-tools-subtest"
+RDEPENDS:perl-module-test2-bundle-more += "perl-module-warnings"
+RDEPENDS:perl-module-test2-bundle += "perl-module-strict"
+RDEPENDS:perl-module-test2-bundle += "perl-module-warnings"
+RDEPENDS:perl-module-test2-bundle-simple += "perl-module-base"
+RDEPENDS:perl-module-test2-bundle-simple += "perl-module-strict"
+RDEPENDS:perl-module-test2-bundle-simple += "perl-module-test2-plugin-exitsummary"
+RDEPENDS:perl-module-test2-bundle-simple += "perl-module-test2-tools-basic"
+RDEPENDS:perl-module-test2-bundle-simple += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-array += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-array += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-array += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-array += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-bag += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-bag += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-bag += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-bag += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-base += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-base += "perl-module-test2-compare-delta"
+RDEPENDS:perl-module-test2-compare-base += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-base += "perl-module-test2-util-ref"
+RDEPENDS:perl-module-test2-compare-base += "perl-module-test2-util-sub"
+RDEPENDS:perl-module-test2-compare-base += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-bool += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-bool += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-bool += "perl-module-test2-compare-negatable"
+RDEPENDS:perl-module-test2-compare-bool += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-bool += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-custom += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-custom += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-custom += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-custom += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-deepref += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-deepref += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-deepref += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-deepref += "perl-module-test2-util-ref"
+RDEPENDS:perl-module-test2-compare-deepref += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-delta += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-delta += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-compare-delta += "perl-module-test2-eventfacet-info-table"
+RDEPENDS:perl-module-test2-compare-delta += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-delta += "perl-module-test2-util-ref"
+RDEPENDS:perl-module-test2-compare-delta += "perl-module-test2-util-table"
+RDEPENDS:perl-module-test2-compare-delta += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-eventmeta += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-eventmeta += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-eventmeta += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-eventmeta += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-event += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-event += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-event += "perl-module-test2-compare-eventmeta"
+RDEPENDS:perl-module-test2-compare-event += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-event += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-float += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-float += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-float += "perl-module-test2-compare-negatable"
+RDEPENDS:perl-module-test2-compare-float += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-float += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-hash += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-hash += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-hash += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-hash += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-isa += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-isa += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-isa += "perl-module-test2-compare-negatable"
+RDEPENDS:perl-module-test2-compare-isa += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-isa += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-meta += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-meta += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-meta += "perl-module-test2-compare-delta"
+RDEPENDS:perl-module-test2-compare-meta += "perl-module-test2-compare-isa"
+RDEPENDS:perl-module-test2-compare-meta += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-meta += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-negatable += "perl-module-overload"
+RDEPENDS:perl-module-test2-compare-negatable += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-negatable += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-negatable += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-number += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-number += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-number += "perl-module-test2-compare-negatable"
+RDEPENDS:perl-module-test2-compare-number += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-number += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-object += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-object += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-object += "perl-module-test2-compare-meta"
+RDEPENDS:perl-module-test2-compare-object += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-compare-object += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-object += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-orderedsubset += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-orderedsubset += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-orderedsubset += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-orderedsubset += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-pattern += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-pattern += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-pattern += "perl-module-test2-compare-negatable"
+RDEPENDS:perl-module-test2-compare-pattern += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-pattern += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare += "perl-module-base"
+RDEPENDS:perl-module-test2-compare += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-compare-array"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-compare-base"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-compare-custom"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-compare-deepref"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-compare-hash"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-compare-pattern"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-compare-ref"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-compare-regex"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-compare-scalar"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-compare-string"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-compare-undef"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-compare-wildcard"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-compare += "perl-module-test2-util-ref"
+RDEPENDS:perl-module-test2-compare += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-ref += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-ref += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-ref += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-ref += "perl-module-test2-util-ref"
+RDEPENDS:perl-module-test2-compare-ref += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-regex += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-regex += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-regex += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-regex += "perl-module-test2-util-ref"
+RDEPENDS:perl-module-test2-compare-regex += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-scalar += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-scalar += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-scalar += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-scalar += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-set += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-set += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-set += "perl-module-test2-compare-delta"
+RDEPENDS:perl-module-test2-compare-set += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-set += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-string += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-string += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-string += "perl-module-test2-compare-negatable"
+RDEPENDS:perl-module-test2-compare-string += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-string += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-undef += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-undef += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-undef += "perl-module-test2-compare-negatable"
+RDEPENDS:perl-module-test2-compare-undef += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-undef += "perl-module-warnings"
+RDEPENDS:perl-module-test2-compare-wildcard += "perl-module-base"
+RDEPENDS:perl-module-test2-compare-wildcard += "perl-module-strict"
+RDEPENDS:perl-module-test2-compare-wildcard += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-compare-wildcard += "perl-module-warnings"
 RDEPENDS:perl-module-test2-event-bail += "perl-module-strict"
 RDEPENDS:perl-module-test2-event-bail += "perl-module-test2-util-hashbase"
 RDEPENDS:perl-module-test2-event-bail += "perl-module-warnings"
@@ -2018,6 +2229,7 @@ RDEPENDS:perl-module-test2-eventfacet-render += "perl-module-warnings"
 RDEPENDS:perl-module-test2-eventfacet-trace += "perl-module-strict"
 RDEPENDS:perl-module-test2-eventfacet-trace += "perl-module-test2-util"
 RDEPENDS:perl-module-test2-eventfacet-trace += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-eventfacet-trace += "perl-module-time-hires"
 RDEPENDS:perl-module-test2-eventfacet-trace += "perl-module-warnings"
 RDEPENDS:perl-module-test2-event-fail += "perl-module-strict"
 RDEPENDS:perl-module-test2-event-fail += "perl-module-test2-event"
@@ -2120,8 +2332,278 @@ RDEPENDS:perl-module-test2-ipc += "perl-module-test2-api-instance"
 RDEPENDS:perl-module-test2-ipc += "perl-module-test2-ipc-driver-files"
 RDEPENDS:perl-module-test2-ipc += "perl-module-test2-util"
 RDEPENDS:perl-module-test2-ipc += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-anatomy-api += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-anatomy-api += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-anatomy-context += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-anatomy-context += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-anatomy-endtoend += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-anatomy-endtoend += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-anatomy-event += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-anatomy-event += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-anatomy-hubs += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-anatomy-hubs += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-anatomy-ipc += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-anatomy-ipc += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-anatomy += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-anatomy += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-anatomy-utilities += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-anatomy-utilities += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-concurrency += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-concurrency += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-testing-introduction += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-testing-introduction += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-testing-migrating += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-testing-migrating += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-testing += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-testing += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-testing-planning += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-testing-planning += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-testing-todo += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-testing-todo += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-tooling-nesting += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-tooling-nesting += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-tooling += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-tooling += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-tooling-subtest += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-tooling-subtest += "perl-module-warnings"
+RDEPENDS:perl-module-test2-manual-tooling-testing += "perl-module-strict"
+RDEPENDS:perl-module-test2-manual-tooling-testing += "perl-module-warnings"
+RDEPENDS:perl-module-test2-mock += "perl-module-strict"
+RDEPENDS:perl-module-test2-mock += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-mock += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-mock += "perl-module-test2-util-stash"
+RDEPENDS:perl-module-test2-mock += "perl-module-test2-util-sub"
+RDEPENDS:perl-module-test2-mock += "perl-module-warnings"
 RDEPENDS:perl-module-test2 += "perl-module-strict"
 RDEPENDS:perl-module-test2 += "perl-module-warnings"
+RDEPENDS:perl-module-test2-plugin-bailonfail += "perl-module-strict"
+RDEPENDS:perl-module-test2-plugin-bailonfail += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-plugin-bailonfail += "perl-module-warnings"
+RDEPENDS:perl-module-test2-plugin-dieonfail += "perl-module-strict"
+RDEPENDS:perl-module-test2-plugin-dieonfail += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-plugin-dieonfail += "perl-module-warnings"
+RDEPENDS:perl-module-test2-plugin-exitsummary += "perl-module-strict"
+RDEPENDS:perl-module-test2-plugin-exitsummary += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-plugin-exitsummary += "perl-module-warnings"
+RDEPENDS:perl-module-test2-plugin += "perl-module-strict"
+RDEPENDS:perl-module-test2-plugin += "perl-module-warnings"
+RDEPENDS:perl-module-test2-plugin-srand += "perl-module-strict"
+RDEPENDS:perl-module-test2-plugin-srand += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-plugin-srand += "perl-module-warnings"
+RDEPENDS:perl-module-test2-plugin-times += "perl-module-strict"
+RDEPENDS:perl-module-test2-plugin-times += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-plugin-times += "perl-module-test2-util-times"
+RDEPENDS:perl-module-test2-plugin-times += "perl-module-time-hires"
+RDEPENDS:perl-module-test2-plugin-times += "perl-module-warnings"
+RDEPENDS:perl-module-test2-plugin-utf8 += "perl-module-strict"
+RDEPENDS:perl-module-test2-plugin-utf8 += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-plugin-utf8 += "perl-module-utf8"
+RDEPENDS:perl-module-test2-plugin-utf8 += "perl-module-warnings"
+RDEPENDS:perl-module-test2-require-authortesting += "perl-module-base"
+RDEPENDS:perl-module-test2-require-authortesting += "perl-module-strict"
+RDEPENDS:perl-module-test2-require-authortesting += "perl-module-warnings"
+RDEPENDS:perl-module-test2-require-automatedtesting += "perl-module-base"
+RDEPENDS:perl-module-test2-require-automatedtesting += "perl-module-strict"
+RDEPENDS:perl-module-test2-require-automatedtesting += "perl-module-warnings"
+RDEPENDS:perl-module-test2-require-envvar += "perl-module-base"
+RDEPENDS:perl-module-test2-require-envvar += "perl-module-strict"
+RDEPENDS:perl-module-test2-require-envvar += "perl-module-warnings"
+RDEPENDS:perl-module-test2-require-extendedtesting += "perl-module-base"
+RDEPENDS:perl-module-test2-require-extendedtesting += "perl-module-strict"
+RDEPENDS:perl-module-test2-require-extendedtesting += "perl-module-warnings"
+RDEPENDS:perl-module-test2-require-fork += "perl-module-base"
+RDEPENDS:perl-module-test2-require-fork += "perl-module-strict"
+RDEPENDS:perl-module-test2-require-fork += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-require-fork += "perl-module-warnings"
+RDEPENDS:perl-module-test2-require-module += "perl-module-base"
+RDEPENDS:perl-module-test2-require-module += "perl-module-strict"
+RDEPENDS:perl-module-test2-require-module += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-require-module += "perl-module-warnings"
+RDEPENDS:perl-module-test2-require-noninteractivetesting += "perl-module-base"
+RDEPENDS:perl-module-test2-require-noninteractivetesting += "perl-module-strict"
+RDEPENDS:perl-module-test2-require-noninteractivetesting += "perl-module-warnings"
+RDEPENDS:perl-module-test2-require += "perl-module-strict"
+RDEPENDS:perl-module-test2-require += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-require += "perl-module-warnings"
+RDEPENDS:perl-module-test2-require-perl += "perl-module-base"
+RDEPENDS:perl-module-test2-require-perl += "perl-module-strict"
+RDEPENDS:perl-module-test2-require-perl += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-require-perl += "perl-module-warnings"
+RDEPENDS:perl-module-test2-require-realfork += "perl-module-base"
+RDEPENDS:perl-module-test2-require-realfork += "perl-module-strict"
+RDEPENDS:perl-module-test2-require-realfork += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-require-realfork += "perl-module-warnings"
+RDEPENDS:perl-module-test2-require-releasetesting += "perl-module-base"
+RDEPENDS:perl-module-test2-require-releasetesting += "perl-module-strict"
+RDEPENDS:perl-module-test2-require-releasetesting += "perl-module-warnings"
+RDEPENDS:perl-module-test2-require-threads += "perl-module-base"
+RDEPENDS:perl-module-test2-require-threads += "perl-module-strict"
+RDEPENDS:perl-module-test2-require-threads += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-require-threads += "perl-module-warnings"
+RDEPENDS:perl-module-test2-suite += "perl-module-strict"
+RDEPENDS:perl-module-test2-suite += "perl-module-warnings"
+RDEPENDS:perl-module-test2-todo += "perl-module-overload"
+RDEPENDS:perl-module-test2-todo += "perl-module-strict"
+RDEPENDS:perl-module-test2-todo += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-todo += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-todo += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-asyncsubtest += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-asyncsubtest += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-asyncsubtest += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-asyncsubtest += "perl-module-test2-asyncsubtest"
+RDEPENDS:perl-module-test2-tools-asyncsubtest += "perl-module-test2-ipc"
+RDEPENDS:perl-module-test2-tools-asyncsubtest += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-basic += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-basic += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-basic += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-basic += "perl-module-test2-todo"
+RDEPENDS:perl-module-test2-tools-basic += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-array"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-bag"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-custom"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-event"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-hash"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-meta"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-number"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-object"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-orderedsubset"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-pattern"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-ref"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-regex"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-scalar"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-set"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-string"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-undef"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-compare-wildcard"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-util-ref"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-test2-util-table"
+RDEPENDS:perl-module-test2-tools-classiccompare += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-class += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-class += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-class += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-class += "perl-module-test2-util-ref"
+RDEPENDS:perl-module-test2-tools-class += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-data-dumper"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-array"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-bag"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-bool"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-custom"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-deepref"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-event"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-float"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-hash"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-isa"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-meta"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-number"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-object"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-orderedsubset"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-pattern"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-ref"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-regex"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-scalar"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-set"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-string"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-undef"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-compare-wildcard"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-test2-util-ref"
+RDEPENDS:perl-module-test2-tools-compare += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-defer += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-defer += "perl-module-data-dumper"
+RDEPENDS:perl-module-test2-tools-defer += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-defer += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-defer += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-tools-defer += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-encoding += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-encoding += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-encoding += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-encoding += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-event += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-event += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-event += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-tools-event += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-exception += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-exception += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-exception += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-exception += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-exports += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-exports += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-exports += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-exports += "perl-module-test2-util-stash"
+RDEPENDS:perl-module-test2-tools-exports += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-gentemp += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-gentemp += "perl-module-file-temp"
+RDEPENDS:perl-module-test2-tools-gentemp += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-gentemp += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-grab += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-grab += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-grab += "perl-module-test2-eventfacet-trace"
+RDEPENDS:perl-module-test2-tools-grab += "perl-module-test2-util-grabber"
+RDEPENDS:perl-module-test2-tools-grab += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-mock += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-mock += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-mock += "perl-module-test2-mock"
+RDEPENDS:perl-module-test2-tools-mock += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-tools-mock += "perl-module-test2-util-sub"
+RDEPENDS:perl-module-test2-tools-mock += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-refcount += "perl-module-b"
+RDEPENDS:perl-module-test2-tools-refcount += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-refcount += "perl-module-constant"
+RDEPENDS:perl-module-test2-tools-refcount += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-refcount += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-refcount += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-ref += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-ref += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-ref += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-ref += "perl-module-test2-util-ref"
+RDEPENDS:perl-module-test2-tools-ref += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-spec += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-spec += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-spec += "perl-module-test2-tools-mock"
+RDEPENDS:perl-module-test2-tools-spec += "perl-module-test2-util-importer"
+RDEPENDS:perl-module-test2-tools-spec += "perl-module-test2-workflow"
+RDEPENDS:perl-module-test2-tools-spec += "perl-module-test2-workflow-runner"
+RDEPENDS:perl-module-test2-tools-spec += "perl-module-test2-workflow-task-action"
+RDEPENDS:perl-module-test2-tools-spec += "perl-module-test2-workflow-task-group"
+RDEPENDS:perl-module-test2-tools-spec += "perl-module-vars"
+RDEPENDS:perl-module-test2-tools-spec += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-subtest += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-subtest += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-subtest += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-subtest += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-tools-subtest += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-target += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-target += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-tools-target += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-about"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-amnesty"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-assert"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-control"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-error"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-hub"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-info"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-info-table"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-meta"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-parent"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-plan"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-render"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-eventfacet-trace"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-util-importer"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-test2-util-ref"
+RDEPENDS:perl-module-test2-tools-tester += "perl-module-warnings"
 RDEPENDS:perl-module-test2-tools-tiny += "perl-module-data-dumper"
 RDEPENDS:perl-module-test2-tools-tiny += "perl-module-strict"
 RDEPENDS:perl-module-test2-tools-tiny += "perl-module-test2-api"
@@ -2129,20 +2611,127 @@ RDEPENDS:perl-module-test2-tools-tiny += "perl-module-test2-hub-interceptor"
 RDEPENDS:perl-module-test2-tools-tiny += "perl-module-test2-hub-interceptor-terminator"
 RDEPENDS:perl-module-test2-tools-tiny += "perl-module-test2-util"
 RDEPENDS:perl-module-test2-tools-tiny += "perl-module-warnings"
+RDEPENDS:perl-module-test2-tools-warnings += "perl-module-base"
+RDEPENDS:perl-module-test2-tools-warnings += "perl-module-strict"
+RDEPENDS:perl-module-test2-tools-warnings += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-tools-warnings += "perl-module-warnings"
 RDEPENDS:perl-module-test2-util-externalmeta += "perl-module-strict"
 RDEPENDS:perl-module-test2-util-externalmeta += "perl-module-warnings"
 RDEPENDS:perl-module-test2-util-facets2legacy += "perl-module-base"
 RDEPENDS:perl-module-test2-util-facets2legacy += "perl-module-strict"
 RDEPENDS:perl-module-test2-util-facets2legacy += "perl-module-warnings"
+RDEPENDS:perl-module-test2-util-grabber += "perl-module-strict"
+RDEPENDS:perl-module-test2-util-grabber += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-util-grabber += "perl-module-test2-eventfacet-trace"
+RDEPENDS:perl-module-test2-util-grabber += "perl-module-test2-hub-interceptor"
+RDEPENDS:perl-module-test2-util-grabber += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-util-grabber += "perl-module-warnings"
+RDEPENDS:perl-module-test2-util-guard += "perl-module-strict"
+RDEPENDS:perl-module-test2-util-guard += "perl-module-warnings"
 RDEPENDS:perl-module-test2-util-hashbase += "perl-module-strict"
 RDEPENDS:perl-module-test2-util-hashbase += "perl-module-warnings"
+RDEPENDS:perl-module-test2-util-importer += "perl-module-strict"
+RDEPENDS:perl-module-test2-util-importer += "perl-module-warnings"
 RDEPENDS:perl-module-test2-util += "perl-module-config"
 RDEPENDS:perl-module-test2-util += "perl-module-posix"
 RDEPENDS:perl-module-test2-util += "perl-module-strict"
 RDEPENDS:perl-module-test2-util += "perl-module-warnings"
+RDEPENDS:perl-module-test2-util-ref += "perl-module-base"
+RDEPENDS:perl-module-test2-util-ref += "perl-module-strict"
+RDEPENDS:perl-module-test2-util-ref += "perl-module-warnings"
+RDEPENDS:perl-module-test2-util-stash += "perl-module-b"
+RDEPENDS:perl-module-test2-util-stash += "perl-module-base"
+RDEPENDS:perl-module-test2-util-stash += "perl-module-strict"
+RDEPENDS:perl-module-test2-util-stash += "perl-module-warnings"
+RDEPENDS:perl-module-test2-util-sub += "perl-module-b"
+RDEPENDS:perl-module-test2-util-sub += "perl-module-base"
+RDEPENDS:perl-module-test2-util-sub += "perl-module-strict"
+RDEPENDS:perl-module-test2-util-sub += "perl-module-warnings"
+RDEPENDS:perl-module-test2-util-table-cell += "perl-module-base"
+RDEPENDS:perl-module-test2-util-table-cell += "perl-module-strict"
+RDEPENDS:perl-module-test2-util-table-cell += "perl-module-warnings"
+RDEPENDS:perl-module-test2-util-table-linebreak += "perl-module-base"
+RDEPENDS:perl-module-test2-util-table-linebreak += "perl-module-strict"
+RDEPENDS:perl-module-test2-util-table-linebreak += "perl-module-warnings"
+RDEPENDS:perl-module-test2-util-table += "perl-module-base"
+RDEPENDS:perl-module-test2-util-table += "perl-module-strict"
+RDEPENDS:perl-module-test2-util-table += "perl-module-test2-util-importer"
+RDEPENDS:perl-module-test2-util-table += "perl-module-warnings"
+RDEPENDS:perl-module-test2-util-term += "perl-module-strict"
+RDEPENDS:perl-module-test2-util-term += "perl-module-term-table-util"
+RDEPENDS:perl-module-test2-util-term += "perl-module-test2-util-importer"
+RDEPENDS:perl-module-test2-util-term += "perl-module-warnings"
+RDEPENDS:perl-module-test2-util-times += "perl-module-base"
+RDEPENDS:perl-module-test2-util-times += "perl-module-list-util"
+RDEPENDS:perl-module-test2-util-times += "perl-module-strict"
+RDEPENDS:perl-module-test2-util-times += "perl-module-warnings"
 RDEPENDS:perl-module-test2-util-trace += "perl-module-strict"
 RDEPENDS:perl-module-test2-util-trace += "perl-module-test2-eventfacet-trace"
 RDEPENDS:perl-module-test2-util-trace += "perl-module-warnings"
+RDEPENDS:perl-module-test2-v0 += "perl-module-strict"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-plugin-exitsummary"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-plugin-srand"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-plugin-utf8"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-basic"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-class"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-classiccompare"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-compare"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-defer"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-encoding"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-event"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-exception"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-exports"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-mock"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-ref"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-refcount"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-target"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-tools-warnings"
+RDEPENDS:perl-module-test2-v0 += "perl-module-test2-util-importer"
+RDEPENDS:perl-module-test2-v0 += "perl-module-warnings"
+RDEPENDS:perl-module-test2-workflow-blockbase += "perl-module-list-util"
+RDEPENDS:perl-module-test2-workflow-blockbase += "perl-module-strict"
+RDEPENDS:perl-module-test2-workflow-blockbase += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-workflow-blockbase += "perl-module-test2-util-sub"
+RDEPENDS:perl-module-test2-workflow-blockbase += "perl-module-test2-util-trace"
+RDEPENDS:perl-module-test2-workflow-blockbase += "perl-module-warnings"
+RDEPENDS:perl-module-test2-workflow-build += "perl-module-base"
+RDEPENDS:perl-module-test2-workflow-build += "perl-module-strict"
+RDEPENDS:perl-module-test2-workflow-build += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-workflow-build += "perl-module-test2-workflow-task-group"
+RDEPENDS:perl-module-test2-workflow-build += "perl-module-warnings"
+RDEPENDS:perl-module-test2-workflow += "perl-module-base"
+RDEPENDS:perl-module-test2-workflow += "perl-module-strict"
+RDEPENDS:perl-module-test2-workflow += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-workflow += "perl-module-test2-workflow-build"
+RDEPENDS:perl-module-test2-workflow += "perl-module-test2-workflow-task-group"
+RDEPENDS:perl-module-test2-workflow += "perl-module-warnings"
+RDEPENDS:perl-module-test2-workflow-runner += "perl-module-list-util"
+RDEPENDS:perl-module-test2-workflow-runner += "perl-module-overload"
+RDEPENDS:perl-module-test2-workflow-runner += "perl-module-strict"
+RDEPENDS:perl-module-test2-workflow-runner += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-workflow-runner += "perl-module-test2-asyncsubtest"
+RDEPENDS:perl-module-test2-workflow-runner += "perl-module-test2-todo"
+RDEPENDS:perl-module-test2-workflow-runner += "perl-module-test2-util"
+RDEPENDS:perl-module-test2-workflow-runner += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-workflow-runner += "perl-module-time-hires"
+RDEPENDS:perl-module-test2-workflow-runner += "perl-module-warnings"
+RDEPENDS:perl-module-test2-workflow-task-action += "perl-module-base"
+RDEPENDS:perl-module-test2-workflow-task-action += "perl-module-strict"
+RDEPENDS:perl-module-test2-workflow-task-action += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-workflow-task-action += "perl-module-warnings"
+RDEPENDS:perl-module-test2-workflow-task-group += "perl-module-base"
+RDEPENDS:perl-module-test2-workflow-task-group += "perl-module-strict"
+RDEPENDS:perl-module-test2-workflow-task-group += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-workflow-task-group += "perl-module-test2-workflow-task-action"
+RDEPENDS:perl-module-test2-workflow-task-group += "perl-module-warnings"
+RDEPENDS:perl-module-test2-workflow-task += "perl-module-base"
+RDEPENDS:perl-module-test2-workflow-task += "perl-module-list-util"
+RDEPENDS:perl-module-test2-workflow-task += "perl-module-strict"
+RDEPENDS:perl-module-test2-workflow-task += "perl-module-test2-api"
+RDEPENDS:perl-module-test2-workflow-task += "perl-module-test2-event-exception"
+RDEPENDS:perl-module-test2-workflow-task += "perl-module-test2-util-hashbase"
+RDEPENDS:perl-module-test2-workflow-task += "perl-module-warnings"
 RDEPENDS:perl-module-test-builder-formatter += "perl-module-strict"
 RDEPENDS:perl-module-test-builder-formatter += "perl-module-test2-util-hashbase"
 RDEPENDS:perl-module-test-builder-formatter += "perl-module-warnings"
@@ -2237,6 +2826,7 @@ RDEPENDS:perl-module-threads-shared += "perl-module-strict"
 RDEPENDS:perl-module-threads-shared += "perl-module-warnings"
 RDEPENDS:perl-module-threads-shared += "perl-module-xsloader"
 RDEPENDS:perl-module-tie-array += "perl-module-strict"
+RDEPENDS:perl-module-tie-file += "perl-module-constant"
 RDEPENDS:perl-module-tie-file += "perl-module-fcntl"
 RDEPENDS:perl-module-tie-file += "perl-module-posix"
 RDEPENDS:perl-module-tie-file += "perl-module-strict"
@@ -2258,8 +2848,7 @@ RDEPENDS:perl-module-tie-substrhash += "perl-module-integer"
 RDEPENDS:perl-module-tie-substrhash += "perl-module-strict"
 RDEPENDS:perl-module-tie-substrhash += "perl-module-warnings"
 RDEPENDS:perl-module-time-gmtime += "perl-module-exporter"
-RDEPENDS:perl-module-time-gmtime += "perl-module-strict"
-RDEPENDS:perl-module-time-gmtime += "perl-module-time-tm"
+RDEPENDS:perl-module-time-gmtime += "perl-module-parent"
 RDEPENDS:perl-module-time-hires += "perl-module-exporter"
 RDEPENDS:perl-module-time-hires += "perl-module-strict"
 RDEPENDS:perl-module-time-hires += "perl-module-xsloader"
@@ -2269,8 +2858,7 @@ RDEPENDS:perl-module-time-local += "perl-module-exporter"
 RDEPENDS:perl-module-time-local += "perl-module-parent"
 RDEPENDS:perl-module-time-local += "perl-module-strict"
 RDEPENDS:perl-module-time-localtime += "perl-module-exporter"
-RDEPENDS:perl-module-time-localtime += "perl-module-strict"
-RDEPENDS:perl-module-time-localtime += "perl-module-time-tm"
+RDEPENDS:perl-module-time-localtime += "perl-module-parent"
 RDEPENDS:perl-module-time-piece += "perl-module-constant"
 RDEPENDS:perl-module-time-piece += "perl-module-exporter"
 RDEPENDS:perl-module-time-piece += "perl-module-integer"
@@ -2284,7 +2872,6 @@ RDEPENDS:perl-module-time-seconds += "perl-module-exporter"
 RDEPENDS:perl-module-time-seconds += "perl-module-overload"
 RDEPENDS:perl-module-time-seconds += "perl-module-strict"
 RDEPENDS:perl-module-time-tm += "perl-module-class-struct"
-RDEPENDS:perl-module-time-tm += "perl-module-strict"
 RDEPENDS:perl-module-unicode-collate-cjk-big5 += "perl-module-strict"
 RDEPENDS:perl-module-unicode-collate-cjk-big5 += "perl-module-warnings"
 RDEPENDS:perl-module-unicode-collate-cjk-gb2312 += "perl-module-strict"
@@ -2322,12 +2909,9 @@ RDEPENDS:perl-module-unicode-ucd += "perl-module-unicode-normalize"
 RDEPENDS:perl-module-unicode-ucd += "perl-module-warnings"
 RDEPENDS:perl-module-user-grent += "perl-module-class-struct"
 RDEPENDS:perl-module-user-grent += "perl-module-exporter"
-RDEPENDS:perl-module-user-grent += "perl-module-strict"
 RDEPENDS:perl-module-user-pwent += "perl-module-class-struct"
 RDEPENDS:perl-module-user-pwent += "perl-module-config"
 RDEPENDS:perl-module-user-pwent += "perl-module-exporter"
-RDEPENDS:perl-module-user-pwent += "perl-module-strict"
-RDEPENDS:perl-module-user-pwent += "perl-module-warnings"
 RDEPENDS:perl-module-utf8 += "perl-module-strict"
 RDEPENDS:perl-module-utf8 += "perl-module-warnings"
 RDEPENDS:perl-module-version += "perl-module-strict"
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index e07355d3f54..4b4756118ce 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -45,6 +45,9 @@ do_install_ptest () {
 
 	 # Remove files with host-specific configuration for building native binaries
 	 rm ${D}${PTEST_PATH}/Makefile.config ${D}${PTEST_PATH}/xconfig.h ${D}${PTEST_PATH}/xconfig.sh
+
+         # create an empty file that is checked for existence by makerel test
+         touch ${D}${PTEST_PATH}/win32/Makefile
 }
 
 python populate_packages:prepend() {
diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb b/meta/recipes-devtools/perl/perl_5.40.0.bb
similarity index 96%
rename from meta/recipes-devtools/perl/perl_5.38.2.bb
rename to meta/recipes-devtools/perl/perl_5.40.0.bb
index 63909c242d4..77b92ae804e 100644
--- a/meta/recipes-devtools/perl/perl_5.38.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.0.bb
@@ -17,7 +17,6 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
-           file://0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
@@ -26,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "a0a31534451eb7b83c7d6594a497543a54d488bc90ca00f5e34762577f40655e"
+SRC_URI[perl.sha256sum] = "c740348f357396327a9795d3e8323bafd0fe8a5c7835fc1cbaba0cc8dfe7161f"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
@@ -39,10 +38,13 @@ DEPENDS += "make-native"
 PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
 
 PACKAGECONFIG ??= "gdbm"
-PACKAGECONFIG:append:libc-musl = " anylocale"
+PACKAGECONFIG:append:libc-musl = " anylocale lcallnopairs"
 PACKAGECONFIG[bdb] = ",-Ui_db,db"
 PACKAGECONFIG[gdbm] = ",-Ui_gdbm,gdbm"
 PACKAGECONFIG[anylocale] = "-Dd_setlocale_accepts_any_locale_name=define,,"
+PACKAGECONFIG[lcallnopairs] = "-Dd_perl_lc_all_uses_name_value_pairs=undef -Dd_perl_lc_all_category_positions_init=define -Dd_perl_lc_all_separator=define,,"
+
+PACKAGECONFIG_CONFARGS:append:libc-musl = " -Dperl_lc_all_category_positions_init='{ 0, 1, 2, 3, 4, 5 }' -Dperl_lc_all_separator='";"'"
 
 # Don't generate comments in enc2xs output files. They are not reproducible
 export ENC2XS_NO_COMMENTS = "1"
@@ -392,9 +394,10 @@ EOPREAMBLE
     egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include="*.pm" | \
     sed "s/\/.*\.pm: */ += /g;s/[\"\']//g;s/;.*/\"/g;s/+= .*\(require\|use\)\> */+= \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;s/)//;" | tr [:upper:] [:lower:] | \
     awk '{if ($3 != "\x22"$1"\x22"){ print $0}}'| \
-    grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix | \
+    grep -v -e "\-vms\-" -e module-5 -e module-v5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix | \
     sort -u | \
     sed 's/^/RDEPENDS:/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' | \
+    egrep -wv 'module-devel-mat-dumper|module-net-ssleay|module-pluggable|module-io-compress-xz|module-io-compress-zstd' | \
     egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-socket-inet6|module-io-socket-ssl|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|module-unicore|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' | \
     egrep -wv '=>|module-algorithm-diff|module-carp|module-c<extutils-mm-unix>|module-l<extutils-mm-unix>|module-encode-hanextra|module-extutils-makemaker-version-regex|module-file-spec|module-io-compress-lzma|module-io-uncompress-unxz|module-locale-maketext-lexicon|module-log-agent|module-meta-notation|module-net-localcfg|module-net-ping-external|module-b-deparse|module-scalar-util|module-some-module|module-symbol|module-uri|module-win32api-file' > ${WORKDIR}/perl-rdepends.generated
     cat ${WORKDIR}/perl-rdepends.inc ${WORKDIR}/perl-rdepends.generated > ${THISDIR}/files/perl-rdepends.txt
-- 
2.39.2


