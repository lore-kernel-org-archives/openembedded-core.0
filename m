Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E501BC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:22:25 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.24522.1704180142680731222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="123830977"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="123830977"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:22:20 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DAACDD66C3
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:22:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C1661EFC9
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:22:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F7176BF42
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:22:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D3671A0070;
	Tue,  2 Jan 2024 15:22:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] subversion: upgrade 1.14.2 -> 1.14.3
Date: Tue,  2 Jan 2024 15:22:05 +0800
Message-Id: <1704180125-8550-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10--8.266700-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu8j0eQ+IUAHW2N
	lYzGZgQk/DW1GvHktOg/pf74XvGjqKHw0iBp2gweYPyK201ebhsqs+sOb/Dxc+jMOEZ5AL0SyPZ
	WszY8usBX0RAUDURqDwOVG9MMBQIu7QKZR2ZkvsYnmggTGPHBJ3M0J0a6ZmxJyPRAwD/3abbbjm
	vDE+6Ix+ArY2JkKW9pBdRHP6FCEZVaQiLka9EcShF4zyLyne+AbkygYp8Zf7rut6dxL6OwmJ6ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSAHAopEd76v5LtpI8G4GYjM3d9AdKRlJgBw5B9XAnBuybZZ
	6C/pGX3v8l+BRm/Btw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193211

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 - Client-side bugfixes:
    * Fix svn:mergeinfo diff parser bug when parsing forward merges (r1906502)
    * Fix redirected URL handling with file externals (r1908926, issue #4911)
 - Developer-visible changes:
    * swig-rb: Fix uses of 'File.exist?', deprecated since Ruby 2.1 (r1904472)
    * Build: Fix uses of deprecated Python APIs (r1900882, issue #4899)
    * Build: Retain ability to build SWIG Python 2 bindings (r1900890)
    * Fix reading WC lock status with svn_wc_status2_t (r1904193, issue #4908)
    * JavaHL: Add @Deprecated to silence compiler warnings (r1904936)
    * JavaHL: Fix crash in case of null message in getMessage (r1904938)
    * Fix build breakage of release tarballs by installed swig (r1878379 et al)
    * Add regression test for issue #4711 "invalid xml file" (r1877310)
    * swig-py: Fix building with SWIG 4.1.0 (r1904167)
    * Makefile.in: Fix cleaning of __pycache__ dirs and *.pyc (r1903267)
    * swig-py: Avoid deprecated options to SWIG >= 4.1.0 (r1904198, r1904287)
    * swig-py: Use sysconfig to allow building with Python 3.12 (r1910098)
    * INSTALL: Document not to use SVN with APR 1.7.3 on Windows (r1911278)
    * Fix test suite broken by syntax error when --enable-sasl (r1907124)
    * swig-py: Fix issues #4916, #4917, #4918 (r1912500 et al)
    * swig-py: Improve error when no external diff (r1912724, -743, issue #1778)
    * autogen.sh: Fix building when Python is not named "python" (r1903245)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../subversion/{subversion_1.14.2.bb => subversion_1.14.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/subversion/{subversion_1.14.2.bb => subversion_1.14.3.bb} (97%)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.2.bb b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
similarity index 97%
rename from meta/recipes-devtools/subversion/subversion_1.14.2.bb
rename to meta/recipes-devtools/subversion/subversion_1.14.3.bb
index ba208d922f..1cf4e1734b 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            "
 
-SRC_URI[sha256sum] = "c9130e8d0b75728a66f0e7038fc77052e671830d785b5616aad53b4810d3cc28"
+SRC_URI[sha256sum] = "949efd451a09435f7e8573574c71c7b71b194d844890fa49cd61d2262ea1a440"
 
 inherit autotools pkgconfig gettext python3native
 
-- 
2.34.1


