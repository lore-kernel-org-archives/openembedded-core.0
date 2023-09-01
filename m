Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E29CA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 04:19:53 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web10.13496.1693541986347736250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 21:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=GJ28ZQWT;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=742; q=dns/txt; s=iport;
  t=1693541986; x=1694751586;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9bnvtewBibgClB9X8ggQm7kaAzxuGGoupPcRrKITc8M=;
  b=GJ28ZQWTgnRt4FNLwIylclLWarg3he1/qNTJgfXFHBYmd8JOb9IXVHCi
   Jva8I+Yg63dwR+ozb3h0xuiftf4t+l4pdcjHEhj0HkKUoo0bBHv34B8ZL
   18DovS7pIdgiDlRcw1MiL8Q78xQ0wG0niuY45vlEojeV3011NPsIj1wfK
   I=;
X-CSE-ConnectionGUID: /ZfBI+uASUG++Urhf5Zj6A==
X-CSE-MsgGUID: r7YPis8kS6OPM0zkTuA8Cw==
X-IronPort-AV: E=Sophos;i="6.02,218,1688428800"; 
   d="scan'208";a="153738633"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by alln-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 04:19:45 +0000
Received: from sjc-ads-3781.cisco.com (sjc-ads-3781.cisco.com [171.68.250.228])
	by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 3814Jj8F027842
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 1 Sep 2023 04:19:45 GMT
Received: by sjc-ads-3781.cisco.com (Postfix, from userid 1820939)
	id DD329CC1293; Thu, 31 Aug 2023 21:19:44 -0700 (PDT)
From: Dhairya Nagodra <dnagodra@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Qi.Chen@windriver.com, xe-linux-external@cisco.com,
        Dhairya Nagodra <dnagodra@cisco.com>
Subject: [dunfell] [PATCH] flex: Exclude CVE-2015-1773 from cve-check.
Date: Thu, 31 Aug 2023 21:19:38 -0700
Message-Id: <20230901041938.730468-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.250.228, sjc-ads-3781.cisco.com
X-Outbound-Node: rcdn-core-7.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 04:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186993

Issue only affects Apache.

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 50d3bf8de1..7eb7da355f 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -31,6 +31,9 @@ UPSTREAM_CHECK_REGEX = "flex-(?P<pver>\d+(\.\d+)+)\.tar"
 # https://github.com/westes/flex/issues/414
 CVE_CHECK_WHITELIST += "CVE-2019-6293"
 
+# Issue only affects Apache vendor, not us.
+CVE_CHECK_WHITELIST += "CVE-2015-1773"
+
 inherit autotools gettext texinfo ptest
 
 M4 = "${bindir}/m4"
-- 
2.35.6


