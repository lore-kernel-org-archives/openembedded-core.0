Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C0AC021B2
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.14685.1739864491632196876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gHzxyhls;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864493; x=1771400493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RS05TV/p1jKJ/L9zvYa4xkVuja80X8ubPA0tOyUUHD8=;
  b=gHzxyhls0tjs+BWsZznjIatanfIDBY/1uXBcm3ydiowQg3F5sWIePeSm
   I6516LXVlpJOReRPO3kVJnIFdZ2/HIP5TMMstcHn6ZfXahHUkUi6HRixp
   FrFCRfvNiov+Vx5VTGZw7ZcshH0cZYs3mcHgq1qzBLYxtEpwhuUlu7hHv
   ZwyK/IZ7uCPV85ZRZ2L8Wv91CZHJ4wlrSDp0Ilftuf9Qnd+dh1dCZ6Dy4
   GZQzLaXJ0ao8/9TN9LRYNKPI4I7EY3TpSIpFEOK7vUz9bvktIS/KNr0gf
   PHFXgUg3m4l/GOpAKNo/nz0OiZr2z+3PTaOZ3Kh/PFbMtjGGn0StQqGPL
   w==;
X-CSE-ConnectionGUID: LfZd+XsIRtSBlognbTOFDg==
X-CSE-MsgGUID: YqW+LyV3TLutztRsa9h1sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="192947499"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="192947499"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:32 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B7C8ED4C33
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 81CB7D8AC3
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2784C1A006C;
	Tue, 18 Feb 2025 15:41:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/32] strace: upgrade 6.12 -> 6.13
Date: Tue, 18 Feb 2025 15:39:29 +0800
Message-Id: <1739864375-21394-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211589

From: Wang Mingyu <wangmy@fujitsu.com>

Makefile-ptest.patch
refreshed for 6.13

Improvements
===========
- Implemented decoding of getxattrat, setxattrat, listxattrat,
  and removexattrat syscalls.
- Updated decoding of struct io_uring_clone_buffers, struct io_uring_napi,
  and struct perf_event_attr.
- Updated decoding of crypto_user_alg netlink attributes of NETLINK_CRYPTO.
- Implemented decoding of IFLA_MCTP_PHYS_BINDING netlink attribute.
- Updated lists of AT_*, BPF_*, FAN_*, IORING_*, MADV_*, NT_*, and SCM_*
  constants.
- Updated lists of ioctl commands from Linux 6.13.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/strace/strace/Makefile-ptest.patch | 9 ++++++---
 .../strace/{strace_6.12.bb => strace_6.13.bb}            | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.12.bb => strace_6.13.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index a78c86f6a1..4ae9a018ce 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index e1254c3..149570d 100644
+index 0462563..abbf910 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -21,10 +21,10 @@ index e1254c3..149570d 100644
  MPERS_CC_FLAGS =
  ARCH_MFLAGS =
 +TEST_SUITE_LOG = test-suite.log
- AM_CFLAGS = $(WARN_CFLAGS)
+ AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -903,3 +904,22 @@ BUILT_SOURCES = ksysent.h
+@@ -916,3 +917,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
@@ -47,3 +47,6 @@ index e1254c3..149570d 100644
 +		#sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
 +	done
 +	for i in net scm_rights-fd rt_sigaction; do sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/$$i.test; done
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/strace/strace_6.12.bb b/meta/recipes-devtools/strace/strace_6.13.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_6.12.bb
rename to meta/recipes-devtools/strace/strace_6.13.bb
index c16e5dc478..9ef9f5e53c 100644
--- a/meta/recipes-devtools/strace/strace_6.12.bb
+++ b/meta/recipes-devtools/strace/strace_6.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://strace.io"
 DESCRIPTION = "strace is a diagnostic, debugging and instructional userspace utility for Linux. It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
 SECTION = "console/utils"
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2433d82e1432a76dc3eadd9002bfe304"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1efaf30bb0084b4a17a6f55f9cbcd25b"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "c47da93be45b6055f4dc741d7f20efaf50ca10160a5b100c109b294fd9c0bdfe"
+SRC_URI[sha256sum] = "e209daf0ee038ca5adcc4c277e9273b4d51f46a2ff86da575d36742ac3508a17"
 
 
 inherit autotools github-releases ptest
-- 
2.43.0


