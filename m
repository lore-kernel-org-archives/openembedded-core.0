Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97D1C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 02:45:59 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.79925.1684118752085950849
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 19:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: qiutt@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="116148714"
X-IronPort-AV: E=Sophos;i="5.99,275,1677510000"; 
   d="scan'208";a="116148714"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 11:45:49 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 24D83AB46A
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 11:45:47 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A5E4D219F
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 11:45:46 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.219.96])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E9098855D;
	Mon, 15 May 2023 11:45:45 +0900 (JST)
From: qiutt@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Qiu Tingting <qiutt@fujitsu.com>
Subject: [PATCH V3] e2fsprogs: Fix error SRCDIR when using usrmerge DISTRO_FEATURES
Date: Mon, 15 May 2023 10:45:41 +0800
Message-Id: <1684118741-3013-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27626.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27626.003
X-TMASE-Result: 10--3.895900-10.000000
X-TMASE-MatchedRID: 6SYb29c3rTQ5rof3b4z0VENF5tKVli5K3hng3KTHeTbWGFyc9XrxrY/r
	0a3KJIPl/d5ANSJgPmA5mlnsU0gcglpCIuRr0RxKOjf3A4DTYuEJlr1xKkE5ucC5DTEMxpeQfiq
	1gj2xET8RwT4s6Iq4i12WVzVdeoHbWqBRUQClrybjpxdo/JwVmxhH6ApagZfOmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ17n7gpf3o9UT6uZ12vQFnPvP3Iz+CWyibvlczs1OgMIT/bhwogWMb7YGVP
	5K9OZTAL+DTkNTrPjFnE7CAxRvXdhvp6pE6B6d4Y4KPNbWjr8RTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 02:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181221

From: Qiu Tingting <qiutt@fujitsu.com>

    When build e2fsprogs ptest with usrmerge DISTRO_FEATURES,
    in test_script and test_one scripts, value of SRCDIR has problem.
      SRCDIR=/usr/usr/lib/e2fsprogs/ptest/test

    ptest log
      # ptest-runner e2fsprogs
      START: ptest-runner
      2022-12-17T11:08
      BEGIN: /usr/lib/e2fsprogs/ptest
      ls: cannot access '/usr/usr/lib/e2fsprogs/ptest/test/[a-zA-Z]_*': No such file or directory
      ./test_script: line 54: /usr/usr/lib/e2fsprogs/ptest/test/test_post: No such file or directory
      DURATION: 0
      END: /usr/lib/e2fsprogs/ptest
      2022-12-17T11:08
      STOP: ptest-runner
      TOTAL: 1 FAIL: 0

    Reason
      In Makefile.in, SRCDIR is set by prefix and libdir.
        @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
        @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
      prefix=/usr
      libdir=/usr/lib (when usrmerge is set)

    solution
      Use PTEST_PATH to fix it.

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch | 4 ++--
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb   | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index c3e46ce65f..20839b7286 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -22,7 +22,7 @@ index 8c4d2048..e021af32 100644
  	@echo "HTREE=y" >> test_one
  	@echo "QUOTA=y" >> test_one
 -	@echo "SRCDIR=@srcdir@" >> test_one
-+	@echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
++	@echo "SRCDIR=@PTEST_PATH@/test" >> test_one
  	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
  	@echo "SIZEOF_TIME_T=@SIZEOF_TIME_T@" >> test_one
  	@echo "DD=@DD@" >>test_one
@@ -31,7 +31,7 @@ index 8c4d2048..e021af32 100644
  	@[ -f test_script ] && chmod u+w test_script || true
  	@echo "#!/bin/sh" > test_script
 -	@echo "SRCDIR=@srcdir@" >> test_script
-+	@echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
++	@echo "SRCDIR=@PTEST_PATH@/test" >> test_script
  	@cat $(srcdir)/test_script.in >> test_script
  	@chmod +x-w test_script
  
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index 403995e9cf..761b6c1198 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -132,6 +132,7 @@ do_install_ptest() {
 	sed -e 's!../e2fsck/e2fsck!e2fsck!g' \
 	    -e 's!../misc/tune2fs!tune2fs!g' -i ${D}${PTEST_PATH}/test/*/expect*
 	sed -e 's!../e2fsck/e2fsck!${base_sbindir}/e2fsck!g' -i ${D}${PTEST_PATH}/test/*/script
+	sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/test/test_script ${D}${PTEST_PATH}/test/test_one
 
 	# Remove various files
 	find "${D}${PTEST_PATH}" -type f \
-- 
2.25.1


