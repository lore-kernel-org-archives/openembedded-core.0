Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B908D5A6C2
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.35689.1732584622380944217
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BUOnpVQT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584623; x=1764120623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=h14s5H2Vjyw9hL9Gp2mVshC5PchgKKdRU9bDAvc20mU=;
  b=BUOnpVQTdSqtQDQAM5vEv7eDKdHmu501Rl6CZS/jqSQ+KJ2v7z8PR6ix
   TOIw7pp3Oq9/WQHG10uzvzbcnJMEi3agBtW67kt1nLt/rC7OB9mUpmucH
   EfeVQmPiBq+ghU2P2oLdbMX1D4QJ5cQkNKLXz9gpldvIdApL3Enr78BWj
   2qEWwJMNbf1LWAtRcECwJ0lPFI4ZCYtC9Vy8AnVQ6Tq3wxuyIkx+paO6Z
   wuj7GkgrZYYGMi7w76NHKfn/0ZWYn9DxOIihodt7Y8x+H0RxZ65S+VoaA
   l+zG1JUM8+Anslt4kZwa/PHZgR9H1eTPtmaPHpdf0omiEk6HhUAef++v0
   w==;
X-CSE-ConnectionGUID: csZPRBFHSySliswrqyRrxQ==
X-CSE-MsgGUID: VA4c7QXLSE+IZPP2+hahkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="181644815"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="181644815"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:21 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3702EE8525
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C5948D19CF
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F6AB2007B73D
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0CDF41A006C;
	Tue, 26 Nov 2024 09:30:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/16] ofono: upgrade 2.12 -> 2.13
Date: Tue, 26 Nov 2024 09:29:55 +0800
Message-Id: <1732584602-4785-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.003
X-TMASE-Result: 10--3.607800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxw1jWU+BK7kmlF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74Aejl8XURi8fGnUsFdofYzqo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIQu2WoEoruGsjCaCz9zGCLc1hUsbt3ix+fRn
	0TBjkstY1W1HsRsmplAbuCwZba1XtXnc85mKsEsftgHy7y5TZU0lvu9uh80Qz+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207816

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add support for handling QMI PIN and Lock methods.
- Add support for handling QMI WWAN interfaces.
- Add support for handling RMNet interfaces.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-connectivity/ofono/{ofono_2.12.bb => ofono_2.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.12.bb => ofono_2.13.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.12.bb b/meta/recipes-connectivity/ofono/ofono_2.13.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.12.bb
rename to meta/recipes-connectivity/ofono/ofono_2.13.bb
index cb1f4742c9..2cc59b5c5a 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.12.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.13.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
 "
-SRC_URI[sha256sum] = "0de08f969c063bc0ca2a6f7fc346c09bab9ef057d26f32eaf6aac2a2a4eac9eb"
+SRC_URI[sha256sum] = "fa813ed74a4658e5702f707033497bf891504ffdc0f1b45d85bc3f092010744f"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.34.1


