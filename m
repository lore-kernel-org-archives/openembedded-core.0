Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FFBCD1282
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:35:23 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.7815.1711413320798742111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F3dZULxi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413320; x=1742949320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4I68ro3b59a2niHcxxv2hPl2O5achq/MV70qEJmewIM=;
  b=F3dZULxil1uvp1KwiCyAUBrq8ioUupoDhIR0pcDslqeU4djG3HGAim31
   SgTwKY0j9Ph/b5DdNHYeyuTopGNJwUEBzj2zXAbnHqI9t8wiNEKnu1Eee
   0t/FSAtlTKJJpK29knbSd0+2+oSgNcie/+QHidWMi3XZC88OVCMuC9MZj
   RAyIXPKnVxeKi+x2GKlBk+VauzrmfHJQ44nwhDGzxqWGWti/2DCp4TyZv
   /SfdveVm0GDmrBRH4OH1MsPGvV9pI3BJDiC0ckAB77jehXgRH56tEH/Z1
   IPja7DpFDd025BpPPsrfuaucgxjgyReDBj/jk7BifCIbK9DgfabNoyfRi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="141792234"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="141792234"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:35:18 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 36FE7D5A4B
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D367CFBB0
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 04850411BE
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 975761A006A;
	Tue, 26 Mar 2024 08:35:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 06/34] glib-networking: upgrade 2.78.1 -> 2.80.0
Date: Tue, 26 Mar 2024 08:34:24 +0800
Message-Id: <1711413292-3025-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--5.587300-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrbpssx16kzTd4YeSlHZYFoixw
	j0a2VRf3Ea7Vj0YwGjTFxYsKdAAnds8aR23ivgE2HWRJEfGP5nkkXy0US052q0z5vzLEGq8DRLc
	3tR39k3I0IXF7YXZ/Cw3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbbW9n
	uzdghUMiSH5UTgKhB3DXWbDjwr3ew/VXLUB5a3vzyjd/AizytBl9q75JzWJRMvfU/riSJXkSna6
	HXiFYjuWyXEB937q1d5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSkj80Za3RRg8H+UhGlxgCRWXeE/
	jH6G1+aar3vXqi7D8F6pbzW0fvhD7phmB2X9ZH4=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197497

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Mark plugin functions as exports on Windows
- GnuTLS: fix improper use of IP address in SNI extension
- GnuTLS: major performance improvement: reduce unnecessary trust list creation
- OpenSSL: properly handle BIO_CTRL_EOF
- GnuTLS: Add warning when system has no trusted certificates
- OpenSSL: Fix bug when populating trust store
- Fix license on dtls-connection.c test
- Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb} (95%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
similarity index 95%
rename from meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
index 5060d9fd7a..c8a1355548 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "e48f2ddbb049832cbb09230529c5e45daca9f0df0eda325f832f7379859bf09f"
+SRC_URI[archive.sha256sum] = "d8f4f1aab213179ae3351617b59dab5de6bcc9e785021eee178998ebd4bb3acf"
 
 # Upstream note that for the openssl backend, half the tests where this backend don't return
 # the expected error code or don't work as expected so default to gnutls
-- 
2.34.1


