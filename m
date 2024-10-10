Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F71CF07C2
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:17:48 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.38489.1728548259716692066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bMyPOjwe;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728548259; x=1760084259;
  h=from:to:cc:subject:date:message-id;
  bh=jwdecA6wpM3aes+Tet7HHEpK26VtGv/KdlwZR/QkylI=;
  b=bMyPOjweGKj/FNGLTNdWg+s988sHa0d4vBUEwRaHWf8NnMIViBB2rQpD
   oPc/SIb6b9tljfpPMQPIkBFpBmrsU/qpXhesL0o3KvbsJwwjYjDamb1vw
   aPEjqwwAoaaylqIexJFig+3uRhDfcXZLm+Zqe7S587JbAoo4+iooEZgbZ
   yrUVHk7ZReuLEbBqqbpIJ3uku77mEyifnt6nH+UsT4dqLzWJ2cloWUCcq
   Uwl1v/wK5fQCbPxvMuB32mAE4IigVHjdyDkFdpyZe2qgMxYNaF6SPTXP6
   mZZZ3/mL3FICkjLRb/epPoL/tsWvXILBiIJ6yqsJ5X+E4zXQeZ8SRUEN7
   Q==;
X-CSE-ConnectionGUID: 0bW48nXNTbau4ja9awm4QA==
X-CSE-MsgGUID: SoKMRozrQC+pDzWSqOpAWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="164738270"
X-IronPort-AV: E=Sophos;i="6.11,192,1725289200"; 
   d="scan'208";a="164738270"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 17:17:36 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F07CC68E1
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 17:17:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DE84CFA54
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 17:17:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 786972008133C
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 17:17:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 27D651A000A;
	Thu, 10 Oct 2024 16:17:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] bash: upgrade 5.2.32 -> 5.2.37
Date: Thu, 10 Oct 2024 16:17:20 +0800
Message-Id: <1728548240-14155-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28720.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28720.005
X-TMASE-Result: 10--8.870700-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/ySrLqyE6Ur/jkdS3kPlaZyXkABvhO7aBvqTz
	q4wH3yI2/JaizffSpx5UUUB6BpF8mHPiuwgO3EgWNT0Qrj4fxTUqs+sOb/Dxc6NjwRd0FR0fzvS
	B/1+4feRqDQa4ADEUYcxZ1Y4KxKyCsEBAuoaUqK+5x7uAXGEprZcE9F6aLBE1vn+2qfQyWg3u/Q
	yUVIt+aaIkYkaiW44WAV3bWT1nydov+0FNnM7lDRmCYUYerLHrGB9/bxS68hNOr6J7c899m1iqA
	yk7LkbkLx62MRsVbpBv1GTKKZRUl84svDGUw7k9lXePXNM4FjMEa8g1x8eqFyDTDy9SYCLLqXAF
	sS+trPLi8zVgXoAltsIJ+4gwXrEtIAcCikR3vq9vi5tpUnFXMDnI0o2RAwROKb4sopHuflGb20u
	gqmzHdbBJkwT4M6ve
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 08:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205388

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fix-c99.patch
removed since it's included in  5.2.37

Changelog:
===========
- fix issue where comparing quoted and unquoted words to be completed results
  in readline not displaying possible matches
- fix for reading partial invalid multibyte characters
- fix compilation on systems that provide select or pselect but not both
- fix for parsing compound assignment while expanding alias
- fix autoconf test for broken strtold

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bash/bash/0001-fix-c99.patch              | 41 -------------------
 .../bash/{bash_5.2.32.bb => bash_5.2.37.bb}   |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/0001-fix-c99.patch
 rename meta/recipes-extended/bash/{bash_5.2.32.bb => bash_5.2.37.bb} (87%)

diff --git a/meta/recipes-extended/bash/bash/0001-fix-c99.patch b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
deleted file mode 100644
index abd83d09af..0000000000
--- a/meta/recipes-extended/bash/bash/0001-fix-c99.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From e8ec2d75a52bdc93c83a679a71a68f4033033b8b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 19 Jun 2024 12:57:39 +0000
-Subject: [PATCH] Fix C99 problems
-
-Backport some fixes from upstream to fix configure checks that fail with GCC 14.1.
-
-Upstream-Status: Backport [devel branch]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- aclocal.m4   | 3 +++
- configure.ac | 2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index cc97bd4..7423b99 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -238,6 +238,9 @@ AC_CACHE_VAL(bash_cv_dup2_broken,
- #include <sys/types.h>
- #include <fcntl.h>
- #include <stdlib.h>
-+#ifdef HAVE_UNISTD_H
-+# include <unistd.h>
-+#endif /* HAVE_UNISTD_H */
- int
- main()
- {
-diff --git a/configure.ac b/configure.ac
-index a3b5bd7..2a38c6b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -842,7 +842,7 @@ AC_CHECK_DECLS([strtold], [
- 	[AC_COMPILE_IFELSE(
- 		[AC_LANG_PROGRAM(
- 		[[#include <stdlib.h>]],
--		[[long double r; char *foo, bar; r = strtold(foo, &bar);]]
-+		[[long double r; char *foo, *bar; r = strtold(foo, &bar);]]
- 	)],
- 	[bash_cv_strtold_broken=no],[bash_cv_strtold_broken=yes])
-         ]
diff --git a/meta/recipes-extended/bash/bash_5.2.32.bb b/meta/recipes-extended/bash/bash_5.2.37.bb
similarity index 87%
rename from meta/recipes-extended/bash/bash_5.2.32.bb
rename to meta/recipes-extended/bash/bash_5.2.37.bb
index b159c0232f..3dcaefa374 100644
--- a/meta/recipes-extended/bash/bash_5.2.32.bb
+++ b/meta/recipes-extended/bash/bash_5.2.37.bb
@@ -14,10 +14,9 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://use_aclocal.patch \
            file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch \
            file://fix-filesubst-errexit.patch \
-           file://0001-fix-c99.patch \
            "
 
-SRC_URI[tarball.sha256sum] = "d3ef80d2b67d8cbbe4d3265c63a72c46f9b278ead6e0e06d61801b58f23f50b5"
+SRC_URI[tarball.sha256sum] = "9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff"
 
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.34.1


