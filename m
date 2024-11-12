Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB051D12D54
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:15 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.82415.1731403510360650509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IfwRd4+W;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403511; x=1762939511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pt9TrXJJREVzgx5/GCj4cWsF0+jY9Ps1zdevSnsiie4=;
  b=IfwRd4+Wi2ogXyKPnyaK9JSDr1CmDx2OnWpZ2RUdtNl0EGlESvQB0eRJ
   tyGrcuDVYm6jspMXpjliPhXS++c7i6UXWofDhTD53krPNNYuICL0QZP8a
   ZogE8LQcOVavEv7/V6qN7EiojG4ZSUJeZ2DhJox3yTUQtIlx0AQjTGOhO
   JtYrewZCI49x/MLXJcH0OP0wAZhwDeqbqFFTjK5qv+uoOFnxodHmdfj9g
   dv74GVHZwhCIS3tH/+ARyt6jO03c82tnaDG3un/tCfk5e5MPDmiqxuuMi
   43VH/3HMzg/JQ8ArLs4C0wQkEhjDM3gYDwzR2+GP2i02lHMisQzL4rZse
   Q==;
X-CSE-ConnectionGUID: WoZfMh0oQAaU68SYmLeJIg==
X-CSE-MsgGUID: b6ZrnUTUS7qjYuyHiHGwvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180062570"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180062570"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:09 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15968D6EA1
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F85E28CD9
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3671E6BF78
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D92741A000A;
	Tue, 12 Nov 2024 17:25:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/47] libnl: upgrade 3.10.0 -> 3.11.0
Date: Tue, 12 Nov 2024 17:24:11 +0800
Message-Id: <1731403483-21399-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--0.245200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2tLC42PB7KOrbNdVHptfHl6PKN38CLPK0HxuhkRWK22GO0/hFD53GidiMD
	6wB/IizKaDRDqhZrJDPvQCPiy8IEcHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w50Pt
	UN7OClZbacZXxKC0zeJuniAq7z//fP2Juv4tIhkFM72r5PEn/nWXzK53ITIRPaBV+DA7GJ9qs3C
	Gh/id3p76lz+dGBfNKCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207000

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libnl/{libnl_3.10.0.bb => libnl_3.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libnl/{libnl_3.10.0.bb => libnl_3.11.0.bb} (96%)

diff --git a/meta/recipes-support/libnl/libnl_3.10.0.bb b/meta/recipes-support/libnl/libnl_3.11.0.bb
similarity index 96%
rename from meta/recipes-support/libnl/libnl_3.10.0.bb
rename to meta/recipes-support/libnl/libnl_3.11.0.bb
index 441c847a73..26c87dbb1c 100644
--- a/meta/recipes-support/libnl/libnl_3.10.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.11.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')}
            file://0001-tests-cksuite-all-netns.c-disable-route_1.patch \
            "
 
-SRC_URI[sha256sum] = "49b3e2235fdb58f5910bbb3ed0de8143b71ffc220571540502eb6c2471f204f5"
+SRC_URI[sha256sum] = "2a56e1edefa3e68a7c00879496736fdbf62fc94ed3232c0baba127ecfa76874d"
 
 GITHUB_BASE_URI = "https://github.com/thom311/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/libnl(?P<pver>.+)"
-- 
2.34.1


