Return-Path: <oocheret@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABE0C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 15:19:04 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.web11.7532.1645802343557789459
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 07:19:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=YGFuuKAd;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: oocheret@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1097; q=dns/txt; s=iport;
  t=1645802343; x=1647011943;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5msxvys+ZQlkJtXNUO7+PvA67xB53qyt4lX72r+9/nc=;
  b=YGFuuKAdrPZGfPGBBcX1tfsRi/JaGl5Y/w73Dfh+Z2O93MnoLA5Q8nyF
   SDPEdU3ELN/s6a2HGtXox3zlDMs0b6BDvdgAhU+0hLUPxoIg8ll5qQxBx
   EqGMf71XJTgaz7TVN9pUPzcKGUtqjLnyd6P7folY6AqNAR+cEoBYUxfqA
   k=;
X-IronPort-AV: E=Sophos;i="5.88,333,1635206400";
   d="scan'208";a="985389877"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 25 Feb 2022 15:19:02 +0000
Received: from sjc-ads-3421.cisco.com (sjc-ads-3421.cisco.com
 [171.68.249.119])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTP id 21PFJ14t006545;
	Fri, 25 Feb 2022 15:19:02 GMT
From: Oleksandr Ocheretnyi <oocheret@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Ocheretnyi <oocheret@cisco.com>
Subject: [PATCH] kernel-devsrc: do not copy Module.symvers file during install
Date: Fri, 25 Feb 2022 07:17:15 -0800
Message-Id: <20220225151715.1611297-1-oocheret@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.119, sjc-ads-3421.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 15:19:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162403

When CONFIG_MODULES is not enabled in kernel config - Module.symvers
generation is not done, which causes the file not to be created.

This fails later in do_install() due to the fact that copy
command in executed for non-existing Module.symvers file.

Check for Module.symvers existence before copy command in executed.

Change-Id: Ie7c0ca5d139d49e1cf8f3cb343aef7905389a761
Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index cccf06e12c..8d360ed3f3 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -72,7 +72,9 @@ do_install() {
     (
 	cd ${B}
 
-	cp Module.symvers $kerneldir/build
+	if [ -s Module.symvers ]; then
+	    cp Module.symvers $kerneldir/build
+	fi
 	cp System.map* $kerneldir/build
 	if [ -s Module.markers ]; then
 	    cp Module.markers $kerneldir/build
-- 
2.26.2.Cisco


