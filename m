Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377A9C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:08:59 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.10782.1710313731917169048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dg3w4cAb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313732; x=1741849732;
  h=from:to:cc:subject:date:message-id;
  bh=091B5a1HiqArzGaCVu5vfOteOq9vXhIZa+CNeDF1Fcw=;
  b=Dg3w4cAbJdD1mWiV/WiA4lfllewr2TNThar/NARXfyhawF6BvmLeryUx
   Kn6GGNh+YBYPEy7Nk0/xanqxH9IHjNzNLVzqg62ywRJ7LrJuhJLfMjyZ8
   U+oWUYwXMzU4ohECkGb1HwJKnCsZLl6cgIE9UPqoKkLhpX267yfEPb6Ea
   dAVWn1jTfZIGZZQoDdsV5PQostjWUsurSHnhjMqYe/N5/Fh/x02RugOH2
   eB0E5WALicfbkVKpPyg5bOSuMqDrKR4I03vvvFkUlww1wynZgDqVF6C3P
   WXnR9X1I0ePg50Bjx6Ki90clNFRMUSGqfp1JZGmEbjrOsWjkNU9K5a8r9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="151987795"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="151987795"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:08:50 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BDDED9F03
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 59A78CFAAD
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E1D4321BD41
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8F0161A006B;
	Wed, 13 Mar 2024 15:08:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/36] debianutils: upgrade 5.16 -> 5.17
Date: Wed, 13 Mar 2024 15:07:59 +0800
Message-Id: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--2.984700-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrgbNN0R684zMOabErRKSRvazD
	XpqeRKldraob308tFzfuAEy53Y4tLrmvMSppeWbNOWUWxTQJdI8xXH/dlhvLv3iz+9SmHO6K/hB
	H/uhQMnLgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq6RY0
	JyfRdA4t6Ap/+vpvjqLmth8cTQ473lRxm3A2wKuhRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07Rf2u
	kFm4ENtMAJ+v3A7qvVmj5gfFFmlWeMnJSdaOrf9W9kLMWVNtTpVLn4GbD61w9NNseLXY3xeaAa7
	sXp/sAprjxVkEXreyqOb2oxiEAhB8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197003

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* run-parts.c: Forward last exit code to preserve exit status.
* d/tests/control: Add run-parts.test to autopkgtests.
* d/tests/run-parts.test: Move run-parts testing here and add testing for
  the --exit-on-error option.
* d/tests/smoke: Remove duplicate run-parts testing.
* acinclude.m4: Bump DEBIANUTILS_VERSION from 5.14 to 5.17.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../debianutils/{debianutils_5.16.bb => debianutils_5.17.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.16.bb => debianutils_5.17.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.16.bb b/meta/recipes-support/debianutils/debianutils_5.17.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.16.bb
rename to meta/recipes-support/debianutils/debianutils_5.17.bb
index ec629d8b73..c5f25bae40 100644
--- a/meta/recipes-support/debianutils/debianutils_5.16.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.17.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "9e0facf19b17b6d090a5dcc8cacb0c16e5ad9f72"
+SRCREV = "baf12e98a02883d1b76081e32f2185ee3497570b"
 
 inherit autotools update-alternatives
 
-- 
2.34.1


