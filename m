Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD52C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:29:50 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5654.1639013381253925301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235503961"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235503961"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298047"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:47 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/33] classes/crate-fetch: Ensure crate fetcher is
 available
Date: Thu,  9 Dec 2021 09:29:06 +0800
Message-Id: 
 <19577427d25739588fdf607b6e3905dddfe206ff.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:29:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159408

From: Joshua Watt <JPEWhacker@gmail.com>

Reworks the crate fetcher class to have it install the fetcher at recipe
finalization so that it is always available before SRC_URI is expanded.
In addition, override the value of SRCPV to also install the fetcher
when SRCPV is expanded so that AUTOREV works.

[YOCTO #10867]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc66c5dd65fb654af5cd91b47f9b4f7a5f53436e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/crate-fetch.bbclass | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes/crate-fetch.bbclass b/meta/classes/crate-fetch.bbclass
index c0ed434a96..a7fa22b2a0 100644
--- a/meta/classes/crate-fetch.bbclass
+++ b/meta/classes/crate-fetch.bbclass
@@ -7,7 +7,22 @@
 # crate://<packagename>/<version>
 #
 
-python () {
-        import crate
-        bb.fetch2.methods.append( crate.Crate() )
+def import_crate(d):
+    import crate
+    if not getattr(crate, 'imported', False):
+        bb.fetch2.methods.append(crate.Crate())
+        crate.imported = True
+
+python crate_import_handler() {
+    import_crate(d)
 }
+
+addhandler crate_import_handler
+crate_import_handler[eventmask] = "bb.event.RecipePreFinalise"
+
+def crate_get_srcrev(d):
+    import_crate(d)
+    return bb.fetch2.get_srcrev(d)
+
+# Override SRCPV to make sure it imports the fetcher first
+SRCPV = "${@crate_get_srcrev(d)}"
-- 
2.33.1


