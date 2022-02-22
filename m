Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4222CC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:52 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13729.1645542530232186642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fsaXY05e;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542531; x=1677078531;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=wG8S9pDEttaEO7WdWBjaUcYZEGrGEc3wOhkibY5jtAE=;
  b=fsaXY05eVlZ+P0ndHZzpg1ioT5tAOcH+CvDmAVcDzKG+2pr+Rw8IGuMY
   fZIj3qDBwms7ByHZtEbDoP0S43Ymq+Iwt6L2VrJ1JjOCv3bkXj8SChGad
   zH1vMF+2ptFUD21WoCsSBxPhx0BitaT1h4Y3576svvsU3+js24DO8kCev
   YFWOXzGQPZmePj3uN33m8DX4THH8Wdw/hVCqil1JxpyIK5jnzr26z1Wh+
   PZrI5NpIS+Uf4szJ9WkEaFLovPdjlk1njdti6xzxImXJhCaIIvNtG1iLg
   GgtMbtdRzNrlTXr5hthCIIn/lXxLmXnq2X9OntHPMj60+AoyWd+OjUUNp
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305259"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305259"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258764"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 28/38] default-distrovars.inc: Switch connectivity
 check to a yoctoproject.org page
Date: Tue, 22 Feb 2022 23:07:29 +0800
Message-Id: 
 <83543d4576284a1a437cbc42ebe84b8639068143.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162165

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
index ddba1e6e1e..49eef2f418 100644
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
index fb0f1097da..3bba651a77 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -54,4 +54,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
-CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
+CONNECTIVITY_CHECK_URIS ?= "https://yoctoproject.org/connectivity.html"
-- 
2.35.1


