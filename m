Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AC0C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:00:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.40666.1681117251319271937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NuOn7Lzh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117249; i=@fujitsu.com;
	bh=x1LI+I/P4efLtskbc+okv7CCSfAAFE/frQVsEP/MJA4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NuOn7Lzhso6EL/ZEXm+LMYLpZptSTlCyxQSKkIw60pMyFQRqNaR9FPPv1vLun/rPC
	 X33e0ZcwY6yaj21u7LYXEM962JPWri/30V/D5zK4otgfIBApikqqPFLbEVN6L0L6r/
	 W8Jurs/CRXy/13Lx60j0XBJ76EatLsOauq8+cExPBQ5qFn6X9kuBjYnpFxJY80G14U
	 AdDCuhyUpDzpgtIczmj/jj3KBV+RWkbt6XUemAgpYk9pamI3WrmHn5j8t8ZapU8E0H
	 AOEEA8NsRgqSWIUZgJ+vrkGCxnyGPpZXlLpEkm/HP2VKBFRdI01QuEv0o8KVybkXDD
	 mI8xcjL4x21uA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSdfhgnG
  KwclblhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bMs+3sBWsFK361r2ZqYPzI18XIxSEk8JhR
  4trhw+wQzjUmiRkbtzJBOHsYJfrvvWDsYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhASuJY1N+MYPYLAKqEjvOPWYCsXkFnCSa+16xgNgSAgoSUx6+B6vhFHCW2PJ4LyvISC
  GgmksbzCHKBSVOznzCAjFeQuLgixfMEK2KErMvN0ONqZBonH6ICcJWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRvDi1qCy1SNfQQC+pKDM9oyQ3MTNHL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gy
  NzknRS8vtWQTIzB4U4oT5+9gvNz3V+8QoyQHk5IobxeXcYoQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCV6Ds0A5waLU9NSKtMwcYCTBpCU4eJREeLPOA6V5iwsSc4sz0yFSpxgVpcR5OUASAiCJjN
  I8uDZY9F5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy77TDQFJ7MvBK46a+AFjMBLeZyMQB
  ZXJKIkJJqYHKZbjDhbue65ze/xLnluufEeP7rnC/+5rWUo3FUxZuIt3sKp7b1hYvNmap5y+Co
  50kLlaenY9gm+Lye/EW6e9lBM+cW7vTuMEOhVbxe/BdX2h5skueK3P69WMLryWSuxm0nDt72e
  MM6sSNJcWPMQq57vQw+NsuUzaO++e0zr2Fe2HvKR+GhWuj5xR8ze/Z95+b4rRFdq9NauWfijY
  nLnWdYh1Z5zHBtv7BF4ELj1zL36a+uyV8XOXz5EtP9g4zMerqKU6sv9TyZtk1yAaOHUA9PcDV
  P+uHHl15VmF1XcTxyv6ZiNdfHU2FqkQ8/SD515iqOvmq52HXJylsaU/8lNYnuZbeUU5RsSvo1
  0+S8rxJLcUaioRZzUXEiAHNE57xZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-745.messagelabs.com!1681117248!191138!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29011 invoked from network); 10 Apr 2023 09:00:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-25.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:00:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5B0A51000DB
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:00:48 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4E76E100466
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:00:48 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:00:46 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] man-pages: upgrade 6.03 -> 6.04
Date: Mon, 10 Apr 2023 16:59:35 +0800
Message-ID: <1681117175-24783-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117175-24783-1-git-send-email-wangmy@fujitsu.com>
References: <1681117175-24783-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179857

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 tmp/ -> .tmp/

Changelog:
============
-  Sections:
   -  Add HISTORY.
   -  HISTORY: Restore C89 references.
   -  Repurpose VERSIONS.
   -  Simplify STANDARDS.
   -  SYNOPSIS: Mark several functions as deprecated.

-  Build system:
   -  Support installing in different mandirs
      (e.g., man3typedir='/usr/share/man/man3').
   -  Support installing compressed pages (Z='.gz').
   -  Support installing link pages as symlinks (LINK_PAGES='symlink').

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../man-pages/{man-pages_6.03.bb => man-pages_6.04.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.03.bb => man-pages_6.04.bb} (92%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.03.bb b/meta/recipes-extended/man-pages/man-pages_6.04.bb
similarity index 92%
rename from meta/recipes-extended/man-pages/man-pages_6.03.bb
rename to meta/recipes-extended/man-pages/man-pages_6.04.bb
index bc02597ef7..fee57e3fbd 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.03.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.04.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=0fdad39ebaa973a50785f79f0f59f87f \
+LIC_FILES_CHKSUM = "file://README;md5=5b7d7488344f5af8841dc13aaec49cdf \
                     file://LICENSES/BSD-2-Clause.txt;md5=d0f280d1058e77e66264a9b9e10e6c89 \
                     file://LICENSES/BSD-3-Clause.txt;md5=71f739ef75581cae312e8c711bcdab16 \
                     file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://README;md5=0fdad39ebaa973a50785f79f0f59f87f \
                     "
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "76eca045b42a90dd25d094c46d97ac90187bc0f1bfca358bb5dae5c4337acbb0"
+SRC_URI[sha256sum] = "590623b99bf1f8ee958483c35cc0aaef2363e42998c4d927d1f705890d15d51e"
 
 inherit manpages
 
-- 
2.34.1


