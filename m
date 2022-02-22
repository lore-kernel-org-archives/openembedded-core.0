Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448F6C43219
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:45 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.13657.1645542520813188935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nIl+bUDP;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542524; x=1677078524;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ixDn9W6bP+96FX9UqBPXzwMfIouM4s2TjgE73tsG/V8=;
  b=nIl+bUDPF8egiznFUEn6T+DRnrOcpwbarGZpAKE0vxSwCFyeldRlFQLH
   wIL4bOjCS5e35BxDUWSYth+R0keq2G6kHxRY7+nvE8hDu/Tnsmt0pmSA+
   aKX03t4g8u0K4Sn9NVg1qFmRXH8ykLRZVRwa1RV6M8Q0RwkdqX7r3H2Q6
   JVicd/+yfQKk7RjB/i3eKppNXuO+KnbKp8zgDLmM5ecIlotj9T7JPdr1X
   5RamAzywhFu2zk1GDZ8iGADT1spjVHn4KhVRbuIv1nwJSirVX6WdOeFoQ
   /+68A3eiI8KIiJ5joyWqnPMClhSmdJ4uX17qoesx7NOXVNU5v+640rTKq
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305245"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305245"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258751"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:28 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 26/38] gcc-target: fix glob to remove gcc-<version>
 binary
Date: Tue, 22 Feb 2022 23:07:27 +0800
Message-Id: 
 <542ceb1cb20bd1117e957143c854526896e17793.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162162

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The glob to remove the gcc-<version> binary expects a single-digit major
version which is no longer true.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30de10cf939cf65c0cab6730a3575bced5c7533a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index bf55e692e6..bcea75b2fa 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -193,7 +193,7 @@ do_install () {
 	rm -f *c++*
 
 	# We don't care about the gcc-<version> ones for this
-	rm -f *gcc-?.?*
+	rm -f *gcc-?*.?*
 
 	# Not sure why we end up with these but we don't want them...
 	rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
-- 
2.35.1


