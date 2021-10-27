Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB19C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 14:10:13 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.web11.12141.1635343812535535827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 07:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=JX4Hh8k6;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5109; q=dns/txt; s=iport;
  t=1635343812; x=1636553412;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LnUpR+g0CLSltp+c4wWnPs7L5pftnJKcGuxfzOnIakw=;
  b=JX4Hh8k6oEeW+4la+MRmAC8JRL6nMkyFcXbIAo3kf8qZRSlCLCsE9pw2
   mR4qBOd0x7nTiGzAmpiUeqejaEM3eucAJ0P+xPehXcNLaIA80PUmBM17S
   jXqqTBCZwERb0sZivvSguq4qBSQogzrRmAA3WwRIKmG33vcJ3RCbbDPff
   M=;
X-IronPort-AV: E=Sophos;i="5.87,186,1631577600";
   d="scan'208";a="928937920"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 27 Oct 2021 14:10:10 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com
 [171.68.208.186])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 19REA863017620
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 27 Oct 2021 14:10:09 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id E1646CC2ED1; Wed, 27 Oct 2021 07:10:07 -0700 (PDT)
From: Oleksiy Obitotskyy <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] gcc: Improve reproducibility
Date: Wed, 27 Oct 2021 07:09:54 -0700
Message-Id: <20211027140954.76185-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 14:10:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157514

Checksum depends on options that could be
different from build to build, e.g. absolute patch.
Remove checksum-options from
executable checksum calculation.

Change-Id: Ifa184febecd2d517826beee784ca5ac7a1fb17fe
Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 +
 ...emove-checksum-options-from-checksum.patch | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0050-gcc-Remove-checksum-options-from-checksum.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index 23dfea2319..ecac893980 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -64,6 +64,7 @@ SRC_URI = "\
            file://0036-mingw32-Enable-operation_not_supported.patch \
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch \
+           file://0050-gcc-Remove-checksum-options-from-checksum.patch \
 "
 SRC_URI[sha256sum] = "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0050-gcc-Remove-checksum-options-from-checksum.patch b/meta/recipes-devtools/gcc/gcc/0050-gcc-Remove-checksum-options-from-checksum.patch
new file mode 100644
index 0000000000..50cff38c68
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0050-gcc-Remove-checksum-options-from-checksum.patch
@@ -0,0 +1,77 @@
+From 67402bb4013ea886b68a9f4ee1c2cb1472652dbf Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Tue, 26 Jan 2021 04:32:27 -0800
+Subject: [PATCH] gcc: Remove checksum-options from checksum
+
+Executable checksum calculated from object
+files and options. Options could contain
+absolute path and affect reproducibility.
+To improve reproducibility remove
+checksum-options conditionally from
+executable checksum generation.
+
+Upstream-Status: Pending
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ gcc/c/Make-lang.in     | 2 +-
+ gcc/cp/Make-lang.in    | 2 +-
+ gcc/objc/Make-lang.in  | 3 ++-
+ gcc/objcp/Make-lang.in | 2 +-
+ 4 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/gcc/c/Make-lang.in b/gcc/c/Make-lang.in
+index a1cdee872..6ee5c103b 100644
+--- a/gcc/c/Make-lang.in
++++ b/gcc/c/Make-lang.in
+@@ -78,7 +78,7 @@ cc1-checksum.c : build/genchecksum$(build_exeext) checksum-options \
+ 	  cp ../prev-gcc/cc1-checksum.c cc1-checksum.c; \
+ 	else \
+ 	  build/genchecksum$(build_exeext) $(C_OBJS) $(BACKEND) $(LIBDEPS) \
+-                     checksum-options > cc1-checksum.c.tmp && 		 \
++                     $(if $(SOURCE_DATE_EPOCH),,checksum-options) > cc1-checksum.c.tmp && 		 \
+ 	  $(srcdir)/../move-if-change cc1-checksum.c.tmp cc1-checksum.c; \
+ 	fi
+ 
+diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
+index 155be74ef..0ac6daa53 100644
+--- a/gcc/cp/Make-lang.in
++++ b/gcc/cp/Make-lang.in
+@@ -127,7 +127,7 @@ cc1plus-checksum.c : build/genchecksum$(build_exeext) checksum-options \
+ 	   cp ../prev-gcc/cc1plus-checksum.c cc1plus-checksum.c; \
+ 	else \
+ 	  build/genchecksum$(build_exeext) $(CXX_OBJS) $(BACKEND) $(CODYLIB) $(LIBDEPS) \
+-                     checksum-options > cc1plus-checksum.c.tmp &&	   \
++                     $(if $(SOURCE_DATE_EPOCH),,checksum-options) > cc1plus-checksum.c.tmp &&	   \
+ 	  $(srcdir)/../move-if-change cc1plus-checksum.c.tmp cc1plus-checksum.c; \
+ 	fi
+ 
+diff --git a/gcc/objc/Make-lang.in b/gcc/objc/Make-lang.in
+index c91148a57..a83938ee7 100644
+--- a/gcc/objc/Make-lang.in
++++ b/gcc/objc/Make-lang.in
+@@ -60,7 +60,8 @@ objc_OBJS = $(OBJC_OBJS) cc1obj-checksum.o
+ cc1obj-checksum.c : build/genchecksum$(build_exeext) checksum-options \
+         $(OBJC_OBJS) $(C_AND_OBJC_OBJS) $(BACKEND) $(LIBDEPS)
+ 	build/genchecksum$(build_exeext) $(OBJC_OBJS) $(C_AND_OBJC_OBJS) \
+-        $(BACKEND) $(LIBDEPS) checksum-options > cc1obj-checksum.c.tmp && \
++        $(BACKEND) $(LIBDEPS) \
++		$(if $(SOURCE_DATE_EPOCH),,checksum-options) > cc1obj-checksum.c.tmp && \
+ 	$(srcdir)/../move-if-change cc1obj-checksum.c.tmp cc1obj-checksum.c
+ 
+ cc1obj$(exeext): $(OBJC_OBJS) $(C_AND_OBJC_OBJS) cc1obj-checksum.o $(BACKEND) \
+diff --git a/gcc/objcp/Make-lang.in b/gcc/objcp/Make-lang.in
+index dfa4d230e..ef16001c2 100644
+--- a/gcc/objcp/Make-lang.in
++++ b/gcc/objcp/Make-lang.in
+@@ -63,7 +63,7 @@ obj-c++_OBJS = $(OBJCXX_OBJS) cc1objplus-checksum.o
+ cc1objplus-checksum.c : build/genchecksum$(build_exeext) checksum-options \
+ 	$(OBJCXX_OBJS) $(BACKEND) $(CODYLIB) $(LIBDEPS)
+ 	build/genchecksum$(build_exeext) $(OBJCXX_OBJS) $(BACKEND) $(CODYLIB) \
+-		$(LIBDEPS) checksum-options > cc1objplus-checksum.c.tmp && \
++		$(LIBDEPS) $(if $(SOURCE_DATE_EPOCH),,checksum-options) > cc1objplus-checksum.c.tmp && \
+ 	$(srcdir)/../move-if-change cc1objplus-checksum.c.tmp \
+ 	cc1objplus-checksum.c
+ 
+-- 
+2.25.1
+
-- 
2.26.2.Cisco


