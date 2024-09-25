Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480D6C369A1
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.9328.1727246991269165170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B6VZQHqj;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246993; x=1758782993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4YkVzM0FMHfU7SjBUFEzulucmORcJlPEkNbq6GVbmaU=;
  b=B6VZQHqjXOnmqsVKFdjB3BJovMyg8oRnW054/78T5nMy8a8F4O77hm6X
   wVKZFo0BYHWQ+D6b6ORSusagyCgo6kGOrGOvZ0sfj0XoD1o+NQ9xLzO3W
   vz3kyu72U7Scm2qogz8PtMxvmE0iXjr8L5OGRCy8g/rADZ3VgOZrm4glz
   2rVmUwAlluYxKgrx13h+9iBF2sCtV7TOVcki6xL1oNvyhCiS7vSPp72fu
   fJA61u9/YljO0mOtPO+aFAXDsBXQLMpM1FvJuf9Lpe2LaLjU5pAfSJ6qQ
   0gwtk4M2BAmE67YW6KyJgdeVcneTi2ji2RlNx0k2mfH9RWpU6Bic0Mvyd
   Q==;
X-CSE-ConnectionGUID: VQXHTdp3SvCfdMWKZVlPZw==
X-CSE-MsgGUID: 6m8H1kjyQwyVPdETzgn7MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="162724311"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="162724311"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:52 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6891DE8525
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B5EE21036D
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5607620086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 063E01A000A;
	Wed, 25 Sep 2024 14:49:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 45/47] vte: upgrade 0.76.3 -> 0.78.0
Date: Wed, 25 Sep 2024 14:49:18 +0800
Message-Id: <1727246960-20665-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--5.066500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2uD0fiPNa0yFqZY4PxfRMWEfOaYwP8dcX7Ij3ZumgJuKOjMOEZ5AL0SFFy
	os4QuK8MxIkWFjNFcbnqUwDIlKjKMkfRhdidsajMURSScn+QSXpjDMT0TyDk5+gtHj7OwNO3Ix3
	Icp6zuW3WGEYvVll37upX3Avqi7LhS8PBm+TnV7UywB/aEbnIk
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204938

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/vte/{vte_0.76.3.bb => vte_0.78.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.76.3.bb => vte_0.78.0.bb} (96%)

diff --git a/meta/recipes-support/vte/vte_0.76.3.bb b/meta/recipes-support/vte/vte_0.78.0.bb
similarity index 96%
rename from meta/recipes-support/vte/vte_0.76.3.bb
rename to meta/recipes-support/vte/vte_0.78.0.bb
index 515ff228fd..8c9292e8a7 100644
--- a/meta/recipes-support/vte/vte_0.76.3.bb
+++ b/meta/recipes-support/vte/vte_0.78.0.bb
@@ -19,7 +19,7 @@ GIDOCGEN_MESON_OPTION = "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "f678e94c056f377fd0021214adff5450cb172e9a08b160911181ddff7b7d5d60"
+SRC_URI[archive.sha256sum] = "07f09c6228a8bb3c1599dd0f5a6ec797b30d3010c3ac91cf21b69d9635dfaf7c"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.34.1


