Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58447C369AC
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:50:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.9328.1727246991269165170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hT5nkneA;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246998; x=1758782998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NQmulzUscWS7spBkUm7946J7ot65+i/NkMcojeXhro4=;
  b=hT5nkneAw1iGMWFGuEXRX9p8h03TRjuffcghaj6dfOSm8lFTOMMyBPeW
   TAkvlx2Vs7se0KsZEWirtKGLf1nSUX5l0Gn5gbT2PF5DiRbJmI8ks1GBA
   y+Ja/itYfbQpYfhjdUsqJdejM8BZnWSDudb6rGMuznS/m5XgSmjeyJYo2
   MOI88b/FvLjisuaa0cLoJDndCTLYRc8+Gx73Avyrqscsxt40ILUCQ7mNM
   Chb0skZB15Kvduf18gZ8D+ukwxPqV5l4Ul66z9/aAF0WSqUulRw76zuhS
   hdEEVHRXwKyPmLHusCpiWsscsnitxa9DfrcD9kh64JIVxD5mbi0pT6aMG
   Q==;
X-CSE-ConnectionGUID: qn8nKxcgSk+PjKDI0REFEg==
X-CSE-MsgGUID: DqdSrxo3RFu+v8WSfwdgYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="162724327"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="162724327"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:57 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 343CCC1615
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D9D00D8BC1
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A5C56B5C3
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1B9E71A01EC;
	Wed, 25 Sep 2024 14:49:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 42/47] strace: upgrade 6.10 -> 6.11
Date: Wed, 25 Sep 2024 14:49:15 +0800
Message-Id: <1727246960-20665-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--3.932100-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yTo39wOA02LhaZATGA5/BXi+f7ap9DJaDQLt
	Av8b4f0oODNmrpv+Kxw2EqJn2nY8hiNvqM5/miSs8t4fUUGeErRMkOX0UoduuWAN6i+va16uIUt
	KH5AJM9ki+t+0AiFaYrVnVnu9zwYN9c0SSBk6D848o3fwIs8rQQYAPqHoVmYRkuyxm/kBYPmjxY
	yRBa/qJcFwgTvxipFa9xS3mVzWUuDxMZjMz3w2b4ifUW+wH8GJ9PqF4eLO+WJRAku8QCqYzx1hO
	YpQ8ZDv+ZCxJmNcb0knFGadG8UmIMSbetXd9f0Jvz0iSr2ZiR1grdztsycWWku/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204941

From: Wang Mingyu <wangmy@fujitsu.com>

Makefile-ptest.patch
refreshed for 6.11

 Improvements
=============
  * Implemented decoding of uretprobe syscall.
  * Implemented decoding of WDIOC_GETSUPPORT and WDIOC_SETOPTIONS ioctl
    commands.
  * Enhanced decoding of unknown ioctl commands in non-abbreviated mode
    by printing the contents of the ioctl argument buffer in hexadecimal format.
  * Updated decoding of listmount, statmount, and statx syscalls.
  * Updated lists of ETHTOOL_*, IORING_*, IPPROTO_*, RWF_*, STATX_*, and V4L2_*
    constants.
  * Updated lists of ioctl commands from Linux 6.11.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/strace/strace/Makefile-ptest.patch    | 6 +++---
 .../strace/{strace_6.10.bb => strace_6.11.bb}               | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.10.bb => strace_6.11.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index b5c9d2e004..a78c86f6a1 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 3a10dcdd5d8def52fc096ed59e8d0f32ee0c2d42 Mon Sep 17 00:00:00 2001
+From 593bea35a044b55222a71737ca8455c2359817d1 Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 378146b..f2529a6 100644
+index e1254c3..149570d 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index 378146b..f2529a6 100644
  AM_CFLAGS = $(WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -901,3 +902,22 @@ BUILT_SOURCES = ksysent.h
+@@ -903,3 +904,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace_6.10.bb b/meta/recipes-devtools/strace/strace_6.11.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_6.10.bb
rename to meta/recipes-devtools/strace/strace_6.11.bb
index a534fccd4f..d98b5fdec9 100644
--- a/meta/recipes-devtools/strace/strace_6.10.bb
+++ b/meta/recipes-devtools/strace/strace_6.11.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "765ec71aa1de2fe37363c1e40c7b7669fc1d40c44bb5d38ba8e8cd82c4edcf07"
+SRC_URI[sha256sum] = "83262583a3529f02c3501aa8b8ac772b4cbc03dc934e98bab6e4883626e283a5"
 
 inherit autotools ptest
 
-- 
2.34.1


