Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0DDC2D0CF
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:36 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.64036.1718936249112223071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L27A00+w;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936250; x=1750472250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HprE3lXr7zK9RXzrgsKlDmg60ajt9NE+bu7DdMAkSCM=;
  b=L27A00+wJe0dfh0hJrMKJ5ENp+AJDjtmfzM2DNAdOksqG3GSuKbsRahx
   JqxLWbZcakgaPpgstw64b/Vs8vrP8pwsmS4JniwatDGBBm1FWvKf+Q306
   +u5QT2KyiWPtszn6H8duzo9hc6GVp6Z+v0o1vm7yq7O2p1LCYDa8/SoBB
   LCDJA5Sp73pgdxVwpZpDJL0tnoLZxkG0B+oEm8AXxWx6hhZ+B9FvBGuFq
   eaUokGl/pjF0Z6pPJaiABpGtl7L69yl308uj/UlblAb+dsnunQiosERbc
   FWjAKBgAHejBSDOSqEkSdWYEOPZ2oR+LW+FV+YR2lGVlQx+TfES7fZP7b
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="164461633"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="164461633"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:15 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A4D6E8D3D
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 80DCAD73C9
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 197F420086E80
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BF64E1A0002;
	Fri, 21 Jun 2024 10:17:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/22] fribidi: upgrade 1.0.14 -> 1.0.15
Date: Fri, 21 Jun 2024 10:16:33 +0800
Message-Id: <1718936206-8080-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--2.681600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwiaDNlRJumzub6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DzndiJkHFMhOuLH9BII+4qzm+
	KJ8jfUt2sUlZjdfgGvIAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSza3KNABdYUTEAr2
	OGlMDxrJOZz2ofav+i+Mr6+TQKobo548qQ4s4NQc5rMJSddFd5er96PFZGcAHo3YgFgS7n3tea/
	Eb0ayULiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200987

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed the bad tarball from 1.0.14 with stall include files.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fribidi/{fribidi_1.0.14.bb => fribidi_1.0.15.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.14.bb => fribidi_1.0.15.bb} (89%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.14.bb b/meta/recipes-support/fribidi/fribidi_1.0.15.bb
similarity index 89%
rename from meta/recipes-support/fribidi/fribidi_1.0.14.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.15.bb
index 51752096de..14d901a530 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.14.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.15.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "76ae204a7027652ac3981b9fa5817c083ba23114340284c58e756b259cd2259a"
+SRC_URI[sha256sum] = "0bbc7ff633bfa208ae32d7e369cf5a7d20d5d2557a0b067c9aa98bcbf9967587"
 
 inherit meson lib_package pkgconfig github-releases
 
-- 
2.34.1


