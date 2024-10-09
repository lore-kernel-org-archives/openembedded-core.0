Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEADCF044D
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:46 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.9178.1728452985227459551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fNwjj5jS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452985; x=1759988985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VbWFyQph8gcK9jbSqW1DOBOdkUR+M1xyz1jYB3UX3iY=;
  b=fNwjj5jS/RHuk0gaWR4luyXi+sUOiwV4WsRGg6GKi5yoP643Il/yPFST
   lseQJGy1eOXYOX8YCJct3yLbqpjYRrNuS4Xisa4fzWIapaccD0CdvvPYJ
   pNSig96bJgxxgGNsIIBy2/vGeoqpqCNLEMIs8sdkPnBkmvgWZJUVPjb3D
   z4qNLc5by1+QU2HNF6dsPScy2VkjOUzdOhWE4vnVT2dO5NSHHuGr1opE5
   5npfuiO9RyhGbQU1S+7AzjhPs21FboYAJZ6cZabBz3j1OlaRQ87g423sd
   gJJZ5QK+60nt4djPo9Sfm3Kp8lnbEFtT+Hz1wTGSCUI6yg+dh6vrww1Yz
   A==;
X-CSE-ConnectionGUID: dzRWpjPhQrqIVBIFKYUisA==
X-CSE-MsgGUID: 9ihccVNrTFW7DlMVgbMNYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="176230142"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="176230142"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:43 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F1332C68E2
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 44264D3F2A
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D41E940B62
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8299A1A01E9;
	Wed,  9 Oct 2024 13:49:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/26] ttyrun: upgrade 2.34.0 -> 2.35.0
Date: Wed,  9 Oct 2024 13:49:11 +0800
Message-Id: <1728452955-25051-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--1.365100-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrNroBpCbt+GbozDhGeQC9Eh9s
	SF9fYJNf19but/xeAqtMQ8GITGODLZyhMzByLsI5gvmNrsT46HL7At+An9uo89+tinHBPzXWeBL
	gYf9g0xVhhN9x4MebrQlJ/ieHRHSnGzufRSvQXZjvZFvZsQkL7bTrV2IG143Xw6juv/EevUDoFK
	ygcaLrBUc+k/BBIf/XacTNKphGyRBaQiLka9EcSj9B1SHosSXQwTlc9CcHMZerwqxtE531VNnfJ
	rUSEbFDgZBEjCNOXeKh78oNWbMU36JJCediWkh+ngIgpj8eDcBpkajQR5gb3qbj/c4OO+6RKrau
	Xd3MZDV7uYWIyTwCoQ46Y/5ZVmWM+hOSEV186ynM+Lp6Acz5vIUzCpdO7UROyJaqRa/ngE5yWeC
	W+MxvDyW6Bwi7jLJ7xrkHgQpOoUvyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLW
	lXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205332

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
  Changes of existing tools:
  - cpacfstats: Add support for FULL XTS (MSA 10) and HMAC (MSA 11) PAI counter
  - cpuplugd: Make cpuplugd compatible with hiperdispatch
  - dbginfo.sh: Add network sockstat info
  - pvapconfig: s390x exclusive build
  - zdev: Add option to select IPL device
  - zdump/dfo_s390: Support s390 DFO for vr-kernel dumps
  - zipl: Add support of mirror devices

  Bug Fixes:
  - (genprotimg|zipl)/boot: discard .note.package ELF section to save memory
  - netboot/mk-s390image: Fix size when argument is a symlink
  - ziorep_config: Fix warning message when multipath device is not there.
  - zipl: Fix problems when target parameters are specified by user
  - zipl: Fix segfault when creating device-based dumps with '--dry-run'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ttyrun/{ttyrun_2.34.0.bb => ttyrun_2.35.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.34.0.bb => ttyrun_2.35.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.34.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.35.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.34.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.35.0.bb
index 7fbd48c83a..c505bd7160 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.34.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.35.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "4c922b105b4ccb85c51e7e48153d073742b88510"
+SRCREV = "c2db7ce05fdc3ebd63cccbcb1edc2b606709e21f"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.34.1


