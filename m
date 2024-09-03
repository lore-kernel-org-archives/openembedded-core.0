Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934C0CD3430
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.18356.1725352393693012871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JXC68dzi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352394; x=1756888394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QS+pOK9CDUZ4DInI3gMMBDdV/z7bALf6aBykW99amXk=;
  b=JXC68dziXhKUqnvQFIvbPd57LByV/HPqVnHdN1CJO7V0+HeiGq8QgkOZ
   2LpMZddW3I0K5Ed6v7lTfLg8TXbpRgRj8UsEgnzE+AGP89FxraQ3Vv0pj
   pTTwgQOkPHikIRBtxinhwDjx8+aXW3ElAAd2ePtgQads0DlvziapNhHuI
   MF1fGuK7ZXyLXejlPZb49/CHtQt22yjiH7RzxtopII0yJBCSkVOwro4Nw
   wZCt6Kh9ZgM/fxeBpdPzZ72q3kQEL2d36TJmgK3nOBHK3gjKrpaxT+hH/
   yMqC9t0Y6steY/2jlo4r69P4NZhEWP8cYSsO5/2LYDKRn5LUgLFEZQDhV
   A==;
X-CSE-ConnectionGUID: fcHxhBkSRZ2gVhSluB/mQw==
X-CSE-MsgGUID: lVuTONu2R/ClKEy4hbzBWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="172503049"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="172503049"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 997C4C9444
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E4FDFD50B6
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 652486C811
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B99B1A000C;
	Tue,  3 Sep 2024 16:33:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/22] cairo: upgrade 1.18.0 -> 1.18.2
Date: Tue,  3 Sep 2024 16:32:39 +0800
Message-Id: <1725352379-20334-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10-2.781100-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrYb/nLV/lbk9UjspoiX02F6B8
	tGwEqygaRRa406V/YwyT8jPQpoV7EU27U1svd4xeMB2m5K0KuIk/NAdHV8KBvrXl40gTGJ5pLhd
	6ma7WE8uxOwwHELIRHTCrtCbmVe+exxNWXWqfwaItMfCdg6KRDUyQ5fRSh265MHDHnR8cUQLTI4
	8G/UH1dpR1R/1BwwfR5p98cjyQCaIMCLEGW7c2cOpx23gbuS55fS0Ip2eEHnwj/1Rbkzl1EwVoF
	XeDFfj15MIx11wv+CPGVuWouVipcnqPyWoDGZS9PG94s8yDqvHIlvKPX5h9wBhCc2t4hHk2kCUM
	Vdmk4O16WB2ekL1/AiRse1//Lrerhl2TLSHWgMz5FaEls7+Zn/6/2/nZkihaOgB/fz3EXdcVKT0
	eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204129

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- The malloc-stats code has been removed from the tests directory
  Cairo now requires a version of pixman equal to, or newer than, 0.40.
- There have been multiple build fixes for newer versions of GCC
  for MSVC; for Solaris; and on macOS 10.7
- PNG errors caused by loading malformed data are correctly propagated to
  callers, so they can handle the case.
- Both stroke and fill colors are now set when showing glyphs on a PDF
  surface.
- All the font options are copied when creating a fallback font object.
- When drawing text on macOS, Cairo now tries harder to select the appropriate
  font name.
- Cairo now prefers the COLRv1 table inside a font, if one is available.
- Cairo requires a C11 toolchain when building.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/cairo/{cairo_1.18.0.bb => cairo_1.18.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/cairo/{cairo_1.18.0.bb => cairo_1.18.2.bb} (97%)

diff --git a/meta/recipes-graphics/cairo/cairo_1.18.0.bb b/meta/recipes-graphics/cairo/cairo_1.18.2.bb
similarity index 97%
rename from meta/recipes-graphics/cairo/cairo_1.18.0.bb
rename to meta/recipes-graphics/cairo/cairo_1.18.2.bb
index 4c97e973d0..12aeb431d0 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.2.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
           "
 
-SRC_URI[sha256sum] = "243a0736b978a33dee29f9cca7521733b78a65b5418206fef7bd1c3d4cf10b64"
+SRC_URI[sha256sum] = "a62b9bb42425e844cc3d6ddde043ff39dbabedd1542eba57a2eb79f85889d45a"
 
 inherit meson pkgconfig upstream-version-is-even gtk-doc multilib_script
 
-- 
2.34.1


