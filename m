Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D19C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 02:54:18 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.1726.1650941652560455819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 19:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=FQZEz6Z4;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650941654; x=1682477654;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tkDx4M2uMLv6CRjWIMpEKGm2tEhdHIPWSt6D4oAlAyg=;
  b=FQZEz6Z4j+eBmxQ68fjsPhhmpKEvO7EYs2ZfaDmjM+MIl8m2Y724/Tp4
   jQlMXAeDFymE5faFuDMkX7+fXuADwpkA7Z/tvr7I7DdVhVc7Wo4Uar9tE
   W6BV9kS9Xf8GUD7//FQAQ9gpgXGIAdBh6acokwSpHC5Q7gV4Ut4/Yigfc
   F4PS2t1yJznNw1ZbC7cs+fH/J6oCVYkVNfRfn7oHTLuSIdAFQGvnXo799
   0Os0n0boUr8XulkUX/3zyMtVXCHVqRMUJp6CLns/N+LzOWDr1st1aVgWb
   H77N1Kp4H+3x/+3mWp9Kabr3aNjDkbTl8w4j6ZBv8Fjcxxu/r6Hj2aFuK
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264950956"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="264950956"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="660439813"
Received: from huiyingn-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.47.238])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 2/7] alsa-tools: Ensure we install correctly
Date: Tue, 26 Apr 2022 10:54:00 +0800
Message-Id: 
 <a27f0e9e7efc2554826b7365a83c25980b28cf2d.1650941226.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650941226.git.anuj.mittal@intel.com>
References: <cover.1650941226.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 02:54:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164849

From: Richard Purdie <richard.purdie@linuxfoundation.org>

With the fix for #8621, cleandirs is now applied to autotools_do_install
and this results in a lot of the install targets to be removed. Ensure
cleandirs isn't set for autotools_do_install.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 72299395b06fc3fdaca5f7b8b87a6ea32a6267ad)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
index 540f4f79f4..e6fe83a186 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
@@ -71,6 +71,7 @@ python do_compile() {
 }
 
 python do_install() {
+    d.delVarFlag("autotools_do_install", "cleandirs")
     for subdir in d.getVar("PACKAGECONFIG").split():
         subdir = subdir.replace("--", "/")
         bb.note("Installing %s" % subdir)
-- 
2.35.1


