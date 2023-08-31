Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D1EC83F2A
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:55:13 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8786.1693450506324707030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="131431194"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="131431194"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:55:05 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 13831CD7EA
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:55:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 38137D948C
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:55:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AA9CF70BD1;
	Thu, 31 Aug 2023 11:55:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xz: upgrade 5.4.3 -> 5.4.4
Date: Thu, 31 Aug 2023 10:54:40 +0800
Message-Id: <1693450480-28679-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10-5.287600-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9cJeMOJX8c9nKB8
	tGwEqygaNP1f3JWj4BdC+c4GfWvAxmr5UzZs8CYsgvmNrsT46HIpA2ExuipmWoXsbVsdXVIhn0y
	b56lxfCtQAl8+fubV5UuPglyN6Hc1XONecyiT1jBiOR5b9sWdozeXamXCCu1YMHDHnR8cUQIhS0
	ofkAkz2SL637QCIVpi8vc3EUpCmrWIKyp7CdRkYDsKXyzHgcEbBgA+oehWZhHVtKZKT0dQ2q/WP
	/YvvE/WH1+7PhnhLrN5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSlsZUSYh+N/e2LpK78q+7ww9aMj
	4hmyDTqTZHXAyVrBH8VBBfmoUGkR5yM8bLIooLF2l7q0MYfS/5+Wnyt6K+pnwuVN3bMwvBvWx/I
	5K5PcOg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186959

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* liblzma and xzdec can now build against WASI SDK when threading
  support is disabled. xz and tests don't build yet.

* CMake:

    - Fixed a bug preventing other projects from including liblzma
      multiple times using find_package().

    - Don't create broken symlinks in Cygwin and MSYS2 unless
      supported by the environment. This prevented building for the
      default MSYS2 environment. The problem was introduced in
      xz 5.4.0.

* Documentation:

    - Small improvements to man pages.

    - Small improvements and typo fixes for liblzma API
      documentation.

* Tests:

    - Added a new section to INSTALL to describe basic test usage
      and address recent questions about building the tests when
      cross compiling.

    - Small fixes and improvements to the tests.

* Translations:

    - Fixed a mistake that caused one of the error messages to not
      be translated. This only affected versions 5.4.2 and 5.4.3.

    - Updated the Chinese (simplified), Croatian, Esperanto, German,
      Korean, Polish, Romanian, Spanish, Swedish, Ukrainian, and
      Vietnamese translations.

    - Updated the German, Korean, Romanian, and Ukrainian man page
      translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/xz/{xz_5.4.3.bb => xz_5.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.4.3.bb => xz_5.4.4.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz_5.4.3.bb b/meta/recipes-extended/xz/xz_5.4.4.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.4.3.bb
rename to meta/recipes-extended/xz/xz_5.4.4.bb
index e1cdac3014..90f4c3d82c 100644
--- a/meta/recipes-extended/xz/xz_5.4.3.bb
+++ b/meta/recipes-extended/xz/xz_5.4.4.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c8ea84ebe7b93cce676b54355dc6b2c0 \
                     "
 
 SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[sha256sum] = "1c382e0bc2e4e0af58398a903dd62fff7e510171d2de47a1ebe06d1528e9b7e9"
+SRC_URI[sha256sum] = "aae39544e254cfd27e942d35a048d592959bd7a79f9a624afb0498bb5613bdf8"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.34.1


