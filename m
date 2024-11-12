Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6E1D3ABFB
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:15 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.82720.1731403501519628021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EwZdlKTj;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403506; x=1762939506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=v7Ukw0ddPDYVMIA5VjqWHDocDB4FA+sKcVb+L902/ic=;
  b=EwZdlKTjJanJsto9hN7NfwFv93avLnsEZRseIaWzwv5YuTpCJ9pRIJna
   R9fMQWSTeEjTw8Ptl0mtXJDYD2VSaKCh7TFCdlzpm/IqJiZrS9KSMZFp/
   vvy9ThxmAiwtCOfNFEMCZd/VH9I0ZyUBF3A4xulpVsAshpe+CwzrcdTQZ
   kPKWT6GqxQUiaBWss14JjYLO38wtcWtHu/u64fu2Ed5+VaKkxNuY2FsHg
   abERIZkPBgVbMWaZ3HjKf8fUQDhOnu++9qjbnTVwiNwwY0/KuAIZOpYku
   iMP6uY8yAm5K/LW6t9MQVukCoL/K0f88+5pfkzVJpyNn20/09BcEcn1Iu
   Q==;
X-CSE-ConnectionGUID: 8/pl+3DKRsOpipBeUVB73w==
X-CSE-MsgGUID: QbIzAmCJRV2uKHKTvQZQ5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="158940837"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="158940837"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:05 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D07B996745
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CCFCF31EC
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 000F720071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A096C1A000A;
	Tue, 12 Nov 2024 17:25:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/47] harfbuzz: upgrade 10.0.1 -> 10.1.0
Date: Tue, 12 Nov 2024 17:24:07 +0800
Message-Id: <1731403483-21399-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--1.682600-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvIxysiea5KSWsW
	ZV9YMDBb7l9eRmLz9vry7Kkqj/XZ0ybFpXq4ZRfVCtzGvPCy/m4IJ2rqTcuYdjoUdFbHYUawyPZ
	WszY8usAHfklSbQowAA3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXtLALfOrPJxQGhp
	EzCfQH9z+Ok6f9gUlFModguxHirQsfE8yM4pjsDwtuKBGekqUpnH7sbImOEBRIwfrYuiBlaVOl8
	bpsO81O2eFzRg9ENz4JlBgUH2hlgdaOAzm4zjUfTXOf0XDw9wTfwHLlTFLpUIaDVi5OFxDnzacl
	xIBSJvXsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206997

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix the sign of fallback vertical glyph advance (used when font has no
  vertical advance data).
- Increase maximum "CFF"operands limit 20 times to support more complex fonts.
- Add "--face-loader" option to command line utilities.
- Support "COLR"v0 table in hb_font_get_glyph_extents().
- Add support for font functions that use Core Text APIs, similar to FreeType
  font functions. This allows, for example, using drawing fonts that use the new
  (and undocumented) "hvgl"table.
- Update IANA and OT language registries, as well ase USE data files.
- Fix build with ICU 76.
- Various compiler warnings and build fixes.
- Various subsetter fixes.

- New API:
+hb_face_create_or_fail()
+hb_face_create_from_file_or_fail()
+hb_coretext_face_create_from_file_or_fail()
+hb_coretext_font_set_funcs()
+hb_ft_face_create_from_file_or_fail()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_10.0.1.bb => harfbuzz_10.1.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_10.0.1.bb => harfbuzz_10.1.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb
index 3b211251af..4425dd3e1e 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b2cb13bd351904cb9038f907dc0dee0ae07127061242fe3556b2795c4e9748fc"
+SRC_URI[sha256sum] = "6ce3520f2d089a33cef0fc48321334b8e0b72141f6a763719aaaecd2779ecb82"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.34.1


