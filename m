Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970CAC54E51
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8397.1709105616748395131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MWMmtZsN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105616; x=1740641616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=omTkEuRFT06QOr9jkL+76TBKSXJMxXzpL9HTguHI698=;
  b=MWMmtZsNNUsJl2UdfiOD37kojBA03m3u7Q1PLOeftIDZfj23ri82oxtA
   Wyu5dbt8Xv8+A/wA3ySVJ0LVZdx039cZzJTDMtttC9XVEJwE73X8ilpWp
   a3HxNIEwIy8VUzhWGwSVuZg/omh3dIx53lCacWO4et8BeRyaqJup77KMw
   4Q/JXo/ff9XcUpFSW0kN30gCbhqW3E8OJxXk6r04nLMrYA7GHkQfhE2j6
   i66tY7v2jdeTNo5FY/lh2Eu2fiPiUkQfKPizBzOU4g5UsxIVNOCGOCDPp
   j1ve7ejzEhSMkrOc2h2U/cQX1xQ0UJEwwwQuIotl8TyxZCXi0gMhPHshm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150649113"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150649113"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 41686F1009
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 37329D5CC3
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CF20841180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7E2421A006A;
	Wed, 28 Feb 2024 15:33:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/48] pciutils: upgrade 3.10.0 -> 3.11.1
Date: Wed, 28 Feb 2024 15:32:35 +0800
Message-Id: <1709105575-24259-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--10.876100-10.000000
X-TMASE-MatchedRID: OIStEy/X03Cjz0nOeth/yTo39wOA02LhpxAd6mi1Ga0torPLNYrwZOAf
	SNitoKTvGJHAl8RgcXDIkos5GQ8jESupJvqHf1A8XrBIbmgBxjwJlr1xKkE5uShbZduLiFfbe5m
	4UIHEoaQPX5W/q1wnI3noNL1kQBv22FMcgddyBa+HZXNSWjgdU1qv7J128aQgwvQ8Ryq55PImKu
	/op4VkP5dJWhONChAXo6y0QccJ2UvOkUilvGnufe+JTqKfC3nftOtXYgbXjdePaLJ/Ca3ST3ngd
	HUORlYLeQZhR9bz21Er2rJaE5mw7wC/7jpOTiX0a87CDXaKRVIF1iW/P2dTv+oVFCysx0YEWLmv
	5Mq0iyv8lvoTqOEEUMYoh/qEF/tV0YRMm/X9bI4/QdUh6LEl0ME5XPQnBzGXvpLsd+70hTHyrOv
	TiujE7Lg0x0HRb2Lc8/sx4T8ROp8HVDs/kNmNdW9OepgphdNGVeAZ5VSHdZ2bKItl61J/yZ+inT
	K0bC9eKrauXd3MZDWCQhop20yfUHBaxA4xKx6XKnCLKf7FuCXO2GzyaP6w6DpG8frHSkZN
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196355

From: Wang Mingyu <wangmy@fujitsu.com>

configure.patch
refreshed for 3.11.1

Changelog:
===========
* Fixed wrong API version in lib/pci.h.
* Updated README.Windows.
* Fix compilation on Windows.
* update-pciids now supports XZ compression. If libpci is configured
  with support for compression, all downloaded files are recompressed
  as gzip. Otherwise they are stored as plain text.
* update-pciids now sends itself as the User-Agent.
* Added a pcilmr utility for PCIe lane margining.
* Re-factored access to i386 ports on all relevant platforms.
* Added i386 port access on OpenBSD.
* Back-ends for Windows received many bug fixes and improvements.
* ECAM back-end now scans ACPI and BIOS memory faster.
* Linux systems without pread/pwrite are no longer supported
  as they are hopefully long gone. This helps avoid the tricky check
  for presence of pread which was found to fail on musl libc.
* Improved decoding of PCIe control and status registers.
* Decoding of CXL capabilities now supports up to CXL 3.0.
* lspci now displays interrupt message numbers consistently across
  different capabilities.
* Cache of IDs resolved via DNS, which was located in ~/.pci-ids
  by default, is now stored according to the XDG base directory
  specification in $XDG_CACHE_HOME/pci-ids.
* All source files now have SPDX license identifiers.
* Internal: The "aux" fields of structs pci_access and pci_dev
  reserved for use by back-ends were renamed to backend_data to better
  reflect their meaning.
* As usually, various minor bug fixes and updated pci.ids.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/pciutils/pciutils/configure.patch    | 11 +++++------
 .../{pciutils_3.10.0.bb => pciutils_3.11.1.bb}        |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.10.0.bb => pciutils_3.11.1.bb} (95%)

diff --git a/meta/recipes-bsp/pciutils/pciutils/configure.patch b/meta/recipes-bsp/pciutils/pciutils/configure.patch
index 91bd255899..5015cf4884 100644
--- a/meta/recipes-bsp/pciutils/pciutils/configure.patch
+++ b/meta/recipes-bsp/pciutils/pciutils/configure.patch
@@ -1,4 +1,4 @@
-From 42e7d5f5f1d84a56b125aa05de33d31e28ad1124 Mon Sep 17 00:00:00 2001
+From 561216c8cbc280aaa9aecf30cb11835a4a0a78ed Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 31 Dec 2008 17:20:38 +0000
 Subject: [PATCH] pciutils: Upgarde 2.2.4 -> 3.0.3
@@ -17,18 +17,17 @@ Ionut Radu <ionutx.radu@intel.com>
 2017/6/15 - RP - Cleanups and merging patches
 
 Upstream-Status: Inappropriate [embedded specific]
-
 ---
  Makefile      |  2 +-
  lib/configure | 14 ++++++++++----
  2 files changed, 11 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 3df076d..9b247d3 100644
+index aaec04e..9c1dab0 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -110,7 +110,7 @@ example$(EXEEXT): example.o lib/$(PCIIMPLIB)
- example.o: example.c $(PCIINC)
+@@ -123,7 +123,7 @@ pcilmr$(EXEEXT): pcilmr.o $(LMROBJS) $(COMMON) lib/$(PCIIMPLIB)
+ pcilmr.o: pcilmr.c $(LMRINC)
  
  %$(EXEEXT): %.o
 -	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
@@ -37,7 +36,7 @@ index 3df076d..9b247d3 100644
  ifdef PCI_OS_WINDOWS
  comma := ,
 diff --git a/lib/configure b/lib/configure
-index 57b064b..b269332 100755
+index 3df057a..c87e71c 100755
 --- a/lib/configure
 +++ b/lib/configure
 @@ -9,6 +9,10 @@ echo_n() {
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb
similarity index 95%
rename from meta/recipes-bsp/pciutils/pciutils_3.10.0.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.11.1.bb
index e27cfd4ced..044074ccc3 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "zlib kmod make-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://configure.patch"
 
-SRC_URI[sha256sum] = "238a2e27166730e53a17fe07bfad229e07fa39b618117e5944b6d7eda9fbb0e9"
+SRC_URI[sha256sum] = "3f472ad864473de5ba17f765cc96ef5f33e1b730918d3adda6f945a2a9290df4"
 
 inherit multilib_header pkgconfig update-alternatives
 
-- 
2.34.1


