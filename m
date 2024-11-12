Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863CBD41D74
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:05 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.82406.1731403501551416094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Vgt6Zz/8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403502; x=1762939502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hsm+bJLmAoT37X2VEYoou+2Q5LnWpyH4DW9FIgEGNXI=;
  b=Vgt6Zz/8BMQVU/mtFziD8weF6wlL5rmJP5YkwUGv5Pyxg9+0z/nR2h1j
   Y0MbxQzDrIfdtkCEyNEunxZCvj/cmUrDzxNWit/dtIM24PZSIlegQCmqW
   Af8yovMjodZZ3xlP3JUAPmnzU0IO6UUcCaG9hWd3gYJcoIQIk4SfksBhI
   WWdEMHy3MaEQ7MLtlwll2ylDmuLazu84n795dWZib/LZaMwMET997C7WX
   7mS2fs4w1+27amnhTMiN32RTK52oIG6npfdN5Islabu3/X1+ZRqXfQ3iW
   ukK+5wFyF5HhHRf2JF5pgQtljoczeTOPfj2HwkF8DHf4+Rf+zzXx1ufwI
   A==;
X-CSE-ConnectionGUID: 5VjdQ0/CRqq+ItWpXM0tSw==
X-CSE-MsgGUID: pIAKY5T9RUGiHDZiEr9anA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180109545"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180109545"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:00 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C6BED29E6
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EF748E49DF
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 89B6220071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 38EAE1A000A;
	Tue, 12 Nov 2024 17:24:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/47] diffoscope: upgrade 277 -> 283
Date: Tue, 12 Nov 2024 17:23:59 +0800
Message-Id: <1731403483-21399-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--3.259600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytOed0Eey3YOZgU
	Ly4zAbFBkViIR2HQh+YN9ErsocDsQJSPcGEBUly8qoeab9Xgz88XivwflisSrPaDRR+wfEPNntU
	3Lv5Rb/3Q2jWaSvYDWPrQpUDuy6rk7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5Do+i
	g2qpmf3eLzNWBegCW2wgn7iDBesS0nRE+fI6etkm4fgatbDAO3SokInAlBqONj6dykfOaS46V8v
	NGVh7M2rzgL9VEXW8mZKq4ywY/0weU8DDlSGulIM6Pd3weCASy4xj3rIWnwe0u/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206990

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix crash when objdump is missing when checking .EFI files.
* Ignore errors when listing .ar archives.
* Update copyright years.
* Don't try and test with systemd-ukify within Debian stable.
* Add support for UKI files.
* Drop Depends on deprecated python3-pkg-resources.
* Drop removal of calculated basename from readelf output.
* Temporarily remove procyon-decompiler from Build-Depends as it was removed
  from testing
* Add a helpful contextual message to the output if comparing Debian .orig
  tarballs within .dsc files without the ability to "fuzzy-match" away the
  leading directory.
* Correctly invert "X% similar" value and do not emit "100% similar".
* Update copyright years.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_277.bb => diffoscope_283.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_277.bb => diffoscope_283.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_277.bb b/meta/recipes-support/diffoscope/diffoscope_283.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_277.bb
rename to meta/recipes-support/diffoscope/diffoscope_283.bb
index f609e607f3..27aeaaa7b6 100644
--- a/meta/recipes-support/diffoscope/diffoscope_277.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_283.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d2d4236d7b72be8344b0c7a19506350a7b17d316bcd79d7bfc113e10400b0e10"
+SRC_URI[sha256sum] = "0469ff70e1f37b5e96496f5e3c88dbafcf03fafff409a90601ed84febc31c543"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.34.1


