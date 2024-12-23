Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EDDE7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:22 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.10440.1734945081618580580
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rHvtJ8vx;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945082; x=1766481082;
  h=from:to:cc:subject:date:message-id;
  bh=DhaBVGDYiZUVTKcw6QS+QfX0a3z/QsuI6PcPEtYq8Z0=;
  b=rHvtJ8vxpP1BIy0qJTv6WecA2+l9KOgd6iDhfQ3GR4aNxJkNdFfoHWqh
   Zet7EZ+6gyf896LFtpmGQTqULi7rzuyjFqYEoo/BjknaIf/vZg771TR4m
   rQas2WCZVufyrtOvH2KtVHCl/UyxasU2HehelPK8bSnpTw8v5l1R28g5y
   YrwLbV/wbtD422LHWJg2hAvuMihXW5pvBHcSJes7jKLzUQWBt8maJtF0p
   0zjRQ2Syb2xEVwsFVOu7gvp28p1eIkk44bAOzkct6vlGqo5IrFyDSPt8e
   bit5F7oGI9uCtmvo5pQvpRBVdP3XXFkT1P3shUJ1ZJOXejTBhSuti2d7M
   A==;
X-CSE-ConnectionGUID: XY6cx58/RJmeNSdcgiMZcA==
X-CSE-MsgGUID: Wvs0d2qOQA2WwB/HDiVoEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="164121754"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="164121754"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:20 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 788DADBB80
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B0EFD73BE
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B10E420076D2C
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 30B311A006C;
	Mon, 23 Dec 2024 17:11:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/22] diffoscope: upgrade 283 -> 284
Date: Mon, 23 Dec 2024 17:10:44 +0800
Message-Id: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--3.772800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvNM+b8yxBqvA+z7
	d6pPgEtrB9PyVoIVmOogy4WsMZaXZNGETJv1/WyOP0HVIeixJdA3l2plwgrtWCD1HdXyqDnE6Po
	oNqqZn93i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFKL5LuDTEGg5rtm+1KwH9m7OWp
	4DoGMgE7tJVr4skoawXp0htdkMQQMNAyRWVFsvCyxDjG5Xzsq2+Or182zWNkQwCTDeQ4ruxex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209016

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Simplify tests_quines.py::test_{differences,differences_deb} to use
  assert_diff and not mangle the expected test output.
* Update some tests to support file(1) version 5.46.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_283.bb => diffoscope_284.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_283.bb => diffoscope_284.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_283.bb b/meta/recipes-support/diffoscope/diffoscope_284.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_283.bb
rename to meta/recipes-support/diffoscope/diffoscope_284.bb
index 27aeaaa7b6..77717d4238 100644
--- a/meta/recipes-support/diffoscope/diffoscope_283.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_284.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "0469ff70e1f37b5e96496f5e3c88dbafcf03fafff409a90601ed84febc31c543"
+SRC_URI[sha256sum] = "c672e97ce3e69c229858419e8d368563bb583101a9cfc5eb70e28d441502b1b7"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.43.0


