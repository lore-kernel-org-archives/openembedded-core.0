Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1241FC4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:31:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.5461.1670207471382631596
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ci8whNQT;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207469; i=@fujitsu.com;
	bh=w6MhYhUWLLEIKX2NzYLIUtClwNuSWghqV9e4IFwL+8o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Ci8whNQToDJ7Td2swL1HkEOJEHSgh0Tq650t1YGdj5eT/VgLQODQHyzHw0TByLzUm
	 Hgww+s5IHoFax5cQDm3gGGW1vbHCJKgJXlnNbmH10Y4DE1hdkvdKppMhAoT7W8sJXW
	 edMdHKz/7njdy8YJAt+Y+aG5M4xZKNBu14rihrQYHkckkTRIaKFFxpzOgGhVGsDoGR
	 ja3KwqW0OPrFyxCwrmZXn9vqc5ed/djnzCmC8YKJTkaR3RulWgZIKJrvb+z6gHwuYN
	 CqzHCPeai9hfiKhfIK9JCBHCU7nkxTdvBkJ2WaBh0tijE7uaVdi0LqSEOif8tewUep
	 OTJdIJLcRKLmw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSfdNeG+
  ywZyN1hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8amSR/ZCibIVXycbdvAuFOqi5GLQ0jgMaPE
  pqeTGCGca0wSBzbfZIZwdjNKnPu3GSjDycEmICVx4/5/ti5GDg4RAT2Jq/9EQcLMAioSL373s
  IPYwgLWEmu+XWUCsVmA4g/u97CB2LwCjhKrO2aygtgSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1iNC1OLSpLLdK10Esqykz
  PKMlNzMzRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMSUYvWtOxgPL/uj
  d4hRkoNJSZRX6VF3shBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3uiw3mQhwaLU9NSKtMwcYFTAp
  CU4eJREeIW8gdK8xQWJucWZ6RCpU4yWHFNn/9vPzLEcTM782naAWYglLz8vVUqcVwVkngBIQ0
  ZpHtw4WOReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM6+YLNIUnM68EbusroIOYgA7ayN8
  FclBJIkJKqoFp0p+VU9n1nVtnX6r6JLRl1q2X/3oOBV7XUD75RE989fSE+Bo/ZeWvbck8Zv2z
  bk5dVqPcOK2V89cDmag+njc5sU/OKvn0udtP8zZb/PP5kosNE0KyD7Pa/uR7dZBn5YHXgpe9J
  G5Ih18PeclbGtj44OnsCXKGb47cNdQX6fL9dNB2bvzbA6aPdyyNVtO8xbR+Z99J7+S1/zInxl
  W8yvvIZyZRKNX06c6dYBVxpTSNwt2tLAJfWxvPuhy06Q1ttTzIfFk9W6abN08u46puqlzLyz7
  HkKU7exc0KL1TXZQ9JeH94ycbJLhmNGvo/bnFdb/jscgem09bFE6xLDmWneFzkdv48vFzoRHv
  WOa19AYqsRRnJBpqMRcVJwIAaRhIGVcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1670207468!168423!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25283 invoked from network); 5 Dec 2022 02:31:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:31:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A8E2C1000D7
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:31:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9C9D51000D2
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:31:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:31:06 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] pciutils: upgrade 3.8.0 -> 3.9.0
Date: Mon, 5 Dec 2022 10:30:38 +0800
Message-ID: <1670207442-7087-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174266

From: Wang Mingyu <wangmy@fujitsu.com>

configure.patch
refreshed for 3.9.0

Changelog:
==========
* We decode Compute Express Link (CXL) capabilities.
* The tree mode of lspci is now compatible with filtering options.
* When setpci is used with a named register, it checks whether
  the register is present in the particular header type.
* Linux: The intel-conf[12] back-ends prefer to use ioperm() instead
  of iopl() to gain access to I/O ports.
* Windows: We have two new back-ends
  One uses the NT SysDbg interface, the other uses kldbgdrv.sys
  (which is a part of the Microsoft WinDbg tool).
* Windows: We support building libpci as a DLL. Also, Windows
  binaries now include meta-data with version.
* Hurd: The Hurd back-end works again.
* mmio-conf1(-ext): Added a new back-end implementing the intel-conf1
  interface over MMIO. This is useful on some ARM machines, but it
  requires manual configuration of the MMIO addresses.
* As usually, updated pci.ids to the current snapshot of the database.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/pciutils/pciutils/configure.patch   | 12 ++++++------
 .../{pciutils_3.8.0.bb => pciutils_3.9.0.bb}         |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.8.0.bb => pciutils_3.9.0.bb} (95%)

diff --git a/meta/recipes-bsp/pciutils/pciutils/configure.patch b/meta/recipes-bsp/pciutils/pciutils/configure.patch
index cf55b94808..91bd255899 100644
--- a/meta/recipes-bsp/pciutils/pciutils/configure.patch
+++ b/meta/recipes-bsp/pciutils/pciutils/configure.patch
@@ -1,4 +1,4 @@
-From 502c01e180d9085fcbeaf2fb46239999c4f335d2 Mon Sep 17 00:00:00 2001
+From 42e7d5f5f1d84a56b125aa05de33d31e28ad1124 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 31 Dec 2008 17:20:38 +0000
 Subject: [PATCH] pciutils: Upgarde 2.2.4 -> 3.0.3
@@ -24,20 +24,20 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 11 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 9319bb4..78a2d54 100644
+index 3df076d..9b247d3 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -108,7 +108,7 @@ example$(EXEEXT): example.o lib/$(PCILIB)
+@@ -110,7 +110,7 @@ example$(EXEEXT): example.o lib/$(PCIIMPLIB)
  example.o: example.c $(PCIINC)
  
  %$(EXEEXT): %.o
 -	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
 +	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) $(LDLIBS) -o $@
  
- %.8 %.7 %.5: %.man
- 	M=`echo $(DATE) | sed 's/-01-/-January-/;s/-02-/-February-/;s/-03-/-March-/;s/-04-/-April-/;s/-05-/-May-/;s/-06-/-June-/;s/-07-/-July-/;s/-08-/-August-/;s/-09-/-September-/;s/-10-/-October-/;s/-11-/-November-/;s/-12-/-December-/;s/\(.*\)-\(.*\)-\(.*\)/\3 \2 \1/'` ; sed <$< >$@ "s/@TODAY@/$$M/;s/@VERSION@/pciutils-$(VERSION)/;s#@IDSDIR@#$(IDSDIR)#;s#@PCI_IDS@#$(PCI_IDS)#"
+ ifdef PCI_OS_WINDOWS
+ comma := ,
 diff --git a/lib/configure b/lib/configure
-index 45a416a..1afdaa6 100755
+index 57b064b..b269332 100755
 --- a/lib/configure
 +++ b/lib/configure
 @@ -9,6 +9,10 @@ echo_n() {
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.9.0.bb
similarity index 95%
rename from meta/recipes-bsp/pciutils/pciutils_3.8.0.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.9.0.bb
index 4f57342e1e..f9fe7aa76a 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.9.0.bb
@@ -14,7 +14,7 @@ DEPENDS = "zlib kmod make-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://configure.patch"
 
-SRC_URI[sha256sum] = "91edbd0429a84705c9ad156d4ff38ccc724d41ea54c4c5b88e38e996f8a34f05"
+SRC_URI[sha256sum] = "cdea7ae97239dee23249a09c68a19a287a3f109fbeb2c232ebb616cb38599012"
 
 inherit multilib_header pkgconfig update-alternatives
 
-- 
2.25.1


