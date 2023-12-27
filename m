Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2838EC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 13:06:31 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.100663.1703682384188772980
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 05:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="132408176"
X-IronPort-AV: E=Sophos;i="6.04,309,1695654000"; 
   d="scan'208";a="132408176"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 22:06:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E916DD2A02
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:06:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D9C0D88A1
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:06:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AA64C202C337C
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:06:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 68A031A006F;
	Wed, 27 Dec 2023 21:06:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iputils: upgrade 20221126 -> 20231222
Date: Wed, 27 Dec 2023 21:06:10 +0800
Message-Id: <1703682370-23960-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28082.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28082.007
X-TMASE-Result: 10--0.514600-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu6BUPBkQtT6+S9
	slBM8vbu88cLohcr5LAfwHlbPs+pPQjdAxZ9icLjoHDoEp2TszF6AgcdfYvhjNGMGYFaxr1ELFf
	B31LZcaHgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq6RY0
	JyfRdA4t6Ap/+vpvjqModguxHirQsfE8yM4pjsD7q9UFRTJ0kKxEHRux+uk8hxKpvEGAbTDhA44
	4EYbI/quNc6QqmXb2yvpe/ktmD4lSQbozVj/FyWBkZEX/J7O7vgzzgVqjSIlguVNLhXmmpffQ5B
	+DNMFDMZES4kekj0l4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 13:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192944

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix: Properly fix -Wpedantic warnings
- fix: Set ppoll timeout minimum to 1ms
  #459)
- fix: Revert "ping: use random value for the identifier field" to use PID
  again
- fix: Fix support for DSCP (Traffic Class, option -Q)
- fix: Fix the errno handling for strtod
- fix: Drop redundant setsockopt(IPV6_TCLASS) call
- fix: Fix overflow on negative -i
- fix: Fix sporadically missing DNS record on targets with multiple IP
  addresses
- fix: Handle interval correctly in the first second after booting
- fix: Fix presentation of IPv6 addresses with no reverse DNS
- fix: Add missing whitespace in IPv6 output
- fix: Allow to localize help
- fix: Use print target when empty ai_canonname
- fix: Restore the MTU probing behavior")

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iputils/{iputils_20221126.bb => iputils_20231222.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/iputils/{iputils_20221126.bb => iputils_20231222.bb} (97%)

diff --git a/meta/recipes-extended/iputils/iputils_20221126.bb b/meta/recipes-extended/iputils/iputils_20231222.bb
similarity index 97%
rename from meta/recipes-extended/iputils/iputils_20221126.bb
rename to meta/recipes-extended/iputils/iputils_20231222.bb
index 7d94271a64..e919febd12 100644
--- a/meta/recipes-extended/iputils/iputils_20221126.bb
+++ b/meta/recipes-extended/iputils/iputils_20231222.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=627cc07ec86a45951d43e30658bbd819"
 DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https"
-SRCREV = "5ffabc4190cab975c7332645259e286a032e183b"
+SRCREV = "84cdf26908b4a03b917a5429a6339b7374fcc38b"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


