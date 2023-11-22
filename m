Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D64EC61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:00:36 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.15165.1700643634193360494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="128904531"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="128904531"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 18:00:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 709E4DCFC2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:00:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A953DBF4E2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:00:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A5A5C6B820;
	Wed, 22 Nov 2023 18:00:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libgcrypt: upgrade 1.10.2 -> 1.10.3
Date: Wed, 22 Nov 2023 16:59:44 +0800
Message-Id: <1700643584-9452-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.006
X-TMASE-Result: 10--4.861300-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytawy/TWxLyYjBX
	Xb/qS263W/ZTaCS+12+1USJQizyWkSJcv5X7ObmJlUgQqGVMqmyOVGny5q72hq73LMce7RmJtY4
	N1nU8OYReMWIPhySouh597JwSbG5wU1TNMsgdFFsD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpijeb9I4dYb9u0+ZONdwr5U89RYc4PMoSFTEFC0zV7bKSCeFKWYgeeGZ6ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSdET58jp62SRJ4VNqZTLXEsj1J0QS0ofGAwfLnvkdTJnu34
	rFqS0kMONudq1720QPq3YTvw2yCzKswYC+aXWA8PTF01CP4gkEWr1q0o4u8eS7+RMq/2CK6rA4c
	7UV2fQpvi2PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191029

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix public key computation for other EdDSA curves.
- Remove out of core handler diagnostic in FIPS mode.
- Check that the digest size is not zero in gcry_pk_sign_md and
  gcry_pk_verify_md.
- Make store an s-exp with \0 is considered to be binary.
- Various constant-time improvements.
- Use getrandom call only when supported by the platform.
- Change the default for --with-libtool-modification to never.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgcrypt/{libgcrypt_1.10.2.bb => libgcrypt_1.10.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.2.bb => libgcrypt_1.10.3.bb} (96%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
similarity index 96%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
index 524b06ca22..1c4f4d6038 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
@@ -27,7 +27,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "3b9c02a004b68c256add99701de00b383accccf37177e0d6c58289664cce0c03"
+SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
 
 CVE_STATUS[CVE-2018-12433] = "disputed: CVE is disputed and not affecting crypto libraries for any distro."
 CVE_STATUS[CVE-2018-12438] = "disputed: CVE is disputed and not affecting crypto libraries for any distro."
-- 
2.34.1


