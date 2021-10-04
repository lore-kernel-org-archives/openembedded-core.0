Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B99C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 16:51:15 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.12465.1633366273427525687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 09:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="222944185"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="222944185"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="483208892"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.128.172])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:11 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/11] package_ipk: Use localdata store when
 signing packages
Date: Tue,  5 Oct 2021 00:50:52 +0800
Message-Id: 
 <c4724cd652b5a3adc398652b48e16d1fd1a90e89.1633366030.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633366030.git.anuj.mittal@intel.com>
References: <cover.1633366030.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 16:51:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156616

From: Kenfe-Mickael Laventure <mickael.laventure@verkada.com>

When signing a package, we were resolving the `PKGV` version using the
original data store (`d`). However, since that store does not have the
package name in its `OVERRIDES` list the wrong version can be returned in
recipes that produce multiple packages. One such example would be
`external-arm-toolchain.bb`.

The above issue is fixed by using `localdata` instead of `d` when
resolving the needed variables.

Signed-off-by: Kenfe-Mickael Laventure <mickael.laventure@verkada.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b5f01cf5a92a873ac4c3f0ba0584cab2cc05714)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/package_ipk.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 600b3ac90c..67d6007e11 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -230,8 +230,8 @@ def ipk_write_pkg(pkg, d):
                                 shell=True)
 
         if d.getVar('IPK_SIGN_PACKAGES') == '1':
-            ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
-            ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH'))
+            ipkver = "%s-%s" % (localdata.getVar('PKGV'), localdata.getVar('PKGR'))
+            ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, localdata.getVar('PACKAGE_ARCH'))
             sign_ipk(d, ipk_to_sign)
 
     finally:
-- 
2.31.1


