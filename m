Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8579BCD12A1
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.130850.1712646642177723217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pxuBoOPP;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646642; x=1744182642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2o75Ib3ZP0iNo2j+AxWRs/0GM2qfY0PHNt6wd9viJBI=;
  b=pxuBoOPPrZd8noOvTQiTr63cc34j8AsqXaVp+zUMSmRXiu0UtiqWVJgN
   7AkZmeKJG/pZ5bpkZ0UgiwdoPfS+PiObL/iP292IhtXrJXyL3wmFZZjiJ
   BbwrdB2F35xwyDtV1lbklpJzIH4gZXSw+K6KZbs+oIWuCHRu5jqwjRbfE
   5y//FvjaLL4LOSpCJfLX9nwpNISrv/zOM5GyJNkTnYWWT77nuAJ64D/T4
   q6o7uSmeScYgwN+CoV8eixmfa+bN8MgcFoIF4j894WZTHoUppCIWtjyKu
   WF8B6ki2djQhu1+4eWxB7915OB/5GBsJwr2fGxXCviJZ4Z/1n6F4TzZjt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="134320622"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="134320622"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:39 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 58A74E4F1C
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E7D3A55D5
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EC8E20093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C19FB1A0002;
	Tue,  9 Apr 2024 15:10:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/33] ell: upgrade 0.63 -> 0.64
Date: Tue,  9 Apr 2024 15:09:54 +0800
Message-Id: <1712646620-16608-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10--3.222500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuhUWS5fneQuZ/p
	6742jA2BuNK9gpe93N3GKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat0540uNdcZDLqeUhEz
	I3+mkzic42wQxsSRRdLLXqjPvusA15UcZtwNsCroURSScn+QSXpjDMT0TyDk5+gtHj7OwNO2i5u
	/VvsFaHavPABz80d1XiSk5FxmldUwoPG5j0yj/MJ4OJfko7reo95Q4vaVEkQOrR0i8zRpmN1wXV
	thdCCZj1tKpM+GAZU57Va/UOrUG5/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198025

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix issue with casting in C++ environment.
-Fix issue with ASCII string upper and lower helpers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.63.bb => ell_0.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.63.bb => ell_0.64.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.63.bb b/meta/recipes-core/ell/ell_0.64.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.63.bb
rename to meta/recipes-core/ell/ell_0.64.bb
index 7ecb63a478..c4f16905fd 100644
--- a/meta/recipes-core/ell/ell_0.63.bb
+++ b/meta/recipes-core/ell/ell_0.64.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7397c76996d7646b9917ebf016cd67586b10166295af2e0e18cdb5b8f6659965"
+SRC_URI[sha256sum] = "760f3901078409f66cadf1bb24c8bdc60f13d53f6dd66b88631221d2494f8405"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.34.1


