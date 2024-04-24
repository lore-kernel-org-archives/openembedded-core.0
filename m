Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B58C07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:03 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11785.1713948182732649807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HQt2lNaI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948183; x=1745484183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tFjDjMTKqhAnl+JtuWFQNglb6PIiiahW1eOHmC/vgZs=;
  b=HQt2lNaIo07DONB321FT/kjY9OX3qGR+uAN9ds1oDQsGSrv5mcFr01N4
   7OhvKL2mdU4gZxH1W8mJwLAVZK5EKqW9nYc5B2NwcKPE93kjx8OVPShXJ
   bHjtHoE/loaaDyxe/tkOoHatB48OmBYtdU17bUZ0ZzVTksx6n1OZqJlnn
   B8PtXw1US/JCFGhcGDrmRgQ8IEguMPba2kNqD5nG1lrks2aEmYOKUcvAO
   cToqdC3ocomShiHlbKml0dhFNmYFEq5rSKhx4W9p717F95woYaKZx1EFP
   SJAnPH8ol2tfA3TobfN/S2tCjkWqGmNma32qP5LnmS5rLeyqPv2Z756GI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="135926026"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="135926026"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:01 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C4207D9DC1
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 08098D52E9
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A062921BEA2
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4CF321A000B;
	Wed, 24 Apr 2024 16:42:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/38] libxmlb: upgrade 0.3.17 -> 0.3.18
Date: Wed, 24 Apr 2024 16:42:06 +0800
Message-Id: <1713948152-13501-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--3.354800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbys6FHRWx2FGsMYH
	4yY++5Kb4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2Uz5vzLEGq8DRbN
	5XR1zwhzrjPebt7kkbDKHYLsR4q0LHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w4McJ
	HJUgqOQwzCZ2Kxr0FtfdOj+2Oh9DtCMN30fNq96PXhY4hGIipB0f0AnLn8BfjlZXjJNqhB7tohs
	Wsyiap9zXDOWkJpHS+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198656

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix decompressing large zstd files, harder
- Include the pkgconfig variables in the subproject declared dependency

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmlb/{libxmlb_0.3.17.bb => libxmlb_0.3.18.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.17.bb => libxmlb_0.3.18.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.17.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.17.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb
index f403857fea..10ceab0721 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.17.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "db54f1b3254334e59b29b01b6cb666f444746594"
+SRCREV = "59cf2e0bf3c4d0905a32e32828d6100784993621"
 S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 xz zstd"
-- 
2.34.1


