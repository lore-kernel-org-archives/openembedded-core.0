Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB56C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:57 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.130223.1712646656112303851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V7pxYUM7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646656; x=1744182656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7FD+D0wCoYbKDtzLqENAcNOU+461FEkcsiFDTK364MQ=;
  b=V7pxYUM7gQED4YTuUUIn+7MHrxtAMjCROqqh7sE190I16nAv4aZYbtcc
   rByJc2G3geHdopDeoK8Y9UUPiNlRikO0EfJVVV+/NelXfn4ou9HR21UGv
   tU3rFVAFnwfo4/eunpe7GbbYrWcUJ3+A6BY7iq8HQsK/IB7nRrZA9f+og
   etHCpU/H93k9XDiQQ+Lt9LUPyyz0toCs91D9gJjiA6wK9AcjavBlp1HqJ
   SDYMNbQFaRCNI/NvumyfHzaHpTwR7c1UjupS5VlJEcBJpUa65A36kS06z
   yfCfFKi/9FunNlzEKKAaEOXSWUNwVVyY6y+sKECOWXaumM4/SnEesJ5zO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="155056946"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="155056946"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:54 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D685BD2A1C
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 06B77D8AC3
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BA2920093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3A2EE1A0002;
	Tue,  9 Apr 2024 15:10:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/33] rsync: upgrade 3.2.7 -> 3.3.0
Date: Tue,  9 Apr 2024 15:10:17 +0800
Message-Id: <1712646620-16608-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10--12.512300-10.000000
X-TMASE-MatchedRID: zKuKCvN3HS6jz0nOeth/yaoXHZz/dXlxBPY4SegK3jwM5zgCOsMCM3YW
	2eXId8+tjzqLvABc+8gD3tw1Ebxs2ALVKd9+Sfpr0e7jfBjhB8d70npWTCd4VqzOXxkfrIYvFOm
	bnOtUUG4DCvV3UwP6eFHSzMvA3ZEp2xtgxHwvK5/kKCFOKwAEzL5ac1UT3FiWIxtZrqz8/9g4W7
	mlECl6bNfW7rf8XgKrr1gZVzpnCNjYEhFHE+qJehvUzKo8be8xcV3n4J/0zUPuaxAtXRNprM6PJ
	gbJ1y/1Uc5aPLQotVDy68+zuCoyRxyfGYp07KWZRLmyB39u449MkOX0UoduuWAN6i+va16u0yOP
	Bv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2VUcz8XpiS9BtuGFXrmRpjNFcW7s87GgBjaJH
	srxZyzI8q8RDLteuCYASlu1An0J4DFgoHQs6fmlhRyidsElYk9avse85ISVp3de2OoBqgwoN7Uf
	wgkp7ukPI1/ZdqoS0mfSUvEokyljbG3Iwaob+3fOaYwP8dcX7F0kjYVlocoddfE/FsH7rVnptr8
	PnHpyni8zVgXoAltsIJ+4gwXrEtIAcCikR3vq+BWPz+QEJ9AG5aCZE1Y9cTxgQrpb0kqnserAHc
	MufhaYQJr09LSPsB
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198051

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-missing-prototypes-to-function-declarations.patch
makefile-no-rebuild.patch
refreshed for 3.3.0

Changelog:
==========
- Fixed a bug with '--sparse --inplace' where a trailing gap in the source
  file would not clear out the trailing data in the destination file.
- Fixed an buffer overflow in the checksum2 code if SHA1 is being used for
  the checksum2 algorithm.
- Fixed an issue when rsync is compiled using '_FORTIFY_SOURCE' so that the
  extra tests don't complain about a strlcpy() limit value (which was too
  large, even though it wasn't possible for the larger value to cause an
  overflow).
- Add a backtick to the list of characters that the filename quoting needs to
  escape using backslashes.
- Fixed a string-comparison issue in the internal handling of '--progress' (a
  locale such as tr_TR.utf-8 needed the internal triggering of '--info' options
  to use upper-case flag names to ensure that they match).
- Make sure that a local transfer marks the sender side as trusted.
- Change the argv handling to work with a newer popt library -- one that likes
  to free more data than it used to.
- Rsync now calls 'OpenSSL_add_all_algorithms()' when compiled against an older
  openssl library.
- Fixed a problem in the daemon auth for older protocols (29 and before) if the
  openssl library is being used to compute MD4 checksums.
- Fixed 'rsync -VV' on Cygwin -- it needed a flush of stdout.
- Fixed an old stats bug that counted devices as symlinks.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...issing-prototypes-to-function-declarations.patch | 13 ++++++-------
 .../rsync/files/makefile-no-rebuild.patch           |  7 +++----
 .../rsync/{rsync_3.2.7.bb => rsync_3.3.0.bb}        |  2 +-
 3 files changed, 10 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.2.7.bb => rsync_3.3.0.bb} (96%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 8895adad74..2379de84f2 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 651425fced0691d9063fe417388ba6ca1c38c40b Mon Sep 17 00:00:00 2001
+From 2beb35c34c45320144f37b12ef4d72fb8734280e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -15,7 +15,6 @@ Fixes errors like
 
 Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032858.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  checksum.c       | 2 +-
  exclude.c        | 2 +-
@@ -30,10 +29,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  10 files changed, 12 insertions(+), 13 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
-index 60de365..67a9e16 100644
+index cb21882..736818b 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
+@@ -779,7 +779,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
  }
  #endif
  
@@ -43,7 +42,7 @@ index 60de365..67a9e16 100644
  #if defined SUPPORT_XXH3 || defined USE_OPENSSL
  	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index ffe55b1..a85ea76 100644
+index 87edbcf..ae0de2f 100644
 --- a/exclude.c
 +++ b/exclude.c
 @@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
@@ -96,10 +95,10 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index d2a7b9b..c50af45 100644
+index 0c60b86..4bc664a 100644
 --- a/main.c
 +++ b/main.c
-@@ -244,7 +244,7 @@ void read_del_stats(int f)
+@@ -246,7 +246,7 @@ void read_del_stats(int f)
  	stats.deleted_files += stats.deleted_specials = read_varint(f);
  }
  
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 92ed1f4419..0c9ce8b8e3 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 81700d1a0e51391028c761cc8ef1cd660084d114 Mon Sep 17 00:00:00 2001
+From f446686c26c499e15ef17d495a93cfbc20e16090 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -8,16 +8,15 @@ generally overcomplicated, and we ensure that autoreconf is invoked if required.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  Makefile.in | 54 -----------------------------------------------------
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 3cde955..d963a70 100644
+index a1253e5..a084935 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -190,60 +190,6 @@ gensend: gen
+@@ -192,60 +192,6 @@ gensend: gen
  	fi
  	rsync -aic $(GENFILES) git-version.h $${SAMBA_HOST-samba.org}:/home/ftp/pub/rsync/generated-files/ || true
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.3.0.bb
similarity index 96%
rename from meta/recipes-devtools/rsync/rsync_3.2.7.bb
rename to meta/recipes-devtools/rsync/rsync_3.3.0.bb
index 130581a785..b42026331d 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.3.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
-SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
+SRC_URI[sha256sum] = "7399e9a6708c32d678a72a63219e96f23be0be2336e50fd1348498d07041df90"
 
 inherit autotools-brokensep
 
-- 
2.34.1


