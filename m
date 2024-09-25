Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EBECD5BDF
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.9314.1727246983620399432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Bq8eRu0X;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246984; x=1758782984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Rzgm3a51BPAsfpBWo/e1Fd4gDGrg2mKPte5tNVyIYW0=;
  b=Bq8eRu0XnvSTxqi0uS0088LsLY7489BlpgKGe7k+zhxV+47FgG2q8MZS
   9x40+onG34B7UYQyUmz5HrrNXyYvu78CV0TEKNTc/BTmLer0as0HIBUgL
   uR6DJ4OjKf8Zm9aVWKgnhsjgud+g049l7ge8QfafGgeMJTPolscDVmUzf
   uOVcM+82NNs8bEVsCyRguYdWV8ft4DZd2E2017gXZY34VLowF3/cX72yj
   HdY9MCj8TRxLZUuQciHRt7XLXsSdBxVdCnXep6gfGH1FSUgdVIQqUEy+o
   1XZ2BhWcgqt35hyB7lmQ7kt7KSFkTXDfEAhP2Q1+7zx0tAWBytnqzSIyi
   g==;
X-CSE-ConnectionGUID: 88ZsDQYqR2SbUmUmpyIa7w==
X-CSE-MsgGUID: BUp15dOZSCG+QkiWSo0H+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="163052373"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="163052373"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:42 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 43C61C8B41
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 81260CFBB1
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 218CF20086335
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C6B9A1A01E9;
	Wed, 25 Sep 2024 14:49:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/47] libjitterentropy: upgrade 3.5.0 -> 3.6.0
Date: Wed, 25 Sep 2024 14:48:49 +0800
Message-Id: <1727246960-20665-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--2.184300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/T+1Zj+w66+nMI
	apaDo9OKtYdwot7bS62AFTKu3rWaRmJZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFrsq/7BhdGyCeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNcXAB4/TPhmSncneRUj7dG0IpsmB+1ku5rg5E/bmRCNEb01txJAA7bAjMEImDaN1ahL77
	B3L0TR6il/wXIkhH6Vj1N4YYUzFf6oEGG3M+VOyU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204905

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Remove bi-modal behavior of conditioning function
 * Make jent_read_entropy_safe safer by retrying the health test
 * Move the version information to make them available at compile time

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libjitterentropy_3.5.0.bb => libjitterentropy_3.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.5.0.bb => libjitterentropy_3.6.0.bb} (95%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.5.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.0.bb
similarity index 95%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.5.0.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.6.0.bb
index f23a122a9c..e9ff898617 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.5.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=18a5cada7ee95e61db4180f0cb4a69cf \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
-SRCREV = "48b2ffc128af776ff3658a70e5d7bb4a82180189"
+SRCREV = "7199c8959347b0e8342df7dc6e0c1fc4b484d2fb"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.34.1


