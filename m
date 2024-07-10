Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4554FC3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.10240.1720604664605918816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gzl2rT9v;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604665; x=1752140665;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=x+G7pANsom2mZcgyRv+KhtTrpwmofXkeNgKI7/yQork=;
  b=Gzl2rT9vxmC5Rd8F9J2XvXpCS9+PlfcOgrlnQg4moXlph6W8H4EReN4M
   77nyXoz25S48P4CWrGGZPw95OC4EYkRIwd3MPqrzlyVQ01LEl67nhs4+J
   L4wX1Cr48WKU5zaxVqEssca2vwRh4993VqTNK3jIIJF2QWQ6AKPHIv1Nt
   /LVbas/wVQTLE9BkJ5rEyiW9UMNctHwF/x/y+ZoD6yZd0KbWDR5ftXr4H
   0yMPTH2E+TRyFCZnbCAGUu72Rj1F9k7frNFiCxVtHXCiIddgMdxkY9O2+
   /u5ZRBC0IfhnNI1Zqn060Lq6LCAmLl3j5bWAlV4NcdWofPN74W1GgdH5a
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="166535741"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="166535741"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5465CD8011
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A50DBF4B5
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D2E5220E43
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 09A7A1A000C;
	Wed, 10 Jul 2024 17:44:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/30] sysstat: upgrade 12.7.5 -> 12.7.6
Date: Wed, 10 Jul 2024 17:43:53 +0800
Message-Id: <1720604634-23406-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--4.278200-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mr/eXcEqFSY38H8UzOewTxw+aG
	g/Bit59t9yyhf0h+9HrM9NPjWzPKhF7FLEpyoHYAHWRJEfGP5nmOVBD4weLV0x+hI5qKPMbWmVv
	Mvv0vp+FJiDbchPhpMe4+2csFUqIyTl6egUCE6WiR+kFSF0na6ythirXYhZk5Vl5HlkWJdyJTs4
	b2Sf5nmc+RVAR9qEUhfAOhLCSktQ2AIpLP/qXbGQrcxrzwsv5uTJDl9FKHbrmysPB8dBBorXKn6
	DBj/gsEIvrftAIhWmLHBvqhRdA8suIHbm50UBYM46cXaPycFZt9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO2W79Uq8KMo9UXyDEQmGKfOX81Oddsq4Hq21t+B3Ulk7T2MO2109GFALNE7eJ7cdVDQ2Fr
	Q8V/lc5W+fcy6CBGdpBnKT89OclpdXJwndkD7xvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uAB
	Di47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201725

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* sar/sadf: [A_NET_ETCP]: Rename retrans/s field to retrseg/s
  because it was already used in A_NET_NFS report.
* sadf: SVG: Fix oversized SVG canvas height.
* sadf: Don't cap SVG graph output at 100%.
* sadf: A_NET_SOFT: Don't display graphs for offline CPU.
* sadf: SVG: Don't ignore other views when one has to be skipped.
* sadf: Make sure structures will be alloacated for every installed CPU.
* sadf: Define MIN_CANVAS_HEIGHT constant.
* sar: Display min/max values only when available.
* Define macros for CPU manipulation.
* SREALLOC() macro: Make sure size is not zero.
* Fix a warning given by gcc v13 with -fanalyzer option.
* [Eli Schwartz]: configure.ac: fix erroneous bashisms.
* sar manual page updated.
* DTD and XSD documents updated.
* Year updated in copyright messages.
* Other cosmetic changes in code.
* FAQ and README files updated.
* Non regression tests updated. New tests added.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sysstat/{sysstat_12.7.5.bb => sysstat_12.7.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.7.5.bb => sysstat_12.7.6.bb} (98%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.5.bb b/meta/recipes-extended/sysstat/sysstat_12.7.6.bb
similarity index 98%
rename from meta/recipes-extended/sysstat/sysstat_12.7.5.bb
rename to meta/recipes-extended/sysstat/sysstat_12.7.6.bb
index d598d5366f..ea94ebf0aa 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master \
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRCREV = "2d7682f26f42cef9127b123e319349b330c4ab8f"
+SRCREV = "3e3ec9b2c69940503723e3c2ffc1965a8a3484e3"
 S = "${WORKDIR}/git"
 
 DEPENDS += "base-passwd"
-- 
2.34.1


