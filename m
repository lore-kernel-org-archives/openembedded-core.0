Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A7DC4332F
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:57:47 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.6508.1652237864009171798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=VZRvncf0;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237864; x=1683773864;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=MQY5YC+zuFb+d3X9wkZUXEoeVleH4nZ4npMZv7xIuaM=;
  b=VZRvncf00v9datUB5Z0corf96RSVwecIro/1B3nxQgtg4FpEqMabCsHL
   SyLKDtFL9/90KbE/A7CroctqSe6m2/+e8z17zcArdcO2yWVTg3RBpGSif
   2rQkYNW9p3++8irYMT8kZdPBeEHrvct3zIfwPS7WXAyrXBDLNGbKYbHXv
   QVNiRIvyjeZmJjsrxGr5VRQB5Hfgpgn7rqdYOWKvYC/E754uBGorILeh+
   n9HN6wyvjYfFj+lNH8ga5xkPf98hdC6L/m8s76MdlclyMwpPZqkKVo8IO
   9/EKs9OhL6i/9taolmW/g8kXw7LI8T07XvAwFUjAXpGJQRyaVgQLpr8sh
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257105984"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257105984"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754675"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:38 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/17] busybox: Use base_bindir instead of
 hardcoding /bin path
Date: Wed, 11 May 2022 10:57:16 +0800
Message-Id: 
 <aedd917364beedb806e1d4d1d02c28d2597e473c.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:57:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165469

From: Khem Raj <raj.khem@gmail.com>

This symlink is not valid when using usrmerge and ptest packaging would fail

Exception: FileExistsError: [Errno 17] File exists: '/usr/bin/busybox.suid' -> '/mnt/b/yoe/master/build/tmp/work/ppc64p9le-yoe-linux-musl/busybox/1.35.0-r0/package/usr/lib/busybox/ptest/bin/login'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 238fd30689054c7b44176dce7180fb6dac4e1b6f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 808c3dc700..187ca15957 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -349,7 +349,7 @@ do_install_ptest () {
         # These access the internet which is not guaranteed to work on machines running the tests
         rm -rf ${D}${PTEST_PATH}/testsuite/wget
 	sort ${B}/.config > ${D}${PTEST_PATH}/.config
-	ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
+	ln -s ${base_bindir}/busybox   ${D}${PTEST_PATH}/busybox
 }
 
 inherit update-alternatives
-- 
2.35.3


