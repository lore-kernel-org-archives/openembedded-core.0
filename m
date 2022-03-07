Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1333BC43219
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:01 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.26508.1646662438266182811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=aggScPzp;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662439; x=1678198439;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=n2oMb/y8we0lvHTCb5AhWV714yBnTgHfTnXVgSjGfAE=;
  b=aggScPzp7RqxjIFoqRsI1sfrxE1aYf/VvPayKKgPT5ZG52q5mlngUVHN
   q6LM0/N5dHF6DFwyHrGGxoNfDQ6/PIeERmG8rVKkx0lsFQ5sturjK/z6I
   1w35KZHk87K0QuhA/aqBgFHeDWtdvtOkFoA+Rk8BecmHWu3bytad8+tyo
   QQa1QQh75LvQdvqBCxRGdSchVYnH4Pv9GycQ6zQVDiVlwwrMdn9EV6St4
   9y1BsPi4Q5PFf+Q7AHbC6SJV2n3QmjVX36IgLXhjEBpY6CvT20G3h2O7M
   6DDdWoDSQMLcm34v64gg/ZFdXdNShzMaaCo7TeUecVaAmsYG3j2zYf6Mw
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112536"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112536"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070839"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:26 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 13/25] kernel-devsrc: do not copy Module.symvers
 file during install
Date: Mon,  7 Mar 2022 22:09:49 +0800
Message-Id: 
 <d4416bd7f8823ddd7bf25f286649a12f13b0fabc.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162835

From: Oleksandr Ocheretnyi <oocheret@cisco.com>

When CONFIG_MODULES is not enabled in kernel config - Module.symvers
generation is not done, which causes the file not to be created.

This fails later in do_install() due to the fact that copy
command in executed for non-existing Module.symvers file.

Check for Module.symvers existence before copy command in executed.

Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit deacceac6461400037b152260c8edbc819f6309a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index f22fac5bd6..264726d08c 100644
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
2.35.1


