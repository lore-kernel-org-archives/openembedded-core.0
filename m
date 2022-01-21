Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DF7C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 14:51:24 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12868.1642776670242435373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 06:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=NGANSm02;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642776684; x=1674312684;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=C8wwKzWcnfLQkXKMOgARaA1/3Q0PApKpOV+WltHXrOs=;
  b=NGANSm02TRTTNiQxND8xbapvzhmJ2pMhXwJNQIDnNGRlPNOvueIESybu
   yLlsSWE4MJqA5JTGnJOYyJ5r3B7QlB0GIA1/P5Tidecjhi2MNfAdnGMBp
   4NRyqAwczUeSzaEeH68C9iRUOaoWH+DvD9CPdYc1Om4Yd74I+owSsLrpm
   3vGn9aUFQdXjcZVDACJCIXkvbDqg8UC/EebinNIyoDYnmLQqxfAbpTqVq
   3wcIOYPpoYXj3o9SP9te5ynnFr7Ifje50TtyonmtoTT73UzbmcJpVo7ih
   tsD+Aj3ve9RFOgmwkHkSSUwkTR38BGkzvx/UluyDZpb9W1lMztWxYjGNK
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245886069"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="245886069"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="623336749"
Received: from gordonyx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.131.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:22 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/15] xserver-xorg: whitelist two CVEs
Date: Fri, 21 Jan 2022 22:50:56 +0800
Message-Id: 
 <f82c65b3c69738401ecdac354ed65308929cc20f.1642736951.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642736950.git.anuj.mittal@intel.com>
References: <cover.1642736950.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 14:51:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160839

From: Ross Burton <ross@burtonini.com>

CVE-2011-4613 is specific to Debian/Ubuntu.

CVE-2020-25697 is a non-trivial attack that may not actually be feasible
considering the default behaviour for clients is to exit if the
connection is lost.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit afa2e6c31a79f75ff4113d53f618bbb349cd6c17)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 497515a04a..d83cb94317 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -18,6 +18,14 @@ XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
 
 CVE_PRODUCT = "xorg-server x_server"
+# This is specific to Debian's xserver-wrapper.c
+CVE_CHECK_WHITELIST += "CVE-2011-4613"
+# As per upstream, exploiting this flaw is non-trivial and it requires exact
+# timing on the behalf of the attacker. Many graphical applications exit if their
+# connection to the X server is lost, so a typical desktop session is either
+# impossible or difficult to exploit. There is currently no upstream patch
+# available for this flaw.
+CVE_CHECK_WHITELIST += "CVE-2020-25697"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.34.1


