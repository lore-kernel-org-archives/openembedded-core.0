Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B290CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:17:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5763.1781637422977651857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PvaLDJNn;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490c1915793so41653045e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637421; x=1782242221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCeLRZ8XBTBiZZ+kUoGdMix1ELLL4aIh4E8UlkhCSnw=;
        b=PvaLDJNnYIVOAieLFOyoKshDQnAsvvnj7cjWnqRZVoDzddNPTm9aOQF6qOsI5/O2qh
         JS/GyxPX0l8LVbxo6G4xcp75ONKo+c7Y0xdslYD0mdnHg+P/2kQ50BbCXOPTgW37MOJk
         X9AEPEtDmLYVsoOVDk9KxgLS0x9Jc84nzaHvfINme6iVqif/FKSF7l1ZgF3SzJ1A2yZs
         hr1+ubYe7AdoCsoyakUmQb6qMYpY7ycA/91bSXERlSajrnDr+qCYiTkJHmmip8yntwSl
         8EAwbMv0FC5jvXyFx8tcXSq3Q658z270v5VP89xGb48gP/ghJXgtvs/IGcF1OSkOJ6vB
         nhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637421; x=1782242221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TCeLRZ8XBTBiZZ+kUoGdMix1ELLL4aIh4E8UlkhCSnw=;
        b=A80z17ITrhIcNIKuntjKNhGLEpXhHbz8Rb803n7BBXTAUfVmVUsZIdBeF3WexkTOg+
         XQC5CasXX05qjc2YPvpHtEb2qTq0cGAW87WSA1yoEkBT2CPl1xV/uvfyR+lua8ez5Rgc
         7yrkw7MHPNXYv5cJOlqwymwoww3102VzIvlAnC9bYBhNgREAN5QQlamQs1py09sbAIYj
         KWTt0FB5P0wNys5DmpVw2fTf8PloqTEQcKVPfgrWIqD0ya9QlncpxFzVzzJtI/D1n9zc
         MiaZQA94STJzq99b0Zk/XSQT5EXCXOORSyAQJvPzfXsGhPvYG/YGYqTnYrFs7K9Mi/Pr
         3ihw==
X-Gm-Message-State: AOJu0YyS35YIMbRu+ll0DF5CUgWpGu/Ux4KD4N0gC+jlgS8SS+HPG9yE
	FwJBTJk7obalLGwPJWEP5BoWjblOb4Ni5yoAYs0mVO7PFssoplKHWdwKPdsGD5ez
X-Gm-Gg: Acq92OG7B5YgdEA/3l/W0GFSRb8f647I5tegmcvLtycD/ywQFB6AIEFZ8dVCJ3JP82l
	MV1MZrqb+hw1R4EKVMLq+/cpTJucqLeWRW2XtrBIse+IYtMpTFPo9gOYvdFvV6/OV9Jzre5IoI9
	bmQ7Eja3ny4QATOsFcqyHaEp5irS5cbT/ex0VkdeMIqSv0KrFMpi00fjoIT2lKEGzc680NAVket
	dlCztgC7FXpe64VgTHmChyZ2FsRuSmSqV1k0hxVNjCzkC7KEEMj4d6OqXA2NTFrdO4WMz/NbFOY
	djHWlYkjUQe9Xdfoy+cOh/HDzytNaYIq3HgdCpIDDOy712zFnlr6GgKerU4W+xNsAMmk2usf8kt
	A/59+7wgyO2ty1apGrSHepRR4ysqnnLEdMvdufNqJ1uzujedLVTtV/WxjbbHUEQ4jk3HWOOGbF8
	l5Q1hlKQbjERDcaeQoXr6ErSyxPq9souvT6SckBF56ybFvoWoQeN3Bi7Gqj7s=
X-Received: by 2002:a05:600c:c08b:b0:490:b5d0:598e with SMTP id 5b1f17b1804b1-492333c95b7mr10705825e9.21.1781637421017;
        Tue, 16 Jun 2026 12:17:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:17:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/30] perl: upgrade 5.42.0 -> 5.42.2
Date: Tue, 16 Jun 2026 21:16:21 +0200
Message-ID: <20260616191628.2014553-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238950

From: Alexander Kanavin <alex@linutronix.de>

Add a patch to perlcross to support building this perl
version (perlcross is sluggish to support new perl releases
lately).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/0001-patches-for-perl-5.42.2.patch  | 110 ++++++++++++++++++
 .../perl-cross/perlcross_1.6.4.bb             |   1 +
 ...ule-breaks-through-the-perl-wrapper-.patch |   8 +-
 ...Makefile.PL-Fix-_PATH_LOG-for-determ.patch |   2 +-
 .../files/0002-Constant-Fix-up-shebang.patch  |   2 +-
 .../perl/files/determinism.patch              |   2 +-
 .../perl/files/encodefix.patch                |   2 +-
 .../perl/files/errno_ver.diff                 |   2 +-
 .../perl/files/native-perlinc.patch           |   6 +-
 .../perl/files/perl-configpm-switch.patch     |   4 +-
 .../perl/files/perl-dynloader.patch           |   2 +-
 .../perl/{perl_5.42.0.bb => perl_5.42.2.bb}   |   2 +-
 12 files changed, 127 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.42.2.patch
 rename meta/recipes-devtools/perl/{perl_5.42.0.bb => perl_5.42.2.bb} (99%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.42.2.patch b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.42.2.patch
new file mode 100644
index 0000000000..8d9aa26293
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.42.2.patch
@@ -0,0 +1,110 @@
+From 61e182b82c13111c91ccbe9f6e94ceb4164b2aea Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 29 Apr 2026 12:43:32 +0200
+Subject: [PATCH] patches for perl-5.42.2
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/174]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ cnf/diffs/perl5-5.42.2/constant.patch       | 1 +
+ cnf/diffs/perl5-5.42.2/dynaloader.patch     | 1 +
+ cnf/diffs/perl5-5.42.2/findext.patch        | 1 +
+ cnf/diffs/perl5-5.42.2/installscripts.patch | 1 +
+ cnf/diffs/perl5-5.42.2/liblist.patch        | 1 +
+ cnf/diffs/perl5-5.42.2/makemaker.patch      | 1 +
+ cnf/diffs/perl5-5.42.2/posix-makefile.patch | 1 +
+ cnf/diffs/perl5-5.42.2/test-checkcase.patch | 1 +
+ cnf/diffs/perl5-5.42.2/test-makemaker.patch | 1 +
+ cnf/diffs/perl5-5.42.2/xconfig.patch        | 1 +
+ 10 files changed, 10 insertions(+)
+ create mode 120000 cnf/diffs/perl5-5.42.2/constant.patch
+ create mode 120000 cnf/diffs/perl5-5.42.2/dynaloader.patch
+ create mode 120000 cnf/diffs/perl5-5.42.2/findext.patch
+ create mode 120000 cnf/diffs/perl5-5.42.2/installscripts.patch
+ create mode 120000 cnf/diffs/perl5-5.42.2/liblist.patch
+ create mode 120000 cnf/diffs/perl5-5.42.2/makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.42.2/posix-makefile.patch
+ create mode 120000 cnf/diffs/perl5-5.42.2/test-checkcase.patch
+ create mode 120000 cnf/diffs/perl5-5.42.2/test-makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.42.2/xconfig.patch
+
+diff --git a/cnf/diffs/perl5-5.42.2/constant.patch b/cnf/diffs/perl5-5.42.2/constant.patch
+new file mode 120000
+index 0000000..065e198
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.2/constant.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/constant.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.2/dynaloader.patch b/cnf/diffs/perl5-5.42.2/dynaloader.patch
+new file mode 120000
+index 0000000..ffb73eb
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.2/dynaloader.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/dynaloader.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.2/findext.patch b/cnf/diffs/perl5-5.42.2/findext.patch
+new file mode 120000
+index 0000000..9efbe5b
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.2/findext.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/findext.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.2/installscripts.patch b/cnf/diffs/perl5-5.42.2/installscripts.patch
+new file mode 120000
+index 0000000..1c05e0f
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.2/installscripts.patch
+@@ -0,0 +1 @@
++../perl5-5.36.0/installscripts.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.2/liblist.patch b/cnf/diffs/perl5-5.42.2/liblist.patch
+new file mode 120000
+index 0000000..5037380
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.2/liblist.patch
+@@ -0,0 +1 @@
++../perl5-5.42.0/liblist.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.2/makemaker.patch b/cnf/diffs/perl5-5.42.2/makemaker.patch
+new file mode 120000
+index 0000000..d7bd609
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.2/makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.38.0/makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.2/posix-makefile.patch b/cnf/diffs/perl5-5.42.2/posix-makefile.patch
+new file mode 120000
+index 0000000..29463b7
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.2/posix-makefile.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/posix-makefile.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.2/test-checkcase.patch b/cnf/diffs/perl5-5.42.2/test-checkcase.patch
+new file mode 120000
+index 0000000..36c5186
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.2/test-checkcase.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/test-checkcase.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.2/test-makemaker.patch b/cnf/diffs/perl5-5.42.2/test-makemaker.patch
+new file mode 120000
+index 0000000..4e970ff
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.2/test-makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.34.0/test-makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.2/xconfig.patch b/cnf/diffs/perl5-5.42.2/xconfig.patch
+new file mode 120000
+index 0000000..87ac501
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.2/xconfig.patch
+@@ -0,0 +1 @@
++../perl5-5.42.0/xconfig.patch
+\ No newline at end of file
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
index 3c544c9746..bb6c1b908a 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
+           file://0001-patches-for-perl-5.42.2.patch \
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
diff --git a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
index 2076c61ee0..915ae92dae 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
+From 7e82d4ac0a2ae14c39b1d2e8e65daa714df4fe06 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 5 Jun 2018 14:58:42 +0300
 Subject: [PATCH] Somehow this module breaks through the perl wrapper and
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index fe38598..0828f52 100644
+index 570fe52..46fad15 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -1161,6 +1161,9 @@ WARNING
+@@ -1188,6 +1188,9 @@ WARNING
      }
  
      foreach my $name (@$names){
@@ -24,7 +24,7 @@ index fe38598..0828f52 100644
          my ($abs, $use_dir);
          if ($self->file_name_is_absolute($name)) {     # /foo/bar
              $abs = $name;
-@@ -2097,6 +2100,7 @@ sub init_PERL {
+@@ -2120,6 +2123,7 @@ sub init_PERL {
  
      $self->{PERL} ||=
          $self->find_perl(5.0, \@perls, \@defpath, $Verbose );
diff --git a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
index 7e5d08d8db..bf5c300980 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
+From deb4bdaab20ab3110682038877fdc3287af30703 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 80986e66da..438a6173c8 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,4 +1,4 @@
-From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
+From 5c9981da04fa0229ddc034eb58f69ad723fe7985 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
 Subject: [PATCH] Constant: Fix up shebang
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index bdb9a928bb..61ba1a5791 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,4 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From 012e670f8fb6d4c6c196c91909c95358ca9f6289 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 665699d12d..20c66e6458 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,4 +1,4 @@
-From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From fa9b58f55bf76a13c360e921d169808c6c6058ca Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 18 Feb 2020 17:27:26 +0000
 Subject: [PATCH] perl: Fix encode module reproducibility issues
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index 477642f457..dfd93307ce 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,4 +1,4 @@
-From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
+From 0a95cdcd9d4724b27a8712caa52136266702cbe2 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: [PATCH] Remove Errno version check due to upgrade problems with
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 7e3e5f6652..33af3b1283 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From 852ada6549493fbf6814be5a889d4f01ba4a2b62 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 May 2007 09:33:32 +0000
 Subject: [PATCH] perl: sync with OE
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 13 insertions(+)
 
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 0828f52..b8abff4 100644
+index 46fad15..e543178 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -1862,6 +1862,19 @@ from the perl source tree.
+@@ -1892,6 +1892,19 @@ from the perl source tree.
  	$self->{PERL_LIB}     ||= $Config{privlibexp};
  	$self->{PERL_ARCHLIB} ||= $Config{archlibexp};
  	$self->{PERL_INC}     = $self->catdir("$self->{PERL_ARCHLIB}","CORE"); # wild guess for now
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 3721277933..71f4232f8b 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
+From 74a6e07841cb0efe520e70b2ff7e17a29d081d78 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
@@ -19,7 +19,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/configpm b/configpm
-index 07219d8..01a23fa 100755
+index 0c46b9e..1daebef 100755
 --- a/configpm
 +++ b/configpm
 @@ -718,7 +718,7 @@ $config_txt .= uncomment <<'ENDOFEND';
diff --git a/meta/recipes-devtools/perl/files/perl-dynloader.patch b/meta/recipes-devtools/perl/files/perl-dynloader.patch
index 5472602d3a..c54fca9486 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From 93243292a3b0cf0de5766a7429e8e6936236c236 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.2.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.42.0.bb
rename to meta/recipes-devtools/perl/perl_5.42.2.bb
index 1833b7a352..f076431aff 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.2.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53329663096dc"
+SRC_URI[perl.sha256sum] = "9384e8deb75b7b1695e5637971b752281aaecd025a3d5d4734d33c1d0adfee47"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.47.3


