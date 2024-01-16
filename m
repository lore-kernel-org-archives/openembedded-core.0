Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74183C4707B
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 02:08:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.1908.1705370896897660667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 18:08:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="146070412"
X-IronPort-AV: E=Sophos;i="6.04,197,1695654000"; 
   d="scan'208";a="146070412"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 11:08:13 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C336813EE5
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:08:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id F2753D5403
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:08:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E18323E1AE
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:08:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2902C1A015E;
	Tue, 16 Jan 2024 10:08:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Jiang Kai <jiangkai@fujitsu.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsecret: upgrade 0.21.1 -> 0.21.2
Date: Tue, 16 Jan 2024 10:06:39 +0800
Message-Id: <1705370800-31004-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1705370800-31004-1-git-send-email-wangmy@fujitsu.com>
References: <1705370800-31004-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28122.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28122.004
X-TMASE-Result: 10--3.218900-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTEFC0zV7bKQSdCEp3KAaL3w6
	H06bMgivtmLPJX0pMNL+3sFy+Fq0iI2Smdh5c55KIBYc5Hfv4BNs3+MSf57rOZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3Q0D4MTphfBOkphWnlDPb3mS3eeptbp46em2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAU8KZgcjBVAOnVpeTawS8fbSJPq
	BM4dH4W5rtcllS31hDzz/thGw8OhCnx7+ytohiHBoTa8kDPWWwCp2wIqC+a1QUQ6pDsiYYD7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 02:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193813

From: Jiang Kai <jiangkai@fujitsu.com>

Changelog:
============
 * Support GnuTLS as an alternative crypto backend
 * Fix LeakSanitizer issues
 * secret-tool: Verify that the parsed stdin password is vaild UTF-8
 * Fix markup syntax for SecretSchema
 * Public secret_attributes_validate method
 * Updated translations

Signed-off-by: Jiang Kai <jiangkai@fujitsu.com>
Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsecret/{libsecret_0.21.1.bb => libsecret_0.21.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.1.bb => libsecret_0.21.2.bb} (91%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb
similarity index 91%
rename from meta/recipes-gnome/libsecret/libsecret_0.21.1.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.2.bb
index f762d7c343..2d8ea952c5 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb
@@ -13,7 +13,7 @@ inherit gnomebase gi-docgen vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-SRC_URI[archive.sha256sum] = "674f51323a5f74e4cb7e3277da68b5afddd333eca25bc9fd2d820a92972f90b1"
+SRC_URI[archive.sha256sum] = "e4a341496a0815e64c8d3b8fabab33d7bae7efdeab77b843669731d5b181dcee"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.34.1


