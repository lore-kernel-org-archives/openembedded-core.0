Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF9ECD12AA
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:58 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.130215.1712646645644326436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P2vCdkZf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646649; x=1744182649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fy6poAIHKMoxoG/C8+Loz3OgtJ2ZTJ9ddKzJKDGos7M=;
  b=P2vCdkZfX0hUICYuN87nBEgcgqgUhlXv8F+Hn4BKVg6lNzc+3tNtSGzS
   4oQ4+rI25H3wDe6+ddF9PgqNtH//OBkzveTAJiphJUz91IZ1jIO1xWQr8
   k/rm3NtrfYf6emhOltokIN4Lg38aTE6g06fKeJtADsFx6Z5w7zgG0egUQ
   +Em+ySUcDu18pVnY41UH6T6tThV/JkX8C/SlGYB0rFYRj9iLCwrO4vPOL
   gqnRAjyUMQRy+KJJKZOzugm9nJXYsIjQG4WR5IgKKWRGDedNyAviC+Dg5
   jrEqXlyzyKjtRwUfwIafmALJ4IPEx946HwYE8v+iKgrH8gO3vEKYctptA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="155056937"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="155056937"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:47 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EBABDCC06
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 76C11BF4A6
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05BF34018B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A7E7D1A0002;
	Tue,  9 Apr 2024 15:10:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/33] lttng-tools: upgrade 2.13.11 -> 2.13.13
Date: Tue,  9 Apr 2024 15:10:06 +0800
Message-Id: <1712646620-16608-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10--9.030400-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yTyjd/AizytBnJdsOLB4zv79wRnyxuPjhCia
	SqRpkfBtPPdH6svZbb5QGOBjvytWYXhh1unvIp4BzYK5U+QI3O5jSvU3z22dDm8ksUxxlDnvhQ6
	YZNvnIb/Yd95zD4odNQhxcXHUujyc7+LTSdR9zjAOeRRGICV9PcacjO2mQqFCTnndBHst2DksV8
	HfUtlxoSqq0O5S3DJ8ivFp0d/OglZtF6/n498MP/LeH1FBnhK0wTlc9CcHMZe+kux37vSFMdlMA
	SzPGs9UGKzdPfxyPd80Lv+3/90GPxq8pfC4+dHe3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTdwN+
	iYWeLTWOhzOa6g8KrWprDldSEf4GFmsdvOla8L+1uldLB0TcyDd9IaT5Jkxq5zAy/ZEzOX0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198036

From: Wang Mingyu <wangmy@fujitsu.com>

0001-tests-do-not-strip-a-helper-library.patch
refreshed for 2.13.13

Changelog:
===========
* Fix: consumerd: leak of tracing buffers on relayd connectivity issue
* Fix: consumerd: wrong timer mentioned in error logging
* Fix: consumerd: type confusion in lttng_consumer_send_error
* Fix: baddr-statedump: use $(LIBTOOL) --mode=execute
* Fix: relayd: live client not notified of inactive streams
* Fix: relayd: live: dispose of zombie viewer metadata stream
* tests: Fix typo in tests/regression/kernel/test_ns_contexts
* Fix: sessiond: freeze on channel creation on restart
* common: move utils_create_lock_file to its own file
* tests: tools/clear/test_ust wait for specific test app pid
* Fix: sessiond: crash when sending data_pending to an active session
* Tests: fix: list_triggers_cli: kallsyms contains prefixed symbols
* License: common: error_query: fix typo in SPDX specifier

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-tests-do-not-strip-a-helper-library.patch       | 9 +++------
 .../{lttng-tools_2.13.11.bb => lttng-tools_2.13.13.bb}   | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.11.bb => lttng-tools_2.13.13.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
index 2d08b08879..2f95889c4b 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
@@ -1,4 +1,4 @@
-From ab238c213fac190972f55e73cf3e0bb1c7846eb8 Mon Sep 17 00:00:00 2001
+From 2237748af00467ad8250a7ccd944200f811db69a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 12 Dec 2019 16:52:07 +0100
 Subject: [PATCH] tests: do not strip a helper library
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am b/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-index 03f5d5a..d12c343 100644
+index 836f13e..e19a554 100644
 --- a/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
 +++ b/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-@@ -12,7 +12,7 @@ userspace_probe_elf_binary_LDADD = libfoo.la
+@@ -14,7 +14,7 @@ userspace_probe_elf_binary_LDADD = libfoo.la
  libfoo.strip: libfoo.la
  	$(OBJCOPY) --strip-all .libs/libfoo.so
  
@@ -22,6 +22,3 @@ index 03f5d5a..d12c343 100644
  	@if [ x"$(srcdir)" != x"$(builddir)" ]; then \
  		for script in $(EXTRA_DIST); do \
  			cp -f $(srcdir)/$$script $(builddir); \
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
index f6abd9e11a..174dec036e 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
@@ -41,7 +41,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch \
            "
 
-SRC_URI[sha256sum] = "ac5baeef9fa690936b1ca01ecd1742da762c2c08511ff1b4e923938d94d0f979"
+SRC_URI[sha256sum] = "ff5f4f00b081dac66092afe8e72b7c790670931cf1c1ee0deaa7f80fbc53883e"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.34.1


