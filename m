Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF14C352A1
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=bMNyiISH;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169712; x=1680705712;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=r4Jl3g91/FZeFIrv2cZ4llKyidDHUOcVnq4JcGYzZAo=;
  b=bMNyiISHbgQ75a32V9m16rdRl6nPPT8akJMBEjqCfSXbGGvjaHba6cX7
   bsIdAUwvG7gCGDjjuMOiLob2gpNDEmzWs+ZdMYCU//TR6iin+5bi7WBGl
   8SB5TkdvGvQf9lrVEmytB3iZo95kLoo94kiR3JBQiua2CvjrA7HaeJYb/
   m3CWctWx99tQCr+V4wfQRFyXJ1BnX8o56U34XeqFP2mFZtXhC/ZHwRQpn
   952HZ9edVOzJZhOFL8Gohud0lMBinq93t3WrtL/Krl7IYsXvBK7E/P9E1
   puW+1yWTGqruCw2QVi3oRt1yfnqBuY3Er4JUIc/0AMXk2PmYCcVsbj6TA
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348677"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348677"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953525"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:51 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/22] devupstream: fix handling of SRC_URI
Date: Tue,  5 Apr 2022 22:41:23 +0800
Message-Id: 
 <0a9ae87c45740ac62b4b0d96eb5bb7de8887d766.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164022

From: Ross Burton <ross@burtonini.com>

As the class handler runs before overrides are actually applied we need
to check both SRC_URI:class-devupstream and SRC_URI, otherwise the
automatic assignment of S="${WORKDIR}/git" for git repositories does
not work if the base recipe uses http: but :class-devupstream has a git://
entry instead.

Also, there's no need to set S:class-devupstream, we can just assign to
S here.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0edb03088d0d1c20c899daed1bb3a7110b19670)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/devupstream.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/devupstream.bbclass b/meta/classes/devupstream.bbclass
index facc46f3af..ba6dc4136c 100644
--- a/meta/classes/devupstream.bbclass
+++ b/meta/classes/devupstream.bbclass
@@ -30,10 +30,11 @@ python devupstream_virtclass_handler () {
     # Develpment releases are never preferred by default
     d.setVar("DEFAULT_PREFERENCE", "-1")
 
-    uri = bb.fetch2.URI(d.getVar("SRC_URI").split()[0])
+    src_uri = d.getVar("SRC_URI:class-devupstream") or d.getVar("SRC_URI")
+    uri = bb.fetch2.URI(src_uri.split()[0])
 
     if uri.scheme == "git" and not d.getVar("S:class-devupstream"):
-        d.setVar("S:class-devupstream", "${WORKDIR}/git")
+        d.setVar("S", "${WORKDIR}/git")
 
     # Modify the PV if the recipe hasn't already overridden it
     pv = d.getVar("PV")
-- 
2.35.1


