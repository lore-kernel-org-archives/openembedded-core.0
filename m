Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42C6CA6004
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:39 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48825.1791301596646894429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=olI2Aqh6;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c411d6615so622136f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301595; x=1791906395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GSUy14tUSTiY0vW7l/m27vmu9HLdTFpP9YzKndjGiz4=;
        b=olI2Aqh6ei40X8ggow9hnKwAOFdLYAl5ddfdhjs1hg4jdnFpt2tZPoKxO8QUyQDpaN
         0jKuu4jjNDPNoubhWnugt9pm+CeKdY6iu5sEqeqxDq+TwSI+jBdEM3PweZKAbECG9CSE
         UE8NRwHToFRuXFjboXwlbyaZLMDoD5pE6Aht8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301595; x=1791906395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GSUy14tUSTiY0vW7l/m27vmu9HLdTFpP9YzKndjGiz4=;
        b=oiZCQEWIUjsMo+x7m0mIEgRcSEuobK9f7xuYdcmeg8Ab23PnUd6X3zBdI96QHfxN1g
         mZ2h73250WgDfSgV0xK87AXT8/7jEPFlgAfrTcIBmgOD7rWsIU7l0W/bQg5t93XIn1e0
         jXGPs7clxv1Yf6PRZmUpBxFmGFpzogWN85RebIajN2OtatwdcUGoiy/6oXVlxOtUMcT4
         mX6BBOV9uPdol3Zl8AlODwlKIq3scMZ6BqGY9cQDCTbyGY07z/7pKklwbXXwvjoB+acK
         2RHJiKhaC6fcrLO0fRmtxd/B1JCwafEm3sylgMsFfFktBSlrBP0c6+ArZf1i6C6CSGpl
         IHiA==
X-Gm-Message-State: AFq9FYJKUG7lTAWnEQh4n04DUprRXntxlhUlrT61F5uOg1tOqa9flSi0
	SNxRmVtNmiV0U94t0X8eQf1mmWKiiWcYnl/7+m6Ixw1pemf8TtxnpV18V8hK6O9NNs110zq03DE
	bU5PBoig=
X-Gm-Gg: AYBFou1NwEw5waKz+H5wf8lquWaWsAoE3xqPvaRftsSQyvuCp6R42QJzs1UtR7CYCzz
	HY7a8zgcSpuS87UB/y0aqoSO2lLHK9dOp1JJm8Wql+NMtYI8iNLHNi5VYY57/rmgzr2lOluXDK0
	VVvFHcHoRWIDyjqZ1oxqlBSv4ydbA1JoY0iG30v/CilWuBc4l90z/JR0oRpgG6UBTENWjvGlWrh
	suHxp5B1f4PtFtds0udx9nwsOJFWWGhAU20/LSCymT4Va1ptH+/humGsJF9zbOXzkFAZsgaLybR
	KxvZWivfyIDFGqPIrYVgfhU8BbB5Ge48Fggz/CI5J6VVqNtbUxfF5Utgqo48aNcj1V6SMIojf4V
	MYcoeHUVRaCEenLXHU/LmGIbrSfmLMtWNMCegQmC4xKf+5OsgfYqmH6AAg4LUNJ1RTHwH7UoLsV
	WNK+XWHekMPl0qZqTgnj05QmNGrLOyUGH/EAvRJTWzr+hNZGCmkzotoY1fqO2ZdyYOCdg8ngZbm
	ijaZ60+BtJO49VeRWj+k87ThCviUMf0wDjzF1YolK3H/nAn3EvLJBPaunPaEqXwMl8KY7RgQDA+
	TUFv7vPPSf5JSSW6
X-Received: by 2002:a05:6000:25ca:b0:48b:10af:f85c with SMTP id ffacd0b85a97d-48c6d1957a4mr3703565f8f.37.1791301594331;
        Tue, 06 Oct 2026 08:46:34 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 13/19] perlcross: Upgrade 1.6.4 -> 1.6.5
Date: Tue,  6 Oct 2026 17:45:59 +0200
Message-ID: <780851cf1108748a9ec4f49e63cb2baad4a3434a.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247302

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

CompareLog: https://github.com/arsv/perl-cross/compare/1.6.4...1.6.5

- Drop below patches which are part of release now (more details in compareLog)
  0001-patches-for-perl-5.44.0.patch
  0002-Add-configure-checks-for-perl-5.44.0.patch
  0003-Fix-checkfield-for-C23-compatibility.patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc5d74c8599d58aca7ed38691737a3eb2d26dcbc)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ile-check-the-file-if-patched-or-not.patch |   2 +-
 .../files/0001-patches-for-perl-5.44.0.patch  | 110 ------------------
 ...oss-add-LDFLAGS-when-linking-libperl.patch |   2 +-
 ...Add-configure-checks-for-perl-5.44.0.patch |  47 --------
 ...Fix-checkfield-for-C23-compatibility.patch |  35 ------
 .../perl-cross/files/determinism.patch        |   4 +-
 ...{perlcross_1.6.4.bb => perlcross_1.6.5.bb} |   5 +-
 7 files changed, 5 insertions(+), 200 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.4.bb => perlcross_1.6.5.bb} (80%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
index 7efee733c67..aebd1691265 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
@@ -1,4 +1,4 @@
-From d0292a4f91ca22f8919a0f13d8961f98743bdbf1 Mon Sep 17 00:00:00 2001
+From 685f925eafa58630b1539eb97386653eadb95f23 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 2 Jul 2021 09:08:21 +0000
 Subject: [PATCH] Makefile: check the file if patched or not
diff --git a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch
deleted file mode 100644
index 36f065419f6..00000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Tue, 21 Jul 2026 09:10:00 +0000
-Subject: [PATCH] patches for perl-5.44.0
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- cnf/diffs/perl5-5.44.0/constant.patch       | 1 +
- cnf/diffs/perl5-5.44.0/dynaloader.patch     | 1 +
- cnf/diffs/perl5-5.44.0/findext.patch        | 1 +
- cnf/diffs/perl5-5.44.0/installscripts.patch | 1 +
- cnf/diffs/perl5-5.44.0/liblist.patch        | 1 +
- cnf/diffs/perl5-5.44.0/makemaker.patch      | 1 +
- cnf/diffs/perl5-5.44.0/posix-makefile.patch | 1 +
- cnf/diffs/perl5-5.44.0/test-checkcase.patch | 1 +
- cnf/diffs/perl5-5.44.0/test-makemaker.patch | 1 +
- cnf/diffs/perl5-5.44.0/xconfig.patch        | 1 +
- 10 files changed, 10 insertions(+)
- create mode 120000 cnf/diffs/perl5-5.44.0/constant.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/dynaloader.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/findext.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/installscripts.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/liblist.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/makemaker.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/posix-makefile.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/test-checkcase.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/test-makemaker.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/xconfig.patch
-
-diff --git a/cnf/diffs/perl5-5.44.0/constant.patch b/cnf/diffs/perl5-5.44.0/constant.patch
-new file mode 120000
-index 0000000..065e198
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/constant.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/constant.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/dynaloader.patch b/cnf/diffs/perl5-5.44.0/dynaloader.patch
-new file mode 120000
-index 0000000..ffb73eb
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/dynaloader.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/dynaloader.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/findext.patch b/cnf/diffs/perl5-5.44.0/findext.patch
-new file mode 120000
-index 0000000..9efbe5b
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/findext.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/findext.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/installscripts.patch b/cnf/diffs/perl5-5.44.0/installscripts.patch
-new file mode 120000
-index 0000000..1c05e0f
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/installscripts.patch
-@@ -0,0 +1 @@
-+../perl5-5.36.0/installscripts.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/liblist.patch b/cnf/diffs/perl5-5.44.0/liblist.patch
-new file mode 120000
-index 0000000..5037380
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/liblist.patch
-@@ -0,0 +1 @@
-+../perl5-5.42.0/liblist.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/makemaker.patch b/cnf/diffs/perl5-5.44.0/makemaker.patch
-new file mode 120000
-index 0000000..d7bd609
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/makemaker.patch
-@@ -0,0 +1 @@
-+../perl5-5.38.0/makemaker.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/posix-makefile.patch b/cnf/diffs/perl5-5.44.0/posix-makefile.patch
-new file mode 120000
-index 0000000..29463b7
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/posix-makefile.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/posix-makefile.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/test-checkcase.patch b/cnf/diffs/perl5-5.44.0/test-checkcase.patch
-new file mode 120000
-index 0000000..36c5186
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/test-checkcase.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/test-checkcase.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/test-makemaker.patch b/cnf/diffs/perl5-5.44.0/test-makemaker.patch
-new file mode 120000
-index 0000000..4e970ff
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/test-makemaker.patch
-@@ -0,0 +1 @@
-+../perl5-5.34.0/test-makemaker.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/xconfig.patch b/cnf/diffs/perl5-5.44.0/xconfig.patch
-new file mode 120000
-index 0000000..87ac501
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/xconfig.patch
-@@ -0,0 +1 @@
-+../perl5-5.42.0/xconfig.patch
-\ No newline at end of file
diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
index 6d387fe66a0..dbddd9bc616 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
@@ -1,4 +1,4 @@
-From c4ebb6d11d690185f66a3f0a591f193fd6611122 Mon Sep 17 00:00:00 2001
+From 10140792a3d9100ca38ddda5f47c0faeb26af1d4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Nov 2018 15:37:40 +0100
 Subject: [PATCH] perl-cross: add LDFLAGS when linking libperl
diff --git a/meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch b/meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch
deleted file mode 100644
index e7fd9df2f50..00000000000
--- a/meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From d6010680c68655b782c2e07bd0d38562c1ad0ccb Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Tue, 21 Jul 2026 09:28:12 +0000
-Subject: [PATCH] Add configure checks for perl 5.44.0 new symbols
-
-Add detection for d_getentropy, i_stdckdint, and i_sysrandom which
-are new config symbols required by perl 5.44.0.
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- cnf/configure_func.sh | 1 +
- cnf/configure_hdrs.sh | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/cnf/configure_func.sh b/cnf/configure_func.sh
-index 20f9cdf..4cbee2f 100644
---- a/cnf/configure_func.sh
-+++ b/cnf/configure_func.sh
-@@ -104,6 +104,7 @@ checkfunc d_getaddrinfo 'getaddrinfo' "NULL,NULL,NULL,NULL" 'sys/types.h sys/soc
- checkfunc d_get_current_dir_name 'get_current_dir_name' "" 'unistd.h'
- checkfunc d_getcwd 'getcwd' 'NULL,0' 'unistd.h'
- checkfunc d_getespwnam 'getespwnam'
-+checkfunc d_getentropy 'getentropy' 'NULL,0' 'unistd.h'
- checkfunc d_getfsstat 'getfsstat' "NULL,0,0" 'sys/types.h sys/mount.h'
- checkfunc d_getgrent 'getgrent' "" 'sys/types.h grp.h'
- checkfunc d_getgrps 'getgroups' "0,NULL" 'unistd.h'
-diff --git a/cnf/configure_hdrs.sh b/cnf/configure_hdrs.sh
-index 249f5bc..b2d9d88 100644
---- a/cnf/configure_hdrs.sh
-+++ b/cnf/configure_hdrs.sh
-@@ -64,6 +64,7 @@ checkhdr i_socks 'socks.h'
- # i_stdarg below
- checkhdr i_stdbool 'stdbool.h'
- checkhdr i_stddef 'stddef.h'
-+checkhdr i_stdckdint 'stdckdint.h'
- checkhdr i_stdint 'stdint.h'
- checkhdr i_stdlib 'stdlib.h'
- checkhdr i_string 'string.h'
-@@ -88,6 +89,7 @@ checkhdr i_syssockio 'sys/sockio.h'
- checkhdr i_sysstat 'sys/stat.h'
- checkhdr i_sysstatfs 'sys/statfs.h'
- checkhdr i_sysstatvfs 'sys/statvfs.h'
-+checkhdr i_sysrandom 'sys/random.h'
- checkhdr i_systime 'sys/time.h'
- define i_systimek 'undef' # not a plain header check
- checkhdr i_systimes 'sys/times.h'
diff --git a/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch b/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch
deleted file mode 100644
index b92995b131d..00000000000
--- a/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7faa8a36afb579f07101a48065e4a19729034807 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Wed, 22 Jul 2026 09:21:26 +0000
-Subject: [PATCH] configure_type_ext: Fix checkfield for C23/GCC 16
-
-In C23, 'void foo()' means no parameters, so calling foo(value.field)
-fails with GCC 16 when -Werror is used. This breaks detection of
-struct fields like tm_gmtoff and tm_zone.
-
-Use (void)value.field instead, which works for any field type.
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- cnf/configure_type_ext.sh | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/cnf/configure_type_ext.sh b/cnf/configure_type_ext.sh
-index 0136c90..9ecd3fb 100644
---- a/cnf/configure_type_ext.sh
-+++ b/cnf/configure_type_ext.sh
-@@ -7,11 +7,9 @@ checkfield() {
- 	
- 	try_start
- 	try_includes $4
--	try_add 'void foo();'
--	try_add 'void bar()'
--        try_add "{"
-+	try_add 'void bar(void) {'
- 	try_add "	$2 value;"
--	try_add "	foo(value.$3);"
-+	try_add "	(void)value.$3;"
- 	try_add "}"
- 	try_compile
- 
diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/meta/recipes-devtools/perl-cross/files/determinism.patch
index 71a405ab6b5..cb4c642d8af 100644
--- a/meta/recipes-devtools/perl-cross/files/determinism.patch
+++ b/meta/recipes-devtools/perl-cross/files/determinism.patch
@@ -1,4 +1,4 @@
-From 8fd84d6d760b21bad2c499b572951cc3f2235953 Mon Sep 17 00:00:00 2001
+From 454646b5ecd14e7bc1b54521f78b1af69549c108 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
@@ -39,7 +39,7 @@ index 2f451c6..86bc865 100755
  base=${0%/*}; test -z "$base" && base=.
  
 diff --git a/cnf/configure_mods.sh b/cnf/configure_mods.sh
-index d4ef5a7..8e88b48 100644
+index da463d2..4299c1b 100644
 --- a/cnf/configure_mods.sh
 +++ b/cnf/configure_mods.sh
 @@ -108,7 +108,7 @@ extonlyif() {
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb
similarity index 80%
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb
index 1aeee7a2c9a..77ca5b0e302 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb
@@ -15,13 +15,10 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
-           file://0001-patches-for-perl-5.44.0.patch \
-           file://0002-Add-configure-checks-for-perl-5.44.0.patch \
-           file://0003-Fix-checkfield-for-C23-compatibility.patch \
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "b6202173b0a8a43fb312867d85a8cd33527f3f234b1b6e591cdaa9895c9920c7"
+SRC_URI[perl-cross.sha256sum] = "81130cd4b8c6d9eb2a1959f37d44391a46ad6a6794fc41fed5441f74e85e3dd0"
 
 S = "${UNPACKDIR}/perl-cross-${PV}"
 

