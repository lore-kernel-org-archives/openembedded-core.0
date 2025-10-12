Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE62DCCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 20:08:33 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.25799.1760299708410991661
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 13:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=co76we5D;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: petr.vorel@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3d5088259eso525045766b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 13:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760299707; x=1760904507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xSPiPVMj6xSN7DE26lxXHKBlg+33BEu1u6e5c0O1zAY=;
        b=co76we5D7vwwtFX67NpvDZoh/sjX1VYztxgrAvCIylub8s+zFI3CJByM1EA3CwrvIz
         5Z5t72isWFBt7PW2jFg/qZcQ9bEy/BwC1mODAWoAVLyxUgZEDh9CMToJVU8BJkiznJ3C
         7RK8c53yLUvkDg7/6CqNyFvEw0jqQQP3EKT0ksgn60b7RlYEthMRlxTpvJN9fTSze8ki
         F6/uywsbQLifH4hO6iIlBx5leoYRyV9eZCMZ6N3ba2LweYjjHFbSS6U/cU2RnRI35kkL
         5sdImqD901kExKo8vbizCHFgqMDN1+U24uiD1RGfxuRZVOq5Goqr9D7zWZljphnmU9co
         GEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760299707; x=1760904507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSPiPVMj6xSN7DE26lxXHKBlg+33BEu1u6e5c0O1zAY=;
        b=khfpcgUXkHIbitqSIYezu9o2dc6ZXn2gjRhSYRI5iTxa7nEAbtbQwFH6oyQyfnqIpp
         pT6+hJl97OjRkhttYg/NEI21WHj75ctFI8VZPfoEWqTVZrETKXNLoyIRRU64GnRwREjP
         2P5MqPFhnR7H/K30MMSUqYmt7Kt5QlAkIbfB9nd03DFe8jz6MvMyvMyLjituvxXbyyYL
         i9vmIO5bQNoCgHBNT9Fzj7FC0Vh8IcZvaFTWT1H6c4BJr9WMA22pRiEWq1SobBH5Yi71
         EvrsabCSh9nINvLgm/3An6zr4wWay9fmoSPvpxoGc26Cj0V8bZNVxED1LU7LTErmsKJO
         bLPQ==
X-Gm-Message-State: AOJu0Yx1p+ZY3T/E7iAmyHt/NSAGK3V6Xtc7RvUR8OZoMsPR5x46M3LP
	saniOxR0ypmg2gWcgtTdCe0bdUanMw6BFMGyR0O/hbyU6QEfCEJmWWZdOUq6qI9J
X-Gm-Gg: ASbGncsaj8yO06ro5lMmXTK7fL6MRlbcNFZ5Cm9aMK/BwjL1QvkeACuxzyMuwR+rhk1
	6mBUAU0M6E+RSfXp4S9JBE85/a7y+FI9e4lO3zlpn8pO0lGsR+hlQ2oWiOYirhU6aHX1jyTHwol
	3rshj9idghZ5BE9BCGVL7oIDRvgUbMYoOjDm2gs08o8DRuJwC8qWN8JXmwySpr2l1UQIBNiqoJ9
	YSjyHac9eq0rm2Yjq8FH29ozl4tjF/JPt0QT2BZBFybgUg49tNduiPYlFhVFUNbZ7sxykPpPHPI
	NhUUG07pdWtrNq17Cj4I3DocVmE6q5VTipU+WZi67bWqUq5fYSIjzoZrJioDfqzDHl09EqdXHKY
	96P/xzjRPl1E53JwOdMdvF5Z270Pr07aNogHyAW7pwE5e1KO5I6xaJWw=
X-Google-Smtp-Source: AGHT+IEqs7d6bEkUzi+Z5hoHiYb9PVpKU3QVaNmJLiffXM4ERob6xzs+cnt6T+O0P6vKLqdEXfBlIw==
X-Received: by 2002:a17:907:94c3:b0:b3e:d492:d7b8 with SMTP id a640c23a62f3a-b50acc1aa45mr1646522366b.64.1760299706576;
        Sun, 12 Oct 2025 13:08:26 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d951ceb4sm769537566b.72.2025.10.12.13.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 13:08:26 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Liu Yiding <liuyd.fnst@fujitsu.com>,
	Jiaying Song <jiaying.song.cn@windriver.com>,
	Mingde Zeng <matthew.zeng@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 1/1] ltp: upgrade 20250530 -> 20250930
Date: Sun, 12 Oct 2025 22:08:20 +0200
Message-ID: <20251012200820.372223-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 20:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224748

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi all,

I'm sorry, I planned to test this time, but it failed. Any hint what's
wrong? Or can anybody test this patch?

$ . oe-init-build-env

.../build $ bitbake ltp
ERROR: Error importing OE modules: module 'bb.parse' has no attribute
'vardepsexclude'
ERROR: Unable to parse
/home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py
Traceback (most recent call last):
  File
  "/home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py",
  line 372, in eval
      layerid, fragment_name = f.split('/', 1)
	      ^^^^^^^^^^^^^^^^^^^^^^
		  ValueError: not enough values to unpack (expected 2, got 1)

FYI I also plan to get rid of some patches posted.

* 0001-Add-__clear_cache-declaration-for-clang.patch
It's wrong, I'd like to replace it with:
https://patchwork.ozlabs.org/project/ltp/list/?series=477319&state=*

* 0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
I posted a review, hopefully we get a feedback from other developers
soon.

* 0001-Remove-OOM-tests-from-runtest-mm.patch
Is it really needed to drop these tests?

BTW for those who run LTP: kirk might be interesting tool to use:
https://github.com/linux-test-project/kirk

We also bundle it in LTP as a submodule:
https://github.com/linux-test-project/ltp/blob/master/.gitmodules

It's also in pypi:
https://pypi.org/project/kirk/

I see in meta/lib/oeqa/runtime/cases/ltp.py the deprecated
/opt/ltp/runltp is still being used. We want to remove it (not sure
when, but it will happen sooner or later). Any change somebody would
submit a patch to switch to kirk?

Kind regards,
Petr

 .../0001-Remove-OOM-tests-from-runtest-mm.patch    | 13 ++++++++-----
 ...mctl08-Skip-semctl08-when-__USE_TIME64_RE.patch | 14 +++++++-------
 .../ltp/{ltp_20250530.bb => ltp_20250930.bb}       |  2 +-
 3 files changed, 16 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20250530.bb => ltp_20250930.bb} (99%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 936e23ebda..c1cf8e8a41 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,23 +1,23 @@
-From 7096737fbbe19d0765f0a8c62ef7667bf4875780 Mon Sep 17 00:00:00 2001
+From 3e59500d1dc60686b8c4c6a24813bd14ad479e43 Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
-Subject: [PATCH] Remove OOM tests from runtest/mm
+Subject: [PATCH 1/3] Remove OOM tests from runtest/mm
 
 Disable OOM tests, as they might cause oeqa ssh connection lost
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
-[ pvorel: rebased for 20210927 ]
+[ pvorel: rebased for 20250930 ]
 Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  runtest/mm | 6 ------
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index 5566a7742..8014d509b 100644
+index 41d624ad86..1e8c226389 100644
 --- a/runtest/mm
 +++ b/runtest/mm
-@@ -70,12 +70,6 @@ ksm07 ksm07
+@@ -69,12 +69,6 @@ ksm07 ksm07
  cpuset01 cpuset01
  cpuset02 cpuset02
  
@@ -30,3 +30,6 @@ index 5566a7742..8014d509b 100644
  swapping01 swapping01 -i 5
  
  thp01 thp01 -I 120
+-- 
+2.51.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
index b4859a6f0a..0c7a351b7e 100644
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
@@ -1,8 +1,8 @@
-From 55b48d66857a43c2609fc351293b5601e2eb955d Mon Sep 17 00:00:00 2001
+From 1285a11d8f7660dc42afb5f3fcf147d54e321844 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Fri, 23 May 2025 15:17:49 +0800
-Subject: [PATCH] syscalls/semctl08: Skip semctl08 when __USE_TIME64_REDIRECTS
- is defined
+Subject: [PATCH 3/3] syscalls/semctl08: Skip semctl08 when
+ __USE_TIME64_REDIRECTS is defined
 
 When __USE_TIME64_REDIRECTS is defined, glibc redirects struct semid_ds to a
 64-bit time-safe version that omits the sem_otime_high and sem_ctime_high
@@ -20,10 +20,10 @@ Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
  1 file changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
-index 1878bd4..3b799fa 100644
+index f4549adf43..28776f266e 100644
 --- a/testcases/kernel/syscalls/ipc/semctl/semctl08.c
 +++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
-@@ -10,7 +10,11 @@
+@@ -12,7 +12,11 @@
  #include "tst_test.h"
  #include "libnewipc.h"
  
@@ -36,7 +36,7 @@ index 1878bd4..3b799fa 100644
  
  static void run(void)
  {
-@@ -47,6 +51,4 @@ static struct tst_test test = {
+@@ -49,6 +53,4 @@ static struct tst_test test = {
  	.test_all = run,
  	.needs_tmpdir = 1,
  };
@@ -44,5 +44,5 @@ index 1878bd4..3b799fa 100644
 -TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fields");
  #endif
 -- 
-2.34.1
+2.51.0
 
diff --git a/meta/recipes-extended/ltp/ltp_20250530.bb b/meta/recipes-extended/ltp/ltp_20250930.bb
similarity index 99%
rename from meta/recipes-extended/ltp/ltp_20250530.bb
rename to meta/recipes-extended/ltp/ltp_20250930.bb
index 9ea5de10ee..1514aca8fe 100644
--- a/meta/recipes-extended/ltp/ltp_20250530.bb
+++ b/meta/recipes-extended/ltp/ltp_20250930.bb
@@ -24,7 +24,7 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "14331e1ecfcd63426c9d270d88b7bad9f60c6d64"
+SRCREV = "d2550ffbbcfe163212cd7e9c132db65ae0fa06ed"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-- 
2.51.0


