Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AF6E6781F
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:36 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.82430.1731403532974144968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sRUYdZs5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403533; x=1762939533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IXSdfLL9bU2FiOMqcDSyrZNsNjG8Qgx3246bzEvCD+c=;
  b=sRUYdZs5ZGZlhFGNYyA0r9B1AgFcZiENTXfcesw/fD5nQ2UXy1YNJqAh
   A7IyM+PowlqZBtPGh0pSdPwnek1SSFkrTMR5Ozx+PH25/Mm2xX195V8Hy
   c9EU3988wtz5oCwKHQ4SVS+QxztWMuZsr9XZDnTmm0J3CmQzLUzwiHuLq
   miFva54Vj9XaQnwD7TEA4cFjCPW9iOGBQS1IEMoSwiststdqSyukbfVlF
   cxiGYOduao755Fiif7gyRyWSKdsq4cxiKMMfrfmslaj0H6LmUSXxL4laP
   RpHpaTcI7aLMOIAKhBRxnq14h7vi+PbxWI/8/dF6Jfzr8sr7MwoPaOJQI
   Q==;
X-CSE-ConnectionGUID: sDAMWglYT4SYT18Cl6Ch6Q==
X-CSE-MsgGUID: pFTitQHiRb6satjGjfBunQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180063507"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180063507"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:30 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 87C9DD5013
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CA2A28CD9
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FAAF6BCC2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4A7EC1A000A;
	Tue, 12 Nov 2024 17:25:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/47] makedumpfile: upgrade 1.7.5 -> 1.7.6
Date: Tue, 12 Nov 2024 17:24:19 +0800
Message-Id: <1731403483-21399-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--8.955200-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yTo39wOA02LhpxAd6mi1Ga1s1Ir4NZzFmp48
	Ei0i5B6XmBj79ZvGQLZhWgNOVfhPTClxl1r+6BqIOWUWxTQJdI9peZ1cXZibxynNUH+OhiT8/PF
	+DohmUWVBmK9VhdJgAdI76d96IIOV1OA1SJ4kORED2WXLXdz+ARCE2NlBjIjcB/FMznsE8cPu/Q
	yUVIt+aZvS9vErooP4sVIiTDDC9Psv+0FNnM7lDZVRzPxemJL0wJjn8yqLU6JLWMri+QqmsaVgb
	rw0BQUqdkyho0WkAXjeP3Av0149SVE/ARLVFdXangIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiAq
	rjYtFiRaXzmLBhpuQz53TybNiDYsTL11aJHjEsiGlFi1B2/Qdn7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207010

From: Wang Mingyu <wangmy@fujitsu.com>

0001-makedumpfile-replace-hardcode-CFLAGS.patch
refreshed for 1.7.6

Changelog:
============
- Fix incorrect page exclusion in exclude_nodata_pages()
- s390x: Assume zero value of OS_INFO pointer is valid
- Submit physical address to is_phys_addr()
- sadump_info: Return empty string instead of NULL
- Add ftruncate error handling
- Fix failure of free pages exclusion with -x option on Linux 6.10
- fix comment: Mention current logic for vmalloc_start
- make reserve_diskspace do nothing for flattened format
- Workaround for segfault by "makedumpfile --mem-usage" on PPC64
- Fix wrong exclusion of Slab pages on Linux 6.10-rc1 and later
- Fix failure of hugetlb pages exclusion on Linux 6.9 and later
- Makefile: Make sbin directory configurable
- Update maintainers
- ppc64: get vmalloc start address from vmcoreinfo
- ppc64: read cur_mmu_type from vmcoreinfo
- add PRINTK_CALLER id support to --dump-dmesg option
- s390x: uncouple virtual and physical address spaces
- s390x: fix virtual vs physical address confusion

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-makedumpfile-replace-hardcode-CFLAGS.patch       | 8 ++++----
 .../{makedumpfile_1.7.5.bb => makedumpfile_1.7.6.bb}      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-kernel/makedumpfile/{makedumpfile_1.7.5.bb => makedumpfile_1.7.6.bb} (97%)

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index 96a996f616..796e036ab8 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -1,4 +1,4 @@
-From 6d16911316cb576db0239f607e60918a222e4436 Mon Sep 17 00:00:00 2001
+From 59b8d59504c1bafff52a8794e67c6025fcd418a4 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Sun, 24 Apr 2022 17:25:33 +0800
 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
@@ -24,7 +24,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 21 insertions(+), 19 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 71d8548..22acdd5 100644
+index aa73252..76fcafd 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
@@ -111,7 +111,7 @@ index 71d8548..22acdd5 100644
  endif
  
  ifeq ($(DEBUG), on)
-@@ -104,14 +106,14 @@ LIBS := $(LIBS) $(call try-run,\
+@@ -106,14 +108,14 @@ SBINDIR ?= /usr/sbin
  all: makedumpfile
  
  $(OBJ_PART): $(SRC_PART)
@@ -128,7 +128,7 @@ index 71d8548..22acdd5 100644
  	@sed -e "s/@DATE@/$(DATE)/" \
  	     -e "s/@VERSION@/$(VERSION)/" \
  	     $(VPATH)makedumpfile.8.in > $(VPATH)makedumpfile.8
-@@ -120,7 +122,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
+@@ -122,7 +124,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
  	     $(VPATH)makedumpfile.conf.5.in > $(VPATH)makedumpfile.conf.5
  
  eppic_makedumpfile.so: extension_eppic.c
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
similarity index 97%
rename from meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
rename to meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
index 85b44c4941..21847ece6b 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "c266469347d49287be38059d45e7aaa454db9cb2"
+SRCREV = "97a89484e2c960dd64933e1cea7a7248138f8a76"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
-- 
2.34.1


