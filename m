Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3652FC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:08:59 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.10782.1710313731917169048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ALzlija2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313734; x=1741849734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0aFbt/ZXYT3nAmmC5EJZBAxsygMC+gukeVeZoq6kPQk=;
  b=ALzlija2UcjEJdBxEh1rUqUYRbYpb5LQSKTum1oP08Yyc26y5oYBtBOz
   NXG4+ZOxXprTGsi6uaHL5fcb0sVCh+y2Q7ZB60Q3wk282KcggAFSOx4rQ
   qiVqqkqm/bf0wXgAFkuTmriyIK7aj7tRFLGpPw0MyEEiNYIRxQgKzl9v/
   TqMbNRucT9nUh85NMVWdZ2TPkCZMMOfOizceQAHFlNoedU8a2Y5FGfvbM
   uXkV2uzAfHoW7xsZG9qA520FwWx52neZFLB2YFUSAi2W1SuYbpJhD7eCB
   Yx65+xNHigSp/KE3OZN+aTBT3CMWxZ9b49LmN8TNF2x8PuzjKI+D3pC33
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="151987802"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="151987802"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:08:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 49331F2545
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 500E1D620A
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E02E120097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7E27B1A006B;
	Wed, 13 Mar 2024 15:08:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/36] diffoscope: upgrade 259 -> 260
Date: Wed, 13 Mar 2024 15:08:00 +0800
Message-Id: <1710313714-12541-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--0.108400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrWmOfr3aLpwhM+b8yxBqvA5WI
	He6lXpDNUpd9fEj7LqLVeptTRKjYpRLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7v0LMVKXbDRbVijUdnqQBWkfRhdidsajMURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2eVW
	/ZdL52j9sSNRlDsQXsqlnZbvouZRWU96p2xqkmwXKM6KFQukp3/zBykmpdtRirYL0Bh/TUZsZOK
	NWZzP7VFB2SlaNT8q7u78oVJ18wfPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197004

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Actually test 7z support in the test_7z set of tests, not the lz4
  functionality.
* In addition, correctly check for the 7z binary being available
  (and not lz4) when testing 7z.
* Prevent a traceback when comparing a contentful .pyc file with an
  empty one.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_259.bb => diffoscope_260.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_259.bb => diffoscope_260.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_259.bb b/meta/recipes-support/diffoscope/diffoscope_260.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_259.bb
rename to meta/recipes-support/diffoscope/diffoscope_260.bb
index eca2c208fc..297a53fb53 100644
--- a/meta/recipes-support/diffoscope/diffoscope_259.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_260.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c1f14452467f84c4be804a3725cbfdd5eadf977ece7ad463be8b647d1a87fb42"
+SRC_URI[sha256sum] = "405a55502c8b2c988e46c0800d6a93e8e4e7632c1542b0a540dda50aeea41dac"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.34.1


