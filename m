Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACB9CA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 04:17:34 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.web11.13356.1693541847879277901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 21:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=Cg7wXwZc;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=735; q=dns/txt; s=iport;
  t=1693541847; x=1694751447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3WdGbR9lQPEwUiHnT84skpNsqVeweesuzYwfudcrN/I=;
  b=Cg7wXwZc7b0zAS61WL9dQtLBzN3ZyGC7OIa6xpOwFnOq9eDw/+kdLOpv
   dCkSlRmdXcHcr+dJ/MiH+0SAOuen8GwyyL0xCKJWPD4WXBlTJ0RZSsaHu
   XkgqydWta7FkXkOPU8o2dz7P2elVAl032631X3dtGR22YOJR1n0NlzGHm
   M=;
X-IronPort-AV: E=Sophos;i="6.02,218,1688428800"; 
   d="scan'208";a="109139643"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 04:17:27 +0000
Received: from sjc-ads-3781.cisco.com (sjc-ads-3781.cisco.com [171.68.250.228])
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 3814HQSa028333
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 1 Sep 2023 04:17:26 GMT
Received: by sjc-ads-3781.cisco.com (Postfix, from userid 1820939)
	id 527ADCC1293; Thu, 31 Aug 2023 21:17:26 -0700 (PDT)
From: Dhairya Nagodra <dnagodra@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Qi.Chen@windriver.com, xe-linux-external@cisco.com,
        Dhairya Nagodra <dnagodra@cisco.com>
Subject: [kirkstone] [PATCH] flex: Exclude CVE-2015-1773 from cve-check.
Date: Thu, 31 Aug 2023 21:17:20 -0700
Message-Id: <20230901041720.729654-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.250.228, sjc-ads-3781.cisco.com
X-Outbound-Node: rcdn-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 04:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186991

Issue only affects Apache.

Signe-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index c7cd965347..266507d7ac 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -33,6 +33,9 @@ UPSTREAM_CHECK_REGEX = "flex-(?P<pver>\d+(\.\d+)+)\.tar"
 # https://github.com/westes/flex/issues/414
 CVE_CHECK_IGNORE += "CVE-2019-6293"
 
+# Issue only affects Apache vendor, not us.
+CVE_CHECK_IGNORE += "CVE-2015-1773"
+
 inherit autotools gettext texinfo ptest
 
 M4 = "${bindir}/m4"
-- 
2.35.6


