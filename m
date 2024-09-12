Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A91DEE57F9
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 00:31:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.36437.1726101056172535684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 17:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EkyoBll6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726101057; x=1757637057;
  h=from:to:cc:subject:date:message-id;
  bh=z4SarKNsWFZD6CP/EDVNFEtenA5/QBkXgUsqoA86QpQ=;
  b=EkyoBll6aFBMi0A+6hBqdKTPqXHZ6Or991ow226z1EwwMTrDQ22Ie738
   V8KR8Vp5PcEnAqMAJilXXOrtZ+o4LXArNK3f6VeyP2CSjpSpU2nURq/pD
   mXD04s+uC/5hCOH/3yWAIUTOa0D4pQQBFPp9Svs7apY5TIj69Rr9ecVNY
   9VuF92YN1DGaFMrD5O6OoFEeug7omR8vC4tQVM/GMrW10OcP5XaakWTVe
   6OODiEJrOCvMxDMvYvQSx8id7XiOMBNgr67GQhR3jPXRNajQtEDpRCDLw
   QEzK7G/yc3/jXo5nxla6DttNWdhzlh6nHuaqHhJqMBjwdvjmk6lyZkmpg
   g==;
X-CSE-ConnectionGUID: m5kNrn8bTCOoB0EEnTxe7A==
X-CSE-MsgGUID: HRKiENVOTj6Pmyf8XYhVAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="173469059"
X-IronPort-AV: E=Sophos;i="6.10,221,1719846000"; 
   d="scan'208";a="173469059"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 09:30:45 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 20F8ED923D
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 09:30:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 57A6BBDC83
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 09:30:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A7F7224940
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 09:30:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 796201A000A;
	Thu, 12 Sep 2024 08:30:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] json-glib: upgrade 1.8.0 -> 1.10.0
Date: Thu, 12 Sep 2024 08:30:31 +0800
Message-Id: <1726101031-19770-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28658.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28658.003
X-TMASE-Result: 10--6.092100-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yaoXHZz/dXlx2+EDPw+8xrfstPr197hBU64r
	mQIDoB6Sa6ybbu2l79Frhd2nMz0QNGd4JgHCU2SWoGwJKRc7e7tar+yddvGkIMj0QMA/92m2RoX
	7/kb7DqBV7WUAexHQHMj6EQVLNK1JiHIw0ZqUA7gD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpicJeU+IJBMRtsAY4JpaTGO/ZNLVgVojn/8boZEVitthgJeMOJX8c9nJFag
	wZ//x4SZe+pKSapsq6AMuqetGVetq6be/Gn3AzX3QfwsVk0Ubv+efAnnZBiL5K13zeQcKlRr59a
	/j6VtSEWp5J0GKen8mF4xLSGUaob8wv+9V1NGC4A/V1U8t4+ChcIs6m4ttHPPLBz7jXHdvZVP4V
	og/5OhSMd08ElTAQggr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 00:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204417

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Add copyright and licensing metadata to all files
 Changed to LGPL-2.1-or-later

Changelog:
==========
- Improve conformance of the JSON parser
- Add conformance test suite from https://github.com/nst/JSONTestSuite
- Add JsonParser:strict to enable strict parsing
- Add '--strict' to json-glib-validate to enable strict parsing
- Deprecate the signals on JsonParser
- Port tools man pages from DocBook to reStructureText
- Add "documentation" configuration option, and deprecate "gtk_doc"
- Add JsonGenerator.take_root()
- Documentation improvements for JsonReader
- Raise parser error for malformed Unicode
- Build fixes and performance improvements
- Allow disabling installed tests
- Support parsing multiple root statements in non-strict mode
- Allow loading files >4GB with json-glib-validate

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../json-glib/{json-glib_1.8.0.bb => json-glib_1.10.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.8.0.bb => json-glib_1.10.0.bb} (82%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb b/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
similarity index 82%
rename from meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
index 2094ebe3e7..df3cdba3b1 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
@@ -6,8 +6,8 @@ instances to and from JSON data types."
 HOMEPAGE = "https://wiki.gnome.org/Projects/JsonGlib"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/json-glib/issues"
 
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=41890f71f740302b785c27661123bff5"
 
 DEPENDS = "glib-2.0 glib-2.0-native"
 
@@ -18,10 +18,10 @@ GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454"
+SRC_URI[archive.sha256sum] = "1bca8d66d96106ecc147df3133b95a5bb784f1fa6f15d06dd7c1a8fb4a10af7b"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
-PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native python3-docutils-native"
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


