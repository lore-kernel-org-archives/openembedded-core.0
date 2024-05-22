Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563ABC25B7E
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:15:19 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.5633.1716369314070705257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L/5qw88/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369313; x=1747905313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lPfbFyongdeklSg8wJ/GNHx6Zcl6l0SEptLIKkEXKrA=;
  b=L/5qw88/BOImhCTrptp9yEh5WQrmkQOIi7x8lOjvWKceGgrtmzPz9g00
   HCFDE0Z2b1Gs5x9OWnWnF6VATozujij4nqe/DEGRpCddchruY+2QedgFJ
   Y4di+39bwvTRgUlBp+fC2uGQihCI51eEwAh0RVLXdjKZXUyINm/j/+Egq
   tbzB7SH8klxJem4rMpUmSH+3oDB2fKoz81o40C3ss8Q7CHvvhaf2bTb27
   6AG540Y+WCJHJXKfqLeqhqiarE4f1BH1DnMZvfytV3obeTBx5Mej47Eea
   dHNQVCRnNoeQWp7Yw2Eedvpr7eBod5UoE/A2jYoPBIvYniCxIwOx3qGhU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="159133724"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="159133724"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:11 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 081EDCC145
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D77CBDCA7
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C9D7720097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 75DE21A000C;
	Wed, 22 May 2024 17:15:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/42] diffoscope: upgrade 265 -> 267
Date: Wed, 22 May 2024 17:14:13 +0800
Message-Id: <1716369289-22526-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-0.373200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9dJrVu3Tf6nFyto
	LhrEPTMhepwUk+Mcqyw2FOu8TRgi0nhUwQ4fZ/BMqhcdnP91eXHWN3XQ/7wsT6vWBS71/UX/03c
	D0WOiAZngK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJZjm/42WWfFCgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq1K7g/Z97wyTWZ+RUbWOfJKi6DfMqUDzfdVJ20Ca0uIgd7kI
	LEh6BasVPQoaVNe77Mhzar1B3cQDnVkS1AfHPyRw2ZsNFs90NEdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199701

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Use "xz --list" to supplement the output when comparing .xz archives;
  essential when some underlying metadata differs.
* Actually append the xz --list after the container differences, as it
  simplifies tests and the output.
* Add 7zip to <!nocheck> Build-Depends in debian/control.
* Update copyright years.
* Maintain an in-header boolean state to determine whether to drop
  from-file/to-file lines. This fixes an issue where HTML differences were
  being inadvertendly neglected.
* Include "xz --verbose --verbose" (ie. double --verbose) output, not just
  the single --verbose.
* Only include "xz --list" output if the xz has no other differences.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_265.bb => diffoscope_267.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_265.bb => diffoscope_267.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_265.bb b/meta/recipes-support/diffoscope/diffoscope_267.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_265.bb
rename to meta/recipes-support/diffoscope/diffoscope_267.bb
index 6af5abc974..69bad508cd 100644
--- a/meta/recipes-support/diffoscope/diffoscope_265.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_267.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7bdcbd7fc5bc4c821bf6ab5ffbbeb265103b04e6908ea4bb12144d7e5ca002ff"
+SRC_URI[sha256sum] = "c0a807aa66e18eae88c1adca28988675c9749d3ad1a8db3d2eb7e2afb8763568"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.34.1


