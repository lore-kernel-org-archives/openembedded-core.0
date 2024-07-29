Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E925C52D6F
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:42 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.46596.1722215431402451463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bDVOFFzz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215433; x=1753751433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SMB7yd8TKN8fMDupsYEAb9CaBB4bJeCrtaGwY+bTR0I=;
  b=bDVOFFzzU+RHexaduK4hk7q2LMfECioZ0yHMcYAcFYuxU3w99evNM4kh
   sdpS/Dzwz+UyiSapaR7s/duOsoETZhL89rj/ylcpXufmolLy7UQL+rkHi
   +hwJPQ49Bo6LsmAjmGsZTS+Yu5i7LIOBnFKJ7J4zJbmdv6zGFEiSgDQdU
   cxuXQNALEXjBdG6Am/iMuoeSRTNSB9u2cX3vBy834qasyBEKdf1yR2RSq
   ES6ngbnZ68v6iuZm5NYEJMUIsX5OC5MopsnSg1U0Y2ECI0IVfl8sGm0SM
   N/ApQbdrgeRtmmgG5mnMuFcjTAn3SAbZAzNwIanjEgfdhfCN4u5wefRcn
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="157163434"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="157163434"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 54026D9235
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E5C6D530D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 242BC82D52
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AF5FB1A0002;
	Mon, 29 Jul 2024 09:10:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/33] strace: upgrade 6.9 -> 6.10
Date: Mon, 29 Jul 2024 09:10:00 +0800
Message-Id: <1722215408-27541-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10-3.427300-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yTo39wOA02LhpxAd6mi1Ga30CSRcYO6eKu2s
	HfQsE+O7ztOnooW0PElBM0x5UVJPjZNeSFI51cWD7pujb8urdzZgg7HO8z2tNqvWBS71/UX/81j
	IEFowuiMILxoCYZ47qUtOa+Yevc9iiCsqewnUZGA/QdUh6LEl0ME5XPQnBzGXvpLsd+70hTFmeC
	LE2iu14If0Rs99MC8g7icOXRyDqarQODanTO2mNJ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyKsQd
	9qPXhnJgSxTfFx0SzRMdnOg50xz9/Wl7IfKye99LTHHBgqGZYekDPIZX4ww9rzkuy85Eku7vnma
	HV9lxhZFjT+6Bkh/tM9/BV3JGLC8ikUH4ZGV5bXyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202602

From: Wang Mingyu <wangmy@fujitsu.com>

Makefile-ptest.patch
refreshed for 6.10

Changelog:
===========
* Improvements
  * Implemented --decode-fds=eventfd option to retrieve eventfd object details
    associated with eventfd file descriptors.
  * Implemented decoding of NETLINK_GENERIC nlctrl protocol.
  * Implemented decoding of F_DUPFD_QUERY fcntl.
  * Implemented decoding of mseal syscall.
  * Updated decoding of statx and prctl syscalls.
  * Updated decoding of BPF_RAW_TRACEPOINT_OPEN bpf command.
  * Updated lists of BPF_*, IORING_*, KEXEC_*, KEY_*, LANDLOCK_*, PR_*, STATX_*,
    TCP_*, TEE_*, V4L2_*, and *_MAGIC constants.
  * Updated lists of ioctl commands from Linux 6.10.

* Bug fixes
  * Worked around a bug introduced in Linux 6.5 that affected system call
    tampering on riscv64.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/strace/strace/Makefile-ptest.patch    | 6 +++---
 .../strace/{strace_6.9.bb => strace_6.10.bb}                | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.9.bb => strace_6.10.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 3e50bf40f0..b5c9d2e004 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 245f6322cf64e562d3227dfac26ce93c905b0380 Mon Sep 17 00:00:00 2001
+From 3a10dcdd5d8def52fc096ed59e8d0f32ee0c2d42 Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index ef68898..735b73d 100644
+index 378146b..f2529a6 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index ef68898..735b73d 100644
  AM_CFLAGS = $(WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -889,3 +890,22 @@ BUILT_SOURCES = ksysent.h
+@@ -901,3 +902,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace_6.9.bb b/meta/recipes-devtools/strace/strace_6.10.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_6.9.bb
rename to meta/recipes-devtools/strace/strace_6.10.bb
index bb9f8e42ba..a534fccd4f 100644
--- a/meta/recipes-devtools/strace/strace_6.9.bb
+++ b/meta/recipes-devtools/strace/strace_6.10.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "da189e990a82e3ca3a5a4631012f7ecfd489dab459854d82d8caf6a865c1356a"
+SRC_URI[sha256sum] = "765ec71aa1de2fe37363c1e40c7b7669fc1d40c44bb5d38ba8e8cd82c4edcf07"
 
 inherit autotools ptest
 
-- 
2.34.1


