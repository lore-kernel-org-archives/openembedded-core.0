Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A79C2BBCA
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:35 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.64038.1718936250815514126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L5Kse1eF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936251; x=1750472251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AHjjeEAjvYENwYS8fN/rpEJwfQwYmLuk5V0r7pfmlpQ=;
  b=L5Kse1eFqMM3B8tn/fAg1WTwzalCnZCASXp8G/PICzEKnwoYz/Fz18hD
   R1vJ6wryJomeMUw6ohL3BQKGy9V8eh6bK50gYJQ+pWNXmw1HdO1gQa8lg
   1fw0C7krCqiP6ratCnsu4hf0ea+56HDBPnRsiN5Hxx60d0Z53ThHum59r
   A7I2Ij6ojixK7nEz8qqdF8drLXxgFuBnsng7kUWCFrozrmGSglLTa+oUV
   r9cVBbrm1czbYbLXIFjpyDnom0EkGH8pCIC8kyPXqArMgm57Hm1XKp2yL
   UzVwRlbenH1PnRinlrNxEuRH9TxeBJu7BmAxRZbhJXvFb6YlG1m+wB8fI
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="164461636"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="164461636"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:16 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E249E8524
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 79C04F87F
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 06CA0E5185
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AD5CB1A000C;
	Fri, 21 Jun 2024 10:17:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/22] glib-networking: upgrade 2.78.1 -> 2.80.0
Date: Fri, 21 Jun 2024 10:16:35 +0800
Message-Id: <1718936206-8080-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--5.587300-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrbpssx16kzTfVbZFdXapsKT3X
	2kPRsjbBOuzeNmOGKnP6fEJuh+eMT9cOEThaK0bGqhcdnP91eXFiMNd0z/HZU/4DDXoaCqk7wMM
	U7J9V4674cVSLKz6QAA3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbbW9n
	uzdghUMiSH5UTgKhB3DXWbDjwr3ew/VXLUB5a3vzyjd/AizytBl9q75JzWJRMvfU/riSJXkYuVC
	Dz2gMcK4vM1YF6AJbbCCfuIMF6xLSAHAopEd76vnvVv81kN1LqM9YY6sq/LDbs198h5sWgN1nel
	YO7MFnPhbRVGnoJ2Iw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200988

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Mark plugin functions as exports on Windows
- Updated translations
- GnuTLS: fix improper use of IP address in SNI extension
- GnuTLS: major performance improvement: reduce unnecessary trust list creation
- OpenSSL: properly handle BIO_CTRL_EOF
- GnuTLS: Add warning when system has no trusted certificates
- OpenSSL: Fix bug when populating trust store
- Fix license on dtls-connection.c test

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


