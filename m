Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D68C52D6F
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.46590.1722215425506508167
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iaL8VFFJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215426; x=1753751426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EO09qOCEDTC/v3jLa+i8mUyAOOQl7ksRZei5HogFrh8=;
  b=iaL8VFFJWLkxWr+1hcJpkUu/MlKpFmlxcPlWclOaQBWDe9R07MaiP2xE
   w8J2e3FKBycEou/Fsl9tyhYoDCE/LCLRL/stXFflBCUdH16FnNn8TD+AG
   ulcXDtmN6dN2fAPBf/xAMeU0Ju5+hBlSUHIV1+1x0sM/b2SkOTOAKDg2d
   NbBZL0lCfGM7GdA3jbACKRy2f9EMvWxtuNOHYaaU3wbKvIwVUfXUkiNvc
   HLURfatuxVMwdyfQzkvLzUy+dYTQUlvRjJ/mU+3Y6tEMCPBw2WRmb0Xbl
   hrZpmFG3nXRDg5Ce+h99sxsifWYX/k5y+GOSXa9aq/R8yKlShSxk3lM6q
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="170816514"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="170816514"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:23 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D5E60D5A47
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BEF9D5084
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A7420E2060
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D0A41A0002;
	Mon, 29 Jul 2024 09:10:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/33] libnl: upgrade 3.9.0 -> 3.10.0
Date: Mon, 29 Jul 2024 09:09:41 +0800
Message-Id: <1722215408-27541-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10--4.038200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2tLC42PB7KOrbNdVHptfHl6EzEoOqAAVLP4qCLIu0mtILkSP9NNISXxjaf
	cJWbTILni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFAj9+202DngAo/UE///6C5iyww
	qVSQ82LWD/H4C3K+DmQN76rdKXcm5R+M7ba6oDCh3W1gShU0U/DeXGZDlEglZKhQbLdqA5c+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202580

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libnl/{libnl_3.9.0.bb => libnl_3.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libnl/{libnl_3.9.0.bb => libnl_3.10.0.bb} (96%)

diff --git a/meta/recipes-support/libnl/libnl_3.9.0.bb b/meta/recipes-support/libnl/libnl_3.10.0.bb
similarity index 96%
rename from meta/recipes-support/libnl/libnl_3.9.0.bb
rename to meta/recipes-support/libnl/libnl_3.10.0.bb
index b2825374cf..4691c6554f 100644
--- a/meta/recipes-support/libnl/libnl_3.9.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.10.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')}
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "aed507004d728a5cf11eab48ca4bf9e6e1874444e33939b9d3dfed25018ee9bb"
+SRC_URI[sha256sum] = "49b3e2235fdb58f5910bbb3ed0de8143b71ffc220571540502eb6c2471f204f5"
 
 GITHUB_BASE_URI = "https://github.com/thom311/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/libnl(?P<pver>.+)"
-- 
2.34.1


