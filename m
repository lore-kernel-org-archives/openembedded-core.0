Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB7BC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:18:40 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.318.1645107508890252839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:18:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=E/wNC9JX;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645107519; x=1676643519;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/RRFxZ/ZxOo304u7hTm0+B967iPqIerH0u9EsLVMLdE=;
  b=E/wNC9JXqesbTsbsXB9uEytSR1Hzr0DNnNn5NRDnvF4y2LnOgu/1CMzk
   bx0xPEAptDi2gX86XjlVkJ+jOgZ9fOVuarlGj3lzhuR7XsrWjcqf1O1h3
   3wZYdf+8Prc4qSdtO/5f9Y4RdqK/c2k5p5U67io7woVkho5nbQnZ7ytRI
   oFEn/zZSzrt++HdORjAIYXFOhfL/C3+QU5GkdXsPTIUP4TjtDKP2erJBq
   fiGGHG5QXa5JHV0concTFJMJbye9zayRAFVRfySbSi5GtD/KZJ7QnBHEn
   wWdG/HFluIu5ACzwl9oGF6v5cAARi2U6MAcMtUMCfUgZTf9Ue4+0Kd6ct
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250618005"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="250618005"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="530249280"
Received: from kkoay3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.130.102])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:37 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/14] default-distrovars.inc: Switch connectivity
 check to a yoctoproject.org page
Date: Thu, 17 Feb 2022 22:18:16 +0800
Message-Id: 
 <3d9f68e06736817871d8694fe0c6e779c005872b.1645106980.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645106980.git.anuj.mittal@intel.com>
References: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:18:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161807

From: Richard Purdie <richard.purdie@linuxfoundation.org>

example.com is proving unreliable at present so switch to our own connectivity
page instead. That page is very simple avoiding app overhead on our web server
which was an original reason for switching to example.com.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc6b043cb75c5751b5a98afd2201aa31f9b4b9f6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sanity.bbclass                     | 2 +-
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a2ac4eeb80..c8a42dc8bf 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -395,7 +395,7 @@ def check_connectivity(d):
                 msg += "    Please ensure your host's network is configured correctly.\n"
                 msg += "    If your ISP or network is blocking the above URL,\n"
                 msg += "    try with another domain name, for example by setting:\n"
-                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.yoctoproject.org/\""
+                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.example.com/\""
                 msg += "    You could also set BB_NO_NETWORK = \"1\" to disable network\n"
                 msg += "    access if all required sources are on local disk.\n"
             retval = msg
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 0240589c81..038acc1504 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -48,4 +48,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
-CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
+CONNECTIVITY_CHECK_URIS ?= "https://yoctoproject.org/connectivity.html"
-- 
2.35.1


