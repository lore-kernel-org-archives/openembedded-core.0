Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09889E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:56 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.16410.1736240511075164031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XPAu+SO1;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240512; x=1767776512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cxCVA3WVTNGE3x6VaNaCBe6uKz/TGPT02IhEr3YJp04=;
  b=XPAu+SO1u0YH29P2//ESD/PoG1gE2ZjY0YVEKzlf908E9XOp7IJ4b6k6
   gviQmSzYJHMXqNMq+6y/AquiBLWdToeIl2qsiZmpMGrNCrTAi61d9A4EG
   kI6DnL0OBQ+9br/8R8dY3qO9vNxY7qGoK88TZqFW82e/2Pu1qUe51xvZr
   nTOCR1TGK6HGPWrMT2aCy40pYlovEyJr/okNdGcjaVevTo7lML7/2rlj9
   ktrceNu8pgOWbR41FoDAdDGZRBTBci85PUqxLJNYyyiNdAHqrRVMh/eEh
   EaYAYsEIgfl0kqlFFxTRL8VDT9ZmZJhFiwPZS9NUZtrfirfTgC7oghP9L
   A==;
X-CSE-ConnectionGUID: Mcqyfy3vRGqtK/5PI/fqVw==
X-CSE-MsgGUID: pcyOU3D0QT6VcL3U7HkrHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="188263521"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="188263521"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:35 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A3377D6EA9
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 77411D3F13
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DA7A41185
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:31 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 590831A0003;
	Tue,  7 Jan 2025 17:01:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/13] xinit: upgrade 1.4.2 -> 1.4.3
Date: Tue,  7 Jan 2025 17:01:22 +0800
Message-Id: <1736240482-5243-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
References: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-0.078600-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4Bnb9+yLBIRXcH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJohCefipHQGruWCjDJRYeAZ19LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrYF0GXAUJQ2vBrs1gP8v+a2YtnXE5LvLTlfrETNVZbydHJW7r9NTvxFEw9
	b1AhLDhFe0BMbjQX84vDAWEZSIpMXTVFgD3+vtxR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209447

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xinit_1.4.2.bb => xinit_1.4.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xinit_1.4.2.bb => xinit_1.4.3.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.2.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.3.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-app/xinit_1.4.2.bb
rename to meta/recipes-graphics/xorg-app/xinit_1.4.3.bb
index 8a8367c688..519a9fc4ef 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.4.2.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.4.3.bb
@@ -16,7 +16,7 @@ SRC_URI += "file://0001-Make-manpage-multilib-identical.patch"
 
 SRC_URI_EXT = "xz"
 
-SRC_URI[sha256sum] = "b7d8dc8d22ef9f15985a10b606ee4f2aad6828befa437359934647e88d331f23"
+SRC_URI[sha256sum] = "86409f21a6a31148d2c1c17bf5f2d904eb5ef455f9dc67c49fbd0c10ab18fd5a"
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie \
                 --with-xterm=x-terminal-emulator"
-- 
2.43.0


