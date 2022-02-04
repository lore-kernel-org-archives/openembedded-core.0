Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2601DC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:12:57 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Jnx+LVy/;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983976; x=1675519976;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ww5RM/fgc2bvuuxg1z1xiTkKXNEeSNQDSjtCKAyXkr8=;
  b=Jnx+LVy/5/ZgAOnLEaC5lFY4UrwDK2IJBkVBSpCe+BhgJLyy4mFybmlq
   WTQWJOQEHUXPxkGnPsnF6cm40Xcv+aq7OI57/sqAT3B4el31smH+y6Ur+
   hLZLTaAHalokMsK5++8/v9jNyZptxDH2cuKisBjAniIpBVvj8Nq24HS3h
   H2iHtiZolBmbvgXW0qUDLuIi/1uRuBPt4gnxSdK+WCLXDLdyRJBepKzNz
   TfPfzIghdB7uhnHrkZmms+1LYQET4G+pxhQJBqtDVJEonsZ14MT7+YvKX
   yFefVv+W79IeFBWjtkcaoFwJ1U/UaLKquqj+C1uKGikf/JZTtHkyv3tHC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321592"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321592"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:12:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750008"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:12:55 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/17] insane.bbclass: Correct
 package_qa_check_empty_dirs()
Date: Fri,  4 Feb 2022 22:12:29 +0800
Message-Id: 
 <3f183a7f5b4704b32bd094d5ebbe8584ce26ae34.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:12:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161350

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The oe.qa.add_message() method is not available in Honister, use
package_qa_add_message() instead.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index bfaf2577d0..2c8f5338e5 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -945,7 +945,7 @@ def package_qa_check_empty_dirs(pkg, d, messages):
             recommendation = (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:' + dir) or
                               "but it is expected to be empty")
             msg = "%s installs files in %s, %s" % (pkg, dir, recommendation)
-            oe.qa.add_message(messages, "empty-dirs", msg)
+            package_qa_add_message(messages, "empty-dirs", msg)
 
 def package_qa_check_encoding(keys, encode, d):
     def check_encoding(key, enc):
-- 
2.34.1


