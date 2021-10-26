Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A49BC433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:24 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.14241.1635263952829079345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783450"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783450"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:22 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786492"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:21 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 19/37] libnewt: Use python3targetconfig to fix
 reproducibility issue
Date: Tue, 26 Oct 2021 23:57:50 +0800
Message-Id: 
 <5d27faf68ff94519d6618351ce87a8b3818ba611.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157422

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing pthread being linked sometimes and not others leading to
non-reproducible target binaries. The reason is mixing the native python
config with the target one. We should use the target one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3fe5101b335384ef83e96ccc58687fd631164075)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/newt/libnewt_0.52.21.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/newt/libnewt_0.52.21.bb b/meta/recipes-extended/newt/libnewt_0.52.21.bb
index 84d327ca88..86301b95eb 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.21.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.21.bb
@@ -29,7 +29,7 @@ SRC_URI[sha256sum] = "265eb46b55d7eaeb887fca7a1d51fe115658882dfe148164b6c49fccac
 
 S = "${WORKDIR}/newt-${PV}"
 
-inherit autotools-brokensep python3native python3-dir
+inherit autotools-brokensep python3native python3-dir python3targetconfig
 
 EXTRA_OECONF = "--without-tcl --with-python"
 
-- 
2.31.1


